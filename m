Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03621311942
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 07:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778829688; cv=none; b=J8DdBTcW2mW7rVxy/Zxx061snWTDEbpp0NWhlWhArQgQZYm91hC9QOIu+BnhKsrfvTxkmr4qe/LNWbSbfA0ZlUgkAfflnr6DaERwqOfjOe9TZvcaBsl0nI3T2h2HlR148v5cdm0DtY/TEbtKHvD6103Mhl4WMQHNL9PjEZb/3V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778829688; c=relaxed/simple;
	bh=1Z6uBZlhnZq7taSXC0j0P3oH5QjAyYZAvNpzObSnE74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kaf2/NtoJ6kUOdu/a4BE4E8dRk3HZO+FwLhfIm1IQfsO0btvh17ZMwOdAXWGT9cBxjZVNel6XgcAUgOuol2C1eM0FJ8VPu6bcdIIRc2OD2pFNXhe0/D1Qk8oNkYvSwazkIr6u/luJMgQBzJ9mqSHQZ/oTYoJruWwpr7bMNgsy78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-575171b1ce7so2731684e0c.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 00:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778829686; x=1779434486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsqCLGSjjl19J/y6UJmHSf9ZNpy83CGHFVvq1De6XEE=;
        b=Dg82SvrTEaxaA+QQULjoFEM9JY1jiO9hshdCg3pZ7IoRUbcmSQRYMBXU77WDyWSDA5
         +D9XQHlLVQUDWzEE1Yv6gh19OIjJfSzd6kY0ba+Y2nxUDqvKavuCyzbCAjZ6hXxMRzik
         bMEfWdTf47yHjUYO5Mnu9kCfBgvRWVXzuZsPKrOxZ5qLc/E4dSkv5eJ7XjY7xx6DplxD
         SSrB8JIQ/K8R3ZaWYgW2pk6liem60EdldSCTOmvc+S7UYURBX8vxu83rm+BnYF3KPce7
         QH3SvQOTy/PbWSnO9AIUHs+diHWH09D+iaBRHelvByt6LhZWefWGr3ZnbCO+cCc08fhS
         bY2g==
X-Forwarded-Encrypted: i=1; AFNElJ8A3NYbdt6YOuJNdOboX7xf1CTSNxLxEiU1AUWaU7f0dbwDFIDs4IIDMMd5fZjNmAYyyMdHSGIecPNK@vger.kernel.org
X-Gm-Message-State: AOJu0YyFZMnfRd/sUqjAQ61HQ0KDWofH3E0KAK1pDYyL8SpDm7/pDXOd
	eMntYN4eYsy1cJDwpFGTACBGjzXToz8wuVckKEPdQMRiH8ZWTi9gWt7QoncucB72
X-Gm-Gg: Acq92OGtPRvS0GUaN9889dC0nA24qxYz9/VBAZTp9cJNTHk3SMT85pl9BtQk8nEnHjC
	lYdA8H48DHtPFwidFbqpzQPeBxMasn3fea2IccpcUb+l5V4Bsc3sh13JI0EBBMACuJYzrrjPxTW
	UfyvNn7Cl8em8zylE4CnssFvO3mkQ0xPeLcb0Ry7sti25QpLil9/YxR+/HEGFTkEg7Y/GZu7lSR
	GLQCKIpeS9K98rUST+EnNMf19FCkmCUAz/M4MHAU+gQVKZZo9OtE3QnTgL5olmwPrNlHHTSAKWr
	6ANDrpVQ/S7aPQDYMEuerdMp0RMfiZu61DCQmSTX8nr8un2QID+b+oSM73CSa8vAqoQYGZDlbMo
	qw0tiYpY1AEhidUv7aDFG1mi5qWuV/uFgFde2M5GK3oUtCCbNl5pw+4ultf2do35R4/txnUz9wj
	PEtPqrGsLHTH7KwYYYe1PktdDwQtj99BS34DV7HE/dX5Ag6c8OS7KoPtCGGFFGHtz0Az0iypE=
X-Received: by 2002:a05:6122:338f:b0:56e:e68e:9fc2 with SMTP id 71dfb90a1353d-5760c013b50mr1623563e0c.10.1778829685877;
        Fri, 15 May 2026 00:21:25 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760f588bb2sm870440e0c.4.2026.05.15.00.21.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 00:21:25 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-63130466364so2795276137.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 00:21:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9JfhlNkZNUZx6DiEOhwVT67Dc0Z8YoNxo5pP17VmQLf1tNsa1Y5LinJbMRAH5fXDw0PJnZ25jB8vNp@vger.kernel.org
