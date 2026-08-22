Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD84B32FA18
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 07:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787385377; cv=none; b=LYJKsE+UYUdrUEUXy5Dx4n9FSCXuoFhjlfkYlN9OOZ8aVq8xtdQlLCi3AcAi6FZH34MS74J9L5hpr0OZj5KbMr+fkgv1YpBr4mLH+wHF3AhcmI7HHhCLZXc+JNMvMkogx+MpDjDnIR3yli8nOl48ntpO1csX4JYJXVCaBQBzyCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787385377; c=relaxed/simple;
	bh=0EPo7IEDraVKeqzNmrWTcaarDac0g13CbINzU/oPTUo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rtTFJoMIbjnXRozD02li3+UEzwO8zxTVRk5yFmV4im/n04y5lir/HtQpaK5kIPY+hHNbtocqzKdpo723B275It0HlMwb2YhIa5C4+JtqmMP0B7SPznOCWpzuDVmvR/3EhZOlkzVvzNhT91aCR6aGrE4JZA0r0wp92CvbSQ6hfwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZO70ZUB9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZO70ZUB9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63261F000E9;
	Sat, 22 Aug 2026 07:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787385376;
	bh=Md8sjyjPFwVegd6vG7EHKzCw4XT3YwVcfSxf497AGF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZO70ZUB9p9x7gWPH+8SotlAOiUxehNKuo0yT4n3TFn8kJJ7VT0y9iS9xQxuFVIvOE
	 oLhoprn99YUACMTurQQihgFnh51rYkz6XCQEpkWmvHXHMeG3kBc9FIGezNknZpnBV7
	 IohnCQZ8n7yNWKOc1YkcaqmxIEqZucaE2YX9lvMDJrsSs8fmGGMsfiruox0PgJ0mal
	 eyeTTQEjktc8QjCibr9A6PSUopHwbEcvbeG0SZ4dFQVpFmclEQJOKp1H30LfFN3w3i
	 D8VAdlNGU/r+LcHBF2LdZFg7PuSz24CtAP+x4eOkJQyXPu3jS10vK6khKfY2k6dU7/
	 Eu/O9f7ORENJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/9] usb: dwc3: dwc3-generic-plat: Add ST STM32MP2
 DWC3 xHCI USB controller glue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, olteanv@gmail.com
In-Reply-To: <20260822074816.548662-7-marex@nabladev.com>
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-7-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 07:56:15 +0000
Message-Id: <20260822075615.D63261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The file uses the FIELD_PREP macro without including its required h=
eader <linux/bitfield.h>.
--

--- Patch [6]: [PATCH v3 6/9] usb: dwc3: dwc3-generic-plat: Add ST STM32MP2=
 DWC3 xHCI USB controller glue ---
commit 144f9fcc747a522925bb8e40158fa496caf2673c
Author: Marek Vasut <marex@nabladev.com>

usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DWC3 xHCI USB controller glue

This commit extends the generic DWC3 platform driver by adding glue logic
support for the ST STM32MP2 SoC. It configures controller settings using
syscon via device tree properties.

> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3=
-generic-plat.c
> index ca69ac0eb07ce..f670576511b59 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c

[ ... ]

> @@ -85,6 +91,38 @@ static int dwc3_spacemit_k1_init(struct dwc3_generic *=
dwc3g)

[ ... ]

> +static int dwc3_stm32mp25_init(struct dwc3_generic *dwc3g)
> +{

[ ... ]

> +	return regmap_update_bits(regmap, drcr,
> +				  STM32MP2_USB3DRCR_HOST_PORT_POWER_CONTROL_PRESENT |
> +				  STM32MP2_USB3DRCR_OVRCUR_POLARITY |
> +				  STM32MP2_USB3DRCR_VBUSEN_POLARITY |
> +				  STM32MP2_USB3DRCR_USB2ONLYD |
> +				  STM32MP2_USB3DRCR_USB2ONLYH,
> +				  FIELD_PREP(STM32MP2_USB3DRCR_HOST_PORT_POWER_CONTROL_PRESENT,
> +					     prt_pwr_ctrl) |

[Severity: Low]
This isn't a bug, but FIELD_PREP is used here without explicitly including
linux/bitfield.h. Could this cause build failures on architectures or
configurations where this header is not implicitly pulled in by other
includes?

> +				  FIELD_PREP(STM32MP2_USB3DRCR_OVRCUR_POLARITY,
> +					     ovrcur_polarity_low) |
> +				  FIELD_PREP(STM32MP2_USB3DRCR_VBUSEN_POLARITY,
> +					     vbusen_polarity_low) |
> +				  FIELD_PREP(STM32MP2_USB3DRCR_USB2ONLYD,
> +					     !!usb2only_conf) |
> +				  FIELD_PREP(STM32MP2_USB3DRCR_USB2ONLYH,
> +					     !!usb2only_conf));
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260822074816.5486=
62-1-marex@nabladev.com?part=3D6
