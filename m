Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803927;
	b=0mYODzqscWDpRLC8CvIx0IkM7vuBo/Ka4OWPZhUox7yrkbsMg9/jUvDJAhIGuzFmS3wp
	 G/u3NlpY1F7ikzEO/aui1Ai0UqcdiQxhSQT3b/tb9crZVyIIszOVLLxNUhXkBS8AqIDTf
	 79kH1MoiyS9psrQ5GCfGNN1LL1SB27Id8xFLz2lvS7OgDBV87gKGAszDYJMcePn8ZQR+S
	 5wzaoz5lC2u4oXHDpv+GHSU0PJ0q+ioWOdU/PB5z8uBrxujNmDKJevM0yyl7ufcr6ZQeM
	 RxozSU7k0Q0fbE7yP6FS/m5xfhLxdMH9q/n9BBLq9ZC2RXkhqNKzvZitBsq9TGPlKlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803927;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iyWT7NI3s7WGu2ovOGqJnZl9tftFU+8dr/vZsKVJgQE=;
	b=rhfLTOqWq39y6LtEzWr3FtD0IHf1BznUleGhQR57EieIc8q7IRjAqu6Lwbs+zk9oQdv/
	 hnMWwIekHeNk3zuksLeVpKue6+457YDBLY2aKg/OTtIJ6LhAAtFE4Cv4JKyMBKwo8/3kw
	 jDcfUIHzlOGPB61qSr+rWwUYYUzurdGOknRdoOGjH/41foX3jK5hajbG7nV9iRNl5+MxZ
	 xQU2mLbecu+hMx7nSOEc5nohodkOoagGbJ+GCD/j7MqvAxK8qjwjQ9nl0INwCQXB0NgZb
	 wMQd7aqGVUbgXT5VesX5Q4ZH68ic6ItZzi5MbXhgbgm1ffQ5YpM7FTczz5lDWpj0edQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lbuqHEOA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A33606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lbuqHEOA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DC41F000C1;
	Wed,  4 Nov 2026 14:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793803926;
	bh=iyWT7NI3s7WGu2ovOGqJnZl9tftFU+8dr/vZsKVJgQE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lbuqHEOAUqfY1L2YGagFVSeNbVT78RsFn3/sj8BwojgM/ZRwgkgEGjDYEDKZ/JFf3
	 KSvSsmeTlayq/yMPnREi3p5cSkg70UgEwLigOzsp9Ysl8cu8rCnVFWtrx0MDmrb6cJ
	 XUlCvYWrZdHeSGkQLouvf4UKn98oOszWnK130kvUK4gBkp+vQQU3IlgkVemMGIM8t8
	 ITIkldHNAJoI1ELNL9DbEgmEQAfJ9GZyfvfkGJIBxyyTvxWYdzmq1tz2UONW8+8/lr
	 TjYZB0QxGIuvwVKL3bMKJS3+gtZHHQPSZ1Cs6AL7h3Pd8R64vrH/gf5F1xrUv8DEGB
	 UQHup4d2qQkRQ==
Message-ID: <sashiko-outbox-197468@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: arm: vexpress-config: Drop ineffective
 label limits
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sudeep Holla" <sudeep.holla@kernel.org>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104144456.2763775-1-sudeep.holla@kernel.org>
References: <20261104144456.2763775-1-sudeep.holla@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 14:52:05 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: arm: vexpress-config: removing label disallows vali=
d DT property
--

commit 4a11da8feaabaee63d050894e37aa89a526904b2
Author: Sudeep Holla <sudeep.holla@kernel.org>

dt-bindings: arm: vexpress-config: Drop ineffective label limits

This commit removes the label property definitions with maxItems: 1 from
the regulator, amp, temp, power, and energy child node schemas in
Documentation/devicetree/bindings/arm/vexpress-config.yaml.

> diff --git a/Documentation/devicetree/bindings/arm/vexpress-config.yaml b=
/Documentation/devicetree/bindings/arm/vexpress-config.yaml
> index b04e8e0521815..2d4eff19292b8 100644
> --- a/Documentation/devicetree/bindings/arm/vexpress-config.yaml
> +++ b/Documentation/devicetree/bindings/arm/vexpress-config.yaml
> @@ -154,9 +154,6 @@ patternProperties:
>            - const: 2
>            - description: device number
> =20
> -      label:
> -        maxItems: 1
> -
>      unevaluatedProperties: false
>      required:
>        - compatible
> @@ -175,9 +172,6 @@ patternProperties:
>            - const: 3
>            - description: device number
> =20
> -      label:
> -        maxItems: 1
> -
>      additionalProperties: false
>      required:
>        - compatible
> @@ -196,9 +190,6 @@ patternProperties:
>            - const: 4
>            - description: device number
> =20
> -      label:
> -        maxItems: 1
> -
>      additionalProperties: false
>      required:
>        - compatible
> @@ -235,9 +226,6 @@ patternProperties:
>            - const: 12
>            - description: device number
> =20
> -      label:
> -        maxItems: 1
> -
>      additionalProperties: false
>      required:
>        - compatible
> @@ -262,9 +250,6 @@ patternProperties:
>                - const: 13
>                - description: second device number
> =20
> -      label:
> -        maxItems: 1
> -
>      additionalProperties: false

[Severity: Medium]
Does removing the label entries entirely instead of replacing them with
label: true disallow the label property on these child nodes and break
dtbs_check?

Although the core dtschema defines the type of label when present,
^regulator-.+$ specifies unevaluatedProperties: false (and references
/schemas/regulator/regulator.yaml#, which does not define label), while
^amp-.+$, ^temp-.+$, ^power-.+$, and ^energy(-.+)?$ specify
additionalProperties: false. Without label listed in properties, any label
property on these nodes will be rejected as an unexpected property.

In-tree Versatile Express device trees (such as
arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts and
arch/arm/boot/dts/arm/vexpress-v2m.dtsi) define label on these child nodes,
and drivers/hwmon/vexpress-hwmon.c reads it in vexpress_hwmon_label_show()
and vexpress_hwmon_attr_is_visible():

    const char *label =3D of_get_property(dev->of_node, "label", NULL);

Should these five entries be changed to label: true so that the property
remains permitted while dropping the ineffective maxItems: 1 constraint?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104144456.2763=
775-1-sudeep.holla@kernel.org?part=3D1
