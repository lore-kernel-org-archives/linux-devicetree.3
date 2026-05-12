Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FDE384CE3
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778568149; cv=pass; b=NlELTHFy9O4ezL2oqZVFycKvgf6uB0usqaGn3Af7017YOIWeZ7VmeXfGv+3TOhWgrLE856k+E3KN0fRuQjQ7coNiJZ4R+dSzW13WzgAjfP41HwvI60ElKOWOruZVmwgq85aqUPsgn0M91GXXjHknPVNFJaOuz/t2+F1yEf6+rCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778568149; c=relaxed/simple;
	bh=JW+i/pVE71OvGEL5VzIECpn0VkCbGmOKNADt617MGsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRICZxkq9tHbq5yD6bPd7nZNH3FmBU2+73uouzQsH21QHPnSM1e8ByRLu/IqxchiEfQXOKsCnVtzjYzS5n9QRKnflegwIcerntvd5m9EDndia5X50qM4Dqkt7ea+giH9giLSZ38jDaBXka2wTr1Fg7jaLZcYP4Sy0kq31qw9sSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDS+yOdP; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDS+yOdP"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c82a6278a4cso115535a12.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778568137; cv=none;
        d=google.com; s=arc-20240605;
        b=hj901fssOoDwZxvot86m0D3SepOrvc38gFTtUY3zL/zlUOq6tkz3/dcFTuSs9u20KZ
         WEPY1pOl5lArFgNYtXRbrAN7RCUAxuBv8OFBs2jl0t693IShgkmUz6i7YeE4jrhua8kb
         xoyTmOXDMAbG/u64YWBRAoihd1Dyf6oA6xh3nNJU04WBPzGtBxviJtOphJlU0ums2G+J
         Q5xeTsB/5ixVmfd8UiYqL9r1RjSpNW0f+G/Pbsbs0U3NzslKHjjJKesGBdnTc02yN42U
         XEu3eE4cYPOtzTpZsIQG+YXrlkE1bnpFScGPpgSkK3hMVXhIDxSXT7kah1WtRhmQQ4c4
         ZI7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5TjPcoUMcuCxioj/5ldLRrHNHcGi2KwtoRGUoSJPPFU=;
        fh=nhVBLBX+dAch6do4vzWmq29JHs0Rl8rF4V4sv1WM/bY=;
        b=lnz9qMpUPT415uxN/B0hY2m0IqqqR5hXS24P8Jm+NojkLktCOWtR4441XdrX46Fw4+
         YOajAJwbYWTFkea3aefFUFXJxE8+s8l4DRMVg3rb6SUbjA5Gx58U/aMPnJBxtbNYzNan
         13gGj0oqkPvN8CqQKWiote7uCj8U1KzNZxEXoEo/Op0y87BXK9iqrC1R6DvCXk+1WlIB
         kNj4FaW7ciGGEOADiTbRD+8XdE0k5yvd7bd6bI75RWfPUGVbHpDvGkhT/lRb/Nyf1K9C
         zoTxWcRLOlhHF5fwjeCDbZ+q6FdC5sJ6+HdRnTrDF8LdthiwuxNKrbVJFeIUBBR1PFXB
         xG7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778568137; x=1779172937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TjPcoUMcuCxioj/5ldLRrHNHcGi2KwtoRGUoSJPPFU=;
        b=TDS+yOdPU6ArS94brMmyS2iua9IO0smIjPUKOF3rB8nbe21gvoNw9r6VVjGrfIz4q5
         DM+6UgO8Wmp+GFDu8inzdPD6QIA9LW6yOosti26qgLy8JxUrXGHf1u5qGhg2LGHrFtY5
         +KsBuifdtqzAxCdVpSgCdLYWW4au7/YRDPSemBgS6GEluxYe5unEXneVPzbIi0wa4GtJ
         Gg7uZRbmpbWD7CVpGE8sBlgUTWihZXaYL4TIbB2r5zfYmeNbcdSE7Y9ixmxh04+E/bSz
         jHyDEsJjDaHt0X9c1YHhNl2wIKBrKtvrONgd7rL239XI+F+pYTrDsBE82JLfea/Kb04c
         UtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778568137; x=1779172937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5TjPcoUMcuCxioj/5ldLRrHNHcGi2KwtoRGUoSJPPFU=;
        b=gZrI9ddfgvz4xrY6vCft7fn4IeInx2LtQ53UGKVKFyFu5dCJW437BXL6gxMXttYKIM
         CMuVAjgLImR3hHf6C0ngcXid66MAhB8iCBzUbUIoaBnbsopzW0p2x87zjkjTq9NiPc84
         dyACIN0vyOztC4cd+WHnxNzQugRB7a2n3tvGKeJBXGMuca2wir8T04bKGpaKkx1w3pj/
         KbXcaqrOmflBL4WZmXC72wjP8pM2jhQwAwPna065O0nAPscMpIeCnzcRKnnKYu0IRQp1
         se2+tXXsbD1BROKlHYZBAfO+yhUxu5g9kGs23jlq6A9Avj3Xhgv3nnV7tGbg5sLTqIo7
         4kBQ==
