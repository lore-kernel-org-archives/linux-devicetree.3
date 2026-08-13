Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1323443E43
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786611206; cv=none; b=o+D2k7dnfE+oEWyWXQ3A46SBmjfys62Ux/+AOxw4INMjRDsyx2L+rDG9F4mv1Cido7MoQsTg7sdduA0IjcZ7diRkMoQIpYuUcKAIkKKXMiThMCEiD4445b4trMTEAx8ZhyIEhn3Jdk4SZYuXJ9sL9Wks3rjGUVOzoTgT54Jq+uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786611206; c=relaxed/simple;
	bh=R3n/DrlSp03RqjHgGJKI9hAF8mRDHpDvu06ToIv1xVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FvNxiYCnHxRzZ4iPYUg2tlUQYaefl4Pq7ShJO11YASpU9dAjkMO04gg8okMupfLQ2dusbCjitpDqra3MUplIViTR3IPb9dTqVPGcEspSnJBW5B8m5+OhY0isUgxgN3Lhi4Y4l/+/vrTLD6RIv3fbknvtxMeqlBK46AcWFTTjFxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-75609e844faso509092137.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 01:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786611201; x=1787216001;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jo7EGcjbRu+iSuq+kLMqw8b4MED/CzllCFiLFlmmj1o=;
        b=LKZRGYfG21Wtu/zZk3aEvurf7rdvTS6eO68r8rVWLikkbGPu84KJc1AFQhotReWgpX
         6OkMSWHpfCcBYOmvg1WLoa7lQAQuNo60nTGldpfDWGWvektzP1roU14KZoMj7vF6AJ/Q
         Zr1QkIv91hR+qAoKrSlgFGpjgC302Ub/JUzUdr+la6O7nCtPtWxOpK1pvenwk1/zrHYN
         exEjTAMWHNElQOzHsW2H0gYwtnIJGFuRR3tL3HSO4GiBrO7ldzeEPHISx2NsPx8/cu0x
         NOdnIO+I25C8yRUwzf5FHZ63UUe/+p56D8kxUgX+auIGfrps/mKhRrtUNfzCNoP8Zwzt
         L5LA==
X-Forwarded-Encrypted: i=1; AHgh+RokOuWDDa6og/U4xTAP7xmWSwwe7fat2q/62JndyjO8iWwrgasqmKa0Yd/mStOuODmMMv7fF2i5W0VC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn6WD9y5hfY4mImtdDjXTWknuY0JWeNSIDfDWsfBSxkXIkdTRz
	26GhnjCWLQvHkfbrigqv+vsoqbgoElRvKz19+RgcZ2q7agzUJPCdkFB8ME1yx/n2
X-Gm-Gg: AR+sD112JxTxYT6qsMPj6/2QgOogWgrJ78cmcbsJ9qiGNrek4WnkUdW06AvZGC9Rh9G
	lXUaaTbLBduSBRmEPCqnsv8XuVnMQq++HwUEYkpj6OqMt1jWZeqG8fpl6ES+D3bCc1Lbis8ikVF
	/N7hnWheH4O07AI3urUQAmvOTGsnFdEt9qQNGeMtc23Iadz1SYpR4AhT3tEp4bILfrQf3vpCnNu
	8VA9gSRg4qY7bRM56eZaDUHVgfDROEBWyCrX/r2GNUN8Tjvcf3y+k5dRWb5DrRKa/R9IP/9jKFs
	tGTrHY+mKq6OWMaIsVjuSjiocuv9AF7JRR6Pn3jKJh63lq4dYkQiUaQkojkU5DBTy7LNDUz9Izt
	Sf4s62GVwDCLJ9pHtrLzCXLWN3+ZqhhOsZdjL230zWKDW3Ex5ChKswoGFth/7+H2ts4wIQAWM/B
	6hD8+Aw6UDfTFIWv75IXCXKBaqTFccbRG68oI5Tp0271vcSLfPWlpnVkTnfUK03rKjDouwo2/nh
	3T/TKoPs4dA6IH0tBkk478kLiFF09NLQH07
X-Received: by 2002:a05:6102:5698:b0:756:d0c:525a with SMTP id ada2fe7eead31-76dd4eb7a40mr437016137.0.1786611201187;
        Thu, 13 Aug 2026 01:53:21 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76dd32b7483sm756195137.11.2026.08.13.01.53.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 01:53:20 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-977310532a7so549576241.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 01:53:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpNWKwXcxG3vsWU0e+3482I6hx9DXEo7BZorxwsOcqK0bdPO3s9c56wdYbOHP+hNJPKK2gM/KXW/nvJ@vger.kernel.org
X-Received: by 2002:a05:6102:222b:b0:760:d86:a64a with SMTP id
 ada2fe7eead31-76dd156e2eamr407635137.4.1786611200686; Thu, 13 Aug 2026
 01:53:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604151855.307772-1-biju.das.jz@bp.renesas.com> <20260604151855.307772-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260604151855.307772-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 10:53:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXp_hPXGVH1ijiYGQ8gxhP8CBYt_T0-ixbFH7eNXRSjiA@mail.gmail.com>
X-Gm-Features: AUfX_mzGTfwgWLWA-7ELC6UmHJrg7VZ1gOYWOwDD70xY-8p9DWArpZ3fHYq9ckw
Message-ID: <CAMuHMdXp_hPXGVH1ijiYGQ8gxhP8CBYt_T0-ixbFH7eNXRSjiA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable Mali-G31
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jun 2026 at 17:26, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable the Mali-G31 (GPU) node on the RZ/G3L SMARC SoM board.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
