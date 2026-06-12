Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E01A3BD63A
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 11:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264754; cv=none; b=NPSU51zBzr2jqh5KCwVvs7klp0qy8fNYeV9a2+nI4ulEDrRjs51ZVIn4AuyP7wldRwRz64r3+d6L9TIumcb4z2TodPTsWKiu1+L5dmPdjZwwqtZVJkzD5kvkx3hJIm2xYE4J8/AJDKZHpBpOSZ5Tpws2kYa76Mdee8z5IPJ+wPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264754; c=relaxed/simple;
	bh=oGUJQrXok0oefnVapsoFTOkDTq4rMzW8cVDmbrT2fZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKsHGY6cvCTGYXcALakmOcR/8kHFC4Bn4G6FDiFlirnz0pqIpd4A2/b0zK0nXl1QobW5o/YXD+bALx74bg76bvgPWgxSPHKLSIGOuFqUnV4zCV2b/YeEokjiYqOFhDIWDuHDPG8fL0Ef2JPuKr1z+Oc89HpX2O4UphHoeEjpxS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-59eb501bcf0so255182e0c.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 04:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781264752; x=1781869552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNp4g5Gvhs1Bf1iVWmOM1OJf0ux2oAi1myswnuPAOFE=;
        b=aro8uv8PXmlUaUqLA9zw4qMGu85FQgnzwEBkUUvGIXG8xUknwJHoEiM2u5BdQ6Bzyp
         mX1NmQ63T4pTc62ISJoaMgHC5TpISO6KBCp7u4MRM0snYaW4Ocp792gr+I71qL2d37Tb
         K9YIC07uejgkEgj1Ui8Nbhc4/WZTHfrngLT42xL8JD6xLDXgCQtlQShzKjc71XSkdiTC
         8H70S/eNk5hc8eHDEeoRPesQ5c5LXEZjhrYNY7xI6LfDFv1FpV4gUyodGCab1ma3de5J
         SlXczl2Raj0igiDBJyNUkfJXFuTgo7JmcA2H0OTbvH9OJnX9SqZVwJxkwXlrFp11uiCV
         A6ow==
X-Forwarded-Encrypted: i=1; AFNElJ8Nc8Evo5KWLysV9ZpsWCr3KdE9wn7FDcyDGmn0zDN4X9VH7FAhporKPjRVfubB4N0RkHeRCVSKQCDl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz92OZWASLaxoKd1aztR0IVBnUc7dlsuwNY54+VLTrhywLA06tA
	hyphDfY4y5st0fY1GlY2YyZyH7LRXQ0BEHH7wNpSDHcIo5N97Dn70rErGLy+ql7T
X-Gm-Gg: Acq92OHgYas0hjaP9VWxn4+aN1xbRerXFuPVQ7GKwxiUSABZqkuhDcQ3GNc7hV9gOUK
	dDfK0+jxk6XlJq6QndUw/caZ9kKbfXpGfXF3SXrppPuRvwA6/Ln1X1sZ1EUyGj5ppV+OoZuITOp
	xWGPsUyIIM+HhV1cFGzmrGe1ComUilhgq/6DA+PaMOVwbLGzNKo9Qa7PDa83f69w7rWDY7p+1KT
	5DI+tO5a8dlnJ1COetH99PRZG5tGgrR80TmXn285wPc82+oexgopBllIW5InFrdFhjB5HPRvyIW
	jRgKom+6E65fRklLsXRGonb+2BsqiXyTPJoc5G/EnoGgE40hyFoxVoH/PCn3PXAZYOfdtPx02UI
	9kNZKO+WqPs7T3I2LoqOARrb/C7Stw0aZlgvaIE2CZSDqKoks/A8I5tzsOOV3i1N2Z3pleghgHV
	h5e0Z+1AdUVU9P6hUpP/imgeHe4dn7AjaZS1Tip30rGJOoBx1xS0HbNoo5CC8m0Zje
X-Received: by 2002:a05:6122:169a:b0:5a2:5669:d6d0 with SMTP id 71dfb90a1353d-5bb6c1940d9mr906637e0c.9.1781264752136;
        Fri, 12 Jun 2026 04:45:52 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96673eb0e3csm1175380241.7.2026.06.12.04.45.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 04:45:50 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5ab0377d0b2so267123e0c.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 04:45:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Yl8sA9lJgQkAXl7MVEU8bspiBYnH3oNceIItPT5CS9XqNGa3opo36MdpnNH3ejshQuKoScYvOWWE/@vger.kernel.org
