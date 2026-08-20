Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D0C3CF039
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787212730; cv=none; b=ZS/ryCmDRO50uVxCLOSXhuhcvCF1r69w1S0WIUYBEAF2bIWHl7Ob5pxD+a7T8aAEyDrS1jpsNPjhmeklK/ziV4bfDZ5edg156HFfEsk3AbOgQBXeoeG2IxIhskzETD4Re3dRqdgpkUD0bCSv9ZhQDqoV1jv64GrFBvJ1fGPeAvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787212730; c=relaxed/simple;
	bh=G188MvpvKr5zM32/WileHjs41h465C4nsWYb3IJjABg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QFBx7LxiENvKEV3qdIOM47xVE/tTPcRSInn4d2ZF78X17vcRyYRIHHuRsKb0mksgNBuXBHZOKrIVGzCH0jjr8AeXFjQKksGTnBTYQSaHdWrhZdmTOjBnXncagig/N2bI7GJ6fyYDQABxfc6uKgG799J/h1Y7BhtJZwYttwvBsqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXuCpP+J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXuCpP+J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FBA1F000E9;
	Thu, 20 Aug 2026 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787212728;
	bh=wj6r23eebEwDN2UqS/IxAeF4/l8jDxVykgnQaZYu4Ew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CXuCpP+JWaqHuyJfTlOL+lWeiaANJvAHeqK4BD7PIFyAbrqaUWrbuHIdJOFd87vt5
	 nFTViQrHzA/AvQN+ZK/IHwUp+YYAGU39nVsJpkF4qV7nZWRiRPAyvkmfFf8+08I3Sb
	 IrxKlb6vOHnXkie6KfYGBdEX0XkG9WQL6diUVZNyrw5aPhcMLiOAqbkGQM3RKKV9u1
	 VEq11irdPTe/NSndHlEDH76BFbdcRU8mcW6QlXegRre85xjE4yeUdF2D/mfMUSB/bX
	 WFNcV6cYNBs/mIGbXxUszmjFkojYyBx0b5+2WMys/XhsZaix6HKsRJ665LfIKyeQYa
	 BhdgV5DOX6J0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding
 for ADS112C04
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hsieh" <kylehsieh1995@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260820-ti-ads112c04-driver-v6-1-0e8f0aacce9b@gmail.com>
References: <20260820-ti-ads112c04-driver-v6-0-0e8f0aacce9b@gmail.com>
 <20260820-ti-ads112c04-driver-v6-1-0e8f0aacce9b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 07:58:47 +0000
Message-Id: <20260820075848.38FBA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `excitation-current-nanoamp` property incorrectly uses a scalar=
 `enum` constraint instead of an `items` list, preventing the valid use of =
multiple excitation channels in the device tree.
--

--- Patch [1]: [PATCH v6 1/2] dt-bindings: iio: adc: ti,ads112c04: Add bind=
ing for ADS112C04 ---
commit ad41025959acbdcfe32933f6e12d580d2924bc04
Author: Kyle Hsieh <kylehsieh1995@gmail.com>

dt-bindings: iio: adc: ti,ads112c04: Add binding for ADS112C04

This commit adds device tree binding documentation for Texas Instruments
ADS112C04 I2C Analog-to-Digital Converters. It outlines the hardware
capabilities including the flexible input multiplexer, programmable gain
amplifier, and programmable excitation current sources.

> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml =
b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
> new file mode 100644
> index 0000000000000..81b3511139f3c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml

[ ... ]

> +      excitation-channels:
> +        maxItems: 2
> +        items:
> +          maximum: 5
> +        description:
> +          Additionally to AIN0-AIN3, IDAC1/IDAC2 can also be routed to
> +          REFP0 (4) and REFN0 (5).
> +
> +      excitation-current-nanoamp:
> +        enum: [10000, 50000, 100000, 250000, 500000, 1000000, 1500000]

[Severity: Low]
Does this restrict the property to a single scalar value?=20

Since excitation-channels allows up to two items, wouldn't
excitation-current-nanoamp also need to allow an array (for example, by
using maxItems: 2 and placing the enum inside an items constraint) so that
configurations defining two excitation currents can pass schema validation?

> +
> +      burn-out-current-nanoamp:
> +        const: 10000

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-ti-ads112c=
04-driver-v6-0-0e8f0aacce9b@gmail.com?part=3D1
