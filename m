Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683F117C203
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 21:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783891435; cv=none; b=eCdmPsTk8RDh2TxKupYAjaEfolQA7N/mGu+YRtTPBBDHhFGiLco28a5FBBZ1/8indz7DCWEprjWdJOCIitj3WWcXzmcdMFDGnonMZOsXe9V7xzi4GkAJhY+iL4J6bdJykVn8h+pxGHYJbLo791tPz0+TeDMi+ebUagEjUBDu4ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783891435; c=relaxed/simple;
	bh=DConIZkgsyu0x77fa9NFkexBrJQuBwUnGxDd1V8zh38=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aVhqoA8yIZD3CSexb5bShCpPGeCzoCJiDNbCiyXKxH7074X8ecAKOhTLv8UDV7MRGmY1D8TW54PD3fdb0qSxpMUXFs45HXCa4gxAHWy3xN5DsOQa5i2cEKomZCRAO/l/BvrrFCdDQ0W/j0ztsursj/ivWAZf7MygF+J6dha54SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMEV7/dR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMEV7/dR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C168B1F000E9;
	Sun, 12 Jul 2026 21:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783891434;
	bh=8Zfl1BCUsRerReci4AYBjesIkboUHP3l4u53EaTdZgE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MMEV7/dR4qYWYuQ6faVc/EvBxn0xaSO6cQ+qe2QloZHzLpXQxrZaeaujIUc6kjgVG
	 xw6coix2PKFdRlRb5V0V8S9TkPhwlzUlPiayqCrOCXh8xsW1jxzPmQWcWGO/t6oNtd
	 jJbWUnPZ9S2SUSGfb2A3HTAjerKlUHFq9cO1x35s6Bs9gf4qrFRAPQqc5l2ZkKQhyX
	 kaj5oaLg+NKvNAkPpCTDtG4khIEpm2cAJW/ty9SFcCfXj8c8ZpGBlOMt/fIAr96Jcw
	 3cCTnm4hfk8QQcCb8nNehP32q056Yfh2s4nC4B/j5c/BVts8iHt4u3j+MJ72LmIU7C
	 anoVtyxiKmmMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Drake" <dan@reactivated.net>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260712-bcm2712-iommu-submit-v1-3-80e10cdde2ea@reactivated.net>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
 <20260712-bcm2712-iommu-submit-v1-3-80e10cdde2ea@reactivated.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 21:23:53 +0000
Message-Id: <20260712212353.C168B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `brcm,bcm2712-iommu` binding unconditionally requires the `b=
rcm,iommu-cache` property, breaking validation compatibility with existing =
RPi5 firmware.
--

--- Patch [3]: [PATCH 3/6] dt-bindings: iommu: Add Broadcom BCM2712 IOMMU -=
--
commit abf846fdde20af5f8370795e68ffc7099b1c33db
Author: Daniel Drake <dan@reactivated.net>

dt-bindings: iommu: Add Broadcom BCM2712 IOMMU

This commit adds device tree bindings for the Broadcom BCM2712 IOMMU
and its shared TLB cache. It aims to support hardware address translation
while maintaining compatibility with existing Raspberry Pi 5 firmware.

> diff --git a/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.y=
aml b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - '#iommu-cells'
> +  - brcm,iommu-cache

[Severity: Medium]
Will this cause schema validation to fail for older device trees?

The commit message mentions including compatibility with the cache phandle
used in existing firmware shipped on Raspberry Pi 5. If those existing
device trees use the deprecated "cache" property instead of
"brcm,iommu-cache", unconditionally requiring "brcm,iommu-cache" here
seems like it would break dtbs_check validation for them.

Could this be handled using a oneOf rule to require either
"brcm,iommu-cache" or "cache" to ensure older firmware setups still pass
validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712-bcm2712-io=
mmu-submit-v1-0-80e10cdde2ea@reactivated.net?part=3D3
