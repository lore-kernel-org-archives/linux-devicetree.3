Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6F4366048
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 01:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786497086; cv=none; b=jkRQJNaHL2ZWSsCStfZguwAUoIu8Eu+O3t7tscwW7rcF0nFuMwlEMWG5T3oETFxAScmVGVzDjbs36D3JV2Su4GVA7v70jDPl2tkUwZQsr6xnBCXXV4aq2rFKRbRsFql47/t7hfhkWoAazdHBXzkDPigRMrV67DIBf4WfDNSoQPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786497086; c=relaxed/simple;
	bh=o9Kq5jlvXl4EzfNzN3xS+zkZkgy7mZ9Ww5oJg77JKxc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aSCR12dg2dK4xz/1+fNGWcjiaZeajs1nsKV/sZ/FsrmlO+uaKCS768hg5gTR3TtuyaTN47/I1g6+WVMntdwa5fjxzB4UTkLyxD2Q6vo8zCKSa/xHceQfVpqd2XQDA26viJzWqLgs0njNIe1Y4dDOW0YC1I/iJcorCmLX8BW1/fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXchdTYf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXchdTYf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A000E1F000E9;
	Wed, 12 Aug 2026 01:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786497085;
	bh=7sUWgLc6nw7NtKzSkB4pLeGDpjmBan9ynk/ha9Oy5Pk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NXchdTYfHt+srmRpC8esMdKgDfKNnJCEK3hXY0VyP9Tzp/bWeUuOfSB/6xJrGCaj/
	 Xu1ncE2M2qlisgQCTPP3ewNrCRdoGxjwDCMGwsaFh8ulxg2S2GTL1KGuQoQJ+umyMG
	 +g6sV+G6XVTVZSLtFULfRn5WKpt0bTQsjoDgo9o5Xf9qn4eRTtGBdK8+GwQzDNKLJh
	 cZt8veDkm9KGOLkf+54+xKk/1GiptHRlan/v2Cq98BGntlzR1ryJ3cs6Kl2qmHrOR4
	 kpvrh8e+xL2Yzsb8M08PzzVLnTVBJsdGpQlq9QccDCiAiJZLx807fnrf/UuERO7E12
	 aeKIfBQEdNKuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/8] usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DWC3
 xHCI USB controller glue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: olteanv@gmail.com, robh@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org
In-Reply-To: <20260812010157.1772849-7-marex@nabladev.com>
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-7-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 01:11:24 +0000
Message-Id: <20260812011124.A000E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `#include <linux/bitfield.h>` for the `FIELD_PREP` macro.
--

--- Patch [6]: [PATCH 6/8] usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DW=
C3 xHCI USB controller glue ---
commit b7b018e07e03e9eca049254747c91235246ffef8
Author: Marek Vasut <marex@nabladev.com>

usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DWC3 xHCI USB controller glue

This commit adds support for the ST STM32MP2 DWC3 USB controller glue logic
to the generic DWC3 platform driver.

> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3=
-generic-plat.c
> index ca69ac0eb07ce..0946ed61647b6 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
[ ... ]
> @@ -85,6 +91,38 @@ static int dwc3_spacemit_k1_init(struct dwc3_generic *=
dwc3g)
>  	return 0;
>  }
> =20
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
Does this file need to include linux/bitfield.h?

The FIELD_PREP macro is used here to prepare the bitfields, but the header
defining it does not appear to be included. If the header isn't pulled in
transitively, will this result in a build failure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812010157.1772=
849-1-marex@nabladev.com?part=3D6
