Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F203F25EF87
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 14:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519856; cv=none; b=qAhNRxeUpxyMzebRuCKmhT78afdGNrE+4pWW8mb2XwyCSI77y3nk/B66lG78gGXL3ELB0yPG8n2CJK0/wLQafbxOu+1Ajfu13tfQp3/zAQiKNR5gR2L4CrkHXa7/Zy4hlt90wh2h/BzgPqNldu9mQCllimwjh5zHvNFAyneH+bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519856; c=relaxed/simple;
	bh=z8LOprlmKwKPrNbYdoELR7h57aziL42iTjc3pjmJRS4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PVHcA2VS3WqMS0zZf+RevjmWr4gUsD+l/x5pTy2zq/APDNgriE5v273B52AsftkDp7TSO56RtMBFKlF8ptg4EgupHs5CfsGm8tfImHKWdFknRiQIBq0loRsExsm59jbmZ9iDT6/fieEeNTE3+PhxcRjEjQMGwAVFKNAenrVkEVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKFqGW/5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKFqGW/5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8151F000FF;
	Sun, 27 Sep 2026 14:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790519854;
	bh=JQA++aknkdABr92fqXrlam/PrSQpXROJMqNL5y/HHJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cKFqGW/5ajBYNAhBPWc7MMuKZgEZVs1BokpbSlMW0PAq5EyEXVQSSNyIf6GI3152T
	 NOzdVPAIOR9yb6Af0WqBaNrfOfXUQUTMMMOTAWOGvR1paph8X5gtBpLAdNrFec65BQ
	 NVDZ+AsoibSVCstcejqYWbGabPCccAem5bGCvb04XVyo9N3UMIPyfhPHFei8TsTC5g
	 G8KqzPgjIUfftIyhOeyWkJ6aKlF54bh2g4Bebi5g0KcR9mHg5MiQIdOFafIpFRVscj
	 mIMZ5xv23ilJoweCfbSom93ziHioAoHPZaQFC8AnINoz3hXNKyKwfWjmzpXrwabG2/
	 3IzKCr8MAA0OA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: pwm: amlogic: Add core clock for S4
 like
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260927-add-t7-sys-pwm-clk-v3-1-18d66abea4d1@aliel.fr>
References: <20260927-add-t7-sys-pwm-clk-v3-0-18d66abea4d1@aliel.fr>
 <20260927-add-t7-sys-pwm-clk-v3-1-18d66abea4d1@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 14:37:33 +0000
Message-Id: <20260927143733.DA8151F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: pwm-amlogic: missing minItems allows validation byp=
ass
--

commit 359e122eac15df570817ba590b91f8958522a038
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

dt-bindings: pwm: amlogic: Add core clock for S4 like
   =20
This commit adds a third system core clock to the Amlogic PWM controller=20
bindings for S4 and related devices. It updates the conditionals for the=20
S4 compatible string to require three clocks instead of two, and updates=20
the examples to match.

> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Doc=
umentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> index c337d85da40f1..e9cd5f1fdf264 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml

[ ... ]

> @@ -143,9 +143,15 @@ allOf:
>            items:
>              - description: input clock of PWM channel A
>              - description: input clock of PWM channel B
> -        clock-names: false
> +            - description: gate clock for the PWM controller

[Severity: Medium]
Will dt-schema successfully enforce the minimum 3 items requirement intende=
d=20
by the commit message?

Because the global `clocks` property definition has `minItems: 1` and JSON=
=20
Schema's `items` keyword only validates elements that are actually present,=
 a=20
device tree node with `compatible =3D "amlogic,meson-s4-pwm"` and only 1 or=
 2=20
clocks will silently pass validation.

Does this block need an explicit `minItems: 3`?

> +        clock-names:
> +          items:
> +            - const: channel-a
> +            - const: channel-b
> +            - const: core

[Severity: Medium]
Does this also require `minItems: 3`?

Supplying just "channel-a" and "channel-b" will still validate successfully=
=20
without a `minItems` constraint here.

>        required:
>          - clocks
> +        - clock-names

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-add-t7-sys=
-pwm-clk-v3-0-18d66abea4d1@aliel.fr?part=3D1
