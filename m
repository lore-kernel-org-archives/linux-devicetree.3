Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005769;
	b=FEMiUlC0lw26ncA5GjCLx738p2Usyj2RAQRS0weOIOEKEvIyqzDgsGZ8oOtYTqekjHsl
	 QBWqbkYbyixQY667Mc/J2CazW4X+BsdDepxB/LMduwA2vH2bOz0D2pIDMLEdh1qJ7PFzC
	 JKlaTVNbZlJUGc914a+Fcs/ueZsBhA2koODkx4MxLAYyEsFYEgBf0+0TTC00Y5zFlQisO
	 GNIx4cVmu03mFjzhzhOo4h4alEEn/eCGRb5i7imVArIVt8mJ7q4buG75TcprGf9Ytw8A7
	 1XCRxM6LFJ1w/3VpNs1DGo+WJ52A7eKahm4blJtDTdcBTjzTG/fiEcNm3JB+Lm/TG4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005769;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kbY5TV0Hw5pwMQfSsSwukgv27/r/GEkQZffB1N9ME3I=;
	b=CnWiEhi30TzO1G6F55ppHnZhW2TABJ6sdZAPGzOu0ZtHGM9kJwR6I62itcFiQkh4kIrR
	 eewyiHfRn5b5n/OQn6DYVD3iF423Q2F5P6uyV2oyTjySVQVL6n9mINNHlzI7eUkerk1aK
	 cK9/nZvr9DauvgTJ2E5TMHNyviqPtYDejkRxvAF7O6bh0Ql3mqla7eIQWtCsqxQ1U9B0f
	 TyYz2zryett99bMyLz/9mOeXemszg4VSqgLyWnusOSzt6HcwoEE+0LNUiHeDwgLA8n8e6
	 FJMLjNAWcj4S9+o+tHA71eduHPyLvzdGEoWmU84VDkIua6UklGbrRVNUcsFFrwVL5wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=btEv57U7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F13606A335
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=btEv57U7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A7A1F000C4;
	Wed, 18 Nov 2026 12:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795005769;
	bh=kbY5TV0Hw5pwMQfSsSwukgv27/r/GEkQZffB1N9ME3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=btEv57U7XU0V1qN1V6td3hNIN1EU6XfWNrqjK2WoL2xJah0/w+Et1EILlZZpXvXRv
	 wJZTA8P6i5Vp+xP5mvTHh6Pors2L+PCxC/R5jb3mV3ENAoyOz16ADxhMsvlIn/E+5G
	 gwcK9d3F96Q00wHcrqouEU4X2jtBVxIt1wXOBakLBKoxNJcfcUiyChQpNuQ9t+hATX
	 3/uvtY4/1OBYqoNztG+FeJ83aChqfoujZAIeg3KqNYbABK99pXsh/wSOdBwsWeRYNN
	 oSL8x/hJCfVg+2Ezq4mudVbHCjzgrz9Ahl7xzFf8T0DBP5XyBXDP3KGZLMmS8upMsx
	 /83BcRmOd33tw==
Message-ID: <sashiko-outbox-220923@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v22 03/15] net: phylink: introduce internal
 phylink PCS handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117123956.11981-4-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
 <20261117123956.11981-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 12:42:48 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] net: phylink: missing error return in
  phylink_validate_mac_and_pcs()
- [Medium] net: phylink: broken PCS interface masking in
  phylink_create()
- [Low] net: phylink: duplicated PCS lookup logic across three functions
--

commit 4ee2fa0fe02a77175d57df4608f9c44befd95369
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: introduce internal phylink PCS handling

This commit introduces an internal PCS list in phylink, populated via
.fill_available_pcs in struct phylink_config, as an alternative to
.mac_select_pcs for selecting and validating PCS instances based on
their supported interfaces.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index f482dc6088102..e8ba906cfba68 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -535,6 +554,21 @@ static int phylink_validate_mac_and_pcs(struct phyli=
nk *pl,
>  		pcs =3D pl->mac_ops->mac_select_pcs(pl->config, state->interface);
>  		if (IS_ERR(pcs))
>  			return PTR_ERR(pcs);
> +	/*
> +	 * Find a PCS in available PCS list for the requested interface.
> +	 *
> +	 * Skip searching if the MAC doesn't require a dedicated PCS for
> +	 * the requested interface.
> +	 */
> +	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
> +		struct phylink_pcs *tmp;
> +
> +		list_for_each_entry(tmp, &pl->pcs_list, list) {
> +			if (!phylink_validate_pcs_interface(tmp, state->interface)) {
> +				pcs =3D tmp;
> +				break;
> +			}
> +		}
>  	}

[Severity: Medium]
Should phylink_validate_mac_and_pcs() return -EINVAL when state->interface
is set in pl->config->pcs_interfaces, but no matching PCS is found in
pl->pcs_list?

When pcs remains NULL, phylink_validate_mac_and_pcs() skips the if (pcs)
block and validates state->interface against MAC capabilities alone via
phylink_validate_mask_caps().  If a MAC lists modes in
config->pcs_interfaces that the attached PCS does not support (for example,
10GBASER and USXGMII when paired with a PCS that only supports up to
2500BASEX), those modes pass validation during phylink_parse_mode(), PHY
attachment, and SFP module selection, only for phylink_major_config() to
fail at runtime with pl->major_config_failed =3D true when it sees !pcs.

