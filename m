Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005770;
	b=KLJFHIdz7Oyz+zQH/2BhrzGCn4thlvaJl2YyZywUuLv7jUjgs6CAavGo8Ub+tzImZu7O
	 WkXbAW939mEsFiVKS8GLUvWi/Pb7BlexgHz9zbV1FTkWRMKbWQVE7Q+t5JJazpFqc2zVu
	 O1iE02bgUBy7GmIqQ84laavXSx5tLuFiwZTS13QE6GytqdWbGeg+CbHPyWZCb2gzxEbzt
	 oOkCZ+OHztkPD7lTkdFO+CrmvaaCDCkpB5ZcD1Lr7Yjyf3Pbj6y41kj2bEvGdjkZKzSq4
	 j9c4S9ddE0K/IJNOTdONx8fExd7QD7cmsH2vv801tm0KNPttFLttXTNOc3HD08txldw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005770;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qjcz/j4h728ELB7JMfikFRuVvFl5e93EulpUG5j7+w0=;
	b=ZfNg/VdUgp9Aa4vrdDnF5AaHHFlHLDhTesi767HAsYa3V9RMPp08O0E0vhvOQFB2DyOY
	 3GqJK+9VjycxqCn6wb8IgLm7AozUtD64YpTumIyuabqelzfnd0g4QOhn0yec4zIeRmWAa
	 7J6aMAIXWdYZ5XH+xKL9dmc5Xb0ku0BisrUtH9PB53Kj4vtQ7iyU8imDJl5Gl8MIUvf4q
	 N3g0AE4/3HejKD/1MOlszslKk4MrIPCkhxXhXl/yDLAwOCYe2NmMNOcbG5nS8/RKNjgGB
	 jVt6NNdWMWpcfbRpxvwdBi6lBRFO+xXpnthNYk+13B6Jv4HxUd0XwWRWqbi4V3LHV+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gn4mB7w2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9276A60A260C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gn4mB7w2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5C81F000C4;
	Wed, 18 Nov 2026 12:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795005770;
	bh=qjcz/j4h728ELB7JMfikFRuVvFl5e93EulpUG5j7+w0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gn4mB7w2Lojnd0FEkwEuWBD3wjM6teo6p9SL7qrjhoeWMuq0wXkiKhxylMfh0O1D4
	 0fjEP0KyRaq4vZUveSpS/DsB+fcwXWiH/12n58142iI5ak7CSoU5uGQ1K2ZoqBDR3R
	 lkm3/628YYfTygK/cxt/NF6NkJqPn5Mcy1q5Bt49HDgjhqRyC3kNx68sGNyn8a4jX9
	 FDr01Cf/lPDjKmAKjPAIzJSHXvw9p49G1y1AlJKZLX8JYFJTjC6jvdwyeGzdHesYnf
	 8Gp+URGA0094smq+CcF1ngqtyAPFFzch9tbdEhZfA2lcQ1mRDuix0BK+X86/6mKgA2
	 1PafrM8x5mmcw==
Message-ID: <sashiko-outbox-220927@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v22 07/15] net: phylink: add capabilities
 helpers and track modified advertising
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117123956.11981-8-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
 <20261117123956.11981-8-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 12:42:49 +0000
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
- [High] net: phylink: in-band check bypasses SFP in
  phylink_update_capabilities()
- [High] net: phylink: broken pause update in
  phylink_update_mac_pause_capabilities()
- [High] net: phylink: unchecked validation failure in
  phylink_update_capabilities()
- [Medium] net: phylink: stale Autoneg bit saved in
  phylink_ethtool_ksettings_set()
- [Medium] net: phylink: untracked advertising in
  phylink_update_pause_state()
- [Medium] net: phylink: broken multi-interface SFP tracking in
  pl->advertising
- [Medium] net: phylink: phylink_choose_sfp_interface() fails on
  disabled modes
--

commit 8b66b984e920c4acb0054fea1ab1a279ce12371a
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: add capabilities helpers and track modified advertising

