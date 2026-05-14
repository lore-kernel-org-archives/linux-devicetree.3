Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6143030E828
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778786362; cv=none; b=YiSJaYhuEqpi4xjN8nwBEwRu01UOn7o076NYmLVrjXaKucnsyItkFkaeesTZvc3lp/FkfkT9KLzzHusXaxrYel6a6HzKXfkcL0IvSCvDSLzz5R6aYxRUxvfjUTTlxRdnHeOLEt/bkDFbjhaGukEsMd7P41FHlk6lQxeW5zpOcfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778786362; c=relaxed/simple;
	bh=rNkmQVbVuzDlD1b5+wJAldVxgH0elvM0aofWP2yjljs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R7a9dhSaYxnSKpwGxJDLXaRxThzXCV0OffK4jfRd1d/Vl65E2f15d03BwK/gM6g1tmpSZN+qkbHyv8v7fVmOv21UOP87fRmlS0CswTUaPwGGPa+3WwMQpsJuHEGB2p/i/cJVZ2dsi6mtsFjlbORTX5FMRxXnalprquJa0XD9XX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgA+e2Gb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgA+e2Gb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57AEC2BCB3;
	Thu, 14 May 2026 19:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778786362;
	bh=rNkmQVbVuzDlD1b5+wJAldVxgH0elvM0aofWP2yjljs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=XgA+e2GbnyP9NuzR8SvTxxvG/E75vAFgvjmb15gl9qsIh+sm4deZjBrl06l12L2RU
	 V7vlObVBCA3eBS0jJAs7WLZZ4WhO+gh72gAGinGIIQuJ/mAKwY80RHn56xb3m6etkC
	 ZjxtPJh3SYeNe8alLEHlzKm0ptfhbQ0k4yQt6J8vefe+T9VR6l+IWaclABQcrSlb/F
	 tJ1nqiJ5NSAFLktKQyoQi0tx/b4UfzJp7x0mswrFcEEQzwDYM5/18WlAaJHk3mSOWx
	 p6AIhWhxAr9ASkaoYFzWghKYK/ozleq7yFt5/RCKmvv2DZaGMRnDojFcu2i8ryMQy3
	 mDKj/TZemM+Ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] clk: eswin: Add eic7700 HSP clock driver
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260514114533.1376-1-dongxuyang@eswincomputing.com>
References: <20260514114533.1376-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 19:19:21 +0000
Message-Id: <20260514191921.C57AEC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The Kconfig entry `COMMON_CLK_EIC7700_HSP` is missing a `select RE=
GMAP_MMIO` dependency, causing linker errors under `COMPILE_TEST`.
--

commit 1a3c5e0ea14d621d30772ac99cb5372fe67c5d6f
Author: Xuyang Dong <dongxuyang@eswincomputing.com>

clk: eswin: Add eic7700 HSP clock driver

This commit adds the ESWIN EIC7700 high-speed peripherals system clock
controller driver and registers an auxiliary device named hsp-reset.

> diff --git a/drivers/clk/eswin/Kconfig b/drivers/clk/eswin/Kconfig
> index 0406ec499ec9c..e6cc2a407bac8 100644
> --- a/drivers/clk/eswin/Kconfig
> +++ b/drivers/clk/eswin/Kconfig
> @@ -13,3 +13,15 @@ config COMMON_CLK_EIC7700
>  	  SoC. The clock controller generates and supplies clocks to various
>  	  peripherals within the SoC.
>  	  Say yes here to support the clock controller on the EIC7700 SoC.
> +
> +config COMMON_CLK_EIC7700_HSP
> +	tristate "EIC7700 HSP Clock Driver"
> +	depends on ARCH_ESWIN || COMPILE_TEST
> +	select AUXILIARY_BUS
> +	select COMMON_CLK_EIC7700
> +	select RESET_EIC7700_HSP if RESET_CONTROLLER

Does this Kconfig entry need to select REGMAP_MMIO?

The driver calls devm_regmap_init_mmio() in eic7700_hsp_clk_probe(). When
building under COMPILE_TEST on configurations where no other component
coincidentally selects REGMAP_MMIO, this can result in an undefined
reference to __devm_regmap_init_mmio_clk linker error.

> +	help
> +	  This driver provides support for clock controller on ESWIN EIC7700
> +	  HSP. The clock controller generates and supplies clocks to high
> +	  speed peripherals within the SoC.
> +	  Say yes here to support the clock controller on the EIC7700 HSP.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514114212.903-=
1-dongxuyang@eswincomputing.com?part=3D2
