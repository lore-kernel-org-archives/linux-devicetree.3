Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E364323504B
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 08:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636895; cv=none; b=YYdc/LM1nWWj3uwNMQxaJBu0yAYpz1IBbC1kPbORqA6UGwr2UgbDRqgsJ9HB4l81Mu2Ear2jSNZXTwoWvNiF5a8RTwH2BPp3m0qJNucXawyL2stwPCyEPlpxdhF2IBVQ5gjho3zqFMWgq2WIRZeZYq9EIvuFQXbqhXmQwV1+c9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636895; c=relaxed/simple;
	bh=o9aFN/oBxjJk7ilLKE+iObF5zpOesxCwPJ4VHcL/xkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hktm8rODx95R9WGHVRP6F0zcq6yKDthAb5BC9Md2ODfub/Azm0ad1USRXdKqK2mOGuuE8krHSzvZxHQubzRpiuZ+/dpNSV1/ni13kkTAH6RS/uL1qC2pkn6ppkbgcORAwCJKqD1nnoDK4syTc6k5G4yqfTP83BCxvHoeRckbBTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-953a0431639so1181559241.2
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 01:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775636893; x=1776241693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQpQOf4fWDiiKTZ8RNLIoiaoYNDkkDqXEA0sfJBBI8c=;
        b=Rhr0d8pcbhVRTGQa9xftZmPdebr7DN9BdIZFX4EFypH+wcuQPJnfZgErqM7bco1s4V
         n8nYJtHkQShVNMJkorHgq3iHUefSMQvdZfQX+mNtIy0/NI0NG5lOmLb1pfrBU02AkP11
         2Zz3OZujpHt7pD1ZsbG7paJPt/l1MgUF+xaE2vqIIwi1AzUgLP/P1uL/PGTElQrGkKBY
         +bLxpCP7w/ZfxAbcV1Wcfn1aD8XeeBGl14L3vFpCllS584wdC8CIWIVwLAF/v6xQ7R7t
         u2mWf2Rv48lUWFKY0iqCwHvuwqaqtHgDttgJJ12SO3kKpk1luX/KTlrKsPODbRGy1Hdu
         +3Og==
X-Forwarded-Encrypted: i=1; AJvYcCVMfeMmbu9FF+CarUVuZnv37F8BrHRMDO59p9TE546cfBqSlZEAJooewKn9VDHoPS/c0bjs0l65Sp8J@vger.kernel.org
X-Gm-Message-State: AOJu0YxHb9IDT7EQqwjW1P8o9splzquXqXBp08yK9MFy2zmjxBc0wzBj
	W1NnLkNW0VQedkMvG2YQu0VVw5NQAFvVwCmcUGRSOF99coMS4qxc1BY9Ex0f3OeB
X-Gm-Gg: AeBDieu0oDn0LZISpEKt2VBV1ZblxGTPwiHOefMQr1Y+5SPuYPL0ILqlYDNbNReiWMb
	MrlXR3iN/I5qxyykzmWK0R+6oVVmeunR2mQQR75tNDtuJ+14Y/u1NOJVJudpl2vaxuF5TxXxpcF
	tfgZ1mfrwGV//qGBKwRC9iEinYAEY+lMQ/K6L9qGHsKJc6rZexfrLdlWzBwGh9Yg6E40SvH6rXE
	FDkL61RDwO1a6+RcQINgM7xKV42CO2NgVN9p1iOt4PvQbvFsDzgOyDlAkEF3nXtqpNCGKsUZr8n
	m44pU2A+3bC+qbbvuoZXR7YgZvxFMA7tGmPWqMY86UFTYXGk30RHaaloFhJhhRSVyTvYaPIdG4Y
	57XLRaSVap3XxJdKt4D6J+bLtAvtdOxtWAn33whvMxxfGX1qceRHju+zt92+7ml36t/3ac6mFX2
	HK4CJiPs6gkz2oD07vdqRZjMNfRJa5pj1VXBkOgmJHfifVezRhfGbUaXPAnZbuKPHQ
X-Received: by 2002:a05:6102:f89:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-605a5021387mr7120569137.25.1775636892722;
        Wed, 08 Apr 2026 01:28:12 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582b562bfsm20287657137.0.2026.04.08.01.28.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:28:12 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5637886c92aso2612413e0c.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 01:28:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBuLJxCZwR0En7m/rZxpW8tnt0Bj0UeDRgPkrr9st0oiRh/x+zytDwLo4q/wQk/SeLSdzfa9vID2fE@vger.kernel.org
X-Received: by 2002:a05:6102:2923:b0:602:8ccb:c993 with SMTP id
 ada2fe7eead31-605a5013b05mr6453381137.24.1775636891875; Wed, 08 Apr 2026
 01:28:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407145753.101840-1-biju.das.jz@bp.renesas.com> <20260407145753.101840-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260407145753.101840-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 10:28:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHWxmY7fCue2Q+4Wvf2QbB2ABaQL2yi1Z9koov7tj6Zg@mail.gmail.com>
X-Gm-Features: AQROBzA34NCraYwlgtVmX6Zb7nvooLN9XjKRAeqpyWsi4l4Jb7X8ZFeX4g2U_rk
Message-ID: <CAMuHMdVHWxmY7fCue2Q+4Wvf2QbB2ABaQL2yi1Z9koov7tj6Zg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document
 RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Apr 2026 at 16:57, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document RSPI IP found on the RZ/G3L SoC. The RSPI IP is compatible with
> the RZ/V2H RSPI IP, but has 2 clocks compared to 3 on RZ/V2H.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Added ordered DMA names for the dma-names property.
>  * Dropped the tag
> v1->v2:
>  * Collected tag

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
