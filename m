Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009AC3769ED
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308605; cv=none; b=B/qYcBDy8Dnop6Vicd9fHP6VKkLwRdqLXTDqWgpz5+N+UtQcKNyheuKrLgAK64I/ekJ3FK9lQqVGGVVdTye4Ima5VsYNnMRX8GjAsAIpXaLR+fpMcgVEmSLgvg/hxguZ8o/aXIbbJDr1Zgn4pQFVT1PF00ocMyq3TYngHkvbFgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308605; c=relaxed/simple;
	bh=43+6dSb5A6o/8fx5ffjqpmigwxlhRQQBe6BN+r7anJg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F+zKqr2Z0rWV9d/XBKC1n7L8xOrQzVJSemjYQ/PM6JEg8NPRqsvT0yMzfaMSRff2EBbvrglWbNu+Tq2djQRa695E2tfy8V4vWe1mlsDygvfkKwlM72y4QzV9fwC9J46EUyR+PEfoeRPT/YFA01kX8S7sHjltruRQv/xIRjkAMvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVjZkE1n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVjZkE1n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73C31F000E9;
	Fri, 21 Aug 2026 10:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787308595;
	bh=DdQrJ1I+XBtZUkhluly3HnkgX9mwltfFjcwz9XxiS1I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YVjZkE1nECb6LDVx55V8zOCUKTieY5oE1ABrLSISswRXHxMDBVK30grb4trgYG70T
	 EZBYTqV6FM8/1HbMfl/xnf3nwamOwvMZ/lP4RF/lcPiXfSk3vDQmvUJCEPxaiQLOrK
	 eiF0qzSnnZ40/s3SxwUBHcW/mmHZiQxz1YCjpPggdIPYa/YvvdyLPc1GjMNWaMosdH
	 rTCEG+25VqIdXGg5BvbC50lV5nwgLLY4E1WSLGcPpi2GPVQCFqJMI8vcfjcrBZRJto
	 YMvNUkAJhrCG83LjrnFDDlrQjQEgALVRAPv7QHmmkdonf8VevqhY+AUlsM5kbL+vzO
	 r8fFb66KtKyCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: iio: dac: ad5504: add output-range
 and missing gpios
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taha Ed-Dafili" <0rayn.dev@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260821102452.37407-2-0rayn.dev@gmail.com>
References: <20260821102452.37407-1-0rayn.dev@gmail.com>
 <20260821102452.37407-2-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 10:36:34 +0000
Message-Id: <20260821103634.C73C31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `output-range-microvolt` property is defined with an `items`=
 array but lacks `minItems: 2` and `maxItems: 2` constraints.
- [Medium] The `vlogic-supply` property is missing from the devicetree exam=
ple, contradicting the commit message claim.
--

--- Patch [1]: [PATCH v5 1/6] dt-bindings: iio: dac: ad5504: add output-ran=
ge and missing gpios ---
commit fae484c36ed84e118c97518d409f24eed9d5eadd
Author: Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: dt-bindings: iio: dac: ad5504: add output-range and missing gpios

This commit updates the AD5504 device tree binding to support output voltage
range selection via the R_SEL pin. It adds output-range-microvolt and missi=
ng
GPIO properties, enforces mutual exclusivity for range selection, and updat=
es
the documentation with a usage example.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml b/=
Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml
> index 9c2c038683b4d..e0123dceaa336 100644
> --- a/Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml
[ ... ]
> @@ -27,6 +29,29 @@ properties:
>      maxItems: 1
> =20
>    vcc-supply: true
> +  vlogic-supply: true
> +
> +  output-range-microvolt:
> +    description: |
> +      Specify the channel output full scale range. The R_SEL pin
> +      determines if the range is 0-30V or 0-60V.
> +    items:
> +      - const: 0
> +      - enum: [30000000, 60000000]
> +    default: [0, 60000000]

[Severity: Medium]
Should this property include minItems and maxItems constraints? Without=20
explicit bounds like maxItems: 2, will arrays of arbitrary length or missin=
g=20
elements silently pass schema validation?

> +
> +  range-sel-gpios:
> +    description:
> +      GPIO connected to the R_SEL pin to select the output voltage range.
> +    maxItems: 1
[ ... ]
> @@ -45,6 +78,10 @@ examples:
>              compatible =3D "adi,ad5504";
>              vcc-supply =3D <&dac_vcc>;
>              interrupts =3D <55 IRQ_TYPE_EDGE_FALLING>;
> +
> +            output-range-microvolt =3D <0 60000000>;
> +            clr-gpios =3D <&gpio 4 GPIO_ACTIVE_LOW>;
> +            ldac-gpios =3D <&gpio 5 GPIO_ACTIVE_LOW>;
>          };
>      };
>  ...

[Severity: Medium]
The commit message states this patch will "add missing vlogic-supply...
and provide a complete usage example." Is vlogic-supply intentionally omitt=
ed
from this example block?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821102452.3740=
7-1-0rayn.dev@gmail.com?part=3D1
