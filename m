Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E192640D564
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079965; cv=none; b=jmh/h5uFEOhlEpZFSLMf3ktnonnBKEYjxEZ/XZZlJPQ0YP+v4kGB4SrTysuxORWAcGeVfLUdk4ORc/sBBYLDgup8Go4WhWL1ohTfyvGdbhunCgWQiKYj7hKgjXahQE9+/ahyLC3N+qH3X6U7y/giSWvTW+AUUDkVd/ZZ/gD06oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079965; c=relaxed/simple;
	bh=uey3v178wvBM6mflUSYyAvM/wdqYyQyoVhHSEGuZ71Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p/e8+lxzXC8jXXLqyOfiz4/yBpZGI6GOCTfrtiec2qk6i0avDOItKrTmYqphh9dZAed5eECujrBgXGFTfdH6Oq6hHYyciiDDWfPsTsCzBy4ecsXHXX/Jp6IrttAlYgBEeS5TaSdRU/qT9FS02GDjyU3oGPHbbeGmMIlqokfMP5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eeHa93M8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eeHa93M8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCB61F00893;
	Wed, 10 Jun 2026 08:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781079964;
	bh=cRggMLT+rUlz6l8KsEwcxklGmlUb3uPE+MEnS/k5oYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eeHa93M8l5JH8wkGLYq8w24sgZJYtC/pWVM74gY2B91VZjsx8RsoBPPJupGnpK2eU
	 f8hDNEWnVQEiD+pe6jN64D3bS+8wcbhot2pZTW4NmkjaY+I2f9HKi2MoavZ5h4DrFb
	 Suj4hoRW6dRZMmZAGHyK7KZu7R9v4l7Yt3/Xab+zwrqkmyJi4MXBVlkCJeu0DiKTxC
	 y63j/gGQmmPct3woJb8VcsbyO5sa9i195pKkD461h9+ewa9vwRpJ1J1w4PgJ0iShzj
	 4lL+OPoy9LV/boS5PECpBV7xJR+zj4O7KjCYSKS3CDJ/oSqhQ7qCrqpUbQQbkjvmrq
	 P7YMfAPDTqToQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] clk: amlogic: Add A9 peripherals clock
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jian Hu via B4 Relay" <devnull+jian.hu.amlogic.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260610-a9_peripherals-v3-2-d07a78085f71@amlogic.com>
References: <20260610-a9_peripherals-v3-2-d07a78085f71@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 08:26:03 +0000
Message-Id: <20260610082604.4DCB61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added Kconfig symbol `COMMON_CLK_A9_PERIPHERALS` impli=
es a non-existent config symbol `COMMON_CLK_A9_PLL`.
--

commit 01c948d65d7fdd0d90013ab36dfe236bd635347c
Author: Jian Hu <jian.hu@amlogic.com>

clk: amlogic: Add A9 peripherals clock controller driver

This commit adds the peripherals clock controller driver for the Amlogic A9=
=20
SoC family. It introduces the COMMON_CLK_A9_PERIPHERALS Kconfig symbol and=
=20
the corresponding driver source.

> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -132,6 +132,21 @@ config COMMON_CLK_A1_PERIPHERALS
>  	  device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>  	  controller to work.
> =20
> +config COMMON_CLK_A9_PERIPHERALS
> +	tristate "Amlogic A9 SoC peripherals clock controller support"
> +	depends on ARM64 || COMPILE_TEST
> +	default ARCH_MESON
> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_CLKC_UTILS
> +	select COMMON_CLK_MESON_DUALDIV
> +	select COMMON_CLK_MESON_VID_PLL_DIV
> +	imply COMMON_CLK_SCMI
> +	imply COMMON_CLK_A9_PLL

[Severity: Medium]
Does the COMMON_CLK_A9_PLL config symbol exist?=20

Looking through the Kconfig files, there doesn't appear to be a definition=
=20
for COMMON_CLK_A9_PLL anywhere in the tree. While an unresolved imply doesn=
't
cause a hard build failure like select or depends on, it has no effect and
might indicate a missing PLL driver in this patch series or a typo in the=20
symbol name.

> +	help
> +	  Support for the peripherals clock controller on Amlogic A311Y3 based
> +	  device, AKA A9. Peripherals are required by most peripheral to operat=
e.
> +	  Say Y if you want A9 peripherals clock controller to work.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-a9_periphe=
rals-v3-0-d07a78085f71@amlogic.com?part=3D2
