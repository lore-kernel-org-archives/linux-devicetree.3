Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776067;
	b=AycqMdZkKks4nqK8OBOY5MZcsk38MRxmKqC7YzUiWW/H5jjvMuXLOXvnSB6Zr2dLuQVw
	 oNafHiM4JPQFP4R9VVfjFY38PrnodcMfRbyCzdM4aP2ips/ytn1Apr3WtwgZE1LcwcHdH
	 CpUGESkyBvHQvTMrM4QTd/sRcPpiB91DQuiT7LWCtdLnF2BsdzFU2CG2H7iQd4jWIyuDa
	 /NA9JODtrPHytJuBkOWrqCkDu9M7Z/gmroxlU1kQcYqUzPIBfem/XCT8SuFgHvRhCvUpa
	 dIEMcPlZ6vYs+lgP7MBohu9C0FwAO3IuB1DsdYCbdVDjS8ZSkEEq2Z+5+WkneuBztBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776067;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jXhaLXquA9loUJOqhB/y1cXw9xzKtlm/aTwwjqsAYLo=;
	b=Xa2eJ7V8xeo0iFxQkFzxFgdVj4BWpasi3cSEtHv0hHr8w/9uesOjKxq+S8gsgVmRBAyF
	 tRooqzDJdafiBd1CPpdqYg8dlDxy54Z5btzUq75QJRAi6fgYL6g1x/f743Pc+/GuP0jKs
	 Up1csT8f8NOgkvy3DPDYzDjk+tc2jW+9vWRWw+AvaYFpfG2WBbb/DBKoPj23gpWfNODKL
	 NqKpBWkCe113LxKfmAt9iHhOtaYerOK/uFSqhSeaydpfMj32GNtxNKRdKDDXmx2zA2tx0
	 heSDAsW31TbrgzwOHsi5zLIs42J/uELIfe/jsWE41GzDHBeSBNjksT5Q0Qtj4SN8cdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dhj09hqP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F23606A330
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 20:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dhj09hqP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4131F000C7;
	Sun, 15 Nov 2026 20:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794776067;
	bh=jXhaLXquA9loUJOqhB/y1cXw9xzKtlm/aTwwjqsAYLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dhj09hqPyfQDYJwNclIEqoDrn1eSDkN9z2oUXQCdbnaY0Ul+FmSiTkE9fZuYnEwZY
	 g2XcYxIFwxN6VCz5++5Mhqjz3jlrzM8rT6BZPdLwaookGdedTfsDmixWu4lcrAvUqc
	 tgZFs2nw6yKuhkcILw0HWvt5fFlhcBmQwT97N0jV5U57/zoQli/2wVIFinZ/dwnbMn
	 KzMaUhZHCd0RxGNSQFLZ+/L3xVnUKfKMo0r5a9V0XhNzcIcvLiqnXzRy9tnjQBptB7
	 a/Q04wY+gPOU0vp/7BrFK8hzHG6WTXkRrQvvVjfEN+mM5dQRoHWDncFLpPdPyP0nFt
	 lMAndOgeavpDA==
Message-ID: <sashiko-outbox-215855@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Add Tegra20 I2C target
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marc Dietrich" <marvin24@gmx.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115204522.360063-2-marvin24@gmx.de>
References: <20261115204522.360063-1-marvin24@gmx.de>
 <20261115204522.360063-2-marvin24@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 20:54:26 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] dt-bindings: i2c: tegra20: driver-specific compatible for
  target mode
- [Low] dt-bindings: i2c: tegra20: missing clock constraints for target
  compatible
--

commit 6d4b197a67e97b02efd062ed9f1c49931c4c0fce
Author: Marc Dietrich <marvin24@gmx.de>

dt-bindings: i2c: Add Tegra20 I2C target controller

This commit adds the "nvidia,tegra20-i2c-target" compatible string and an
example for the Tegra20 I2C target controller to the Tegra I2C binding
schema.

> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yam=
l b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> index 51241c1293e3e..2d7ee8e8750d4 100644
> --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> @@ -13,11 +13,15 @@ title: NVIDIA Tegra I2C controller driver
>  properties:
>    compatible:
>      oneOf:
> -      - description: Tegra20 has 4 generic I2C controller. This can supp=
ort
> -          master and slave mode of I2C communication. The i2c-tegra driv=
er
> -          only support master mode of I2C communication. Driver of I2C
> -          controller is only compatible with "nvidia,tegra20-i2c".
> +      - description: Tegra20 has 3 instances of a generic I2C controller.
> +          It supports controller and target mode of I2C communication.
> +          The i2c-tegra driver only supports master mode of I2C communic=
ation.
> +          Driver of I2C controller is only compatible with "nvidia,tegra=
20-i2c".
>          const: nvidia,tegra20-i2c
> +      - description: The i2c-tegra-target driver supports the target mod=
e of
> +          the generic Tegra20 I2C controller. Driver of the I2C target
> +          controller is only compatible with "nvidia,tegra20-i2c-target".
> +        const: nvidia,tegra20-i2c-target

[Severity: Medium]
Should target mode use the existing "nvidia,tegra20-i2c" compatible rather
than introducing a separate driver-specific compatible string?

The three generic Tegra20 I2C instances are identical hardware blocks that
include both master and target registers within the same 0x100 register
aperture, and are already described by "nvidia,tegra20-i2c".  Defining
"nvidia,tegra20-i2c-target" encodes Linux driver partitioning and operating
mode selection into the Devicetree ABI, whereas standard I2C bindings keep
the hardware compatible string and select target mode via child nodes using
I2C_OWN_SLAVE_ADDRESS in their reg property.

[ ... ]

> @@ -222,3 +226,18 @@ examples:
>          #address-cells =3D <1>;
>          #size-cells =3D <0>;
>      };
> +
> +  - |
> +    i2c@7000c500 {
> +        compatible =3D "nvidia,tegra20-i2c-target";
> +        reg =3D <0x7000c500 0x100>;
> +        interrupts =3D <0 92 0x04>;
> +        clocks =3D <&tegra_car 67>, <&tegra_car 124>;
> +        clock-names =3D "div-clk", "fast-clk";

[Severity: Low]
Does the allOf conditional for Tegra20 and Tegra30 clocks also need to
match "nvidia,tegra20-i2c-target"?

The top-level clocks and clock-names properties only require minItems: 1
without constraining the names, and the allOf rule requiring two clocks
named "div-clk" and "fast-clk" only checks for "nvidia,tegra20-i2c" and
"nvidia,tegra30-i2c":

Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml:
  - if:
      properties:
        compatible:
          contains:
            enum:
              - nvidia,tegra20-i2c
              - nvidia,tegra30-i2c
    then:
      properties:
        clocks:
          minItems: 2
        clock-names:
          items:
            - const: div-clk
            - const: fast-clk

Nodes using "nvidia,tegra20-i2c-target" bypass this check, allowing wrong
clock counts or names to pass dtbs_check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115204522.3600=
63-1-marvin24@gmx.de?part=3D1
