Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AB830649C
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 07:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780645098; cv=none; b=N1nyXGVfeCOl5eMp5IarEq7Z211W1Vg4IxDnB01AIN2GCkWXfbGe70o8SBswHc+2m1NKStyLFTrZkgYvzbXFlF+9KLiEmgIygiqiPd1r77xhucAG8+jWUa5JCrvYLsAA+qRLnnydj+XnUmZT2uUIgLpLAyEHEMHqpTb7KcGOgzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780645098; c=relaxed/simple;
	bh=9+1FfuL96+G5EbBugIjo04s5a5tpFrER27oKSs4YlRE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q8Ag2SnUb9vSYLLz/IQK41WbXB67bMnB8LQBTq5nbcw2rTu5FTP8wljIn2pcVVG/AupSK0pRqhsI3Jb2whaOX3lEBw6A8DO97AqA+M6HrUcb6Md7wncvTgZpC2GuoUUIviSNIZ2MqYlQwF0YNCCwCNLDcJ2VTeHYqeQVYppr5pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiq9X1e2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiq9X1e2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E916D1F00893;
	Fri,  5 Jun 2026 07:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780645097;
	bh=AxAylSaNTM/DaOJ9SVGH0wt3dFesgUlu6V7gNVtEq6U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kiq9X1e28PYaWtdooPGihO9Kqt+GV8x2JvPQh0F+N9si9DBTsZKq0oHzpKxNRrfaF
	 endX445yXHLSjrQtLb9UHmt8imd8K4cc67Q9usogsQTFWWGv5EHIhKR8eo+dtKP9QE
	 an9qO3qyLRGhi5XYFspgv82X6yo3L5EhvN5JLGzMOKdv3JoAxvqfxh2AuhKZITsNPO
	 DC74TgsKRLd7VvYmxnkhpDXA/MINsjNyGY23H8QJXTuUp+o8WVokGpz6/o6SmgYAtW
	 jzHzMyGqY9w6oioXn8yeljaXoxN8CzgXSbfrALsINPjX7IJMS5JlbAiEcczS/nR1dA
	 B0sJJ/u1q0MMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add default-intensity
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Rebmann" <jre@pengutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260605-multicolor-default-v2-1-ed07271df6b0@pengutronix.de>
References: <20260605-multicolor-default-v2-1-ed07271df6b0@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 07:38:16 +0000
Message-Id: <20260605073816.E916D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Driver-specific name hardcoded in the generic `common.yaml` schema =
description.
--

commit 9beb7b4f88908b2864bd519c143e1a370071aec1
Author: Jonas Rebmann <jre@pengutronix.de>

dt-bindings: leds: Add default-intensity property

This commit documents the default-intensity property to set a default color
on multicolor LEDs. It also updates the pwm-multicolor binding and its
example to support this new initialization property.

> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documen=
tation/devicetree/bindings/leds/common.yaml
> index f4e44b33f56d1..a34de0a34b422 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml

[ ... ]

> @@ -73,6 +73,17 @@ properties:
>        - keep
>      default: off
> =20
> +  default-intensity:
> +    description:
> +      The initial intensity of the LED color component. Used only during
> +      initialization. Defaults to 0. As the intensity of each sub-LED is
> +      multiplied with the overall brightness, without this property on a
> +      sub-LED, the leds-pwm-multicolor-LED is effectively initialized at
> +      minimum brightness regardless of its linux,default-trigger and
> +      default-brightness properties.

[Severity: Low]
This isn't a bug, but the description for default-intensity explicitly
mentions the specific driver name leds-pwm-multicolor-LED.

Since common.yaml is intended to be a hardware-agnostic specification
for all LED bindings, could this wording be updated to refer generically
to the multicolor LED or simply the LED to avoid leaking an
implementation detail into the generic schema?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-multicolor=
-default-v2-0-ed07271df6b0@pengutronix.de?part=3D1
