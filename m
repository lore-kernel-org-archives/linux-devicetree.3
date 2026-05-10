Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B1F39A067
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 14:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778421902; cv=none; b=D0xJixojCBD3WKUj9qRxuUuLuaJ15XBrjUagwEQ6EYDq6MViQA+fTqLi2uEvxqX6uq8vOPndIEqS0mQ8d+DFzz49727xVheutpeyPh40U6ANBBHHla47V/8sSG9bqS65+2fRU6CZfFbU6+4mwjvUxbaW/7Sga/31aVK9/S8nUMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778421902; c=relaxed/simple;
	bh=dJYaCi+yn4ax/081epn6bndSg6r0SUT554W11XYxbkY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NNRiyTlj/pay8EQzRjYsUNJWB8wpFjdvsr+60jPfkSMeEMivlPwv3zCiFyfOI+FHMy2YXFUEGccD+KAvfL93/NvBNn2qh1L4OiWtzCvRxGIvkXTivcOJj6U2b3F58H43tG0FXZNExRhiotyAzW9QmYNcojM2H+YqXPwYQ3gE3GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dnqif3n0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dnqif3n0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF190C2BCC9;
	Sun, 10 May 2026 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778421902;
	bh=dJYaCi+yn4ax/081epn6bndSg6r0SUT554W11XYxbkY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Dnqif3n00ZHUvBxojh9ViM0ZeVb7cRro2zUt5YI2MpSPtHi57Ada+YwwtMMWASXbA
	 PI1Z4cn4y2J100bhPw/zk2u1hTIHDCdllfRVQ7E/L2yny7rubkUHZh9kYZW9/ALS2G
	 5+KyKvIM5GCI1qEIQiY8dxBZD8PzV8/Sd4dzyWe341Jgr5mGLJJs8p0pzcyAZ362+H
	 vOA1wBKBtPaB8TS7hetSJthNZYnN31QtGayC+f5DRoOUIBqCKH5xsvHgoU78cM5f0i
	 NXuOtQly2YhveX/OLHt1a1YrJlSgboMiFZdDvd6CdcEb2jt1LTEP2/B/GsqofJehE3
	 7OT2p8oVlE47w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 01/12] dt-bindings: net: airoha: Add EN7581
 ethernet-ports properties
Reply-To: sashiko@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260509-airoha-eth-multi-serdes-v5-1-805e38edc2aa@kernel.org>
References: <20260509-airoha-eth-multi-serdes-v5-1-805e38edc2aa@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2026 14:05:01 +0000
Message-Id: <20260510140501.AF190C2BCC9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `reg` property check in the conditional `if` block uses an inv=
alid JSON schema sequence that will always evaluate to false, causing valid=
 device trees to fail validation.
- [High] The `ethernet-port@[0-5]` nodes model a `net_device` but strictly =
forbid standard network configuration properties like `mac-address` and `ph=
y-handle`.
- [Low] Missing `#address-cells` and `#size-cells` in the `required` list f=
or conditional child nodes.
--

commit 270a641148bef0e32520efd84b62bf6b97aa5a63
Author: Lorenzo Bianconi <lorenzo@kernel.org>

dt-bindings: net: airoha: Add EN7581 ethernet-ports properties

This commit introduces the ethernet-port property for EN7581 and AN7583
SoCs to model multiple net_devices connected via an external arbiter to
GDM3 or GDM4 ports.

> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml=
 b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
[ ... ]
> @@ -130,6 +130,38 @@ patternProperties:
>          maximum: 4
>          description: GMAC port identifier
> =20
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +
> +    allOf:
> +      - if:
> +          properties:
> +            reg:
> +              items:
> +                - enum:
> +                    - 3
> +                    - 4

Will this schema condition evaluate as expected?

In dt-schema, reg properties are parsed into a matrix format, which is an
array of arrays of integers like [[3]]. This schema checks if the first
element of the outer array matches the scalar values 3 or 4, but since
the first element is an inner array, it won't match a scalar.

Could this cause the if block to always evaluate to false, causing valid
ethernet-port nodes to be incorrectly rejected because the parent node
sets unevaluatedProperties: false?

> +        then:

Since #address-cells and #size-cells are needed for the ethernet@[3-4]
variants to act as buses for the new ethernet-port children, should they
be included in a required list within this conditional block?

Without them, an incomplete device tree could omit these properties and
silently pass schema validation.

> +          patternProperties:
> +            "^ethernet-port@[0-5]$":
> +              type: object
> +              unevaluatedProperties: false

Does setting unevaluatedProperties: false here without referencing
ethernet-controller.yaml# forbid standard network properties?

Since this models a net_device, driver code often expects to parse standard
properties like mac-address or phy-handle. Device tree authors might not
be able to configure them without triggering schema validation errors.

> +              description: External ethernet port ID available on the GD=
M port
> +
> +              properties:
> +                compatible:
> +                  const: airoha,eth-port
> +
> +                reg:
> +                  maxItems: 1
> +                  description: External ethernet port identifier
> +
> +              required:
> +                - compatible
> +                - reg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509-airoha-eth=
-multi-serdes-v5-0-805e38edc2aa@kernel.org?part=3D1
