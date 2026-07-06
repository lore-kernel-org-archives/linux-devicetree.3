Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A5F3FC5B5
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333196; cv=pass; b=m8/3bmgnGD0yihFUl2o+xhcdQm3ewPZ4J2l3XNZm3B+xgTjrNzA40WkEvx4Q05jGWXCgY+Hqxw7d7gYw2bPfiAx17JzeptDD/U/PjieBNUzy4WGZ5aKEashP7KZ4Tn3uIj0XRC8/RDa2WiMvPdb2DhU6t6Ajtb7DHCgO0GxZL2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333196; c=relaxed/simple;
	bh=PJQ5UmcsxmykSC0BE/ND2jQEE712lBcMOooWOb3phaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IHW73/90Ir8WUHIrcpABlg6cmwdfW5TavmG2QF284py+yG3bX4Yg7is8B5KmAtp69cAMkGDi0OjpVMkYdA4aZ/pvrGi+H38Ic8VO0dnkap6DV96fShujFqIBVpfLoy1Hhd6BhqIjFGw5AtLjIALFUSUxkJJuUJVwE0GSDttw9O0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGO8L3cI; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGO8L3cI"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c1274bedebfso307404266b.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:19:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783333193; cv=none;
        d=google.com; s=arc-20260327;
        b=NSukYYIPbac8mFlmfE4+4j8prTaVGawHkvhXOcLej5aV+tfm8bufSwwkyrppc4P6Ti
         SycvQ/HaWHDIGFDqnbKEYPX5saGD+XlCFZd+AvmSW0XTw83m7yDblJYs9tjwsfFgJRCU
         R3wq8Qiy9VTzil8GE/L8bQwmyhqi8Bg1j4K180KXf8m19j7Emb/UHeeGIIjexWYClmnc
         VkqMBCaOIv+T4im2p5AcxVy7Mdpfe3T6P/azVJOBl8Myf5R+zdlwtFFtNJKOM6th3EdA
         OQycWw30Hof1Rb+h007PLvf5GHcdfoS1xeBtJkvyGXG0wYRsODlVBSlFKbQFYyI6Sxgq
         dmWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fm0Kcy2K0oJ4B8QIP06f/MQz75S5ZTjRepITBSZjIOk=;
        fh=kun/sD6gsGy7zeRXQ/KSn4NGAjmugPj9S25nnXWUtO4=;
        b=ASXrUbCqY0MSmnBQMYM1OfOAz2gzBFg9airjYkwAj0l/fkGqr9b19vX/TYFoi3ORan
         iIbKYefPZbxN3O9Tk3fWFE9mHK6DFNP943mJp5fZqyKv4OxK7uu06/CDaGVlF9mPE1vP
         UzSirGsa0GDV+s0yPfFu8HlauO2FVlCWCuWUt1tpF9K8VWID9lDggXu3wvjk4/7/GaI/
         QHYDC9gSHJ6hpnXRxobycVYzh9rfBFaqWsq/YYOE30pzVED4bp/IkJzNtkVe5Kt27j2L
         1dhHWH//DrGo8aOT9nmm2tOp2DkrU6xEd5ixqxznUfkx58/trFIhv3QtJ1kO9zDmED8Q
         65eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783333193; x=1783937993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fm0Kcy2K0oJ4B8QIP06f/MQz75S5ZTjRepITBSZjIOk=;
        b=dGO8L3cICw2aP2ydqFy4Y/zHs+YJbypPEvzntRC+gJS3qJKY9p8flEoOUoGfLE6e99
         Dmlhx/AS/48AOMV3quBMD10S46r50YwGlvbqSxjH9J1IqdYOn4Lirx1tzxmJnMxpSYqJ
         QfXLgo617pnQAsxaMsRvI8PKxmnaUxo5g7yTF0KHqzWIR+53GDmMK8wmh4CrWzN96bkU
         iTWuahgcLiEi7PfomlvQVlYPqon+/th/nBP8frI9Htn+V8ucnwQy5/aa4F6hvofGOkzj
         jioTgUBvGxgXb505S0U0V8lFAAN5lKcqykRmzQFLTDQtN80ELXwfWW3k90c7/YRcKjE+
         6x2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333193; x=1783937993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fm0Kcy2K0oJ4B8QIP06f/MQz75S5ZTjRepITBSZjIOk=;
        b=WNS+o8T6GQnqjZmY6mP4Zd2U7wQVK4ZEUuHBuM528dzpvgdvhDQTB0IDCjg3QZcQ9y
         jGd/p1E/OUcroZd3OCMp6tAcdXqvDGX0sYUPmty0FlJ7GNy/G5/zDGqrPD9/npY5BkQK
         RNV7cY8swHwvt6XhYFdiPpv+edZSD7CNBmpzs3lgsbgEfG6Nw1TiNKRW1nNM4bgy7Y2O
         cEbK54eJbMSi4DwwLhBUeUPyfgWxlqyQcripEOidWVF+/SvN9uOpXp857bBOQARVWIYM
         MQMdGnFidiuoHFElV7sImPam46LsE6v3pL4wJqvwFfDIuEV5qqOXO2z81RjyEUtYxicW
         rsoA==
