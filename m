Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6F628B4E2
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777456988; cv=none; b=RuTRpC7uW6Yhfj5US9M8Ln7X+raylJDdTPclVoqlgt9UP2h+BAH35OTrN/F/Wy9ZBxAQr89UDpv1PJvKwofwIBvEoxgLKEZ67D93+9P98ElGH01Mt39mIG87UIb7RSXLADw5HulGBCiKXs4Py9TnKPpwUNq5m7UTGXlC/RLy3c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777456988; c=relaxed/simple;
	bh=Nn0K43nvpoluFLl6ARYq8Tlw/SbTNjxDaYPa0VhNrN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TY/Tf4MeDI8OEHS6qYAPEcnHZhK15n9GttdAGX85JtJKwrfIafhg3hVo+MNgW3sQivEaZKxRlHtrQIPu1lRCCUoZaIXRzCza54Biz/OtB60Oq5UMVSJr6PfyomQHvpi3aU+/wMgec8pftVcqMVKpHR6r1gRaYChaI8kVGJvKf0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8ea8563c693so1143573985a.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777456986; x=1778061786;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=727TQd0c+qHkAEInnHUXDqUTv77oNJr8Ljf4nlxgtUQ=;
        b=DSE/knVWyCFG3VpRg+pj2fd8MOJHKrC/22dv2PSKnTYH6bGKiCnWgwrXn8WRS0hhNS
         NcVQm+nqoj71oaSa9gGRt6lw1FzpQ7VNU53tiUoS1/7r+ze/QrwR9fVqhSZJYk/CU0gU
         4K/0l1U7cwK01/ScgW+Voy3TB2N7FbiuM2oONpNz4lSIO746TnzUivVPd0rnUS0aEBb0
         3mg7ynne2DlNXNuCQOU8Ac67w/Q0Y1EhGiQUDQ6e5whvqw5oeL8jCPyhj8/NMTwkfJp9
         ok8KZ7c2Nhyy+SbSwBdC0cyLGdiIUWfke/Q3DJYw6ajlMd8HgceIPqbOmdliVvW7veqT
         P5VA==
X-Forwarded-Encrypted: i=1; AFNElJ/VX2I4IG1NkHZoJn2qYrDB3dGNrBFH1FtKL8/kEmkE9ycaaLIfMdlcfkvbOS9a7m2S4Ws5CO8tT1Ig@vger.kernel.org
X-Gm-Message-State: AOJu0YzbmPd+5XFWpvKzrEU3PPN4OPLB7dTRTpD1BVjq0DvAQEdnXeN5
	+U+HSAqQSbBTiYYHYrG3hmXDOORbuKoXj1s2Kew0r+OwzKNX15Ggyrgz71CVdiskRe0=
X-Gm-Gg: AeBDiesZsJgbqylUKM6BJXynBA5lKdkcVFCSdFIDsCwuAY5VvGpSqCg30IHoVdVbSau
	cubnCmve/SSWBVCuUuysjx7z955W/PplAiJP/IENO180wln0Qz1+5JdOx76cgzrKwBd/fujj/06
	6ychSS3iNmOXpmhGCJ+bPBIRZ07NvqEcpC/dMY6nQjYMr8uXtZECwFPaco+pqtVwbqtm/wgv0rb
	lu3y+1Wm/zqvrsRkvGviu/sE19T8GIO779+Ohk8bcfrLQVKjsc5sEs80NdFr0jkzpwTQfj1P4pW
	SuM2CvNKWruniL62He2Z/cNb7mWfKyprFdwNbFAQqwdzZVKUGYWRT91F+MczDgCejs4MhmRe8nC
	HecnnVKGNsulkEU4eQQ7QL7IFMv4PVewdo4RBHe0PcjR4u2a3ktE8rK9kQRp5PUiqYknSSrfIMl
	MrhApcgo3kZ9paPZB6hLWDSNSRaXRII5Ys8Tou7/6gSDQXgrSq137+9PvBPpW0bCMe/rN9CQ/CU
	0k=
