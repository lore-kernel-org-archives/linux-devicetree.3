Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4FF37E2E1
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940919; cv=none; b=m1TBlzoD2W00nV/OQepTKfq0vuAvE69lhvXDTvqQiO4K6SmIJyWr7VUHW31zj04USBBrSwjtHC0Y3y6OAs5oz/XavF68h+pM3cy/xF+w6oEfCxnXjM6buK0EkZnpezN3xcCnv2W1/hnrS1DEKtB2l7LoJ9nEV7AIEN6FDGA1BPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940919; c=relaxed/simple;
	bh=fQUlJVchhb8EZuT9UtLu8CTz2OjvCv40TxUVOVgQmDE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VYsvENiPknCm0WwRxaemaCwn/j2b7d7ZbX4W3OJBmCtLaNS8IfrjNnBwagzPKMk39fS52Zz7dXgjhtY/Q35TQl+rIUjkUbUXrRXImiYChTqhEomxdUpJQBnqZ9ixiWbHPD1OwDsm4qZqRvmd2gMUVrDvlyykILfqjms0GuPwOUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b89ceIxD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b89ceIxD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4811F000E9;
	Mon, 13 Jul 2026 11:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783940917;
	bh=pPcAtmgPN6OBX2ObsZBOb3Bu9UlL9PBi+segBbPKluI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b89ceIxDFT87DpFSp31Z3YxBlaF6G1wQHRmZIvZsM+jQsp2GyZRnA5jVWaWe4vx6L
	 5f7iJky5sK3SdCmBHKicP4PTpLgRP6BEzrwMpf3G9jtDB3eg0LfPs4AeIMzN/1yeDU
	 m8KOVELKhPTqyGookb0CvmIVC6l6VmR5TsmghFVgX+HGzVio6kwSI/wvyHhMg3Fncs
	 /5mfO78sUmD/cTRxpwDKO38nhI/iK6+DNHB70J3GstYCuBL/fsbs6DwJ8xVRbkZ5M7
	 pcilZwxGGH4PnIhMF0EkH839f8NXoGLEioE+vFm9rbiiS+cnkKfEqCguUPyvcUW6Rx
	 QELHSOY/PYPLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/8] ARM: dts: mstar: miyoo-mini: Add vibrator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Palmer" <daniel@thingy.jp>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260713105950.1346962-6-daniel@thingy.jp>
References: <20260713105950.1346962-1-daniel@thingy.jp>
 <20260713105950.1346962-6-daniel@thingy.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 11:08:36 +0000
Message-Id: <20260713110837.5F4811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `#include <dt-bindings/gpio/gpio.h>` causes device tree com=
pilation failure due to an undefined `GPIO_ACTIVE_LOW` macro.
--

--- Patch [5]: [PATCH 5/8] ARM: dts: mstar: miyoo-mini: Add vibrator ---
commit c4d7e499cb7660d52f8d45adc7aae0663b10a9a9
Author: Daniel Palmer <daniel@0x0f.com>

ARM: dts: mstar: miyoo-mini: Add vibrator

This commit adds a vibration motor node to the Miyoo Mini device tree,
configuring it to be driven by a GPIO pin.

> diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-miyoo-m=
ini.dts b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-miyoo-mini.d=
ts
> --- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-miyoo-mini.dts
> +++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-miyoo-mini.dts

[ ... ]

> @@ -18,6 +18,12 @@ aliases {
>  	chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> +
> +	vibrator {
> +		compatible =3D "gpio-vibrator";
> +		enable-gpios =3D <&gpio SSD20XD_GPIO_UART0_TX GPIO_ACTIVE_LOW>;

[Severity: Low]
Does this file compile successfully without the gpio bindings header?

It looks like GPIO_ACTIVE_LOW is used in the new vibrator node, but the
file doesn't appear to include <dt-bindings/gpio/gpio.h>.

Will this result in a compilation failure from the device tree compiler
due to the undefined macro?

> +	};
> +
>  };
> =20
>  &pm_uart {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713105950.1346=
962-1-daniel@thingy.jp?part=3D5
