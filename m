Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40E129A32D
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 06:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783233629; cv=none; b=Fls1bD5MlnsjTPPb2ReyP1IZ4BKKwHB2SXFBC0qXZvrlQhD136aEDh9Pib9jr3y9pVX9IAmXqEtiJhj/iOi16EFlpCUf5MJwgmZ8d8/N3vYax3orbAb3wP0jECqgA2JjSa3qwAFP55Mr3BxumtpVtfHr61KGtCujN13cswf0AjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783233629; c=relaxed/simple;
	bh=jEs66XilJmN+7iSH87C02x1+eM23XJ/Jkq+zbdHvLsw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T5TwPG8kpj0/2KSNbA5hDF+4X83lyBhKV+Um3R9m9X/6kALrQ40Z/7ud6/daQxpQ2JWEZSFUNA/XeDClxw2HQdGhgJ/HWk3vcuTjhiUiz0O5TaD1ZvY7zbSGvDTF9AkBg9TApzJH3DG4DW7I1zPNAzRqqumVdnJJi0azmFolGrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbKbfDgJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbKbfDgJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308291F000E9;
	Sun,  5 Jul 2026 06:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783233627;
	bh=a7gvqAYm+Bm9ZP0iRE6jhyPv8kS5J19iw0ekDpLw2kY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YbKbfDgJV5hfKkfOdDANWlXwNZY5GUihuHM7YmrUdHHGhiFx5f8AIArPN4j3MmnkJ
	 0KnD/0vUZMZ9UzMKMarB9L/pKkn+5Wm7ktjMT+yzHyiebH4XxXyu+ZwctjkO+49Hlv
	 BTtZOk8Om901KCYl7p0OO7SrrBm4sMaANO1ltFUhm5AKlN+VpP1vtkB9Df1gknkp6R
	 FTxyNbFS8dUTrwQXV3k4NVX4jy5R4fHxw+2r0pNTucyEgYwi9uN6kF+iqit5bPVgCk
	 zXQFqd5csb1oSL00pSOeA2y2rcx+iixuRO3sh/Mley1CtDYazGCseVqUpiqg6lz0V3
	 qkxbDf3lhCM7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: convert Xilinx XADC bindings to
 YAML
Reply-To: sashiko-reviews@lists.linux.dev
To: Avermoal <avermoal@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260705063415.33076-1-avermoal@gmail.com>
References: <20260705063415.33076-1-avermoal@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 06:40:26 +0000
Message-Id: <20260705064027.308291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Missing conditional requirement for `xlnx,external-mux-channel` =
when external multiplexer mode is used.
- [Medium] The `reg` property inside `xlnx,channels` child nodes is incorre=
ctly typed as a `uint32` scalar instead of a standard `reg` array.
- [Low] Missing `required` array for `#address-cells` and `#size-cells` und=
er the `xlnx,channels` node.
--

commit b852b5cc7e3eeca9d9136f18bd2b9dbe89f63532
Author: Avermoal <avermoal@gmail.com>

dt-bindings: iio: adc: convert Xilinx XADC bindings to YAML
   =20
Convert the Xilinx XADC binding documentation from .txt to YAML format.
This conversion is part of the ongoing effort to migrate all DT bindings
to a machine-verifiable schema.

> diff --git a/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.yaml b=
/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.yaml
> new file mode 100644
> index 0000000000000..a32b712d8485e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.yaml

[ ... ]

> +  xlnx,external-mux-channel:
> +    description: |
> +      Configures which pair of pins is used to sample data in external m=
ux mode.
> +      For single mode: 0 (VP/VN) or 1..16 (VAUXP[0..15]/VAUXN[0..15]).
> +      For dual mode: 1..8, where the value n corresponds to the pair
> +      (VAUXP[n-1]/VAUXN[n-1] and VAUXP[n+7]/VAUXN[n+7]).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 16

[Severity: Medium]
Should there be an allOf or if block at the root level to enforce that
xlnx,external-mux-channel is required when xlnx,external-mux is set to sing=
le
or dual?

Without it, device trees might omit the mandatory channel configuration and
still pass validation.

> +
> +  xlnx,channels:
> +    description: |
> +      Container for external channels that are connected to the ADC.
> +      If this property is not present, no external channels will be assu=
med.
> +    type: object
> +    properties:
> +      "#address-cells":
> +        const: 1
> +      "#size-cells":
> +        const: 0

[Severity: Low]
Are #address-cells and #size-cells meant to be required here?

The original text binding listed them as required properties for this node,=
 but
they are not enforced in this schema.

> +    patternProperties:
> +      "^channel@[0-9a-f]+$":
> +        type: object
> +        description: Each child node represents one external channel.
> +        properties:
> +          reg:
> +            description: |
> +              Pair of pins the channel is connected to.
> +              0: VP/VN
> +              1..16: VAUXP[0..15]/VAUXN[0..15]
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 0
> +            maximum: 16

[Severity: Medium]
Does this override the standard dt-schema definition of reg as a matrix?

Using a $ref to uint32 here causes a meta-schema conflict that will break
dt_binding_check validation. Should this use maxItems: 1 instead of redefin=
ing
the type?

> +          xlnx,bipolar:
> +            description: If present, the channel is used in bipolar mode.
> +            type: boolean

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705063415.3307=
6-1-avermoal@gmail.com?part=3D1
