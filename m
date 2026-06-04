Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5769409123
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 11:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571586; cv=none; b=JLyqvU/Wsx/ySZKj9G0oVie9LNfcDBxR7YT+TXQ6R448L8SGLPmcsBScQ8PKt2BLQCwe8TkMggVKZsYOIYirK3jwy63fGp1F8/r0clOSzMsRe2m2HxtBSUR/O5dLHmfaGDqmmQmFzLcl97SShb/tnEiU7u71rwkPvmPARpj7OCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571586; c=relaxed/simple;
	bh=nGKsqalP4bhNi9Jay87mrSVhaoSEf8yTeiSD5GYIbAA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qzC20u2UNV8eDmMTqPZcZCv8V8v3VHwhyS4w9z5hnDxNdnp4l9S/AIVx3Qg4kxhIN0eqwyX/GBa2zdX8I+fTlCue8AAnp/5wsguKnlG1T7Y/AVjspLZTI3Sp3oIctyjSkSsqXF5tZtjqf177Sqtr1nJAXTytbT2BFhYO52JAZaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TaV3LgN+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TaV3LgN+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663DE1F00893;
	Thu,  4 Jun 2026 11:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780571585;
	bh=0XVEElmgTWyD1ZFJk2uddTiqmRmjOgbKdtdq7v2pRpA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TaV3LgN+39zsqI6Cp6jiE1LeNb9unG0e0zNIL+YKlIRWXOmSgHFGsENw36JRW7Ow/
	 Zz5E4KpYeaJoOA5G3EHyufYvSeKA9Nz72kDTjLh/8HIXv1GZFQB+zKVlYes8QZCJ8s
	 yypQUF0Rwz+HoLBa0nbDaJixSqfcDEUrA0g6OzM00aSYr65dJibj40iAHVH9QVD7ud
	 jtRaDMROf4cXcFpBdR/jeb+3ss12rr5tt/gsjhx2EaG8fF3WUrtcRWdh/SRg/2vM/z
	 iSS0cfRA7YQQfzJgqbGoRG+Do5ri3X1rs6rVU2bqt7bumpv3AnPdrMhxNC4N+VV5JV
	 jXA24+c7CkSKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add default-intensity property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Rebmann" <jre@pengutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604-multicolor-default-v1-1-b07bff431537@pengutronix.de>
References: <20260604-multicolor-default-v1-1-b07bff431537@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 11:13:04 +0000
Message-Id: <20260604111305.663DE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The example in `leds-pwm-multicolor.yaml` incorrectly uses `linux,d=
efault-intensity` instead of the newly defined `default-intensity` property=
, causing dt_binding_check validation to fail.
- [Low] The description for `default-intensity` contains a grammatical erro=
r that makes the sentence confusing.
--

commit 99b08e914db877e1b3d69129c24e623ae6ddf4d3
Author: Jonas Rebmann <jre@pengutronix.de>

dt-bindings: leds: Add default-intensity property

Document the default-intensity property to set a default color on
multicolor LEDs. Update pwm-multicolor to support it and update the example
to turn the LED red on boot.

> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documen=
tation/devicetree/bindings/leds/common.yaml
> index f4e44b33f56d1..159a89f77982b 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -73,6 +73,16 @@ properties:
>        - keep
>      default: off
> =20
> +  default-intensity:
> +    description:
> +      The initial intensity of the LED color component. Used only during
> +      initialization. Defaults to 0. As the intensity of each sub-LED is
> +      multiplied with the overall brightness, without this property on a
> +      sub-LED is effectively initialized at minimum brightness regardles=
s of

[Severity: Low]
This isn't a bug, but there appears to be a grammatical error in this sente=
nce.
Should it be "without this property, a sub-LED is effectively initialized"
instead of "without this property on a sub-LED is effectively initialized"?

> +      its linux,default-trigger and default-brightness attributes.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0
> +

[ ... ]

> diff --git a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.y=
aml b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
> index a31a202afe5cc..05cc83f4bb825 100644
> --- a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml

[ ... ]

> @@ -63,12 +65,14 @@ examples:
> =20
>          multi-led {
>              color =3D <LED_COLOR_ID_RGB>;
> +            linux,default-trigger =3D "default-on";
>              function =3D LED_FUNCTION_INDICATOR;
>              max-brightness =3D <65535>;
> =20
>              led-red {
>                  pwms =3D <&pwm1 0 1000000>;
>                  color =3D <LED_COLOR_ID_RED>;
> +                linux,default-intensity =3D <65535>;

[Severity: Low]
Is this example property name correct? The new property is defined as
default-intensity, not linux,default-intensity. Does this mismatch cause
schema validation to fail during make dt_binding_check?

>              };
> =20
>              led-green {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-multicolor=
-default-v1-0-b07bff431537@pengutronix.de?part=3D1