This commit adds helpers to recalculate phylink capabilities and tracks
full and user-disabled advertising masks across fixed-link, in-band, PHY,
and SFP modes in preparation for dynamic PCS attach and release.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 88280866c19a2..921c227a5b3c0 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -2087,6 +2198,8 @@ static void phylink_update_pause_state(struct phyli=
nk *pl, int pause_state)
>  	 */
>  	linkmode_set_pause(config->advertising, tx_pause,
>  			   rx_pause);
> +	if (pl->phydev)
> +		linkmode_set_pause(pl->phy_advertising, tx_pause, rx_pause);
> =20
>  	manual_changed =3D (config->pause ^ pause_state) & MLO_PAUSE_AN ||
>  			 (!(pause_state & MLO_PAUSE_AN) &&

[Severity: Medium]
When pl->phydev is NULL, does phylink_update_pause_state() leave
pl->user_disabled_advertising and pl->advertising unupdated?

On in-band or optical SFP links, pause changes made via ethtool -A only
update config->advertising here. Any later call to
phylink_update_capabilities() or phylink_sfp_set_config() recalculates
config->advertising from pl->advertising and
pl->user_disabled_advertising, overwriting the user's pause settings.
Similarly, phylink_set_fixed_link() updates pl->link_config.advertising
without updating pl->advertising.

> @@ -2120,6 +2233,142 @@ static void phylink_update_pause_state(struct phy=
link *pl, int pause_state)
>  	}
>  }
> =20
> +static void phylink_update_user_disabled_advertising(struct phylink *pl,
> +						     const unsigned long *advertising)
> +{
> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(disabled);
> +
> +	/* Preserve restrictions for modes absent from the current full mask. */
> +	linkmode_andnot(disabled, pl->user_disabled_advertising,
> +			pl->advertising);
> +
> +	/* Update restrictions for modes in the current full advertisement. */
> +	linkmode_andnot(pl->user_disabled_advertising, pl->advertising,
> +			advertising);
> +
> +	/* Combine the updated restrictions with those preserved above. */
> +	linkmode_or(pl->user_disabled_advertising,
> +		    pl->user_disabled_advertising, disabled);
> +}

[Severity: Medium]
Can modes outside pl->advertising ever be re-enabled once added to
pl->user_disabled_advertising?

In phylink_sfp_config_optical(), phylink_validate() narrows
config.advertising to the single selected interface before
phylink_sfp_set_config() copies it into pl->advertising, and
phylink_ethtool_ksettings_set() never updates pl->advertising when
switching SFP interfaces. Because disabled here is not masked with
~advertising, any mode not in the current interface's pl->advertising
remains permanently stuck in pl->user_disabled_advertising even when
explicitly requested in advertising, and switching SFP interfaces via
ethtool marks the previous interface's modes as disabled.

[ ... ]

> +static void phylink_update_capabilities(struct phylink *pl,
> +					struct phylink_link_state *config)
> +{
> +	if (pl->phydev) {
> +		lockdep_assert_held(&pl->phydev_mutex);
> +		lockdep_assert_held(&pl->phydev->lock);
> +	}
> +	lockdep_assert_held(&pl->state_mutex);
> +
> +	if (pl->phydev) {
> +		phylink_phy_update_capabilities(pl, pl->phydev,
> +						pl->phy_state.interface);
> +		return;
> +	}
> +
> +	if (pl->cfg_link_an_mode =3D=3D MLO_AN_FIXED) {
> +		phylink_parse_fixedlink_capabilities(pl, config);
> +		goto exit;
> +	}
> +
> +	if (pl->cfg_link_an_mode =3D=3D MLO_AN_INBAND) {
> +		phylink_parse_inband_capabilities(pl, config);
> +		goto exit;
> +	}
> +
> +	/* Revalidate the SFP module modes against every available interface. */
> +	if (pl->sfp_bus && !pl->phydev && config->interface &&
> +	    !phy_interface_empty(pl->sfp_interfaces)) {
> +		__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
> +
> +		linkmode_copy(supported, pl->sfp_support);
> +		linkmode_copy(config->advertising, pl->sfp_support);
> +		if (!__phylink_validate_mask(pl, NULL, supported, config,
> +					     pl->sfp_interfaces)) {
> +			phylink_sfp_update_capabilities(pl, supported, config,
> +							config->interface);
> +			linkmode_copy(pl->supported, supported);
> +			linkmode_copy(pl->advertising, config->advertising);
> +		}
> +
> +		goto exit;
> +	}

[Severity: High]
Does checking pl->cfg_link_an_mode =3D=3D MLO_AN_INBAND before pl->sfp_bus
bypass SFP capability recalculation on in-band SFP ports?

Direct MAC-to-SFP links specify managed =3D "in-band-status" in DT (or set
config->default_an_inband =3D true), so pl->cfg_link_an_mode is
MLO_AN_INBAND. Calling phylink_update_capabilities() (for example from
phylink_update_mac_pause_capabilities()) runs
phylink_parse_inband_capabilities() and jumps to exit, overwriting the SFP
module's pl->supported and advertising masks with generic MII capabilities
(and failing with -EINVAL on 100BASE-X SFP modules). In addition, when the
SFP block is reached, it validates config->advertising across all
pl->sfp_interfaces via __phylink_validate_mask() without restricting
config->advertising to the active config->interface as
phylink_sfp_config_optical() does.

> +
> +	/* No media is attached yet. Recalculate the generic capabilities. */
> +	linkmode_fill(pl->supported);
> +	linkmode_copy(config->advertising, pl->supported);
> +	__phylink_validate(pl, pl->supported, config);
> +
> +	/* Save the newly calculated full advertisement */
> +	linkmode_copy(pl->advertising, config->advertising);
> +
> +exit:
> +	/* Keep user-disabled modes out of the active advertisement. */
> +	linkmode_andnot(config->advertising,
> +			pl->advertising, pl->user_disabled_advertising);
> +}

