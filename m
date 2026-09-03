Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAA0493654
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 11:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435886; cv=none; b=gyKdvp6c9wKV5AeWl2KcaapFOUbK/gQ9tc51qv1ORypQjJL7Aq8WUE0CfGnqM6hf+Sc9J1bxhLPXnumU3K9Pq2X2ZKKz231D5HT6oeHZpHVGxLcM6PAdzkRGnTx403nVV8j7DWPT1k6SQGCgnjcsgcgltS8zeBUbw9G7TDkrVyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435886; c=relaxed/simple;
	bh=AZtEdIaPPbhD4/A0ZGd8Qn9yHBYIYPtzbMktiQmSNLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLfvYbHZlT+gy/E9jnY7S/rmL7V0oLj7WH0rQkvXF+Ae8+cMLXSz1WPah8jFBWvAhGXkOvk/2EVPfR5Tour3GkqrLKSsqcbOCvRAf2X4axnfeGg0wR+ok5+1EgjzadCgje5uPYB+RtHFxuRLS7XpVfotpmenQaQz4X9mkgiMjqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c5f23666d0so1930129e0c.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 04:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788435874; x=1789040674;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8/u6qCvNI1eNvTKcm5+U1ybbBEt77cvtW8ZuFisi1PM=;
        b=JpsHXAMWAHvrfcywPJxcSRXY6xaorfBg9gqB9VL/KH4hcTq/KtygAuLt6bR62axumv
         bVOo21lRBXfyIL4d1i+vxjnPu/Ux9PLwZbn10xbD+FConUxwePzx1LQoDRA0byoIXDXM
         ulDiAI+u2G3HbwcWc4gSe/WipscZmYdbAos5sPjxOxxE/jjGxq1ZvLxENgp3rpime9iz
         AsmK4AGvxfU27XuNdSLsL6TX/wH0joMALE81ab22MdaP2BjmOJGAkbPyPvKkqIM6R/Qh
         y0g3X6SPc1MzjZb5GMHmftPjlI9Y629+1XSEKdtPIEcyRFcRJq8nNq5yZRrnVEHr6PMf
         X1IA==
X-Forwarded-Encrypted: i=1; AKwUvBzvFinXzacg528o+WhtzcS295ULh6UxQRK8WlbfXxSrOEPIN1B3Z8rWBWwg4LjhCzfJMnMpqwXGWYEQ@vger.kernel.org
X-Gm-Message-State: AFuF++mmyThroEMwfBJTOkAyUi3LVdh+YAiaj+QnzgZnIkdZRjXkthGp
	9zTKiTZ85sE4slV8jfFcXg73oP2KYLIqE0Qg/9hfFsiNTieep+AgolI9n1C9h+Jr23k=
X-Gm-Gg: AYBFou0TQ37mITcFBiVrVu2vJlnSY0hb0Ww2swTvMpRu97kyi945ZoD4AaG3VX0aCBX
	eXL+nwn0r83r1BcSQHQHinJLkTgq2sENja3NwiNjkeO9v0IC5OE22Qwn8m8FslakWFxB3R/Jhgr
	O3QC62ipjnksIJULI8H/qEIKcXa+2v7UHpilXd7dwqkyXpjxobalkkVLzagRpLevFb4ayrrlNQ0
	BnZpJQGhNJaCgRuSTgRuTy3fQ3vd9R07jnJe+Uin4Qwpl8IRi+8irs9yCiYrxQ4bf6U9NWf5ISY
	GBAyOJZ5Xbtz7Bd48nE8FALgI1YuIMfrweKgvBIxbtst2QFTbeXxlq32FXlIJMvzKV8+yWoA/kb
	+2NXfEcuNOMmhthhi6ZsZv3LfcVn5WyfTghJ44xKtqlUSZS4LwD6z0BelS3foK0uFtahFwrXwYH
	Lo/gj5O3WFfRZqt7nR6CmGgnDGeXuC1zTtmr/bNKrQtwyzjc3X6WnGTNuPGDnMw3uMnkNzPpsOc
	IlOIU+bTXGlFA5+x7D071gAWwZ2du02rX6vYgt3
X-Received: by 2002:a05:6122:3701:b0:5c6:731e:3c8a with SMTP id 71dfb90a1353d-5c7d2489256mr5762210e0c.1.1788435874304;
        Thu, 03 Sep 2026 04:44:34 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd78ce22sm4134648e0c.8.2026.09.03.04.44.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:44:33 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c652293bcdso2393787e0c.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 04:44:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzpSumWbUe/CA3TT4i8+ZrFPcipnwjcld32PJYOR3dnfDLb6xYknl85PjHHBOEXcNTaQg0ZMSOlrNwJ@vger.kernel.org
X-Received: by 2002:a05:6123:2c5:b0:5c7:a844:48a with SMTP id
 71dfb90a1353d-5c7d2801fd4mr5329323e0c.8.1788435872300; Thu, 03 Sep 2026
 04:44:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828122113.1426778-1-tommaso.merciai.xr@bp.renesas.com>
 <20260828122113.1426778-2-tommaso.merciai.xr@bp.renesas.com>
 <20260902-heavenly-ambrosial-trogon-b7ab03@quoll> <apgsOubuGuvw_0rf@tom-desktop>
 <CAMuHMdU0y5Dg9tW7fAM3QQHKpAw_+vmjj7v-XeZmrushQgQFAA@mail.gmail.com> <aplTgBjpPX9d6XEh@tom-desktop>
