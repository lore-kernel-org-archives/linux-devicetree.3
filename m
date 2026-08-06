Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33153D3327
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786000856; cv=none; b=gXNWxwqA8qxJJj2WCDmGmPtwuO7YqpRkHQZZbrP0bmYtfZirjhC0LdV5FrUMjSZLYDrcwnGgfj8Nrh7psQWFjRPGbr/avXTkbXvayQvHjoO0ZxfpN94u+wNEaSIe03565zzYvjdJFxHfH/51UCyLhuCdoYETLZYRfTDyvHfEzXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786000856; c=relaxed/simple;
	bh=sbVP81yPJ16iqmETHznrcBjxFdi29T27hQ51Ml8SXsY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DWoBcXlDjMQnWTCclXWYVOc6h8GPY5aumUijQsT25ZIQre5aQgo3rlrHgHCCmjDoAy2rBk6v8zgz5LXuWF6oSRa7oKSUYf4+V+XOHRbEW+26udutnp7oJ7RyKAP+titJrYOCIFe/W4goF+vkkvbJ/e8jCznW4eghLgV4xBaP/lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMAdiRYj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMAdiRYj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A28E1F000E9;
	Thu,  6 Aug 2026 07:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786000855;
	bh=qJQ2WyCdDwxL9QgPCF4Bhv2JmCR0CRSrPBrmymOVAXU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oMAdiRYjgt6xg/0Jv21fy0rlqzzH/N3xg9Mw7+92Il0LqgU4SZ6Gjm1HGPvChEElD
	 iZ4IeguYnRtYVWdUpHdoru+8+J6pQRKzkddyAv1F6dlDwEM3Bol3pc8Bu73X/pNIsD
	 Q0Tj3Zk9E26f4lAkFskMz1zL6TaZPZQnd7hYDxUTvtCkkHBAO0No5CqyhWXOZ49ZAw
	 RUIsXj77S6PzaDEwnq2/G6Bmvhu7Yz3t65873Uzp4JrtXGZQ2c/4W+31EoOti8LlFP
	 L0zQdZVqw+4MNQLs2rh7Fqx98oVKj9ylHv2XoSiduTybwK+JmC78A339Zkqe1kf5Of
	 o2rmQDLYB+Pog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: imx908: Add Sony IMX908
 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lachlan Michael" <lachlan.michael@sony.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260806070934.21764-2-lachlan.michael@sony.com>
References: <20260806070934.21764-1-lachlan.michael@sony.com>
 <20260806070934.21764-2-lachlan.michael@sony.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 07:20:54 +0000
Message-Id: <20260806072055.3A28E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Missing reference to standard video interface devices schema for=
bids common camera properties.
- [Low] The `port` node does not explicitly require an `endpoint` child nod=
e.
- [Low] The fixed I2C address is not properly constrained to 0x1A.
--

--- Patch [1]: [PATCH v2 1/2] media: dt-bindings: imx908: Add Sony IMX908 s=
ensor ---
commit 1a763e011d664f488af190964db4f6527791287a
Author: Lachlan Michael <lachlan.michael@sony.com>

media: dt-bindings: imx908: Add Sony IMX908 sensor

This commit adds device tree bindings for the Sony IMX908 CMOS image sensor.
It defines properties like compatible, reg, clocks, supplies, reset-gpios,
and a port node for CSI-2 output.

> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> new file mode 100644
> index 0000000000000..885aba692c60d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> @@ -0,0 +1,105 @@
[ ... ]
> +description:
> +  Sony IMX908 diagonal 6.42 mm (Type 1/2.8) CMOS active pixel type
> +  solid-state image sensor with a square pixel array and 8.39 M
> +  (3856x2176) pixels, supporting MIPI CSI-2 output with
> +  RAW10 and RAW12 formats, configured as either 2 or 4 data lanes.
> +  The I2C address is fixed to 0x1A as per sensor data sheet.
> +
> +properties:
> +  compatible:
> +    const: sony,imx908
> +
> +  reg:
> +    maxItems: 1

[Severity: Low]
Does this allow configuring an incorrect I2C address that will silently pass
validation? Since the description explicitly states the address is fixed to
0x1A, should this enforce it with const: 0x1a instead of just maxItems: 1?

[ ... ]
> +  reset-gpios:
> +    description: Sensor reset (XCLR) GPIO. Active low.
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +
> +    properties:
> +      endpoint:

[Severity: Low]
Does this allow an empty port node without an endpoint to silently pass
validation? Should the port definition explicitly include a
required: [ endpoint ] rule?

> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
[ ... ]
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - dvdd-supply
> +  - ovdd-supply
> +  - avdd-supply
> +  - port
> +
> +additionalProperties: false

[Severity: Medium]
Will this strict constraint incorrectly reject valid device tree configurat=
ions
that include standard camera properties, such as rotation or orientation?
Since video-interface-devices.yaml is not referenced at the root level, it
seems any standard property will be treated as an invalid additional proper=
ty.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806070934.2176=
4-1-lachlan.michael@sony.com?part=3D1