[Severity: High]
What happens to pl->supported, pl->advertising, and config->advertising
when __phylink_validate() fails because config->interface is not in
pl->supported_interfaces?

Before a late-attached PCS is registered in phylink_create() (or after a
PCS is removed), __phylink_validate() returns -EINVAL immediately on the
!test_bit(state->interface, interfaces) check without modifying
pl->supported or config->advertising. Because the return value is ignored
here after linkmode_fill(pl->supported), all three masks remain filled
with all ones. Similarly, on validation failure,
phylink_phy_update_capabilities() returns early leaving stale capabilities
from a removed PCS in pl->supported and phy->advertising,
phylink_parse_inband_capabilities() leaves pl->supported unvalidated and
causes phylink_parse_mode() to fail phylink_create() when an in-band link
uses a late-attached PCS, and phylink_parse_fixedlink_capabilities()
ignores the __phylink_validate() failure.

> @@ -2146,20 +2396,16 @@ void phylink_update_mac_pause_capabilities(struct=
 phylink *pl, unsigned long mac
>  	if (old_pause =3D=3D mac_pause)
>  		return;
> =20
> +	mutex_lock(&pl->phydev_mutex);
> +	phydev =3D pl->phydev;
> +	if (phydev)
> +		mutex_lock(&phydev->lock);
>  	mutex_lock(&pl->state_mutex);
> =20
>  	pl->config->mac_capabilities &=3D ~(MAC_SYM_PAUSE | MAC_ASYM_PAUSE);
>  	pl->config->mac_capabilities |=3D mac_pause;
> =20
> -	phylink_set(pl->supported, Pause);
> -	phylink_set(pl->supported, Asym_Pause);
> -
> -	if (pl->phydev)
> -		linkmode_and(pl->supported, pl->supported, pl->phydev->supported);
> -	else if (pl->sfp_bus)
> -		linkmode_and(pl->supported, pl->supported, pl->sfp_support);
> -
> -	__phylink_validate(pl, pl->supported, config);
> +	phylink_update_capabilities(pl, config);
> =20
>  	pause_state =3D config->pause;
> =20
> @@ -2171,6 +2417,9 @@ void phylink_update_mac_pause_capabilities(struct p=
hylink *pl, unsigned long mac
>  	}
> =20
>  	mutex_unlock(&pl->state_mutex);
> +	if (phydev)
> +		mutex_unlock(&phydev->lock);
> +	mutex_unlock(&pl->phydev_mutex);
> =20
>  	phylink_update_pause_state(pl, pause_state);
>  }

[Severity: High]
When a PHY is attached, does calling phylink_update_capabilities() followed
by phylink_update_pause_state() break PHY pause renegotiation and
permanently clear pause in pl->phy_advertising?

