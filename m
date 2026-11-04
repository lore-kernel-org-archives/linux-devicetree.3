Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792115;
	b=CGAGmpBjNFBl4WX9J+WZGMAVaRgqXZO7mCvtbCUEYvgZrhkJ94izD0zGD8+kmMFaV0Zn
	 HQ/GZ/jY4DDOI4K6Dxdh8VZo6afkxZTdH6a3+Ts4CmFviRp+011U/0Ta9t+I6v9QZxk7V
	 93Q2Q2eh0Q6vdfDox4oGziXDM3cdKElI2e/NrVxjorChCCgXBUWZP31RmbXPlyqfXlj9g
	 pqcpIGhoxcSyhoJdJSypaStn2Rp1aJjYWTTRdilr51fS+1RX2+iitQVisXGUAb+bnHWXS
	 Rh+7shdnoD5t6/rLvFhC19VRJsaYxnZlmrh6nrqkIl4SFAyknxETdVu3nCPt51aNRFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792115;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xJv/oiRzdmeibJ9w9yvraEizZsEUoDznFS9/SeW9Wk8=;
	b=FC4fWvIjO0ddt07ck2jZ4/N9nesBGassXeebjp/VVBLYltA2V97o5GxdQ1wmilw9fqcz
	 PpNwOE/E24UGwz5HwEnbYOx73d8swQsjSqAHvl9JDP1k3VDoQW5hx2hfWkR0IYB+OzqyO
	 PQqQTl9N7zjX0G12hzUA+EMpfdgz6y4Y5/Y2qH31mzmUWHVPgh6VR9O1tZ/ymgW1pJZha
	 NBPa83AgRZVHZNgNGd1nszyWTSUeItNqr4DERaPvVEyzW5cnaeM09Nbh+PrbRwPCbDVUF
	 JQHAn9N/3Vgc4QdlcCnln9apCHTiaX7DDwqcNiKuIhF7BrIwX4JYSyUuJVcHrcyD5yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LVmArwiX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0754E606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 11:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LVmArwiX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308291F000C1;
	Wed,  4 Nov 2026 11:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793792114;
	bh=xJv/oiRzdmeibJ9w9yvraEizZsEUoDznFS9/SeW9Wk8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LVmArwiXTuc0pTqyP4MbWXdAes0sF3OvoT/YGPOcy/NQHPQFBofhS3apibdsSxy+G
	 bWU8FeizcrxRxyojnMZ/44qS0z4ZdGdz4yc7dM0M//EfDLQDwzlpAwyrVfHTvTO0rl
	 RmM6okWUFe/9hKarZOPJTwwp96rhGb5DDfHLc6Q61Bff/8OaSGaNkQQxg7MCDFnBs3
	 ARsJVrP6lYDAr4mA908HyXN9sFo46AZfToMj0s6gQll1y/ukmXKjR3Gy5SHFyZGk9g
	 4bW+hXaOzXgAoOlOfdIEz7AwniSPT4diPDg/r3K/v4CuBD4UrMW37Ac+LhSg0zpzsK
	 O1OaCp9f0DP5g==
Message-ID: <sashiko-outbox-197177@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Kumar Savaliya" <mukesh.savaliya@oss.qualcomm.com>, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261104111610.3739095-1-mukesh.savaliya@oss.qualcomm.com>
References: <20261104111610.3739095-1-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 11:35:13 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] dt-bindings: i3c: missing i3c child node pattern in qcom,geni-se=
.yaml
- [Medium] dt-bindings: i3c: required pinctrl-1 contradicts pinctrl-names m=
inItems: 1
- [Medium] dt-bindings: i3c: missing power-domains and operating-points-v2 =
properties
- [Low] dt-bindings: i3c: example uses QUP wrapper address for IBI_C and mi=
xes SoCs
--

commit 53511a9ac0238442394253f95c17db4e7c486559
Author: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

dt-bindings: i3c: Add support for Qualcomm I3C controller

This commit adds the device tree binding schema for the Qualcomm GENI-based
I3C controller and its associated In-Band Interrupt (IBI) controller block.

