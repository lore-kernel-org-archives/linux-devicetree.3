Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005771;
	b=CNnBysSwbKHKgOvy9Wolao1ig1khG1SVDulY0FywfLyt+7JR54XVFz5IMR1dZyv/fRQ1
	 u4axI8z21FmiFTv1DHbgsJXUEw6wY23lcaMKMPuD2Dida7XVJp6krBQEisaqRA9QjFdAP
	 wLaIdLhsaBfBl1ynvMwTZ7amIGgKb3gDc6tuL/kYGiNTVgeKqlD6vDXo3o+WBg1PS7j7T
	 p1ANUAY5j6pab4t2RL4S29QvHezm/gezJNQCa6K432mtu1ABJgZTuGJrY8btlW8T/EYgy
	 gESgWgRTw1J+ondOUI7je6NAqPvZ2MUCyt2cCoWVmLr2vhEzCcAAtrg2B5l8Mi9Jg2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005771;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZxjKuxP4xwGnLaSk1WXKp7EUu3HlmDxynOFeGJnyll8=;
	b=eH6GplBzt2vs29VpHp7QSLpmDDdm2r6rr9tfZE08KCASyM+vQhkL8AYEZMUtQrPuNndz
	 lyGbYxf0fvNTTSaSmNl6pOgxJu27C/xiNb2lRvubf1t1ugFfrVNuHFzeUmj0E/WzEzHx7
	 Taby01xkfNxDCxDYv/ZAE1uDt8W3yUqudt+NVehI/ecUGFWyIIwz9MD/M4q1poGKGzs+E
	 QkovMcseR/4bmCoWhYaoDGTQlfLmDm4S4IhhBNo9NUfLcoEM39Ntw6XscIERvj7FSMqZk
	 0gLtKqPF72qy3wFMdqM+vvlEFpvwU3tM9qY9ViozZI/MjWXek8tTfsU8lB5ysGvJRnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a4zMjTb3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792E960A2609
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a4zMjTb3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A9A1F000C5;
	Wed, 18 Nov 2026 12:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795005771;
	bh=ZxjKuxP4xwGnLaSk1WXKp7EUu3HlmDxynOFeGJnyll8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a4zMjTb3UbFLpmNfdY2PgAbfEBWeUqBXRJdhIXQjwox9Hb/G/uj+lHbu5/wmC6N3x
	 9Cgpgxyo6KI0gI3vmyW2hvXLO6MmNz+HFcatsL3NnQFOpMpCdSf3FptOXFPPRy3m+a
	 IcYtLmpd6h5LKcTFmpN5pBySdBv27Z1xglkOTtNIyEsJiXxuQviGqfHYM7TvNU0nPy
	 lV/blZYGqB39JQUfXwC5OdbYXuV3+tSfFlVcT/oWYOon6rFYCxPOEdQIBOgMQnoIAd
	 JKC+XO87cgZuxVXVWEzroJvvNFEFzJK69VS5u7Yr/N0tBp/W1URMPI0BIkcC+DYDyz
	 HBhQFwYwBQ6Rw==
Message-ID: <sashiko-outbox-220928@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v22 08/15] net: phylink: support PCS provider
 release
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117123956.11981-9-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
 <20261117123956.11981-9-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 12:42:50 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] net: phylink: broken capability recalculation in
  phylink_update_capabilities()
- [Medium] net: phylink: mishandled force_major_config with
  phylink_disable_state
- [Medium] net: phylink: race between pcs_provider_notify() and
  phylink_create()
- [Medium] net: phylink: missing hardware advertisement update in
  pcs_provider_notify()
--

commit 43bb91371f247055f063dc4ec828173d12f85adf
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: support PCS provider release

This commit adds a blocking notifier chain for fwnode PCS provider removal
and updates phylink to detach removed PCS instances, recalculate supported
interfaces and capabilities, and trigger link resolution.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 921c227a5b3c0..094a15f3dbcd0 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -2350,6 +2371,11 @@ static void phylink_update_capabilities(struct phy=
link *pl,
>  							config->interface);
>  			linkmode_copy(pl->supported, supported);
>  			linkmode_copy(pl->advertising, config->advertising);
> +		} else {
> +			/* No SFP modes remain usable with the current interfaces. */
> +			linkmode_zero(pl->supported);
> +			linkmode_zero(pl->advertising);
> +			linkmode_zero(config->advertising);
>  		}
> =20
>  		goto exit;

[Severity: Medium]
Can this else branch ever be reached when a PCS is removed, and what
happens to the non-SFP branches in phylink_update_capabilities() when
validation fails?

First, phylink_update_capabilities() passes unmasked pl->sfp_interfaces to
__phylink_validate_mask(), and in phylink_validate_mac_and_pcs() a missing
PCS in pl->pcs_list leaves pcs as NULL without returning -EINVAL:

