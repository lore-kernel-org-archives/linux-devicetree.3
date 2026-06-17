Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57FD380FDC
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781672656; cv=none; b=pHBbd6rmKXtF3+u0ZlMdDe1ei0/oL6BIHMe69DQaTdJBbvVUxwlMf1Zd/FGvmxhIhcTbKTuZqvthkORfR8eGcPk4yyfQM8bKwpHHIW7WShZQ+sepFAApI78BApjFSLknbnDOOeInMCHHEa42jZ5QrbJ7a2+ApvcdyGG4ax0eEPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781672656; c=relaxed/simple;
	bh=Hf6BrKxWDUX+0Tb6es7lRpPC5ZShlu/1zXsughdAkj4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HVLID/JRC2vtV3a1CwN3ylb0arIzlTCiH3RcpYEgWb4wIGhqGx7YcxQG/kwoMIuTo/bVn2diNqT6TkS/wW/EQHSrVgrPys0BmVvThF+FjySN0CAowPRFtz2nJ5tj0S30FNHWHPe2+p9BldufJzgekChmHuYlJxmJ69kro9EIDek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0hvaVig; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0hvaVig"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E298A1F000E9;
	Wed, 17 Jun 2026 05:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781672651;
	bh=FXOZyUcfsavVnza23EOIUBPnQ6M+JR8yBJ79BEX3eMU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P0hvaVig1fW+AD0FNivlqWNrQSM0IEO68YAeQYKv37pSIMfJAOfMNfL1THBT175GY
	 I31lRvYX3hvg5fm67I0k7lrElEJgtKSC2Vq6OTMYJgeO7dk9CNmd5WaPsylW0LtYWT
	 Ei86rTkKjYHN0q3yvHOKnN+c7n+3Mbq5pEdcKRP4/PvFJcE0y0ud4vlbh1PGQeMdoL
	 WPOdksvExKJLs4FickHyBzeQqdwx03P7o/mAxQ31VdwjrdfZuU0/ZWypQBJg1bwV8+
	 IjaZQlJOfQPcnLojhuTGDeKe/ra5cFYmvQ5Oc8THgwrEW/DGavBNwERxhUA4zEM8Bl
	 U4SwjdbDHr3dQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/6] dt-bindings: i2c: Describe SA8255p
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260617-enable-i2c-on-sa8255p-v7-1-ad736dbeab57@oss.qualcomm.com>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
 <20260617-enable-i2c-on-sa8255p-v7-1-ad736dbeab57@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 05:04:10 +0000
Message-Id: <20260617050410.E298A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incomplete schema requirements for power domains.
- [Low] Missing `#address-cells` and `#size-cells` in the example block.
--

commit 028881c69d7286ec4ecd4e0f30436fe9b7b8594c
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>

dt-bindings: i2c: Describe SA8255p

Add DT bindings for the QUP GENI I2C controller on sa8255p platforms.
The platform abstracts resources in firmware via SCMI and uses TZ for
Serial Engine management, omitting standard SE properties.

> diff --git a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.=
yaml b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: qcom,sa8255p-geni-i2c
[ ... ]
> +  power-domains:
> +    maxItems: 2

[Severity: Medium]
Since the SA8255p platform requires both the power and perf domains to
function properly, should this also specify minItems: 2? Currently,
maxItems: 2 implicitly defaults to minItems: 1, allowing a configuration
with missing domains to pass schema validation.

> +
> +  power-domain-names:
> +    items:
> +      - const: power
> +      - const: perf
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains

[Severity: Medium]
Should power-domain-names also be included in the required block?
Without it, an incomplete device tree node could pass schema validation but
fail at runtime when the driver attempts to request the missing domains by
name.

> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/dma/qcom-gpi.h>
> +
> +    i2c@a90000 {
> +        compatible =3D "qcom,sa8255p-geni-i2c";

[Severity: Low]
Does this example need #address-cells and #size-cells properties?
Because the schema inherits from i2c-controller.yaml, an I2C controller
node is inherently treated as a bus requiring #address-cells =3D <1> and
#size-cells =3D <0>. Omitting these might trigger a dt_binding_check schema
validation error.

> +        reg =3D <0xa90000 0x4000>;
> +        interrupts =3D <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-enable-i2c=
-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com?part=3D1
