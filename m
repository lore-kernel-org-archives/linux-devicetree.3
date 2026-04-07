Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5158C2FF
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775563590; cv=none; b=V/SuBLyB2BNEflucekFLO/tHyyQI6Ww2dykK5iNyalef9GfM7ztPr2ciPoqbnFPxMq38EUuSJMm2uSCqsKGifhcPMNnQrVkjMIteXgWleqPsfVXq8ANv6pQ1vdzfksVPjMy3VB4m0G0t+TwSs1fZAtUrTS7AQF1JRwjilBTSyMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775563590; c=relaxed/simple;
	bh=RLEQaCwlrPnS44zbzdgyul2aW2ANkVmjK7JC5gW/u4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9IhC08VN5ldoRBmCUZ9TF/LCn5JC9LLSoLh5cJ5pIzxCxuDj2dB5iQHdkK69HHUbRAhqKZcASTR3fQjd24gQR0i8pUJDhFM2KH/wiod62pmigtdKQxGGjs2KZ/f+tLW53TcehWvqPce15zrSxgzG278lifRKbg6C8rILcoZV64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56d9c4f7f0bso3519612e0c.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 05:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775563587; x=1776168387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MGYxkmthcoZTlDIjYHdP2FYlzdY22eALuxJJY+zxh4=;
        b=Sy8s4S0bYE+mECPGfMlYvmuaIhBf2WJK143YIFPMmmN9i92cVwSB0/dj+xWVHpMDVj
         u9qSq2y0QyijOxuEcW0h1tsvZLJErw219pQCr2ZoP7R7d524ALCX/k/HlLiCHrRwEnAF
         lN6zX3D6FpKUmqFiL94qskK2h5zJTKFIw/qfqYUDk8Vn13axDXJBj13FvFIZ+eTd0IPO
         H5Ld+lUzvzXniZjBpk8/betEByFyTlWP03OkO9ZKlfecZiPsDBjS9SGy4y2N4VLpuDd2
         P1cGb+tB3jMr5/KPMXmB7gEcW0eYMS7T/DrQIt2ggAlylXTo8oAg+ekofgfJzV3MwAhp
         4cCw==
X-Forwarded-Encrypted: i=1; AJvYcCU2Cqm1M3/75S/ZGqhZEX9mCkN/EtcoVpc2zp7+Aw8Nu67OcHRbv3WivVgmzbD4Ez5R8QfU3xdzYg/q@vger.kernel.org
X-Gm-Message-State: AOJu0YynnZDwdEm+Ba0Bk316UtczqTBi3plBfy5Hk4xMaw0Y8E4Gy78c
	pv7wlOv0IOkt3ZmxABivYl20CD2y2DtQUQdnMQTcmhwJwVCeKXFkiobFkn8hiERv
X-Gm-Gg: AeBDieu+NQsxn5uylIdEJWf32r59gA0b0G+FwrRyem/WGqgkogwcOlGw2DIDs5jrBTZ
	hu3i/e4mADf6cVLlB6uHTsKj9fkXFTxdI1LvMh1oTPRCBtLLrGVu8UpgzHqpIykLXp4NgnDSnQN
	IwPuADuZ0xH9KGHxtKAwkmIq3/EMbHbeuHsLZpm5lqEWeWiGJKqzjbbeFxUuAesq4Lx/n/3qu6E
	q89KZJdGrr6DMPy/SZcedrvMnvqdwfMjBv/caxtmTmMgX0YQ5UkZz2FmE2Jl2O6hsRArGiKFrAz
	M5ZqfKVjA1eeeS1NM/0XFPhPluvRdWa1PHh5JhoRsMUVBSgUM2sP0DKrOmHT3X96i+O1YByrTN/
	Q4A160/03h3zf9AcuR3tOeQ7YfWYX4fF8TWleff8cBmKlmLGFmHIGyC6chnZDWE3DHmRWSP4zrE
	1mL3ueaTL2I0PNrY9ry1KtxMr8oAlv4lto2yMUUk0VMaatlXhkGlKMIACtEwI6+tde
X-Received: by 2002:a05:6122:340c:b0:56b:7ec9:f54 with SMTP id 71dfb90a1353d-56dab9a174cmr6183006e0c.9.1775563586689;
        Tue, 07 Apr 2026 05:06:26 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9ba81b53sm18365924e0c.4.2026.04.07.05.06.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 05:06:26 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56d95bc93e3so3168635e0c.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 05:06:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXhfLvqb0Gr7kz6HWixVTEw4spumzqs1jRmMUfH24QVcMjB9lTUYtRUnq+YsjOyKWXbrToIICy9UJXY@vger.kernel.org
X-Received: by 2002:a05:6122:4891:b0:56d:aa1f:e48a with SMTP id
 71dfb90a1353d-56dab9dd9c9mr6282392e0c.12.1775563586213; Tue, 07 Apr 2026
 05:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org> <20260328000031.94645-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260328000031.94645-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Apr 2026 14:06:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOHaQU0qAYYQV3u7bAm3jzKmQM=btnpFaToxGxPrVGXA@mail.gmail.com>
X-Gm-Features: AQROBzBNV8VVoIPRYTToqrCO0lTdjZgYrqxs7rGtDCmLPkMo9NmWHxs4WMpk4YA
Message-ID: <CAMuHMdVOHaQU0qAYYQV3u7bAm3jzKmQM=btnpFaToxGxPrVGXA@mail.gmail.com>
Subject: Re: [RFC][PATCH 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace
 clock on R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 28 Mar 2026 at 01:00, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add ZT trace bus and ZTR trace clock on the R-Mobile A1.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
> @@ -551,9 +551,9 @@ cpg_clocks: cpg_clocks@e6150000 {
>                         clock-output-names = "system", "pllc0", "pllc1",
>                                              "pllc2", "r",
>                                              "usb24s",
> -                                            "i", "zg", "b", "m1", "hp",
> -                                            "hpp", "usbp", "s", "zb", "m3",
> -                                            "cp";
> +                                            "i", "zg", "b", "m1", "ztr", "zt",
> +                                            "hp", "hpp", "usbp", "s", "zb",
> +                                            "m3", "cp";

The order of the names must match the indices in the DT bindings below.
Else consumers end up with a wrong parent clock, leading to issues
like the I2C controller driver failing to probe because its parent
clock is out of range.

>                 };
>
>                 /* Variable factor clocks (DIV6) */
> diff --git a/include/dt-bindings/clock/r8a7740-clock.h b/include/dt-bindings/clock/r8a7740-clock.h
> index 1b3fdb39cc426..8a8816b2ff6ac 100644
> --- a/include/dt-bindings/clock/r8a7740-clock.h
> +++ b/include/dt-bindings/clock/r8a7740-clock.h
> @@ -24,6 +24,8 @@
>  #define R8A7740_CLK_ZB         14
>  #define R8A7740_CLK_M3         15
>  #define R8A7740_CLK_CP         16
> +#define R8A7740_CLK_ZTR                17
> +#define R8A7740_CLK_ZT         18

Append at the end, good.

>
>  /* MSTP1 */
>  #define R8A7740_CLK_CEU21      28

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
