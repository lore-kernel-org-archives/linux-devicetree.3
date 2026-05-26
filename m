Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8FE3BB11A
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788482; cv=none; b=BYR4EZmSTjWLC3LUGr3Lbzr2yKvMUMM27ZkOMesLEdlncP/8zljD9mtm0kYf7uRBpLqPLQct12PbfAkyg0wd8Kz1b/2sLPD4a0jKcmwpnHNkr+tQ6wMzXWvig0LpuApdfqgGpg17b9sDnO2a0oYOk2upa8HZUun7EIIqqZQUbRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788482; c=relaxed/simple;
	bh=u64tOcTr+8uUyNps3K7w7wfojmRfgFJziXw4H5f+xBw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tcQ5LsDO8ORbCXvoagGCabeWp5Stl1Hgs5e0fETmGwPauB/Fa3GW6JhQNwPW46H+ro3AWqh7suB+iTDmxTJ3hdhNskh3cu54EfwFwti5MEhm0bsFFhPJ19iTNLJSTq8YaK7vWaxqnTZQ9iHVz7qKra40UXqQ/KcpkaYfJv2UvU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RuZQOuW2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RuZQOuW2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86E11F000E9;
	Tue, 26 May 2026 09:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788481;
	bh=NicyDQ0j27nz6Xf0FG9e7NvFWyBfV217bnLefxf0H+c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RuZQOuW2sYnkv/mdE0Sj/R7Cmq9hdFeb7W6DGfeE6vpyhBr66FXRDMKyWPsvqxLT7
	 5zkcANDBJYDiyrVD+0IuQfqWzJfcD7NW7qqvutRXpIKDwevaT4rLxsiaoWKb0y3Dqm
	 kT/OWBleREwnVelV4wWgRb+P+pFAuhVflYcKw6hr55goxx25kmCsClEuWoeKQMxTp7
	 G5KoukyOXC3w5MG+OrRDc2pQ+EzUWouDPO5RCLNKAg33evEKGcW3rvh7jX2x53tdi6
	 tJV57u7aCol0LIkDuBsqcedCzZjakcyRtXo+e5r9Tv329JPqkDXVbk0XwTi1UuJoE6
	 pM3pTQDlNywCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/7] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics f4 boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrice Chotard" <patrice.chotard@foss.st.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526-upstream_uboot_properties-v7-1-e17cd424d5db@foss.st.com>
References: <20260526-upstream_uboot_properties-v7-1-e17cd424d5db@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 09:41:19 +0000
Message-Id: <20260526094120.B86E11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The `&sdio` controller nodes are missing the `bootph-all` property=
, contradicting the stated goal of supporting SD boot.
- [Medium] The `bootph-all` flag is missing for the clock nodes (e.g., `&cl=
k_hse`) in `stm32f469-disco.dts`.
- [Medium] UART controller nodes are omitted from `bootph-all` tagging desp=
ite the commit message claiming otherwise.
- [Low] The `bootph-all` property is incorrectly added to the LCD-TFT displ=
ay controller (`&ltdc`) in `stm32f469-disco.dts`.
- [Low] A duplicate `&rcc` node reference is created in `stm32f469-disco.dt=
s`.
--

commit 7a940b6d4b0cb2432e629736b8cac85e1dd3638f
Author: Patrice Chotard <patrice.chotard@foss.st.com>

ARM: dts: stm32: Add boot phase tags for STMicroelectronics f4 boards

This commit introduces the bootph-all flag to several device tree nodes acr=
oss
STM32 f4 boards. It targets nodes like timer, gpio, syscfg, clock, and uart
to ensure they are present during all boot stages for SD boot support.

> diff --git a/arch/arm/boot/dts/st/stm32429i-eval.dts b/arch/arm/boot/dts/=
st/stm32429i-eval.dts
> index f4b1c4eb64f28..8a08b9f6b8371 100644
> --- a/arch/arm/boot/dts/st/stm32429i-eval.dts
> +++ b/arch/arm/boot/dts/st/stm32429i-eval.dts
[ ... ]
> @@ -293,6 +358,10 @@ &sdio {
>  	max-frequency =3D <12500000>;
>  };

[Severity: High]
The commit message states the goal is to ensure SD boot, but the &sdio node
does not receive the bootph-all tag here. Will this cause the SDIO controll=
er
to be stripped from the SPL device tree and break early SD boot capabilitie=
s?

> =20
> +&syscfg {
> +	bootph-all;
> +};
> +
>  &timers1 {
>  	status =3D "okay";
[ ... ]
> @@ -339,6 +409,16 @@ &usart1 {
>  	status =3D "okay";
>  };

[Severity: Medium]
The commit message mentions adding the tag to uart nodes. While the pinctrl
configuration for the UART receives the tag below, the core &usart1 node do=
es
not. Could this result in the UART controller being omitted during early bo=
ot
stages, breaking early console initialization?

> =20
> +&usart1_pins_a {
> +	bootph-all;
> +	pins1 {
> +		bootph-all;
> +	};
[ ... ]
> diff --git a/arch/arm/boot/dts/st/stm32f469-disco.dts b/arch/arm/boot/dts=
/st/stm32f469-disco.dts
> index 943afba06b5fe..ecd33d6003b34 100644
> --- a/arch/arm/boot/dts/st/stm32f469-disco.dts
> +++ b/arch/arm/boot/dts/st/stm32f469-disco.dts

[Severity: Medium]
The commit message states the bootph-all flag is added to clock nodes, and
other boards in this patch update their &clk_hse nodes. Is it missing for
the &clk_hse node in stm32f469-disco.dts, and might this cause the clock to=
 be
stripped out during early boot?

> @@ -181,7 +181,52 @@ dsi_panel_in: endpoint {
[ ... ]
>  &ltdc {
> +	bootph-all;
>  	status =3D "okay";
> =20
>  	port {

[Severity: Low]
Does the LCD-TFT display controller need to be present in early boot phases
like SPL or TPL? Including it might needlessly inflate the device tree size
in SRAM, as display initialization isn't typically required for SD boot.

> @@ -191,10 +236,26 @@ ltdc_out_dsi: endpoint {
>  	};
>  };
> =20
> +&pinctrl {
> +	bootph-all;
> +};
> +
> +&pwrcfg {
> +	bootph-all;
> +};
> +
> +&rcc {
> +	bootph-all;
> +};

[Severity: Low]
Does appending this new &rcc block create a duplicate node reference? Since
an &rcc block already exists earlier in the file, would it be better to add
this property to the existing block to keep related properties grouped
together?

> +
>  &rtc {
>  	status =3D "okay";
>  };
[ ... ]
> @@ -252,6 +314,16 @@ &usart3 {
>  	status =3D "okay";
>  };

[Severity: Medium]
Similar to the &usart1 node in stm32429i-eval.dts, the core &usart3 node he=
re
is missing the bootph-all tag, even though the pins below receive it. Should
the uart node itself be tagged to ensure it is preserved during early boot?

> =20
> +&usart3_pins_a	{
> +	bootph-all;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-upstream_u=
boot_properties-v7-0-e17cd424d5db@foss.st.com?part=3D1
