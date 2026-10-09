Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E55D136672
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 17:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568428; cv=none; b=CKGO4KCvKWwfwdhve5nZ/EsP99w2rRjfiiwG5GkoXtBXxow89LdFk1dJy0Rh9hgKAk5lIEeR/jiDlGDEjPUOuYn6msO4SYSGfwcOaDrqYlYsl4ERXFluFnPxYVW8u4VcBcLLTAYAhg1844xuxvKNJVtOmzZ1rs+WjjDB53tQ05c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568428; c=relaxed/simple;
	bh=wH83/kS6fJTbvHUZIlQgxFfsa5fEKJcwEzpZmgUCBLc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=csNKSziI78gl05mDFN/Q9lL8hFDhcEnD9S0CN8J6S7Z9lxQ8RR49R4Ko5So+BnRvmgQMf0J9+AhMia/afpYpylbD9or1AEwHrGyPefCxYhok5b4t6/S6PK5ZQ/HfG/7kaK9RGo6lEeIjQPOD9/zFBgPiNjS8IQ9RZAn9TkXOoM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wv/KEE6B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wv/KEE6B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A5B1F000FF;
	Fri,  9 Oct 2026 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791568426;
	bh=duyuYWgB56eZplV3IBOEz5OS/Aa3gjxoUkBbx9ha7mA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wv/KEE6BW5FZLxU1EzX3sCPtGx6vDCTrMZxbNTzkRoviXiD8X722kCuK9zKPuO/el
	 NUo9Yk4g6z6j3KA2bNL+r4zwOW8byySF+h2nRclZEUcdl7um4hRYV6idYpPVlF4ID9
	 gvbmGw+OwTB+8DPLZ9+vwzerQIiZzYmqKyoE9V4p2lvp/5dnlwgYXA1yoRuuIM/mDw
	 cNa8E4KwiuSeF/lo83WpM+xLfOFVz8WbNzIs41zu88atrOeBZgjEMK/mL2RJxT9NoN
	 AQCxvsrGVDo7wtJUDGBvT8T54WCOArGUcKccz6fvciaiAO29RBTzNZsjKiiNqbhw8v
	 EMxKhmqQ0Hlaw==
Message-ID: <sashiko-outbox-165902@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 2/6] dt-bindings: net: pcs: add
 rockchip,rk3568-xpcs support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008175225.3375274-3-coiaprant@gmail.com>
References: <20261008175225.3375274-1-coiaprant@gmail.com>
 <20261008175225.3375274-3-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 17:53:46 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] net: pcs: unconditional AN restart quirk may break standard DW S=
GMII PHYs
- [Medium] net: pcs: xpcs: interrupt storm in SGMII mode due to uncleared A=
N status
--

commit 9bbe537f2904ae4cf66c0b099833bc944c6e3043
Author: Coia Prant <coiaprant@gmail.com>

dt-bindings: net: pcs: add rockchip,rk3568-xpcs support

Add device tree binding documentation for the Synopsys DesignWare
XPCS integrated on the Rockchip RK3568 SoC.

> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> index b415b93d77c15..6466e0ff2a98b 100644
> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c
[ ... ]
> @@ -816,9 +825,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs=
 *xpcs,
>  	if (ret < 0)
>  		return ret;
> =20
> +	/* Clear CL37 AN complete status */
> +	ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
> +	if (ret < 0)
> +		return ret;
> +
>  	if (neg_mode =3D=3D PHYLINK_PCS_NEG_INBAND_ENABLED)
>  		ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
> -				 mdio_ctrl | BMCR_ANENABLE);
> +				 mdio_ctrl | BMCR_ANENABLE | BMCR_ANRESTART);

[Severity: Medium]
Will this unconditional AN restart quirk break standard DW SGMII PHYs?

According to the DW databook, an AN restart is not needed for MAC-side SGMI=
I.
While explicitly documented as a workaround for a timing quirk in
Rockchip RK3568, applying it unconditionally to all compliant SGMII deploym=
ents
(e.g., NXP SJA1105) could trigger link flapping or state machine violations=
 by
continually interrupting a link that is transitioning to an 'up' state.

[ ... ]
> @@ -1093,9 +1107,18 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs=
 *xpcs,
>  		return 0;
>  	}
> =20
> -	/* Clear AN complete status or interrupt */
> -	if (state->an_complete)
> -		xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
> +	if (state->an_complete) {
> +		/* Clear AN complete status or interrupt */
> +		ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
> +		if (ret < 0)
> +			return ret;
> +

[Severity: Medium]
Can this cause an interrupt storm in SGMII mode due to uncleared AN status?

In xpcs_get_state_c37_sgmii(), when the link successfully comes up,
DW_VR_MII_C37_ANSGM_SP_LNKSTS is true and the function returns 0 early:

drivers/net/pcs/pcs-xpcs.c:xpcs_get_state_c37_sgmii() {
    ...
	if (ret & DW_VR_MII_C37_ANSGM_SP_LNKSTS) {
		...
		state->link =3D true;
		...
		return 0;
	}
    ...
}

By returning early, the function bypasses this block that explicitly clears
DW_VR_MII_AN_INTR_STS. Since the register is not read-to-clear, the
ANCMPLT_INTR bit remains set.

If a driver operates with xpcs->pcs.poll =3D false (like Wangxun TXGBE) and=
 the
interrupt is enabled, will the un-cleared status cause the MAC interrupt
handler to loop indefinitely?

> +		/* Initiate the next round of AN */
> +		ret =3D xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTART,
> +				  BMCR_ANRESTART);

[Severity: Medium]
Does this unconditional AN restart quirk break standard DW SGMII PHYs?

Similar to xpcs_config_aneg_c37_sgmii(), this applies an explicit
Auto-Negotiation (AN) restart via BMCR_ANRESTART unconditionally when AN
completes.

Since this workaround is for Rockchip RK3568, executing it on any non-Rockc=
hip
DW SGMII interface when AN finishes could interrupt a link that is
transitioning to an 'up' state.

> +		if (ret < 0)
> +			return ret;
> +	}
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008175225.3375=
274-1-coiaprant@gmail.com?part=3D2