X-Forwarded-Encrypted: i=1; AHgh+RqVybjJqxrdoWlcI+xaV3xbHBBMvvwNMbFmubs2fB1ewUiVElHaXXuuG7Xj3cPxaEh7c6KK6Kcwusf7@vger.kernel.org
X-Gm-Message-State: AOJu0YwjYfbpox+DNKfWg+yt0QOiO5vDI/uGWNjP5aXAvhqmO8xOjY7+
	zStOfsfDT/tkjslGDsG62vLLZ/qBew6geNFgUF0NqRnDbqq4np3Lqs42U/L6h9DgDqROcYw51le
	SPNnsLR2wLMfJyeLcIeQin0ZDCMqx+oU=
X-Gm-Gg: AfdE7ckUBWcLUZbQSI0CF49/2dtuvZ38cicUb3FHykVHlLok4fZ1fds/VjmHbHlQ/GN
	BX5sXeq1hPyGxhPXr74/5G0Olz6fdWyAuDq2DOyz7GRNWiE3Hm3gjwk3tkB3g+Vn1y8U6yBXfEV
	yyjZBkMW1FFZJSJCkRhGa4joxMwugP5SSMxFrWkwRlEmvNYl/0xm8qk68ok7GetGztBGP9V7gpx
	ye9rhzYp6OG6o1lQVWMVFinFzMRpLBcopX4CJgFwlvX3jCCL983JNZLHPhBTp2OFaCh94KkOPI=
X-Received: by 2002:a17:907:86a3:b0:bfd:6cf6:1952 with SMTP id
 a640c23a62f3a-c12e6a9daf1mr386845966b.28.1783333192619; Mon, 06 Jul 2026
 03:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
 <20260622155610.184271-2-biju.das.jz@bp.renesas.com> <20260622160548.04F5B1F000E9@smtp.kernel.org>
In-Reply-To: <20260622160548.04F5B1F000E9@smtp.kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 6 Jul 2026 11:19:40 +0100
X-Gm-Features: AVVi8Cf2Rtt9_ieWlUPGWmUBXQw2-mmoGRLmFkbx6A0nrEKzRFYI9JCxTbEcgQY
Message-ID: <CADT+UeD6x7KN-zd-22r7aeAbYzcRqot_0TSDHuZTOtPzx39hkA@mail.gmail.com>
Subject: Re: [PATCH v18 01/12] dt-bindings: mmc: renesas,sdhi: Document RZ/G3L
 (r9a08g046) SoC
To: sashiko-reviews@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,


On Mon, Jun 22, 2026 at 5:05=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Relaxing the global `maxItems` for `resets` and `reset-names` =
from 1 to 3 removes the strict constraint for legacy controllers, allowing =
them to incorrectly define up to 3 resets.
> --
>
> commit 5bd955e3c9833c72a7847cd9926c293d95e5c927
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
>
> Document the RZ/G3L (r9a08g046) SDHI controller. The RZ/G3L SDHI
> controller is similar to RZ/G2L but has five clocks (core, clkh,
> cd, aclk, aclkm) and three resets (rst, axim, axis), so update the
> clocks/clock-names maximum to 5 and resets/reset-names maximum to 3.
> It has an internal divider for all modes except HS400, and a 2048-bit
> divider compared to 512 on others.
>
> > diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/=
Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > @@ -116,7 +117,12 @@ properties:
> >      maxItems: 1
> >
> >    resets:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  reset-names:
> > +    minItems: 1
> > +    maxItems: 3
>
> [ ... ]
>
> > @@ -155,60 +161,101 @@ allOf:
> [ ... ]
> > +        else:
> > +          if:
> > +            properties:
> > +              compatible:
> > +                contains:
> > +                  enum:
> > +                    - renesas,rcar-gen2-sdhi
> > +                    - renesas,rcar-gen3-sdhi
> > +                    - renesas,rcar-gen4-sdhi
> > +          then:
> > +            properties:
> > +              clocks:
> > +                minItems: 1
> > +                maxItems: 3
> > +              clock-names:
> > +                minItems: 1
> > +                uniqueItems: true
> > +                items:
> > +                  - const: core
> > +                  - enum: [ clkh, cd ]
> > +                  - const: cd
> > +          else:
> > +            properties:
> > +              clocks:
> > +                minItems: 1
> > +                maxItems: 2
> > +              clock-names:
> > +                minItems: 1
> > +                items:
> > +                  - const: core
> > +                  - const: cd
>
> [Severity: Medium]
> Since the top-level resets and reset-names maxItems were increased to 3, =
do
> the conditional branches for R-Car Gen2/3/4 and the subsequent fallback b=
ranch
> need to explicitly constrain resets and reset-names back to maxItems: 1?
>
> Without overriding the top-level relaxation here, it appears legacy contr=
ollers
> are now permitted to incorrectly define up to 3 resets.


OK, will add the below blocks for non RZ/G3L SoCs.

--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -196,6 +196,11 @@ allOf:
           - resets
           - reset-names
       else:
+        properties:
+          resets:
+            maxItems: 1
+          reset-names:
+            maxItems: 1

Cheers,
Biju
