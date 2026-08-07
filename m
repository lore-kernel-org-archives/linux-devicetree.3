Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9EF37DAB1
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112923; cv=none; b=lnlcvv5uw63WGw2vvoUauYa00Tc3i94YDGTl4cbBN8Y/q3kwWaYKpHduWj+TUr/nhxMznktUEP8z1qo/esgEC5jO41DjhK+XY2FWOc/9m2lDnjPN/OlU3VrQKXsAn4N7A32uahzirklCTLZqr93tcKaUCso3PKtjhk0Yu9Zx98o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112923; c=relaxed/simple;
	bh=hUCDVX25T/z18Zq32JBWm6Le0RBboCh2llew7A27wvg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rkYGPyj4JCWcx5d9SgfTS/3Vtn30MYLZWD+m9Xr9k7OFjeYwMi7qnJxlgzuAlFY8q3KpLc1zxky41gZHZk1VUdMdtaGdHcfQ0tPSWmAzVodLEATBvI735TFIE3sL0ojnoJV8Ac7cFZ+g54bGayLOaQpMLeDr0SxsoGWFZEnXAkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlvgansR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlvgansR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532871F000E9;
	Fri,  7 Aug 2026 14:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786112919;
	bh=mvnMQ7kxsmhsyzGe7TSEzwqf6FnQTVS/mXGaI+rDH4I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dlvgansRzP1CA/TuE/q4xZtGNHvkv98NA+gHT6i0RXbVXhxqYYjtfHuvs7nwZTqOx
	 0KZxvjzKfLIPIwsAeFKUSMeorlZYDuQv2fJD/bFdr0k+SXLPUIgVeOBi0kxOumgMUn
	 08+U9fZcOl2SATcZ7g6AefWCsT04YzgVs4C7m+eyApUcGiUfITUJL7FxLvlyZzVkzQ
	 5V/LOtSszLm/Lj6qi+ytYLSuynSk/YcuAtyr3OepcmpdrUMANOca8H9obp/6jID9to
	 1h6QssRmEiTQJmWdw/scPz9UPGGPoNi8kPrZzWT7o3MFrQrxiwXCGjDs2Qxqn4okGZ
	 79mmFAXw/sLwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: add Chipwealth CH1115 OLED
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Tmljb2zDoXMgQW50aW5vcmk=?= <nico.antinori.7@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <cf9b02d618db4eca88e2d32b4bf779011fcd550d.1786110720.git.nico.antinori.7@gmail.com>
References: <cover.1786110720.git.nico.antinori.7@gmail.com>
 <cf9b02d618db4eca88e2d32b4bf779011fcd550d.1786110720.git.nico.antinori.7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 14:28:38 +0000
Message-Id: <20260807142839.532871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree schema is structurally unsatisfiable and introdu=
ces hardware-specific properties without vendor prefixes. `first-page` is m=
andated by the `required` list but is not defined in the `properties` block=
. Because `additionalProperties: false` is used, any device tree node inclu=
ding `first-page` is rejected, while any node omitting it fails the `requir=
ed` check. Additionally, `contrast` is used in the `examples` but missing f=
rom `properties`. Finally, `invert`, `first-page`, and `contrast` are custo=
m properties that must include a vendor prefix (e.g., `chipwealth,invert`) =
to avoid polluting the global namespace.
--

--- Patch [1]: [PATCH 1/3] dt-bindings: display: add Chipwealth CH1115 OLED=
 controller ---
commit 77e215ca91e888007e7e74fb225f1cb55be392a1
Author: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

dt-bindings: display: add Chipwealth CH1115 OLED controller

This commit adds the device tree binding for the Chipwealth CH1115 monochro=
me
dot matrix OLED panel controller.

> diff --git a/Documentation/devicetree/bindings/display/chipwealth,ch1115.=
yaml b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
> new file mode 100644
> index 0000000000000..29d55da85d219
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: chipwealth,ch1115
> +
> +  reg:
> +    maxItems: 1
> +
> +  invert:
> +    type: boolean
> +    description:
> +      Display pixels are inverted, i.e. 0 is white and 1 is black.

[Severity: Medium]
Should this property have a vendor prefix (e.g., chipwealth,invert)? Custom
hardware-specific properties typically require vendor prefixes to avoid
polluting the global namespace.

> +
> +  width-mm: true
> +  height-mm: true
> +  panel-timing: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - width-mm
> +  - height-mm
> +  - panel-timing
> +  - first-page
> +
> +additionalProperties: false

[Severity: Medium]
Is first-page missing from the properties block? Because it is explicitly
mandated by the required list but not defined in properties,
additionalProperties: false will forbid it, making the schema unsatisfiable
for any device tree node.

> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +      status =3D "okay";
> +
> +      display@3c {
> +        compatible =3D "chipwealth,ch1115";
> +        reg =3D <0x3c>;
> +        width-mm =3D <12>;
> +        height-mm =3D <8>;
> +        contrast =3D <127>;
> +        first-page =3D <1>;

[Severity: Medium]
Are contrast and first-page intended to be defined in this schema? They are
used here in the example but missing from the properties block, which will
cause dt_binding_check to fail. As with invert, do these custom properties
need vendor prefixes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786110720.gi=
t.nico.antinori.7@gmail.com?part=3D1
