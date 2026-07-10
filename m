Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BED617D6
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681756; cv=none; b=KZmhpCtRxbh1HYfGGHWBlBvcGNXbHZiijBWWLnVCwYldoqYUWsWwtT7ob2rRYas9g76MpV7CcsFA98/3ZE9XCXp0KbscSPmAHmkbx9cVb2rMtAlpvQ55rGxeMpxFhYidaGrJiqieD3SRvImatnQoFQyFj4st9VUbO43M9zXFpD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681756; c=relaxed/simple;
	bh=TAoC8AtqfvyrcOiH125Z48ckCbhqCjSDAUjYBMGFx+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6NI38OtGH+bnf54sLkokuIQALHXwYW7YIwdcoas+AZ+8KO84k5fbYYtoVUYGTAdrtWKgV0hPsNkAy+pEr76n8kFfE+4/JlUL2rgAtlIi5OMbn9+vXfjwnQjkHGtAdH0n1+vC4guYJUTFFVwqfoD8jTgiOrt0fAA/vzn+PWbU2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81e851aebeeso4565607b3.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 04:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783681754; x=1784286554;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MuUmGqSSA58rP0nRidv37IIoymAVqS6FDOb1XQHbyds=;
        b=aCo+soICwwTNy2FsEyLjouwqnqLWQIdIPV2/FHscPOsP5cZHysFWl67wq2sXCZZtaz
         g1XKVcC02GD2xRHem3PXG5juWKcVgvMKX4T2OJGX04cirIDQDmzg6K8DenJ6sYm1k8G/
         1Bbfrp6YHK+PN59LWfDtr6y1AFEI5gW+/F7SkGaTD08DU6k4aDtVcxDnri1fWTVuV49z
         opYOBJl10W4P5tWmPUDuxytZcFEAhoN6uwbVggZxrw2QTC+GyROMOyM0TqDrbowCVRaH
         WoXt2/OFXACEejBoIB5DzOjJczqRaWvRUtCJEidvDIFcMBGhuhDAq+GZENlc/nAbGuxH
         Qobw==
X-Forwarded-Encrypted: i=1; AHgh+RoCtKRvlmyc3F9tSuOJy8FJspC0c+Wk3FRlxyY5vbsVu2EtplAc74tdUHhhI+a4Tfymg8EggAOnDciL@vger.kernel.org
X-Gm-Message-State: AOJu0YySDYpC9ORklhXPQi7agjTgqk/QG4krYQGQnXtESOT+r4N5kvr1
	bAT2MzaJUb2io8RWTnBAkyUKLfyV81puAwxYQyKOKgZtim+8Gu/s6zx66GMMTAOMXuo=
X-Gm-Gg: AfdE7cmc0knE8A+oJTjaRvzZeprYuHkilcUhs+8P8JX/Aguo7+36Mn3s5XD835Z9SSH
	l2o0JOO4jzAr39so5REqNJtV5SNCetx2eqDR3vIt6NcbdfOwQQl86CI5vSb8jdZ323UfbITwtv3
	zwlao4TUPlP41ySiGJ7ejOkaPLxXrTD9u7xc6aoe58K6vb/UcHB6DpU/7T4Rrbbk4aXHxCQejHs
	44ED9PujCoV0/2DO34MRmOu6N2PjaKJIlCZ74SfJTnIlsYGlDBhAat2GZDCIcjYAg3Axj/zIoO7
	2enOjygGAPLKBgwkPNO1dYis6Hg0RERicAlPfWQPeSHbsxwLjiKqJa5i4wtJzkKEdfxdOgk69dQ
	p+Vs0Qs64myVoe+bGjEsYzFw/On7QgPyNyH3MVkh4EC2uO3o1jz2vlcUtLZMP2rJf56YmZYIc6G
	zezLyGOD2yDUJkdXfmGa/Y15p2rljQVOU4ZFzippJTFwEcQd6SMQ==
X-Received: by 2002:a05:690c:45c4:b0:81e:79bd:fb26 with SMTP id 00721157ae682-81e79be0b89mr26622257b3.60.1783681754207;
        Fri, 10 Jul 2026 04:09:14 -0700 (PDT)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com. [74.125.224.54])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be99124sm42569927b3.4.2026.07.10.04.09.13
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:09:13 -0700 (PDT)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66780d9d901so1220687d50.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 04:09:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrHOJsyZKgG9W90CEzwZ0yp0b5H96IUxxVOYLz7v2Og9ESZAwl0gfvSexQzHdrQbJci3vwrC+CUyd9g@vger.kernel.org
X-Received: by 2002:a05:6102:5789:b0:73e:9fae:5844 with SMTP id
 ada2fe7eead31-744e0426fd6mr5821388137.27.1783681371174; Fri, 10 Jul 2026
 04:02:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll>
In-Reply-To: <20260710-adventurous-burgundy-chimera-b2fff9@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 13:02:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
X-Gm-Features: AUfX_mypDnJ4qFpPLK-a5R1Mbwkbc6yQr178xDsRkCp5yARGuoX_7FuK_KFx-r8
Message-ID: <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Fri, 10 Jul 2026 at 12:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Wed, Jul 08, 2026 at 12:16:23PM +0200, Geert Uytterhoeven wrote:
> > Add a firmware property, for systems where SCMI must be used instead of
> > direct hardware access.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
> >     Pulse Generator".
> > ---
> >  .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > index 4e23bba334382346..fc499e7cf52e4f0c 100644
> > --- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > +++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > @@ -35,6 +35,12 @@ properties:
> >        <dt-bindings/clock/renesas,r8a78000-cpg.h>.
> >      const: 1
> >
> > +  firmware:
>
> RPi is doing similar, but I have doubts. It looks way too close to
> generic "syscon" which is disallowed.
>
> I think this should be vendor+purpose specific, e.g.:
> "renesas,scmi-transport" or "renesas,scmi-firmware"

The disadvantage of a vendor-specific property is that there are more
cases to handle for fw_devlink, cfr. "[PATCH v2 02/10] of: property:
fw_devlink: Add support for firmware"[1].

> Also we have "firmware" nodes, so this might cause conflicts in dtschema
> validation.  Anyway, the phandle itself is fine for me, just the naming.
>
> I'll ping also Rob to chime in.

Thanks!

[1] https://lore.kernel.org/de34ac0c52695d92c67cf950b3d8e9b30095d305.1783505329.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
