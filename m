Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFABA48C8C4
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635478; cv=none; b=L3irMuhertn4+0Pha58+CcorwN+onYZVPEt9roXW1W9SNy3MQ/1qdLb5VPAQwHZLZKExriy9g3vY3Y4cGaOenVHJ8cHIpBAjlKYxrSDyka91sYOkxGU7WiFjTH9AA4AZwqyCIbEi0JZIG7/Xr160Cz0k4cqC7MYXucmCxJsHidU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635478; c=relaxed/simple;
	bh=jUutJajjNc7Hw1icO/JaEhCU11F1Np3J+BomYvLKJJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHH4vHFFgABviYMAKBqDV9+KuzVh50cyCNG0tLxmJL7GS/e5BNZEnqey2NsRb9TQRING/YsM1zyqZOwnVurR5W0AfoJ/eXR6+prSh9Tx6GDzJM82pWA4NfLORI99gLuC66EnjVJReuT6U86NpC3j8uxvb+XZ2zTxF/FURvPqtJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2020421077so8865666b.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635468; x=1787240268;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sFyxVjuWrWrBIq8VPvjLqFOlB0PwiULnnhP6Fa2htiM=;
        b=AAOiQ1q0iMIlAm+mvH6NYzre9PJfeAtpYW1RPJL+lQoVTArBM4Y3yL7Cfa5zwvNjdb
         hiowIKyztvE24uovFZWwslY+FuwztxMM7OammkKBOsLRyFPIN1qzJzf8aMqkIM2Oc9l5
         Tm16NMgETflZcuxxYd1xJer4LRkb6A7nmcKK0EZ6ueac7FfxxDit62fX2KvgQX9KcK27
         GkUqSooRwOD2vHmm7vElSbkyins89iBj2XiHUVvXKvkclREwfZ8Q/QMI+kqJqv/2PbxL
         9YmNmKopOkGGsu0sOdqaduleZHspVshQWImkMQfqwmSwNEXskXlAujGITKB7OxAosBrB
         eY+w==
X-Forwarded-Encrypted: i=1; AHgh+RrNx15zZZ7QXJgRV4gznNWlCK1Qiwn5tw3iPIZtQUUq/oOrInyzCBy9hsKBH6VlqRvLyzis2QO/NgCO@vger.kernel.org
X-Gm-Message-State: AOJu0YwgFTwfYrfdsKKWA0Mx1sGLNm4YMHy0yUVOtGTO3iUR4v5Zk4AU
	VS/UPfuZajdsydxPKh2JV7g3Ss6UpaGtXiyAuNBGuDLym20wjTu3ARzoDVrHuj0s2PE=
X-Gm-Gg: AR+sD11YYtMXbpry7yd7NVkYDCdrPYJGumRitaPwymiST5zOnBcn6oOdKDgg5MdSN2v
	d+AEtsqYAbtUu3GoG6S3Tljq2WqKFCgailHdQilSUqvlCepLqbfRRjxrM/QMyXdoP1QHRqyHiZd
	2UvDwn7GTJeQOh85hISBVHRiZCUlw7AyxwjjMf4A52XBzZ46ybpALmmWsufprhYMog8SgkmDRYX
	16N4CaxHEW2+fkC73i8HP9lQL5I+qPh9P+zVGAV5t091niS2oI0TYja7fOMpk34OnaU7fGklV9+
	8EIZhOIix3LoEGCfKlKYie6krf2vXk40tO+shw9XRGARV1ZwEwivybXxzBx3z07sdhgGJfHbvwv
	Q+yKaqgmlnzi7Fg0Ph+H50+GkKkBMeHhnm6wBySlgU3DrqlYw/IYciJRL0Onyv9US/0Q5XUdw00
	fGnbYfl2Wjfohl+lNiBPH7fdZgNHz06khvowh5X4ceSMhz9Se6700tXwB2AyHcTpl/WZX+GvMUz
	GUjPx60tK1QW2nHQhLZSBylHQ==
X-Received: by 2002:a17:907:d0f:b0:c16:66dc:3ab7 with SMTP id a640c23a62f3a-c2108f21e3fmr340422466b.10.1786635467818;
        Thu, 13 Aug 2026 08:37:47 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2123821bfasm6683166b.51.2026.08.13.08.37.43
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 08:37:43 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so1473693a12.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:37:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpeYLydlmexGyAsNwYWsSPY5vH8ZLxs8mWiQCtA+IH5icuIqexJ7gBVeaOUH5kXNru2Z4D3jtP+o7S2@vger.kernel.org
X-Received: by 2002:a05:6402:e0b:b0:698:8847:e2f8 with SMTP id
 4fb4d7f45d1cf-6a38060c289mr3514415a12.15.1786635463470; Thu, 13 Aug 2026
 08:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev> <20260710113637.1328000-3-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260710113637.1328000-3-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 17:37:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXiC6P4e823DQ+d8AVtkF2odC4u=0yKbhzbYOAZ0so3FA@mail.gmail.com>
X-Gm-Features: AUfX_mw9Lq34HFTp79cv_PvTry14Uxpoge8iTcoUGFPvOqN3X9bgBAm5PI-yr1U
Message-ID: <CAMuHMdXiC6P4e823DQ+d8AVtkF2odC4u=0yKbhzbYOAZ0so3FA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] pinctrl: renesas: rzg2l: Drop defines present in
 struct rzg2l_hwcfg
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jul 2026 at 13:36, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Drop the QSPI and OTHER_POC register defines, which are SoC specific and
> accessible through struct rzg2l_hwcfg::{qspi, other_poc}. While at it
> move the assignement of rzg2l_hwcfg->regs->qspi upper to have the
> initializations as sorted (by offsets) as possible.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