X-Gm-Message-State: AOJu0Yy192aP99bcsAZb+IO2ibjHlRCJf9SkuPFeschmjQjYf2Z19WLn
	sBmgYLB32rQ/tOx1AkpbAWQgY29DF/IYsQWJkoZC+7U6n9EGiyPVs6mqjk6e7g0xap4YpE/IrEi
	bDtjRaIuaX26Y/nRPx+NE9meeGebxNf0=
X-Gm-Gg: Acq92OF6K6nXt5xXq8+4ZVFkKQ7VmvFoX/SmJ6YafdFoaGaz0KrGJY5IPWWk/2+4any
	MUujcNxfa3jdH66UyD3hi28HKLZcmhvqa91eIY30nP0xZgwexLgSsmaT0l7nSSGomnNFJQpQ/GK
	6uuEHpHOPxPkgiHcb4MHNSCqeAKCNWIqJWqJEknITHFlOqk9bAsz+fzo16Q11iyiDgCEo4aecWE
	5Cy0Ti3BsqhqCt+suSzyRwhU8liMR7cBiYyPGbOP6pExy/bPPbnSNF1XAH1Ho/WxNoKfqywRknm
	8Ct6wuV51BQJeGRqw12XNMHF9dDAfkyxGoI33K4B3zjSDfmh
X-Received: by 2002:a17:902:e54e:b0:2ba:4e84:966 with SMTP id
 d9443c01a7336-2ba7a358d4amr307940265ad.36.1778568137174; Mon, 11 May 2026
 23:42:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-2-phucduc.bui@gmail.com> <20260511204528.14632C2BCB0@smtp.kernel.org>
In-Reply-To: <20260511204528.14632C2BCB0@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 12 May 2026 13:42:06 +0700
X-Gm-Features: AVHnY4I84EJDkO3xEZHB99KhLWC30tC31OgwdWSjgxMsmVdXgk751IHSnHRgLEA
Message-ID: <CAABR9nEhOTz1-0NmCMTbz=-+782Pto0yovSQhBXrXqhLwMg80Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: sashiko@lists.linux.dev
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Based on the Sashiko AI review, I am thinking of adding the following
constraints specifically for renesas,fsi2-r8a7740 to address the
reported issues.

I think this may also help balance both Geert's and Krzysztof's
comments from the previous v2 review.

Does this approach look reasonable to you?

---------------------------------------------

-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   $nodename:
     pattern: "^sound@.*"
@@ -94,6 +91,78 @@ required:

 unevaluatedProperties: false

+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,fsi2-r8a7740
+    then:
+      properties:
+        clock-names:
+          oneOf:
+            - items: # FSIA & FSIB is slave
+                - const: fck
+                - const: spu
+            - items: # FSIA slave & FSIB master use internal clock
+                - const: fck
+                - const: spu
+                - const: ickb
+                - const: divb
+            - items: # FSIA slave & FSIB master use external clock
+                - const: fck
+                - const: spu
+                - const: ickb
+                - const: xckb
+            - items: # FSIB slave & FSIA master use internal clock
+                - const: fck
+                - const: spu
+                - const: icka
+                - const: diva
+            - items: # FSIB slave & FSIA master use external clock
+                - const: fck
+                - const: spu
+                - const: icka
+                - const: xcka
+            - items: # FSIA master ex-clk  & FSIB master ex-clk
+                - const: fck
+                - const: spu
+                - const: icka
+                - const: xcka
+                - const: ickb
+                - const: xckb
+            - items: # FSIA master in-xlk  & FSIB master in-clk
+                - const: fck
+                - const: spu
+                - const: icka
+                - const: diva
+                - const: ickb
+                - const: divb
+            - items: # FSIA master in-clk  & FSIB master ex-clk
+                - const: fck
+                - const: spu
+                - const: icka
+                - const: diva
+                - const: ickb
+                - const: xckb
+            - items: # FSIA master ex-clk  & FSIB master in-clk
+                - const: fck
+                - const: spu
+                - const: icka
+                - const: xcka
+                - const: ickb
+                - const: divb
+            - items: # FSIA & FSIB  full clock support
+                - const: fck
+                - const: spu
+                - const: icka
+                - const: xcka
+                - const: diva
+                - const: ickb
+                - const: xckb
+                - const: divb
+
 examples:
   - |
     #include <dt-bindings/clock/r8a7740-clock.h>
