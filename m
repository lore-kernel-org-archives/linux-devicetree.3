Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759662BE7B6
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678123; cv=none; b=sMnMH1WYc/limMfW163Nm6Pfb7k/ZkaJuIC4eVh0fRlpI4V42H/ZacP+8SR5fav6BQcX6V9f3mY6K/wVWnybpuOQYaCvkSbY51mRakJFq8KyslqcgOQY4XSzvqjOE0JqUvQGfC9EaPEzoD3NxJu3uIc+1pgDGvJlOu/Wym9eZp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678123; c=relaxed/simple;
	bh=oV7lWg4lz210rteMJfOa33sA9nixlf2kec/RbjFlF7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GawGWQsF6x00tV1BtCRlGGy4w5dxj2vKfNWgGRSEWgDq8k6oXo14HxLsfZ0ovpuiE2udzOkIYL7DMIO0HstOT1Ro2X+/m/s5odlEmshONa3MvNCrBFYySn2QOKh9ZIx/i3nQU3ul1WiEdmsKDYrFG6cTYam48OQOxwBGgCqwo04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5637886c92aso3212697e0c.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778678121; x=1779282921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8cNW33wiaXVwXT9Hgyi/JcE/ejaGgsPgY1Fa4o6ZiI=;
        b=N/QM1OYVRoThH9Fw+oS3HejGcZMhufcOcV+09H0R0G/t3nyHOzApS7uiThQbAEPszT
         pmMViKdnhJAJfdVKB/tgrdPZvKKmSxObzh8X1J722IuLaewDwvrVHImLiZextmZsVMg6
         CE5DrHgeBN148eU8CuMvMXvF/Kw9aFxI4IEHUERGzwfzeHfpATXDOa4WcQUlBU9S+buY
         rJY7dGeaGWtSK2VYhqfeJKxAxE5rtzVai8eBICHabOtpvz2lKkMdjf8rk0lo+EZZOWJn
         fXGHs8KIcJQsTrHrKb1n0XHmMKnMny7IAu4Fn5cu4JfPbS93BKEE0EU8aS9LaNuNDLik
         1KDg==
X-Forwarded-Encrypted: i=1; AFNElJ/k2M7WEZ805J3nPr1NNa+LX5MhOLzw/Argf2CQy/4+VFqNsyGkSHT3jmTj88OzmtDHp0ULd3rA677A@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd9B7jP8T5TRZK2FckzCinHoaJP1h5Zk2xRvAGW2ffUP3RJOD2
	r0OtlHdG0DbmJY5LVIN2RB3+kXTtQIod92fXqzqLPEqAIMyjzeg0n87lCa4IFS0e
X-Gm-Gg: Acq92OHtQT3p9d/hV0Z3DcgKwgUGvuQ7mAq9Jz+qPKlgplMUNGPUUDlv6IgQ3wxYmsk
	63TUgZhSNpbk6b4DCt31Xe/B+JRl0Xsa6M5z7fF+b1IEXUueANwMSQsWC2DAjh9i6g4OKN+f3Qx
	VzvTaFADFlm6p/7FsQBYx5BPq1jq98wIIVz/0usTm7U0IgOLrUCmFeNHwY6xKNcIQp0FIkQTMMg
	5E1qyhQkC35o89lubtp1imvua7Qa0kNMsV526Zvbm55xz5TIqrYoed5YEZmYZp9l2Ty4LiT6Gdk
	4Zf32rMkEvVa5p5thPjeIraZSInByqoNLwfz1FkLVZkjkgb26vWVCO/+9HkydMZMgicg3/8A40a
	6ezpW1XtV347ixvn0pzmnRRTnUSePRwuNQt6rdboDWV0RS6hR6WxBOZy+ZzqdGG0NC9MgHcCxy0
	XMWyfgDs9cT0foNKSAKF5ApfAIGcC+ekmmSCGswCeZDGyn+TNhSabr0vInOVh1ggDi
X-Received: by 2002:a05:6122:e46a:b0:56f:b674:783f with SMTP id 71dfb90a1353d-575e6f8cfa0mr1312417e0c.6.1778678121452;
        Wed, 13 May 2026 06:15:21 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-57586996c10sm10004247e0c.8.2026.05.13.06.15.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:15:21 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5637886c92aso3212685e0c.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:15:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+5roIk4cra1UipyZ9v4hAxmMFjfHehfDDupyJITRpK+wUj3B3oURzAOcSRYm4eQ8222X47tTzm5dTH@vger.kernel.org
X-Received: by 2002:a05:6122:d25:b0:56c:ce0b:fecd with SMTP id
 71dfb90a1353d-575e70a7075mr1239716e0c.12.1778678120886; Wed, 13 May 2026
 06:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org> <20260502185557.93061-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:15:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXjwyVk2kuGAJOdPHw=qv_iwO2pSR3Rp+5ayoP2QG25w@mail.gmail.com>
X-Gm-Features: AVHnY4JTrqWXHc77xf-iSrs-bkBREqw0nQKCK-qidhrABbBSLqD0EGxY-SoFw7w
Message-ID: <CAMuHMdUXjwyVk2kuGAJOdPHw=qv_iwO2pSR3Rp+5ayoP2QG25w@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r8a73a4: Implement ZT/ZTR trace clock
 on R-Mobile APE6
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 2 May 2026 at 20:56, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Implement ZT trace bus and ZTR trace clock on the R-Mobile APE6.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

/sys/kernel/debug/clk/clk_summary looks a bit off to me:

    zt                         0       0        0        208000000
    ztr                        0       0        0        277333334

> --- a/drivers/clk/renesas/clk-r8a73a4.c
> +++ b/drivers/clk/renesas/clk-r8a73a4.c
> @@ -43,6 +43,8 @@ static struct div4_clk div4_clks[] = {
>         { "m1", CPG_FRQCRA,  4 },
>         { "m2", CPG_FRQCRA,  0 },
>         { "zx", CPG_FRQCRB, 12 },
> +       { "ztr", CPG_FRQCRB, 16 },

20?

> +       { "zt", CPG_FRQCRB, 12 },

16? (12 is zx, cfr. above).

I.e. the same shifts as on R-Mobile A1.

>         { "zs", CPG_FRQCRB,  8 },
>         { "hp", CPG_FRQCRB,  4 },
>         { NULL, 0, 0 },

After fixing the shifts, I get:

    zt                         0       0        0        277333334
    ztr                        0       0        0        277333334

which looks much better. If you agree, I can fix this while applying.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
