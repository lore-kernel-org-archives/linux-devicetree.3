Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613043CF688
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899514; cv=none; b=YQSrDaKQeX3609MeulX+qP2iEZyvQn6wOQlgbu93qIvnQ+YXSHGTpl0XPCkvEMD4j+aJnxor1nB3mnUHOV8BjWdeK0SvoWrr5+dfXe1WvfZKy/bm2oOUQ/yfnh1evtoLpqlgVa59ae8gLFZrd99g3ffyC5oTLDUTBb2sHdVA7/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899514; c=relaxed/simple;
	bh=2+2jazC0+KyiumaDPUOEPPWR+fv08tJNJZZ+SWWiCdA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gMYLM43O0HJp1dbJQHWZPYq6XOV5qIQKmcSbi5/TLaPF3DFoSyscMRlSEMuCh4M7r1xKux4pKpaQmCoPXmqHsb52j36hQN98TOF8MJK7uwhs6iktHQTtCgY4G8XP7OluNrZsBlujj/LJfYn5k5IENhsErEw007B5zH0s85zxqrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZYRNLxm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZYRNLxm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877461F000E9;
	Fri, 28 Aug 2026 06:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787899512;
	bh=ynn13rfMSiPWGn7fdJBy7qDtaBcLzzYwzmXXvKd9m94=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RZYRNLxmbi9PJSXJOSzyMTGoIQr/f6l5Nk2TcgJ9vMM3hAJmHfUTrTDMpTTBxTZ7Y
	 JtZKeXGcSP0eiAdDKN0jmyQ3rhyK/6WwZ0903Z3O16lW8dKlGnRjVgvJZ49VserfBv
	 cVAaItTFZtHLTcUgpdriPnGdthXZ5QAlVw4bNJ+wJ50iyFJjZbkWBNOSHm3XuadHVu
	 ZL5WhBCjDw+EwcVMzd5gCqR3Fe6kZoWT6bNCFJLhcilR5gRI3cQJ6+fI5rl5nbKq2L
	 TUevNd38EuGfa6vrpAvBtDBLeVCKC+ApzcfLgZaTjsSTTZVPt3CqVjuHCafdeTyR3o
	 8OhJwsi/b/OvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/10] dt-bindings: iio: adc: support the TI ADS126x
 ADC family
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260828-ads126x-v4-2-1dc27e9c0260@gmail.com>
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-2-1dc27e9c0260@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 06:45:12 +0000
Message-Id: <20260828064512.877461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The conditional blocks restricting `reference-sources` use an in=
correct regex `^channel@[0-9]+$` which fails to match valid hexadecimal uni=
t addresses like `channel@a`, silently bypassing schema constraints for hig=
her channels.
- [Medium] The cell-count property '#io-channel-cells' lacks a 'const' cons=
traint for the 'ti,ads1263' compatible string, violating subsystem guidelin=
es.
--

commit ffd177f411725c6f5e66daebc6c552aaa2c40ee0
Author: Kurt Borja <kuurtb@gmail.com>

dt-bindings: iio: adc: support the TI ADS126x ADC family

The ADS1262 and ADS1263 are 32-bit, 38.4-kSPS delta-sigma ADCs with an
integrated PGA, internal reference, excitation and burn-out current
sources for sensor biasing and diagnostics. The ADS1263 includes a
second auxiliary ADC for background measurements.

> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml b/=
Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
> new file mode 100644
> index 0000000000000..7e26572388e4f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml

[ ... ]

> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,ads1263
> +    then:
> +      properties:
> +        '#io-channel-cells':
> +          minimum: 1
> +          maximum: 2

[Severity: Medium]
Does this violate the device tree bindings subsystem rule that requires
cell-count properties to have a strict `const` constraint?

Allowing a variable `#io-channel-cells` breaks the deterministic parsing
contract for IIO consumers, which typically rely on a fixed cell-count defi=
ned
by the provider variant.

> +      patternProperties:
> +        "^channel@[0-9]+$":

[Severity: Medium]
Will this regex fail to match valid hexadecimal unit addresses like
`channel@a`?

Device tree nodes for channel 10 (which uses the unit address `channel@a`)
will silently bypass the variant-specific length constraints for
`reference-sources`, allowing malformed configurations to be accepted witho=
ut
warnings.

> +          properties:
> +            reference-sources:
> +              minItems: 3
> +              maxItems: 3
> +              default: [internal-p, internal-n, internal]
> +    else:
> +      properties:
> +        '#io-channel-cells':
> +          const: 1
> +      patternProperties:
> +        "^channel@[0-9]+$":

[Severity: Medium]
Does this regex also miss matching the 'a-f' range, bypassing
`reference-sources` constraints for higher channels on the `ti,ads1262`
variant?

> +          properties:
> +            reference-sources:
> +              minItems: 2
> +              maxItems: 2
> +              default: [internal-p, internal-n]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-ads126x-v4=
-0-1dc27e9c0260@gmail.com?part=3D2
