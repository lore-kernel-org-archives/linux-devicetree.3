Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21706480DC3
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787155925; cv=none; b=OnPfkSfiBOWdyJcjjfokNER/SMS6xtAL9lKRO8f4Fx5tLlIscA42uxsvPIVqVsowsaDPyU0j43RjlKsseQprPB/JGMjuIyQrwdPHUSuOES4TVYyC+73w84OZp7msRjQzUIkJQqchUp/d2L/cGB5FoARgYfsdSQjzmaW63xdEtcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787155925; c=relaxed/simple;
	bh=s/ow6oxs7wTE1jg7Wbah4g0KFFD4sMt8XmiF5SncD0Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cmNAHTnKh6qc6r1YDALkEihB6vr3zfVD6cVIZyNxBqWTHi6Pp3ABWDg/UVseifcV20/GywRSw765ZO7BrOWlVdwBTKGlJaNqxILL6zwsySxgOMjV05GsiLyp792sOXpUD7nk3i7chkbZ5BoLzZV+Fymv274aJCHxSNjaxFrx13o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wq6otYNf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wq6otYNf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F871F000E9;
	Wed, 19 Aug 2026 16:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787155923;
	bh=2thD5SYQxISZkz/O6ogfw/jfO0bgwv9/LEpTpa7E0VI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wq6otYNfWGmqvybmiKl3iQHgXFaPSDrROEqiw6Ve3pyIDG5ZN9vFmOC4hziCiUPZ1
	 ClCLb/4am6GWlkyr7yUj3WzqaAapwLQKsKer2a/fe7l6FITDx5GDxo13x+CnsjxxFi
	 izh4qWs0S3D7YR3CzQohKYle0u070aR6Kq3i9oAZ7d2UVGQExJdO2E57uoJ+F+n8pq
	 2b3mOZdQYBltbgJgdPs5S4XMBNP2gR1OP3JaWZD7MMGn+uR7NFUtuc9bDf+3yCIxbA
	 L3tO6G9pW6UNloTGmIsJzsXm947SCW+X4BNrZ/48IGZuLVduECyxpDogwXtJhDXeuq
	 6zEF+QGssWuEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: otto-gpio: Add gpio-ranges
Reply-To: sashiko-reviews@lists.linux.dev
To: misha.zavertkin@mail.ru
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <df4e9924282ac9e719c693abb5e39201f172579f.1787130560.git.misha.zavertkin@mail.ru>
References: <cover.1787130560.git.misha.zavertkin@mail.ru>
 <df4e9924282ac9e719c693abb5e39201f172579f.1787130560.git.misha.zavertkin@mail.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 16:12:03 +0000
Message-Id: <20260819161203.80F871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Logical contradiction in JSON schema makes the `realtek,rtl9607-=
gpio` binding un-satisfiable.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: gpio: otto-gpio: Add gpio-ranges=
 ---
commit dc172e5a62e85037c013247864994cd4ea3bc026
Author: misha.zavertkin@mail.ru <misha.zavertkin@mail.ru>

dt-bindings: gpio: otto-gpio: Add gpio-ranges

This commit updates the realtek,otto-gpio binding documentation to add
support for the gpio-ranges property. It specifically requires this
property to be present when the realtek,rtl9607-gpio compatible string is
used to ensure proper pinctrl routing.

> diff --git a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yam=
l b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
> index b18f8f0ca0ae4..96396f968e788 100644
> --- a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
> @@ -40,6 +40,8 @@ properties:
> =20
>    gpio-controller: true
> =20
> +  gpio-ranges: false
> +

[ ... ]

> @@ -75,6 +77,18 @@ required:
>    - "#gpio-cells"
>    - gpio-controller
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: realtek,rtl9607-gpio
> +    then:
> +      properties:
> +        gpio-ranges: true
> +      required:
> +        - gpio-ranges

[Severity: Medium]
Does this create a logical contradiction that makes the schema unsatisfiable
for the realtek,rtl9607-gpio compatible string?

Because gpio-ranges is defined as false in the top-level properties list,
it unconditionally forbids the property. However, the new allOf conditional
block requires the exact same gpio-ranges property to be present.

Will this cause device tree validation to fail every time? If the property
is present, it would fail the top-level false constraint, and if it is
omitted, it would fail the required constraint in the conditional block.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787130560.gi=
t.misha.zavertkin@mail.ru?part=3D1
