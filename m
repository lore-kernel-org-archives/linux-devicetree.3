Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E043402B82
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779458126; cv=none; b=AItueQJBR1PY5yEz9Ywypw0H+Jku+MT4CLucpJ/MptBKQZdcrJEavOj/5qJv9snUm6H7HhGbbjMEYpYoLqoQcI8REBM1QTRAE+gORUaF6nSoSXvFV+haVSyRZG3f9WLZBubZSKZ/2Zza+1RcRC+yR1vr6ZJUvzbQxDFRcICKfvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779458126; c=relaxed/simple;
	bh=p6FsAScfvmI00LgYGoLuomprcquQsIoplyeLI0inSTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lejqw9La/rQdKZqfkov3fsL4s72NURijahDxr3bqDto1G7oWeWpkoKYPIVnhlFso9l9/sfGwB/Q3qa58x7Xcer8fWnukR9EOjfQ5McBrqsQ175ta29jkuA2R0QifvRgKecAaHKZT1/uJFlCYuK56fR31yXc0P3BDfqmQZWDCi4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-95cd9a5f24cso2051127241.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779458123; x=1780062923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j30cmgYlFN4mDEmlnYqRmgElSbQTzkiiS0OsZr3i+6I=;
        b=NmTS9SSGd+3E5iP1+N92UOB9vOsN9O3YKBn890TPMVkrZxalxm9xBvG9XJoT6zESwE
         ipRvqUS4eAxOXbzk2+vfFV/VQZ0eVcjSgdMZQwK67sbhGgnbJCrsjzj9rhkmEw5Vm2Xw
         NvwNLHvsqP10V9bSq3wdfkDCor8wNGCEks9f74tZ5zejBPe5OF5trWVN7gsMn4zpDB0i
         Yx3V0vBpsi7tzrfmb20EeOGGwtrvk/i3IRpYX0FnOtSkd/Jsi3R+fXGJBYh768kR0cwm
         ow55+gvzuIHUHZUe7ee7kTXazjVmMUArxlNXXd8i0vktmHrnCBnlKZ1m5gpFVYfJeqn3
         J+lQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qRU4/XYtlJw+GKcb5CrRi8jOuOplronTsLNJ9lPhNVoZvXnyMLNgVoPmrNWtadpxiDdq/kXLbvMVe@vger.kernel.org
X-Gm-Message-State: AOJu0YyIb83xKrRR7TbdxLAWi7VUL5dc2hnMRYV6FNlcmBn8wpPKOFvR
	4Y2tZw6N/DKV9JpEO5VxGXdhT1cA5X8gVtXCWxrrD2TRblpVCOPnx9buba7mhTFhE3E=
X-Gm-Gg: Acq92OEeTG/0MJjLsYS6EaC8BXyEyEffdGGXyq+eXu//BbU0EWlgM7qq6N54D/J2DPf
	PVO2gsn2OAg8vnyOiATbVGDUyLJneEPsZlaJSBTRXN5Sfw7sibC4pCWTb2TU74mFl07dnJxLEqK
	V9FCZgQAJvz/MLGehxfGAOxZ2DbNaH71TWvHFmT4BWeiVu+9EswcsL8wmtMBAPZkrDUewj2/NAE
	bR2hfRwNnzk4DgrTdh5O3jYpDgOB5cKgArRmrPFn9AXr+MsvnuCQV9HjBi1QI9ZnsKlxa9JShjS
	yv/GQFaSdyp9enNIUH0g0Y1F1B+ZikpkzT4RX3sdhiUZNbb3kgdowfCTSBGqeIEuOpB+/t3+riV
	mKsbTUcH+Z//nB13m4FlhtsUz7dOq4Ubg/4s6fWkGNfw+OBtg+e7302gD+X8YKGPQLZh7n0ptdB
	o5NpfwYEn4r/Ucn34wb23laJ+nQl55rxLPgKMfeGIVlb65ZBxs+Fcpd0uNeZpu
X-Received: by 2002:a05:6102:fa2:b0:631:d3e4:efc4 with SMTP id ada2fe7eead31-67c77ff201bmr1686790137.11.1779458122812;
        Fri, 22 May 2026 06:55:22 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9617383b1a2sm1638492241.4.2026.05.22.06.55.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:55:20 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6314a0eefb1so2296014137.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:55:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+HgnTjf2LoK6nuBTnP0otesaR8sGz2C3pxXSQc26lXb5jibriCmbApU6/AL6nV9YVrgHgYfDiWVqZh@vger.kernel.org
X-Received: by 2002:a05:6102:c89:b0:608:94e4:1c00 with SMTP id
 ada2fe7eead31-67c7490526cmr1691949137.2.1779458118939; Fri, 22 May 2026
 06:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260410163530.383818-10-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260410163530.383818-10-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:55:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiJEnpfLs=cQ-j_VaFxMhLuV6YLsvqpE4bvCmT_madQQ@mail.gmail.com>
X-Gm-Features: AVHnY4LbuOPf1FKjHR7ZFR3fWcySVRSaw7vpgkocdsWUrZ7gBa__02wKZRL9zBo
Message-ID: <CAMuHMdWiJEnpfLs=cQ-j_VaFxMhLuV6YLsvqpE4bvCmT_madQQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] arm64: dts: renesas: r9a09g077: add MTU3 support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 18:37, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) SoC has an MTU3 block.
>
> Add support for it.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
