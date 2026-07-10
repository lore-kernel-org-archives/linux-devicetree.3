Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFF54192FE
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 11:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683350; cv=none; b=hCCHy1fBylddw6FJYKMdzgjKiiDjJPpx1GgQct3rtcYTGZuhTFIfsPmw5yc94fJbEv+/e8JL1E3LuluCXljUusEWOtuOJgBSI1V8XKoxXoK/w6/IV0kjJ+TEHykaYOWDoPr82FUNbW6naSHWMXGYFfbpy2UVn5IuQxrzpiCmIws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683350; c=relaxed/simple;
	bh=4pksEl7hMLsBYG9ZkoLxK/BecZCy0PswewcYkqaTKsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdNLYEL1SWNe+rw/xIdmvOKAF553Pkgi7bUs9yV2crKi9iCZwYxhCIzTPEx5+pQQaMBTVDFL+K1a5vnA8nOxj/JNpSY1xW3b0929bo8C9I/q3AZpwUNizhJ9LPyeeatNUEYxetSvwwl0zyTPxKYzBz85QrjYHk4d4or7mSowE0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-736eec08c43so709945137.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 04:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783683341; x=1784288141;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OJD6tiSjIPreQ8N2oNzf0qaDxzfObFILUs5bMv8F2lc=;
        b=k+84EfhvP8rsRdguTuBOZo7Tln3pmidOLfDznV/KHeevR0rl+l5fO73gefPqWMJP/6
         qQlD+qg57MJzZTqAk/XXsY+k1WatNyXUFrwUw/2OFWow2ugX1ThuOE3TBwz91s0Qarz8
         ioPTwa+LeFKEAnid0wpewLfEUtg87L/Yhg/tu0gM/J036ii3esjmAKtFgMR9aB2FGRUN
         whXVB1SICbOquSiU+5V42XEu74IjcBHC+2sdHedFz8zbSXXJouD6fidGye3tXq+I8lup
         WkU9AVL7L3cTO8psxVBgszMGbhALWxF6nQRiNxVxagSPB4bn1CzupoWplq4wbCUIAoS/
         rgHA==
X-Forwarded-Encrypted: i=1; AHgh+Rpkxp6LJnOgXbo4EAogkeb+ZPQhLDwbC1RCyK5F8P/Ddl42afDHT5lDEdT13r1gc1K9AM0tiXDrkcmx@vger.kernel.org
X-Gm-Message-State: AOJu0YwEl9wA6CZEnSHVKBmP3OmoaQNp7xTBrkmcK5yNTUA+HCbdAGHL
	l9r4UhZLrC9Hsne2TQBZ/wAWN6SU8KQ/KgT7M7VhR96jOPoh8pYB70o6F7i/LsbcL/w=
X-Gm-Gg: AfdE7ckM5P5NmF3dwdHmsSmNK3xVdY0Q9lG3i5ZshHsT3scY7/on1AS5h4shQNLMZQQ
	bWLUftxocbnmjqkLUBPVpGqeQKFt8d9zrSiEmUmCiadS+3vKO8hGB377KMAqaesLQZluAiVo8f+
	m8BjJwAmNTUca4RKhxbxgpJ28N+JhKo3hgm0wtWifSkOt58RpBt2NUAFH9SfIA5g24jH9XxVtts
	gGnjXtUpYAMIIoaLpcg8ovmS1KumAiZs+n0pUVS5BzV68pEhHdPhAvPCbKCxRuZwCeJiNQ1HWcM
	ohtPCtQkVjT0w0aRTw6ujMB8LNuZKO/heyEu0aljSZrcrPatlAH1jVk0clPKiFeYnJWfB3HYI0w
	BWaoBr/HQFpjOT2C+7C15l/3XPyGwWe6Bd87irEFM0kdSNkLTKLKRKlcYladw1f+sKKwiAmNQ0w
	r59lG6Vr9/iesE4IWTSm5JyEHZjXu+ImjrdSxFvV9BPlHKkNukMQ==
X-Received: by 2002:a05:6102:50a8:b0:73e:e4ab:1c84 with SMTP id ada2fe7eead31-7450d0b7eecmr1749256137.5.1783683341607;
        Fri, 10 Jul 2026 04:35:41 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a3e6a1sm4948215137.1.2026.07.10.04.35.40
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:35:40 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-971de219a85so354497241.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 04:35:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrmQM3wdy88rTG05evs5Ne4wmGq9/utV8PF32rXyDFEXrODB3nVk3x2Pd2Ydx9TaOQh7j9Juw3nxqK+@vger.kernel.org
X-Received: by 2002:a05:6102:8195:10b0:737:edda:e7d7 with SMTP id
 ada2fe7eead31-7450c6bee37mr1282524137.1.1783683340215; Fri, 10 Jul 2026
 04:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707145135.247565-1-biju.das.jz@bp.renesas.com> <20260707145135.247565-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260707145135.247565-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 13:35:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXh4LZ8yFyca2EXSq34P0+OgxLyA2J7O6OhZD1PPVanhg@mail.gmail.com>
X-Gm-Features: AUfX_mx1HkmTEWvYMocI1aNW_zjBk9JHXgCAqkMrY6has8ck0rJ6O0h4yvq4kRE
Message-ID: <CAMuHMdXh4LZ8yFyca2EXSq34P0+OgxLyA2J7O6OhZD1PPVanhg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: usb: renesas,usbhs: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 at 16:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The USBHS IP block on RZ/G3L SoC is identitcal to the one found on the
> RZ/G3S device. Document the RZ/G3L USBHS IP block.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
