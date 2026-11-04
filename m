Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795759;
	b=OvOjT2SCv4ZfP2tBDM1wlD2Ur+0UVD48EibF2ZmkX73G+oL1VHTAg+DfPh6bI0UPTz/q
	 lauhEpNTa8ML67Oj3JSwf6zp7H13mxZnw6DOuu8U3nJH91BJ8DeSEiue2Mi6u7Y0gtxYS
	 eLx9GXa5HnwVHpkngb+afDW3h36DU/sj3puQDteg4FUEFEWD1F6+TFZd62qp73c02lOgW
	 LkQvFOb2eJ5Mhkqbn+GaCK6VJ/H7+E79hm4XjePQeLfPRU2AOiisZdVJA6/K1GDjk/Y7T
	 9dWiIYcaef8RpRRCUKPJf05MnthAMWOc0Iya8zHdtKZYhkx/tCXiJcWlM/prnb+9EMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795759;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+imR2EkDXt7g9BNSt/+SVergcOsqx7phY9wqlOz4x/g=;
	b=BGHKzDdv7gIpc0TfDixPtZQa8+aiKO10aLEiqCPv9CgCz9peGMonXPZy65wIC2hDbbQN
	 h2ZRTgO3BwlKxq1e35iNJKwMQwL1mhf9Rz2GJ0R0RTt7Sf5wvzCv93Jf1UqBweJ4kCFdi
	 GxLt7rs7bneltjCyQVKHa5mHThdwEAmo7yiaqF7kLxRsksvf9P5F8QAVdg9qGrZMbiHhA
	 ZVJHoESyFwhnbiu7xhn+2IJNU/Z8eZ+B288+XkhxtNuaBxT2lR4iLisOjrttxe4HEcgwk
	 4oxCvDBWAssqYwMANSgYGum1IO5P2l/YYoGwbDyBS1kmZoZj9h+7Z8o7BR5WyG5ksVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyFeSKeC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732C5606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyFeSKeC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F751F000C1;
	Wed,  4 Nov 2026 12:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793795759;
	bh=+imR2EkDXt7g9BNSt/+SVergcOsqx7phY9wqlOz4x/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dyFeSKeCQMKr/QCjIm3IMno9ljs5cPXxyhHoINVvCnHyWQdJl+wmF1PNL1QbN5Ks5
	 8QBhdi900NTmyYWkOFoz0aJGoxtFd3K4hs32Wl09JD5HAnHkcndzmYx8yLIFfwSguP
	 LjjlQLrBKd5iDQWPVD1u3225XhyL97yMhJkDoVL2yB8SnBEbRj/R3WSycfmgeX7Aer
	 py379IvJ1XK128ODJ2X1agXMu5aK3S9lFkVbzIJmazqvH/JU9AM6y3c5IFx5J1MqQ5
	 UO94t3/sXaHiCNqU0kfgyJntbn2gVUNZIxXiKX0SaxypNr+pJ1bIVc8htMl1KpqWrJ
	 AbT9ClM5doxMA==
Message-ID: <sashiko-outbox-197260@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Kumar Savaliya" <mukesh.savaliya@oss.qualcomm.com>, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261104122155.3789346-2-mukesh.savaliya@oss.qualcomm.com>
References: <20261104122155.3789346-1-mukesh.savaliya@oss.qualcomm.com>
 <20261104122155.3789346-2-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 12:35:58 +0000
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
- [Low] dt-bindings: i3c: qcom,geni-se.yaml missing i3c child node pattern
- [Low] dt-bindings: i3c: qcom,geni-i3c.yaml requires optional pinctrl-1 st=
ate
- [Low] dt-bindings: i3c: qcom,geni-i3c.yaml omits power-domains and OPP pr=
operties
- [Low] dt-bindings: i3c: qcom,geni-i3c.yaml example uses QUP base for IBI_=
C reg
--

commit 2e47e899944b24dd4c6fc08e4da686257bf4137c
Author: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

dt-bindings: i3c: Add support for Qualcomm I3C controller

This commit adds the device tree binding schema for the Qualcomm GENI-based
I3C controller and its associated In-Band Interrupt controller.

> diff --git a/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml b/D=
ocumentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> new file mode 100644
> index 0000000000000..bab89aeee23f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> @@ -0,0 +1,115 @@

[ ... ]

> +  I3C controller nodes must be child nodes of a GENI-based Qualcomm Univ=
ersal
> +  Peripheral(QUP) wrapper. Refer to the GENI QUP wrapper binding describ=
ed in
> +  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.

[Severity: Low]
Will device tree validation fail when an i3c child node is placed under a
GENI QUP wrapper node?

In Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml,
patternProperties only permits spi, i2c, and serial child nodes while
setting additionalProperties: false:

patternProperties:
  "spi@[0-9a-f]+$":
    ...
    $ref: /schemas/spi/qcom,spi-geni-qcom.yaml#

  "i2c@[0-9a-f]+$":
    ...
    $ref: /schemas/i2c/qcom,i2c-geni-qcom.yaml#

  "serial@[0-9a-f]+$":
    ...
    $ref: /schemas/serial/qcom,serial-geni-qcom.yaml#
...
additionalProperties: false

Should Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml also be
updated to allow i3c@[0-9a-f]+$ referencing /schemas/i3c/qcom,geni-i3c.yaml#
(and disallow it for qcom,geni-se-i2c-master-hub)?

> +
> +allOf:
> +  - $ref: i3c.yaml#
> +  - $ref: /schemas/soc/qcom/qcom,se-common-props.yaml#
> +
> +properties:

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

[Severity: Low]
Should pinctrl-1 (and pinctrl-0 / pinctrl-names) be dropped from the
required list, and pinctrl-0: true and pinctrl-1: true be declared in
properties?

Under properties, pinctrl-names specifies minItems: 1 so that the sleep
state is optional, which matches the sibling bindings in
Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml and
Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml. However,
listing pinctrl-1 in required forces every node to provide a second pinctrl
state and causes dtbs_check failures for boards or SoC dtsi files that only
define the default state.

> +
> +unevaluatedProperties: false

[Severity: Low]
What happens during dtbs_check when a qcom,geni-i3c node specifies
power-domains, operating-points-v2, or required-opps?

Sibling GENI Serial Engine bindings such as
Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml define:

  operating-points-v2: true
...
  power-domains:
    maxItems: 1
...
  required-opps: true

Because neither i3c.yaml nor qcom,se-common-props.yaml defines these
properties and unevaluatedProperties is set to false here, won't QUPv3
Serial Engine nodes that use power-domains and OPP tables fail schema
validation?

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

[Severity: Low]
Is 0x008c0000 the intended address for the IBI controller register space in
this example?

In arch/arm64/boot/dts/qcom/kaanapali.dtsi and
arch/arm64/boot/dts/qcom/sm8550.dtsi, 0x008c0000 is the register base of the
parent QUPv3 wrapper node (geniqup@8c0000) that contains SE1 at 0x00884000:

		qupv3_2: geniqup@8c0000 {
			compatible =3D "qcom,geni-se-qup";
			reg =3D <0x0 0x008c0000 0x0 0x2000>;

Also, this example mixes the SM8550 clock header with the Kaanapali
interconnect header. Could the example use consistent headers and a valid
IBI controller register address?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104122155.3789=
346-1-mukesh.savaliya@oss.qualcomm.com?part=3D1