> diff --git a/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml b/D=
ocumentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> new file mode 100644
> index 0000000000000..bab89aeee23f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/qcom,geni-i3c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Geni based QUP I3C Controller
> +
> +maintainers:
> +  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm GENI-based I3C controller implementing an MIPI I3C bus master.
> +  The controller supports SDR transfers in mixed bus mode with both I2C =
and
> +  I3C target devices present on the same bus.
> +
> +  The controller consists of a GENI Serial Engine (SE) responsible for I=
3C
> +  bus transactions and an associated dedicated IBI controller(IBI_C) blo=
ck
> +  used for Hot-Join, In-Band Interrupt (IBI) handling and management of =
GPII
> +  resources associated with the I3C controller.
> +
> +  I3C controller nodes must be child nodes of a GENI-based Qualcomm Univ=
ersal
> +  Peripheral(QUP) wrapper. Refer to the GENI QUP wrapper binding describ=
ed in
> +  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.

[Severity: Medium]
Since I3C controller nodes must be child nodes of the GENI QUP wrapper node,
will dtbs_check fail unless Documentation/devicetree/bindings/soc/qcom/qcom=
,geni-se.yaml
is also updated to permit i3c@[0-9a-f]+$ child nodes?

Currently, qcom,geni-se.yaml sets additionalProperties: false and only allo=
ws
spi, i2c, and serial children in patternProperties:

  patternProperties:
    "spi@[0-9a-f]+$":
      ...
    "i2c@[0-9a-f]+$":
      ...
    "serial@[0-9a-f]+$":
      ...
  additionalProperties: false

Should qcom,geni-se.yaml be updated to reference /schemas/i3c/qcom,geni-i3c=
.yaml#
under patternProperties (and disallow it under qcom,geni-se-i2c-master-hub)?

[ ... ]

> +  pinctrl-names:
> +    minItems: 1
> +    items:
> +      - const: default
> +      - const: sleep
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interconnects
> +  - interconnect-names
> +  - pinctrl-0
> +  - pinctrl-1
> +  - pinctrl-names

[Severity: Medium]
Does requiring pinctrl-1 here contradict setting minItems: 1 on pinctrl-nam=
es
above?

If a board or SoC DTSI only defines the default pinctrl state (pinctrl-0 and
pinctrl-names =3D "default"), schema validation will fail because pinctrl-1=
 is
unconditionally listed in required. In addition, sibling GENI bindings such
as Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml do not
require pinctrl properties in the controller schema.

> +
> +unevaluatedProperties: false

[Severity: Medium]
Should operating-points-v2 and power-domains also be permitted in properties
before setting unevaluatedProperties: false?

Neither i3c.yaml nor qcom,se-common-props.yaml defines these properties,
whereas sibling GENI Serial Engine bindings (qcom,i2c-geni-qcom.yaml,
qcom,spi-geni-qcom.yaml, and qcom,serial-geni-qcom.yaml) declare:

  operating-points-v2: true
  power-domains:
    maxItems: 1

Because Qualcomm SoC DTSI files (such as arch/arm64/boot/dts/qcom/sm8550.dt=
si)
populate power-domains and operating-points-v2 on QUP Serial Engine nodes a=
nd
the common helpers in drivers/soc/qcom/qcom-geni-se.c consume them, won't
dtbs_check reject those properties on qcom,geni-i3c nodes?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
> +    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
> +
> +    i3c@884000 {
> +        compatible =3D "qcom,geni-i3c";
> +        reg =3D <0x00884000 0x4000>,
> +              <0x008c0000 0x10000>;
> +        clocks =3D <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
> +        clock-names =3D "se";
> +        interrupts =3D <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>;
> +        interconnects =3D <&clk_virt MASTER_QUP_CORE_2 &clk_virt SLAVE_Q=
UP_CORE_2>,
> +                        <&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QU=
P_2>,
> +                        <&aggre2_noc MASTER_QUP_2 &mc_virt SLAVE_EBI1>;

[Severity: Low]
Is 0x008c0000 the intended register address for the IBI controller in this
example, and are the headers meant to mix sm8550 and kaanapali?

In arch/arm64/boot/dts/qcom/sm8550.dtsi and kaanapali.dtsi, 0x008c0000 is t=
he
register base of the parent QUPv3 wrapper node (geniqup@8c0000):

  qupv3_id_1: geniqup@8c0000 {
          compatible =3D "qcom,geni-se-qup";
          reg =3D <0 0x008c0000 0 0x2000>;

which geni_se_probe() in drivers/soc/qcom/qcom-geni-se.c maps via
devm_platform_ioremap_resource(pdev, 0). The example also includes both
qcom,sm8550-gcc.h and qcom,kaanapali-rpmh.h while referencing &aggre2_noc.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104111610.3739=
095-1-mukesh.savaliya@oss.qualcomm.com?part=3D1
