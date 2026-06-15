Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223653B531A
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 20:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781556053; cv=none; b=f8/UgjgY3DJ9FIUQzBTxtZw7WrRLs4eyvvnPIMQTVCMNF1fLRQCIfBOwR5MuJ4mtHhfe8c5+DxQ0ITM3tAGHT6yq5IYquzoM6D8xHYlSwigB8swvwoXvU6meIQ0xxAfLhdwkIlPbw8V4ZcVnbeAH49K39b59o9il2EdyjOpEczw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781556053; c=relaxed/simple;
	bh=IAQWEYIrEnve4aY+U8yrB5Zl5ly6km6EsvI0KJkv2oQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Kt3zZ6fE2MF0EeN33UJ1f6UGcmC8Snf+I3SSUSmmQsAyTxYQ73oydSkfospt13HRLcVKYgHpjEn5tF1ppNxRo1am5WPnufbMuuM+5H5levqxbeg8JLoplFRkNZmBMF0/0cak+GjGgoEgF1t+JjnNvAu0rKMrTkJmeIq4U2m6izo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1fGwZep; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1fGwZep"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DA51F000E9;
	Mon, 15 Jun 2026 20:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781556051;
	bh=YwzzjGWfq9Vv7hVP4tZII5JJAo6WlbVpI8inFFM/5JI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I1fGwZepwuaUELRc6ftgEPN0w/3mDz8ijVjujpdhNHf9p+2aWfvAhxxKetBNlJpf/
	 cmHJlQYwyea2kt855FwSKlD6A8ZhqLmmaKGc5xyj3urRLlIWf9hLIwcu8B3J+znAN0
	 xiGIHIHvfBO9ISMs/6EqbTo0M7fbHeXxoXzfI6/TCsYXbLOhPfdmBkOKRnAR5qjO+l
	 zwgokSZVelouHJKIrQXavz5WANBUxn8lWfjyoJ2GRWkKeKCG1/eidB+jzVZbZ4Ms9a
	 sKjiqzbTwO/x6Co6eXk3NiNrA0Ck6pHvG/wxN6yu0QOyMkfHHfzmTU/F4JpoaA1+sV
	 ExZaAlf6wcLRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: mfd: s2mu005-pmic: drop compatible
 property for multi-led node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260616-s2mu005-pmic-supplement-v1-2-41e84518b711@disroot.org>
References: <20260616-s2mu005-pmic-supplement-v1-2-41e84518b711@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 20:40:51 +0000
Message-Id: <20260615204051.97DA51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit removes the `compatible` property from the `multi-led` n=
ode schema but leaves it in the `examples` section, causing `dt_binding_che=
ck` to fail.
--

commit 0e7f716b7cd2059b3923af518e9775e3715e58df
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

dt-bindings: mfd: s2mu005-pmic: drop compatible property for multi-led node

The multi-led node is very trivial in description and also has no
sub-nodes. A compatible string property for such nodes is not preferred
by upstream. Remove said node from the schema. While at it, also add a
description following its other sibling nodes.

Link: https://lore.kernel.org/all/d2f4cb7d-5c3e-4b9a-86ca-04262cbb9775@kern=
el.org

> diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.y=
aml b/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
> index 8354422e39b1e..f62fe7a05147e 100644
> --- a/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
> @@ -38,17 +38,10 @@ properties:
>        Child node describing MUIC device.
> =20
>    multi-led:
> -    type: object
> +    $ref: /schemas/leds/leds-class-multicolor.yaml#
> =20
> -    allOf:
> -      - $ref: /schemas/leds/leds-class-multicolor.yaml#
> -
> -    properties:
> -      compatible:
> -        const: samsung,s2mu005-rgb
> -
> -    required:
> -      - compatible
> +    description:
> +      Child node describing the RGB status LED.
> =20
>      unevaluatedProperties: false

[Severity: Low]
With the compatible property dropped from the schema but unevaluatedPropert=
ies
remaining false, will this cause a regression during dt_binding_check?

The examples section in this file still defines the compatible string:

examples:
...
            multi-led {
                compatible =3D "samsung,s2mu005-rgb";
                color =3D <LED_COLOR_ID_RGB>;
                function =3D LED_FUNCTION_INDICATOR;
                linux,default-trigger =3D "pattern";
            };

Should the compatible string be removed from the multi-led node in the exam=
ples
block as well to prevent an unevaluated property error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-s2mu005-pm=
ic-supplement-v1-0-41e84518b711@disroot.org?part=3D2
