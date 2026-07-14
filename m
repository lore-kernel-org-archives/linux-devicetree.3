Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B763E1680
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011637; cv=none; b=ghCMtaxut4X9h3t4ZOa0uEpCShgqdTqPIiPCFuu/3WOkIcfv1u+Lh+/VdRbMuUJPbGQioG0duLeGstl7NiFLa+bSEWJe014H+K+DgfXIoXzQcUjocAyztxx2CNgMPfYK/3GH26Bx3ejNcOtj5rhKfXGABAi+7xGwNfhXDX+oA5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011637; c=relaxed/simple;
	bh=6M9kAUUFCnXJVHwAvvn5YSUiLG5crelsAnXwsOAwySs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uf45BUgC/KkQmt78HnaRr1r6ugyPJXukN7QDIWjrFLTSlDa5xBS519JU0e7Epkjlg/gwjGqXJCJAuITgDEy01Tgk4a0dJP07lXPe31kAu+68SaWwjzIKo2I9RyY0my1HOlBfF567fKjCG6HFT8uTG8hoOkU9SrvAFKKrY3tmLZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gx+/E1A8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gx+/E1A8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D1D1F000E9;
	Tue, 14 Jul 2026 06:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784011636;
	bh=/oWllenJ81z2ENJXlwEPtSJS3tEEKMGHeAIg1TKiHUY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gx+/E1A8V8jHL4Ocw99AhUONvIQcRDSvG+LuUvtDAvkxTO8NwSbIA5uHK3nXVm0iD
	 IXUV657KpbFj/fprcC1VkH7HQJYddneoCmwO/u1lA1FcMEmh4udciZGP0l8IAwclkc
	 d7lkgvAI2JgXHntXU52DwyQfjuCDlbGqS/WaZfU/8yUFNPRe7gUK7Ip0jK8DIhAGSA
	 gEsSIpSayKVjsr//nZQD0G/3FMi6kqoq/IF1GZANDLz1aFv2cNkTgUupYNz4i+fAdD
	 157V8TSxIRuanVS8nO7iP0xb2saexIZXLTpsZ5JyU9+9ZW48+8cluriTHfQ3fi4ldl
	 IbfF5XJyiALvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] phy: qcom: qmp-combo: Add SM8475 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, olteanv@gmail.com, vkoul@kernel.org, robh@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260714-sm8475-bup-v1-6-b2871be2b4ec@proton.me>
References: <20260714-sm8475-bup-v1-0-b2871be2b4ec@proton.me>
 <20260714-sm8475-bup-v1-6-b2871be2b4ec@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 06:47:15 +0000
Message-Id: <20260714064715.86D1D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing .calibrate_dp_phy callback in sm8475_usb3dpphy_cfg break=
s AUX channel tuning
--

--- Patch [6]: [PATCH 6/6] phy: qcom: qmp-combo: Add SM8475 support ---
commit e78dfb3ee5c0edb9f6e26900169472c958e036c0
Author: Esteban Urrutia <esteuwu@proton.me>

phy: qcom: qmp-combo: Add SM8475 support

This commit adds QMP combo PHY support for the Qualcomm SM8475 SoC. It
introduces RX and PCS USB tables while reusing SERDES, TX, and PCS tables
from other SoCs to support USB Type-C and DP Alt Mode.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index 8c09d4c1594d0..2a58a1c3cb640 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c

[ ... ]

> @@ -2916,6 +2965,51 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_c=
fg =3D {
>  	.has_pwrdn_delay	=3D true,
>  };
> =20
> +static const struct qmp_phy_cfg sm8475_usb3dpphy_cfg =3D {
> +	.offsets		=3D &qmp_combo_offsets_v3,
> +
> +	.serdes_tbl		=3D sar2130p_usb3_serdes_tbl,

[ ... ]

> +	.dp_aux_init		=3D qmp_v4_dp_aux_init,
> +	.configure_dp_tx	=3D qmp_v4_configure_dp_tx,
> +	.configure_dp_clocks	=3D qmp_v3_configure_dp_clocks,
> +	.configure_dp_phy	=3D qmp_v4_configure_dp_phy,

[Severity: Medium]
Is the calibrate_dp_phy callback intentionally omitted from this
configuration?

Looking at the other QMP combo PHY configurations in this driver, such as
sm8350_usb3dpphy_cfg and sm8550_usb3dpphy_cfg, they all include this
callback, typically set to qmp_v4_calibrate_dp_phy.

If it is missing, when an external DP monitor requires non-default AUX swing
values, the DRM DP driver's link training retry loop will call
phy_calibrate(). Because calibrate_dp_phy is NULL, this will silently return
0 without writing the new settings, causing the DP retry loop to get stuck
using the same failing initial hardware parameters.

> +
> +	.regs			=3D qmp_v6_usb3phy_regs_layout,
> +	.reset_list		=3D msm8996_usb3phy_reset_l,
> +	.num_resets		=3D ARRAY_SIZE(msm8996_usb3phy_reset_l),
> +	.vreg_list		=3D qmp_phy_vreg_l,
> +	.num_vregs		=3D ARRAY_SIZE(qmp_phy_vreg_l),
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-sm8475-bup=
-v1-0-b2871be2b4ec@proton.me?part=3D6