> @@ -968,12 +999,22 @@ static void phylink_pcs_enable_eee(struct phylink_p=
cs *pcs)
>  static unsigned int phylink_inband_caps(struct phylink *pl,
>  					 phy_interface_t interface)
>  {
> -	struct phylink_pcs *pcs;
> +	struct phylink_pcs *pcs =3D NULL;
> =20
> -	if (!pl->mac_ops->mac_select_pcs)
> -		return 0;
> +	if (pl->mac_ops->mac_select_pcs) {
> +		pcs =3D pl->mac_ops->mac_select_pcs(pl->config,
> +						  interface);
> +	} else if (test_bit(interface, pl->config->pcs_interfaces)) {
> +		struct phylink_pcs *tmp;
> +
> +		list_for_each_entry(tmp, &pl->pcs_list, list) {
> +			if (!phylink_validate_pcs_interface(tmp, interface)) {
> +				pcs =3D tmp;
> +				break;
> +			}
> +		}
> +	}
> =20
> -	pcs =3D pl->mac_ops->mac_select_pcs(pl->config, interface);
>  	if (IS_ERR_OR_NULL(pcs))
>  		return 0;
> =20
> @@ -1270,10 +1311,36 @@ static void phylink_major_config(struct phylink *=
pl, bool restart,
>  			pl->major_config_failed =3D true;
>  			return;
>  		}
> +	/* Find a PCS in available PCS list for the requested interface.
> +	 * This doesn't overwrite the previous .mac_select_pcs as either
> +	 * .mac_select_pcs or PCS list implementation are permitted.
> +	 *
> +	 * Skip searching if the MAC doesn't require a dedicated PCS for
> +	 * the requested interface.
> +	 */
> +	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
> +		struct phylink_pcs *tmp;
> +
> +		list_for_each_entry(tmp, &pl->pcs_list, list) {
> +			if (!phylink_validate_pcs_interface(tmp,
> +							    state->interface)) {
> +				pcs =3D tmp;
> +				break;
> +			}
> +		}
> +
> +		if (!pcs) {
> +			phylink_err(pl,
> +				    "couldn't find a PCS for %s\n",
> +				    phy_modes(state->interface));
> =20
> -		pcs_changed =3D pl->pcs !=3D pcs;
> +			pl->major_config_failed =3D true;
> +			return;
> +		}
>  	}

[Severity: Low]
This isn't a bug by itself, but the PCS selection logic checking
pl->mac_ops->mac_select_pcs and walking pl->pcs_list is duplicated across
phylink_validate_mac_and_pcs(), phylink_inband_caps(), and
phylink_major_config().  Factoring this lookup into a helper that returns
a struct phylink_pcs pointer (or an ERR_PTR when a required PCS is not
found) would avoid the triplicated loop and keep missing-PCS handling
consistent across all three callers.

[ ... ]

> @@ -2096,16 +2220,31 @@ struct phylink *phylink_create(struct phylink_con=
fig *config,
>  	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
>  	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
> =20
> +	/* Fill the PCS list with available PCS from phylink config */
> +	ret =3D phylink_fill_available_pcs(pl, config);
> +	if (ret < 0)
> +		goto free_pl;
> +
> +	/* Link available PCS to phylink */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		rcu_assign_pointer(pcs->phylink, pl);
> +
>  	phy_interface_copy(pl->supported_interfaces,
>  			   pl->config->supported_interfaces);
> =20
> +	/* Update supported interfaces */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		phy_interface_or(pl->supported_interfaces,
> +				 pl->supported_interfaces,
> +				 pcs->supported_interfaces);

[Severity: Medium]
As reported by Maxime Chevallier on v7 [1], does ORing
pcs->supported_interfaces into pl->supported_interfaces leave unsupported
interface modes enabled in pl->supported_interfaces?

Because pl->config->supported_interfaces already contains the modes in
pl->config->pcs_interfaces, bitwise-ORing pcs->supported_interfaces never
clears modes in config->pcs_interfaces that no PCS in pl->pcs_list
supports.  Conversely, if a generic PCS sets modes in
pcs->supported_interfaces that the MAC itself does not support,
phy_interface_or() adds them to pl->supported_interfaces, and because
those modes are not in pl->config->pcs_interfaces, phylink treats them as
native MAC modes requiring no PCS.  Callers inspecting
pl->supported_interfaces (such as SFP interface selection and PHY
validation) will then consider unsupported modes valid until
phylink_major_config() fails.

Should pl->supported_interfaces instead start with the non-PCS MAC
interfaces (config->supported_interfaces & ~config->pcs_interfaces) and OR
in (pcs->supported_interfaces & config->pcs_interfaces) for each available
PCS (falling back to config->pcs_interfaces when pcs->supported_interfaces
is empty)?

[1] https://lore.kernel.org/r/3bbacda3-4225-4536-a4b4-3aa31a47a3aa@bootlin.=
com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117123956.1198=
1-1-ansuelsmth@gmail.com?part=3D3
