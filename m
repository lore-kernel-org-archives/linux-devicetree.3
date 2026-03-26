Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8AF2DB789
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 15:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539276; cv=none; b=dDBTVB3ur/o1AyYHy5G7lmq28EdtUmnlGVhz5Dh1nfzarF1jwN8mRaWpOttIscoj/59Elal3adEwhLy6OYqRTjTFIpO79INmiuf/V/IFTtBItrbs6RX7HIXAkpe6C7VZwnvYnAeV6dT3HhnaoxSg4gOmXyH//N8l7Zp80PUFG68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539276; c=relaxed/simple;
	bh=peWwslY60X5deNxQgqJv7OYyoSx6v0JNvTUpeeVZ1q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q1qG6eyINCnOqmjrbV3hx3dp6aQ7P8GWZ14RL/oazW3dxLA5nvDscX/5CHMwB07XxTSd2KPgiqoukmclYAakkW0C1FkEDCNN2QQZNr0uSLUhHNXmgXWKTZZThb2gPxHNvW96bTytOieIRDVjH1dQGWV3sgyi6iQXki+vyORz5Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94de68feaf4so691139241.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 08:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539274; x=1775144074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICY5En3i4NzNQi5qrag5c9s0SZbURVLCotK2DvpExx4=;
        b=YWbgZwarmx45PTYhNW1ufPb+XVaEbq5YMT+G4mzs1QZWCBCxYueVP6BuVzck9RmWAj
         ymcvq+Y0P6yKmu95MC3NfTjt2VL1Ao3sXCeSnAzXlX9uvGDL7mwKpTd2E0fsqZD4C4sT
         sHYCxZBkd7MpQ+4PZPWA3oRAL2CRyQE6pQgZ1K6r4H4U/w2uk9TxaqqyRAtucTHp2pES
         bw0U80k67NJFXzXgDPZKWd4S7e1VOfsMhQNRG7qAE353lbYGpkIVxY3I1VCqeHh+i/IK
         hv+0iVjUZ0HFivsl3ud5fZDFgqFzkcNUM7TCQ3Z0/ovNnakSDIJMSPxGUqjiS1zgy/dR
         XOxA==
X-Forwarded-Encrypted: i=1; AJvYcCUmWxORk8MQOxs1S/7mwpoaDj3akcyVThx7icNAvEAzSW2IMpxuEYRHMTkyk9zs7Py2GmCL6IW8JeND@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqr6WkrD6pJgd4D7Pk54bF2ZINh+WyietVREl9lMNIaSjji7Ng
	sr05D827SPHBRg+MjOeyO4AUXCQoIapuFNsY2R8rM+JdCPm11M8V44K4gTEV1nKoO0s=
X-Gm-Gg: ATEYQzwWo5Dly2uTgBB0ng25JfvdxBTLiGr3gmJuyiRITFMwId4nCp8gqJM6QVePktv
	3wsx56TAiCJlnC2vPhRzREb4n85/ynCQUpeBszM1INlyM3zdmQbPQ16zLgVEVIe+7YI+Iwn6wx8
	7rgInrD2/N8clzfvEMQAWZxRQxaWT+HpFTwduH+U/xBiDmutQYmb5JnJ2CWcmoHkW00R596eEDj
	WA5+yw+oQGt673ep8N9xX2ohpqNGnc55dhxBcC3sdkbyXsIZ+WhBwiOkNuV/ObjjoxyDQ5DU2zC
	BreMjOVXaEQ2fqkv/yfZKawH9OJlJ2XLm9hweh8a2KrdeJZwwrl7Y+LO7F9+AjqY7lB2+jF11bc
	v5vqov/tuUw+54d6OeDWZxjyouiJVesid+By+qE8ouO1ZvrWhbeI7oXAfcRD+CTAdB88iId1Rxe
	fP+CUqZxHzNSHIgj+o9iIDMVQTMAq2aaf3h8MPZoE2WONkFYBmKLFAUXgKKnBLVaTP
