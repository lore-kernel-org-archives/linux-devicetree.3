Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005772;
	b=AJt7XBw7CSshDS7gAA1vekMYfyXSUFxeW1JaiF0tgoAdxkKxRf7ZunJnzNWCF4XerIpU
	 Fq64hwJtc/9e8sgVG0+HU6S7jHiR5ihoS1eByfHe9WLODWEsTRC8hWA0d1QflM3/yoXtm
	 O+xwE6Fql2UPdOFnHA6ibG8Ga9k4nunvC0NQKsqW7cvRj2K3LbKf1vXzJSLJiQoXx+wBy
	 1iEVvO0uYYSUVG7zBJ3/fcD87qlCgW2hXl6fEMra0L3kd65OoOeyV+f564dc+IqLyMwap
	 6KGvP/brtVVlC4r2ZK/K/oGuD5ieTsUEmFAjdtt0xv459YQXD3IPUUjnMpdWfHUBQNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005772;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hUFzebIGxgCE8AUoV1cM1JeiWcDiyfb1Fv4fG/tGfyU=;
	b=36GG/vbt+IlHxXMO70lrCdkEt+xpmewLFM8IsqyNvYqPWtCTO043WYV/ft1JpYYJbdJO
	 qAlZvJ2fpQn2K47ZRCwWSjWxyJBuA7hNYkkBj8eZAJPxsCCCJHAceQlSj6qZC0dHi9mhe
	 WdRtRfkzCrlOHtB+SVZeIM8IlvHenmHvTe63ifS4iP/r2zc4x0qvgGMWlf8CuDffNqPTN
	 Q9UB9GuJ0u84C0VX+r7boMXdov2SD1lWGi8YjsXLv5i5YUdv3xFqgFWts2jMouBiriUZP
	 pjtZmd7WUICn33kVEEfUTZo2QZKDCMw0hD2bcO72A91kjqWJsRVcjLS6QOL5WxBldWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iebXyfHD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CB960A2601
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iebXyfHD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25A01F000C5;
	Wed, 18 Nov 2026 12:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795005771;
	bh=hUFzebIGxgCE8AUoV1cM1JeiWcDiyfb1Fv4fG/tGfyU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iebXyfHDKKavg5c0riHIxUAgP4cxNswJbBDBlUndxBIlUhb/XutAetY7oXEG54cpb
	 airBZYJXuJAY9tHRYUVxII1G3ayzyovJqIC3c90CNyPXftKVYbx3nrasOg97W/u6OS
	 RXyev8c1rE1pP3wu98sD3C8/GS4D/J7s8QPo7RRg++09K5ADGZhVZVmsyAQWH+w+cF
	 +mTLjfzZwkSrK0R6CzLLC0bikSZv64sGf2vs16XKLziJ0LlYA0Z2Kfhz0RhowZX3rE
	 RkOsRuo5l85VOceRoo+9tz0vK0erw0nvJANqkWzImufJqp48d8jykEXAlik926SDiO
	 qCDJn2w1wc75A==
Message-ID: <sashiko-outbox-220929@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v22 09/15] net: phylink: support late PCS
 provider attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117123956.11981-10-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
 <20261117123956.11981-10-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 12:42:51 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [High] net: phylink: pcs_provider_notify() misses PCS reconfig on late
  attach
- [High] net: phylink: unreachable SFP revalidation in
  phylink_update_capabilities()
- [High] net: phylink: broken supported_interfaces refresh in
  pcs_provider_notify()
- [Medium] net: phylink: phylink_resolve() passes wrong state to
  phylink_major_config()
- [Medium] net: phylink: missing SFP interface selection in
  phylink_update_capabilities()
- [Medium] net: phylink: missing PHY aneg reconfig in
  pcs_provider_notify()
- [Low] net: phylink: unlocked mode and fixed-link parse in
  phylink_create()
--

commit df5385a2562b3f337c319241b34f5895e1000a4c
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: support late PCS provider attach

