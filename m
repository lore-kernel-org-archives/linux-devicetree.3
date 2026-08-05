Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C711FBC8E
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 10:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785926630; cv=none; b=ttTwdVUsFXRO//KWNJU3skwY8N9uyv1vWCHYxp8ibcMi93Hc34XQSJYOkVO+UWo98hYYMBNOukLosdvCwyicoa9eGWaVDDLvSbjzHKjY86qrrKMLUImhoW/28/Ro4y/vMM8o8U6WDL6dehIvZrfgsBMej1GF7+FBL/YMmi3FrV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785926630; c=relaxed/simple;
	bh=2Q72FVsKxtQQjXdXhfXPKnpu9fZjmHScZ00UIayIVks=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E4sqgaJM51PNI1OYLBTn4q1Ta/Gv1mgjAiCCuPIZVeZF0g6LvcIlQKRSsNse/CLDiwNu3kOJ5+lBTeFXP/SLf9qqKSPIggb7hcqzo6dRwbc19oV6yhQjNDkC15Ob+l50qovcsDk/OTkcTbXUjPeIIUb0NSezlv2GyShJHP4FpJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eL3Sn94c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eL3Sn94c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1041F000E9;
	Wed,  5 Aug 2026 10:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785926629;
	bh=L+KbGav3Q+p4tGhG3y+9crmfT8t/ephMdNvrTkve8Eo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eL3Sn94cKHPB+IvkwtuSrd+8QAQMtTSpo4c+xHE1iAHABpPFTo4z8bnMFgr/ZgG9G
	 3EP+p6gMGO+M7Gs8MI8TG7vF73D0GQbRBQjKvuepkFil3RmQNBsjQ/+u2IuEOImKr6
	 Mr+DflKZIu6+U/w3uStNQHSEtVPIotMNDHOMis8c9iPiUp36yjlGWz95yV4XALdH85
	 Pgfo9eReDnHqEPohocxHOjzT16fAq9KWF5YJf7gkQ804DxlTekVqtvgfDRZVsSw2ZB
	 fwXdNdmj6JySdyiYP4B82lOO8XSRnSFirY+2kpKl/cXDG84E++c8qzZOqwKVFDEEoe
	 rcI1AoBfd/9YA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse
 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sarath Ganapathiraju" <sarath.ganapathiraju@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-master-20260805-sync-v4-2-dfbcbf427c2c@oss.qualcomm.com>
References: <20260805-master-20260805-sync-v4-0-dfbcbf427c2c@oss.qualcomm.com>
 <20260805-master-20260805-sync-v4-2-dfbcbf427c2c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 10:43:46 +0000
Message-Id: <20260805104348.BA1041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing architecture dependencies in `QCOM_CLK_LPASS_HEARTBEAT_PULS=
E` Kconfig entry.
--

--- Patch [2]: [PATCH v4 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse c=
lock ---
commit f03b41ee3ba8e25df484407c379a0d86e064e1b4
Author: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

clk: qcom: Add LPASS VA CSR heartbeat pulse clock

This commit introduces the LPASS VA CSR driver to model the rate generator
as a clock provider. It allows the HeartBeat Pulse to be enabled and
disabled automatically alongside other clocks during runtime PM operations.

> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index d1fc9bf87126b..d9a4ceb1d3a03 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -2040,6 +2040,18 @@ config CLK_GFM_LPASS_SM8250
>  	  Support for the Glitch Free Mux (GFM) Low power audio
>            subsystem (LPASS) clocks found on SM8250 SoCs.
> =20
> +config QCOM_CLK_LPASS_HEARTBEAT_PULSE
> +	tristate "Qualcomm LPASS VA CSR heartbeat pulse clock provider"
> +	depends on COMMON_CLK
> +	select REGMAP_MMIO

[Severity: Low]
Should this configuration depend on ARCH_QCOM or COMPILE_TEST?

Without architecture constraints, this SoC-specific clock driver is exposed
in the configuration menu for all architectures. Adding a dependency on
ARCH_QCOM || COMPILE_TEST would prevent this menuconfig pollution.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-master-202=
60805-sync-v4-0-dfbcbf427c2c@oss.qualcomm.com?part=3D2