@@ -102,7 +171,11 @@ examples:
             compatible =3D "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
             reg =3D <0xfe1f0000 0x400>;
             interrupts =3D <GIC_SPI 9 0x4>;
-            clocks =3D <&mstp3_clks R8A7740_CLK_FSI>;
+            clocks =3D <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+                    <&fsia_clk>, <&fsiack_clk>, <&fsidiva_clk>,
+                    <&fsib_clk>, <&fsibck_clk>, <&fsidivb_clk>;
+            clock-names =3D "fck", "spu", "icka", "xcka", "diva",
+                          "ickb", "xckb", "divb";
             power-domains =3D <&pd_a4mp>;

---------------------------------------------------------------------------=
--------------


Best regard,
Phuc




On Tue, May 12, 2026 at 3:45=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The schema fails to enforce the mandatory SPU clock for the r8a7=
740 hardware variant, and the example provides a functionally broken config=
uration.
> - [Medium] Mismatch between strictly positional `clocks` descriptions and=
 unordered `clock-names`, combined with missing `clock-names` enforcement.
> --
>
> commit 3adcf4902a5e62b71566ef5381f002fd5338a399
> Author: bui duc phuc <phucduc.bui@gmail.com>
>
>     ASoC: dt-bindings: renesas,fsi: add support multiple clocks
>
> This commit updates the FSI bindings to support multiple clocks to proper=
ly
> describe the hardware clock tree. It adds the SPU bus/bridge clock requir=
ed
> for the r8a7740 SoC, as well as definitions for functional clocks, intern=
al
> dividers, and external clock inputs.
>
> > diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b=
/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> > index df91991699a72..c50e7115b21a0 100644
> > --- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> > +++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> > @@ -38,7 +38,32 @@ properties:
> >      maxItems: 1
> >
> >    clocks:
> > -    maxItems: 1
> > +    minItems: 1
> > +    items:
> > +      - description: Main FSI module clock
> > +      - description: |
> > +          SPU bus/bridge clock. On R8A7740, this clock must be enabled=
 to allow
> > +          register access as the FSI block is connected behind the SPU=
 bus.
>
> Should we add an allOf block with an if-then condition to enforce the
> presence of the SPU clock for the renesas,fsi2-r8a7740 hardware variant?
>
> Without it, incomplete device trees might silently pass schema validation=
 but
> fail catastrophically at runtime, as the commit message notes that missin=
g
> this clock causes a system hang.
>
> The examples section of this file demonstrates this:
>
>     sh_fsi2: sound@fe1f0000 {
>             compatible =3D "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
>             ...
>             clocks =3D <&mstp3_clks R8A7740_CLK_FSI>;
>
> This example only supplies a single clock and omits both the required SPU
> clock and the clock-names property, which contradicts the commit message.
>
> > +      - description: CPG DIV6 functional clocks for FSI port A
> > +      - description: CPG DIV6 functional clocks for FSI port B
> > +      - description: Internal FSI dividers for port A used for audio c=
lock generation
> > +      - description: Internal FSI dividers for port B used for audio c=
lock generation
> > +      - description: External clock inputs for FSI port A provided by =
the board
> > +      - description: External clock inputs for FSI port B provided by =
the board
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 8
> > +    items:
> > +      enum:
> > +        - fck  # Main FSI module clock
> > +        - spu  # optional SPU bus/bridge clock
>
> Does defining clock-names with an enum correctly map sparse clocks?
>
> Because clocks defines an items array with eight fixed descriptions, it
> acts as a strict positional tuple. If a board provides the Main clock and
> the icka clock but omits the optional spu clock, icka shifts to index
> 1. The dt-schema tooling will then incorrectly map it to the SPU descript=
ion.
>
> Additionally, using an enum here allows arbitrary ordering and does not
> enforce uniqueItems: true.
>
> Could we add clock-names to the required list when multiple clocks are
> provided? Since it is not required, a device tree could specify multiple =
clocks
> without names, leaving the driver unable to reliably map the phandles to =
their
> respective internal functions.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510084303.12=
2426-1-phucduc.bui@gmail.com?part=3D1
