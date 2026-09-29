Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9832D3603EE
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722351; cv=none; b=a4CKikwmZmSIOqRXv3zsKUGak1dcaphWaocId+zwIYPM0a5BBDoyZsKhZONJZgutlQh4ZP6andRcrsWkttEtgQ6rWDx3kE3Y1z6EdyGvVpa9afe7+oI0DAah7JHxiSY5Ikk2yVtBmR9juVCEdjBK5uvryODzPId4NfespuayxGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722351; c=relaxed/simple;
	bh=kaV2CnC32DiN1aW9zOrNPYclS3pialKUcTwz4NCjXRo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uNKVpRJqecDjpgdQJzCC9orQqj/qZuEHLwpL4Y5ugHZ5mYBad84j2weLsEVXM86gsIZkvGZjrReHClecNDB9eTW15Elkw1YkFK8YALduWXUKriGkkurESA40nVmIuPv3xQ3zXF4FLNhKDI4iUgF2jkaGVI+hpD2sIPzNHwWULn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQzW7UNJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQzW7UNJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE7A41F000FF;
	Tue, 29 Sep 2026 22:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790722350;
	bh=7321a2aMnL9wzKB9X0PUd4Depn1BlRo3FqXcMXN0RKE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lQzW7UNJu7BIBi92tKeTNQbEk+oxA37EvgtjvGiejQpVEm0Z8OrmQqPCcQuUQyKMo
	 GrdFH448b3d/6Bq9hmPJdxCSTRpk7nMU031Zgdi7/SDIQB4GULzstT/oc099QxtANF
	 +QUp4NofP/YwN/+8FPJ5+ZpaUcKhr6GmakgVjbsg+oCnchELePFtuCst07qwe9zLsV
	 TN9/49CwjDYM3ffwqY4c2j4cIL/SGAmRoSPCmtQRhbC6g6h+VggQpjFLOgU0slmZf1
	 FiLP6Y86eCbc3wcytBr3fhzmGkdUG1PNBPQhwHe4aouji8Y1tKxgES/1ZQCzqmpq9Q
	 ZwIBSWfJc7nvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 02/23] dt-bindings: media: i2c: max96717: add
 support for I2C ATR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260930-gmsl2-3_serdes-v18-2-43117818f499@analog.com>
References: <20260930-gmsl2-3_serdes-v18-0-43117818f499@analog.com>
 <20260930-gmsl2-3_serdes-v18-2-43117818f499@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 22:52:29 +0000
Message-Id: <20260929225229.CE7A41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing required #address-cells and #size-cells in =
i2c-atr
- [Low] dt-bindings: ineffective minimum and maximum constraints on reg arr=
ay
--

commit 68c9661ca176f516e0ab3e41fd3fbb3c837a2fd5
Author: Cosmin Tanislav <demonsingur@gmail.com>

dt-bindings: media: i2c: max96717: add support for I2C ATR

This commit adds support for I2C Address Translation for connected I2C
slaves on the MAX96717. It introduces the i2c-atr and i2c-alias-pool
properties while keeping the i2c-gate node for compatibility.

> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index d1e8ba6e368ec..976f6dd2c164c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -91,6 +91,30 @@ properties:
>        incoming GMSL2 link. Therefore, it supports an i2c-gate
>        subnode to configure a sensor.
> =20
> +  i2c-alias-pool:
> +    maxItems: 2
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

[Severity: Medium]
Does the schema fail to enforce the presence of #address-cells and #size-ce=
lls
by omitting them from a required list?

Since the i2c-atr node acts as a bus container for i2c@[01] child nodes that
use reg for their unit addresses, the parent schema must explicitly require
these cell-count properties. Device trees omitting them will silently pass
schema validation, leading to structurally incomplete configurations.

> +
> +    patternProperties:
> +      '^i2c@[01]$':
> +        $ref: /schemas/i2c/i2c-controller.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 1

[Severity: Low]
Are the minimum and maximum constraints silently ignored by the JSON schema
validator here?

In dt-schema, reg is globally parsed as a matrix (array of arrays). Applying
minimum and maximum to the items keyword applies them to the inner arrays
themselves, not the numeric values.

JSON schema ignores numeric constraints when applied to non-numeric types,
making this check completely ineffective. Should this use maxItems: 1 inste=
ad?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-gmsl2-3_se=
rdes-v18-0-43117818f499@analog.com?part=3D2
