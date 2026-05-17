Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F238333987
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041611; cv=none; b=KjQXdGFNl7J/lJUWasVvFmLElKzdMIAxCkayooUeU/kJC8EynPuFm7UYSqMjoZKgWzv43iDDHqXJ4Gf99rKjIRy743VJE3zmEPC2RxQ/oRsWRSLlgr7tzCMX4gZJ5TQz8J6W7BwU1cWn764knwmUnfKIfFhMcctYk+D9Yi+RSGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041611; c=relaxed/simple;
	bh=7Zu2B0Ix76TrHZ0u21xpCCpw+rLg2pprTD16BQkoRb4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SAqdNIvwlCL7bw+9CNgVu6ex4cEuV1fvMuz7iT0BDcVvIeEwxwJYgz3gF/E6cz2kXSXXQfstepff4+uxSZO9Eeq4dVIHTuZiAeT7vMk4tMwhJgsyPpUZV9+kqVVEIk1KtvTVZWLiMmWu8FG26i0mTmMN2nIWdCR2qWEPDZefLu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzs9V6Bn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzs9V6Bn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE4AC2BCB0;
	Sun, 17 May 2026 18:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779041610;
	bh=7Zu2B0Ix76TrHZ0u21xpCCpw+rLg2pprTD16BQkoRb4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=pzs9V6BnZm5VMC9qLiaND2o5Y7SMvNbFtLuukZie2qwltynckXM8l12oYoU908VQj
	 6gX4rkRelwRh28HSG3jzSAR+PNVOBFVscGrNyH21jJESsjyKJkWYkdIhz9DFKQfeAE
	 oFAiupcrizFZXdS3g8/OLMIJZRHpyzalX6prft7mQvq6SVMBnOwHMHitViAe/1zhmR
	 9UvAdIeWXluZUh/CR1h+hL9POdVVcgBsf3JbDu4FvMvMLLsHm1dPHqPEkZd1OZloLS
	 ZmbcSmAVrLkfAQn4ZZEGH/KekVVyWlAlVGTMuOYYTmKMkP3ia8cpW4qRGNIS7a9tbL
	 jXndXthBXLbsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jagadeesh Kona" <jagadeesh.kona@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 18:13:29 +0000
Message-Id: <20260517181330.5AE4AC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] CLK_GLYMUR_CAMCC sets 'default m if ARCH_QCOM', but related configs=
 for the same SoC (CLK_GLYMUR_DISPCC, CLK_GLYMUR_GCC) do not follow this pa=
ttern.
--

commit 22b429ddff7c202cf3781d6d957f45cbf3575c19
Author: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

clk: qcom: camcc-glymur: Add camera clock controller driver

Add support for the camera clock controller for camera clients
to be able to request for camcc clocks on Glymur platform.

> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index df21ef5ffd686..754c3b823f3f8 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -45,6 +45,17 @@ config CLK_ELIZA_TCSRCC
>  	  Support for the TCSR clock controller on Eliza devices.
>  	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
> =20
> +config CLK_GLYMUR_CAMCC
> +	tristate "Glymur Camera Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_GLYMUR_GCC
> +	default m if ARCH_QCOM

Is this default intentional? Looking at related configs for the same SoC fa=
mily
like CLK_GLYMUR_DISPCC below, they do not appear to follow this pattern of
setting "default m if ARCH_QCOM".

> +	help
> +	  Support for the camera clock controller on Qualcomm Technologies, Inc
> +	  Glymur devices.
> +	  Say Y if you want to support camera devices and functionality such as
> +	  capturing pictures.
> +
>  config CLK_GLYMUR_DISPCC
>  	tristate "Glymur Display Clock Controller"
>  	depends on ARM64 || COMPILE_TEST

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517-glymur_cam=
cc-v4-0-9d00acffdbf7@oss.qualcomm.com?part=3D2
