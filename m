Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34C43AD53B
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135036; cv=none; b=V6PtbiAO61o4UzwnCfEZaAL9hO8uc6OBKS70xsCVTffvKyh6GQ127nQVQRL3Ztbnm0Rl5t7NmCKoxu8+EP7y/SOtbctXhFEShybB1foQiPA9P3ecsVn6mNeaXUnfy/Dgbr6Bw/tb9ZKFuGP7/f0zKn2+3e0NRCZbuj4FV7TVWLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135036; c=relaxed/simple;
	bh=vzLRtnv22ER0/UohF++cnZhpzbMw45oj9pfL63dLXr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PVAfmTnEetnlp8rJU7D00seC5ih5eqyewGF1DTxxke5UjLfqswNKQMxM057OipG4vi9nxxFT4qaW9NYwXnwuusyP8ee8mI0SP7PfUR45I3oEPRN/dvw1RoE0PB3Zuo/nrqbuLaJx2g2EluJKw6e470IPYtGBc7BgGG5EVPJ3GAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c07d76ffd0fso423790666b.0
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782135032; x=1782739832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2I4psQ/SeYFsD2MIipH2FieIrt9XHXfl8UEpdC8jGo=;
        b=m2kVhBANiMDK0qbpLvz+hinjvzszBFSYjNPJHligs//d7WCLnxoU713Zwh2R6/G31c
         P2/vElNpAndFX7TlkhrjNRYkmgz0y+8IEKU5S4/2WmGWYsLApSt+4ww69KilVCaQWZr0
         d48/jLXnK3ybxOXs4+p9oUEgXv0hSlGtVcJyPfF8bNIz+CbUm3ucbsXkAC911MCcgcKj
         V2MhEaczJJY8TE9q5efOk8otJdwwicgh+e6qbbooqL+qL259yjl+80uY+sA4qB1NrIhn
         iD49pc7ohzg025nZqNnJUH5f/ybOZbUwKy2MJ4gPIx+2/7juF6A+wyz7mfbUlQ++zQgg
         cZMw==
X-Forwarded-Encrypted: i=1; AFNElJ9xY6F6In7OweRbYX7BjEshlhUcx9Fr1TcWTi3rdYe4mctG9RndfYBalOhxhzrZKQPobwJHyQAwlbPy@vger.kernel.org
X-Gm-Message-State: AOJu0YwbCmA0OAyK6atwZKxZYPcOcqC7MQ6kR+nJUwVWxNsTZQDU0Mws
	WXcOS1aR5NRrO4A43H24MWs42K71FzvlfJ3Jf0Iz4NzI7IRti3bQbFH0iyIxBEo3Jr4=
X-Gm-Gg: AfdE7cl8L1D8/GwodhUhbPHh5S9iqbeFBEomRKrPRkHfqoVbogIWOOtHrR8ObjR2cBu
	V+l+rFgbz38oVgp/mGY2xvQoTym7k22ozRVunhP5cWcmqBTRL+TEJUMX6/JN5YRt6+b1OYGW6ke
	hA84GvH0f3GR4KmfuC4t1HUc49wkrK5mCoClsoLjsphCaQ1ElFTVNnuB+VHyWaKdvzdJJY4IkCt
	O2E8eMKOQNAvaytFa7sKnbLt4B4TI/FeztAN7a1tZOrjsy8HYP55N6o4uOY5dK8U9QunrtWbHn/
	pddZMU47Z8WW1Bx1aBcB56W8QicVGmy+XOK54hW3ou3n2pIIaU9KiK8p/5kfpEMGnsRLJ5OroIM
	rs+llB5rHr5W8cypNhIFLH9dkN+3n4MblEUy08ZBzZVnJRelm1nr3xvRlOGDuWI4BRnql65+LDr
	7e4mKOcC/sjc2cPQWoEH4fb6uZ4yiUHt18YQ85GO+3zhxin6Xe0w==
X-Received: by 2002:a17:907:e916:b0:c00:de33:a74f with SMTP id a640c23a62f3a-c0b743b12d2mr654771666b.25.1782135030786;
        Mon, 22 Jun 2026 06:30:30 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e498807sm350830866b.1.2026.06.22.06.30.27
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:30:29 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-693c51a8a19so6602078a12.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:30:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/50IOe0ufZFTiWRbwy/P1+xiBUkjsfUtNFVcZlT2FJUaWgVMIIv+cpAA4ROJQr0hNH8lJJ4O1DITqu@vger.kernel.org
X-Received: by 2002:a05:6402:3819:b0:696:759e:1c78 with SMTP id
 4fb4d7f45d1cf-697568758e9mr5777653a12.13.1782135027554; Mon, 22 Jun 2026
 06:30:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619083951.3777556-1-john.madieu.xa@bp.renesas.com> <20260619083951.3777556-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260619083951.3777556-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:30:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOSPmfbOf-BukgVX8E9wDV86Pyq0Tvy7nFrHfCY6wVdA@mail.gmail.com>
X-Gm-Features: AVVi8CcZ4z2limMP1SVfMoz2DZk0QXMVfO_Dh1mo06V_qNFIYC2QivU0_Ycz6e4
Message-ID: <CAMuHMdXOSPmfbOf-BukgVX8E9wDV86Pyq0Tvy7nFrHfCY6wVdA@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] arm64: dts: renesas: rzg3e-smarc-som: add audio
 pinmux definitions
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	john.madieu@gmail.com, biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 10:41, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add pinmux definitions for SSI3/SSI4 audio interface on RZ/G3E SMARC SoM:
>
> - sound_clk_pins: AUDIO_CLKB and AUDIO_CLKC clock outputs
> - sound_pins: SSI3_SCK, SSI3_WS, SSI3_SDATA (playback) and
>   SSI4_SDATA (capture)
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
>
> v6: No changes.
> v5:
>  - Rename the sound_clk / sound pinctrl node names to use hyphens
>    instead of underscores.
>  - Sort the sound pinmux entries by GPIO number.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
