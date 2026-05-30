Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC158217704
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101825; cv=none; b=JUPivkVn5Amvt5BKCi2PdkEZ7GAbBEsBjOJWUtncc+a3zU20Jccf0RavSIT8ZI3QHDQOja1YqrBWfthC+d4aAp36PjkrWBkw8ERA7W3DLV3r8+EGpz+oEfXgIoKC9v+UoCnRiEoMm6BU9rTpSvBODszEaBIOe3pQ2RWyoE7xaHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101825; c=relaxed/simple;
	bh=07D24JiKbG623kAGmqZh0fxbI0I5/a5ebES8nDdgAeo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UBIqgAHn6FRfM++Vq0qAZKDge4bdWoI1sPjN09m5MMKDknPiF7D/l+2naj3tODlZt1vyRctkU4WDdm7DyyMRR9ikqpO/UGspTm8qEnmMuwIqoJ/BPK4Ne5hylOmpgugxtWaxw4mgUSJV8W4Z8iOUzjCBaFvwhHyCukUbgm5r4cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMZxlbOS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMZxlbOS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0441F00893;
	Sat, 30 May 2026 00:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101824;
	bh=bqWhx0nCgEs9GR44/Tq44yhHmu9e4FFUCjs1rudCJf4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MMZxlbOSa1YwtXMjgShPvdq4EmfFnq5xyRvIb8Rx9m21EX/omghsUnU8Bt7avAi12
	 89pMnVx5JXF3BjQm3aVskTXBucZG5howomYjFdG7JsgcoNXRlb3O/tqDYLVsnoA9ma
	 EoBhH0s2Knyzx6LoH0aW6V7mLKlmP45wWHpzhSTdlnLKFqGkL99SfYGsK7p3zW+xOu
	 YzjMVxGH/pk2Hm7PzxgwTLvUi0jZYNTESUqY2my9rr2XRvHYQuZWwdFuCZ+iNgJHMr
	 YtS7LqHV8ojPqnN/BMZAMEm08UKL8a8UDg4AGiRiag0yQSX1f+ZQtOnmPA+EKRN/dR
	 X3958Ycu+TQdw==
From: sashiko-bot@kernel.org
Subject: Re: [net-next v4 2/5] dt-bindings: net: starfive,jh7110-dwmac: Add
 jhb100 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Minda Chen" <minda.chen@starfivetech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260519101436.111476-3-minda.chen@starfivetech.com>
References: <20260519101436.111476-3-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:43:43 +0000
Message-Id: <20260530004344.4E0441F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect fallback compatibility for `starfive,jhb100-dwmac` and=
 nested schema logic
--

commit 6b46c7eda188eefbc105849442bf373d3049d603
Author: Minda Chen <minda.chen@starfivetech.com>

dt-bindings: net: starfive,jh7110-dwmac: Add jhb100 support

This commit adds device tree bindings for the jhb100 GMAC. It notes
that the hardware is similar to jh7100 but only has one reset signal
and one interrupt line.

> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.=
yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> @@ -30,6 +30,10 @@ properties:
>        - items:
>            - const: starfive,jh7110-dwmac
>            - const: snps,dwmac-5.20
> +      - items:
> +          - const: starfive,jhb100-dwmac
> +          - const: starfive,jh7110-dwmac
> +          - const: snps,dwmac-5.20

Is it correct to use starfive,jh7110-dwmac as a fallback compatible string=
=20
here?=20

A fallback compatible implies that an older OS driver written for the jh7110
can successfully drive the jhb100 hardware. Since the jh7110 expects 3
interrupts and 2 resets, won't an older driver fail to probe the jhb100
because of missing required resources?

[ ... ]

> @@ -107,20 +111,39 @@ allOf:
>            contains:
>              const: starfive,jh7110-dwmac
>      then:
> -      properties:
> -        interrupts:
> -          minItems: 3
> -          maxItems: 3
> -
> -        interrupt-names:
> -          minItems: 3
> -          maxItems: 3
> -
> -        resets:
> -          minItems: 2
> -
> -        reset-names:
> -          minItems: 2
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              const: starfive,jhb100-dwmac
> +      then:
> +        properties:
> +          interrupts:
> +            maxItems: 1

Because of the fallback compatible, the schema patch nests the jhb100
constraints inside the jh7110 'if' block in allOf.

If starfive,jh7110-dwmac is removed from the jhb100 compatible list, could
these constraints be defined in an independent 'if' block instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519101436.1114=
76-1-minda.chen@starfivetech.com?part=3D2
