Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E933E0720
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369576; cv=none; b=K5c5rvzzA1E3cOLzZC5b6YT9HzwcKZ+4zW6hR6ykiDj5WLzk5mtq23YE8yPebmHvpNRGde+2a9BYV+KOorxMTLVQhRrhZV4tEWr9cBVXSThfKmJjCN3ZzWcmeCYf5glpmhrre+c512afS84G85A2Whpf+0atZqDP+ORBlpZQxQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369576; c=relaxed/simple;
	bh=GvOopbuZgOx6H3EWaO/yxnhLUagCrjUODOcUeKfWPUM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZbGKfWkPg+YQhqClAIdbQreTQxQw/p92hJha/kxLHLlr7ndF9ZGtgLqRqkcmGaYpbLtfZQt1v0bWhtlHgg6rwfO/SQ29K+HOY9XpyIuqoLmzB9duQJiGgxM48UXECu50QKD0TnEcrnVbD3rbEMczivd7Fx9rpUCCuZV1gSYHm5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftnsNh7e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftnsNh7e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F881F00A3B;
	Thu, 21 May 2026 13:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779369574;
	bh=IoJn53ApRpASxBhXvJjp1njT92dMVKWAuU/QkFXrGyA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ftnsNh7e1SaxP/RO2NNLGvvZ5T+x0s3OCi7Jiv3yt+fT1/ry1K58dALxanESY/tTA
	 Ee635YnorN69MxvdiYxsJ7kv0baQN1IYBuWTxgirRELtZMbHxT4s0xKiPtsUlb2omx
	 LKKblWXjPAk9GbVukedFfQCorxgyuUPB73d9/BT/dBR7kKHE8BBW1jU85WCPDJbRan
	 Yu1U7lYeg0lEs6crtamYfCKqn/JFq/SRwVRNR2EH9LurOJqytPM7DTPVeDFKJOnn86
	 3NYP2+M8APgFUM1s2oRfa2mU6nfVN6AFBHomIhEe27u0mPVcndRYD0gbLiaBvZLxy7
	 XZm4w/LBmYo1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 07/22] dt-bindings: media: i2c: max96712: add
 support for I2C ATR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521-gmsl2-3_serdes-v12-7-b26d92931196@analog.com>
References: <20260521-gmsl2-3_serdes-v12-7-b26d92931196@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 13:19:34 +0000
Message-Id: <20260521131934.66F881F00A3B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `i2c-atr` node allows child nodes (`^i2c@[0-3]$`) with a `reg` =
property, but fails to make `#address-cells` and `#size-cells` required in =
the parent node.
- [Low] The `reg` property under the `i2c-atr`'s `^i2c@[0-3]$` child nodes =
applies invalid numeric constraints and lacks a `maxItems: 1` constraint.
--

commit 8c55c178a378c597e61e804da4b186def25c5a4c
Author: Cosmin Tanislav <demonsingur@gmail.com>

dt-bindings: media: i2c: max96712: add support for I2C ATR

This commit adds I2C ATR support for the MAX96712 and MAX96724 deserializer=
s.
It documents the ability to change I2C addresses for connected serializers =
to
avoid conflicts when they share the same CFG pin configuration.

> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index 583bbd60157c6..abacc3c874a9f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -36,6 +36,30 @@ properties:
> =20
>    enable-gpios: true
> =20
> +  i2c-alias-pool:
> +    maxItems: 4
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
Since the i2c-atr node allows child nodes (^i2c@[0-3]$) with a reg property,
shouldn't #address-cells and #size-cells be explicitly listed in a required
block under i2c-atr?

Omitting them allows an incomplete device tree missing these parsing
properties to silently pass schema validation.

> +    patternProperties:
> +      '^i2c@[0-3]$':
> +        $ref: /schemas/i2c/i2c-controller.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 3

[Severity: Low]
Does this correctly constrain the reg property?

In dt-schema, the reg property is parsed as an array of arrays. Applying
items constraints to minimum and maximum attempts to enforce numeric limits=
 on
the nested elements, which standard JSON Schema ignores for arrays, making =
it
a silent no-op.

Should this instead use maxItems: 1 to constrain the matrix length, while
relying on the unit-address regex pattern (^i2c@[0-3]$) to natively enforce
the bounds?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-gmsl2-3_se=
rdes-v12-0-b26d92931196@analog.com?part=3D7
