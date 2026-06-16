Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25557165F16
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 08:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781598950; cv=none; b=NSS+/I6lQ3+/RhvsEu68u/jupmDrtTpcLsockNl+YswtWrodHH0fBo05I69rCvCwg50FAHDBKit4gx3TxqchowBkhlzkHkg5JaniC2mibKWoV08kbVhIS3AqagT4pKpH+5bl75M+1kXbm8wf/fh8ZvzNiU+MShXMroulgS26QxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781598950; c=relaxed/simple;
	bh=VJGOrDnaMXIdiu0GvQdPA8BLpv9Fyzb6dfrAspKgsNE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PBuWo2PVIOiAovHQovckPk6R4ZKUAuvUZVk1RcxOxMMZf4vlKCx+jcHvNcvnguxB3Gn0Nk0N0s23RQKlRn/wJ2SoNZYwRwYIy9/2k7eRb+mp/5pQzDVJsVGynGKe/FGJbH9OPiGMz046SQJmRfeSWNi/cCFz7UPL2gLz/vm7uXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdkhJ2Ko; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdkhJ2Ko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFA71F000E9;
	Tue, 16 Jun 2026 08:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781598949;
	bh=dYt30TTrkPtDgKjv+qVuUOFRU9L/IxBEg6clWB4IiT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RdkhJ2Ko5IwujJMNZaqsJHn66OR5Or63lsG8K32ut4rw2bxuzKls3iHmPqmr1vYUN
	 bL5LvUDo3H7/nEvc79kMSOo8dttLPLDavsbSlUWU5HzkqrZqiBTaYLcnNA7ldohm2D
	 lNJ7uBb1Un+QPYIzJ6IKvyMZDRaL76QuVa4ygTx+JKqztxILjv5BR7E2f1e7U8ZmAC
	 rq3Q6uDauOPxN7qlMi3TS7tccs16V5oK45zNnxbTJR6ny/SdyCV7sVWiY4v/C6Ov/u
	 4kWEpFWqMhja6SresqkKtHNJsKip/jRlCVlQwivdvvrcqd5Srt/trZBi6a/rkQx/lg
	 pI0QxJ82rlvIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/12] dt-bindings: iio: dac: ad5686: add
 reset/ldac/gain support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260616-ad5686-new-features-v3-3-f829fb7e9262@analog.com>
References: <20260616-ad5686-new-features-v3-3-f829fb7e9262@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 08:35:48 +0000
Message-Id: <20260616083548.CFFA71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The conditional block restricts `gain-gpios` for single-channel =
variants but omits several multi-channel variants (e.g., `adi,ad5672r`, `ad=
i,ad5676`, `adi,ad5674r`, `adi,ad5679r`) that lack a physical GAIN pin and =
internal multiplier. It also fails to restrict the `adi,range-double` prope=
rty for these multi-channel variants.
--

commit aa16b66ecffaca7347b3cea2e8c47bd2390db0b1
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

dt-bindings: iio: dac: ad5686: add reset/ldac/gain support

This commit adds GPIO properties for RESET, LDAC, and GAIN pins to the
ad5686 device tree binding. It also adds an adi,range-double property to
indicate when the GAIN pin is hardwired high.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml b/=
Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml
> --- a/Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml

[ ... ]

>  allOf:
>    - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            anyOf:
> +              - const: adi,ad5310r
> +              - const: adi,ad5681r
> +              - const: adi,ad5682r
> +              - const: adi,ad5683
> +              - const: adi,ad5683r
> +    then:
> +      properties:
> +        gain-gpios: false
> =20
>  unevaluatedProperties: false

[Severity: Medium]
Does this conditional block also need to restrict gain-gpios and
adi,range-double for multi-channel variants that lack a physical GAIN pin?

Variants like adi,ad5672r, adi,ad5676, adi,ad5674r, and adi,ad5679r also
seem to lack this hardware pin and an internal multiplier. If omitted from
this list, the binding allows these properties to pass validation for
incompatible hardware.

Furthermore, if adi,range-double is provided for these multi-channel
variants, the driver might initialize with double_scale =3D true and
permanently report an incorrect 2x output voltage scale to userspace.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-ad5686-new=
-features-v3-0-f829fb7e9262@analog.com?part=3D3
