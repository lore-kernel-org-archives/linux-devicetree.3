Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A584353A74
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 15:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932112; cv=none; b=c0dTYITNv25WowDsnWyKb0xqMSuRZdjc9A15jzc1ctvFJf0LHVZvvkI4/LsKpYalgfDp2j6vdgNWVsEJbeOspbNNxbmPhJ6/G4cky5UkrY1YSvn0JGMAf3cagBMm0zdNkZjy9HdRXIQgM/pwvOcOSwEuK3YwY7Unr7jZCHbxkmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932112; c=relaxed/simple;
	bh=Tcra88jPl3fPajJLYPrZUE6LgBK8Mpbmuh1t28zZJNU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oB3CQBPpz6/2qdKyt+lv4QKI2Nd0NDtmDV16QzdrQb1qsG9IwXcRS9kCKVqrLSc5IuruYdKhofPdQ6dU8l3i9CPMlGIbIeOermAOetnUPb83fIl34qfsx9ZGXeTpFkXy9tkW3VzH08kpYyB67ya+EWxJEga7a+j8h/s6Ly3ciHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HonSvlMn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HonSvlMn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E0D1F000E9;
	Fri, 28 Aug 2026 15:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787932099;
	bh=d7o6sRYdXNeCLOMLbmkHpT9lp8mjc5NmdDGHDfgzeWw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HonSvlMnLMaC5nD/bEuGgfhgNcJVFbFpC3Dt5CMsp28KXEW2vX8mazS775ehQOtq7
	 qRslubbXQw5Ua4lOAC3TtrUs/K5uvaPHAr1kLBitUMNVvqjZiDqOqpCCPQk1U6xJCm
	 shvG6yQhExiQs7JJdVRZquMs58U9+YAM/mERd6xjXZKxjIJ7DbAk2hvquidIn4JrbQ
	 v1sgy93/aM3s+gI+ako7hAnrfDlxU+FJZc9Qu82ZTqnh2N/6EGDQZ2ttZLfM/YidU1
	 gZlHa6FSyujrGf43G9fnSWqbVyrPaewRK20QwRX8b323SJGFCECaUg6NqosLfV6Z2T
	 cI++qyMUBx98Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] pinctrl: airoha: add support of en7528 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmed Naseef" <naseefkm@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <ea5b2ce921364ceab9a76606c016e3a0781b46b9.1787931313.git.naseefkm@gmail.com>
References: <cover.1787931313.git.naseefkm@gmail.com>
 <ea5b2ce921364ceab9a76606c016e3a0781b46b9.1787931313.git.naseefkm@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 15:48:18 +0000
Message-Id: <20260828154819.48E0D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing pinmux support for routing multiplexed pins 0-39 back to=
 GPIO or PWM functions.
--

commit 0726ac69786f503cb07357f6d0de45f2418a4be1
Author: Benjamin Larsson <benjamin.larsson@genexis.eu>

pinctrl: airoha: add support of en7528 SoC

The commit adds pin controller and GPIO driver support for the EcoNet EN7528
SoC, which shares driver code with Airoha SoCs but has a different register
layout.

> diff --git a/drivers/pinctrl/airoha/pinctrl-en7528.c b/drivers/pinctrl/ai=
roha/pinctrl-en7528.c
> new file mode 100644
> index 0000000000000..f6c8f834421f7
> --- /dev/null
> +++ b/drivers/pinctrl/airoha/pinctrl-en7528.c
[ ... ]
> +static const struct airoha_pinctrl_func_group gpio_func_group[] =3D {
> +	AIROHA_PINCTRL_GPIO("gpio40", GPIO_PCIE_RESET0_MASK),
> +	AIROHA_PINCTRL_GPIO("gpio41", GPIO_PCIE_RESET1_MASK),
> +};

[Severity: Medium]
What happens if the bootloader configures pins 0-39 to an alternate functio=
n?

Since the driver only defines the GPIO function for pins 40 and 41 in
gpio_func_group, there doesn't seem to be a way to clear the IOMUX bits in
REG_PON_I2C_MODE to route multiplexed pins 0-39 back to their GPIO function
if they were left in an alternate state by the bootloader.

[ ... ]
> +/* PWM - AIROHA_PINCTRL_PWM and AIROHA_PINCTRL_PWM_EXT are shared */
> +#define AIROHA_PINCTRL_PWM(gpio, mux_val)		\
> +	{						\
> +		.name =3D (gpio),				\
> +		.regmap[0] =3D {				\
> +			AIROHA_FUNC_PWM_MUX,		\
> +			REG_GPIO_FLASH_MODE_CFG,	\
> +			(mux_val),			\
> +			(mux_val)			\
> +		},					\
> +		.regmap_size =3D 1,			\
> +	}						\
> +
> +#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)		\
> +	{						\
> +		.name =3D (gpio),				\
> +		.regmap[0] =3D {				\
> +			AIROHA_FUNC_PWM_EXT_MUX,	\
> +			REG_GPIO_FLASH_MODE_CFG_EXT,	\
> +			(mux_val),			\
> +			(mux_val)			\
> +		},					\
> +		.regmap_size =3D 1,			\
> +	}						\
[ ... ]
> +static const struct airoha_pinctrl_func_group pwm_func_group[] =3D {
> +	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
[ ... ]
> +	AIROHA_PINCTRL_PWM_EXT("gpio28", GPIO28_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio29", GPIO29_FLASH_MODE_CFG),

[Severity: Medium]
Will PWM override the alternate function for these pins?

The macros AIROHA_PINCTRL_PWM and AIROHA_PINCTRL_PWM_EXT only set the PWM
enable bit but fail to clear the primary IOMUX bit.=20

If the bootloader sets an alternate function on one of these pins, the driv=
er
fails to clear the alternate function bit in REG_PON_I2C_MODE, leaving the
pad disconnected from the PWM controller.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787931313.gi=
t.naseefkm@gmail.com?part=3D3
