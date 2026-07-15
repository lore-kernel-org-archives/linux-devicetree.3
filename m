Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9ED3C1961
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099874; cv=none; b=turDme4PE/7b/m2TMDWDlTcxMXqG3b4s606v/Yx5tuJMc84ojsp22aecz68nfOW793+sSGczP27Bgbmd1+PxHyweO3xy47CVIPc02SmrCZs/eLUMcjIhRLlSzxEOvF6Tv17nZwnZTaZjil9L1svFM0EEOPxRuNL9LVo+9a7y+jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099874; c=relaxed/simple;
	bh=zru9VGkGso8Yd5tNOlGn2LB+qSs1fCvjD2GqsVl4sdI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kuhFqrbRngwS5v2/Dv5bu+e3jaKzguUiPkseBwvV14vZkgBKuyL+pijX226+zp351mZlW+T/XWHYqVIqBHWt9kc/r6fso8NQO2CniAlpaDSbvp7pcQgr/C9UoRi4MwbCOEU0j2b/duD+Hwlctv0OFU2UQdSE27wQ0HQn/0aNiBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjXoaiLa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjXoaiLa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BFDD1F00A3A;
	Wed, 15 Jul 2026 07:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784099862;
	bh=hFhJs0y5X0H6FtuJTRBdyVP4BWXv3CWXssiSLcCfi8A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gjXoaiLaekWbr6Xo61Y/NJkra4Za30CL7WTXJ1m0IhxpWkbwI4O50XJn3YQlAkRRP
	 aZLKK40QDOowiWLo6w13eUuAGuEV5PfSLCrPGZp7puXpiBH/axJdLMut5sB8Z3PqA/
	 /pXU0/+VQJveLvkpHHtM34xAe/09l5tCnBuLUY8rBGyoSjd00HDNsTp2BFEKRAlEnN
	 v8dV7mdQHmITW8+C9i+cpWplbh9T5aLYP+HAjYfD4npHL1DD9TkLrRMzO5ZOilmKZe
	 9KBbyh8Q+Qg1wEgZxptDEgL7XDlse20ibCFEgcnsROnZEAR0yV/qQcIDv5KRhKxxkB
	 mRUbXhWw/5GYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] phy: qcom: qmp-combo: Add SM8475 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com
In-Reply-To: <20260715-sm8475-bup-usbss-v2-3-2d8def39b190@proton.me>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me>
 <20260715-sm8475-bup-usbss-v2-3-2d8def39b190@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 07:17:42 +0000
Message-Id: <20260715071742.6BFDD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `.calibrate_dp_phy` callback in `sm8475_usb3dpphy_cfg`.
--

--- Patch [3]: [PATCH v2 3/3] phy: qcom: qmp-combo: Add SM8475 support ---
commit a0a582462db23366fd325689e39f4bf172d270ca
Author: Esteban Urrutia <esteuwu@proton.me>
phy: qcom: qmp-combo: Add SM8475 support

This commit adds support for the SM8475 SoC to the QMP combo PHY driver,
including RX and PCS USB tables, and new v1 PLL tables.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index 699c71876912a..11a67cecf29d5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c

[ ... ]

> +static const struct qmp_phy_cfg sm8475_usb3dpphy_cfg =3D {
> +	.offsets		=3D &qmp_combo_offsets_v3,

[ ... ]

> +	.dp_aux_init		=3D qmp_v4_dp_aux_init,
> +	.configure_dp_tx	=3D qmp_v4_configure_dp_tx,
> +	.configure_dp_clocks	=3D qmp_v3_configure_dp_clocks,
> +	.configure_dp_phy	=3D qmp_v4_configure_dp_phy,
> +
> +	.regs			=3D qmp_v6_usb3phy_regs_layout,

[Severity: Medium]
Does this configuration intentionally omit the .calibrate_dp_phy callback?

Other DP configurations in this driver, such as sm8550_usb3dpphy_cfg, assign
this to qmp_v4_calibrate_dp_phy. Without it, when DP Alt Mode link training
fails, qmp_combo_dp_calibrate() will see a NULL callback and silently retur=
n 0.

This skips the DP AUX PHY calibration process which cycles through different
AUX configuration settings. Could this cause DisplayPort Alt Mode to fail
negotiating with some monitors or cables?

> +	.reset_list		=3D msm8996_usb3phy_reset_l,
> +	.num_resets		=3D ARRAY_SIZE(msm8996_usb3phy_reset_l),
> +	.vreg_list		=3D qmp_phy_vreg_l,
> +	.num_vregs		=3D ARRAY_SIZE(qmp_phy_vreg_l),
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-sm8475-bup=
-usbss-v2-0-2d8def39b190@proton.me?part=3D3
