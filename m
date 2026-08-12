Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BD943CEF7
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786547654; cv=none; b=k+ytLPWT89VWCxF90ThsJ68D0Klo4fndV/TGMzzfEawsH8aSPZDP7dCK1cuG1L0ZRrp40+qCKpnpRncVj52rGqM24wGQ67L6Hnj9Zp9y+gFf+f282BYHt73ZJsTHxE4p7sKB/johen1yhGi25UUKlWo1o2LU8aSGBvozi2vHbPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786547654; c=relaxed/simple;
	bh=jkvefW0b5OLyxRr3z2DDupDky1h7+DUjqwpf357sAoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDeZw5KO17ajtCxEBgKzbxd+ABhJpUBi2ds3rlmHbEdptmVnPRmqp3TrORgmHF4Le5JSjpoGdIRRj4CT7pOUZ1w6IudUA1N+5C75DyTOU9PM1c/KG4PfY9tzFeYarlw7nwVWI3bQZ1CDd5b2Qd4AQ22oOGqpDJGn1cEaEMhIKps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c38568d9e1so419166e0c.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786547652; x=1787152452;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cw+NZafyiJw4ZvXIE2j/bcnzNM3NWIqwVIiiJnuoWhA=;
        b=DGSwWsdNGjR7JKgWXDyLe/VB64e9H2Lx2LGu8oOvVr28O7MOKm/d9hfJ8t+rM/8DJT
         J8JPPZHOtVNVn0fOsiq142DmtlmRXINqNojNvowCLEzGsBbaTY/0PLALOQxs+v2eoIuv
         ryEaimlLzeuWD2Y8E4TOlUQFGPoSfhDlU16vdYroz4ukbbIqJz17VgiB11dNP20c4Yu9
         1j0L8L6FXZjrF1R/9jreloTkQG96Lhfiy+BmCXngtmD0oj6ku2ylBT7qhBN2RdzJhKRI
         mVKP3+4IqKKhMM3wdZiqx0vUaRmPEmgPLQGouIrpobK7ooeJ9U8esI9q7//+HUlvvjyb
         upUg==
X-Forwarded-Encrypted: i=1; AHgh+Rp60yLlRU8Wa1z393HVAupwd4aHwnPAZxQ3ZcH1UxCQatEbaL40DOAxecNsyxG+Bx6tGwyzpo3IjoTb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/cg9odCN1LAxoSGivj/aHjWMHKYq1zyNnrMFKuy2zPn/P4fYz
	0ndpGq7MgIOLS5yntdP3fR8aTdntcx/T7YABjtB0ajPzsRPzplP2ylrx4Ql22Tbp
X-Gm-Gg: AR+sD11uUFVyoVzDLp1d1c+O1yDUpbgUmBUyycWGejp4zbEuXHkpmdWAUICcQbHHnkf
	NuM+vJ8KGENOTk/GyJI8wE3y46G6y2Af9YS+G0we+zMLf1DRmbSEN/zcgq7C5XQzlhA6eKjoPOP
	KrmZWNqlgR1XdxxG8XpIzSxjQPEOxtwlmI46H8cuyzIhDXLD071+ECBHnmBpuJ6u3sMdvvcGOSC
	JVRqw8Tu/CDRzJHCwG+CGkAAdFJLxBjKFl2Lod7LzKL5uhYd3jLFeadY7XnKQrY6PyNralYIDFf
	D2W//99AWyLayoxQ4ECvi26xyimElxnCXHOUGgvTrYzmyU1K/hia8pz8wXtNACGtT6xVa6pTMve
	gEzMQlKEAcgXCOuinIpgJeW04C704b2eEMs6T/g8UVIzuTzcaCBDlSEI3SbsoksfoGCxTyTHwk9
	OkZ2jDv04OsSIshMNBbf069tAnqi6P/Hvb1pWNpseAvT0CHFv1XUiZowa0n/pBJ5GGFB7qfC0l3
	sKyCB8yMNByeYkiVzgFQmPVxDUXMhVSmomnA5Rp
X-Received: by 2002:a05:6102:94d:b0:74a:be82:73a6 with SMTP id ada2fe7eead31-76c88b5d4f3mr1086481137.8.1786547652316;
        Wed, 12 Aug 2026 08:14:12 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76cb151df27sm829729137.9.2026.08.12.08.14.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 08:14:10 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c38568d9e1so419107e0c.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:14:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrxnxkp+VYlFI7gMfZ0g6MEEynSBWPL5N7Jv4HUcJmQIfE48RaeDtCJR8xmZpBdVwJUUhcxt4IwALqO@vger.kernel.org
X-Received: by 2002:a05:6102:c13:b0:6a2:b2a1:f16a with SMTP id
 ada2fe7eead31-76c877585f8mr1067211137.2.1786547648892; Wed, 12 Aug 2026
 08:14:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619075621.126961-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260619075621.126961-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 17:13:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVe_kfdgKCtS3BZKqXiZp+pxJrZ=VAVmOct-qk5tZAFuQ@mail.gmail.com>
X-Gm-Features: AUfX_mzoBBNS13xMaYa5qntVW1fi_TuZRWzFFUrWE0n2bMAQaMF8b4n6LMfodoo
Message-ID: <CAMuHMdVe_kfdgKCtS3BZKqXiZp+pxJrZ=VAVmOct-qk5tZAFuQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a08g045: Move max-frequency to SoC dtsi
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 09:56, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Move the max-frequency property for SDHI0/1/2 from the board-level
> SMARC dtsi files into the r9a08g045.dtsi SoC file, since these
> values reflect controller/SoC limitations rather than board-specific.
>
> This removes the duplicated max-frequency = <125000000> entries for
> SDHI0 (both SD and eMMC variants) and SDHI1 in rzg3s-smarc-som.dtsi
> and rzg3s-smarc.dtsi, and the max-frequency = <50000000> entry for
> SDHI2, consolidating them as defaults in r9a08g045.dtsi instead.
>
> Boards needing a different limit can still override max-frequency
> locally.
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
