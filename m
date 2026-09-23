Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B07E54EEC5
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790190125; cv=none; b=fvtoAZlsEqXqsbpT8iPDNK2aOZ47ZcKXm3rNN4DvkO/scUWnKpuiMZljkbQXznf4I8XhUDFEW9XbeVPhSggbMvHB4S4w/YDF0NiMQYpCKChEk4u6WAfDyfVgYlmxALrHZ8efUegclI/Qks7Y3QqCk2G29j9nv6osvx6kosN40Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790190125; c=relaxed/simple;
	bh=XkvaTFe4x+mfRbfTx0Zf1oKb0JDLROe/ppI4fE4uiJs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jcbMSq1h4H/hR5ao12Dy6ppsO5p6J13fZzkqxMkrG5LywT7R2JrIAEpLqri8XzewSXUjpCXo6KBzRntOGoxHyo8SUzOyg9emTEGLiDCvpDyLl+pPA5zZiWWMI9a8KVOw48dTk5faOdwXbTc/uexUs/R7b8dpRdAqmk4oaZGscR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2poulQv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2poulQv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CADA1F00893;
	Wed, 23 Sep 2026 19:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790190123;
	bh=0whTYYAjgA7XXJ+n5TDOWKeFTP0s6IXdAVCHXFfzY+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f2poulQvrD+Kg3jp7LkckZp/oX7qBgyu3wbA0bvo8afyBfnYX8hXXYN8PG34qyNl6
	 yqYkFaga0u0z9t3z2hT34WApu+XGKatGbqRrOjPdmGsqpRnyoB5eMm6/LMft78lXLx
	 fU4obeKmkpvXEnS4zCgiQrXAYedkxV+v987ZvwXzkjsAuEhkuO8Bqtv3o3TRE5PjfU
	 1a4Ee9IAws54edTgPMscpBG9V8MRSHnqEoeF8gAlpUpnCi4ICFP30ZwfdlMixJbJhu
	 IW1tor39pIYuq+S6BrzTDFect+XxmCRgUlx4gKfeX7Ue5+r3GCqsBEFrS8ALeZU9mX
	 BOcLulpkYZnBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: convert nsp-gpio binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923185305.26223-1-rosenp@gmail.com>
References: <20260923185305.26223-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 19:02:03 +0000
Message-Id: <20260923190203.8CADA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: pinctrl: brcm,nsp-gpio drops gpio-hog and forces do=
uble nesting
--

commit 25a9276749a1169691e6667beb90f7132674e886
Author: Rosen Penev <rosenp@gmail.com>

dt-bindings: pinctrl: convert nsp-gpio binding

The brcm,nsp-gpio-a compatible used by the NSP GPIO controller was
only documented in the legacy text binding, so dtbs_check reported
'failed to match any schema' for the gpio@20 node present in every
bcm958625 and related board DTS.

Convert Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.txt
to a YAML schema and drop the text binding. Keep the existing
required and optional properties (reg, #gpio-cells, gpio-controller,
ngpios, and the optional interrupt/gpio-ranges support), including
the generic pinconf child nodes with pin bias and drive-strength.

> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml=
 b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml

[ ... ]

> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties:
> +      description: Pin configuration child nodes.
> +      allOf:
> +        - $ref: pincfg-node.yaml#

[Severity: Medium]
Does this pattern property enforce a double-level nesting by treating
-pins nodes as wrapper objects where the properties are the actual pin
configuration nodes?

This breaks documented single-level dts configurations from the previous
text binding.

[ ... ]

> +        drive-strength:
> +          enum: [ 2, 4, 6, 8, 10, 12, 14, 16 ]
> +
> +      required:
> +        - pins
> +
> +additionalProperties: false

[Severity: Medium]
Does using strict additionalProperties: false without referencing core sche=
mas
like gpio-hog or using unevaluatedProperties: false cause standard gpio-hog
nodes and root pinctrl properties to be improperly rejected?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpio@18000020 {
> +        compatible =3D "brcm,nsp-gpio-a";
> +        reg =3D <0x18000020 0x100>,
> +              <0x1803f1c4 0x1c>;

[ ... ]

> +        interrupt-controller;
> +        #interrupt-cells =3D <2>;
> +        interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        led-pins {
> +            led {
> +                pins =3D "gpio-1";
> +                bias-pull-up;
> +            };
> +        };
> +    };

[Severity: Medium]
Does altering the example to drop the gpio-hog node and pinctrl-0
properties, while artificially wrapping the led node, bypass schema validat=
ion
errors that would have otherwise caught the above issues?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923185305.2622=
3-1-rosenp@gmail.com?part=3D1