First, phylink_phy_update_capabilities() already updates phy->advertising
with the new pause bits, so when phylink_update_pause_state() subsequently
calls phy_set_asym_pause(), phy->advertising matches oldadv and
phy_start_aneg() is skipped. Second, phylink_update_pause_state() writes
the stripped pause_state (or the initial MLO_PAUSE_AN where MLO_PAUSE_RX
and MLO_PAUSE_TX are both 0) into pl->phy_advertising via
linkmode_set_pause(), permanently losing the PHY's pause advertisement
when MAC pause capabilities are later re-enabled.

[ ... ]

> @@ -3434,7 +3603,15 @@ int phylink_ethtool_ksettings_set(struct phylink *=
pl,
>  		 *   the presence of a PHY, this should not be changed as that
>  		 *   should be determined from the media side advertisement.
>  		 */
> -		return phy_ethtool_ksettings_set(pl->phydev, &phy_kset);
> +		ret =3D phy_ethtool_ksettings_set(pl->phydev, &phy_kset);
> +		if (!ret) {
> +			mutex_lock(&pl->state_mutex);
> +			linkmode_copy(pl->phy_advertising,
> +				      phy_kset.link_modes.advertising);
> +			mutex_unlock(&pl->state_mutex);
> +		}
> +
> +		return ret;
>  	}

[Severity: Medium]
Does copying phy_kset.link_modes.advertising into pl->phy_advertising save
a stale ETHTOOL_LINK_MODE_Autoneg_BIT and a MAC-restricted mask?

phy_ethtool_ksettings_set() takes a const struct ethtool_link_ksettings *
and updates ETHTOOL_LINK_MODE_Autoneg_BIT in phydev->advertising from
cmd->base.autoneg without modifying phy_kset.link_modes.advertising, which
was also already masked by pl->supported above. When
phylink_phy_update_capabilities() later copies pl->phy_advertising back to
phy->advertising, it overwrites the PHY's Autoneg bit and loses modes that
were only temporarily unsupported by the MAC/PCS.

[ ... ]

> @@ -4022,19 +4201,34 @@ static void phylink_sfp_detach(void *upstream, st=
ruct sfp_bus *bus)
>  }
> =20
>  static phy_interface_t phylink_choose_sfp_interface(struct phylink *pl,
> -						    const unsigned long *intf)
> +						    const unsigned long *intf,
> +						    const unsigned long *supported,
> +						    const struct phylink_link_state *state)
>  {
> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(tmp_supported);
> +	struct phylink_link_state tmp_state;
>  	phy_interface_t interface;
>  	size_t i;
> =20
> -	interface =3D PHY_INTERFACE_MODE_NA;
> -	for (i =3D 0; i < ARRAY_SIZE(phylink_sfp_interface_preference); i++)
> -		if (test_bit(phylink_sfp_interface_preference[i], intf)) {
> -			interface =3D phylink_sfp_interface_preference[i];
> -			break;
> -		}
> +	for (i =3D 0; i < ARRAY_SIZE(phylink_sfp_interface_preference); i++) {
> +		interface =3D phylink_sfp_interface_preference[i];
> +		if (!test_bit(interface, intf))
> +			continue;
> =20
> -	return interface;
> +		tmp_state =3D *state;
> +		tmp_state.interface =3D interface;
> +		linkmode_copy(tmp_supported, supported);
> +		if (phylink_validate(pl, tmp_supported, &tmp_state))
> +			continue;
> +
> +		/* Skip this preferred interface if user-disabled in advertising */
> +		linkmode_andnot(tmp_state.advertising, tmp_state.advertising,
> +				pl->user_disabled_advertising);
> +		if (!phylink_is_empty_linkmode(tmp_state.advertising))
> +			return interface;
> +	}
> +
> +	return PHY_INTERFACE_MODE_NA;
>  }

[Severity: Medium]
What happens if all link modes supported by a newly inserted optical SFP
module are currently disabled in pl->user_disabled_advertising?

phylink_choose_sfp_interface() skips every interface and returns
PHY_INTERFACE_MODE_NA without a fallback, causing
phylink_sfp_config_optical() to fail module insertion with -EINVAL before
phylink_sfp_set_config() updates pl->supported. The SFP state machine
enters SFP_MOD_ERROR and the user cannot re-enable the module's modes via
ethtool.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117123956.1198=
1-1-ansuelsmth@gmail.com?part=3D7
