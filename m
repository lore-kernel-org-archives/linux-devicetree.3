Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D793054E4
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958298; cv=none; b=opig4Dglee88QfT5xtlzIbLnVRjqtb01z2izSMQDzVg01WkVoisEz6Js8YRFvfCtyxOG+6gsFaTkbz919Kz05GN3AHO94UH9w/2GBKrzKb5+kXCdySqDyqlxN/D3eWWY6GbG4AKgCtL3M1AEKnvuviaW6l44W1NILRYJx1m4pKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958298; c=relaxed/simple;
	bh=SJLknyw1I7ZFIFDDTxB/kCFRzM1gjizB92r2iOvY5U4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXpDxkorUjR99iJbsNYFJ27SbjjmRh+S+zlAOcm/fWHolW+kYcSEWisPHT6VMQy8OqupmsUkZtZKAxD1IqyfrTDdMshCzSiZY+bMye/JMrXSZLDD4TuW3etXG1hefx6UGTOXfVMvBCZF5iSGzo759GjBWvcJu3x28BE/HSQMpw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-848761b5897so1538930b3a.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783958296; x=1784563096;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KSAbD3g9v/Qpert4xOPXdfLiWxHZNX0hf2rnp4eCCEU=;
        b=Hjv1Td6GRjbDO/+tRCA50cMTIi0DeylNORZPAmMQ4YXXlWwnksm+YSGmd8lw6ahsHh
         rRToNyjQfMaFq6JA0PMQku1iAvnt5dg7fExWihPmtXqjIO0iaFQGsJUXye/25EmpwQqa
         eZ3SNCxX75NqfG9vFxa1LnlKj/HL/dppf0YveOUYli9aXG6ikJAWgyZn/cLo72WK8kM6
         7Kq8HnwifBDVgnW1hsa7EWnbe+eScpc1aTBk6iV7gwfgJ2xgfGwl2N4BQASNg5NO7REz
         cSCVTEhuTBdjChqH21qTYE0/Shwmvuuh/JiqAyWQaANlIswvNfnMelo9fcOINvFevPuv
         CxHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrK7wJfMnkj2P9OVAmZjKycazjkEiRY4kE6tyWxaC2urMwQG9VO0MUbM9iwYNYGHlq/xEvrKSI/fpK2@vger.kernel.org
X-Gm-Message-State: AOJu0YxHp/l3tDMTz0d+yVt9cUAQGuXmK/6lmPvRbyefKO8YCd5DvFn/
	xaY4YyfrCRdt8/RsPWycJY/MViFWKKwyD+pN3lJwG8HhYclhBfTUIbZ5r6TE+0+GS5I=
X-Gm-Gg: AfdE7cnyxCI875bkoQnoZdsuopBzGwHBg5Qe4uz/oW/cM4r9DsIvur/UQKMtMxHGDYk
	i+xvqk6Pd8QkLJZrFVW9FlDp0Ozz6iJytyFqxruDH2WJ3ziKRma2vs8C0FLbO46WigmfL7cupmh
	GwbmloR8Kb0PrcsP150n9JR+u4fEJNmQuA5ElHYMSQURuVC4QoXxQ1JzTY6l0577lQo2KiU7Qbv
	PhT6euCf7RWf/uInTW7MbUeBAaVQHXB+VP4RSWwwlG9/RxkZmqRKHlYnY44/C8pZTSqYdURLfEf
	2GnPrxVgQ9txwZWuFkdXhFW5FH9lzdoSfhqBhjmjNeMPUNsAoJRd773BHsEI7quWQf7byv6hXEG
	ozROywC/BqyRJo+wqKW1+lYmFMsdYp5ndl2+0f03BSvkpmN+T+xTOqsTNfDb3HPL6p6GtvuRQQH
	TNNBlz1kXIVN8Mtf4eaVJWv8/g73fCtHwkJ9axpa+hK+aC4Yv+pQIWqEj6RY6HIvztTokCY9pfG
	kk=
