Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BB43DFC7E
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 20:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783630734; cv=none; b=KaEzZdW6Lvj/FYsd032z0GCXjjPlfuqzIExHbT7/+uJXM4uTGVVDSqvMPc3V99+9yfZbxZgNyl73rDmhmt8Nplh/ch/5VHEkVggZuM4Cu8wun2IGV4cinbBRPY6vfe6i9wwwImJA4A4mnliyFX/CtjMF20UAXVszmuXT80eKhU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783630734; c=relaxed/simple;
	bh=oUnULa+9FJkurV4+l92RJeMU15pAPFRta7T75xlN6/g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CtPd+WsX9MXYGXU1qWT0eJ5583z4/vQkqHYjI+AEAEzdl/klhObl94Ey9mA4JD4A9a4j8/UVYXpRrulBzIiw92NlqRg5cciF/speYsvCpCkUW9wOz3eYd3UYkzyaJvumwJkcUSBd2szmD+1yjkSCyfOCjfd+Q3j6TDDA5oD2SkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwTxQ00+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwTxQ00+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F921F000E9;
	Thu,  9 Jul 2026 20:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783630733;
	bh=J2Ohcj530sjG8V0nSdIdMmKRwdkckjzr0fv+/fVz4e0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TwTxQ00+Qy9nWlJXz7VvOJfBuJDZtsRiDcjDIGZD2IbiMAqf3qHmHQ66fYCEfBbMG
	 9A3HykJww7v12URm6BOuyhPwb1GWNfOVZ84xdXzNOoA1maT1Nu63DENDUYX1nauf/p
	 IMaNhNSSR8jJLl2dUdji88mtPJjnZofqMEI3tcIkokvNrIyMkjW2aPdqN0VtTYFtav
	 wufAhittCV4jTYMZ4wLsSY1zVbTPuUXQJch+mFOrYrKxrsqIfnjbiQc7BNifedAwRu
	 UBFLpZnmU9L39ZXyJknUNigQ9V7YhKV+KXNVB0HMfUNe4XTIBVO6riKgYkZ2bqk24e
	 X56iCdxxyy87A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/4] dt-bindings: iio: adc: Add ltc2378
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <1a3259037ac87539490c8e070487703614e41e62.1783629101.git.marcelo.schmitt@analog.com>
References: <cover.1783629101.git.marcelo.schmitt@analog.com>
 <1a3259037ac87539490c8e070487703614e41e62.1783629101.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 20:58:52 +0000
Message-Id: <20260709205853.20F921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding incorrectly forces `ref-supply` to be mandatory (whi=
le forbidding `refin-supply`) for LTC2378 and most other devices, and wrong=
ly forbids `ref-supply` for LTC2338-18. This contradicts the physical hardw=
are capabilities.
--

--- Patch [1]: [PATCH v6 1/4] dt-bindings: iio: adc: Add ltc2378 ---
commit 5b94ffdebbdd7e1b8c34a651dee8aae08509770e
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

dt-bindings: iio: adc: Add ltc2378

This commit adds device tree bindings for the Analog Devices LTC2378
and similar ADCs. It defines the required properties, compatible strings
with fallback enforcement, and constraints for voltage supplies.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml b=
/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml

[ ... ]

> +allOf:
> +  # Except for LTC2338, all designs require a voltage reference input
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              enum:
> +                - adi,ltc2338-18
> +    then:
> +      required:
> +        - ref-supply
> +      properties:
> +        refin-supply: false
> +    else:
> +      properties:
> +        ref-supply: false

[Severity: Medium]
Could these constraints cause a validation regression for valid hardware
configurations?

For example, if the LTC2378 uses an internal reference without an external
supply, forcing ref-supply to be mandatory (while forbidding refin-supply)
might cause valid device trees to fail validation unless a dummy regulator =
is
instantiated.

Similarly, does the LTC2338-18 support overdriving the internal reference
buffer? If so, forbidding ref-supply for adi,ltc2338-18 could prevent accur=
ate
hardware descriptions when an external reference is applied.

Should these constraints be adjusted to fully reflect the physical hardware
capabilities and internal reference features described in the datasheets?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783629101.gi=
t.marcelo.schmitt@analog.com?part=3D1
