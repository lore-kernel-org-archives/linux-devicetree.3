Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619971;
	b=QLg6ijqCsLmq/IW4q15pYozZuaOCVWjqLf26FJUkD2cRfWnakSStGXTOByNHmcoM4et5
	 ItNuvucZFoO2U7SP/PoOCRPdTfXginimGnXAbIieQLhtbNAR1PAXdTe5T6BQjsZh9pZaZ
	 T9AhV8gR6TK2EZAbLnoWxyb5CFDan6HeGK05Zz1UH9XAb9hp6LPYbdve0alie/owUe8Yl
	 Oz/tytwoZ6bF/EccdM84YBvS8Wiof9LBGshw7Pp8JXpoM+mzicB6l/SXi9C/R9IIhFLZn
	 bSTI3OtOMpqJbyHqT2j+eBvB0EUC+69G7RX1+ydkrGu4cy0YNSNw/gOPTQ0RhHI3ZeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619971;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=W+bKe5Uvyv/Fe2ZzY1j52AWgnUVUsCe8caXkT555J9g=;
	b=C+dsqIOOtnIBpFd7LKOKAIUuCXeNsIukbM8XUY6SCPuBtUn6kN+ZB0pIRwRYg3bgKVYC
	 YYoRAcDIVGNhnOzbnbDWNmR/WyzYjsYj5sGkStN/1RgQefE5zLI9icv+fQQ3G5fBeO0Uc
	 PG9aY201PihiCFgh4Tej3bkZYCMF8eZDh3BC0KiTz8n8eqMegZMGtNncZMARUR1QCca6J
	 abWyFZhqEvjrcqkKILKCOs7wY2oDu6ScwAzTdMar59/9/h5xgR0Nm3WdzmLAxUUFm/Qm3
	 PvyRWaaLwqeCJfPJxOxWjm2cbS+0/XgKc9wyVS/gM5y+/iUvs0aSM0AniCaux9QG7rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EpBuUu8m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F0D606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EpBuUu8m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476041F000C4;
	Wed, 25 Nov 2026 15:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795619970;
	bh=W+bKe5Uvyv/Fe2ZzY1j52AWgnUVUsCe8caXkT555J9g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EpBuUu8mJwbTLlgxEenbJctcxF8f/47L3x8cBL2pfYKkd8l8h5ayRZHnxXaWgLmuR
	 zMDvXEI+s4VRb+zvnZ7phGoEjU4mU/N/LHLLStznjmA02Y1Gv+Atz8Pbx1SoRDF08Z
	 ETziuDWM9/Q4hKcS6xA17eFkFbcR+kl1hajpCCOj2Ksmu2V40eybhsHp1CzCCbUZsL
	 0WZYuKvA4FUD8GaKfcBi9DRv4kpOW27vPS5v0yU1wBDiQ7WwJBDY/xS+f1AGMyPh5m
	 SXcOkC8C1buLppxoaMKNOcY3rIOr2a3nEsfIJu8frcm+PMX/CoawLc1UzgFUnM7xAt
	 dkmi0GcP8MZHA==
Message-ID: <sashiko-outbox-233646@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] interconnect: qcom: Add Netrani RPMh
 interconnect support
Reply-To: sashiko-reviews@lists.linux.dev
To: SignKirigami <prcups@krgm.moe>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-netrani-interconnect-v2-v2-2-4eab92854137@krgm.moe>
References: <20261125-netrani-interconnect-v2-v2-0-4eab92854137@krgm.moe>
 <20261125-netrani-interconnect-v2-v2-2-4eab92854137@krgm.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 15:19:29 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] interconnect: qcom: redundant defconfig change in Netrani driver
  commit
--

commit 44f45c0d3fd1f7986edabf6617707a9e7339a9db
Author: SignKirigami <prcups@krgm.moe>

interconnect: qcom: Add Netrani RPMh interconnect support

This commit adds an RPMh interconnect provider driver for the Qualcomm
Netrani platform.

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 6ec8d3a69c98e..ff46c6915ef4c 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1875,6 +1875,7 @@ CONFIG_INTERCONNECT_QCOM_KAANAPALI=3Dy
>  CONFIG_INTERCONNECT_QCOM_MSM8916=3Dm
>  CONFIG_INTERCONNECT_QCOM_MSM8953=3Dy
>  CONFIG_INTERCONNECT_QCOM_MSM8996=3Dy
> +CONFIG_INTERCONNECT_QCOM_NETRANI=3Dy
>  CONFIG_INTERCONNECT_QCOM_OSM_L3=3Dm
>  CONFIG_INTERCONNECT_QCOM_QCM2290=3Dy
>  CONFIG_INTERCONNECT_QCOM_QCS404=3Dm
> diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qco=
m/Kconfig
> index 7f3a977e8f10b..73b4e8285a0a0 100644
> --- a/drivers/interconnect/qcom/Kconfig
> +++ b/drivers/interconnect/qcom/Kconfig
> @@ -158,6 +158,19 @@ config INTERCONNECT_QCOM_MSM8996
>  	  This is a driver for the Qualcomm Network-on-Chip on msm8996-based
>  	  platforms.
> =20
> +config INTERCONNECT_QCOM_NETRANI
> +	tristate "Qualcomm Netrani interconnect driver"
> +	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
> +	depends on ARM64 || COMPILE_TEST
> +	select INTERCONNECT_QCOM_RPMH
> +	select INTERCONNECT_QCOM_BCM_VOTER
> +	default ARCH_QCOM
> +	help
> +	  Support for the RPMh interconnect fabrics on Qualcomm Netrani.
> +	  This driver describes the paths between bus masters and memory
> +	  and applies bandwidth votes through RPMh as clients request them.
> +	  Enable it for peripherals that use these interconnect paths.
> +

[Severity: Low]
Is the arch/arm64/configs/defconfig change needed here?

INTERCONNECT_QCOM_NETRANI has "default ARCH_QCOM", and CONFIG_ARCH_QCOM=3Dy
is already enabled in arm64 defconfig, so savedefconfig will drop
CONFIG_INTERCONNECT_QCOM_NETRANI=3Dy.  Arm64 defconfig updates are also
normally sent as separate patches through the SoC tree to avoid cross-tree
merge conflicts with subsystem trees.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-netrani-in=
terconnect-v2-v2-0-4eab92854137@krgm.moe?part=3D2
