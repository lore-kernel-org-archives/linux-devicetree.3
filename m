Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E544CE678
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 19:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789500403; cv=none; b=qyn8nf0a3kzxMZxNligNXNxEyhZgkC4gPrRVPk0eUZ8Z1gp0VUL2pqXYfyAh7W7Kyyz+kSzDKl4bt4C9J0FlY0k9Dt0r6Aj8+fA3r8XgBM3wU4rg/4ZHgfXI1MS1m38o26rF0VXPdEymtet5U+aLV2RyfIr1xt+o5B7NKHuAcsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789500403; c=relaxed/simple;
	bh=h5hXP2/bux0A3rkD03OChr0wE9MCPn2JDNaExG+2rPs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p6gMze0EOeXBO2w7USYzndFVeMq1VqMRxtd/BBBW8otTe1y2QaxipbqtGTohbAbWqjuY4poariTnzhnZiOz38txe7RhbgHzIW/g6xQDHRcgnz5YU7DNQagtKkxX88rWjAsnu5jpAy/JELpADwR0dtP8HwCDmKLMJ/CzYLwAKwak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfmt3sKe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfmt3sKe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636AF1F000FF;
	Tue, 15 Sep 2026 19:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789500400;
	bh=vdN3OYzkJIRJEiralCZ04JUcQaT9cHJ82RqQ9GW4Iic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cfmt3sKes5TUNXVei766/scJyJipDijPpBr3rpn2WrUfU1xkrvUUDUnyMqDRtliTj
	 UR0NIJvhE1T4u01LO+O7RGKkCe7PWbAZhcpbTvvfd998DbJxFykTw0AFNPwFQGiJwW
	 8333zz5OZA1zYfsCv2SbqyUH93PpjMrhvdE/0i1F6wBZSfXv5CS1RfKvqFYs2TZBxr
	 t8Ci7oCG+lLsFNbQh+m3AWgxRn735tg+zVqd/cLDnimamJfPy+eIfwQ+oEIPMoBCp5
	 CBcux96PvAhuUeajC5F9aJ3Fe8JIUitwOMwA6rPZinW8NPt/vjOrfzqszPOig90D/e
	 LpVhZ8JK7Px5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/15] dt-bindings: iio: adc: adi,ad4134: Document
 SPI connection mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <304d10f12a3418fbd5598160609a6eda09ed4100.1789494473.git.marcelo.schmitt@analog.com>
References: <cover.1789494473.git.marcelo.schmitt@analog.com>
 <304d10f12a3418fbd5598160609a6eda09ed4100.1789494473.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 19:26:39 +0000
Message-Id: <20260915192640.636AF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: invalid DTS syntax in spi-rx-bus-width const constr=
aints
- [Medium] dt-bindings: schema allows bypassing daisy-chained-devices requi=
rement
--

commit 879c8beee9c21345a2925282a985c10001e710eb
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

dt-bindings: iio: adc: adi,ad4134: Document SPI connection mode

Document how AD4134 chips are connected to the host SPI controller
according to different wiring configurations.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> index ea6d7e0264190..012e09decf7af 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
[ ... ]
> +  - oneOf:
> +      - required: [adi,spi-mode, '#daisy-chained-devices']
> +        properties:
> +          adi,spi-mode:
> +            const: one-channel-chain
> +          spi-rx-bus-width:
> +            const: <1>

[Severity: Medium]
Will this assignment of <1> to const cause a type mismatch during schema
validation?

Since the YAML parser evaluates <1> as a literal string instead of an integ=
er
array, it appears that when a device tree specifies a mode like
adi,spi-mode =3D "one-channel-chain" and provides a valid integer for
spi-rx-bus-width =3D <1>, it will unconditionally fail validation.

> +      - required: [adi,spi-mode, '#daisy-chained-devices']
> +        properties:
> +          adi,spi-mode:
> +            const: two-channel-chain
> +          spi-rx-bus-width:
> +            const: <1>, <1>

[Severity: Medium]
Does this string literal assignment also trigger a type mismatch when valid=
ating
a two-channel-chain configuration?

> +      - properties:
> +          '#daisy-chained-devices': false

[Severity: Medium]
Can the fallback branch in this oneOf block inadvertently bypass the requir=
ed
constraints?

If a device tree completely omits the #daisy-chained-devices property, this
catch-all branch seems to trivially evaluate to true, because property
constraints in JSON Schema only evaluate if the property is actually presen=
t.

If the branch evaluates to true, the outer oneOf block succeeds. This appea=
rs
to circumvent the mandatory #daisy-chained-devices requirement, allowing
incomplete configurations to pass validation when adi,spi-mode is set to one
of the chain modes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789494473.gi=
t.marcelo.schmitt@analog.com?part=3D9