X-Received: by 2002:a05:6102:3f4b:b0:610:5b9:dde6 with SMTP id
 ada2fe7eead31-63a3cc0dff9mr1395107137.6.1778829684971; Fri, 15 May 2026
 00:21:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-2-phucduc.bui@gmail.com>
 <20260511204528.14632C2BCB0@smtp.kernel.org> <CAABR9nEhOTz1-0NmCMTbz=-+782Pto0yovSQhBXrXqhLwMg80Q@mail.gmail.com>
 <20260514151718.GA505743-robh@kernel.org>
In-Reply-To: <20260514151718.GA505743-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 09:21:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVp5qR39rxm1GnTx5voXfrRWy85E9ROqH6yFLXhBXDkA@mail.gmail.com>
X-Gm-Features: AVHnY4IaZwUjjboAa9w44wegGYbg_GnY787WQJ9d-0SLnG7aDexsYLaX24GohaQ
Message-ID: <CAMuHMdXVp5qR39rxm1GnTx5voXfrRWy85E9ROqH6yFLXhBXDkA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Rob Herring <robh@kernel.org>
Cc: Bui Duc Phuc <phucduc.bui@gmail.com>, sashiko@lists.linux.dev, 
	devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Thu, 14 May 2026 at 17:17, Rob Herring <robh@kernel.org> wrote:
> On Tue, May 12, 2026 at 01:42:06PM +0700, Bui Duc Phuc wrote:
> > Based on the Sashiko AI review, I am thinking of adding the following
> > constraints specifically for renesas,fsi2-r8a7740 to address the
> > reported issues.
> >
> > I think this may also help balance both Geert's and Krzysztof's
> > comments from the previous v2 review.
> >
> > Does this approach look reasonable to you?
> >
> > ---------------------------------------------
> >
> > -allOf:
> > -  - $ref: dai-common.yaml#
> > -
> >  properties:
> >    $nodename:
> >      pattern: "^sound@.*"
> > @@ -94,6 +91,78 @@ required:
> >
> >  unevaluatedProperties: false
> >
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,fsi2-r8a7740
> > +    then:
> > +      properties:
> > +        clock-names:
> > +          oneOf:
> > +            - items: # FSIA & FSIB is slave
> > +                - const: fck
> > +                - const: spu
> > +            - items: # FSIA slave & FSIB master use internal clock
> > +                - const: fck
> > +                - const: spu
> > +                - const: ickb
> > +                - const: divb
> > +            - items: # FSIA slave & FSIB master use external clock
> > +                - const: fck
> > +                - const: spu
> > +                - const: ickb
> > +                - const: xckb
> > +            - items: # FSIB slave & FSIA master use internal clock
> > +                - const: fck
> > +                - const: spu
> > +                - const: icka
> > +                - const: diva
> > +            - items: # FSIB slave & FSIA master use external clock
> > +                - const: fck
> > +                - const: spu
> > +                - const: icka
> > +                - const: xcka
> > +            - items: # FSIA master ex-clk  & FSIB master ex-clk
> > +                - const: fck
> > +                - const: spu
> > +                - const: icka
> > +                - const: xcka
> > +                - const: ickb
> > +                - const: xckb
> > +            - items: # FSIA master in-xlk  & FSIB master in-clk
> > +                - const: fck
> > +                - const: spu
> > +                - const: icka
> > +                - const: diva
> > +                - const: ickb
> > +                - const: divb
> > +            - items: # FSIA master in-clk  & FSIB master ex-clk
> > +                - const: fck
> > +                - const: spu
> > +                - const: icka
> > +                - const: diva
> > +                - const: ickb
> > +                - const: xckb
> > +            - items: # FSIA master ex-clk  & FSIB master in-clk
> > +                - const: fck
> > +                - const: spu
> > +                - const: icka
> > +                - const: xcka
> > +                - const: ickb
> > +                - const: divb
> > +            - items: # FSIA & FSIB  full clock support
> > +                - const: fck
> > +                - const: spu
> > +                - const: icka
> > +                - const: xcka
> > +                - const: diva
> > +                - const: ickb
> > +                - const: xckb
> > +                - const: divb
>
> Between this and just giving up on enforcing an order, I pick the
> latter.

The important part is that "fck" must be first, and that the others must
be unique.  Isn't there a way to express that?

    minItems: 2
    maxItems: 8
    uniqueItems: true
    items:
      - const: fck
      - enum: [ spu, icka, ickb, diva, divb, xcka, xckb ]

or does the single enum line only work if it's the sole item, and
do we need 7 copies here?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