X-Received: by 2002:a05:620a:c4a:b0:8ee:630e:350a with SMTP id af79cd13be357-8f8f6d54f33mr440303285a.58.1777456985434;
        Wed, 29 Apr 2026 03:03:05 -0700 (PDT)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f93f582e46sm131005885a.25.2026.04.29.03.03.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 03:03:05 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8f0a87e23daso772936285a.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:03:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/i82ameOcvadZYQ2+JOx98M8oKhOwGaVGJU/+KyenSE0OYxRY7pfKoym48bwcuLnPmoXBbMxILrNMI@vger.kernel.org
X-Received: by 2002:a05:6102:598e:b0:61a:c2e2:932e with SMTP id
 ada2fe7eead31-629272e37fbmr1942655137.22.1777456671431; Wed, 29 Apr 2026
 02:57:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 11:57:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzRoELGedrM3ELUjZr-N6DnF4TXtdQR_k74Xmfppu9fA@mail.gmail.com>
X-Gm-Features: AVHnY4IlsJzOGR_PMCF4iS-Uk9l-2ljuIGS7ZCYV7JbOA-5TFuOsoyAbIfAM7Nc
Message-ID: <CAMuHMdUzRoELGedrM3ELUjZr-N6DnF4TXtdQR_k74Xmfppu9fA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: display: renesas,du: Document Renesas
 R-Car R8A779MD M3Le
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

Thanks for your patch!

On Sun, 19 Apr 2026 at 21:37, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Extend the Renesas DU display bindings to support the Renesas R-Car
> R8A779MD M3Le SoC. This SoC is similar to R-Car R8A77965 M3-N SoC,
> except the HDMI port@1 is not present.

"and DU1 is unused." (whatever that may mean...)

>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -42,6 +42,7 @@ properties:
>        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
>        - renesas,du-r8a779g0 # for R-Car V4H compatible DU
>        - renesas,du-r8a779h0 # for R-Car V4M compatible DU
> +      - renesas,du-r8a779md # for R-Car M3Le compatible DU

I am not sure you need a new compatible value: is the DU really
different than on R-Car M3-N, or does it just lack some wiring? ...

>
>    reg:
>      maxItems: 1
> @@ -890,6 +891,75 @@ allOf:
>          - reset-names
>          - renesas,vsps
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a779md
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          items:
> +            - description: Functional clock for DU0
> +            - description: Functional clock for DU1

... E.g. you still have a module clock for DU1 (the documentation
for R-Car M3Le does not mention any changes in clocks).

> +            - description: Functional clock for DU3
> +            - description: DU_DOTCLKIN0 input clock
> +            - description: DU_DOTCLKIN1 input clock

... E.g. the package is documented to have pin DU_DOTCLKIN1.

> +            - description: DU_DOTCLKIN3 input clock
> +
> +        clock-names:
> +          minItems: 3
> +          items:
> +            - const: du.0
> +            - const: du.1
> +            - const: du.3
> +            - pattern: '^dclkin\.[013]$'
> +            - pattern: '^dclkin\.[013]$'
> +            - pattern: '^dclkin\.[013]$'
> +
> +        interrupts:
> +          minItems: 3
> +          maxItems: 3

... E.g. you still have an interrupt for DU1 (the documentation
for R-Car M3Le does not mention any changes in interrupts).

> +
> +        resets:
> +          minItems: 2
> +          maxItems: 2
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +            - const: du.3
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1: false

Perhaps port@1 can be present (and thus required), but left unconnected
instead?

> +            port@2:
> +              description: LVDS 0
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@2
> +
> +        renesas,cmms:
> +          minItems: 3
> +          maxItems: 3
> +
> +        renesas,vsps:
> +          minItems: 3
> +          maxItems: 3

Your arch/arm64/boot/dts/renesas/r8a779md.dtsi only has two entries
in renesas,cmms and renesas,vsps?

> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +        - renesas,vsps
> +
>  additionalProperties: false
>
>  examples:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
