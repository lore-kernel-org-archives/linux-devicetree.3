Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A96D3C65F4
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 10:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148528; cv=none; b=O/SK9lHhJHcXUq3vkT2iHTAdJqgUUDOEL4lAURtkHnKl4DKX0cpp9qrE54X9Bb3OQ1rhYG26trjvBo27dTmHH7c+gviv+tCS75yLQ3V15eBvcxdAmV2/gBF/RCd+2YiAZIZT4g6yH3ryGSXUShv+wr8t8p/N5Qsfti9LGy37I8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148528; c=relaxed/simple;
	bh=kXQspXREuqyEYdjGDjyEBdOTtNmhzbYs7oU0PJZ6TYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2knELEiJQRwrjkqfv1AoCpjPw6wSr8sVVDHtqt/JaK4TELxDtBSCTYVQXwz6Y0AoetUOOFdpE3oAMfD+jnqRG/msulV/lqFSHGTGCuIeDDF7X/Vn9bmRkQwsJyFfCbJKdp0ajFIEwm5/AnZ/1i3SY8wiVdwP6795krdHWRlR6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-610aadb2d9fso192135137.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 03:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148526; x=1778753326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeAWFjgKNZgewmf7+VpB3j6D3JVvBcCkVJPHWNsKgvo=;
        b=ZKud0xhOjbXWIuXFSYphAF46ylVkBjwFi3jgeWtEPrmMWtCQ0UmyAzujGbKbZdPP/w
         X2Bx/uB54NsTSrLlYLsixig0bH4YWWUaOB+qz/EtDZfC3lZ0LQOqplkP2iese/0KBLFN
         JALXIAQOf1sDdLO1NmlT8in4qZOCiKVsCx/3RdbwhNNLWcxhgvyaTey/YdLMSQRA9TIF
         qoG1RUmfroQxCIE6QtyxpZABL+7X1l5p4u+ZsDRuytXocku6ujoNSq87yi9kWfo9qYFK
         WleAiG19nHlPFMkccc797QfKRR43OqSjGd1XQWqRHx0btISuRvoThCM5BB3/6w8u9MU8
         jfIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/538q3PMMgnvW/Iov239tCYihcgGQTk7AgucNS6RPJzSPpAIHiwC/6KEvKkbFT0j2/9nJbcQ2ymjby@vger.kernel.org
X-Gm-Message-State: AOJu0YzCanRBUTPn7My49l2KFDbV7WSk8f8RtojTsJ3LankB3+JpRN7Q
	DOiEJ+UZi9ReYPNM4dVYQPgfMldEigv04AW/dbCSHcyVzK9RHcBo8vAOlLa1yqKBCT8=
X-Gm-Gg: AeBDievcwMDDrAuqEhFLDDP9+bA4/fb6YDxzzqHnP9200CZrbvJrYW4iDNFeN5rXExl
	J7WbHGe1B29vZ+YtTiQmKZqqzGJ/rkdFkPlO7Vy2k486ZQjh3rMAFw/4CsJfSS9jQf/VJt+Zp/w
	hxDirlGfI2+BKHIdn/pmAD7AG7uTxufgrGhkLJY+/Io5iGp5W3n1ALkw0rvUz1KwwhcFz9MBF8E
	bo+b7gtycGt/oTR3LJyPiS59Nc7FmZwpiiOnm7sAwy9XWuWUeXv+ReooPEm8mJh4GMsFh5bj2pe
	kWzrfEWb+RV/W1vlqwe4gIUB0dWmFi/ym0xNBT/Ht1Gi1pZe8I47b2YfgI8FZz5hpHI/a84PRJw
	JXjM9vmIJhol0lngYlW9lmqgQdxMx4vqn5Td6njQPJGz2IJiic0vkzTuT64/lTrvQt7MDmNcCt6
	9MKO2QdUNMk77Gho1v+wCANAEZuAlbCpyZunnBC5neFNUR2+uSo69ZUJ4SGTMhrbk5JFsnv6vh4
	X4=
X-Received: by 2002:a05:6102:149c:b0:612:83d1:1f70 with SMTP id ada2fe7eead31-630f919e930mr2750585137.18.1778148526350;
        Thu, 07 May 2026 03:08:46 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce08efbcesm11017674241.4.2026.05.07.03.08.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 03:08:46 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-575602688deso204813e0c.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 03:08:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8QX5B2rkCtQlzcewLR4o9lSPH26gHWIFZbgnJ8mPjcusRrauMV+nnXup+beCu6fBZW2SgBgX5kPP8J@vger.kernel.org
X-Received: by 2002:a05:6122:3120:b0:56a:f979:a9d1 with SMTP id
 71dfb90a1353d-575593b5a40mr3891168e0c.1.1778148525853; Thu, 07 May 2026
 03:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com> <20260430125342.439755-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430125342.439755-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 12:08:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7J1VL6KFTt0M3UO_NFmBDnfggi=mSg58svPnRC+Psfw@mail.gmail.com>
X-Gm-Features: AVHnY4LpmaWS7LXimKPU_njn3ObmYrciwAw7lzjhzA4sY9Hm32MrRpd2gzDNZgY
Message-ID: <CAMuHMdW7J1VL6KFTt0M3UO_NFmBDnfggi=mSg58svPnRC+Psfw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2026 at 14:53, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add device node for SCIF0 pincontrol.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Renamed SCIF_{RXD,TXD} -> SCIF0_{RXD,TXD} pins.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
