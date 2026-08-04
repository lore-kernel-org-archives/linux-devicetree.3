Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF6F369236
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 18:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785867625; cv=none; b=GJM30QKLeMUZvsOwOgHcshg8zY0+WzktarBF4F0p79APlgm8OBgFzLb65bF5VLBzu0vlS9lzZMQLTAeXImdFbaX2zz9HwHSeaf+uedSz+7XBaDm+37plYATihYhKbqsun63GMc3uZ62guIBfkidQpieePsihcr0TMLI4IPuDkfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785867625; c=relaxed/simple;
	bh=clJsgfpFfzIchT6ULgn7XOqBj3fMTG8J/KyBMR/ADPk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BvlvS+WufUwJwgcewpFAIQeq2e51Qi0pD/IeJy2c30EafkM1M2MVyDpBiKUmtHkkywyeIzQrwlZkiuHBMTDeCLI7/8fXnjscv+hsOQV6/NjuFoBp3blvYv39IEXMfgIpUX0CWjcacA6VMGtVULfy69/zrhjJeCDAY8lTcTNtpb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNTgkSpk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNTgkSpk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE951F000E9;
	Tue,  4 Aug 2026 18:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785867623;
	bh=HE73bSZgtxzzTvNz/PBn/nW4/fGGSKWGGgtsYMqaa6Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cNTgkSpk8//hsRf4j2ciYZDTStlHCW8ncUwmD2wNUtYg3ciP/8oT7NIAgxlqzJtJa
	 tbkpSLCg6uwpQzjn5+bc7sWyhlhXCp1OKX4+ASMmoUnBAvFBvPt1R/MGyANlEOTJhe
	 41vTXhqM/kSqX46B0DXliPOqjsdvQELDsIEXBITshyUA3LECWElbHdE9BIhO6YCmpc
	 ZNivor7CRMOiB9jl/8LgxuI4ddWlAVbv10yW4Szh41EHaPC6GxuiwPMvFnshESZ1IO
	 zIDM8AUWf4YN7TYznGKvWBOTnrBuUeDZU/eX8IYuWuoyFpLcScXS+zHZPN0KQhvZu6
	 IAXtsNszeJUyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v3 2/2] phy: qcom: qmp-combo: Add SM8475 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: olteanv@gmail.com, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org
In-Reply-To: <20260804-sm8475-bup-usbss-v3-2-9a5b9ebf62de@proton.me>
References: <20260804-sm8475-bup-usbss-v3-0-9a5b9ebf62de@proton.me>
 <20260804-sm8475-bup-usbss-v3-2-9a5b9ebf62de@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 18:20:22 +0000
Message-Id: <20260804182023.4AE951F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Missing `.calibrate_dp_phy` callback assignment in the newly added=
 `sm8475_usb3dpphy_cfg` struct.

Pre-existing issues:
- [High] SAR2130P configuration is not updated to use the new v1 DP PLL tab=
les despite being explicitly identified as a v1 SoC.
--

--- Patch [2]: [PATCH RESEND v3 2/2] phy: qcom: qmp-combo: Add SM8475 suppo=
rt ---
commit 1b30757e50e17e9f7e360c8987c9aafc76411e20
Author: Esteban Urrutia <esteuwu@proton.me>

phy: qcom: qmp-combo: Add SM8475 support

This patch adds USB3 and DP combo PHY support for the Qualcomm SM8475 SoC.
It introduces new RX and PCS USB tables, reuses others from existing SoCs,
and adds specific v1 PLL structures for 4nm-v1 SoCs to fix link training
failures caused by reference clock differences.

> Some SoCs such as SAR2130P, SM7550, SM7635 and SM8475 use 4nm-v1 PLLs.
> For SM8475, trying to use qmp_v6_dp_serdes_tbl structs (which are for
> 4nm-v1.1 PLLs) causes link training to fail because of ref clock
> differences, which in turn makes these structs differ.

[Severity: High]
This is a pre-existing issue, but since this patch introduces the v1 DP PLL
tables to fix link training for 4nm-v1 PLLs, shouldn't
sar2130p_usb3dpphy_cfg also be updated to use them?

Currently sar2130p_usb3dpphy_cfg still references the incompatible v1.1
tables (qmp_v6_dp_serdes_tbl), which according to this commit message
causes link training to fail on these SoCs.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index cdcfad2e86b1d..52b07de2c52b5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c

[ ... ]

> @@ -2845,6 +2965,51 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_c=
fg =3D {
>  	.has_pwrdn_delay	=3D true,
>  };
> =20
> +static const struct qmp_phy_cfg sm8475_usb3dpphy_cfg =3D {
> +	.offsets		=3D &qmp_combo_offsets_v3,

[ ... ]

> +	.dp_aux_init		=3D qmp_v4_dp_aux_init,
> +	.configure_dp_tx	=3D qmp_v4_configure_dp_tx,
> +	.configure_dp_clocks	=3D qmp_v3_configure_dp_clocks,
> +	.configure_dp_phy	=3D qmp_v4_configure_dp_phy,

[Severity: High]
Is the .calibrate_dp_phy callback intentionally omitted here?

Without the calibration loop being assigned (e.g., to
qmp_v4_calibrate_dp_phy), DP link training will not iterate through
different voltage swing and pre-emphasis settings upon a failure. This
could cause link training failures with certain cables or external displays.

> +
> +	.regs			=3D qmp_v6_usb3phy_regs_layout,
> +	.reset_list		=3D msm8996_usb3phy_reset_l,
> +	.num_resets		=3D ARRAY_SIZE(msm8996_usb3phy_reset_l),
> +	.vreg_list		=3D qmp_phy_vreg_l,
> +	.num_vregs		=3D ARRAY_SIZE(qmp_phy_vreg_l),
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-sm8475-bup=
-usbss-v3-0-9a5b9ebf62de@proton.me?part=3D2
