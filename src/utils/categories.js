export const CATEGORIES = [
  { slug: 'production-factory', name: 'Production Factory', icon: '🏭' },
  { slug: 'automation-engine',  name: 'Automation Engine',  icon: '🤖' },
  { slug: 'hq',                 name: 'HQ',                 icon: '🏢' },
  { slug: 'people-network',     name: 'People & Network',   icon: '🧭' },
  { slug: 'ip-strategy',        name: 'IP Strategy',        icon: '🧾' },
  { slug: 'holy-quantum',       name: 'Holy Quantum',       icon: '🔯' },
];

export function getCategoryTitle(slug) {
  const category = CATEGORIES.find((cat) => cat.slug === slug);
  return category?.name || slug;
}
