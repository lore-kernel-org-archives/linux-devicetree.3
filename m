Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDDE3BC68E
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782787758; cv=none; b=qaEt1hZDNQyNe4G8ZSpc5gjqdIQlzqHm1NYWWeUjLPRSoRgdMsnyjyArpGpofiVf5Rk2+CS8FQf4Md3nL01tl19fQ76ub5DR64j1TbuARKxztccAJoC8qgoRpKYkNQoJg/zTJIHxWJ8dnoG4jRPg//DHyGsei/SOAVPbIdXYnuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782787758; c=relaxed/simple;
	bh=haduT/vq31mhh7Y2FJsH5SFyASmZIzzla2ftry9KEbk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cNKYor/zLkZzWdr88OxDwRNiyL7lDnexavwc40susVPyTbwBY4pvemRugB8txq1ZSmePjpqUUg9RKTjUEsF3cHeAzKEKXKtLW6r1AqelXBx1pnVduLyQV/n41k1LQ7wsUeWikCZJcB/D93GqzNHcVt/l8TJNMorO0Nov5TRd/Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnOhJoWv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnOhJoWv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9971F000E9;
	Tue, 30 Jun 2026 02:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782787756;
	bh=5YS2XUlEvVcUkPDZiWjVK7gB7qY2+dJUTkoUV+Xa4Eo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HnOhJoWviXP3xnZJBXengjeS0jAK6Q7X718Hx7gXvN5h26vQOtvX5ZIx6kHSHECON
	 OsFjZTdQ6ONbdMv/OVAjOxLf5mgKttlx6pQa+HFYXjkTGl6VLnb99x17TS2JZlROYm
	 CYYqrteIGTTzSgttIW1oCYjusnMDkGaxYxBtah2nnpDEj7ZVAFbFNJHOhLy4NE8yA8
	 7pNG/8HcWYOJX9y+xyQN42a8UNifN4Qj2XRfYR/LMKKugoy/TdAsFx2Ohuij0NrwJF
	 PbOxrYR8HHlBzctO1jsF+k4j1A9DxSYRQlqOWaR5zOW9DAPHMNNEUDDawKhEZMn3qQ
	 FfZSY6oeT0Znw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] clk: amlogic: Add A9 peripherals clock
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jian Hu via B4 Relay" <devnull+jian.hu.amlogic.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260630-a9_peripherals-v5-2-bc4019730354@amlogic.com>
References: <20260630-a9_peripherals-v5-0-bc4019730354@amlogic.com>
 <20260630-a9_peripherals-v5-2-bc4019730354@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 02:49:16 +0000
Message-Id: <20260630024916.7C9971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The Kconfig symbol COMMON_CLK_A9_PERIPHERALS implies the non-exi=
stent symbol COMMON_CLK_A9_PLL.
--

commit 4ac705194c44e52e50be696d549cd67fcfe58042
Author: Jian Hu <jian.hu@amlogic.com>

clk: amlogic: Add A9 peripherals clock controller driver

This commit adds the peripherals clock controller driver for the Amlogic
A9 SoC family.

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
Does the config symbol COMMON_CLK_A9_PLL exist in the kernel tree?=20
Referencing a non-existent symbol in an imply statement will silently fail
to pull in the expected dependency during configuration. Is it possible this
config was missing from the patch series, or is this a typo?

> +	help
> +	  Support for the peripherals clock controller on Amlogic A311Y3 based
> +	  device, AKA A9. Peripherals are required by most peripheral to operat=
e.
> +	  Say Y if you want A9 peripherals clock controller to work.
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-a9_periphe=
rals-v5-0-bc4019730354@amlogic.com?part=3D2
