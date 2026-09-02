Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7473466B5E
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 14:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358889; cv=none; b=ZY1hx0IPZn7VDHJAcIWuUsyF3+s7lTONNB1m2sulgiJp5YqTq6ylIOkYh/oIhBDMX0tFixgxgg3bGF6y1Bu7CReT1iDZjUGMU6ciR4aAgiQG5KFdupYUlJ0zyAoiv/gf26LixgJdfGdQEedsiWk1YrpNh/ONyMpnPPExGaG/X1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358889; c=relaxed/simple;
	bh=3iYJBxh76ksrHroBjxLWDni+wZz5yO+8mFWg+dS++j0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMbzOp37gIb0I+VXfcBmFDtGrLniC5KAQ+u40CsBgjbBRYgueDLpDg54yGF65Jw3d70QaKNCbuYu+z5HbxxL/rbWtvS93+yFKQjXPHly+tNimm/yt2Jq/f9W+nqEkQ62ZJkF8yWb1Ll0e7ZPadWW2+jE4v0QYrh+WUCb8v846Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c7bf03c4d0so965280e0c.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 07:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358887; x=1788963687;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=evP2uDnq5KuHvliZWqlHGeP115Ejr4LNw5LNG8+8bBg=;
        b=felGNydXQx6u7ufFcw6yv3H+moIItbnLnT7Y94eWA4IwQfaNW0gvl2EANmwKHx/r/D
         qoARTu6N2dhNpigDhrLRbjgzqx6JP19uiDVqXGrd3sTol0oCn8JiYcnQ+DbwVJy/AWjC
         SV6twxyo0BQxyVTJmHZOCxhDgH6kD0P7II65qt0x+n+3wIrHm9FQuQZPRhHhV6iC0rM/
         3EFIDhdyWpU+/geSxZkFrNyBbYUqT9W833KSPjbhc1yBtbUgxydQ4qi+uoc2cxT6a4dh
         pGA1DbrykknEr9NSNGX1NA0Dg3QW+XOFNcgrpfEOys5H+SjuGVIn4svRDnXaZu4WS6tf
         NhGw==
X-Forwarded-Encrypted: i=1; AKwUvBx7qoUcWba3aXoEZyRmb9p3VQJglQZ/f1ZpFzEVtD1T7+OwLHOnzq9Z6TmIfTjC9dPzaIV74uKE/Hvh@vger.kernel.org
X-Gm-Message-State: AFuF++numezza0cuRrTkLfSeapnw4KRHcxFqIovWVn54mxQ0/hB+jauk
	CxNkyFLXxBdMRelkpZU91oFwREMGwhdJ3vLChTP4nRZoEmrIpGdB9AnYR8E80Ury
X-Gm-Gg: AYBFou0Bs99p4aqKS5os/iSDvb4GyzO4ST8d+70WftHPWkrgy+TuqvhMAiKEKK6kFMS
	NU8gjRl6G/dX3z2CQQT1bLwb9Qw8W8ePIa4dAad/3yYy7seVLS8hdbkCKRfqmdI2ihCvbdoWPtN
	QnaeqbSyASwF5OnB+ie+4jcP8riwCQ7/pVJxXAr51cvQ4m/9zGpWGFck6rkanzI1SdxYZi9EBUX
	EuBef/SyFo8Rl8JFr0MWhmbnQ6iQ1/uG9z2KF6RvCEl+gyWfAUjcuJvh75yJYF0e9/IpOYHGPIu
	1Sn8OyZvsjeFyJXuNnco0O7AiV9kU0fylWROwOvDT7RmWNMpsdiQqg/c617lzOmXmo64olBFHNP
	4JvcRCCh0AtoD3PBh8cRh0efkd+nhC6vGvcFymFFggPovqn14CtLo+BAJrZFASxnT9aUIsEH3Zo
	GebtdsvpqF8pOiQuhwwkWYmSCGp7lHtCg92yiw3SfeZ0C3oqF+DvpEdilcP6zTt17/UJ8whqHPq
	O3HR2FiRQqWLpFmtIaDeKxEF3ejCg==