X-Received: by 2002:a05:6a00:228f:b0:848:417a:d1a6 with SMTP id d2e1a72fcca58-84889637625mr8445946b3a.15.1783958296263;
        Mon, 13 Jul 2026 08:58:16 -0700 (PDT)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com. [209.85.210.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f81a5absm54374b3a.54.2026.07.13.08.58.15
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 08:58:15 -0700 (PDT)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-848595b338cso3849872b3a.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:58:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq+YeQmdhrvEJOi7XDS0s8AW37XQpgnlEP9ooZsg+4HnFUHBdkH2I95OoaRoGiJhawR+RWpNktivMsQ@vger.kernel.org
X-Received: by 2002:a05:6102:5605:b0:737:bfe6:3b03 with SMTP id
 ada2fe7eead31-74533bc9032mr5400397137.7.1783957799562; Mon, 13 Jul 2026
 08:49:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260702123112.161160-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260702123112.161160-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 17:49:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU62updtKeBBk-vO3YP+qaWTGqHQnzKvFJbrz4J5eEPMQ@mail.gmail.com>
X-Gm-Features: AUfX_mzILeHyjNiTkrmAQtVDJZX8rJj_P5qd9dfYE_6VlS_CSrZ4h4vly_PscUA
Message-ID: <CAMuHMdU62updtKeBBk-vO3YP+qaWTGqHQnzKvFJbrz4J5eEPMQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/9] dt-bindings: clock: renesas,cpg-mssr: Support
 RZ/T2H system controllers
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/T2H and RZ/N2H SoCs features system controller blocks for low-power
> management and access control that reside within the CPG/MSSR address
> space. To properly represent these hardware modules, allow them to be
> defined as child nodes of the CPG/MSSR controller.
>
> Update the CPG/MSSR binding to support child nodes by adding
> system-controller child nodes using a patternProperty, requiring a reg
> property and a renesas,sys-block property to identify the controller
> instance.
>
> Restrict these new properties to the RZ/T2H and RZ/N2H SoCs to ensure
> existing bindings for other Renesas SoCs remain unaffected.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Updated commit message.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> @@ -99,6 +99,41 @@ properties:
>        the datasheet.
>      const: 1
>
> +  '#address-cells':
> +    description:
> +      Required for the RZ/T2H SoC to define the address space for child
> +      system-controller nodes.
> +    const: 2
> +
> +  '#size-cells':
> +    description:
> +      Required for the RZ/T2H SoC to define the size of the register
> +      blocks for child system-controller nodes.
> +    const: 2
> +
> +  ranges:
> +    description:
> +      Required for the RZ/T2H SoC to provide 1:1 address translation
> +      from the child system-controller nodes to the CPU address space.
> +
> +patternProperties:
> +  "^system-controller@[0-9a-f]+$":
> +    type: object
> +    description:
> +      System controller child nodes representing sub-blocks for
> +      Low Power Management (LPM) and Access Control.

According to the documentation for the PRCi bit in Section 11.3.1
("PRCRN : Non_Safety Area Protect Register"), the low power consumption
bits are in the xx28_xxxx blocks?

> +    properties:
> +      reg:
> +        maxItems: 1
> +      renesas,sys-block:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Index of the system controller instance.
> +        enum: [0, 1]

I am not so fond of such "index" properties.
And of subnodes ;-)

> +    required:
> +      - reg
> +      - renesas,sys-block
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg
> @@ -126,6 +161,10 @@ allOf:
>        properties:
>          reg:
>            maxItems: 1
> +        '#address-cells': false
> +        '#size-cells': false
> +      patternProperties:
> +        "^system-controller@[0-9a-f]+$": false
>    - if:
>        not:
>          properties:

As RZ/T2H and RZ/N2H are rather different than the other (mostly
R-Car) variants, perhaps it makes sense to spin them off to a separate
bindings document?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
