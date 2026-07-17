Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0B237EFE9
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784312888; cv=none; b=RSsIIQ5TIPIT7zYYb4NHrG+L0s/EbXF0Ryc+fXViXWHtDE2O8fgvlr5wwLj00kQDYyqqhf/gb3DyrkoIxT9M9JkpTygtOUFj20aCK2GsRat5I2r7nyvbtHYfRrNU9ujckVb39qVJCtKzYI8gODQ67cPf8uV+53Dxen0xTCUNk4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784312888; c=relaxed/simple;
	bh=ZLpvuw5j2n3uToUHyKdpesQnAKTit3ph8Nd55dW74fc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mcHDesPPaDXGAouuDaX4rObrzlAQJIkWaxIHV5GEr7BQ1FgOKwf3V5XBaBrv7XzQtP9lsVYxWlZVzmit5dS1fKNU07yyLNw+eBWVuY8kdcreSOBtOmCo9UkS3jLhNdeTABiGx0UbjVmX41qyhD1Q5PwdSxOUXAzPoSkCeVMazIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GyxajGNX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GyxajGNX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12ABE1F00A3A;
	Fri, 17 Jul 2026 18:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784312887;
	bh=xQJTFj7NR8nwDEeqJKEGEI+YptdXzCltM+Ep1DITcNg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GyxajGNXyOE0OZlcaRSEsZogSINfIu3isl0vvg0XnH0gS4PIILZNalp1y1SZ5qRLQ
	 B1z8Hj5cSxgCjq8xmbUqcljysiKSHanNFVyOz5g4GFuh544cnWtJ3WXuf7hACcjaki
	 32S0nR3qaLl2o9EkUQyuGTTl3Cg9ttpbB5tyM7TEpb2Er1kvGfq5s4XuR41zX9R9Oq
	 +urmxFMfQMLrzgNzmqlrvgvuZYJ0wv7qp7gTlAa8e8ciRuW6N032Zy5fMSh9Qy/Na2
	 a1spit4uwmFGgJeasAhWSDtQN8fDiSmR2x4jpij5VizmwjlGmV5rPQd8rQl7bWaF6D
	 HkOJvMx7VmR5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: clock: ti,da850-pll: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260717-ti-pll-v1-1-f6f9ba8c9b5e@gmail.com>
References: <20260717-ti-pll-v1-1-f6f9ba8c9b5e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 18:28:06 +0000
Message-Id: <20260717182807.12ABE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The device tree schema example contains undefined phandle refere=
nces (`&ref_clk` and `&pll1_sysclk`), which causes `dt_binding_check` to fa=
il with compilation errors.
- [Medium] The schema fails to enforce strict bounds on `clocks` and `clock=
-names` inside conditional blocks, allowing invalid configurations to pass =
validation.
--

--- Patch [1]: [PATCH] dt-bindings: clock: ti,da850-pll: Convert to DT sche=
ma ---
commit d9fe4826c7bdb546d8ecd3e9ca8ac0454b95166c
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: clock: ti,da850-pll: Convert to DT schema
   =20
Convert TI da850-pll binding from legacy text to dt schema.
No functional change is introduced during conversion.

> diff --git a/Documentation/devicetree/bindings/clock/ti/davinci/ti,da850-=
pll.yaml b/Documentation/devicetree/bindings/clock/ti/davinci/ti,da850-pll.=
yaml
> new file mode 100644
> index 0000000000000..5e4109567b75d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/davinci/ti,da850-pll.yaml

[ ... ]

> @@ -0,0 +1,177 @@

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: ti,da850-pll0
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Primary reference clock input
> +            - description: External clock source

[Severity: Medium]
Since the global clocks property specifies minItems: 1 and maxItems: 2, does
this ti,da850-pll0 block also need minItems: 2?

Without it, a device tree node with only 1 clock could silently pass valida=
tion
by falling back to the global limits.

> +        clock-names:
> +          items:
> +            - const: clksrc
> +            - const: extclksrc
> +
> +  - if:
> +      properties:
> +        compatible:
> +          const: ti,da850-pll1
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          items:
> +            - const: clksrc

[Severity: Medium]
Does this block need maxItems: 1 for clock-names?

Since the global clock-names property allows maxItems: 2, a node with two
clock-names might pass validation for the ti,da850-pll1 variant.

> +        ti,clkmode-square-wave: false
> +        auxclk: false
> +
> +examples:
> +  - |
> +    clock-controller@11000 {
> +        compatible =3D "ti,da850-pll0";
> +        reg =3D <0x11000 0x1000>;
> +        clocks =3D <&ref_clk>, <&pll1_sysclk 3>;

[Severity: Medium]
Will this cause make dt_binding_check to fail?

The &ref_clk and &pll1_sysclk phandles are not defined in this example, whi=
ch
usually causes dtc compilation errors (Reference to non-existent node or la=
bel)
during validation workflows.

> +        clock-names =3D "clksrc", "extclksrc";
> +        ti,clkmode-square-wave;

[ ... ]

> +  - |
> +    clock-controller@21a000 {
> +        compatible =3D "ti,da850-pll1";
> +        reg =3D <0x21a000 0x1000>;
> +        clocks =3D <&ref_clk>;

[Severity: Medium]
Similar to the first example, this references &ref_clk without defining it.
Could this lead to a dtc compilation error during make dt_binding_check?

> +        clock-names =3D "clksrc";
> +
> +        sysclk {
> +            #clock-cells =3D <1>;
> +        };
> +
> +        obsclk {
> +            #clock-cells =3D <0>;
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-ti-pll-v1-=
1-f6f9ba8c9b5e@gmail.com?part=3D1
