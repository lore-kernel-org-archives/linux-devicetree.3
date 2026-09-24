Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D03214A84
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 01:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790212185; cv=none; b=BfzzNxNBXpr94qIH68d50xGmeASQx296jeY6FkOFBj4TMVGFOcEwFd/dCCMokAkk79zjarKpNFQWJzPUrY8Y4hehevD0SIoQtJ8IydhWN4zFLzJQcNd4zPNLDxnO4YYK2UjTtu3EU0ADHE1PRL8OtDFDiWnctcZfCW79gVFE5Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790212185; c=relaxed/simple;
	bh=YyuankOa0wz++ojhgZ+FNFFPjnpgMYOiLfWASZ36+xM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WELz8sc9IyBRzKivxyz+JRGxYHIplGAbaoD6jSvNpXorDyb6Ho+PBWkYRCGFQfMPiO7ZVQL2IlO5P7JJNgpYqXvkwkBBQ0PLzxaDANQt/ghvVG846jpYWSbUxdi5cuR0VG7S9IMrjJEA4iiHyvbSDmJaUlChjtMQtHaEhaqeXtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6NcQa5X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6NcQa5X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DA21F00898;
	Thu, 24 Sep 2026 01:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790212184;
	bh=dX8gyiWlIcEJTd5GdrFP5SBLpyDQxTUZjBtrhYyXsMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y6NcQa5XrXbWHvjxl8U74oEQJItM0Tcs1OcI1t+HBFZR0JK8LrD2ViNxQkTlxmPDU
	 ijWnmm6a/x8upkWQLv7q+Htl/XzW7u6ehDe1RCZGhKfVI4uNSomQaOAgRpY8yu1x8f
	 5ugmnOfqzANjYR9hBXSHu3FInnkiidy+1/yr3e6VfIbcWOhFLkErBtPgV2vmOphwYV
	 NrRCLcRU2qHBNswS0n3tKU2ofjhvhuBaLfhctF2p032bNhP1taU3svbppfd7dLegDc
	 GGqUF/qWD+1BkYJRE0SFQR8t6tKm5+o9GWHXnD+YsYrE6SvwsOnbCM1Kr/oubeTvpG
	 Py8dxoaTw5oUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC net-next 2/9] net: pcs: xpcs: add USXGMII Clause 37
 autoneg support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-2-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-2-4b1c682af70f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 01:09:43 +0000
Message-Id: <20260924010943.B6DA21F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] net: pcs: xpcs: USXGMII link up forces full-duplex and ignores n=
egotiated duplex
- [Low] net: pcs: xpcs: unconditional disable of Clause 37 AN interrupts fo=
r USXGMII
- [Low] net: pcs: xpcs: incorrect use of standard MDIO_CTRL1 in vendor-spec=
ific register access
--

commit a4e7caa76a7f032f82d43f5626c2004e96588abf
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
net: pcs: xpcs: add USXGMII Clause 37 autoneg support

This commit adds Clause 37 USXGMII auto-negotiation support to the generic
DesignWare XPCS driver. It configures the PCS for BASE-R, enables single-po=
rt
10G-SXGMII operation, and decodes the negotiated link, speed, and duplex.

> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> index 0337e2bcc0125..7f5c7a275630f 100644
> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c
[ ... ]
> @@ -355,6 +356,54 @@ static int xpcs_read_fault_c73(struct dw_xpcs *xpcs,
>  	return 0;
>  }
> =20
> +static int xpcs_config_aneg_c37_usxgmii(struct dw_xpcs *xpcs)
> +{
> +	u16 mask, val;
> +	int ret;
[ ... ]
> +	/* Configure USXGMII per XPCS databook section 7.6. */
> +	mask =3D DW_VR_MII_AN_CTRL_8BIT | DW_VR_MII_SGMII_LINK_STS |
> +	       DW_VR_MII_TX_CONFIG_MASK | DW_VR_MII_PCS_MODE_MASK |
> +	       DW_VR_MII_AN_INTR_EN;
> +	val =3D FIELD_PREP(DW_VR_MII_TX_CONFIG_MASK,
> +			 DW_VR_MII_TX_CONFIG_PHY_SIDE_SGMII) |
> +	      DW_VR_MII_SGMII_LINK_STS;
> +
> +	ret =3D xpcs_modify(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_CTRL,
> +			  mask, val);

[Severity: Low]
Does this unconditionally disable Clause 37 AN interrupts for USXGMII?

DW_VR_MII_AN_INTR_EN is included in the mask but is missing from val, which
explicitly and unconditionally clears the interrupt enable bit.

Although USXGMII currently defaults to polling mode, could explicitly disab=
ling
it here break interrupt-driven operation if a MAC driver attempts to use it?

> +	if (ret < 0)
> +		return ret;
> +
> +	return xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR,
> +			   BMCR_ANENABLE, BMCR_ANENABLE);
> +}
> +
>  static void xpcs_link_up_usxgmii(struct dw_xpcs *xpcs, int speed)
>  {
>  	int ret, speed_sel;

[Severity: Low]
Is the standard MDIO_CTRL1 macro used incorrectly here for a vendor-specific
register?

In xpcs_link_up_usxgmii(), there are calls like:

    ret =3D xpcs_modify_vpcs(xpcs, MDIO_CTRL1, DW_USXGMII_EN, DW_USXGMII_EN=
);

Both MDIO_CTRL1 and DW_VR_XS_PCS_DIG_CTRL1 evaluate to 0x00, but using the
standard IEEE macro instead of the vendor-specific one in xpcs_modify_vpcs()
breaks consistency. This also occurs when applying DW_USXGMII_RST.

[ ... ]
> @@ -1158,6 +1213,58 @@ static int xpcs_get_state_2500basex(struct dw_xpcs=
 *xpcs,
>  	return 0;
>  }
> =20
> +static int xpcs_get_state_c37_usxgmii(struct dw_xpcs *xpcs,
> +				      struct phylink_link_state *state)
> +{
> +	u16 speed;
> +	int ret;
[ ... ]
> +	state->duplex =3D ret & DW_VR_MII_USXG_FULL ?
> +			DUPLEX_FULL : DUPLEX_HALF;
> +
> +	return 0;
> +}

[Severity: Medium]
Will xpcs_link_up_usxgmii() ignore this negotiated duplex state?

If the link negotiates half-duplex (which is supported here as DUPLEX_HALF),
the xpcs_link_up() function passes this state, but xpcs_link_up_usxgmii()
ignores the duplex parameter entirely and unconditionally sets DW_USXGMII_F=
ULL.

Furthermore, DW_USXGMII_FULL is missing from DW_USXGMII_SS_MASK:

    ret =3D xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, DW_USXGMII_SS_MASK,
                      speed_sel | DW_USXGMII_FULL);

Is it impossible to clear the full-duplex bit if it was previously set,
leading to a duplex mismatch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-qcom_xpcs_=
nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com?part=3D2
