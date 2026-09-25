Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BA64D0A13
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351726; cv=none; b=cgk4k/1MVP13fr8iyNALrw7o4w83znrBR1FlnayAhfrK/dJVBOUQI9gJLuNoRVjpyw7HamnyyQk+NhVr6NQKXwf5bly0v41OCGiGvKwLFXm+yZOux1rhJSkshCfHxMAW5lwYGSvBK5vOSl5jk9Pzq+M0jcEhAi41ebper0N+yAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351726; c=relaxed/simple;
	bh=C+lHIC0qSjFba9XDWke4HRVs9X1ogIONOJO8IBwVgA8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AipGqHCcbWM1xy+x1ezuPCV0pQHaetUGzo31pMmFKcFd+i3a15ZuKgFrAha9n9+05rJvhLIBCtDCS8IFXMwQk6qj7hTw82y0xF44JtoWRCtdDzDcAFEOBlO+I7jhX+fvmiYcWDDP7Rh36nvtPVDdx4gHmntNT1zL9ouFCQf1ynQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFRj++pz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFRj++pz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C981F00898;
	Fri, 25 Sep 2026 15:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790351724;
	bh=dTYNBstPVIa3W3+iK+hAaB2PaQswPtepy0RROd1JY8w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NFRj++pzzrJpYQ17sM0aAoAZzQtqj8PX88HSIDfcN0nB/bmlFNUvdAgHM3IqiTDr/
	 U5/z+Z6LWBPiMi9bDc4NjjfUFHW+lqZlX5MIyBRdE7KkOfNfEgcSyf9mEEGtsx5oOZ
	 yH47avpOX8R6jdSk6r9yhjxDt4TL1iaAZBdpqSBqO8SZt7XSHDA/wavL9tPkUnod7i
	 mXfadMDu/ZiSqjUjKDKK649gXQ+fkdzMlaNuxg56AiMOpmx4qNd0UHFG52R9EqOXIA
	 hKIQykPn42abJiv/a2PA1PrZo3kC1+xzBM2XUu8fmRuBlW4FTQRvY7T5C0n7vD7Hcs
	 dvP7z3ZYD/JvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add MT6795
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yassine Oudjana" <y.oudjana@protonmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260925-mt6735-pinctrl-v9-v9-3-bfb19d8bb87c@protonmail.com>
References: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
 <20260925-mt6735-pinctrl-v9-v9-3-bfb19d8bb87c@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 15:55:23 +0000
Message-Id: <20260925155523.C2C981F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: pinctrl: mt6795 interrupts maxItems schema conflict
--

commit e88236860cd50ab5c2393f176ac891e2544b938c
Author: Yassine Oudjana <y.oudjana@protonmail.com>

dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795

Combine MT6795 pin controller document into MT6779 one. In the
process, amend the example with comments and additional pinctrl
nodes from the MT6795 example, replace the current interrupts
property description with the one from the MT6795 document since
it makes more sense and define its items using conditionals
as they now vary between variants. Also use conditionals to define
valid values for the drive-strength property as well as items of
the interrupts property for each variant since they are different
on MT6795.

> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml
> index 4dc9504e24ad5..4df6971030416 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.y=
aml

[ ... ]

> @@ -81,6 +83,45 @@ allOf:
>              - const: iocfg_lt
>              - const: iocfg_tl
>              - const: eint
> +
> +      patternProperties:
> +        '-pins$':
> +          patternProperties:
> +            '^pins':
> +              properties:
> +                drive-strength:
> +                  enum: [2, 4, 8, 12, 16]
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt6795-pinctrl
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +          maxItems: 2
> +
> +        reg-names:
> +          items:
> +            - const: base
> +            - const: eint
> +
> +        interrupts:
> +          minItems: 1
> +          items:
> +            - description: EINT interrupt
> +            - description: EINT event_b interrupt

[Severity: Medium]
Does this conditional block create a schema validation conflict for MT6795
device tree nodes?

The top-level properties definition for interrupts enforces a global constr=
aint:

  interrupts:
    maxItems: 1
    description:
      Specifies the summary IRQ.

Since JSON schema constraints apply conjunctively, the conditional block he=
re
that attempts to define and allow 2 interrupt items will be inherently bloc=
ked
by the root maxItems constraint. Will this unconditionally fail validation =
for
MT6795 nodes that provide two interrupts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-mt6735-pin=
ctrl-v9-v9-0-bfb19d8bb87c@protonmail.com?part=3D3
