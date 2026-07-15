Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E773D75DC
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106092; cv=none; b=XCWB1I4CkFliwbJL++YUFXS/t7hQYzv37anQ+rDU+keBVzL/tkOq/CVR9nsXd8Puh3EBnPpzX5sz+Pk1P4B0yyj6ob3IcM6Sjz0bKfSjTitP2C0aeBz+YDqvScGZL854Ul28psHXcMvQyScAjLXMtMYYDrdTz/lW83ZiKDn8SAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106092; c=relaxed/simple;
	bh=4D+d1b3Trs/CMs5Bj38QykZaXyZasuM9OpqfOKndXxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPNxA0VcjKhEVnFTdyVwf//Dvmi0wMLYqcUbt4iiG6RoF275yiS0tTHxQBTOIGlvM7eZhxT3n/oOTLjxDXQ8ChxfxDYRZqUoCdggENEBTsRRk0JiCWLOfre9KJiyvy1TcOqt2mVB0Tpu5vdkGT5EgMDlqnEyIbnVksFjsZzP9CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-73a442f7cd3so1214665137.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784106086; x=1784710886;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7NaVzb/e9FWmfB5ARe3x7cY0vDrs37XFuu/XUXFp10g=;
        b=THOHfEn5R9pznyNFYO5I1s2phBYVAI1gSZARLG0Fu486d9xJddG/4deXWvHsy5MK9s
         eVdFxUysZqiRLDJ37zSwXqmcnKDX/o4BQNdNr/1An2HrPRfOVI846k/Axs95tYtRqscH
         CskbbsiZfmVVd8QOc2utXcMs7cIc7dMxS2nzEsXJEehr2f9IuONrgOQd/TMi7X4kzZhQ
         YLoJov/UJtXwl4afsjEFyuiJzg0aDi7dAhsIdjHyRMQQTqmA5tmTvOmTKiEs0dH9D1+N
         l1LGP9l+bnue4OXWqJrC4sSJtZ8aGXvD//WMC11SIwd+vBsjjQ4VhBi1WklkOAxsCe63
         8vNg==
X-Forwarded-Encrypted: i=1; AHgh+RpVPdni4GhRX9SqzUnCmEyMk8z5ywJTLYs9wMYu4G53jRMaO8RcQBaTbc+DpYWCNWx73/75ynZ/c6+u@vger.kernel.org
X-Gm-Message-State: AOJu0YywUxwMQEs1aCmlaPswPSEhhb4W41xVj1KhxH/qnAHH1rbh7uZa
	x/HRLs7iBpVI3qO9QlW0Tq1ylLllNIKC3w0eBJObSM1d5NUiMM8sjHJWi+pafmnHnuA=
X-Gm-Gg: AfdE7cn9W3/w9BLP0uVmz8jiUGzERk1M1f8LzxUcNTNUFuO6MJcN6/UNS/m7ILcbUd6
	Sea096+wP9z+h0kK/re1AnG4cXRFPzVc6SDa0AT1umx0hjte1cRG1G9wduyJQhy/R5a7OaktHZj
	0eZyYKxesrYVuSTOAWMLPiS+6+8VSrTxr6FzF4u42Fqq/wpcWSJTBDEA8lYGDeOrbHTSpPOu/rs
	NMau3FJyPdyazbKXkphg+nldVIItHKcHKRVGIRlKeb5+J3u9rpP+rGgaSBMcTrIm3QVJpXiWau7
	BBHC9Gxn7UN0l3wPSSkPpqToTG/BtUu7SMZdsTWEXYqjDRobHnULnEqn27+ZBk90PjZQjMxwBSD
	U2jPCvNnl7fkOh846kQXmpDQLvcJzzxs7vmqMMtcEZIpLyc3JODT2ALlVSrstdUBIfcjinaJSnS
	7Wv8xejamFJvUUBIw6tX/2qmHGCDsJnldSn1V+JuTqrBcLFGa/Csqs+g==
X-Received: by 2002:a05:6102:441d:b0:737:783d:1912 with SMTP id ada2fe7eead31-74533c40608mr10805714137.12.1784106085761;
        Wed, 15 Jul 2026 02:01:25 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6e38b3bsm11612411137.10.2026.07.15.02.01.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:01:24 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bf9466412fso1141849e0c.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:01:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpQ7Kd+MKLTSboX3EN79XxvYyhcfG7EsV2tc3TXNNmR/t1LI7ELqo8UahlgfIeKGDjBnm3oEMSYjZGz@vger.kernel.org
X-Received: by 2002:a05:6122:787:b0:5a5:3eea:4513 with SMTP id
 71dfb90a1353d-5bfbf34947bmr9390069e0c.12.1784106083256; Wed, 15 Jul 2026
 02:01:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 11:01:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULuz6E+zHt5W9Z9ik05ALSyMz4tkV-mGRTg3Nh=Wx_Hw@mail.gmail.com>
X-Gm-Features: AUfX_mwvtCJ6mQlGxoH1JvfSPfIrIHfInpMsp-NWrZ7U05hkN4A9x-SDsqPOads
Message-ID: <CAMuHMdULuz6E+zHt5W9Z9ik05ALSyMz4tkV-mGRTg3Nh=Wx_Hw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] can: rcar_canfd: Add support for Renesas RZ/G3S
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, biju.das.jz@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Hi,
>
> Series adds CAN support for the Renesas RZ/G3S SoC. Along with it a typo
> fix patch was added on the CAN driver.
>
> Thank you,
> Claudiu
>
> Changes in v3:
> - addressed sashiko review comments

FTR, this doesn't provide any real information.
Fortunately you do list the actual changes in the individual patches ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
