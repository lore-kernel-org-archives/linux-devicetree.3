Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C6B352921
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 19:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778268730; cv=none; b=QqnVBk7z6MGHj/QfHuxWnvaSsdrKFf6iimC62h9lWq/i29HtqiWjgDfLvR8zb9u/+ZACdFkVVtV/M8IMwEKMt5yaXu3WqdNtgrBeeaeTJZE7d7p2nER+dqNSiRQdb0Pnc+iG2ayiqkj5ZPtK99eMSXsPts25cMs7WNzJcNx+CYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778268730; c=relaxed/simple;
	bh=YKzSx8KxFZBvMT5ge1nqalozyEpVNAPMZVTauQCnY/c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Te93R440tSzRZjalNHcLaGm25HH0x+VLfpIR8AlO2/CQwWxZDeid6ftczVdhGcPiaVuRXtwEE6xtRKCodfEYy9mirbCI603N28/KAhe6KB9Z7z0ezHoOnXchTpAaomiy0DrSKDOjpPVF2kCdtu0Bi5vz2KZTkDfbVqS9ryhJ3bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZNf3qqi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZNf3qqi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47903C2BCB0;
	Fri,  8 May 2026 19:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778268730;
	bh=YKzSx8KxFZBvMT5ge1nqalozyEpVNAPMZVTauQCnY/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=gZNf3qqi9GVccojrl0vJOQmQwwLlcU7TR58mewcqD9uz5SYsFIfNQ8rIk+darAUaW
	 P3RYw6ia6X09jxW8acxKzpdwhVCvzsZsMnrj2JZG5F6X7fOclSw+B2myQMZRt/3rQl
	 cjL0nXGA4/BEzLa8Yf/bgBlT49FjN52YGhCRC6Y7jkRWaAYwOGAHOXB9cSwPG2/Vb3
	 +bUxzOcFsc9zh3uy6tNB5I89O6LLTGGyETFXS/uhqDaauwEuy9Xw5jkWOpIZr6yYIZ
	 reRXwIXkZvoU7jVMakavfPJN/GHcflzzCH5xtkEqvOUEhPcdBG+Xv/UaIJr3iv7mc/
	 8c1+uHmkaqZZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: Add Shikra pinctrl driver
Reply-To: sashiko@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260508-shikra-pinctrl-v3-2-771144cdc411@oss.qualcomm.com>
References: <20260508-shikra-pinctrl-v3-2-771144cdc411@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 19:32:09 +0000
Message-Id: <20260508193210.47903C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Inconsistent eGPIO (Embedded GPIO) hardware configuration.
--

commit a63bd64b64bae3d595ab0e510830b193aeee7ba6
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

pinctrl: qcom: Add Shikra pinctrl driver

Add pinctrl driver for TLMM block found in Shikra SoC.

> diff --git a/drivers/pinctrl/qcom/pinctrl-shikra.c b/drivers/pinctrl/qcom=
/pinctrl-shikra.c
> new file mode 100644
> index 0000000000000..f063e73e5bbd5
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-shikra.c

[ ... ]

> +#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11)	\
> +	{						\
> +		.grp =3D PINCTRL_PINGROUP("gpio" #id,	\
> +			gpio##id##_pins,		\
> +			ARRAY_SIZE(gpio##id##_pins)),	\
> +		.funcs =3D (int[]){			\
> +			msm_mux_gpio, /* gpio mode */	\
> +			msm_mux_##f1,			\
> +			msm_mux_##f2,			\
> +			msm_mux_##f3,			\
> +			msm_mux_##f4,			\
> +			msm_mux_##f5,			\
> +			msm_mux_##f6,			\
> +			msm_mux_##f7,			\
> +			msm_mux_##f8,			\
> +			msm_mux_##f9,			\
> +			msm_mux_##f10,			\
> +			msm_mux_##f11 /* egpio mode */	\
> +		},					\
> +		.nfuncs =3D 12,				\
> +		.ctl_reg =3D REG_SIZE * id,		\
> +		.io_reg =3D 0x4 + REG_SIZE * id,		\
> +		.intr_cfg_reg =3D 0x8 + REG_SIZE * id,	\
> +		.intr_status_reg =3D 0xc + REG_SIZE * id,	\
> +		.mux_bit =3D 2,			\
> +		.pull_bit =3D 0,			\
> +		.drv_bit =3D 6,			\
> +		.egpio_enable =3D 12,		\
> +		.egpio_present =3D 11,	\

[ ... ]

> +static const struct msm_pingroup shikra_groups[] =3D {
> +	[0] =3D PINGROUP(0, qup0_se0, m_voc, _, phase_flag, _, _, _, _, _, _, _=
),
> +	[1] =3D PINGROUP(1, qup0_se0, mpm_pwr, ddr_bist, _, phase_flag, atest_t=
sens, _, _, _, _, _),

[ ... ]

> +static const struct msm_pinctrl_soc_data shikra_tlmm =3D {
> +	.pins =3D shikra_pins,
> +	.npins =3D ARRAY_SIZE(shikra_pins),
> +	.functions =3D shikra_functions,
> +	.nfunctions =3D ARRAY_SIZE(shikra_functions),
> +	.groups =3D shikra_groups,
> +	.ngroups =3D ARRAY_SIZE(shikra_groups),
> +	.ngpios =3D 166,
> +	.wakeirq_map =3D shikra_mpm_map,
> +	.nwakeirq_map =3D ARRAY_SIZE(shikra_mpm_map),
> +	.egpio_func =3D 11,
> +};

Is the hardware eGPIO configuration completely implemented?

The driver configures .egpio_func =3D 11 in shikra_tlmm and defines
egpio_enable =3D 12 and egpio_present =3D 11 bits in the PINGROUP macro, in=
dicating
that eGPIO is mapped to function index 11.

However, the driver does not define the msm_mux_egpio enum, the egpio_groups
array, or MSM_PIN_FUNCTION(egpio). Instead, it passes the dummy function _ =
for
the 11th mux slot (f11) across all pins in shikra_groups.

Because .egpio_func is non-zero, the core pinctrl-msm driver will actively
clear bit 12 (egpio_enable) of ctl_reg during any pin mux operation if bit =
11
is set.

If the SoC does not support eGPIO and these bits serve another purpose, cou=
ld
this unexpectedly change the hardware state on every pin mux change? Conver=
sely,
if it does support eGPIO, it appears the feature would be unusable because =
it
cannot be selected via the device tree since the function is not exposed.

Could you clarify if eGPIO is intended to be supported on this SoC?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-shikra-pin=
ctrl-v3-0-771144cdc411@oss.qualcomm.com?part=3D2
