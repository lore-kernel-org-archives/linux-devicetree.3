Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CF63C2B80
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263516; cv=none; b=R/vwQTyZb5M8ZLHey9WX+wXeC3wjpr4sf63U020KEM2LNyJIGml70bT06IlqN6wbnyd8O1f8Jo5GhA6nrTx5qp7/I795lLD8lPDaVNJQmV3jSZQGsz/2QwlCKxYWuqDWqGIKxBN+/j9McTeMZ/S8OuZ88uEQ8HR2GxYkGaG38CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263516; c=relaxed/simple;
	bh=rp0BpdjmkAM+E8Z723r97TPQYi0WBR8heSDktgw6g7M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QBFmAkF4NOxh+h8FoS/jEZ9iEjiymjqH91n8XGikrRsSvYph43ylD3Bhjcg4C20HMIzjGWVrFbOysfwY/eMDuQNa5ALk0ZZO52yI3dDReH9+9LkgD4gQVuyKhOxr5XUmOJBNmLXu19l1Ta5u5li68hSQwlAobz7/ctZsiBtO97U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCBNoqCi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCBNoqCi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679651F000FF;
	Thu, 24 Sep 2026 15:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790263514;
	bh=wLRczrhvj5kOUmCIDymBvDfFY4NwRV0X1mOvFQHZwu8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SCBNoqCiXgKq7/cFOTdQe5tZ3eOfMTrEU7WE3JlI+e9f2/VtgJg4pJdit1hEcJM47
	 dB3WOuK15lrJKH3vHOk7zmz3dr9GFTZZgp6uPElJzwrP320pY2YEwB2wRhk0pQ1dIu
	 G6+JKT/U3BKCije9hq3e/fGH5A4ag5U392BIAjlk/BJnDnAihhKmf8qgZNxg+DIKf/
	 RDFk32rzj6NqhMO7xq1+lG/7NwoMpElYtq1onLlujQICzsFW1K6h8BP+OwwxC5Ezua
	 Cpq0fbKbOp5y7Ev/yGhXJwfmxRpaK1JhhWzD2VrQNf5VJCD/w3yPzqkpGg7s6BSwoU
	 nHonLg0K+60kg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: pwm: amlogic: Add core clock for T7
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260924-add-t7-sys-pwm-clk-v1-1-05b91e87f0a9@aliel.fr>
References: <20260924-add-t7-sys-pwm-clk-v1-0-05b91e87f0a9@aliel.fr>
 <20260924-add-t7-sys-pwm-clk-v1-1-05b91e87f0a9@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 15:25:13 +0000
Message-Id: <20260924152514.679651F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: pwm: amlogic: ABI break for amlogic,t7-pwm
--

commit ea055f0ab3ecf76a41b2a2cf99ee615eac00cdc9
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

dt-bindings: pwm: amlogic: Add core clock for T7

This commit adds a third core clock for the amlogic,t7-pwm compatible
binding and requires clock-names for this SoC. Other compatibles are left
unchanged, and an example is added for T7 usage.

> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Doc=
umentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> index c337d85da40f1..9212a40d9fe48 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml

[ ... ]

> @@ -135,17 +135,38 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            enum:
> -              - amlogic,meson-s4-pwm
> +            const: amlogic,t7-pwm
>      then:
>        properties:
>          clocks:
>            items:
>              - description: input clock of PWM channel A
>              - description: input clock of PWM channel B
> -        clock-names: false
> +            - description: gate clock for the PWM controller
> +        clock-names:
> +          items:
> +            - const: clk_a
> +            - const: clk_b
> +            - const: core
>        required:
>          - clocks
> +        - clock-names

[Severity: Medium]
Does this introduce a schema validation regression for older device trees?

By defining exactly three items in the clocks list and strictly requiring
the clock-names property, older device trees that only provide two clocks
and omit clock-names will fail validation. Device tree schemas typically
must maintain backward compatibility with older or out-of-tree DTBs.

Should the schema specify a minimum item count of 2 for clocks and only
conditionally require clock-names based on the number of clocks provided
to avoid an ABI break?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-add-t7-sys=
-pwm-clk-v1-0-05b91e87f0a9@aliel.fr?part=3D1
