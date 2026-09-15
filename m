Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0404A4AE8A4
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 15:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487825; cv=none; b=HgaNm6BkOmnCIWBLU8t/uDRcZ6M00ZUgwUBYd8QTA0JShpl5PPHbU0BfuyzTXmvz8Y4rX+qslzmcr3ec8VQPlRGFdqx8vAmEwuU2wm9M/1JZkE99FsDpFILd8iZyE/i7RLq815tTyOZ+vWwKxINJRoE0p7tgh20rqN1jRywz1Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487825; c=relaxed/simple;
	bh=4x26x457gvnhdJ7Gy+SKKCxBdq3kPzMDJO6QBnO0dLY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MfM49hyxOEMFzyQUKTMrVfSm3zRndoZb/7TQRxJ+dOQ9vkzUg8kqi/VlSNGMMVn0OltNyH5ZlUC1TbvUdkd7QJ8H/Ck8EXSclXB2xzZNcGOm1zi1D42CJp47nSYK6nGLhazEAxSEfHcJuSnPyzV5FdkROKX1He0VbqHPbCeaWZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsFJoCj1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsFJoCj1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA831F000FF;
	Tue, 15 Sep 2026 15:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789487823;
	bh=qaw1ikUZa8JtPrtYyrwETcHQDGdZMjE5DQMSGz1TPyk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TsFJoCj1QK4tyuhg1s0aVIO0ovxqsDWShBuYmAU6PjRlPo5vanxJIszg3ZAf1Z1iY
	 wBKjnBukEz0SRcNGJpyfwmX6u2iQrhDqNZJ6uVV8swX2cw8LyzzxhtA5mllbh5q+7r
	 9dagLKaDqypNa9+RlSmffHnc8/azRX91vQM/5PhvuedWvX417cadH2CLBt8oWACzhP
	 1ICydyEFZ0dRFlvOmL8fR5Q7YriTBGokVq6t1VFQH7b1grAa74/mYmyF5dS0SewjlU
	 0ofNP7rD2Q+H1sZBR1gpazqsxZLlIcMA3p6bpiLqrxSL4vbQqqrDGeQ9BQT9VljLxe
	 JEN7ubmx5EcDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next] dt-bindings: net: Use consistent
 indentation in the example
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260914155645.112508-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260914155645.112508-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 15:57:02 +0000
Message-Id: <20260915155703.0DA831F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Removing the mdio node in the cortina,gemini-ethernet.yaml example =
leaves dangling phandle references to &phy0 and &phy1, which causes a build=
 failure during dt_binding_check.
--

commit 31fca947f12eff24c11e065baded031398b74f19
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: net: Use consistent indentation in the example

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

In cortina,gemini-ethernet.yaml also drop the wrongly indented mdio bus,
because it is not necessary for the example.

> diff --git a/Documentation/devicetree/bindings/net/cortina,gemini-etherne=
t.yaml b/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
> index f0b5bea2458d5..da9bc170cd543 100644
> --- a/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
> +++ b/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
> @@ -87,18 +87,6 @@ examples:
>      #include <dt-bindings/interrupt-controller/irq.h>
>      #include <dt-bindings/clock/cortina,gemini-clock.h>
>      #include <dt-bindings/reset/cortina,gemini-reset.h>
> -    mdio0: mdio {
> -      #address-cells =3D <1>;
> -      #size-cells =3D <0>;
> -      phy0: ethernet-phy@1 {
> -        reg =3D <1>;
> -        device_type =3D "ethernet-phy";
> -      };
> -      phy1: ethernet-phy@3 {
> -        reg =3D <3>;
> -        device_type =3D "ethernet-phy";
> -      };
> -    };
> =20
>      ethernet@60000000 {
>          compatible =3D "cortina,gemini-ethernet";
> @@ -110,28 +98,28 @@ examples:
>          ranges;
> =20
>          gmac0: ethernet-port@0 {
> -                compatible =3D "cortina,gemini-ethernet-port";
> -                reg =3D <0x60008000 0x2000>, /* Port 0 DMA/TOE */
> -                      <0x6000a000 0x2000>; /* Port 0 GMAC */
> -                interrupt-parent =3D <&intcon>;
> -                interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH>;
> -                resets =3D <&syscon GEMINI_RESET_GMAC0>;
> -                clocks =3D <&syscon GEMINI_CLK_GATE_GMAC0>;
> -                clock-names =3D "PCLK";
> -                phy-mode =3D "rgmii";
> -                phy-handle =3D <&phy0>;
> +            compatible =3D "cortina,gemini-ethernet-port";
> +            reg =3D <0x60008000 0x2000>, /* Port 0 DMA/TOE */
> +                  <0x6000a000 0x2000>; /* Port 0 GMAC */
> +            interrupt-parent =3D <&intcon>;
> +            interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH>;
> +            resets =3D <&syscon GEMINI_RESET_GMAC0>;
> +            clocks =3D <&syscon GEMINI_CLK_GATE_GMAC0>;
> +            clock-names =3D "PCLK";
> +            phy-mode =3D "rgmii";
> +            phy-handle =3D <&phy0>;

[Severity: Low]
Does removing the mdio node leave a dangling phandle reference to &phy0 her=
e?
This causes a build failure during dt_binding_check when the Device Tree
Compiler evaluates the undefined label.

>          };
> =20
>          gmac1: ethernet-port@1 {
> -                compatible =3D "cortina,gemini-ethernet-port";
> -                reg =3D <0x6000c000 0x2000>, /* Port 1 DMA/TOE */
> -                      <0x6000e000 0x2000>; /* Port 1 GMAC */
> -                interrupt-parent =3D <&intcon>;
> -                interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH>;
> -                resets =3D <&syscon GEMINI_RESET_GMAC1>;
> -                clocks =3D <&syscon GEMINI_CLK_GATE_GMAC1>;
> -                clock-names =3D "PCLK";
> -                phy-mode =3D "rgmii";
> -                phy-handle =3D <&phy1>;
> +            compatible =3D "cortina,gemini-ethernet-port";
> +            reg =3D <0x6000c000 0x2000>, /* Port 1 DMA/TOE */
> +                  <0x6000e000 0x2000>; /* Port 1 GMAC */
> +            interrupt-parent =3D <&intcon>;
> +            interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH>;
> +            resets =3D <&syscon GEMINI_RESET_GMAC1>;
> +            clocks =3D <&syscon GEMINI_CLK_GATE_GMAC1>;
> +            clock-names =3D "PCLK";
> +            phy-mode =3D "rgmii";
> +            phy-handle =3D <&phy1>;

[Severity: Low]
And does this similarly leave a dangling reference to the newly removed &ph=
y1
label, causing a compilation failure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914155645.1125=
08-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
