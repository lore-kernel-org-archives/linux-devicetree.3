Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AAE3812EA
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 08:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780216620; cv=none; b=hyW44KURQPmpbJCxdWviNmUktPZ8ohRi/csJSPI7ZmgffnqCq2S0EdPf3f4c98VO2co42blv4aAg6tZ8cf8CdpKHtynl9sD3clL8yTBAlC7szzmcY0StMvJnVAgxnbJYhLuuDfbD33dlxMTGNS3QY2EKW9WdSNX9SVQauap/c0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780216620; c=relaxed/simple;
	bh=VRoCK7u4CxDAaDhSmUkIbsYdQb82r8KYQ5s/yqVlez0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lfLTP/2chn97WF5MtvEzqDcglgCkW9GfJYOpgU9Oz2nB12OyO2vaG6LmMpkBpjbaIaU7vgMfjiqJl0PjarmrPIHbhAVT16O4neI5Hm4fRymTpPZj2dZNl2cGha0zMuNX0D1pvnXaZMmB6AyZgLUh2GmTWMt8fvBfj2puWapMWxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-96393ce9a8aso1968930241.0
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 01:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780216618; x=1780821418;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBvM2ORohpXQB4d5IQuHmDJKKy3F6iaCOKJvYc8ytZg=;
        b=Q6axg2Xm0SzRBLk0d+jw0OTaphtgxNKanpHFZIVLHew4bGI3JjLzSXe0UNu6e6ej1J
         h9przpUh0A2iVsWJeivwTYHJ3t0B8uOIirmffqa3i+XefiQWBuJo4o9986RdlrWHgux1
         3/6uhCU9hEXFKgKCABGAtn+5fyko4C04TFe9spFYnk6QV9+OLavj8OSFoN0FOVet4Krd
         Z/RwMW7pzkfLv8BL+B0UIueTuBOgQw8QiX9KRJ1XueU/M9MZzdAj6ddYeA+l6bGwHyS0
         cjv3Sy2cmVMGpSjzF6cMwN4sWA+pIDg/An8wgDL1mxgb1rIDBUfHboFZLPEQX4yylyDB
         YCdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Azi6r6eHKTln0QYcC3GfzjcB7GImDRuVDhIAdH+UkgbXhTIe6esJL82Nldry1BgdBZ/RIb8k18MeT@vger.kernel.org
X-Gm-Message-State: AOJu0YzRWYu2loVcRDlaMgJ7QjAEz5BR52fuGHbGmLjIjzZqvu1g71ov
	S/SQYJS/qy1WdivuLhw3j6s7tImrUA88luKqFd2G8z+c2OKbuZq6piIWLalqCUAj
X-Gm-Gg: Acq92OHaUxdf86Byvesjtk6vgD32+eCSGOv0LwbcAfRf1zwGjqy11Pyzgsgf0PKBZrb
	TFgiYbn9Uq+uVoHZIjMNmqFF88VrPYccR/7qyMyc8vRkvBN0Au9YRvqiXSleiQ8WuK5/UZEljgM
	nyADaarom/bHLQZWNTQyDKd2Yc98Bv6OO1d5zvzs/GGAZzk8zHl1P1/ZyZgguaKhG3DZv3AijkO
	kEay4YT4b877FOygHfRlqbEdobkTyMuxElhwEW80c3034qeXudPIkEJh3EB+Z1GE+hFHGU//pAx
	j9TcfRBRDJGmOPv1RJ7DHlw62EwKdnAGw0Vjr/PboxMP7habG5WD6Z85qcwYcUqgsZNcc3vaQr7
	koXKLnhiWo81p82BaROab7pHaTJ7qKzyYJuNyPbfKoKag0GTywA1z0ODN8hRwEIJIYx/rIpUsfc
	Enq8mWFy3cpb3S7G7janbhTEGPhyYDLl+aWC/2ow7c+HGrxlT1+HgmyWJ55wJU4ZUO6MTzut0=
X-Received: by 2002:a05:6102:5344:b0:631:2973:5c2c with SMTP id ada2fe7eead31-6c693648008mr2334808137.21.1780216618312;
        Sun, 31 May 2026 01:36:58 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963aba5f57csm4039215241.4.2026.05.31.01.36.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 01:36:57 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6c5a522d648so1279276137.2
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 01:36:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+SkTX6z9LuR8jaIwAJUC8CRZCXjv4hr6nokCrDRawaPjm9Qm9Q0/aHUGnN7FwNHnTYsZ/C9guELpuq@vger.kernel.org
X-Received: by 2002:a05:6102:5344:b0:631:4cda:3ebb with SMTP id
 ada2fe7eead31-6c693a257bfmr2158834137.24.1780216616348; Sun, 31 May 2026
 01:36:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
 <20260504144534.43745-4-marek.vasut+renesas@mailbox.org> <CAMuHMdWdqDpU+AZrwz5ccbZPjJfp5DspoVscYi=Q+w-nniuuCQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWdqDpU+AZrwz5ccbZPjJfp5DspoVscYi=Q+w-nniuuCQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 31 May 2026 10:36:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcmFz0vr+YadbKOy111PgDFYCm6kgRMWjKxyNj4mxbWg@mail.gmail.com>
X-Gm-Features: AVHnY4JIRr68RiPmOxbgFI01Y083MJgBCtNRl2Ceai1FVE5g6dLCk5lLsnDcPaA
Message-ID: <CAMuHMdVcmFz0vr+YadbKOy111PgDFYCm6kgRMWjKxyNj4mxbWg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: clock: cs2000-cp: document CS2500
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 May 2026 at 12:19, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 4 May 2026 at 16:46, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > Document backward compatibility support for CS2500 chip, which
> > is a drop-in replacement for CS2000 chip.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
