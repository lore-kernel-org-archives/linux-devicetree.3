Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D770377563
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 17:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787937760; cv=none; b=bOHmkefrgVAXeSPbCnnLEIUIWGMZdBeBqBxqZXOjteH3NhpgRRYQBdSniGIhDH8cy6wpxGs8gJ9cVAay9+peiL8hkCAY0Lbnv6pQnAkxYW/NtZ6kcYhtrkquPgZXHTwdS+mDTxcduvUM/Xq+dp1ysgcVWn35xKz8tX3pYovwnVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787937760; c=relaxed/simple;
	bh=n+VYlEwI6ctI3pyKixI8TWm6nE2Lv/uB0QABZm26g/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xfl0OaAy7V+cIqhpxvQIvrVYp5znBQJLObcOe+upzLT8gPhoAawCSiJ+tttNQqe5AGiXC0//WBQk9kqxS+de4XPhThYLMDUmn/etFnhzVMWhS18POIe+FuBPxdncpKFyuUZ2FI0RxDMuJt8cjWPyfdxkD54wUyy5Yh50tVzFAjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81e6f0b4610so15214347b3.2
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 10:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787937758; x=1788542558;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GJwmn2u3yEvtirjEY/Sfkzcv2VJy3izJDZbrh31Q+TM=;
        b=ge6EKLY5gwbVFi6RS2MODDk8NIyN4kgwVSucrFQsKtyyELNqjDelEMAXW0i5V6qNto
         aShiFxjDaZbVSIiqQbVoSORiG7pJspYcg6aJYlev1ALh+2//0PYUraAS/09PX2HU8vVY
         ZnjK0Fa3tbDFTzpEhd2pY7DlcPzFvaMgmfGI1N52zSCtWrNAjvsBQe7zJ3aLG45BVVoF
         g8YSBvuGQtK8CQFrIcoC9ROUQlHbIjf1EmwRSEGMjljVlnaXAIBLQ43m9bCl//Goay7M
         1uSZFtVc3etP+cB5cWN1ExwvyJ0oaaZol/c77ttDb17D29jTRDjjsQ22bc1LyoRBxDs8
         4ROw==
X-Forwarded-Encrypted: i=1; AKwUvBzJZEQGlSbYCU6aURb4vE2h7Ze4qsNkQRCGwsBSUB4ZolZhR4yCRSK64/AvLugx4cHeMoWHf2b4HbcO@vger.kernel.org
X-Gm-Message-State: AFuF++ky4kQVQLcLzxwnId//NJlF/d+yN0HTaq8BsgpI6yi3IayDbVie
	cHK3Ei1JzVIfCafkj6aYMBQ3SHchnsX0CAX9CDFtd6u9RkW9A1XOV0aHb51sZUvs
X-Gm-Gg: AYBFou0DlnZC7K/H832mpT+BGYLvlcj5VkL2OfwrXQDGRIxafFj2AkpNML9RpTcjoid
	UQaadc0JZhVY0KlgSBVb1zFs1iURKnYQZRVstFruY02myMvAh5ZXQ7q0OynZafRLAPHqAYatCVU
	JnUsYsrs9ufbTkRZzpqxwG1elu++PWCRM6JRw/ajz/wJzgZqhm1P6kd31Wm8z6yuslYk3CFqmpR
	SXpOJYOkDEqLAwx/kaLrils8x7zy9ZB6ssS9eHlQxi/8O+8UDkuT95q68f4JEqd16MjPpZXQFFc
	+GJjrlm32wqbx+mxmPpZeV/WnuETUJ1rMZetzoXtEChQo644azgv0u1WJtQ82g7In4L/Ks2ab/c
	gUfsY7k+rG2p39A+4l54Wc8tf8uEPqBnhJu6cYml8rETzTCjbLCVMtO129QOyvCObyUsDmeelcG
	Ze2hNrl8dtwH1OFKrIABboVd1kVL2trjZ+VAkog9qaiiCtzEoY08feU23MlyIDnkg9pE3lN0Ojd
	rDBWkOZUGMv0D3zh3MJqS9xs6FL7A==
X-Received: by 2002:a05:690c:d88:b0:854:b86b:d206 with SMTP id 00721157ae682-85d69164498mr35624037b3.12.1787937758171;
        Fri, 28 Aug 2026 10:22:38 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e65f146c6sm9827987b3.28.2026.08.28.10.22.38
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 10:22:38 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-836ce6cbe1eso17396067b3.1
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 10:22:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzNHI+raKNqqJ567dgjxxGhpuA+tlBn9b62FTwWaR57Ejy98d+WquTie7q3QOn/gBGe7bP4swacCGAx@vger.kernel.org
X-Received: by 2002:a05:6102:5128:b0:780:7e65:f0ab with SMTP id
 ada2fe7eead31-7859822155fmr2331935137.1.1787937432929; Fri, 28 Aug 2026
 10:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828145943.2077589-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260828145943.2077589-8-cosmin-gabriel.tanislav.xa@renesas.com> <20260828-stoppable-clone-db6c2fefe0fd@spud>
In-Reply-To: <20260828-stoppable-clone-db6c2fefe0fd@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Aug 2026 19:17:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUryFJFQ+NWRzXWTzhW5yWvUsXc9y1=wTS13BGOaKg+5w@mail.gmail.com>
X-Gm-Features: AcwNN1Ug-iBgmO0xBVDQC1ANygzOTknsYPhMGIIdZDUDE0bFwxADxDj-zP0M5Nk
Message-ID: <CAMuHMdUryFJFQ+NWRzXWTzhW5yWvUsXc9y1=wTS13BGOaKg+5w@mail.gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: iio: adc: renesas,r9a09g077-adc:
 document DMA support
To: Conor Dooley <conor@kernel.org>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

On Fri, 28 Aug 2026 at 18:21, Conor Dooley <conor@kernel.org> wrote:
> On Fri, Aug 28, 2026 at 05:59:40PM +0300, Cosmin Tanislav wrote:
> > The ADC can transfer conversion results to memory over DMA.
> >
> > Allow up to three DMA specifiers, as the ADC conversion DMA request can
> > be routed to any of the SoC's three DMA controllers.
> >
> > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

> > --- a/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
> > @@ -57,6 +57,18 @@ properties:
> >        - const: adclk
> >        - const: pclk
> >
> > +  dmas:
> > +    minItems: 1
> > +    maxItems: 3
> > +    description:
> > +      Must contain a list of references to DMA RX specifiers.
> > +
> > +  dma-names:
> > +    minItems: 1
> > +    maxItems: 3
> > +    items:
> > +      const: rx
>
> How does this make any sense?

Each entry provides the same functionality; the DMA core picks one that
is available.  This was one of the design requirements when support
for DMACs was added to DT.

> If the device can make use of three DMA controllers at once, you need 3
> names. If it cannot, then just limit this to 1.

How do you expect that to work with multiple (the number is not fixed)
different names?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
