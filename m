Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E87E368D77
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163800; cv=none; b=UyouBfHPb2983VlLzglm9GGq8tqg0iIYJJaYvQWAOjgF/fWoyR1go1/OwJTE20QsdVrfwXO3daVd/UPSPavBC5BAM9dLGA5/qroIYGngcuLtW2ym4qPgQILjhLpEfoFpaGAgnF7l7xxOzn3QfN2mbiY6Jf8682XqEN2iWMC+QXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163800; c=relaxed/simple;
	bh=toH4Nu8X0VoWmbcPFRUFtTal982WrI4JYNV+CT82Ubg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5AUfyMykiIzty67Fipk+o8603/SsgWszx6c8dahEEeXgp5FmMpHO/GxX4lHI0lKdMNkVohctVFPC9LLMP7MVHIYjxfXT+1gj6a9TU/7kdeC/iK5BIgUIf5IoEy27dfi1kggsAr2NCFvXI4bKGcg/Kpn7d8bOBQEFsiJzO+C7k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c8c8602so427539241.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790163796; x=1790768596;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AQBDufdUkXkchzPiebMikSu5M3FlCOhF16/kg+goO2I=;
        b=APex+8decIvORK/t2Ss6DwwHDbhD+GJhlvzVV4N6nnQf1z3uWokjVMAJYVrK3m1/1W
         2Y2skAVG4Z5XwJOqAEj82bLJuEDSQ6jErQXFYE0yRgnmL7eBrrTokA2OOewHcFhtUr4a
         2YqIUloxjsxmKO8LWFktVi/xqMEFZkePA/uDycpv7iTnOT+5w/lhn8GVJX6Fcmes8p6v
         lblCAG/KHZr+pwfZ47rVhyNCOnm/pNfhirC51Ui1UUaSYAPQLzFHhTnPyqwJEwbPhoqH
         HeFq0pOIPzLM1TTnekwMauazzlR8wW3DaolQzaAJyTAxBxhMfFOwz/y80KuHtJ3hpRjw
         muLQ==
X-Forwarded-Encrypted: i=1; AKwUvByZvUjH00LBVIx1Chsln/J8JXiGm5pER74u/8HwZMOmdKSnNarlKGR9tmRd6Z7NnaKqKIhK38d+7+T9@vger.kernel.org
X-Gm-Message-State: AFuF++nlZgrmNGYtj8YNT9IXAVMeYJhAvOKPyxwYsPN0OCYFEwLgII4S
	nnrQVsxNl6/QblL8Z8RiXo/Di4PLoTqjqn8OQC9Hgz7ZE4EeYJu5bCD4N0Hho6fSdWI=
X-Gm-Gg: AYBFou2oTsi0bg9Q/KttAH/CL9lrcDrjAHVAmxh7tCmocp6/aVKgrkijlgAjlX4h80V
	j/muXlI8iGBSXIRF5gjepIeJ43rp7sgvD5+8rQEShW2rWmYslA1iQW7C2olhdqw0M89ct0NnYNR
	UZRFk7vQeq/6M2e5Ajqt/4mFjISnnCBTm62EDv465XAPSZ+JGATf/RQpn33+g+3dDBIXbNJ8ewm
	P6bEb1aDRI7HvDqfMvSIq7RRahSLWfDY+Vgsc45wOeaMuiJs6DSCcTROVPgMTtv4JNhkzNGtxxc
	ws8Zee28EOHmL03DXYhKcJs6c8h8Dofx5v4S5cFr9LQIF0Nndm3mzjgsg98du8rUdE3fTTSI4ne
	/sAbbMi7cVDEtp50IwS7Jl4mPgR1SojFglhqOINpD1iOTobCCwN2riIRuabPX8e5RRgawStmTk7
	wBuNFwyLcfrD7OoA8f4QjNma35HCHCyQ7ABgdHaHzSmPaYZYjjUV6BF4jkU8dMtyY2GlPS0XkSs
	oDG8Ywk990yVWcn+OFSOoKzYMasuxVrNay5kg==
X-Received: by 2002:a05:6102:510c:b0:7a1:f7d2:e817 with SMTP id ada2fe7eead31-7ac1be5779fmr2371317137.16.1790163795882;
        Wed, 23 Sep 2026 04:43:15 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf566bdccsm3257167137.4.2026.09.23.04.43.14
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:43:15 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-97e96a8ba8cso571496241.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:43:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwPDLKIvI0CRO55PP59MVfoyUUavn3PzYE1qWn41dBLVEnt00zA3DWFcrByPEmvepLPWuhrzcP30VUT@vger.kernel.org
X-Received: by 2002:a05:6102:5813:b0:7a8:2a34:433a with SMTP id
 ada2fe7eead31-7ac1b824983mr2135063137.9.1790163794193; Wed, 23 Sep 2026
 04:43:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-6-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-6-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 13:43:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW9V4jd6j-Lcma5Nr-sgqJjBbbdwcnO3s+YFmvUz5qQLg@mail.gmail.com>
X-Gm-Features: AclHuK9nw9pQ2eMsnoclR1kgUt8L_8mX7NzQtyl53d74B8AUYdOVbDcik9Ofq-4
Message-ID: <CAMuHMdW9V4jd6j-Lcma5Nr-sgqJjBbbdwcnO3s+YFmvUz5qQLg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] dt-bindings: clock: Add r8a774a3 CPG Core Clock definitions
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add all the Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC Clock Pulse
> Generator Core Clock Outputs, as listed in Table 11.3 ("List of Clocks
> [RZ/G2M V1.3, RZ/G2M V3.0]") of the RZ/G2 Hardware User's Manual.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Renamed file to include vendor prefix
> - Added vendor prefix to include macros
> - Added Reviewed-by tag

Thanks, will queue in a branch shared by driver and DT source code.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
