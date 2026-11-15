Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794763168;
	b=35Mg6veoi9m2Ei8ZmngDmd5YSrooe9Y7dFIaolHJf4/oWUAJKFlr9qV+0Rss3n21huBH
	 nuSf100HlwsKU5oFXFc/dN5u5LsBhG5JPuCYJX6RWtk5Ki9BjgdH5cTi6YvMPqfeV6oN0
	 Aek1xWOItzHGaE6BPutIbVeGV1tbUMSnYZO1wbZH79UWKbj5jCW9gtXTboS6f5A8I+FRV
	 qU+1P96+NNXXbSiy9vjUHIMJIHvQUm9GG1T0Kpu+TdXiAKhHr2oTY8PH9qlKu7N+A1Ugt
	 lsnSC1f+726KbFBKc9GFdrn/dCOOiouyGzTcsGXhqVRzbt8B0/zp/1dGXo9iHy+++uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794763168;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uasUeJRJv0y0chcbK6CSOMmZpG6NSjTFI2oGQvmq3GI=;
	b=TPHTy/Hc4/93EokWGZlbxqShxCUj/BDu6uROgvsfYZpB+SQzPI/3t0WIdH9hyOXQdxck
	 opMYipDb2tQf+H8YjZbPM8YzIPPDtPMg6SUd1It6L133VNu5VoEUNe6uAU1sTKv5dQN8e
	 +pXPO1OvwmHkLlzOD4HLScVP54kSBKKRBjraGrPoNNyvF9PA9WzFIfavjN9hzyJ9aFDHZ
	 8E+ccG7bzwjymZ9DHlQHzs7gueSZJoNfXUNHF63RFBOz3tIcplJJAHQpj+V3TrT0knp0H
	 GRlH5YGhe/T9DIt6ZMEe+xmVla2nDwRAwCsKSaIYRLQ7Sj32h32LY9LLcq1hpi5xP0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mHztX9d8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F8A606A31A
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mHztX9d8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E2D1F000C4;
	Sun, 15 Nov 2026 17:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794763167;
	bh=uasUeJRJv0y0chcbK6CSOMmZpG6NSjTFI2oGQvmq3GI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mHztX9d8k4slu4UZWYDdlUq5CwI3UigmhWoU9S+Sm9eKL8nYVy4tVfv2/NT5Kroci
	 l7ue6nq02SQxAz8HJCQnjyJacg+jwS1PHgf4MWqyIWK6hnDGcNkKWu1uEZY+mWGIn7
	 oGBV+qmpPC0K44R0yHWZk3Pr1EbzNfrx32IkEL2OxWltXYSYdlbfamveKPp740sb1t
	 ENLoqIA04Z4MjPt69q1JFK1nCvMNURWghRqAyt0gmTUIRp5OQiPwccKtZvMtTq7Blo
	 NQ0g0JmUq4g6yLULz0tyO8+6QZqBGYQE8+iiBpMST+9LhSXd3RqHhMo/vVUhdZGMmg
	 IvQlc+HlmNNYQ==
Message-ID: <sashiko-outbox-215675@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] dt-bindings: power: supply: axp20x-usb-power:
 Add the AXP2101
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Louvignes" <olivier@mgcrea.io>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115171150.64431-5-olivier@mgcrea.io>
References: <20261115171150.64431-1-olivier@mgcrea.io>
 <20261115171150.64431-5-olivier@mgcrea.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 17:19:27 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: power: supply: piling per-compatible if-then onto
  axp20x schema
--

commit b91180032c14c7d6f98055be9d7c8629fe0f89d7
Author: Olivier Louvignes <olivier@mgcrea.io>

dt-bindings: power: supply: axp20x-usb-power-supply: Add the AXP2101

This commit adds the x-powers,axp2101-usb-power-supply compatible string
and its supported input-current-limit-microamp values to the AXP20x USB
power supply Device Tree binding schema.

> diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp2=
0x-usb-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x=
-powers,axp20x-usb-power-supply.yaml
> index 2ec036405ae47..439b3ea6a7f5b 100644
> --- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-=
power-supply.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-=
power-supply.yaml
> @@ -25,6 +25,7 @@ properties:
>            - x-powers,axp223-usb-power-supply
>            - x-powers,axp717-usb-power-supply
>            - x-powers,axp813-usb-power-supply
> +          - x-powers,axp2101-usb-power-supply
>        - items:
>            - const: x-powers,axp803-usb-power-supply
>            - const: x-powers,axp813-usb-power-supply
> @@ -101,4 +102,15 @@ allOf:
>            enum: [100000, 500000, 900000, 1500000, 2000000, 2500000,
>                   3000000, 3500000, 4000000]
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - x-powers,axp2101-usb-power-supply
> +    then:
> +      properties:
> +        input-current-limit-microamp:
> +          enum: [100000, 500000, 900000, 1000000, 1500000, 2000000]
> +
>  additionalProperties: false

[Severity: Low]
This schema only defines compatible and input-current-limit-microamp, yet
allOf now has six separate per-compatible if-then blocks because almost
every AXP variant supports a different set of current limits.  Should this
binding be split into separate schema documents rather than piling on more
per-variant conditionals?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115171150.6443=
1-1-olivier@mgcrea.io?part=3D4
