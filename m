Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9194F391B
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164559; cv=none; b=R6udiM2YblJrsKWHAwkM1kZX/5Ta3Tz2LC3N0EC6jUpQQzsKGVDUMwkvw0qOVrYuinVHXMEaEe1rMwbXSiVQ6UyNfw4bBjuBy/BitqsO5/zg8A5qzunMfWy1uYB7gMecJ7mIHPPP8yeCmDAfd9B2hjhtrJqX4DFRKR0ZPYW3j88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164559; c=relaxed/simple;
	bh=cdUu+2P+AtFzsdIyFUxyBK0BNNipSTAuWCzqPtH9ZDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VoWK1iF4hHgKUM1nvva8AeRuc1Ih0RjWAyvRSzjzt33o963qvpl+01DKhRkH3pFQice4Mx2rCHQLofMYXvIkPromLv9O2xoeARPbfCnfS/YWIZnWC+6isvtTa9FtKV0ihM0yF2y0C8Q36cJzCyudkH3zoIs4KT5KLFLoQkJlmGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so1308868a12.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164540; x=1790769340;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u/j7x66zXOrBYdEe6fVcwfenLhVDHg3t8DyPsU453Nk=;
        b=lIJSDPFaNrbllPcllHonuzcbf9KQk193wcXUanUWJm1MmzTJ7Te/tMMfjsbpTpe6A0
         cMhGGN1dPUsgoRS3k1fSC6sDtGXbzd4Eo8KOyBIgSUdHheQ27IxiHEd4RdSHmf9xd0lx
         R4tvNqmh6DXRhrGDqLS4gmLFci/jfvw/V49iZdZcQ5apOSUkra4jDhhYqTE/kyYjFEi/
         kr8baAs4AQ7RSCEmn4ZUqVLFPy+1XcPIztTXafaWSQkTcMJjHVBd0l2Bnj3C/HqteFse
         iLbey8tfhD6Lw56l6T9w25oCqcA/PXEqiNL+n7vw9zIL45U/CBSLlsjszAyE6IJFueLf
         uimw==
X-Forwarded-Encrypted: i=1; AKwUvBxagRgnV+PZl/5lhmXf1aYwZUacG2holzPdeLNJgoqJkNXeUesBrsF0v8786Fsd+E01sKf+w0xPMutG@vger.kernel.org
X-Gm-Message-State: AFuF++lheWWMveUzERmunQ5NYWrNfw6j0BrecZM964DeTAaB3BsHs8Pf
	TkZpLXrEE90Ahcac0hYs5l2Vb0BMgSAmLRkrYFUinVCelePgiJXiX3aWPSC2lS47Kok=
X-Gm-Gg: AYBFou2aWITgOfNlDb50h4K2GvxMLBBtQLVkvB/kSVJah1o2KvluzrYoEVxrRCYF0j3
	Ed0jri42hbsx0ig1Zrh9vzkqW9KWxicU04c28iyqbw2Bf+/NIhETLxROz9DR0NfjS2gkLyhUIMZ
	7QDO4GaG07XHwXCJHuo98pQLcgIuzjAvl371YywMV4dOs2fzlOyACR/hM8HeghmNeqpeeoOvyzd
	yRENfquvSBbPPxtPvw1ITuIbZ8GbeL/j4R9JI2f5H4zfKL+NKKuehaqkSxMlNGEsQ15fBG52iQD
	98Ydx+cmvEEJ/YTBAePv2g+Q8YvIi/qS1ruTSjFZ17AQ53GvtHwYu5sRE+ffnz2v6j/CpbJVfjb
	7HcoYNqGD2OEiQdPiCbMC5MdEuOhxS6SpGLpmCOL4RDCK4IaX0nb5+Yx7DjolzcEqLON0dEn8vG
	1CXAqa4noQztzF0S9JKVKRGM30P5ugt32vaoV1m/pTMRiPJ88Fxqp3KALuK+SKcYLkCxJLqL6ak
	P51L3b9ftuDHuOY9UYOqBvsBSwjBlZllMOA
X-Received: by 2002:a05:6402:1f10:b0:6aa:734a:a095 with SMTP id 4fb4d7f45d1cf-6aab3bc306fmr2034562a12.44.1790164539529;
        Wed, 23 Sep 2026 04:55:39 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab3883151sm1515265a12.14.2026.09.23.04.55.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:55:37 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so1389541a12.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:55:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwVG/1lgMBx/NysR3qUdKMas/IexSgeewzsdqEuV7U8ysTlG+37AHstaLjDeqlH+ADrvhb9wi7eepPu@vger.kernel.org
X-Received: by 2002:a05:6402:23c7:b0:6aa:9fd4:987a with SMTP id
 4fb4d7f45d1cf-6aab3b985dcmr1953506a12.20.1790164534610; Wed, 23 Sep 2026
 04:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-9-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-9-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 13:55:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuY2esH4hTQPQ2dvTu759ehPuJ2uOimX53y9We2-PS1A@mail.gmail.com>
X-Gm-Features: AclHuK9-osA0MxsPMPyeNE-WDoQrmvKbRa3ko9lUZaESlIsKhQY66FTC8uoGLsg
Message-ID: <CAMuHMdVuY2esH4hTQPQ2dvTu759ehPuJ2uOimX53y9We2-PS1A@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC
 main board support
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add support for the HiHope RZ/G2M v3.0 (a.k.a. R8A774A3) SoC main
> board.
>
> The RZ/G2M v3.0 SoC main board is similar to the RZ/G2M v1.3 SoC main
> board, so there are already DTSI files available in the kernel. These
> DTSI files will be included once additional support (e.g. I2C, GPIO
> and sound) is added for the RZ/G2M v3.0 SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> ---
> v1->v2:
> - Dropped bootargs from chosen.
> - Updated licensing to "GPL-2.0-only OR BSD-2-Clause"

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m.dts
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +/*
> + * Device Tree Source for the HiHope RZ/G2M v3.0 SoC main board
> + *
> + *Copyright (C) 2026 Renesas Electronics Corp.

Missing space, as pointed out by Sashiko.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