In-Reply-To: <aplTgBjpPX9d6XEh@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 13:44:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcHN9ndLyNCpinRDZpeX-qRQhfiL=Qxxh6gJhp9pURaQ@mail.gmail.com>
X-Gm-Features: AcwNN1XZ3OM_lakDx5H4wW1FhegMnSx1x5XdKbO9842TU5e3GqmmMjZwi3rTP4Y
Message-ID: <CAMuHMdWcHN9ndLyNCpinRDZpeX-qRQhfiL=Qxxh6gJhp9pURaQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G3E SoC
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Thu, 3 Sept 2026 at 13:01, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Sep 02, 2026 at 04:20:51PM +0200, Geert Uytterhoeven wrote:
> > On Wed, 2 Sept 2026 at 16:03, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > On Wed, Sep 02, 2026 at 08:37:06AM +0200, Krzysztof Kozlowski wrote:
> > > > On Fri, Aug 28, 2026 at 02:21:04PM +0200, Tommaso Merciai wrote:
> > > > > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> > > > > Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> > > > > Processor (VSPD), and Display Unit (DU).
> > > > >
> > > > >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> > > > >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > > > >
> > > > > Add new SoC-specific compatible string 'renesas,r9a09g047-du'.
> > > > >
> > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >
> > > > > --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > > > @@ -21,6 +21,7 @@ properties:
> > > > >            - renesas,r9a07g043u-du # RZ/G2UL
> > > > >            - renesas,r9a07g044-du # RZ/G2{L,LC}
> > > > >            - renesas,r9a08g046-du # RZ/G3L
> > > > > +          - renesas,r9a09g047-du # RZ/G3E
> > > > >            - renesas,r9a09g057-du # RZ/V2H(P)
> > > > >            - renesas,r9a09g077-du # RZ/T2H
> > > > >        - items:
> > > > > @@ -35,25 +36,51 @@ properties:
> > > > >            - const: renesas,r9a09g077-du # RZ/T2H fallback
> > > > >
> > > > >    reg:
> > > > > -    maxItems: 1
> > > > > +    minItems: 1
> > > > > +    maxItems: 2
> > > > > +
> > > > > +  reg-names:
> > > > > +    items:
> > > > > +      - const: du.0
> > > > > +      - const: du.1
> > > >
> > > > du is the name of the device, thus calling items "0" and "1" is pretty
> > > > pointless - indices already define that. Please drop the reg-names.
> > >
> > > Will drop this in v8.
> > >
> > > > >    interrupts:
> > > > > -    maxItems: 1
> > > > > +    minItems: 1
> > > > > +    maxItems: 2
> > > > > +
> > > > > +  interrupt-names:
> > > > > +    items:
> > > > > +      - const: du.0
> > > > > +      - const: du.1
> > > >
> > > > Same here
> > >
> > > Same, thanks.
> > >
> > > > >    clocks:
> > > > > +    minItems: 3
> > > > >      items:
> > > > >        - description: Main clock
> > > > >        - description: Register access clock
> > > > >        - description: Video clock
> > > > > +      - description: Main clock for DU1
> > > > > +      - description: Register access clock for DU1
> > > > > +      - description: Video clock for DU1
> > > > >
> > > > >    clock-names:
> > > > > +    minItems: 3
> > > > >      items:
> > > > >        - const: aclk
> > > > >        - const: pclk
> > > > >        - const: vclk
> > > > > +      - const: aclk1
> > > > > +      - const: pclk1
> > > > > +      - const: vclk1
> > > > >
> > > > >    resets:
> > > > > -    maxItems: 1
> > > > > +    minItems: 1
> > > > > +    maxItems: 2
> > > > > +
> > > > > +  reset-names:
> > > > > +    items:
> > > > > +      - const: resetn
> > > > > +      - const: resetn1
> > > >
> > > > Drop reset-names
> > >
> > > For reset-names, I got the the following comment from Philipp in v7 [1].
> > >
> > > Dropping reset-names would force the driver back to an index-based
> > > lookup, which is what that comment explicitly asked me to avoid.
> > >
> > > [1] https://lore.kernel.org/all/8382e2b9fd07fb1132c26e228b3899336fc1fdd4.camel@pengutronix.de/
> > >
> > > Philipp, Krzysztof, could you agree on which way you'd prefer?
> > > I'll follow whatever you decide.
> >
> > Until we get a variant with a third interrupt (or reset or reg),
> > which is not related to the number of channels...
>
> Just to make sure I follow: are you referring to variants like R-Car H3
> and M3-N, where the position in the array no longer matches the channel
> index? From renesas,du.yaml:

Not directly, as these don't have any non-"du.X" resets and clocks.
But yes, these cases are similar.

> [renesas,du-r8a7795: 4 channels, two resets] [1]
>   reset-names:
>     items:
>       - const: du.0
>       - const: du.2
>
> [renesas,du-r8a77965: 3 channels, du.2 (channel 2) does not exist] [2]
>   clock-names:
>     items:
>       - const: du.0
>       - const: du.1
>       - const: du.3
>   reset-names:
>     items:
>       - const: du.0
>       - const: du.3
>
> If so, I agree: the names are what makes these unambiguous, and an
> index-based lookup could not express them.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
