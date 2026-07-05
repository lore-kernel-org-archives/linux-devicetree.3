Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1271335F193
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 22:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783290140; cv=none; b=D6jL16hV8t7tA8r20YGVGT9dA1m0dOF6Va7l7+bPezVSrspLSZtib8GBck+ITsm6QiJETvc/DA3/juPStIXsL8EQijJV2uCzkFlqWCDuoZ0AOpAqdkajwR0YQCdyYa98YBnrGGERKifW1vTu+zCAOhcaTfpWagH6tzgZCbaDRgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783290140; c=relaxed/simple;
	bh=OX+ZuhPjr75T9RCZBamD6tUUb8aD8CI7de/7FHw0KbE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mdZcSQhFkWzOPLfOIzzxuoKtGbeT4ebXep2rKYdojG4Mt1hRGRlQuVbrUHXx8hSV4yHY0GFQcRXrshKa0bOMD4SnMIEoZHwIRysLIM2UGAJGusT0Ssv2KSCMmCVhkD5AVxNcLmlSFq1YYTifG4FnOQcryKsG7eg6FXYyGCHX4WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RAkR0DCX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RAkR0DCX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9D51F000E9;
	Sun,  5 Jul 2026 22:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783290138;
	bh=3sBYWWWqf9qwpVsVygkFRY7ZzJ9A/aOZ6wRTm8bZSC0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RAkR0DCXdBBNyobeljKe+frU82bWlmCSR4IrYXRIcRHwpJD6o+B9d92kULJKMF2Xk
	 qVFmZM9du5Dp0+aa4OZMqNrFrXvEcS2SjmEZ6u7YzTjSDVoZz4t7uAMGT/r+YVD1KG
	 K7VfhgMQIqU0usygrHfFqJNZcI0jtRr8E8EjFgl7txqm/dt+ZvE5Wba804HEPTrH0A
	 F7uI8MfnLXKAp0MMr29lFSeoUK9uE+nv8/Nxs0h2AvE8TWExQ4QjaIUCf3E5mPcVq4
	 zM6tOL32OsbogA9LYGPsq1rhnELyuRu5z4Vu1QKle90LgPw/oimHMnekqvDD9Dh2mF
	 buEiqsBAlKCUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] RFC: ARM: dts: ixp4xx: Fix interrupt-map weirdness
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706-ixp4xx-dts-gpio-cells-v1-1-98fa3ba0ad2d@kernel.org>
References: <20260706-ixp4xx-dts-gpio-cells-v1-1-98fa3ba0ad2d@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 22:22:18 +0000
Message-Id: <20260705222218.7B9D51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Adding `#address-cells =3D <0>;` to the GPIO node breaks dt-schema =
validation because the binding schema uses `additionalProperties: false` an=
d does not define `#address-cells`.
--

commit 41571606070d7063df98228dc5614c488e017fdc
Author: Linus Walleij <linusw@kernel.org>

RFC: ARM: dts: ixp4xx: Fix interrupt-map weirdness

This commit adds #address-cells =3D <0>; to the GPIO node in the IXP4xx=20
device tree to fix a dtc warning related to interrupt-map.

> diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi b/arch/arm/boo=
t/dts/intel/ixp/intel-ixp4xx.dtsi
> index 0adeccabd4fef..b6ef98a88c4e5 100644
> --- a/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
> +++ b/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
> @@ -114,6 +114,7 @@ gpio0: gpio@c8004000 {
>  			reg =3D <0xc8004000 0x1000>;
>  			gpio-controller;
>  			#gpio-cells =3D <2>;
> +			#address-cells =3D <0>;

[Severity: Low]
Will this cause a schema validation error during make dtbs_check?

The corresponding YAML schema for this node
(Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.yaml) enforces
additionalProperties: false and does not define #address-cells.

Without updating the YAML binding to explicitly permit=20
"#address-cells": { const: 0 }, the dt-schema validation will report an
unrecognized property error.

>  			interrupt-controller;
>  			#interrupt-cells =3D <2>;
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-ixp4xx-dts=
-gpio-cells-v1-1-98fa3ba0ad2d@kernel.org?part=3D1
