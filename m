Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D73E38C2A7
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780397159; cv=none; b=C6w4s5sfEFv3SvgO+v0B8pOZgz+JAJXwBI/bOUKRul7qRzeaKWCOhI2zGTi8kFjhkocti0073eKysziWnmKaMzUH/gx2NVMw0qg9J6jI8OavlhyQj0dhi+W/Nozwka1r3CZgQb6zeUKL7rYoKnv9Qk4BtI9cklVN2DQdC4Lzxts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780397159; c=relaxed/simple;
	bh=m2OLyRHEzfiH1If3842QvlE2x2DkDa+BCMu7OEfVKso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cppEhtdQu9kHeTa6is6WtbhXVKVMkF6tA9eVK1lJghDdnHUdQ7B/GB/9VnhZx+Vx6u66kzLh2osUQ02QGxusqmpDx1IDpNAUm3TLX203ogIuTsI7rzQvD/p0/nogrXMDFHsxQr33JTWr7RcqguTDtQOo9iMvObMWvCnPIWzkfsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59dc1714d44so937439e0c.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 03:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780397157; x=1781001957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k13AOr7bxtlzRyNR5p/riJSVMmAVP/2fDxhyixHG370=;
        b=UFF8Wi/TewPc6KL6iwm+vklEykbW2KOn+PTP2beRiyOsUkzwJ5F/821+Y9yyHUNSF8
         naATX5NPIrPwsZmgvg72n/ksFPaQzJNEL5I505ZwtFvlUnPW/cF7CbCc+tfucBDAwtHA
         2b7wwjxo0fdbqEkOWCmrDvVgUfyjN7v8eHfABbdWKYiG2hah3VzST85ekT2mRV5p0krQ
         ulFA95VZ7Rjvyg/G4+B+sDYYMTmkrRWNP5LBQtw5LH5HnR4c6U/Etd62nIj8qO/8KpGa
         /27CdCIlrkpZuWxR6huRRq/sRlxLDn89jpoAec2S2ARQPte3tSDgkB84PxhKqZBrAieu
         rR6w==
X-Forwarded-Encrypted: i=1; AFNElJ+0tQ96VHbPclWpoENt2n30GpUbUqe1SMlannSGqX+eipsmIuhUL9AXIIliXpU2Oy7V5FopeZL7P61h@vger.kernel.org
X-Gm-Message-State: AOJu0YynnZUhGBHIFU0OQb5bLDCYnJ08KILX/s8I708mQy6C7b8Nkxu+
	tpXO+IcdIRFWwt/4f+5qVCxi1+bpQ6co85qeEm4EUDnsXgOh33cNPO1xwhB49kXf
X-Gm-Gg: Acq92OGil2Bw7pR79LE6/cA3sNb9J6R0gdKAU8PI3hQ/1cOqYCDqa5GjFkKPVZR3Vgn
	cJQSBnSol3Ihqm3imjvOXfRKPn9yKlit+m2z+YD1clXinmPO2044c/8H2iSAV3vyCbtZJ14EeVn
	aCBmPBSi15njPK4Jj7zX8FjbsNhYP7P91ly87CWb7yXq748NIyywKzNFufqiIf0GKTqJRNQnWDT
	LTuUJ4mEsHYhVTTzfsQlDcUD2J941di5SDAZ0sdoyiCBN0FIDPxpZe/ZzAm891tZYWQJf4pyj3T
	zmXsDQ4VyZUw0sRWhOcYgfsI8u2Xd8YNJgjye6hrkcuz1dA3Jxxj3C2ptjARjuITIlcgfnlNEnt
	DLHcOutTHUd8OC3+DKdvl9FgTLr4JUWh4oloTTgfhs2AoGqRfreA/6uN+3oidtW3IBPNaJNOoCQ
	v53N5/mO8Pn7orb+WO7MZCdCytfYuaIA5B57JGRWjq2QYhKm3ELZxgTEv5roqCefR1oktgBc4=
X-Received: by 2002:a05:6122:4f83:b0:5a4:5605:c681 with SMTP id 71dfb90a1353d-5a45605d58emr1304203e0c.0.1780397156888;
        Tue, 02 Jun 2026 03:45:56 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a3b68647c7sm3162237e0c.6.2026.06.02.03.45.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 03:45:56 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9640111c168so175085241.2
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 03:45:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9f68pC74HVqNATBknNPsYfQ9t82xm3WB++l1/mjzjqisaiK8OFf4jHH6QSJyxXi5MqRuG1y5L635BE@vger.kernel.org
X-Received: by 2002:a67:f0cc:0:b0:6d4:ba3e:bf97 with SMTP id
 ada2fe7eead31-6d4ba3ec953mr3380461137.4.1780397156313; Tue, 02 Jun 2026
 03:45:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530080340.24715-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260530080340.24715-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2026 12:45:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8gGvjTPat-7=r3q-bXgQJU=A2DsDEPXZy6k20_JKx9w@mail.gmail.com>
X-Gm-Features: AVHnY4L7BRTCvrScNJxSzK89y_cx_oaLMyrwYaCieTPGajQeUgjKit7WoEbSICA
Message-ID: <CAMuHMdX8gGvjTPat-7=r3q-bXgQJU=A2DsDEPXZy6k20_JKx9w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: renesas: r8a779g0: add MFIS node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Sat, 30 May 2026 at 10:03, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Describe the MFIS core which is used for various tasks including
> inter-processor communication. Interrupt numbers look irregular but they
> all work as expected on a Renesas R-Car V4H SparrowHawk board.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -589,6 +589,23 @@ tmu4: timer@ffc00000 {
>                         status = "disabled";
>                 };
>
> +               mfis: system-controller@e6260000 {
> +                       compatible = "renesas,r8a779g0-mfis";
> +                       reg = <0 0xe6260000 0 0xf000>;

Why 0xf000 and not 0x10000?

> +                       reg-names = "common";
> +                       interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 916 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 918 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 920 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "ch0e",  "ch1e",  "ch2e",  "ch3e",  "ch4e",  "ch5e",  "ch6e",  "ch7e",  "ch8e",  "ch9e",

This is way too longer for a single line, and the double spacing
doesn't really help (yeah, it does align ch1e and ch11e...).

> +                                         "ch10e", "ch11e";
> +                       #hwlock-cells = <1>;
> +                       #mbox-cells = <2>;
> +                       status = "disabled";
> +               };
> +
>                 tsn0: ethernet@e6460000 {
>                         compatible = "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethertsn";
>                         reg = <0 0xe6460000 0 0x7000>,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
