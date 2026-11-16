Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831209;
	b=r7GxTf7JkK4NYkh1QsHOnGbD3zg2ymEI5nAWIRRRLVPhDK6W735oJiYp6r8qZ9zT63ab
	 Oi92PlPZrW4rSR6oCpypnv+kpHkN8wQ23/J9IiDVIPAxCMlJDWIKXfxG9rJu8BGpnJL3R
	 fnbZi/swM2ELv/jbE9/gF8kUl+1HeQDuklBbDWF4+646SKR68qJ6bgIYe1PvBcWmPp9wZ
	 WS/Y7bRZ6O5ET7w2tzph570D0nR0pDLg6iSM5wA/ozwTrvwOjRtPii0OKowVSK6xOMQTG
	 zKoyaht+YiuXMAoh/n817bcpCMX2pjYl/+uVEYyPWWhuLmfhOc/M6MLA2o+9aVQzBSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831209;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JErpceofJPDqtVbOd8jF+eXohzohchNfQstY/Xqb0tA=;
	b=bde4QcFu/W8/2iZJ3ASmO6HaxpyjTVFoCF1q6+DEcAScItgZoZpxAedClNSd7YXZzuTR
	 pkuv9oZr/5jtDE+hTluqmPFj8LN2FcMU300GgC17JaulPhjF23winsapOK0VGNB6KXVK7
	 mgf6O13TKusnaKJyDuSOSzDEokGVLcWjvnhCvkWUty/XLe7fnUkmIF18vAUkTB0PBD1JU
	 GV25xEHrxzgeGCtuB9wWJ9lzpfCunG1dkonho2NzPmFPLccKdCzYgMqiTrLqr89rmG6Es
	 umBw43eFDm8/PRcMJjPoYguc2ZN4UC+sHBjq4SNFHPI44J42Am0gW+Pqb6ip92M8YqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WjrJX95O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E76606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WjrJX95O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988941F000C4;
	Mon, 16 Nov 2026 12:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794831209;
	bh=JErpceofJPDqtVbOd8jF+eXohzohchNfQstY/Xqb0tA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WjrJX95OJcsaJaVY4k46WlACFmlhkn01sLqsUomJhGaUop0whzpKhtqkvYEkURjYM
	 ZwItjpOVZo1x1apnyzI3g52Ljg2tjAtdyc5ic8SRfokgqqR8zmBzDZaQwEKdYYObsp
	 QJ+EVbp6PVo8X2BZoWuGnCGfZZDyIeySZzNsE6MVDlawXQb2dH20DBcsG59rl60YZo
	 0udOQFlwsk0LGzU9YTsdBV54fyED/WDzIJtSwTudTrstxyCPNRE2C7BWaQgf8h7X/j
	 vo8xfFbGc2pMyp4qKJc56d1r5jG5IZyEI6dclf7cK3KzlqJU+bo7+F8OFPTm9OFIsj
	 nUDZbcIh/jr0g==
Message-ID: <sashiko-outbox-216995@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/8] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksa Paunovic" <aleksa.paunovic@htecgroup.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-p8700-dts-v3-5-ec5d4b7de39f@htecgroup.com>
References: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
 <20261116-p8700-dts-v3-5-ec5d4b7de39f@htecgroup.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 12:13:25 +0000
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
- [Low] dt-bindings: timer: unwieldy conditionals and broken reg-names
  in c900 mtimer
--

commit c813dc9b1038dccb749c89c6352de2cfcd1ce9b4
Author: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER

This commit adds the mips,p8700-aclint-mtimer compatible and support for
both mtime and mtimecmp register regions to thead,c900-aclint-mtimer.yaml.

> diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mt=
imer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtime=
r.yaml
> index cf7c82e980f67..a5ebe04ade9ed 100644
> --- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.ya=
ml
> +++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.ya=
ml
> @@ -21,13 +21,19 @@ properties:
>            - enum:
>                - anlogic,dr1v90-aclint-mtimer
>            - const: nuclei,ux900-aclint-mtimer
> +      - const: mips,p8700-aclint-mtimer
> =20
>    reg:
> +    minItems: 1
>      items:
> +      - description: MTIME Registers, or MTIMECMP Registers if only one
> +          region is present
>        - description: MTIMECMP Registers
> =20
>    reg-names:
> +    minItems: 1
>      items:
> +      - enum: [ mtime, mtimecmp ]
>        - const: mtimecmp
> =20
>    interrupts-extended:
> @@ -42,6 +48,26 @@ required:
>    - reg-names
>    - interrupts-extended
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mips,p8700-aclint-mtimer
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        reg-names:
> +          minItems: 2
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +        reg-names:
> +          items:
> +            - const: mtimecmp

[Severity: Low]
Should mips,p8700-aclint-mtimer be split into its own binding schema rather
than overloading reg and reg-names in thead,c900-aclint-mtimer.yaml?

The existing compatibles in this binding only have a single mtimecmp region
and no memory-mapped mtime region, as noted in commit b91cf01cf3e6
("dt-bindings: timer: thead,c900-aclint-mtimer: separate mtime and mtimecmp
regs"). Combining the two-region MIPS layout with the single-region layout
forces item 0 of reg and reg-names to mean either mtime or mtimecmp and
requires an allOf if/then/else block to redefine both properties per
compatible.

In addition, the conditional reg-names constraints here are incomplete: the
then branch only sets minItems: 2 without constraining the first item to
const: mtime, which lets an invalid reg-names =3D "mtimecmp", "mtimecmp" pa=
ss
validation via the top-level enum, while the else branch overrides the
2-item list with a 1-item list without setting maxItems: 1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-p8700-dts-=
v3-0-ec5d4b7de39f@htecgroup.com?part=3D5