drivers/net/phy/phylink.c:phylink_validate_mac_and_pcs() {
    ...
	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
		struct phylink_pcs *tmp;

		list_for_each_entry(tmp, &pl->pcs_list, list) {
			if (!phylink_validate_pcs_interface(tmp, state->interface)) {
				pcs =3D tmp;
				break;
			}
		}
	}

	if (pcs) {
    ...
}

Because pcs is NULL, phylink_validate_mac_and_pcs() skips PCS validation
and succeeds against the MAC capabilities alone, so
__phylink_validate_mask() still returns 0 after the PCS is removed.

Second, when validation does return -EINVAL (for example, when
state->interface is no longer in pl->supported_interfaces), none of the
other branches in phylink_update_capabilities() clear the capability masks:
the generic fallback presets pl->supported and config->advertising with
linkmode_fill(), ignores the -EINVAL return from __phylink_validate(), and
leaves all linkmode bits set in pl->supported and pl->advertising;
similarly, the pl->phydev, MLO_AN_FIXED, and MLO_AN_INBAND paths leave
stale or unvalidated linkmodes in pl->supported and pl->advertising.

> @@ -2425,6 +2451,133 @@ void phylink_update_mac_pause_capabilities(struct=
 phylink *pl, unsigned long mac
>  }
>  EXPORT_SYMBOL_GPL(phylink_update_mac_pause_capabilities);
> =20
> +static void phylink_del_pcs(struct phylink *pl, struct phylink_pcs *pcs)
> +{
> +	ASSERT_RTNL();
> +
> +	lockdep_assert_held(&pl->state_mutex);
> +
> +	rcu_assign_pointer(pcs->phylink, NULL);
> +	synchronize_rcu();
> +	list_del(&pcs->list);
> +
> +	/*
> +	 * Check if we are removing the PCS currently
> +	 * in use by this phylink instance. If this is the case,
> +	 * tear down the link, force phylink resolve to reconfigure the
> +	 * interface mode, disable the current PCS and set the
> +	 * phylink PCS to NULL.
> +	 */
> +	if (pl->pcs =3D=3D pcs) {
> +		if (pl->old_link_state) {
> +			phylink_link_down(pl);
> +			pl->old_link_state =3D false;
> +		}
> +		if (pl->cfg_link_an_mode =3D=3D MLO_AN_INBAND)
> +			timer_delete_sync(&pl->link_poll);
> +
> +		if (pl->pcs_state !=3D PCS_STATE_DOWN)
> +			phylink_pcs_disable(pl->pcs);
> +
> +		if (!pl->phylink_disable_state)
> +			pl->force_major_config =3D true;
> +
> +		WRITE_ONCE(pl->pcs, NULL);
> +	}
> +}

[Severity: Medium]
Does setting pl->force_major_config based on !pl->phylink_disable_state
interact safely with phylink_stop() and PHYLINK_DISABLE_LINK?

If pl->phylink_disable_state is 0 when phylink_del_pcs() sets
pl->force_major_config =3D true, and phylink_stop() runs after
pcs_provider_notify() drops rtnl_lock() but before pl->resolve executes,
phylink_stop() calls timer_delete_sync(&pl->link_poll) and then flushes
pl->resolve via phylink_run_resolve_and_disable().  In phylink_resolve(),
pl->force_major_config triggers phylink_major_config() even when
pl->phylink_disable_state is non-zero, reconfiguring stopped hardware and
potentially re-arming pl->link_poll via phylink_pcs_poll_start() after
phylink_stop() already deleted it.

Conversely, if the active PCS is removed while the instance is started
(pl->pcs_state =3D=3D PCS_STATE_STARTED) but PHYLINK_DISABLE_LINK is set (s=
uch
as when SFP LOS is asserted), !pl->phylink_disable_state is false, so
pl->pcs is set to NULL without setting pl->force_major_config.  When
PHYLINK_DISABLE_LINK is later cleared on the same interface,
phylink_resolve() skips phylink_major_config() and calls phylink_link_up()
with pl->pcs =3D=3D NULL.

