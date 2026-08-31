Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86B74399F2
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183405; cv=none; b=PmAXm040900vz9ZjeUwvFuXEvQSgm+H7v9d216x8fQ48fjijCOQTHkZH21DCruJ0BdkrHw3JYEKd+uRqnQVX9+37c1kdH9d8uscHpc25+/8PJvsTtcOh2Uj8xZl1Gn+MJZszLsBxrqSEszzPiLfP73DdLr2cuF684vdTfUWiGL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183405; c=relaxed/simple;
	bh=jodCptBrNYlsa9GEhSRvbkL2GC5UsrQBwEN7d7GUbxE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CJPJ2lU39+nIFWikMBn8PokJ+6oNVlzvOqhyQI+V5EFqrwLVULGBA84lQKLjk/K4WX07k2gVBZrCHMv39ws+kSFyuq0nBHPFTGHP1Mer/RCA2/VPaWinvqDdbA3PQoYO29B1ruHx1lav5Nu0ZfjqaIdCnrfaqXXim4pjyI/0WtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nX7YpN63; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nX7YpN63"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB421F000E9;
	Mon, 31 Aug 2026 13:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183403;
	bh=RoI1vsswf1HoDOnd9QqENg0queuP7aQ2TK4oC9uODxA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nX7YpN63PUBlMfdqAndTMzZhNP6qXSr8Iv22ZxJTELGGIWqnoA2d62hDkab4Awljo
	 A+0ekYX87x3ISvDIP27RM+evNpmdXwZLc4Ca5nnKw054wCJ4Lx9tZC8PTvBTPo6vSR
	 B4Bn3/WLcM8d+Lwqzcw0/s2F514sIVX9YCwdmWsr8xmIIeIwfBO8IqOsqTFTiwZbfN
	 4XLBPOT+wkgiBC0gy7niy9hcGMSSfxaK2czXJImLMPiDVY7wBeFwGeKEVUeUwXn6ef
	 LLQU+vE/k0L+yp28CaLoVNz7fmrHfZ1BhUVdONkKfCot7uiTeMR0iKRX+FW7ebuzPy
	 86GMgizZfcoHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 12/22] dt-bindings: media: i2c: add MAX9296A,
 MAX96716A, MAX96792A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260831-gmsl2-3_serdes-v16-12-4fa6e08bb514@analog.com>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <20260831-gmsl2-3_serdes-v16-12-4fa6e08bb514@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 13:36:42 +0000
Message-Id: <20260831133643.6DB421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `i2c-alias-pool` property is incorrectly restricted to a max=
imum of 2 aliases, which breaks schema validation for standard dual-link to=
pologies.
- [Low] The `#address-cells` and `#size-cells` properties are missing from =
the `required` list inside the `i2c-atr` node schema.
--

commit 7472cadfe0a14fe6a0a18b63a3ea7a85e2d94a8a
Author: Cosmin Tanislav <demonsingur@gmail.com>

dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A

This commit introduces device tree bindings for the MAX9296A, MAX96716A,
and MAX96792A GMSL to CSI-2 deserializers. It documents properties for
I2C address translation, ports, and endpoint configurations.

> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> new file mode 100644
> index 0000000000000..de6bfcec5dc63
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
[ ... ]
> +  port0-poc-supply:
> +    description: Regulator providing Power over Coax for GMSL port 0
> +
> +  port1-poc-supply:
> +    description: Regulator providing Power over Coax for GMSL port 1
> +
> +  i2c-alias-pool:
> +    maxItems: 2

[Severity: Medium]
Does this maximum item limit of 2 restrict valid hardware configurations?

Device trees that configure more than two remote I2C devices, such as a
standard dual-link topology with 2 serializers and 2 image sensors, will
fail schema validation because i2c-alias-pool is strictly limited to a
maximum of 2 items. The entire deserializer would only be allowed to alloca=
te
2 aliases for all downstream devices.

> +
> +  i2c-atr:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +

[Severity: Low]
Should #address-cells and #size-cells be listed under a required block
for the i2c-atr node schema?

Because #address-cells and #size-cells are not listed under required in the
i2c-atr object schema, a device tree omitting these properties will silently
pass schema validation, even though it defines unit-addressed children
(^i2c@[0-1]$).

> +    patternProperties:
> +      '^i2c@[0-1]$':
> +        $ref: /schemas/i2c/i2c-controller.yaml#
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-gmsl2-3_se=
rdes-v16-0-4fa6e08bb514@analog.com?part=3D12
