Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173575;
	b=cEeBybHyvLwdjTVtcHFgCHn+xhKYTV/X+TSyXx3iHh7Q/YuY80RI2saw0nSfan0jx6Iz
	 ixBdlNSdne0zRDggG1nUyTpQC74ZoxPYu5UA0MsgKII/PlUq/uX4qwcuHGNtkgIfw6oN5
	 PFLxUvVlGqMiQgSpXAZiD7z+kYF6euUaxryDFOQiT5//HiaQg+VQRgJUa86W4MrlpbaBS
	 NiS7DrLUfzYBQNxH8gaL3CA88MMF3m6Oby+ZPoAvv2yjDQjxTjsBwjwwyCmqCaEre+SxV
	 0YBe7NVyR6kde08M1dgVpLv2F/ezi0Rs02FhtESjMf22d3tSPGrb2PAJ/ZTLgjPb3Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173575;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MRkypWmWeFdhoKxX3KizCibMFSYPrzKizkCyjnSzBEg=;
	b=q88Wuy7Mm4cUOv0l8zonJZpvTRntxf0i1ELPa76VL/hEdHQNrdGa5PqzDzJL8TSBeZRO
	 TviGOy/+Q9rVmr4fHg8s7a2eCjf96ZH/o2OzOJRh2gFMvD9pM+FmMSpjL1Gl4fXtebl94
	 uxIDOR/Nls8cuyGAcS354mOxl4GDXRp3IOuyOrIdaLw0kG/EtcCa4Q9m+eLZJZ8JSxeQK
	 ttUU9uT5U0kR57kds5UoMQeCmSHiBu2M2QNN90Z3Oq8/zW9ioNuTAIqrpNl3xrJCB7y2W
	 HtdDDG6y0lTaeWjNrVfA2apuCvBHySXKdUmchkpNIyKyJvHxioR7xVAhL9hBgwP3QoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZYqGHKxA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B056B606A31C
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZYqGHKxA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 149FD1F0089F;
	Sun,  8 Nov 2026 21:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794173574;
	bh=MRkypWmWeFdhoKxX3KizCibMFSYPrzKizkCyjnSzBEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZYqGHKxA5RayEHGHZP1myUa+rWJbLvW9/qv97iIZnxmghOjHQYrqcHPUOAqpHo0l4
	 hV7g6Q8gqhg/dVXBzl8FSewftgBd0tYUMDsVx5IGRN2P5kilr8ag1r6K39ODA07jym
	 digHg3kOQxwb46IPP3+FKceluYcid0o1NEFMRlkMyHkbWlqyfRfqOs1eMcQy8Z1QmM
	 gWJ8t2+CYW6W1ZBiVKH2vEq8lH1/jknfsloYrbPYfshpO1M+AnhscnqWrzZppNwciP
	 5lL0eTsJSthSeMHhJqoo9jB1zyVz2wRhn0egoPhl0yElTYk4e80Yh1Okx20nABMgAO
	 yRFj4TStUAjOg==
Message-ID: <sashiko-outbox-204082@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: Add Tegra20 I2C target controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marc Dietrich" <marvin24@gmx.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261108212458.275980-2-marvin24@gmx.de>
References: <20261108212458.275980-1-marvin24@gmx.de>
 <20261108212458.275980-2-marvin24@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 21:32:53 +0000
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

commit 1d779eb91a256c3147a2ce9798c783f5f76b1f50
Author: Marc Dietrich <marvin24@gmx.de>

dt-bindings: i2c: Add Tegra20 I2C target controller

This commit adds the "nvidia,tegra20-i2c-target" compatible string and an
example for the Tegra20 I2C target controller to the Tegra20 I2C binding
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
Should target mode be represented by a separate "nvidia,tegra20-i2c-target"
compatible string?

The three generic Tegra20 I2C controllers (such as i2c@7000c500 in
arch/arm/boot/dts/nvidia/tegra20.dtsi) are the same hardware blocks already
described by "nvidia,tegra20-i2c", with controller and target registers in
the same register aperture.  Defining a second compatible string to bind a
separate i2c-tegra-target driver encodes Linux driver structure and runtime
mode into the Devicetree ABI.  In standard I2C bindings
(i2c-controller.yaml), dual-role controllers keep their hardware compatible
string and select target mode via child nodes marked with
I2C_OWN_SLAVE_ADDRESS in reg.

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
allOf conditional that constrains clocks and clock-names for Tegra20 and
Tegra30?

Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml {
  ...
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
}

Without "nvidia,tegra20-i2c-target" in that enum, nodes using the new
compatible fall back to the top-level clocks definition (minItems: 1) and
do not validate the required "div-clk" and "fast-clk" entries.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108212458.2759=
80-1-marvin24@gmx.de?part=3D1
