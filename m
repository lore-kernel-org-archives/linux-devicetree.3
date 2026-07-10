Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EB83B634E
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678745; cv=none; b=BKbfZADWqKqt2yfbEllTYhaSY5obBLY5MMEgXWBU1t+Slq+Fomasm5j+XE9YaXzU7gASKbyo0CCrdFtQ9aFRrTzAU3DAG0rJJncmtF2WQ4n1euknOWqLOwVTZY9FjOJ1463DCL1lTzTC40klVuUylD/EzCV0jTbIhnZMVRhM7kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678745; c=relaxed/simple;
	bh=+p5C07PlzwAnFV8W7DMxCM+4XlX762Bvt4U2R/azgio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CI+M85g74h20s1uyayRhqblmk8QNV8PIi2s7G+BWR0oMbTd0oqn495IqSVji38NnKuO+aVykbj1tTypTCwrqpUEYO18P/p0zqDa9YSs4ZQ03w//CX1X0HHuhw1wcIeLhqswOvO/WRJIz0n51y+Ilcz6Pyl7GKkhV8J1QEBJYU1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-96925a563b5so617423241.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 03:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678743; x=1784283543;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bwp9IGUDjgmX3mBabgZGirsEvY8TKRimZIn+QIFNSvc=;
        b=K4L3OKoFZb8ZbpGsCOgdwNrBfbKln7BpeY0DdWo9UUoCEhsuPl7e35+y3OZ1J4JdwX
         f6CD+QuSG6NU5zUeMq4lJXEIaLGKKtHB4JULeAd4gTfk0BByrqQrjXDJYQuSk5NvIzR8
         72nFMHIbtbuayEJlF+NLH8It+Bs2/MhX4IQQCHOaVaxdkSf1V4JwprByBM2OHWzkox2j
         8HDs049GIZ/Fo4Rt9uuXvXuxTQMf8siJ1IllJ18Gf65A5VSJX73oDiUhjLD5BZOOHsJl
         PS5CEONDbDIf9tKTFcgd75UPOrbVsyxP2U2Tp9f1zHJw5LZAez/mlx16gSlONQOSkBTL
         DUDA==
X-Forwarded-Encrypted: i=1; AHgh+RoA2uk6+/r+0JuQD1dVu58WCTG7Aor9qswjpCWGS1qIBlqKSJBoZbv6j3C/cJ+wepleyuM5dNK5deQM@vger.kernel.org
X-Gm-Message-State: AOJu0YzkP2zsoOzDVaiitXIAtrWTxjV9kYFe+oAz/3un6E0xIHZrVUgr
	K9Yo+NhkstGz6n4tBZz4YlNQp+KzwFgTOmHiSroy3iY/ZXJhzuESJP/6P54aswRSNuo=
X-Gm-Gg: AfdE7cnsfaK1wXbKCz6M6mwt16bg6iGBVEL0ikhQyDh9AFcvdJJZm2jOVA6ZAjub+B6
	mJKeu8rvwRDyeSxxMhZWjCzuMS1DZlzmugcwhYJE2Cpl7Ee+BpipMM2ZGTb/vocgtzCb+BAWXOM
	xssR9FLFp5zzmAkVKpMLSUq5uyGbjKlT0BpJ4iB17BKYbRonFg3DX57cYHIU+CyRxPvWrMuw94o
	nMvToZRvbU0+/Bgoe4l6exTK6dLs/Kf5lvdLJ2B4t2ih4nVn9c3Qt6v1F68EiVpgZFJqWc44MH4
	WXSNYp1fefceg6fuZ2mzqwmZTklz3PVCETzqTIjtvbek66O3cI6BM9oirP+2YUGQDm081sKFvu6
	k8qJDsMVJ+mABhnrahqSU7jiUBGn9Y7r3wloVFqlSOX16qI5T9h1vpVCeZ8w4kmPiatXG30ASP1
	zvqdz4TggBNjqtRdISd0WWURZdtifb3+LwnN1jJyGJWav1zK5qLFUAtA==
X-Received: by 2002:a05:6102:5a86:b0:631:4385:15cc with SMTP id ada2fe7eead31-7450d017b12mr1631923137.1.1783678743383;
        Fri, 10 Jul 2026 03:19:03 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6e38b3bsm4953864137.10.2026.07.10.03.19.03
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:19:03 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so350559e0c.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 03:19:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RprafdpvoGTmkHwXk0sVEWhvLb2mrnX19f5SQmbyuZcBVYlfXxVY602xyQAPAMXBHvC4koU3ZwAf4LL@vger.kernel.org
X-Received: by 2002:a05:6102:8516:20b0:6cc:e6b1:7f84 with SMTP id
 ada2fe7eead31-7450caa467fmr935740137.17.1783678743107; Fri, 10 Jul 2026
 03:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709182332.876408-1-claudiu.beznea+renesas@tuxon.dev> <20260709182332.876408-2-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260709182332.876408-2-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 12:18:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGKQAuLJ-Vo7=O8E=kMCYiUZ2H=Be9T3PAkjHu+PRqhQ@mail.gmail.com>
X-Gm-Features: AUfX_mx3pB3dkKwbzFAKhxG_in4zcQzaeWH0J8kav2JP2BfBiNLW4WLUquaQ4F0
Message-ID: <CAMuHMdUGKQAuLJ-Vo7=O8E=kMCYiUZ2H=Be9T3PAkjHu+PRqhQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] clk: r9a08g045-cpg: Add clocks and resets for CAN-FD
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, claudiu.beznea.uj@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Thu, 9 Jul 2026 at 20:23, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Renesas RZ/G3S SoC has a CAN-FD IP. Add clocks and resets for it.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - used R9A08G045_CLK_P4 ID for P4 clock
> - still collected the tags; Biju, Geert, please let me know if you consider
>   otherwise

Thanks, will queue this one instead of v1 in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
