Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600FF442382
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932404; cv=none; b=th6dpn2VSYCi8uByk15yu4LbW2rOdj36YNY+drIGG+SgqCXHkMRG2d65jXrf2gvietI/Tu6jo0sgcRQkN57/vCH6+x1ti0dBkuIlD7pzSo/99S3MVo+ft1qEWmHLAme4GeY4rbU8Q2CtUdi4JQY6wsw5MJMbzRDnUdIETOA3DEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932404; c=relaxed/simple;
	bh=bpAJDhM/mUojhUS3zQDqcr81ZGmV7kVTQ1aWBAEzpJk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oW+hqRSeF76+6HnBRHX36wrwfswPaIgtmdPMeIZ2Z1EYhKwZchdukT/uh3IhG7UjjTgflKGiqALit0flRY5dY7J6l7ybVH4I/dTqT8RFAPFsQle4wTy3iVm4FOeo90aqYI6XSBEuFFHQJ34WsLmHhT+7Ix0Rufk2ev5rKih1l48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMfjR7YN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMfjR7YN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116B81F000FF;
	Fri,  2 Oct 2026 09:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932403;
	bh=6thFAqRfEE2Nloz3tIa+g7ZpRSMw/05uuZp6JBkRQ34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cMfjR7YN9qzZQMy+zEEmFLbjTLdiKlDLTB3jZr2m7GSGtFum29xyUa2N4+KLXMw+H
	 ncYudmJMxDYS5hoE38hCJXU+3LT3RQZuG9OQxtdi32n9WB2uz/r+8br+NYxY9vk4Zv
	 hOaGhuN8QtXnms1ZKhmyZUtM+P/NNkqH34Jb7dFbeGJE8k0V4wqq54XmGjp5neGQmh
	 Wz6h4yLU3frlblEu36PaAgtOJLtOHoynz+VJnegIznJs8/sFSPMPETttgkGuKQBLef
	 IgOWMFbFZPUIw4yefvNEIDz2L4AjWeghjxg7oT3sP9JUoySTMZNHBArbEbJCzserBP
	 ZUC6iiMSB6A0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v23 3/3] net: phy: Add driver for Motorcomm
 Quad 2.5GbE phy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Switch" <kyle.switch@motor-comm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260930194513.663575-4-kyle.switch@motor-comm.com>
References: <20260930194513.663575-1-kyle.switch@motor-comm.com>
 <20260930194513.663575-4-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:13:22 +0000
Message-Id: <20261002091323.116B81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] net: phy: motorcomm: missing phy_package_init_once in yt8824_confi=
g_init disrupts active ports
- [High] net: phy: motorcomm: missing U0 un-reset write leaves U0 TX channe=
ls permanently disabled
- [Medium] net: phy: motorcomm: incorrect mask in yt8824_config_utp_init_pa=
ged causes CH2 register corruption
--

commit 198ccc56ee2557369512bc1763b9592679651225
Author: Kyle Switch <kyle.switch@motor-comm.com>

net: phy: Add driver for Motorcomm Quad 2.5GbE phy

Adds support for the Motorcomm YT8824 quad-port 2.5G PHY to the existing
motorcomm driver, using the phy_package helpers for the shared top
extended register space.

> diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
> index 90a4f86f2758b..dfa0612d713cb 100644
> --- a/drivers/net/phy/motorcomm.c
> +++ b/drivers/net/phy/motorcomm.c
[ ... ]
> +static int yt8824_config_utp_init_paged(struct phy_device *phydev)
> +{
[ ... ]
> +	/* 100M template amplitude */
> +	ctrl =3D FIELD_PREP(YT8824_DAC_IMID_CH3_ORG, 0x45);
> +	ctrl |=3D FIELD_PREP(YT8824_DAC_IMID_CH2_ORG, 0x45);
> +	mask =3D YT8824_DAC_IMID_CH3_ORG | YT8824_DAC_IMID_CH3_ORG;

[Severity: Medium]
Should this mask clear YT8824_DAC_IMID_CH2_ORG instead of duplicating
YT8824_DAC_IMID_CH3_ORG? The CH2 bits don't seem to be cleared before being
modified, which might lead to incorrect transmission amplitude on CH2.

> +	ret =3D ytphy_modify_ext_with_lock(phydev,
> +					 YT8824_DAC_IMID_CH2_CH3_CFG_ORG_REG,
> +					 mask, ctrl);
> +	if (ret < 0)
> +		goto err_restore;
[ ... ]
> +	ctrl =3D FIELD_PREP(YT8824_U0_CSR_RESETB_TX_CH0, 1);
> +	ctrl |=3D FIELD_PREP(YT8824_U0_CSR_RESETB_TX_CH1, 1);
> +	ctrl |=3D FIELD_PREP(YT8824_U0_CSR_RESETB_TX_CH2, 1);
> +	ctrl |=3D FIELD_PREP(YT8824_U0_CSR_RESETB_TX_CH3, 1);
> +	mask =3D YT8824_U0_CSR_RESETB_TX_CH0 | YT8824_U0_CSR_RESETB_TX_CH1 |
> +	       YT8824_U0_CSR_RESETB_TX_CH2 | YT8824_U0_CSR_RESETB_TX_CH3;
> +
> +	ctrl =3D FIELD_PREP(YT8824_U1_CSR_RESETB_TX_CH0, 1);
> +	ctrl |=3D FIELD_PREP(YT8824_U1_CSR_RESETB_TX_CH1, 1);
> +	ctrl |=3D FIELD_PREP(YT8824_U1_CSR_RESETB_TX_CH2, 1);
> +	ctrl |=3D FIELD_PREP(YT8824_U1_CSR_RESETB_TX_CH3, 1);
> +	mask =3D YT8824_U1_CSR_RESETB_TX_CH0 | YT8824_U1_CSR_RESETB_TX_CH1 |
> +	       YT8824_U1_CSR_RESETB_TX_CH2 | YT8824_U1_CSR_RESETB_TX_CH3;
> +	ret =3D ytphy_modify_ext_with_lock(phydev, YT8824_U1_CRS_RESET_REG,
> +					 mask, ctrl);

[Severity: High]
Is the ytphy_modify_ext_with_lock() call for YT8824_U0_CRS_RESET_REG missing
here? Since ctrl and mask for U0 are immediately overwritten by U1's values
before a write occurs, the un-reset sequence is completely skipped for U0.
This appears to leave half of the quad PHY's transmit channels permanently
disabled.

> +	if (ret < 0)
> +		goto err_restore;
[ ... ]
> +static int yt8824_config_init(struct phy_device *phydev)
> +{
> +	struct yt8824_shared_priv *priv =3D phy_package_get_priv(phydev);
> +	int ret;
> +
> +	mutex_lock(&priv->shared_lock);
> +	if (priv->package_mode =3D=3D PHY_INTERFACE_MODE_INTERNAL) {
> +		ret =3D yt8824_config_utp_init_paged(phydev);
> +		if (ret < 0)
> +			goto err;
> +	} else {
> +		ret =3D yt8824_extern_config_sds_init_paged(phydev);

[Severity: High]
Does this initialization need to be guarded by phy_package_init_once()?

The Linux PHY library calls config_init individually for each PHY port on
the device when it is brought up. Unconditionally executing the shared SERD=
ES
initialization for every port could overwrite shared configurations and ass=
ert
global hardware resets on other active ports within the same PHY package.

> +		if (ret < 0)
> +			goto err;
> +		ret =3D yt8824_config_utp_init_paged(phydev);
> +		if (ret < 0)
> +			goto err;
> +	}
> +	mutex_unlock(&priv->shared_lock);
> +	ret =3D yt8824_soft_reset(phydev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930194513.6635=
75-1-kyle.switch@motor-comm.com?part=3D3
