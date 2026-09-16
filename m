Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112195013DC
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 10:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555176; cv=none; b=fVd/EqJwSrRKqTTqGYHqRTG4pxtLHmHz8GV7e9fTntUx7CQ51IWvy5AsHKuTtXDvJad3V27C6rs2J05r864rqKnQkFiKxlBjw4sZVefFpZMtLvlv5zcSlTlIiis+Q59toAuh7Sdbo/Zlb7oBa4SK8LRWrrmIKDzSjVCuDp3jsbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555176; c=relaxed/simple;
	bh=spCcr8A3J1IHE28rMQSo4+59b+cmb8+5s6mbpo5V+88=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UvX4iWS5ym9z2nnZVfC4CHcZxVBMtHL36fPTGdcWIjpoxLbrZTo+qVOtcvf1rhSCIzZXRh8pRv/V2kjei9GyCDfJxj/4u3ldY/6Q0KUIcNi4UMxMNnK0HRY7+/ghBWp36tJoWtqSR659PBL83SXfQLoZaOhNhbc0uBzRbvp5FEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OR2pjRqG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OR2pjRqG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A781F0089D;
	Wed, 16 Sep 2026 10:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789555160;
	bh=xXuF4ts6C5rRFSmgXBKj7pP5DmLJ7pInvJEhHuliPdY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OR2pjRqGOi3ZaNc5R3RaqiVDf4toKqbxT2dlhfPm3KdPJV0njjLbgq0rzyBDuDaMw
	 ajqTRT7M8X4fqOWhPCor/zG6CxYkbbqUsUayNULgT1XcQx7PMfJ9JmfoLwpH+cm3XD
	 n6jmFNwThsJPLmhYWen3598ejs89RbVL1aCAoftvKkqS6Zv/GlDKVyh4uLverNxT+K
	 KgRTSUD0/AcI/qZt7mVHu949EOVpZD8u2EsKgq6xAthN577FiEULACLrvszkIJrh4n
	 NJ6QIYoLeLKQTMEl79IoZi0aNvk/vBtIgxDkPI4+SwdVcyv9xXV4Y2ShgxvBO3PXYd
	 LJIfmrqF/s0fA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcs8300: Add qref and refgen
 supply for PCIe PHYs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziyue Zhang" <ziyue.zhang@oss.qualcomm.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260916102023.2054761-4-ziyue.zhang@oss.qualcomm.com>
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
 <20260916102023.2054761-4-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 10:39:19 +0000
Message-Id: <20260916103919.B6A781F0089D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pcie: probe failure on SA8775p due to unconditionally required QCS=
8300 workaround regulator
--

commit 1c7a11beac9080a5affb060c2f0b8c2011ce109b
Author: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Subject: arm64: dts: qcom: qcs8300: Add qref and refgen supply for PCIe PHYs

This commit adds vdda-qref-supply and vdda-refgen-supply to board DTS files=
 and
refgen-supply to the SoC DTSI for QCS8300 due to hardware requirements for
stable operation. It also updates the driver to vote for refgen as a
workaround for a QCS8300 hardware issue.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualc=
omm/phy-qcom-qmp-pcie.c
> index da83358c97ead..ab81c6e584a84 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -4094,6 +4094,10 @@ static const char * const sm8550_qmp_phy_vreg_l[] =
=3D {
>  	"vdda-phy", "vdda-pll", "vdda-qref",
>  };
> =20
> +static const char * const sa8775p_qmp_phy_vreg_l[] =3D {
> +	"vdda-phy", "vdda-pll", "vdda-qref", "vdda-refgen", "refgen",
> +};
> +

[Severity: High]
Does this unconditionally require the refgen supply for any configuration
using sa8775p_qmp_phy_vreg_l in drivers/phy/qualcomm/phy-qcom-qmp-pcie.c?

According to the DT bindings, refgen-supply is a hardware workaround requir=
ed
only for QCS8300, and SA8775P device trees correctly do not define it.

When qmp_pcie_vreg_init() calls devm_regulator_bulk_get() on SA8775P boards,
it will fail to find refgen, which will abort the PHY probe and completely =
break
PCIe functionality on SA8775P.

>  /* list of resets */
>  static const char * const ipq8074_pciephy_reset_l[] =3D {
[ ... ]
> @@ -5324,8 +5328,8 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x2_=
pciephy_cfg =3D {
> =20
>  	.reset_list		=3D sdm845_pciephy_reset_l,
>  	.num_resets		=3D ARRAY_SIZE(sdm845_pciephy_reset_l),
> -	.vreg_list		=3D qmp_phy_vreg_l,
> -	.num_vregs		=3D ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		=3D sa8775p_qmp_phy_vreg_l,
> +	.num_vregs		=3D ARRAY_SIZE(sa8775p_qmp_phy_vreg_l),

[Severity: High]
Will the sa8775p_qmp_gen4x2_pciephy_cfg configuration incorrectly inherit t=
he=20
requirement for the QCS8300-specific refgen supply by using this shared lis=
t?

>  	.regs			=3D pciephy_v5_regs_layout,
> =20
>  	.pwrdn_ctrl		=3D SW_PWRDN | REFCLK_DRV_DSBL,
[ ... ]
> @@ -5365,8 +5369,8 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x4_=
pciephy_cfg =3D {
> =20
>  	.reset_list		=3D sdm845_pciephy_reset_l,
>  	.num_resets		=3D ARRAY_SIZE(sdm845_pciephy_reset_l),
> -	.vreg_list		=3D qmp_phy_vreg_l,
> -	.num_vregs		=3D ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		=3D sa8775p_qmp_phy_vreg_l,
> +	.num_vregs		=3D ARRAY_SIZE(sa8775p_qmp_phy_vreg_l),

[Severity: High]
Could the sa8775p_qmp_gen4x4_pciephy_cfg configuration also be affected by
this requirement through the shared list?

>  	.regs			=3D pciephy_v5_regs_layout,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916102023.2054=
761-1-ziyue.zhang@oss.qualcomm.com?part=3D3
