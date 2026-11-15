Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767786;
	b=LnR6ikc/bfygD8j/N21qrPw73WLlbjoHA6tbzrxLxvejPJG5sRt7i6RbIGZLZjOazD+z
	 st69tvYY0xuzqbVnjXH6vlz2t4TmxxOBg2kyIBeE08sfVYBO99lPSuUOhnZq51UVOEH6Z
	 7YndmTdz+BUxIPXfCf5XuzEiNP0woAFxrrRb1b4/2AjZZHoWOUNp76yFdH1uZbaR3e6BN
	 inWkIZPOYqn8t3DVZqAifyIUQzHqwYbrwwR49O3NSOZVZMghzYVYdeXg3V0t/WonJEcgx
	 tpgDazWN+Xu0WI7uOzCkwAaLUwqjufTqrZcKLaM+S89exC9A9+eIb337CPehCUXVUjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767786;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=N/COMI2l6zEQMs3FcZligS+klP7bsF1jIXsqjaTIsuE=;
	b=CDeq8QifPzypfOT+6fPFGP5B64z3PaQb8VTJq9gLVkN/G9pDytdDGX0wr4zxN06QLVFd
	 Dr8ZkPitZIKfWGrcTTKMnTiidp+nFjmGNuPddHtMW0wRAFx4xblfg/dz2mpI+DtFESv8h
	 D9EMNzxR12knnByb3B5X/+ghA0fEateAZMFQzW79aDuplFKCTf2JXAJRZZCHEFPYFCNCK
	 4WBhyLKMsRZi8LwWm5cs5BMd4/6QK2EZH7jSxOaaLWJ5r9LkIjkzlpmIQHRiYo4WV5AQ0
	 mzWfYU8o9mwJNfczIiN9txpdS1//PBHaw0o1dg4ALI87tRx59NH9I9tl+ITOitgghuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jSBSCsFm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB033606A31A
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 18:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jSBSCsFm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464241F000C4;
	Sun, 15 Nov 2026 18:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794767786;
	bh=N/COMI2l6zEQMs3FcZligS+klP7bsF1jIXsqjaTIsuE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jSBSCsFm80mTzISz/qy6CrqR6P0el4HxOUnjm4GVhlKH+udMfD/6Awe3XtjdGnunC
	 J2icstzFq7npjO1Upot77MQi41pW01iUBmay8YM6PYmRnFAgfPwDDviO9fkMqBcls8
	 JPb4M0ETGHdMgZfz9PbS6I4AtK9/PYxJ/Oht7S0pVKhc8D3VVadmab3NFW76uG9CMs
	 vXFPt+o8I4PijQnJCJzkRG3dKly79opGnEA/WKsRrCq/Mo0zl7mthF7Bih9Hry875w
	 uVQeGelyKBz9PeOlpds+PyNfH/ciW2Uhki3tp/RxEl82ndVSmheOn1HFs6tt/ezsdr
	 JGHv537bqGkkA==
Message-ID: <sashiko-outbox-215728@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: Add Tegra20 I2C target controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marc Dietrich" <marvin24@gmx.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115182616.354580-1-marvin24@gmx.de>
References: <20261115182616.354580-1-marvin24@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 18:36:25 +0000
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

commit 49b20f39ced9dd1d6790b83dd4714812990cb33d
Author: Marc Dietrich <marvin24@gmx.de>

dt-bindings: i2c: Add Tegra20 I2C target controller

This commit adds the "nvidia,tegra20-i2c-target" compatible string and an
example for the Tegra20 I2C target controller to the Tegra20 I2C binding.

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
Should target mode be selected via a child node using I2C_OWN_SLAVE_ADDRESS
rather than a separate "nvidia,tegra20-i2c-target" compatible string?

The three generic Tegra20 I2C controllers (such as i2c@7000c500 in the
example below) are the same hardware IP block already described by
"nvidia,tegra20-i2c", containing both controller and target registers
(sl_cnfg, sl_addr1, sl_addr2 in tegra20_i2c_regs) in the same MMIO region.
Defining a separate compatible string encodes Linux driver structure and
operating mode into the Devicetree ABI and requires boards to override the
SoC controller node's compatible property to use target mode.

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
If "nvidia,tegra20-i2c-target" is kept, should it also be added to the
allOf conditional that constrains clocks and clock-names for
"nvidia,tegra20-i2c"?

The top-level properties allow a single clock with an arbitrary name, and
the allOf rule enforcing minItems: 2 and clock-names "div-clk" and
"fast-clk" only matches "nvidia,tegra20-i2c" and "nvidia,tegra30-i2c",
leaving "nvidia,tegra20-i2c-target" nodes unvalidated for the second clock:

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

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115182616.3545=
80-1-marvin24@gmx.de?part=3D1
