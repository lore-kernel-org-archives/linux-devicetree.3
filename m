Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F8B420E9D
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 09:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341808; cv=none; b=ifDLQSr8/GKM4zQgKjUVWLmB9OWFSf0+alY2OxyQJ4ImqiTVGd3lZIUMcU9/9TWyjpuH8/x0aLK8f6t+wdbBISK0xIV8cqiBpL1X4fJJ6I91uQccY+3up7m5Zy/w+pJye4ghP1TqC8WVB0KdMGJuDPZekALZc3TbNyATlFpthXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341808; c=relaxed/simple;
	bh=1VyY1mvKpimbXE5XF+GmcyDaX+2FdrE+5hTJS6njxR0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pgz4xp0Ju30TUD17H8CAyjKIl08uydrEDpQ8L/TYfZwQMDcfirfa4SLlxU0N6sOeA4bbzTwew4CXoD/Rc1qenTOnjNbY8PqT5NEXcQWcFb8hYZNme+UWJbXyGFRQ77SGXpA081yHqDQ0an5TTSgMeW9A9dLm0rm9kXsMGW6YHJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGG3Ul6H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGG3Ul6H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078221F000E9;
	Wed,  2 Sep 2026 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788341806;
	bh=OSN6Pe33pFMIHrRUBKPQ6CEq+Rq/8P+x6Q7uuPkqzLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CGG3Ul6HxjVV3hVwz0BYS3luGvqFgsANBgeKTUSFbMZWiWHvLootc9/pLHgXi4rSq
	 eSivVj/yYpnRk2a/owPg5bQ68ntJqTtC4HJULkDEorPxmsNr9jEkLuQvwXC7t/SF+h
	 YRlZ3ss0ThOiUBLEu6m3Xor85EFMft6ibV8yf3Jp2/CraMUYu2Tq+yxSIvvUwYUMW9
	 fS8hDtaZayvnfOr4RmdgKyLbsubXCQRM+tQjKJhrsSTWV32BA0awRYHIVy/EkdkeGd
	 RdC36C2/S92Hpf85CubBmqkZxQuM8T2s60aN4La9e/hWC/TFtc4+hd93a0pRzKvCue
	 syhtzUee076sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/3] dt-bindings: iio: dac: Add AD5529R
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260902-ad5529r-driver-v11-2-301c491a0719@analog.com>
References: <20260902-ad5529r-driver-v11-0-301c491a0719@analog.com>
 <20260902-ad5529r-driver-v11-2-301c491a0719@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 09:36:45 +0000
Message-Id: <20260902093646.078221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Schema incorrectly rejects standard properties from referenced s=
chema
- [Low] Default value type mismatch for `spi-device-addr` array property
--

commit 1e8f5824a0d1b32d0615a8c9004b4c48496e77b0
Author: Janani Sunil <janani.sunil@analog.com>
Subject: dt-bindings: iio: dac: Add AD5529R

This commit adds device tree bindings for the Analog Devices AD5529R=20
16-channel 12/16-bit high voltage DAC. It includes documentation for the=20
SPI interface, power supplies, and individual channel configuration.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml b=
/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml
> new file mode 100644
> index 0000000000000..9c390d460e5ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml
[ ... ]
> +  spi-device-addr:
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      enum: [0, 1, 2, 3]
> +    default: 0

[Severity: Low]
Will this default value cause a schema validation warning?

Since spi-device-addr is defined as an array in the standard spi
peripheral properties (/schemas/spi/spi-peripheral-props.yaml), assigning
a scalar integer (0) as the default violates the array type expectation.

Should this be expressed as an array instead, such as default: [0]?

[ ... ]
> +patternProperties:
> +  "^channel@([0-9a-f]{1,2})$":
> +    $ref: dac.yaml
> +    type: object
> +    description: Child nodes for individual channel configuration
[ ... ]
> +    required:
> +      - reg
> +
> +    additionalProperties: false

[Severity: Medium]
Will this incorrectly block standard properties defined in dac.yaml from
being used in the child nodes?

Using additionalProperties: false here only considers the explicitly listed
local properties (reg and output-range-microvolt). If a device tree
includes standard IIO DAC properties (like label) defined in dac.yaml,
they will be rejected and cause false-positive validation errors during
dtbs_check.

Should this use unevaluatedProperties: false instead to properly validate
local properties alongside the referenced properties?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-ad5529r-dr=
iver-v11-0-301c491a0719@analog.com?part=3D2
