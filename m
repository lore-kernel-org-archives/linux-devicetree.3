Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5BA4FDE42
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 17:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788803169; cv=none; b=CNEZJ5HuUwLuw7IX6PksF2mEiK8vVp62j+BtqblczLAhvbhXvr5VkCLicGsV2jpflT66izQEaC207Kuo+ZpW/CjQmSfp/hhHSdK3Khip/ewlRHOaSvddNO6zBKWMYSF6/Zma/gXeQkcCtGW9Dw+IPc2QmvzrMZff3oqGM6U/Ow4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788803169; c=relaxed/simple;
	bh=DtMVV8+XA1iPW17+qz4MhcQJBa6ycAPKwlfIgBnDK6g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=su/4Ad/RLlO3R9Q1K+nmHsbe2+ygVCoQ6XPneca6CRSwsZcoamakkfogafdbO7+fmHyK8VP8f7n71oaiTrxCRnz7XMgreksQIOuofR9UOrpZThwNwmap1hC2devfrge0gnf3QdkphNZolG+b+rma11cfMruuh1ctZnWXWNgsoik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBBa40zw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBBa40zw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A0C1F00A3A;
	Mon,  7 Sep 2026 17:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788803164;
	bh=SCmagGRWHT6riN25tmOcmjDLq9TaXBcoCPqlC97D9p0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HBBa40zwUaHb/vOEionVcb6S1s7l1n+rKgJsCKLLkzj64VOOm6sy6no0bELo05IVr
	 B5/6D2BG7lGuq987vAwnkDmrs/LHEQnHoIY1url2uQHXgH1TSWuhk3oo3hFDwlT6x1
	 qkmZHNAopHXiOG9el4ct0foDHbrweYw66zwtFveJeVN/YUeEfs11gns6IegWF57hvb
	 BxzMnMa5t9vyQ3SpX3PgAxK01zHNG1fiyunq9kPZ3l/a1egYg2A8oHFqJ70/yY4bd+
	 yKTPZWS1TM0e6xeJYajoybjf0vP12RW34gLEqdt7/R6qQi1/CeIIgqUcnsxjTya9m0
	 A4iyJT6KkxYxg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next 1/7] dt-bindings: net: add Airoha EN8811H
 PHY MCU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksei Sviridkin" <f@lex.la>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260906174548.4106801-1-f@lex.la>
References: <cover.1788711797.git.f@lex.la>
 <20260906174548.4106801-1-f@lex.la>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 17:46:03 +0000
Message-Id: <20260907174604.46A0C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The schema disables `reset-gpios` on the PHY node to prevent fir=
mware erasure but fails to disable the `resets` and `reset-names` propertie=
s.
- [Medium] The strict `unevaluatedProperties: false` on the child PHY node =
rejects valid EN8811H-specific PHY properties.
--

commit 6002751a738ff01594839da605cd448738f78458
Author: Aleksei Sviridkin <f@lex.la>
Subject: dt-bindings: net: add Airoha EN8811H PHY MCU

This commit adds a device tree binding for the Airoha EN8811H PHY's MD32
MCU. It describes the MCU as an MDIO device that owns the reset line,
with the PHY function operating on a child bus, ensuring the PHY is only
visible when firmware is running.

> diff --git a/Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yam=
l b/Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml
> new file mode 100644
> index 0000000000000..7be0ab8622661
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml
[ ... ]
> +  mdio:
> +    $ref: mdio.yaml#
> +    description:
> +      The bus the PHY function answers on while firmware is running, at
> +      the same address this node occupies on the parent bus. Only that
> +      one address is passed through.
> +
> +    patternProperties:
> +      '^ethernet-phy@[0-9a-f]+$':
> +        type: object
> +        $ref: ethernet-phy.yaml#
> +        unevaluatedProperties: false

[Severity: Medium]
Does this strict evaluation constraint inadvertently block valid PHY-specif=
ic
properties?

By restricting the properties exclusively to those evaluated in
ethernet-phy.yaml#, the schema rejects specific properties defined in the
Airoha EN8811H PHY schema, such as rx-polarity from phy-common-props.yaml
or airoha,pnswap-rx.

Could this cause dt_binding_check to fail when a valid device tree includes
these EN8811H-specific PHY properties on the child node?

> +
> +        properties:
> +          reset-gpios: false
> +          reset-assert-us: false
> +          reset-deassert-us: false

[Severity: Medium]
The schema disables reset-gpios to prevent firmware erasure on the PHY
node, but does it also need to disable the standard resets and reset-names
properties?

If a device tree configures a hardware reset controller for the child
ethernet-phy node using the standard resets property, it will silently pass
validation. At runtime, the PHY framework might pulse this reset during
detachment, wiping the MCU's volatile firmware.

Should resets: false and reset-names: false be added here to fully close
this validation loophole?

> +
> +        description:
> +          The reset line belongs to the MCU node above. A reset described
> +          here would be pulsed by this node's own lifecycle, and that er=
ases
> +          the firmware that created this PHY.
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788711797.gi=
t.f@lex.la?part=3D1
