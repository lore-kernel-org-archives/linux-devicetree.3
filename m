Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1809134C9AC
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776851845; cv=none; b=CT7XW9liNxWKE3xBU8pvW4/c+6LjxFhYn32n+/RLDqDiomChhhCSMt+OhDS9Xw5so3mTdkItc6DpRQC8iZRmLMbNmUcpKzjBh7tqhkE/J5p2aP937t2qBCRiewWQc3RGgck55s6HGdG7rRsxffM2+i9cN2sn0REoKrOTb9Tfgi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776851845; c=relaxed/simple;
	bh=6mDuNq45KeFm896CsiVIYXGWEBMDyn7lRDkAiVSdchE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srtCP4BRlnNouCmOdbaIIovWNZZ8VnmCsiLZn0nWRGXhym+6cwCZ7gFbC6wwo1TNVndxkmWsF5xsW7HZxLvTgy3OgWx3fvcIWE/rZcTDHTw4XNNfBz8tlab83/qnezK/SOleta4neluj1hz82gIQyHSMsEWTIoRziCl9UOo91IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso5241309e0c.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 02:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776851843; x=1777456643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGUAES2iGSzBFF9bZ8WHBfj8QFYxk924QkB8alfO0Ig=;
        b=DYQ3BvDDsLimOJBmg21SkjVxNk1obDmHqEGOS/S/4malytgCH2ChfcH8ARAr6lLAPL
         IEQt6QIZ3OXPKbZeJzgUdW6wBDiAmCKqahwkRKCV0WcHV6vpLQvCy1pUfoSYWctLYhcS
         KO+BypK/sDvm6RaPjQfdvyPez6ckJrRymogWDxhCHDuAhXeRkzFVvSTsQ+UHaTqnc0/y
         IIYisqwHWNglJHVKrJ9PQd2PPtCMJUKjJICPidjIh6majvVY+PSXg6q3Lmf3jBxKBjgl
         5tteNe2w1hCKWw84hEEGgnIw3ggJuuT4remt2LLSF7XegbHA2kXzDG8l2QEY5glCEsoE
         7VAw==
X-Forwarded-Encrypted: i=1; AFNElJ/KlrQLbhVBL3ak2y4L23GMSXiJDQPK5xfl+KRYPK+g9XXnPjHXa173yvjRiphylDp5gDWxU+25mBMH@vger.kernel.org
X-Gm-Message-State: AOJu0YyUfSANOhM8LPr6q3GnLJejNW23xaYuAp33dnfbcrLRRpysSNr3
	m/jA5w1BpQt7X1eaeKZr0gQg1q5smSwzCKYud7ewfcozQEPAlBg8NJ0fOHHHv/OLtP8=
X-Gm-Gg: AeBDieutzc8c7e2FBbMva/+ZOh0OStnDj7jKy47GbepcEIdNjh1bmXtfQZR5igbNdcE
	3j8hi5mnGiqgP+64gjl23ykpLePthbHhuQhU4W+MLH/+I81Ub/9AF9O2KGOugANB4BAHaGrpZhf
	IyOm4wQE0Ps4hvOL1F6xHhqAGW16GJ2gVHgbAWbPg3uDOvjjvRKDvXqvAQSdHUaeUFqAUKH0oHs
	3HptGZq4LZ/93AifBixgWvHrW4TrJV6c3eqIWcQz81gsdvK4MHNVydrbZ40fzEz3G1mY6P6Llbv
	Oo6U4dhmUHiTBJp6K/T9+cNd8DjL7iJcSoASExWVTbuCa/R+Nycds37/Ctro+4jA9Ea7JPpNn5c
	gfTxSbfYdRYEkMWE+CWqAPR1+vsfHv/5ircUyuI+/2JI/dieRludb/stAZgXSGL5kaT8qXwRhUq
	fgXqGg9+pK3RBZhrwD+3hXiaY+76Bx+oTyH2Sr4a2EHkRDTYHYZNzrMg2g9xUxhOSJJ4uUWao=
X-Received: by 2002:a05:6122:2bd5:b0:56b:7ec9:f54 with SMTP id 71dfb90a1353d-56fa59bb9dcmr8324964e0c.9.1776851843007;
        Wed, 22 Apr 2026 02:57:23 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa91bf90fsm9299153e0c.1.2026.04.22.02.57.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:57:20 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-60579b9c0ccso4084091137.3
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 02:57:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/wpP/Ecv+Tk5sMctOsOfBzm2Wwv1HgrU+WE4FA0XSluMJStUuNb+CBShl9HClRx0ntGhH2xd70Zntm@vger.kernel.org
X-Received: by 2002:a05:6102:3747:b0:5ff:b8d8:b40d with SMTP id
 ada2fe7eead31-616f71f053amr9254255137.21.1776851838676; Wed, 22 Apr 2026
 02:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331145221.7974-1-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260331145221.7974-1-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 11:57:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNwMU-TSOSuHseHN_=TJD8H8ufXbELhw=tbNnEu9fUfA@mail.gmail.com>
X-Gm-Features: AQROBzBvB791V1AlJ4m6KSvT4nDoXmDRU5p3nCcbvfGNvDCmLo9cr0R-7oUZKkQ
Message-ID: <CAMuHMdXNwMU-TSOSuHseHN_=TJD8H8ufXbELhw=tbNnEu9fUfA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Configure eMMC/SDHI pins
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Fabrizio,

On Tue, 31 Mar 2026 at 16:52, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The HW user manual for the Renesas RZ/T2H and the RZ/N2H state
> that for SDR104, SDR50, and HS200 to work properly the eMMC/SDHI
> interface pins have to be configured as specified below:
> * SDn_CLK pin - drive strength: Ultra High, slew rate: fast
> * Other SDn_* pins: drive strength: High, slew rate: fast,
>   Schmitt trigger: disabled (not applicable to SDn_RST pins).
>
> Adjust the pin definitions accordingly.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

According to Table 58.11 ("IO setting (DRCTLm register setting)
condition"), the recommended drive strength value for the SDn_CLK pins
depends on the transfer mode. So shouldn't this be changed at runtime,
depending on the type of SD card that is present, using different
pinctrl states?

Currently we have:

    &sdhi0 {
            pinctrl-0 = <&sdhi0_sd_pins>;
            pinctrl-1 = <&sdhi0_sd_pins>;
            pinctrl-names = "default", "state_uhs";
            ...
    };

I.e. it uses the same pinctrl state for all modes.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