X-Received: by 2002:a05:6102:3a0c:b0:5ee:a0e6:a9f4 with SMTP id ada2fe7eead31-603870ce0bcmr4281069137.12.1774539274043;
        Thu, 26 Mar 2026 08:34:34 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be1065ffsm4155962241.2.2026.03.26.08.34.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 08:34:33 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56ce44a204dso843373e0c.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 08:34:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDPKVak+pF4TKJjBj+ZzhPCCWLi/vY3QroGHrBV0YCWhsE8r5XAfOweNTAGnC7j9Fu6DmYQL2rj9L/@vger.kernel.org
X-Received: by 2002:a05:6102:5801:b0:5f5:2539:9b11 with SMTP id
 ada2fe7eead31-603870ce0f5mr4152226137.14.1774538871002; Thu, 26 Mar 2026
 08:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319155334.51278-1-john.madieu.xa@bp.renesas.com> <20260319155334.51278-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260319155334.51278-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 16:27:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVbP5Bbr9KuxoEb48zUvubT3CN7sC9oVat2NcNWaBwOtQ@mail.gmail.com>
X-Gm-Features: AQROBzCXM6uPDs6UcVr58TTtg0-_14CRbEgbIPerOfaOzDyxBM9HF9kuEp2hlRY
Message-ID: <CAMuHMdVbP5Bbr9KuxoEb48zUvubT3CN7sC9oVat2NcNWaBwOtQ@mail.gmail.com>
Subject: Re: [PATCH 04/22] dt-bindings: dma: renesas,rz-dmac: Document
 optional DMA ACK cell
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Thomas Gleixner <tglx@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	John Madieu <john.madieu@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Thu, 19 Mar 2026 at 16:55, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Some peripherals on RZ/V2H, RZ/V2N, and RZ/G3E SoCs require explicit
> ACK signal routing through the ICU. Document the optional second cell
> in the DMA specifier for specifying the ACK signal number.
>
> The first cell remains unchanged and specifies the encoded MID/RID and
> channel configuration. The optional second cell specifies the DMA ACK
> signal number for peripherals requiring level-based handshaking.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

Just a quick head-up, as I haven't read the actual secion in the
documentation yet.

> --- a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> @@ -63,17 +63,27 @@ properties:
>        - const: register
>
>    '#dma-cells':
> -    const: 1
> -    description:
> +    description: |
>        The cell specifies the encoded MID/RID or the REQ No values of
>        the DMAC port connected to the DMA client and the slave channel
>        configuration parameters.
> +      Use 1 cell for basic DMA configuration.
> +      Use 2 cells when DMA ACK signal routing through ICU is required
> +      (RZ/V2H, RZ/V2N, RZ/G3E audio peripherals such as SSIU, SPDIF, SRC, DVC).
> +
> +      First cell:
>        bits[0:9] - Specifies the MID/RID or the REQ No value
>        bit[10] - Specifies DMA request high enable (HIEN)
>        bit[11] - Specifies DMA request detection type (LVL)
>        bits[12:14] - Specifies DMAACK output mode (AM)
>        bit[15] - Specifies Transfer Mode (TM)
>
> +      Second cell (optional, when #dma-cells = <2>):
> +      bits[6:0] - DMA acknowledge signal number (from ICU ACK table),
> +                  where 0 is a valid signal number.
> +                  Required for peripherals using level-based DMA
> +                  handshaking (SSIU, SPDIF, RSPI, SCU, ADC, PDM).

How do you expect this to work? #dma-cells applies to all DMA consumers
of this provider, and these SoCs already have DMA users relying on
#dma-cells being one.
In addition, you cannot have optional cells: if #dma-cells is two,
then all consumers must supply two cells (of course we could switch
all of them to two cells at once).  However, as zero is a valid signal
number, we cannot use that as a dummy when no DMA acknowledge signal
number is needed (we could use e.g. 0xffffffff instead).

Is there any other way to provide this information?
E.g. could we have a table in the driver that contains this info for
the (presumably few) MID/RID values that need it?

> +
>    dma-channels:
>      const: 16
>
> @@ -212,6 +222,20 @@ allOf:
>          - renesas,icu
>          - resets
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g057-dmac
> +    then:
> +      properties:
> +        '#dma-cells':
> +          enum: [1, 2]
> +    else:
> +      properties:
> +        '#dma-cells':
> +          const: 1
> +
>    - if:
>        properties:
>          compatible:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
