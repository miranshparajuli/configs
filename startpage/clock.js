const clockEl     = document.getElementById('clock');
const dateEl      = document.getElementById('date');
const panel        = document.getElementById('panel');
const clockBlock  = document.getElementById('clock-block');
const searchInput = document.getElementById('search-input');
const hint        = document.getElementById('hint');
const badge        = document.getElementById('engine-badge');

const DEFAULT_ENGINE = { url: 'https://duckduckgo.com/?q=', label: null };

const MODIFIERS = {
  'rr': { url: 'https://www.reddit.com/search/?q=',            label: 'Reddit'  },
  'yy': { url: 'https://www.youtube.com/results?search_query=', label: 'Youtube' },
  '!':  { url: 'https://www.google.com/search?q=',              label: 'Google'  },
};

let open         = false;
let activeEngine = DEFAULT_ENGINE;
let seq          = '';
let seqTimer     = null;

function tick() {
  const now = new Date();
  clockEl.textContent = now.toLocaleTimeString('en-GB');
  dateEl.textContent  = now.toLocaleDateString('en-US', {
    weekday: 'long', month: 'long', day: 'numeric'
  });
}
setInterval(tick, 1000);
tick();

function setBadge(engine) {
  if (engine && engine.label) {
    badge.textContent = '<' + engine.label + '>';
    badge.classList.add('active');
  } else {
    badge.textContent = '';
    badge.classList.remove('active');
  }
}

function openPanel(engine) {
  open         = true;
  activeEngine = engine || DEFAULT_ENGINE;
  setBadge(activeEngine);
  panel.classList.add('visible');
  clockBlock.classList.add('shifted');
  hint.style.opacity = '0';
  requestAnimationFrame(() => searchInput.focus());
}

function closePanel() {
  open         = false;
  activeEngine = DEFAULT_ENGINE;
  seq          = '';
  panel.classList.remove('visible');
  clockBlock.classList.remove('shifted');
  hint.style.opacity = '0.15';
  searchInput.value  = '';
  searchInput.blur();
  setBadge(null);
}

document.addEventListener('keydown', e => {
  if (open) {
    if (e.key === 'Escape') closePanel();
    return;
  }
  if (e.key === ' ') {
    e.preventDefault();
    const engine = MODIFIERS[seq] || null;
    seq = '';
    clearTimeout(seqTimer);
    openPanel(engine);
    return;
  }
  if (e.key.length === 1) {
    seq += e.key;
    clearTimeout(seqTimer);
    seqTimer = setTimeout(() => { seq = ''; }, 1500);
  }
});

searchInput.addEventListener('input', () => {
  const v = searchInput.value;
  for (const prefix in MODIFIERS) {
    if (v === prefix + ' ') {
      activeEngine = MODIFIERS[prefix];
      setBadge(activeEngine);
      searchInput.value = '';
      break;
    }
  }
});

searchInput.addEventListener('keydown', e => {
  if (e.key === 'Backspace' && searchInput.value === '') {
    activeEngine = DEFAULT_ENGINE;
    setBadge(activeEngine);
  }
  if (e.key !== 'Enter') return;
  const q = searchInput.value.trim();
  if (!q) return;
  const isUrl = /^(https?:\/\/|www\.|[a-zA-Z0-9-]+\.[a-zA-Z]{2,})/.test(q);
  window.location.href = isUrl 
    ? (q.startsWith('http') ? q : 'https://' + q)
    : activeEngine.url + encodeURIComponent(q);
});

document.addEventListener('click', e => {
  if (open && !panel.contains(e.target)) closePanel();
});

window.onload = closePanel;

