Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ABE2DB78B
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 13:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527073; cv=none; b=FEnAlsW/q8ciTPwzMWjH4InxLuMYo3F/Jo91slJWStnwNe4PSHEZqmSoG2j+RU750XdtIhNuyLq+qo6f5LtNyeM24olrSjZR8ma4bwS+A1rfDRiThPMGjKbBLqHdF/vuS7f/MiwIIzbHi8ZA+NYx7Pz5q90xX75RvWxswX3YCxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527073; c=relaxed/simple;
	bh=9mJVt4xvBv9yC09DSm77QIgsToCU4Uam8KTiXBNT49E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OdJJwaWx1LR0WK4QLgPrgxBuAyd4d426ruh0hgYq5R+WqyX3a9Dub27hDE6+mpUS+lpTGbddG8D3fJMUNIx8OCZLZaIb2aNCFcbvs3HlsU+csHaSwMdlNJGaW8Lz4WGmvCRzWSK9HFLXstLYJXpCmiKXsBhUiuMRocF0z71kGCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c7d4c663e9so804732e0c.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527070; x=1789131870;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xbgZlApvTu/xPQjUHtGMt43abYTF4MBtnYGRCX+MfE0=;
        b=krnyKgV49Let2vCqSNHhxxVR5BFmwg1FgmPs1fF48q4kLDspyNQB1HO0HaJG/Q+d2u
         iMAW2k/H9vi/iHPt2I5C6W2mlqajk707gd3CBehs23ke5FWDSNVnFe6lSnu5Tv0A0XL+
         yQl0zk968/Ve0KgO8SwXolhOlZzmaZNSNv9Rhiswot0tb52rJ2ewFia0CqrmlN2tkK7r
         iATWZ1RthTUAQIhFfny3JrLuo+s9ZtQ/hfZ1qd0R9CYhiXkLoDVV5aeaqq8WTQLxxMFO
         C5G7qdzXxmu9Aewb+vOkvJZNIgqXWe4+jpjMCUIiIh4wzsP4wMl2AE2g+JBAKalL4bmI
         qT5g==
X-Forwarded-Encrypted: i=1; AKwUvBzMUqmVPWi8izR0GRGaOC4MOGWoGMNfgTik4LM/e3+utpcfTqyzvKF1hLshvdlw0WPqc0IvzmE65LP8@vger.kernel.org
X-Gm-Message-State: AFuF++mblzrk8vYCNc+jfFwBDkh+UeDcWlHtNAHhwApVKqV5YV4UgiD0
	wVUmGfjgFlRI9/zdasFQ7RS8lAG6TZDzBZquLSZl66hoQVbaFid2BthiEbBCKm91b48=
X-Gm-Gg: AYBFou2UtapbD/U8MRWpc/6dHHrG8aCdYql9kPAZhQ4Mks5ZhQUv5VDeHBmuFdCahgi
	pg2wjatZMRM72at8kTpKAycrEq4RWtXe8suL4umTdU711TZL91hdTqhb9NZ3Bgsr+O+0LKh/tQC
	nL28AcBtZTqca2Ps8bTf7cggiDJc/D1cQuxCUUJVdz/FictOwj57e7SL+k+kZ6+QQD6+jX8/blV
	AVn6L/ABdenJ2IKY9yycZnGdLG92Qt4i4MIneK95QDEWj+ObuYYLoKLTrP+S9U6QXtN4dzCUs8Q
	L4I+gqG7bjFDssoTEdw2vuYu0tTfwJXTF0PoLhY5bHNvtViHCP4f0o7OJev6+aUwFRgSUVkS0ZD
	1R76qP1tyTiVOAebIMqMy5PaSvGG/5LCuw2GUp0eEDlLpqGUD/+LSosBv5JypEEHKCQMsqxctwI
	l38+SmU/0N/AYA+fakTUxS3yHqEwfaN8wVaFtgGWr0OnI6Dz0UgOtesCcMaofKaQzFcngHHQsXm
	EzeumegYb7ZNBbpdLVBdPJehyYwaw==
X-Received: by 2002:ac5:c7a4:0:b0:5c1:47db:cfcb with SMTP id 71dfb90a1353d-5c7ed7960ffmr1946196e0c.4.1788527070123;
        Fri, 04 Sep 2026 06:04:30 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec25b9casm1974659e0c.11.2026.09.04.06.04.28
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:04:29 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c7d65c83feso864129e0c.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:04:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByMS6CwhspgiwY7jsH1Rr2vdtxOOvFu9tIxTez3Wen1fxyz6ZWe+b24DGbsiTVF+Ji5/OTxrq2sXmrM@vger.kernel.org
X-Received: by 2002:a05:6122:c8f:b0:5c6:4bab:4cb2 with SMTP id
 71dfb90a1353d-5c7ed80403dmr2539951e0c.6.1788527068555; Fri, 04 Sep 2026
 06:04:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-3-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-3-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:04:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtXaOxC2Ttw4EBtTY9JqUxjL9X6M4WhCOc8C69qw21aA@mail.gmail.com>
X-Gm-Features: AcwNN1UNaplc4sWg2bdo_z4KydBn92WTMZ--tFNfKKtuA-7QPoR1X6zMCgLV3PY
Message-ID: <CAMuHMdUtXaOxC2Ttw4EBtTY9JqUxjL9X6M4WhCOc8C69qw21aA@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] pinctrl: renesas: rzg2l: Drop defines present in
 struct rzg2l_hwcfg
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 14:54, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Drop the QSPI and OTHER_POC register defines, which are SoC specific and
> accessible through struct rzg2l_hwcfg::{qspi, other_poc}. While at it
> move the assignement of rzg2l_hwcfg->regs->qspi upper to have the
> initializations as sorted (by offsets) as possible.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
