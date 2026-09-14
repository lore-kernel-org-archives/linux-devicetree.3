Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49761331EA5
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355315; cv=none; b=M9m2wZ2c5A/CrZUZs/Mu57PBWxibTYjW01eSlh/QI5Adl+itACrUfw8NFjdrYcbGXUXatJrJzKNhQFSAkNwWtY1CwOQG0RaajGoAWir0VM9U7RfujgMNt0fBZiiDLcD2QtOBCj56OHdoxFt4SLL+hC2P5Ubce+nixl37k+5CWbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355315; c=relaxed/simple;
	bh=2KRKveaLzwfSZ/3t6ne0RsWOWBLmDxsK14fmLbznX/o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HiWUj+dlncpBkzNK+mnYUycBQxRIVTBHfIlcFgSQmFrADMO+fRLGGq+NkEZWIp6/JMjM76VIVYiY787VWdYfMuS+AGCPJfegO73B42DDVdtxXwD/6PnelSkoiaXAO0HTh7BCDSejw9lg1pOeCaLpLAKcnzFbRQzRv/XdKhtCiXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OyrlVCtB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OyrlVCtB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925041F000FF;
	Mon, 14 Sep 2026 03:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789355313;
	bh=VGLUQyOe/k4nJR5aCYXxwunZAHZPA230774wwTFw+D8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OyrlVCtBTz3oV8o5e9+m2azqCbwpplYmXfa4AtmigYdWYbmx641jKQ//0OWQUCFkP
	 AXbAFp+oy3WDgg9RSCKxE4H7Qfx6Cy6MgaoRtLdrq8IWuTWY/Rz/r98uivMA9JXwmX
	 Ej16CEPVYt8AK9Qa1u83b5pcwTll9Oh1wonQ1yyByp0gvW+kHfC0HpZpYDGrbxPUld
	 k2bk/SOpDN0LgwBkAda+YWs4Pjd0CRDEkFvicFbKT0aqTluzHEHkgPTAqXa0WACciu
	 fH4UrXMBDIURv6/ytO/kmKd+ajKNU9Tnao/FrXod53gkZd9k5DYv86jJzSKxPXvzE3
	 P++kQmI2fI+cQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: xlnx,xadc: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: Quchaosheng <quchaosheng000406@163.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260914030226.437638-1-quchaosheng000406@163.com>
References: <20260914030226.437638-1-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 03:08:33 +0000
Message-Id: <20260914030833.925041F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing `required` constraints for `#address-cells` and `#size-c=
ells` under the `xlnx,channels` node.
- [Medium] The `xlnx,external-mux-channel` property is not conditionally re=
quired in the schema when `xlnx,external-mux` is configured.
--

commit 26fef0c106376ac6892ddac0175e6b4bb799f5f4
Author: Quchaosheng <quchaosheng000406@163.com>

dt-bindings: iio: adc: xlnx,xadc: Convert to DT schema

This commit converts the Xilinx XADC and System Monitor bindings from
free-form text to DT schema format. The xlnx,channels container and external
channels are now described as a nested object to validate them.

> diff --git a/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml b/D=
ocumentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
[ ... ]
> +  xlnx,external-mux:
> +    description:
> +      External multiplexer mode. When omitted no external multiplexer is
> +      assumed to be used.
> +    enum: [none, single, dual]
> +    default: none
> +
> +  xlnx,external-mux-channel:
> +    description:
> +      Which pair of pins is used to sample data in external multiplexer =
mode.
> +      In single mode the valid range is 0 to 16, in dual mode 1 to 8. Th=
is
> +      property is required when external multiplexer mode is used and is
> +      otherwise ignored.

[Severity: Medium]
Does this property need an allOf or if-then block to programmatically enfor=
ce
the requirement? The description mentions it is required when external
multiplexer mode is used, but the schema lacks the conditional requirement
logic. If a device tree configures xlnx,external-mux to single or dual but
omits xlnx,external-mux-channel, the schema validation will succeed, but the
driver probe will fail at runtime.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 16
> +
> +  xlnx,channels:
> +    description:
> +      Container for the external channels connected to the ADC. When this
> +      node is absent no external channels are assumed to be connected.
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0

[Severity: Medium]
Are we missing a required list for these properties under the xlnx,channels
node? Incomplete device tree nodes that omit the #address-cells and
#size-cells properties will silently pass schema validation, despite
containing child nodes with unit addresses. This violates standard devicetr=
ee
semantics and fails to enforce the correct structure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914030226.4376=
38-1-quchaosheng000406@163.com?part=3D1
