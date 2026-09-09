Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D64E577E5D
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961117; cv=none; b=AJdAutNiY9gd1gU8f5j4mw7byGGrzUdKcur4sc0pukMYbxU+FqHYQIMKIlsii4pW/rYC7Do1kVjoCPeDB1r/c9OScnYGl6v9kewVIJbQfJYPPVJV0MiUbnZ7SEVwxAKeasmP/kcD40QWRv1S4q87DD7b6QyyE9TY7faGQ/zrJTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961117; c=relaxed/simple;
	bh=BRIUR/yP4aYnCyMy5/qA0M2fDRm7bdHsOX0mFqUPdoY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ngfIDL42LdhU7BNsVQffXibsZ3G6vR5xzd39yn2TlAA9qJqqK5Xy7PPPdyXzVsaE2tlKob8lbcU5n9XZwBssxe4MAKG0P+XgGW2MM2ZxVbbMDv5+9uW7jRhpMZ0vuElmY9myhzwIr68aZ25O7amIbUZAwsCR5kVHFHfJ3lKu5Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k41uAOej; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k41uAOej"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7759A1F00A3A;
	Wed,  9 Sep 2026 13:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788961115;
	bh=YpG8N6UiKznz20E3UwUh5dkXT8mkWof3LDzYZ3SUlsY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k41uAOejn8+TaWZjagXiNFgHWXhQkRpChCD0HGR7DBDdvctqlUuryYCc2EOd9QZce
	 2yUgZgALSz4sphnj5yT5CY3IucaggY/6hjQ48Y9MQ/M1Xb2+ymsSp9/1CvgBQp56eE
	 VIrk4EVwrgphRTmJ4MzStZW4PWfAwPXdB0arrLSAOmjMJoNNKEt9oYB8Uz1cowDBem
	 A3hy1KQLP8KRkVqsRwmA3zXMUFxwtPTONoTFR5WtuoJxSIremHeXuTiuBjvxLJvOyZ
	 1IaVEom6JMSdBf4xwCAbzInBhdPFs3Togily9kxhM5OGofcQRvgioPT9FUzwsJ5wbf
	 ErpUddrQUb8NA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 12/22] dt-bindings: media: i2c: add MAX9296A,
 MAX96716A, MAX96792A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260909-gmsl2-3_serdes-v17-12-002499e534e8@analog.com>
References: <20260909-gmsl2-3_serdes-v17-0-002499e534e8@analog.com>
 <20260909-gmsl2-3_serdes-v17-12-002499e534e8@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 13:38:34 +0000
Message-Id: <20260909133835.7759A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `i2c-alias-pool` property is overly restricted to a maximum of=
 2 items, which breaks valid multi-device configurations.
- [Medium] The `i2c-atr` child node fails to mandate `#address-cells` and `=
#size-cells`.
--

commit 6d3d3d8d9d81c31ffd5ad3feef43850ff819e86e
Author: Cosmin Tanislav <demonsingur@gmail.com>

dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A

The MAX9296A deserializer converts single or dual serial inputs to MIPI
CSI-2 outputs. The GMSL2 links operate at a fixed rate of 3Gbps or 6Gbps
in the forward direction and 187.5Mbps in the reverse direction.

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

[Severity: High]
Does this limit to a maximum of 2 items break valid multi-device configurat=
ions?

The i2c-alias-pool provides a pool of I2C aliases for the I2C Address
Translator (ATR). Every remote I2C peripheral accessed through the
deserializer (serializers, image sensors, EEPROMs) requires one alias
from this pool.

A dual-link deserializer configuration with a serializer and a sensor
on each link requires at least 4 aliases. By restricting maxItems to
2, the schema appears to artificially prevent users from specifying
enough aliases for a standard fully-populated setup.

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
> +    patternProperties:

[Severity: Medium]
Should the i2c-atr node mandate #address-cells and #size-cells in a required
array?

The i2c-atr node defines patternProperties for child nodes i2c@[0-1],
which contain a reg property. Any parent node containing children
with unit addresses must specify #address-cells and #size-cells.

While the schema defines these properties here, it does not seem to
include a required array for them within the i2c-atr node definition,
allowing a structurally invalid device tree to silently pass validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-gmsl2-3_se=
rdes-v17-0-002499e534e8@analog.com?part=3D12
