Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F5C440625
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 14:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668951; cv=none; b=HT99/CyDGte372Ur6WKDV5HO9bIIYVTTZZg2nxtwqamdBUuCGXr+JgdVmx96BQVSgkbHZ/myOhgRBGsIcw75t0YU/gMaBUKDCUMzbQLMd/te9LjpO40jzM8HakpOfw/avaN4Lr72kFoQ3z+4OYTpoI8kmlu8l4zTCkD70vP6cJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668951; c=relaxed/simple;
	bh=nPKshbbUtBrFg12ZGrFb6hUqHzYltdvYyLHCNt5+v8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lcjzDlXycZmU94oxJmIgdYWsRKYjv7dy7FRgvtIswvwLZ+CKSyW2z0QW0pXUm8zo+pmm6GopwlgpGlHnvctfoPkIEVu7yKtyyI0HL1LOxul1rlj2FJGuk5zpOgTsQVKd3A9RHajuN/j4CLJ6y1dMhc/RgPYQJ/UOhTXN83cixsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bfb3347dc4so3696997e0c.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668947; x=1788273747;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w6P/zDMrNIG/rjy54fcEEocHk6BsN+YxdD3SIYMCYNM=;
        b=GnyKu7/Bo52n5d6Sznd0NpmGql6ySePU+RbmyeZThAq//dh9+QGiwlRyHv/H5K6Awe
         EfqnPfjurZ/jm/UKuEYjtmnLtEpqEz/bRQ8ce8pHpl2XvHo0vjg5XjY7wbrrEKcODV0o
         M5p/MfHjTEXFvtX7RRwNGGRebUfiHxBomZQ6430Q/R299bZOF/vwhLdrEXnOUnrGuLvQ
         +Q0XXFsQ7kSl1aAwdOeb0kYCgzmgU6IB8hSxA/N9w2zk3jSm7RYdSDln/214lvw464mc
         gaLWS7vw7Ev30z9QNrh2I7Q3BzeqHbfHRdgq7IgvDLUf56kOm4tKfpv2XxWuyjIO9tmd
         iusA==
X-Forwarded-Encrypted: i=1; AHgh+RopRw6AHic1zeFH9jtYk/3Fp7JaVxHX05teJ64lVwixGHmylyYA4CKCZ4Rp7fM7phITABbf/SEOtE+4@vger.kernel.org
X-Gm-Message-State: AFuF++nAdfrudGW3ul/M1a7y69zS8MRWznClFCpTtqVGLcRa+aHX9uLC
	NQQw1yVQQPZ2Fr0DBj8KnqMqtfokvqE26oHt23nr2FRlkuTSOhD/nL7NPb+EGkEw6Sk=
X-Gm-Gg: AR+sD13VupA2Z56/XVWgAMVDPgRhsZm+5+Q9wahbwAWrpE0Kv7NzGRwJhmznESIfqJC
	tjQbw3Dx49W04bvq+q7Ae39cSOpSgD5632eFNbKMJ5uGAI+Tv3znnSpckfa4vfc3FpWYXQT+xn6
	Ne2W1rrLZtbITlwSxAKpa91YLGFyc1stCpGWF9XBOGaYpNpPYAFNC4Es8XwsfKW+LqE9IAlEUN+
	aH0uZhawTvWy3on4qH4IcuJhsVc05RmIsu7SDvLa1y3vhVqrCLsv80cGebVXzmZA0wiu0EdzsaR
	wwls/jTksQtVhBD7NJj8SYDgo83KlElDIHQzGcn+/IVi+7Xg6ImJtgh54DEjxdacabCgD/NLtvu
	7CV6mkw/BC625AtkATcgN40b4NNhzI+vND2tKE2qvLsWn0jjVeEMeg8wtg4d1r64/6p+S+5ku21
	OZLgopZXkTaAzmMC9tVIBFCG9bT1Ki3PLu5r+VQyO4M3PsVqQ6kiCBKSHMFVu7vvj89LY7JR8Mg
	amxsfXVEfjDiLFP3E1UyGo0yqAKcA==
X-Received: by 2002:a05:6122:6b17:b0:5c6:5102:fbc7 with SMTP id 71dfb90a1353d-5c651030012mr791067e0c.7.1787668935144;
        Tue, 25 Aug 2026 07:42:15 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623d310f8sm6184652e0c.8.2026.08.25.07.42.14
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 07:42:14 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c5f23666d0so3793773e0c.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:42:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqJlDq2jJOz9bDSQajEdUU0BnMZZ0utQ9Z4/V871NcpLm5ZtyXsvZy94pMHRvAOSdrcPnp5vaq4Mnfs@vger.kernel.org
X-Received: by 2002:a05:6102:8682:20b0:77b:b38:6f44 with SMTP id
 ada2fe7eead31-77b0b3874afmr7018842137.5.1787668934683; Tue, 25 Aug 2026
 07:42:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-8-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-8-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 16:42:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2BBChjGXf1LqR68EE6LfJXv+uwPm1AhB=NaasL17-WA@mail.gmail.com>
X-Gm-Features: AcwNN1XNGYc2CQ2kaWgxF0GmyyU43AxSZu87qBHq6lGDVbEDpy4b3DvqBrFpSMs
Message-ID: <CAMuHMdW2BBChjGXf1LqR68EE6LfJXv+uwPm1AhB=NaasL17-WA@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: renesas: r9a08g045: Add CAN-FD node
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 19:34, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S SoC includes a CAN-FD controller with two channels.
> Add the corresponding device tree node.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel, pending acceptance of the bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