> +
> +static int pcs_provider_notify(struct notifier_block *self,
> +			       unsigned long val, void *data)
> +{
> +	struct phylink *pl =3D container_of(self, struct phylink, fwnode_pcs_nb=
);
> +	struct fwnode_pcs_provider *pp =3D data;
> +	struct phylink_pcs *pcs, *tmp;
> +	struct phy_device *phydev;
> +	bool resolve =3D false;
> +
> +	rtnl_lock();
> +	mutex_lock(&pl->phydev_mutex);
> +	phydev =3D pl->phydev;
> +	if (phydev)
> +		mutex_lock(&phydev->lock);
> +	mutex_lock(&pl->state_mutex);
> +
> +	/* phylink instance is being destroyed, ignore any event */
> +	if (pl->pcs_state =3D=3D PCS_STATE_DETACHING)
> +		goto exit;
> +
> +	/*
> +	 * Loop all the PCS for phylink instance and check if
> +	 * this notification is relevant for some of them.
> +	 */
> +	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
> +		if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
> +			continue;
> +
> +		phylink_del_pcs(pl, pcs);
> +		resolve =3D true;
> +	}
> +
> +	/* Exit early if nothing has changed */
> +	if (!resolve)
> +		goto exit;
> +
> +	/* Refresh supported interfaces */
> +	phy_interface_copy(pl->supported_interfaces,
> +			   pl->config->supported_interfaces);
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		phy_interface_or(pl->supported_interfaces,
> +				 pl->supported_interfaces,
> +				 pcs->supported_interfaces);
> +
> +	/* Recalculate capabilities */
> +	phylink_update_capabilities(pl, &pl->link_config);
> +
> +exit:
> +	mutex_unlock(&pl->state_mutex);
> +	if (phydev)
> +		mutex_unlock(&phydev->lock);
> +	mutex_unlock(&pl->phydev_mutex);
> +	rtnl_unlock();
> +
> +	if (resolve)
> +		phylink_run_resolve(pl);
> +
> +	return resolve ? NOTIFY_OK : NOTIFY_DONE;
> +}

[Severity: Medium]
When phylink_update_capabilities() restricts phydev->advertising or
pl->link_config.advertising after a PCS is removed, what updates the
hardware advertisement?

phylink_phy_update_capabilities() copies the restricted mask into
phy->advertising in memory, but once the PHY state machine has moved past
PHY_UP to PHY_NOLINK or PHY_RUNNING, phylib will not reprogram the PHY
autonegotiation registers unless _phy_start_aneg() is called.  Similarly,
if an unused PCS is removed in in-band mode without setting
pl->force_major_config, phylink_resolve() does not call
phylink_change_inband_advert().  An attached PHY can then continue
advertising and negotiating link modes that require the removed PCS,
causing phylink_major_config() to fail when the link comes up.

[ ... ]

> @@ -2515,10 +2668,18 @@ struct phylink *phylink_create(struct phylink_con=
fig *config,
>  	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
>  	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
> =20
> +	/* First register notifier for hotplug PCS events */
> +	if (!phy_interface_empty(config->pcs_interfaces)) {
> +		pl->fwnode_pcs_nb.notifier_call =3D pcs_provider_notify;
> +		register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
> +	}
> +
>  	/* Fill the PCS list with available PCS from phylink config */
>  	ret =3D phylink_fill_available_pcs(pl, config);
>  	if (ret < 0)
> -		goto free_pl;
> +		goto unregister_pcs_notify;
> +
> +	mutex_lock(&pl->state_mutex);
> =20
>  	/* Link available PCS to phylink */
>  	list_for_each_entry(pcs, &pl->pcs_list, list)
> @@ -2533,13 +2694,13 @@ struct phylink *phylink_create(struct phylink_con=
fig *config,
>  				 pl->supported_interfaces,
>  				 pcs->supported_interfaces);
> =20
> -	mutex_lock(&pl->state_mutex);
>  	phylink_update_capabilities(pl, &pl->link_config);
> +
>  	mutex_unlock(&pl->state_mutex);
> =20
>  	ret =3D phylink_parse_mode(pl, fwnode);
>  	if (ret < 0)
> -		goto unlink_pcs_list;
> +		goto unregister_pcs_notify;

[Severity: Medium]
Can pcs_provider_notify() race with phylink_create() before pl
initialization is finished?

phylink_create() is called without rtnl_lock() held and registers
pl->fwnode_pcs_nb before pl->pcs_list, pl->supported_interfaces,
pl->cfg_link_an_mode, and pl->link_config are initialized, dropping
pl->state_mutex between steps:

CPU0                                  CPU1
phylink_create()
  register_fwnode_pcs_notifier()
  phylink_fill_available_pcs()
    mutex_lock(&pl->state_mutex)
    ...
    mutex_unlock(&pl->state_mutex)
  mutex_lock(&pl->state_mutex)
  ...
  mutex_unlock(&pl->state_mutex)
  phylink_parse_mode()
    pl->cfg_link_an_mode =3D ...
                                      fwnode_pcs_del_provider()
                                        pcs_provider_notify()
                                          mutex_lock(&pl->state_mutex)
                                          phylink_update_capabilities()
  phylink_parse_fixedlink()
    pl->link_config.speed =3D ...
    __set_bit(..., lp_advertising)        <-- concurrent access to link_con=
fig

If pcs_provider_notify() runs after phylink_fill_available_pcs() unlocks
pl->state_mutex, it can also observe entries in pl->pcs_list before their
pcs->phylink pointer or pl->supported_interfaces is initialized.
Registering the notifier after pl is initialized (or keeping initialization
under pl->state_mutex before publishing the notifier) would avoid these
races.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117123956.1198=
1-1-ansuelsmth@gmail.com?part=3D8
