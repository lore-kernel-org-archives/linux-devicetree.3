Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA1B377004
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212707; cv=none; b=EALgeuY3p0jNlFFcH1M53evEoXMOuU3ntediUgEDWs25tgUIVBm5oHyYVf9CmgS83ZODQ1pdi+7qJv/viUFHnHW4ejtgFxYrSmKUKSwocvAN2BaW+XwiRTZy6FmpXs3F6TkXH4/bFEaKQT/D4R3gGvBkllKaU4wiKj6TwRvQUCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212707; c=relaxed/simple;
	bh=yCjcEU/zJ1VXKmJoltuZ5e+4REu9WjXwk2iA1H01GqA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e46VS685E4BVtpZ8jkIci2MzxJwzYGhn8rncpQc49YZJomlB2goFKjO3Ixg+iBSdetA1jggD/1O8I6p8p1i0P3D+G8Ntc7LAZw+R7oR0GaENCuEreYN29llU+mWNw7+4ST0yXAqwmkN53D9ifDT3v0c1W0sAxjGzSXSsLhGQMyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+C6lWWe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+C6lWWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F8A1F000E9;
	Tue, 23 Jun 2026 11:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782212706;
	bh=ZsGQ1D78Ky4/PFHTAXLx0JChWu/NAKZdAhVGO6QN4dA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l+C6lWWeRWh1YXJMhEb0KRnTsh5CMyFdSTPPrah2PodC+usI7r1k76IuKfgOitFhx
	 kctgybvsxF4wXmG2odwA+Lr8HrYPA2XWuN94G+XhGQXUGbsQQ5xeUeaPlOqVbyjMBA
	 ac+771nhrhssPBOawpwkD53IzhvQzAUOFqa9NVw3aiuD3TMC/L4d+UjDZmXitQMYJx
	 3jrSAG6+y6UdI6AKA45DaFhjPVll8IYXqvgFW+aVIJdz93Du0XhPIWDNQgWjervGyj
	 BGGsezj7YG13Bznq50QoTLkdYv8p0syVg7WH9LtsC/GoubvTFEGOBIvA/J6bO9r4rJ
	 57TtbE89z4P5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/12] dt-bindings: iio: dac: ad5686: rework on power
 supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260623-ad5686-new-features-v4-4-28962a57db0f@analog.com>
References: <20260623-ad5686-new-features-v4-0-28962a57db0f@analog.com>
 <20260623-ad5686-new-features-v4-4-28962a57db0f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 11:05:05 +0000
Message-Id: <20260623110506.48F8A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The dt-binding makes `vdd-supply`, `vlogic-supply`, and conditio=
nally `vref-supply` strictly required, which breaks schema validation for e=
xisting device trees.
--

commit 91cd8407525317fa145de80deea6f4d2c2d3a4d3
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
dt-bindings: iio: dac: ad5686: rework on power supplies

This commit updates the AD5686 binding to add vdd, vlogic, and vref power
supplies. It also deprecates the misleading vcc-supply property in favor of
vref-supply.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml b/=
Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml
> index d781baca6a6c2..02e8c78e36d3d 100644
> --- a/Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml

[ ... ]

> @@ -60,9 +74,23 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - vdd-supply
> +  - vlogic-supply

[Severity: Medium]
Does adding vdd-supply and vlogic-supply to the unconditional required list
break dtbs_check for older device trees?

Since existing unmodified device trees lack these newly introduced supplies,
making them strictly required violates device tree backward compatibility.
While the driver handles missing supplies via dummy regulators, the schema
will flag older device trees as invalid.

> =20
>  allOf:
>    - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - adi,ad5676
> +              - adi,ad5683
> +              - adi,ad5684
> +              - adi,ad5686
> +    then:
> +      required:
> +        - vref-supply

[Severity: Medium]
Will this conditional block cause validation failures for legacy device tre=
es
that define the previously valid vcc-supply instead of vref-supply?

The driver code continues to support the deprecated vcc-supply for backward
compatibility, but this schema update does not mirror that logic. Could this
use an anyOf block to allow either vref-supply or vcc-supply to satisfy the
reference voltage requirement for these chips?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623-ad5686-new=
-features-v4-0-28962a57db0f@analog.com?part=3D4