This commit adds FWNODE_PCS_PROVIDER_ADD notifier handling and SFP
interface tracking so phylink can attach PCS providers registered after
phylink_create() and revalidate capabilities.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 094a15f3dbcd0..8768d8220a134 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -2358,11 +2383,24 @@ static void phylink_update_capabilities(struct ph=
ylink *pl,
>  		goto exit;
>  	}
> =20
> -	/* Revalidate the SFP module modes against every available interface. */
> +	/* Revalidate SFP modes against interfaces currently supported by the
> +	 * MAC and PCS. Keep the module's interface list intact so a later PCS
> +	 * addition can make an interface usable again.
> +	 */
>  	if (pl->sfp_bus && !pl->phydev && config->interface &&
> -	    !phy_interface_empty(pl->sfp_interfaces)) {
> +	    !phy_interface_empty(pl->sfp_module_interfaces)) {

[Severity: High]
Is this SFP revalidation block reachable on standard SFP ports configured
with managed =3D "in-band-status" or default_an_inband?

Just above this hunk, phylink_update_capabilities() checks
pl->cfg_link_an_mode =3D=3D MLO_AN_INBAND and jumps to exit:

drivers/net/phy/phylink.c:phylink_update_capabilities() {
    ...
	if (pl->cfg_link_an_mode =3D=3D MLO_AN_INBAND) {
		phylink_parse_inband_capabilities(pl, config);
		goto exit;
	}
    ...
}

When an SFP module is inserted on an in-band port, pl->cfg_link_an_mode
remains MLO_AN_INBAND.  As a result, pcs_provider_notify() runs
phylink_parse_inband_capabilities() instead of this SFP block, leaving
pl->sfp_interfaces stale and overwriting pl->supported and
pl->advertising with generic in-band MII link modes instead of filtering
against pl->sfp_module_interfaces and pl->sfp_support.

>  		__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
> =20
> +		phy_interface_and(pl->sfp_interfaces,
> +				  pl->sfp_module_interfaces,
> +				  pl->supported_interfaces);
> +		if (phy_interface_empty(pl->sfp_interfaces)) {
> +			linkmode_zero(pl->supported);
> +			linkmode_zero(pl->advertising);
> +			linkmode_zero(config->advertising);
> +			goto exit;
> +		}
> +
>  		linkmode_copy(supported, pl->sfp_support);
>  		linkmode_copy(config->advertising, pl->sfp_support);
>  		if (!__phylink_validate_mask(pl, NULL, supported, config,

[Severity: Medium]
When pl->sfp_interfaces changes here, does phylink_update_capabilities()
also need to re-select config->interface via phylink_choose_sfp_interface()
and restrict config->advertising to that single interface with
__phylink_validate()?

Without re-selecting config->interface and validating against it (as
phylink_sfp_config_optical() does), __phylink_validate_mask() leaves link
modes from all interfaces in pl->sfp_interfaces advertised in
pl->advertising, and if a PCS removal drops the active config->interface
while another interface in pl->sfp_interfaces remains usable,
config->interface stays set to the removed mode.

In addition, if an optical SFP module is inserted before its PCS provider
probes and pl->supported_interfaces has no overlap with
pl->sfp_module_interfaces yet, phylink_sfp_config_optical() returns
-EINVAL before setting pl->link_config.interface (putting the SFP state
machine into SFP_MOD_ERROR with config->interface =3D=3D PHY_INTERFACE_MODE=
_NA),
so this config->interface check will skip the SFP module when the PCS
provider later attaches.

> @@ -2494,6 +2532,7 @@ static int pcs_provider_notify(struct notifier_bloc=
k *self,
>  	struct phylink_pcs *pcs, *tmp;
>  	struct phy_device *phydev;
>  	bool resolve =3D false;
> +	int count, i;
> =20
>  	rtnl_lock();
>  	mutex_lock(&pl->phydev_mutex);
> @@ -2506,16 +2545,44 @@ static int pcs_provider_notify(struct notifier_bl=
ock *self,
>  	if (pl->pcs_state =3D=3D PCS_STATE_DETACHING)
>  		goto exit;
> =20
> -	/*
> -	 * Loop all the PCS for phylink instance and check if
> -	 * this notification is relevant for some of them.
> -	 */
> -	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
> -		if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
> -			continue;
> +	switch (val) {
> +	case FWNODE_PCS_PROVIDER_ADD:
> +		count =3D fwnode_phylink_pcs_count(pl->fwnode);
> +		for (i =3D 0; i < count; i++) {
> +			pcs =3D fwnode_pcs_get_from_provider(pp, pl->fwnode, i);
> +			if (IS_ERR_OR_NULL(pcs))
> +				continue;
> +
> +			/* Trigger a resolve only if a PCS is actually added */
> +			if (phylink_add_pcs(pl, pcs))
> +				resolve =3D true;
> +		}
> +
> +		/*
> +		 * Force an interface reconfig if major config failed.
> +		 * Configure link_failed to retrigger a resolve a
> +		 * second time to reevaluate AN mode with the new
> +		 * PCS if selected.
> +		 */
> +		if (resolve && pl->major_config_failed) {
> +			pl->force_major_config =3D true;
> +			pl->link_failed =3D true;
> +		}

[Severity: High]
Can gating pl->force_major_config and pl->link_failed solely on
pl->major_config_failed miss reattaching the PCS after a provider removal
and re-addition?

When an active PCS is removed, phylink_del_pcs() sets pl->pcs =3D NULL, but
pl->major_config_failed is only set later when the asynchronous
pl->resolve work item runs phylink_major_config().  If
pl->phylink_disable_state is non-zero when FWNODE_PCS_PROVIDER_DEL fires
(for example, PHYLINK_DISABLE_LINK on an SFP cage with no signal),
phylink_del_pcs() does not set pl->force_major_config and
phylink_run_resolve() does not run pl->resolve, so pl->major_config_failed
remains false; when the PCS provider is re-added and optical signal later
returns, phylink_resolve() never runs phylink_major_config() and pl->pcs
stays NULL.  Likewise, if FWNODE_PCS_PROVIDER_ADD runs before the queued
pl->resolve work from FWNODE_PCS_PROVIDER_DEL has executed,
pl->major_config_failed is still false, so pl->link_failed is not set and
phylink_resolve() does not retrigger a second pass after attaching
pl->pcs in phylink_major_config().

[Severity: Medium]
When pl->major_config_failed is true in MLO_AN_PHY or MLO_AN_FIXED mode,
does setting both pl->force_major_config =3D true and pl->link_failed =3D t=
rue
cause phylink_resolve() to run phylink_major_config() with the wrong
link_state?

In phylink_resolve(), the pl->link_failed branch runs before the
MLO_AN_FIXED and MLO_AN_PHY branches and copies link_state from
pl->link_config:

drivers/net/phy/phylink.c:phylink_resolve() {
    ...
	} else if (pl->link_failed) {
		link_state =3D pl->link_config;
		link_state.link =3D false;
		retrigger =3D true;
	} else if (pl->act_link_an_mode =3D=3D MLO_AN_FIXED) {
		phylink_get_fixed_state(pl, &link_state);
		mac_config =3D link_state.link;
	} else if (pl->act_link_an_mode =3D=3D MLO_AN_PHY) {
		link_state =3D pl->phy_state;
		mac_config =3D link_state.link;
	}
    ...
	if ((mac_config && link_state.interface !=3D pl->link_config.interface) ||
	    pl->force_major_config) {
		...
		phylink_major_config(pl, false, &link_state);
		pl->link_config.interface =3D link_state.interface;
		pl->force_major_config =3D false;
	}
    ...
}

In MLO_AN_PHY mode, the PHY's rate_matching, pause, and current interface
live in pl->phy_state, whereas pl->link_config has rate_matching =3D
RATE_MATCH_NONE.  Because the first resolve pass consumes
pl->force_major_config while link_state holds pl->link_config, the
retriggered second pass will not re-run phylink_major_config() if the
interface matches or the PHY link is still down.

> +
> +		break;
> +	case FWNODE_PCS_PROVIDER_DEL:
> +		/*
> +		 * Loop all the PCS for phylink instance and check if
> +		 * this notification is relevant for some of them.
> +		 */
> +		list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
> +			if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
> +				continue;
> =20
> -		phylink_del_pcs(pl, pcs);
> -		resolve =3D true;
> +			phylink_del_pcs(pl, pcs);
> +			resolve =3D true;
> +		}
> +		break;
>  	}
> =20
>  	/* Exit early if nothing has changed */

[Severity: High]
right below this hunk, pcs_provider_notify() refreshes
pl->supported_interfaces and revalidates capabilities:

drivers/net/phy/phylink.c:pcs_provider_notify() {
    ...
	/* Refresh supported interfaces */
	phy_interface_copy(pl->supported_interfaces,
			   pl->config->supported_interfaces);
	list_for_each_entry(pcs, &pl->pcs_list, list)
		phy_interface_or(pl->supported_interfaces,
				 pl->supported_interfaces,
				 pcs->supported_interfaces);

	/* Recalculate capabilities */
	phylink_update_capabilities(pl, &pl->link_config);
    ...
}

How is pl->supported_interfaces expected to change when a PCS is added or
removed if pl->config->supported_interfaces is copied unconditionally
without stripping unavailable pl->config->pcs_interfaces?

When a MAC driver includes PCS-backed modes in
config->supported_interfaces (which phylink_create() requires to be
non-empty even when all MAC modes need a PCS, as in airoha_setup_phylink()
and Documentation/networking/pcs.rst), pl->supported_interfaces retains
every mode in config->supported_interfaces even when pl->pcs_list is
empty, and phylink_validate_mac_and_pcs() does not fail when no matching
PCS is present in pl->pcs_list.  Conversely, if a MAC driver omits
config->pcs_interfaces from config->supported_interfaces until a PCS
attaches, phylink_parse_mode() in phylink_create() and
phylink_bringup_phy() fail validation with -EINVAL whenever the PCS
provider probes late.

[Severity: Medium]
Also in pcs_provider_notify(), when pl->phydev is attached,
phylink_update_capabilities() -> phylink_phy_update_capabilities() updates
phy->advertising in memory, but nothing calls _phy_start_aneg() or
phy_config_aneg().  Won't the PHY hardware keep advertising the stale link
modes after a PCS provider is added or removed?

> @@ -2681,10 +2748,6 @@ struct phylink *phylink_create(struct phylink_conf=
ig *config,
> =20
>  	mutex_lock(&pl->state_mutex);
> =20
> -	/* Link available PCS to phylink */
> -	list_for_each_entry(pcs, &pl->pcs_list, list)
> -		rcu_assign_pointer(pcs->phylink, pl);
> -
>  	phy_interface_copy(pl->supported_interfaces,
>  			   pl->config->supported_interfaces);

[Severity: Low]
In phylink_create(), register_fwnode_pcs_notifier() is called before
pl->state_mutex is released and before phylink_parse_mode() and
phylink_parse_fixedlink() run unlocked:

drivers/net/phy/phylink.c:phylink_create() {
    ...
	phylink_update_capabilities(pl, &pl->link_config);

	mutex_unlock(&pl->state_mutex);

	ret =3D phylink_parse_mode(pl, fwnode);
	if (ret < 0)
		goto unregister_pcs_notify;

	if (pl->cfg_link_an_mode =3D=3D MLO_AN_FIXED) {
		ret =3D phylink_parse_fixedlink(pl, fwnode);
    ...
}

With FWNODE_PCS_PROVIDER_ADD now firing pcs_provider_notify() when a PCS
provider registers on another CPU, can pcs_provider_notify() race with
phylink_parse_mode() and phylink_parse_fixedlink()?

CPU0                                    CPU1
phylink_create()
  register_fwnode_pcs_notifier()
  ...
  phylink_parse_mode()
    pl->cfg_link_an_mode =3D MLO_AN_FIXED;
  phylink_parse_fixedlink()
    pl->link_config.duplex =3D DUPLEX_HALF;
                                        fwnode_pcs_add_provider()
                                          pcs_provider_notify()
                                            mutex_lock(&pl->state_mutex);
                                            phylink_update_capabilities()
                                              phylink_parse_fixedlink_capab=
ilities()
                                                /* reads DUPLEX_HALF and
                                                 * modifies lp_advertising =
*/
    if (full-duplex)
      pl->link_config.duplex =3D DUPLEX_FULL;
    __set_bit(..., lp_advertising);  <-- data race

Holding pl->state_mutex across phylink_parse_mode() and
phylink_parse_fixedlink(), or registering the notifier after initial
parsing completes, would avoid this race.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117123956.1198=
1-1-ansuelsmth@gmail.com?part=3D9
