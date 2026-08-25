Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69256401A01
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660820; cv=none; b=s9a2k96IlYcNEWdAGA96r0xrkO6dwy5NEv0mZpRmlrQKz9Vl0q18kGs+50SZUBBSnw0hWGQ3Cf9utPpy88AbqlO46P6uszjno50Wx2V/FwvTFcUROC+uYBN7BL0hsE5Q/Mm67w4vM/K9bqsEZbpglEG52u0O2Kg1hiKET+HiMaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660820; c=relaxed/simple;
	bh=gxH8SjRD1UIdTzPbcf/H8o8DZ5xZ4KITTBXh+NTJ9ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLHwD7FJvqGp2u5QcVEYq+9P8mjMQL2sL+Hdsq1HVVS5qxtSrxf9z19Z3oADN/d4sYqTSyuku7XnpN247SrAmg248kU1UR1OXrTeaO0W15ZDlZ+6X6wRT6CX9DUWdcbBK/cnrcid2+3tJsZeiCunvMa2MBTbkUSC1HPDK1d3FEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-779d18ef706so3149424137.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660818; x=1788265618;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3bNYZKHP963OmdqbLfjn2seFzOgtwyksbPN0UTH7ftQ=;
        b=qVbEjgu1hOkVkon0L0ZHKub9OV4X59v1yk/7bRv5RA/uS8lhXX92n5PPHZDmCGqpno
         O5wTSS6u5UKc7TaCiBzmRPNsRXHryTEnbDVxvry9GpGFJhkSW0q0p4lTwBtGT8W/anEJ
         QorxaI4F2FTtn3nbqahxLIcwVHbiiJmV9oJ941qt0nPa2vzK5K1FxpDI/Oghia0Ro91k
         xZuL3k1LVKueQ0L8zVxO3+jv6b50DBzVPvwyNJyc9lHdwib93ycgcBsBbkHt74hr/T+c
         /zwoyDQbJOKOyVAH3zCRGqKRrH81ufCmkRGUGc1UzOlHNvt2FvAyKYotNtwZMYlM+JJN
         mgcQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDFkh7KeYOgkjaWpmQXyiwZIKV4cyU5K//EUKCs5ZEbxZo8tEIV86noCVAS+2oB5SwVYICb39/kBqv@vger.kernel.org
X-Gm-Message-State: AFuF++lDkemBQ2HfzpdA+cGtBv2PfTqftNZh3RZhlwa6XLLtPw7ee9nq
	XmY7niaUiNW+g8k7ezSiPelyq4Q/OlJBmDAHfJ81C4RqtfARURX/jBoJsw6FbV94ZsY=
X-Gm-Gg: AR+sD138ewoaAw4ANZq2KjAVNQVNwnd9TLyyVAQzJrVejOZVQebHE6M+rVMsfII5XFt
	jRXiFvT+9YLYeGQEAq0ErjwbkAXRjQk2L25hVpK82XgRoiJZcZyXTS+SznXbDrBFCzCvCRQIMpL
	06uLPOohG7S9WRFTaehhMHSyyOPRw+35CYZcqWFyYv9V1g3LyMOPQ01q83LlyZfqI001Xe8U/jc
	PnaVfWLp6t2bnnWMOuVSq2zMKZsc9jSzYZEmWzWaG484gzZ7mM1267rR9it6B3JQwoWiJXeMffw
	/0zsNuHaj20VKwTsxbS29Lhebr0vUJBVl9iB5JZSR3C/5SOPEUzp5Z9bGQ1MXb+XIHAzryeEfi1
	tgLLPn4wTpGiLcUKx8Ru3Cuaxe5kuScR+eARMeumw4L3uh335IUCFh56FcAg7q2lGrRrc2OHwbI
	bj0mPxeZ5jloSkJdpG+b19XBqKQcZAC9QJ9sN9avcyYHWV2n3nBZdh0pQ1Gq+fXQiDi893c55qQ
	s3Kf3zu71q8lGbMqBXhWuIwoD01adI=
X-Received: by 2002:a05:6102:162a:b0:77b:28c1:210e with SMTP id ada2fe7eead31-77fe6152fc3mr2314873137.1.1787660818131;
        Tue, 25 Aug 2026 05:26:58 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-77d8357ccf6sm5341297137.4.2026.08.25.05.26.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:26:57 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-74dceb46291so1922633137.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:26:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpD/N+qET8GCOi3I5tQ+A96YyWNCyipvD0awHx0Sdj+F+nX0yLz+BRiQs5w3dinf1rJwNBK1MNaa0Oo@vger.kernel.org
X-Received: by 2002:a05:6102:e14:b0:77d:a23d:ae70 with SMTP id
 ada2fe7eead31-77fe9814c27mr2237403137.14.1787660817048; Tue, 25 Aug 2026
 05:26:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:26:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtApMoHKg7v2CqNTQy4EF0sEzmSfQimGySgTcYjMwXEQ@mail.gmail.com>
X-Gm-Features: AcwNN1U4dCP-EqOtN5skyICgGBt3GttjfY4cB3WPPEIKKuOj9_pFM74mnwgkrag
Message-ID: <CAMuHMdUtApMoHKg7v2CqNTQy4EF0sEzmSfQimGySgTcYjMwXEQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] clk: renesas: r9a09g077: Register SYSC regmap
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Register a syscon regmap for the System Controller (SYSC) integrated into
> the RZ/T2H and RZ/N2H CPG block.
>
> Unlike traditional Renesas CPG/MSSR implementations, the RZ/T2H and RZ/N2H
> CPG block also integrates the SYSC, which provides low-power management,
> clock monitoring, write protection and peripheral configuration registers
> shared by multiple drivers.
>
> Implement the RZ/T2H-specific .post_init() callback to create and register
> a syscon regmap covering the SYSC register space using the CPG device node.
> For backward compatibility, return without registering the regmap when the
> mapped resources correspond to older Device Trees that expose only the
> legacy 64 KiB CPG register window.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - Dropped RZT2H_SYSC_BASE macro
> - Added array of base pointers to the r9a09g077_sysc_reg struct to
>   support multiple SYSC regions
> - Merged r9a09g077_writeable_readable_sysc0 and
>   r9a09g077_writeable_readable_sysc1 into a single function
>   that checks the SYSC block and offset to determine if the register is
>   readable/writable.
> - Added RZT2H_CPG_REG_SIZE macro
> - Updated r9a09g077_post_init() to call of_address_to_resource() to check
>   the size of the mapped CPG register regions
> - Dropped changes from cpg_mssr_common_init

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