X-Received: by 2002:a05:6122:6606:b0:5a2:4391:1730 with SMTP id
 71dfb90a1353d-5bb6c0dd1abmr737507e0c.7.1781264750451; Fri, 12 Jun 2026
 04:45:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-3-phucduc.bui@gmail.com>
 <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com> <CAABR9nHFHWFeEaaYE6X9fqt_Zb-3pF=jJbHQpsiBTgkS5LyTLQ@mail.gmail.com>
In-Reply-To: <CAABR9nHFHWFeEaaYE6X9fqt_Zb-3pF=jJbHQpsiBTgkS5LyTLQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jun 2026 13:45:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsLeEzjCPHEa=nY-kC0n34RHL3kUMW30vneUajCWwTRg@mail.gmail.com>
X-Gm-Features: AVVi8CfnD-TjdQCjcklRKqlAWA3VoQ7yU75YfPEvom1NYLk1a4nkIC9X_AZgb2s
Message-ID: <CAMuHMdWsLeEzjCPHEa=nY-kC0n34RHL3kUMW30vneUajCWwTRg@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Phuc,

On Fri, 12 Jun 2026 at 13:08, Bui Duc Phuc <phucduc.bui@gmail.com> wrote:
> > I have one more general question.
> > arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts configures
> > audio for FSI (fsia_pins), but does not fill in a clock-frequency
> > in fsiack_clk.  Instead, it fills in 12.288 MHz in fsibck_clk, while
> > the schematics call it FSIACK.
> > Apparently the FSIACK pin is shared with FSIBCK on R-Mobile A1, so
> > which function is used depends on pin control.  However, the DTS does
> > not perform any pin configuration for this pin?
>
> I checked the schematic in more detail.
> On sheet 12 (FSIA section), the FSIACK signal is connected to the
> WM8978 MCLK pin (pin 11).
> It is also connected to the X8 oscillator output (pin 3) through R121.
> By default, the board populates R120 (0 ohm), which routes the signal
> to R8A7740 pin K5 (FSIAOMC).
> If R120 is removed and R250 is populated instead, the signal is routed
> to pin G3 (FSIACK).

According to my schematics (RevA), R120 is not populated, but R250 is.
So the 12.288 MHz clock is fed to both the FSIACK-pin of R-Mobile A1,
and the MCLK-pin of the WM8978 codec.
Which revision of the schematics and board do you have?

> From my understanding, the default resistor configuration places FSIA
> in slave mode.
> In this configuration, FSIA receives BCLK and LRCLK from the WM8978,
> while the codec receives the 12.288 MHz MCLK from oscillator X8.
>
> This matches the current DTS configuration:
>
> simple-audio-card,codec {
>           sound-dai = <&wm8978>;
>           bitclock-master;
>           frame-master;
>           system-clock-frequency = <12288000>;
> };
>
> Therefore, I do not think it is necessary to provide a 12.288 MHz
> frequency for fsiack_clk (xcka) in the current configuration.
> If the hardware were reconfigured to operate FSIA in master mode, that
> might need to be revisited.
>
> I have considered testing the alternative resistor configuration
> (removing R120 and populating R250)
> to switch FSIA into master mode, but I have not done so due to the
> risk of damaging the board.

I haven't located R120 and R250 yet, so I don't know which
configuration my board has.

> As for the relationship between FSIACK and FSIBCK, I am not sure.
> The schematic I have does not appear to describe FSIB at all.
> The HDMI section only documents video signals and does not mention audio,
> so I do not have enough information to determine whether FSIACK and
> FSIBCK share the same pin on this board.

That information is found in the R-Mobile A1 docs (PORT11):

Table 1.3 Pin Assignment (505-Pin BGA Package)
    Ball No. / Pin Name / Multiplexed Pin Functions / GPIO
    G3 / FSIACK / FSIACK/FSIBCK / PORT11

Table 54.1 List of Multiplexed Pins
    Pin Name / Function 0 / Function 1 / Function 2
    FSIACK / PORT11 / FSIACK / FSIBCK

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
