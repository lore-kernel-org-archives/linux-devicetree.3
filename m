Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CB233D6FC
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 22:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786833089; cv=none; b=SsGxHFzL1h+305zGhWUueLqFC+QNYi8CD861bbSXdlX25hX49gVWVNojL32ptJQy33i4ajAy1O9Geu0Jk6zuctojU2/N9PywXB+5rAjU+57FWlCvZhUXSZb+pu/qVTYYD/NYpz1yieqlniXZdqETdUC4c8Ip22IhXR434K4onWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786833089; c=relaxed/simple;
	bh=48u/LEljcxMW7n1+b7t0ocOnPpWZmBmR0DMr5z0FCpM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p5oNeBO/LEXUYHHjbRkakbftn8Q2oWgO0wj7qyynb1Xtg4y3yJxmZE8NF/DgptYkX4jgBG1Z0AnsvXvFNc2WF+XmkpBTyrRkXWcjKPra6xp8mmFsPEGIpLEG3/J9H0bnTCYCXSC+kColHlgMVO3hkbbJXXx8BKD8RueWwIMBoB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4JKorq/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4JKorq/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A49C1F000E9;
	Sat, 15 Aug 2026 22:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786833086;
	bh=RxNUIaxsZckOkxbxNhLYsF3Le7s1VlB0JPC7lp738Xg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V4JKorq/YoU5S5cjzBUci7kifVEQE6fiznAU7q0cHiISkg0UWe9h1E85ZB7xuRZ83
	 E7Z2z3rYVO180qLQ00PqsSetUyhhPIissxPmv3Wiw7G6P3hFv0bqNwIZpVEGkyJW9/
	 uu21Y0z0G1bp0+Gj/lpRvDmL4mckzmc1HwZTFixhwf7d3OzApJIhDRsacQXAFoOFAB
	 FqGtZMnE4HwYd2Y+OEsYc5DFoHfWWTx9PtPH71pfvr0NU+w3/Wz/+97+OzuPlXLbAA
	 6IJBj6zMvEfThbQVhtwqtQkFPzylE4HzRBU3KCaUC/6oyNRMwHe313Mf3F1E43K6VT
	 YzHP5fQ3xDBLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: spi: ti,davinci-spi: convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260816-ti-davinci-spi-v2-2-6c6f5171422b@gmail.com>
References: <20260816-ti-davinci-spi-v2-0-6c6f5171422b@gmail.com>
 <20260816-ti-davinci-spi-v2-2-6c6f5171422b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 22:31:26 +0000
Message-Id: <20260815223126.7A49C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Schema validation conditional uses `const` instead of `contains:=
 const`, bypassing requirements for compatible string arrays.
--

--- Patch [2]: [PATCH v2 2/2] dt-bindings: spi: ti,davinci-spi: convert to =
DT schema ---
commit d0abc65d99912b6ce06eea7206590c61cb52b6de
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: spi: ti,davinci-spi: convert to DT schema

This commit converts the TI DaVinci/Keystone SPI controller binding from te=
xt
format to DT schema. It creates a separate schema for peripheral properties,
adds missing DMA properties, and introduces constraints to the ti,spi-wdelay
property.

> diff --git a/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml b/=
Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml
> new file mode 100644
> index 0000000000000..b685082de721c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - ti,davinci-spi-intr-line
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          const: ti,keystone-spi

[Severity: Medium]
Should this use contains: const instead of just const?

Because dt-schema evaluates this strictly based on JSON Schema rules, an ar=
ray
value will not match the scalar const. As a result, when the compatible
property is an array, this conditional is bypassed.

This allows device tree configurations to silently pass dt_binding_check ev=
en
if they erroneously omit the mandatory power-domains property.

> +    then:
> +      required:
> +        - power-domains
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi@20bf0000 {
> +        compatible =3D "ti,keystone-spi","ti,dm6441-spi";
> +        reg =3D <0x20bf0000 0x1000>;
> +        num-cs =3D <4>;
> +        ti,davinci-spi-intr-line =3D <0>;
> +        interrupts =3D <338>;
> +        clocks =3D <&clkspi>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;

Does the lack of contains: const explain why this example passes validation
despite omitting the power-domains property?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-ti-davinci=
-spi-v2-0-6c6f5171422b@gmail.com?part=3D2
