Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686503A453B
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 10:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123599; cv=none; b=Nh1VdOw/Eiu/Rj9zrpzybrmiMp+ytJoxFEEN+gy8ReMnhXxaW8ohjWTuhzqhj7WJpJ9kOK1s8na84S3J3kZGcq+2BlyHnegWPLEy4pSG0H32RmnHAfXte+p4zGKW5Nyzt+5/wsAxepDi7tSWzEWSbDMK3Kk4uiDKAny8ZQyXW6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123599; c=relaxed/simple;
	bh=6ud969rmgTywtWI+bBtRObW/ffl4TQi6E7dIGUBQTJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zv/V/qMAh9sW/Xq0160ijsLSMeGoWgqBtgRYbFtDH1nV9SufFPPpHRqbSUBd2L5juPJJ8O/8m9dy1wKfRtWhWU6aFFUjIejuNmx/HEpCDnUaAcZxItOWzNRejcaVVEYXLwsf6BDi5el2Es4joLGndr2lhb7NeYF3kZvqtucMPyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ab03872a64so2250438e0c.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 03:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782123597; x=1782728397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7C/nv0Z5Z7qVZqg+9ueiOKyHAs5rlrI+CCJKFNeXypQ=;
        b=nRSGL5/sjSBY8ZGgvTGqfcTeBhlGoCFvCUoyaZZ5B3eprprvJ3LVJmlE66oQJCGl9q
         atlhixqbxH4uizAQrjwtc6wfQVUWnwo31dLmJT55LtO279Hp/otvIM+CscarjFxx6WPi
         PgkAF+fJ65Rou/bAy36ui2pRI8oV7AmVBMywpG9apFOcbAkZWT11i3bFiuKxz7lfLI22
         U23tHnziKKTvIAGSuhWj93X6BLWA1efxhSaAaU8ccOQaEYnQFvlbzO6ONYuQXlKqu8ae
         xJBFxzL95Q3cyVyz2YZ76IEbxYqzGkiUbET8rvg/foe1aD84PXgswymfd19F5wQ1d1sq
         oTYA==
X-Forwarded-Encrypted: i=1; AFNElJ8X236GzS7b96qFgQezRzd1ltLDuYYEdb+/KIc878/q/ttCkZJJDubvTvwgTZU/d4hRr+GJ3X/nSDw7@vger.kernel.org
X-Gm-Message-State: AOJu0YwKxD6Rlr/7y/xYhx5n8O1aqv1QcIh+TAwb5HLsV/Ws01o2hdfz
	nF6wY9AQzZQoY420UB2hyqfL4bMk4dpS68J1fCfwOHgdsbG+mhwIpmUwHk3kqxLW
X-Gm-Gg: AfdE7cktn839qc9R7Aep9njmyomr2rSMcw+EJ1ZWuAxkxWxZ2FhH6SEqhXMtfC3FmUN
	MLT0O+hlJeXz633kO5xHI+D/GAJTvL+KT4tlqoygsbWNhSIw99UGldUF2j8LpBShYrcheGBSbga
	no36/gQL4QQ6hMXmARXuI2hdZ/880VfDpYtdZcdHTQSJBkO0Ze1i+Drf1vePLuMM0OmKWj3rKxv
	U752rLrcdFOmlSQGqKinqYuauy1Zqn9u4AWNOsZlDUZthr8SIBeOS9oKIqYICMNhm//MQQIgld0
	qh68p0FBYDL8dTNbm0XZuubLGXP+Rg5vRw0EjJed6tINocZ37sIgvODTtr2Oh93PCiA4jZBJwWy
	qvdwepdWamtf0DJp6JasM4fgG2DLcVrdJbdHEFxSy+cSph4zevEVkfzHEFhP0L7AusEXdITFGc0
	YdaOpNQLOmcHMYRPnaui6iuQZYKf8WZq7ptGGJQ5AektS+fh/djw==
X-Received: by 2002:a05:6122:1d88:b0:56a:ef51:4cae with SMTP id 71dfb90a1353d-5bbeba55954mr6398852e0c.4.1782123597372;
        Mon, 22 Jun 2026 03:19:57 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfb81ed48sm6170199e0c.5.2026.06.22.03.19.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 03:19:57 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-96387efc30aso3260870241.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 03:19:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Uv0iobjT/DntvX8jIUSEaN6kyttFDUltkBA5ChgwGZMZHWnmxEeHA7StqpWyEjQL1izxqeQN8XFUi@vger.kernel.org
X-Received: by 2002:a05:6102:508b:b0:728:89af:8edf with SMTP id
 ada2fe7eead31-72a1dc35643mr7908394137.11.1782123596658; Mon, 22 Jun 2026
 03:19:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619083951.3777556-1-john.madieu.xa@bp.renesas.com> <20260619083951.3777556-2-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260619083951.3777556-2-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 12:19:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVm8CjeBthANW7BCJ2+4jByCfVamwe-NGPb1YzZQy_bg@mail.gmail.com>
X-Gm-Features: AVVi8Cc4BYgeZ4BSzBgW-PDiqmIMegzDfp5P72yPB69qZu1to0ntxn4UKgrveb4
Message-ID: <CAMuHMdVVm8CjeBthANW7BCJ2+4jByCfVamwe-NGPb1YzZQy_bg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	john.madieu@gmail.com, biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 10:40, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add the snd_rzg3e node for the RZ/G3E SoC with all sub-components:
>
> - SSI (Serial Sound Interface) units 0-9
> - SSIU (Serial Sound Interface Unit) units 0-27
> - SRC (Sample Rate Converter) units 0-9
> - CTU (Channel Transfer Unit) units 0-7
> - DVC (Digital Volume Control) units 0-1
> - MIX (Mixer) units 0-1
>
> Sub-node names follow the new RZ/G3E sound binding: unprefixed
> 'ssi', 'ssiu', 'src', 'dvc', 'mix', 'ctu' wrapper nodes instead of
> the legacy 'rcar_sound,xxx' R-Car prefix.
>
> Wire up all 5 DMA controllers (dmac0-dmac4) for each audio sub-node
> with repeated channel names, so that the DMA core can pick the first
> available controller.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Chqnges:
>
> v6: No changes.

So same stylistic issues as v5.
No need to resend just for this (every resend consumes review time on
my side), I may fix it while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
