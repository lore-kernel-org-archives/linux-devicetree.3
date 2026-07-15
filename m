Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17599446BEA
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 19:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142906; cv=none; b=ZzGgSRMatsZP3IEouQJAYl43Y5YzYT9Eg/XGxlIuYho9xHaMYJaN6vsQPM2qIImSXwzPHZYe6GkeWHMaW3r1P/lzsY1i0xPXgilSsBwAianCVEBU3NdBf8BH3tErRljLY03KQx/n9puhHP81rxYU4K+GLopHxRjZE8q/yW1anro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142906; c=relaxed/simple;
	bh=RmdojlrozxkF5xNffdW8fb5g+7ceZtYCDv02tnM/Kfs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i0H9CO5hbPz3mLTqs72IZIFSbAc514NMqSEFrhbwP6ElzIj25NSLAMHiLCEsrjg1jn5qQ3NA6bx9TlSobaFRsv8VCG47Gz+WGnTWOWBqUNm/Eub9ONzbLNtirVFwBvvhItqH58Wda2sb+xiUbgrEKWi4xmhKEOlRv1iGs7y9o9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KehEWCyG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KehEWCyG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE731F000E9;
	Wed, 15 Jul 2026 19:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784142894;
	bh=EmrdoLIZZQcGtWbtgtxSkBaPsATqasvPdAOr+v9I5+I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KehEWCyGn9ed00VaDFVM1gK4Ivor7yAYRXh0kc6TDP6YZXuP+ZtyxiotRCetpRKZO
	 1+zFr/41eeKh5/5H9l0h2TMrVIDDbUELurcujYf5FxSt3k9Fsm3lqXoNEiRKZnnXzx
	 bFd0Z3AexArDePeoGxYN9F5K4PsK59ZxTMsGYV94ueHJG1/5cbtElQ60upfnvajSWq
	 28CXloehZgsVck1zPZX377hXfF2gsIbFifwX8BHsL/zcns+97eCSJ2aP8OGPD6g53U
	 H4AmzjPhzUMcGE/8A4fAJlNa6AqIjKpwTHa20xlj8O2HT5NJmubQ8toMY34n9Bl2C1
	 E5d7ZsAOq69Sw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 06/10] net: pcs: xpcs: improve SGMII AN state
 handling for Rockchip RK3568
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: vkoul@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260714191341.690906-7-coiaprant@gmail.com>
References: <20260714191341.690906-1-coiaprant@gmail.com>
 <20260714191341.690906-7-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 19:14:53 +0000
Message-Id: <20260715191453.DEE731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The AN complete status is cleared before reading MII_BMCR in the W=
angxun-specific path, which can cause the link to stall permanently if a su=
bsequent MDIO read fails.
- [Medium] The patch modifies the 1000BASE-X configuration path to assert B=
MCR_ANRESTART without any mention or justification in the commit message.
--

--- Patch [6]: [RFC PATCH 06/10] net: pcs: xpcs: improve SGMII AN state han=
dling for Rockchip RK3568 ---
commit 8c1976e4f52a5e7d8b4bab114f6cf214fe50a249
Author: Coia Prant <coiaprant@gmail.com>

net: pcs: xpcs: improve SGMII AN state handling for Rockchip RK3568

This patch modifies SGMII AN state handling for Rockchip RK3568 by checking
CL37_ANSGM_STS for link status. It clears the AN complete interrupt and
restarts AN for non-Wangxun platforms if complete, and clears CL37 AN
complete status before starting AN to ensure a clean initial state.

> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> index e69fa2f0a0e8d..cf370ba247cac 100644
> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c

[ ... ]

> @@ -884,7 +889,7 @@ static int xpcs_config_aneg_c37_1000basex(struct dw_x=
pcs *xpcs,
> =20
>  	if (neg_mode =3D=3D PHYLINK_PCS_NEG_INBAND_ENABLED) {
>  		ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
> -				 mdio_ctrl | BMCR_ANENABLE);
> +				 mdio_ctrl | BMCR_ANENABLE | BMCR_ANRESTART);

[Severity: Medium]
The commit message mentions improving SGMII AN state handling, but this
adds BMCR_ANRESTART to the 1000BASE-X configuration path in
xpcs_config_aneg_c37_1000basex(). Was this unintentional, or should the
commit message be updated to mention this behavior change for 1000BASE-X?

>  		if (ret < 0)
>  			return ret;
>  	}

[ ... ]

> @@ -1086,7 +1094,24 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs=
 *xpcs,
>  			state->duplex =3D DUPLEX_FULL;
>  		else
>  			state->duplex =3D DUPLEX_HALF;
> -	} else if (ret =3D=3D DW_VR_MII_AN_STS_C37_ANCMPLT_INTR) {
> +
> +		return 0;
> +	}
> +
> +	/* Clear AN complete status or interrupt */
> +	if (state->an_complete)
> +		xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);

[Severity: High]
Can clearing the interrupt here lead to a permanently stalled link on
Wangxun platforms if the subsequent xpcs_read() fails?

The original code cleared DW_VR_MII_AN_INTR_STS at the very end of the
DW_VR_MII_AN_STS_C37_ANCMPLT_INTR block, after successfully reading
MII_BMCR and MII_ADVERTISE.

By moving the interrupt clear here:

    if (state->an_complete)
        xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);

If a transient MDIO error occurs during the subsequent MII_BMCR read:

    speed =3D xpcs_read(xpcs, MDIO_MMD_VEND2, MII_BMCR);
    if (speed < 0)
        return speed;

The function will exit with an error and the link will remain down, but the
AN complete status has already been cleared. Will this prevent the Wangxun
initialization block from running on the next poll and leave the link
stuck?

> +
> +	if (xpcs->info.pma !=3D WX_TXGBE_XPCS_PMA_10G_ID) {
> +		/* If the link down, restart Auto-Negotiation */
> +		if (state->an_complete)
> +			xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTART,
> +				    BMCR_ANRESTART);
> +
> +		return 0;
> +	}
> +
> +	if (ret =3D=3D DW_VR_MII_AN_STS_C37_ANCMPLT_INTR) {
>  		int speed, duplex;
> =20
>  		state->link =3D true;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714191341.6909=
06-1-coiaprant@gmail.com?part=3D6
