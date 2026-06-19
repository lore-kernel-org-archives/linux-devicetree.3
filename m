Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C0F37FF50
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781874242; cv=none; b=lEdCYfANaM6Rqcuh0ObQ+XIF10xP/xEKPM7MinhS83QxnOgNE/TWcrzNFVcQxXnLPglYR2jIMOrzuHU1dZqpZfFpsSVx/QVJzwrC3DzDc0Dj/73TQStyzUglzwZoES/jOQHwIabMSpwPsnRPAk00ykPl8z2peERVT1IyeTkVDNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781874242; c=relaxed/simple;
	bh=vKiWQHV2ZnHW+lNFsSE6M+bZJg4iGEDKUzDcovGBRMc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bLtQjk977QFv7VvDm5nR+UoL9kTVP2Y06adSMg88Jaun8hM8HyZwygVcCs6vIwWX9DCcpX6NTfV8ft+zytrlOnQeaoiDJVhQ2BFDrz8NrxVCtmd5KEzRbeJZ4Jo3rMlwN+b+zS24eOJQRuUZEInRfUg7VCH9d4zj1Lb7s3hJl0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIN6ugz/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIN6ugz/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0211F000E9;
	Fri, 19 Jun 2026 13:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781874241;
	bh=vKDpN6ripGvNLu2H06g6bkZBWXACT40pDo9935FgFUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GIN6ugz/Ke/ArFXV60CEvJEAUhQ5D6N0lc0RMAvY/pTN3OUrosheXY/zz+/7mzpBw
	 paNmtNqtiy33c0Zw9yeaI8mkuwZO3ZKJJpGXyAWj7JQuRvhOsnkAGK4zAupd6repnc
	 vqjxe3v7MKyBVGG1Pvkok72DbTbP1lSfH8M54m8L9r5yierUscs3PIqYPFrP34seQ3
	 ZO6+FmF/ogg/cGKuFEvE/Q2oCP3kx7dvDcMQkGvmSA5vuPBOtXhxLjyHjsfEanFh2V
	 ogJ2MwYdaNe3tbDGwNiIz+/eis+qpS++NdYf25nx0rCbrACgvA0b+kbBwA7Ki3wZia
	 uQmcH/fijThEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add imx576 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Himanshu Bhavani" <himanshu.bhavani@siliconsignals.io>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260619125439.55311-2-himanshu.bhavani@siliconsignals.io>
References: <20260619125439.55311-1-himanshu.bhavani@siliconsignals.io>
 <20260619125439.55311-2-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 13:04:00 +0000
Message-Id: <20260619130400.DE0211F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `port` node does not mark `endpoint` as a required property.
--

commit 8d8a44d3691b781ed1f0eae46f632d337e365e3b
Author: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>

dt-bindings: media: i2c: Add imx576 sensor

This commit adds device tree bindings for the Sony IMX576 CMOS active pixel
digital image sensor.

> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
> new file mode 100644
> index 0000000000000..52575ea2cbe1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml

[ ... ]

> +  port:
> +    description: MIPI CSI-2 transmitter port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:

[Severity: Low]
Should the port node mark the endpoint property as required?

Without specifying that the endpoint is required, an empty port node will
pass schema validation, even though the hardware requires an endpoint for
the MIPI CSI-2 interface to function.

> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619125439.5531=
1-1-himanshu.bhavani@siliconsignals.io?part=3D1