X-Received: by 2002:a05:6122:3701:b0:5c6:731e:3c8a with SMTP id 71dfb90a1353d-5c7d2489256mr2444102e0c.1.1788358878092;
        Wed, 02 Sep 2026 07:21:18 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7d1f9d1edsm1521552e0c.15.2026.09.02.07.21.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 07:21:16 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c2ae02f69eso1014846e0c.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 07:21:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByaPixew+AsUqeeBfu8qSmDel1gSaBLjThLf3Jv+UHoSyakadq6cfBePrAoD3DL8r1DxYt2XEKWJq8o@vger.kernel.org
X-Received: by 2002:a05:6122:3701:b0:5c6:731e:3c8a with SMTP id
 71dfb90a1353d-5c7d2489256mr2442213e0c.1.1788358863528; Wed, 02 Sep 2026
 07:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828122113.1426778-1-tommaso.merciai.xr@bp.renesas.com>
 <20260828122113.1426778-2-tommaso.merciai.xr@bp.renesas.com>
 <20260902-heavenly-ambrosial-trogon-b7ab03@quoll> <apgsOubuGuvw_0rf@tom-desktop>
In-Reply-To: <apgsOubuGuvw_0rf@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 16:20:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0y5Dg9tW7fAM3QQHKpAw_+vmjj7v-XeZmrushQgQFAA@mail.gmail.com>
X-Gm-Features: AcwNN1X9A4V0FkbVpKVtvPWiA_DTIG3JNljzBRxP5oY3Ch7smDLgUzau8FWVpIQ
Message-ID: <CAMuHMdU0y5Dg9tW7fAM3QQHKpAw_+vmjj7v-XeZmrushQgQFAA@mail.gmail.com>
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

Hi all,

On Wed, 2 Sept 2026 at 16:03, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Sep 02, 2026 at 08:37:06AM +0200, Krzysztof Kozlowski wrote:
> > On Fri, Aug 28, 2026 at 02:21:04PM +0200, Tommaso Merciai wrote:
> > > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> > > Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> > > Processor (VSPD), and Display Unit (DU).
> > >
> > >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> > >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > >
> > > Add new SoC-specific compatible string 'renesas,r9a09g047-du'.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> > > --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > @@ -21,6 +21,7 @@ properties:
> > >            - renesas,r9a07g043u-du # RZ/G2UL
> > >            - renesas,r9a07g044-du # RZ/G2{L,LC}
> > >            - renesas,r9a08g046-du # RZ/G3L
> > > +          - renesas,r9a09g047-du # RZ/G3E
> > >            - renesas,r9a09g057-du # RZ/V2H(P)
> > >            - renesas,r9a09g077-du # RZ/T2H
> > >        - items:
> > > @@ -35,25 +36,51 @@ properties:
> > >            - const: renesas,r9a09g077-du # RZ/T2H fallback
> > >
> > >    reg:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: du.0
> > > +      - const: du.1
> >
> > du is the name of the device, thus calling items "0" and "1" is pretty
> > pointless - indices already define that. Please drop the reg-names.
>
> Will drop this in v8.
>
> > >    interrupts:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  interrupt-names:
> > > +    items:
> > > +      - const: du.0
> > > +      - const: du.1
> >
> > Same here
>
> Same, thanks.
>
> >
> > >
> > >    clocks:
> > > +    minItems: 3
> > >      items:
> > >        - description: Main clock
> > >        - description: Register access clock
> > >        - description: Video clock
> > > +      - description: Main clock for DU1
> > > +      - description: Register access clock for DU1
> > > +      - description: Video clock for DU1
> > >
> > >    clock-names:
> > > +    minItems: 3
> > >      items:
> > >        - const: aclk
> > >        - const: pclk
> > >        - const: vclk
> > > +      - const: aclk1
> > > +      - const: pclk1
> > > +      - const: vclk1
> > >
> > >    resets:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  reset-names:
> > > +    items:
> > > +      - const: resetn
> > > +      - const: resetn1
> >
> > Drop reset-names
>
> For reset-names, I got the the following comment from Philipp in v7 [1].
>
> Dropping reset-names would force the driver back to an index-based
> lookup, which is what that comment explicitly asked me to avoid.
>
> [1] https://lore.kernel.org/all/8382e2b9fd07fb1132c26e228b3899336fc1fdd4.camel@pengutronix.de/
>
> Philipp, Krzysztof, could you agree on which way you'd prefer?
> I'll follow whatever you decide.

Until we get a variant with a third interrupt (or reset or reg),
which is not related to the number of channels...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
