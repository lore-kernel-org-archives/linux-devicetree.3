Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9441F0E25
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 22:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778709638; cv=none; b=sWSW+SamKP+I2XoFy546Ivij5dXBDWow8oDAWc85nB3HazPrDCiw3R1KJhoPK4rTP5zvLgT4qL6w6qalEIWT+hugRnSqyzmMSs7ZeI2exykxeOm4sAOE7kdMHVc3zOZJzdBG2lnv9vaOPAAwQFeMUMjktPbFRPKz3J5vrSVbmD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778709638; c=relaxed/simple;
	bh=DXw90OeW/hJbguIrNQSu/Uye5ippdxmuZHeaFUgZ924=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hQtTUHR0RnBwVkfTl1y2rrTOLgvP3XbVz0276vx6Fwa/iL4YOTz3Qj5K3fiUvvXNigNghxleM+uA61tCbs2yN6wVIrk5ih8rhVaDIJSofsw6uAGMRS5jqbQxOBA4lvVu1maKrgEM+H0dZxf7nqjG9x3zTk1f4xBirXJR958CLag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lEvnISLR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lEvnISLR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0697AC19425;
	Wed, 13 May 2026 22:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778709638;
	bh=DXw90OeW/hJbguIrNQSu/Uye5ippdxmuZHeaFUgZ924=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lEvnISLRdgWf93qzvbiMg9ORLilYSo0aZpRI9o9+yeEy5zqVn6ICwZURZSBe8Zb7x
	 h/oPstWsMr9558IkV0iGXhXg2ecP9TqLzWJV2tt6EQSUM42MHrq1CF9NqwuoVeSKt/
	 tCDw1M8NI2wewwBGelhQKAArB9AmnJdI+YpiIfAX7x/1q6rimy1ZkYKsB8Y4NgYF9d
	 ZPxgS1VtmNusQUfJ4VXnBZK4YGVlYSEI5J8miOo3t4ji4AA83Bvwj+fBQR0oRuCfGz
	 GsPXLutR+0pxG+6IBPoXvK/ig86eUMURkp3XiVB6od4Z5oQZNFSB8WrCSb+nfsg+Od
	 TukZiCTWn8t4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add Shikra pinctrl driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260512-shikra-pinctrl-v4-2-b93c3a2e4c08@oss.qualcomm.com>
References: <20260512-shikra-pinctrl-v4-2-b93c3a2e4c08@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 22:00:37 +0000
Message-Id: <20260513220038.0697AC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The Kconfig symbol PINCTRL_SHIKRA incorrectly uses `default ARCH_QC=
OM`, which is inconsistent with the rest of the pinctrl drivers in the subs=
ystem.
--

commit 635e77fc90eb7d688d1990612274cdff1b91f42d
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

pinctrl: qcom: Add Shikra pinctrl driver

This commit adds the pinctrl driver for the TLMM block found in the
Qualcomm Shikra SoC.

> diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kcon=
fig.msm
> index 836cdeca1006f..20e1068492734 100644
> --- a/drivers/pinctrl/qcom/Kconfig.msm
> +++ b/drivers/pinctrl/qcom/Kconfig.msm
[ ... ]
> @@ -369,6 +369,17 @@ config PINCTRL_SDX75
>           Qualcomm Technologies Inc TLMM block found on the Qualcomm
>           Technologies Inc SDX75 platform.
> =20
> +config PINCTRL_SHIKRA
> +	tristate "Qualcomm Shikra pin controller driver"
> +	depends on ARM64 || COMPILE_TEST
> +	default ARCH_QCOM

Is this default intended? Looking at the other SoC-specific pin controller
drivers in this file, such as PINCTRL_SM4450 just below this, they do not
appear to use default ARCH_QCOM.

Defining it here forces this driver to be built by default whenever the
generic ARCH_QCOM is enabled, which seems inconsistent with the established
pattern for the rest of the subsystem.

> +	help
> +	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> +	  Qualcomm Technologies Inc Top Level Mode Multiplexer block (TLMM)
> +	  found on the Qualcomm	Technologies Inc Shikra platform.
> +	  Say Y here to compile statically, or M here to compile it as a module.
> +	  If unsure, say N.
> +
>  config PINCTRL_SM4450
>  	tristate "Qualcomm Technologies Inc SM4450 pin controller driver"
>  	depends on ARM64 || COMPILE_TEST
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-shikra-pin=
ctrl-v4-0-b93c3a2e4c08@oss.qualcomm.com?part=3D2
