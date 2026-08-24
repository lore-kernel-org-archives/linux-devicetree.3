Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F648328B77
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561814; cv=none; b=Yog2BWfPl4mLF6StxmAtAHqzQk2KLkWXBPztxwvpdFyzMdObglm630NE061XCt26IKbINejX2RzvqO+AFLmnCTDz306m0mscWa3YuYB3qFGFw+8HS9YObigFuiTh4tJE/+nAZLMrV5WVT8i70fgPD0NDXpncNLJK7fjuoGc3Rz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561814; c=relaxed/simple;
	bh=/U76o0oNuLKu2r6wksGP0xYQN5ftj5rmBmzBsLxEfAY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mITgWxtqKSXm4ZM0ySwfHpdsThp38imGsTcg6/pDKcC5amSUvT7gwzGK1bR8XFWbm+7zT+vTQfWsQV16UzGn2axcqJjPVEFgsrUy1v9aabjoKfqX0VJbC/XYZvHLSUXg5XvZ4GJAHap66Ceri7m5S0rNTfHHPqUsxXBylCJdyzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nWaypwLf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nWaypwLf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0811F000E9;
	Mon, 24 Aug 2026 08:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787561812;
	bh=25CU1vkhttYFfB+/MfiTowFxlapwHVD5UVKQOYAjBVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nWaypwLfcdoQhQszm6bQrky695glsUs9dkCmvnsXL2xgdvUZN/LS9Lw+eTvv912e4
	 8oP8s34pPDLe4IbpCVLeKvZEAzA/6QepGcGrCI777G1g4sNYdzM3EbxxqeTF5cOybf
	 xp6ASdrIexhIQHatjbPvbiURQ2JF7dK2itMa5BbE2an7JIGIe0TUIYwXZ/GIzsPc2u
	 JSW6zbSsWTS8StChCpTgoXFnU7H+mImH2GBnQI/wP69AX+f9mfSNqH09ed4EMrDDaV
	 +gpdikUFiB19vg3XDA7ckwSLLfIbq8iI+nT3yTnYv/FQdjSLqrak5A0G8wJitE7w4u
	 ECYYFUsU+EfcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding
 for ADS112C04
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hsieh" <kylehsieh1995@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824-ti-ads112c04-driver-v7-1-6b3c9c87d0e4@gmail.com>
References: <20260824-ti-ads112c04-driver-v7-0-6b3c9c87d0e4@gmail.com>
 <20260824-ti-ads112c04-driver-v7-1-6b3c9c87d0e4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 08:56:52 +0000
Message-Id: <20260824085652.AE0811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `excitation-current-nanoamp` and `burn-out-current-nanoamp` pro=
perties are incorrectly constrained as scalars, causing dt-schema validatio=
n failures when configuring multiple channels.
--

--- Patch [1]: [PATCH v7 1/2] dt-bindings: iio: adc: ti,ads112c04: Add bind=
ing for ADS112C04 ---
commit da6d59f78ea6520db9adcaf85a4a8583112226d0
Author: Kyle Hsieh <kylehsieh1995@gmail.com>

dt-bindings: iio: adc: ti,ads112c04: Add binding for ADS112C04

This commit adds device tree binding documentation for the Texas Instruments
ADS112C04 I2C Analog-to-Digital Converters. The binding uses child nodes
to dynamically define connected channels and includes properties to describe
hardware capabilities.

> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml =
b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
> new file mode 100644
> index 0000000000000..95a123cd7b67c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
[ ... ]
> +patternProperties:
> +  "^channel@[0-9a-b]$":
> +    $ref: adc.yaml
> +    unevaluatedProperties: false
> +    properties:
[ ... ]
> +      excitation-current-nanoamp:
> +        enum: [10000, 50000, 100000, 250000, 500000, 1000000, 1500000]
> +
> +      burn-out-current-nanoamp:
> +        const: 10000

[Severity: Low]
Will dt-schema validation fail here if a device tree specifies multiple val=
ues
for these properties (e.g., excitation-current-nanoamp =3D <500000 500000>;=
)?

Due to the standard -nanoamp suffix defined in property-units.yaml, dt-sche=
ma
treats these properties as arrays. Applying the enum and const constraints
directly to the property instead of using items (e.g., items: enum: [...])
applies the scalar constraint to the entire array, which triggers a validat=
ion
failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-ti-ads112c=
04-driver-v7-0-6b3c9c87d0e4@gmail.com?part=3D1
