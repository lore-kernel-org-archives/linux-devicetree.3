Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669843ACEEC
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782656351; cv=none; b=nnQlBaz9WwPy/EKWBBHhL+OZ3rMSzwuK83dcbsVLfFqXaHerK9t2RW11kyaXuOswg238JKf2T8KplEhhcy7Z3slGfHjFb+/73t3TTcD9cAVfv++4lJFqmhkv72RX/Fv87Hjk8dEDsI/XjKQ7iuWvUvZ1pjZVCNZ0GOYrqbXb+AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782656351; c=relaxed/simple;
	bh=gRnX7/x8Ads827anbOyL0qFQBys27Mf0SfogZiYqmCs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RtdLAu4Zf61+oGU3Y1P+oeh0clHWpxgaS3Z4Vb2nqgP+F7PG9fv+y30JMS9USs2g/C+xjS5Qsr7Zn4MWhaBhtSZITsvaNtQRNio70+FFQVxkQXLKRfipMpUqnq/34Sta8t/nZzlYavs7qduASsg+iZ5AwGnpNNBbl3O9Yem3/cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dmxatIy8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmxatIy8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A111F000E9;
	Sun, 28 Jun 2026 14:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782656348;
	bh=9THOuhq9QMeoEYP3cPeCt/z5hJ/sTUccDAfruIVFo90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dmxatIy8U/0q96io7p8/lvGtmqVBeQq286EXVuTsxZ1HCWdCjHZMa7wh7pAW3oaFh
	 9zSIrnd++joLM4KHMjwD57GjOineYiHuVX5OkVHn1lpLZG+tujEISbdayrhoOS9ncn
	 xOwvWdoVtHwh1k2RpBRUwLFmCo5R3GZ0xFkWwKEpDDTD2DIGpPjN4rY7MCS0gOvuMN
	 U4HryDzkB4kED/VIjToIYWwJnNh/Di46PX24pwf5wIZC8UuthHmbVSj/f3w3JNJuFR
	 lb4oEZpDlZImQxFJQMQSLuakQSaJ4p/iE1xOJG3P67tqa/XmJUjiIV2fvqaRZ5PT6O
	 tOacxGCo/ohlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/12] dt-bindings: iio: dac: ad5686: rework on power
 supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260628-ad5686-new-features-v5-4-577caadbf7c0@analog.com>
References: <20260628-ad5686-new-features-v5-0-577caadbf7c0@analog.com>
 <20260628-ad5686-new-features-v5-4-577caadbf7c0@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 14:19:07 +0000
Message-Id: <20260628141908.67A111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Unconditionally requiring `vdd-supply`, `vlogic-supply`, and `=
vref-supply` breaks device tree schema validation for existing, previously =
valid device trees.
--

commit 0fb515588de05f04b0a128cbc333f2b88d5550dd
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

dt-bindings: iio: dac: ad5686: rework on power supplies

This commit updates the device tree binding for the AD5686 DAC to add
supplies for VDD, VLOGIC, and VREF. It deprecates the vcc-supply
property in favor of vref-supply and marks vdd and vlogic supplies
as required for correct operation.

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

[Severity: Critical]
Does unconditionally adding vdd-supply and vlogic-supply to the global
required list cause a regression for backward compatibility?

Existing device trees that successfully probed without these properties
will now fail dtbs_check validation.

Should newly introduced supply requirements remain optional to preserve
the Device Tree ABI?

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

[Severity: Critical]
By making vref-supply unconditionally required for these compatibles, does
this cause a validation regression for older device trees that legitimately
used the now-deprecated vcc-supply?

To transition away from vcc-supply without breaking existing device trees,
should the schema perhaps allow either vcc-supply or vref-supply to fulfill
the reference voltage requirement (e.g., via anyOf)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628-ad5686-new=
-features-v5-0-577caadbf7c0@analog.com?part=3D4
