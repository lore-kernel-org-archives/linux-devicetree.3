Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B83397692
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615765; cv=none; b=eVFmWAx9o5CpoRQA1aFcxWRzQD/GinyeGNgyrgXnvmq5od7mW+oSd0r/KfR5hk9cxa2i1JfMwho2HTRV9gO2iM0v/AhxaVQ1kIuhj89uJVoBY7beJpxgvYLPu3r4nFDXQqkQEJsq1ZOP/eJE3KPPjsFrC6r9XR0fOLmcfkLeYZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615765; c=relaxed/simple;
	bh=5LVzl8+5TonogMauifed77ZuPM0YRb5mwEXOmfrZNHA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qiHfpWEao4kJ+Ld9BMPhQ3HFoFSriuYaD1TpOr4xQ+fHisnmLIOUrdoq6tPIhPhrOsmslKjETtPTWyuDNHgdElfM62zkWLx7mRBcXrNn3WiYIBwcQCiN9sOr7dJYlqcBMXQovUwxjpc3YOVvjyPR9UcJo3OqiwroK5XZFh5YAg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNTWjPJS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNTWjPJS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8B51F000FF;
	Sat, 10 Oct 2026 07:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791615764;
	bh=gTmlymgShkGck72623G4x/vdhfc3jkNJeBmH25j6ERU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RNTWjPJSIx0/evDkqkmjvyItL7csVeEOtXbUhnyYbgW1qw6VJMd0xoyVAup+xcgXh
	 m3zvbfwEc12eaxHJ6NiZUJN4MBc9HC3qL7haubfRIAp/WocRKD65FmjO8FYbwOm2VJ
	 oKwXtmSuilyV8FFsmv4HinIlFqT1g/yZUMuKIn6NdwGgBC25+623z8kzVk9cMJyc3p
	 qbGEPbto7oydsAdVqoUO69vBjJifr4o07jzYOOTUTv4Iz7JmrkMEhUbjuoT/4QO2V1
	 vgwcsPC47V8XU8OM6WNgDwG5LXOWnH03cLKYk+2xvxdCYEhQZMfU79VrIpQm1w3PVh
	 dtpVNb3a1sEWQ==
Message-ID: <sashiko-outbox-166287@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/10] dt-bindings: iio: adc: support the TI ADS126x
 ADC family
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261010-ads126x-v5-2-49e331cb2fed@gmail.com>
References: <20261010-ads126x-v5-0-49e331cb2fed@gmail.com>
 <20261010-ads126x-v5-2-49e331cb2fed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 07:02:43 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing mandatory required properties for GPIO cont=
roller
--

commit 71f9ec7fa4f648264b425d77eb77849a06771e4a
Author: Kurt Borja <kuurtb@gmail.com>

dt-bindings: iio: adc: support the TI ADS126x ADC family

The ADS1262 and ADS1263 are 32-bit, 38.4-kSPS delta-sigma ADCs with an
integrated PGA, internal reference, excitation and burn-out current
sources for sensor biasing and diagnostics. The ADS1263 is compatible
with ADS1262, but includes a second auxiliary ADC (ADC2).

> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml b/=
Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
> new file mode 100644
> index 0000000000000..d9957aa509d8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
[ ... ]
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  regulators:
> +    type: object
[ ... ]
> +dependencies:
> +  interrupts: [interrupt-names]
> +  interrupts-extended: [interrupt-names]
> +
> +required:
> +  - compatible
> +  - reg
> +  - spi-cpha
> +  - avdd-supply
> +  - dvdd-supply
> +  - '#address-cells'
> +  - '#size-cells'

[Severity: Medium]
Since this hardware adds provider capabilities by defining gpio-controller =
and
#gpio-cells, shouldn't these properties be explicitly included in the requi=
red
list?

When hardware gains new provider capabilities like a GPIO controller, the
dt-bindings subsystem guidelines state that the corresponding properties sh=
ould
be mandatory. Omitting them from the required list allows incomplete device
tree nodes to silently pass schema validation, which could cause drivers or
dependent subsystems to fail at runtime.

> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-ads126x-v5=
-0-49e331cb2fed@gmail.com?part=3D2
