Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC4D33122D
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105344; cv=none; b=XpQG8XCJuzqeZfq85LyE1XPPAjhGqRYbcs/EOIo4cJHI4iyWLKxNo59Jkg1/J8SVzZ3uMscNKcNbQvVontUGROFaKU8/jzyIudcdohS86K1HJhoW+Buq3Pp3jTrrb7YZ2/tc7n3EC6vSI5XWRlPv2IO2NORkosI9qeVI1YGhbVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105344; c=relaxed/simple;
	bh=KQWLCBCo+wIYfeTrKUPFBFBRl+f7YfADgSbWE7qSgbg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sSuwWebM8eTL9rW3KfP8MWQFysbNhPdUKuTgq/4Mn2DK2aFCBVamCzpV/ONziL+o0mnHJsxbGR0+pj+2q7pcJyqVKjDM2COm6kpMhhjmO81MVC7veFpVtP7IjXjDZjTGIcH+AmH4Xtzavfw3IdJ73zHL9DwMUpySIV50TRmnO/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lgpbimEp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lgpbimEp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54FE61F00893;
	Wed, 10 Jun 2026 15:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781105343;
	bh=yUZ0dkQKaiwgHHciMClUBoGILErGfEqGAPohaq7tBAo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lgpbimEpXHA+ttLbdR7sTl7WgmomLy4J02Twn4hk5hfCYqTbQWTj7tu92R8mjayrt
	 ZBwAMKasXvBbjZg5xsp3sWGypImHuTyFJM1ZTIY2ryFITMxpdgPp1ZC+rnv1dGds5c
	 wQOx/t+H/V0VQYlhbVUOCkszYD8QAKxF7jQn8SXacA4kYoNtVC2pS4M1v5D2F0/Z8e
	 BteXQrnPQeVnBuIvypqgmQcM0QQZKH0ZFuXrA01vXZyPTphkSGPLmbnXVY8pWlCtaE
	 PP9EVQyy3AKPEvcgiCTG6Ppu7D+1D4FUbOKovbb/Z9scXD72m6yGeHwQPKn+98r2o+
	 S0tUM5uwSi3qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: Add TI ADS1220
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nguyen Minh Tien" <zizuzacker@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610151342.44274-2-zizuzacker@gmail.com>
References: <20260610151342.44274-2-zizuzacker@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 15:29:02 +0000
Message-Id: <20260610152903.54FE61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `diff-channels` property constraint uses invalid YAML flow seq=
uence syntax (`items: [const: 0, const: 1]`) that will cause a fatal parser=
 error or evaluate to a single-element list with a collapsed duplicate dict=
ionary key.
- [Medium] The child node regex and `reg` maximum artificially limit the de=
vice tree to defining at most 7 channels, despite the hardware supporting 1=
2 unique multiplexer configurations.
--

commit 2b3665a0096105a4bb2db6266e47dec0a0802cff
Author: Nguyen Minh Tien <zizuzacker@gmail.com>

dt-bindings: iio: adc: Add TI ADS1220

This commit adds a device tree binding for the TI ADS1220 24-bit ADC.
It describes the SPI device, its per-input channel child nodes,
external reference selection, and the DRDY interrupt.

> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1220.yaml b/=
Documentation/devicetree/bindings/iio/adc/ti,ads1220.yaml
> new file mode 100644
> index 0000000000000..1fedffc2a1475
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1220.yaml
[ ... ]
> +patternProperties:
> +  "^channel@[0-6]$":
> +    $ref: adc.yaml
> +    type: object
> +    description: Represents one ADC input configuration (channel).
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 6

[Severity: Medium]
The ADS1220 hardware supports 12 unique multiplexer combinations
(8 differential pairs and 4 single-ended inputs). Does this regex and
reg maximum artificially limit the device tree to defining at most 7
channels?

System integrators might not be able to represent all available
hardware configurations if this limit is enforced.

[ ... ]
> +      diff-channels:
> +        description:
> +          Differential input pair routable by the ADS1220 multiplexer.
> +        oneOf:
> +          - items: [const: 0, const: 1]
> +          - items: [const: 0, const: 2]
> +          - items: [const: 0, const: 3]
> +          - items: [const: 1, const: 2]
> +          - items: [const: 1, const: 3]
> +          - items: [const: 2, const: 3]
> +          - items: [const: 1, const: 0]
> +          - items: [const: 3, const: 2]

[Severity: High]
Will this syntax pass the dt_binding_check validation?

In YAML, a flow sequence like [const: 0, const: 1] evaluates to a list
containing a single implicit mapping with duplicate keys. The dt-schema
toolchain utilizes a strict parser that typically fails on duplicate
dictionary keys.

If it did parse, it would likely collapse the duplicate keys into a
single element, forcing the diff-channels array to have exactly one
element instead of the expected two.

Would it be better to use a valid flow mapping sequence, such as
- items: [{const: 0}, {const: 1}]?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610151342.4427=
4-1-zizuzacker@gmail.com?part=3D1
