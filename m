Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959563CE0A8
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456928; cv=none; b=dBUXcon56X67njNuouPpk9nD5JtL0J4u+RiqktQETc2GpS5M+KM3WKIi+p9S1nzIc8Op871EyAt1MmRjUYSJkdjsice/iHva7JEBCGPorXDP39cS73+f5u9sMMP6Nnnnqd3l/0XMEIoLTSyXUY4+jsWSYct2wfSRNp6mlagP0F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456928; c=relaxed/simple;
	bh=ZRbNgqNon+gA5ESuUnTv7elhapKwqBFnwMB5cEO+XK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s33GcWAtIU2t0Qn7nWsqyzMK/jUY2Bj9wTeHCju8nnYeU/LOubhCDMIYbbLpl9+U7nmbq0urAz51/skuEEE2Vl7o8HuF6dzB/anUUyhC4aM3Pvwc1rJ7PY8qsRoq8RtJP6X6xgaVZEFs7/CGWfpLp3yA3IWNFwIqexEOZKOa3Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-57754ec3462so4944320e0c.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456926; x=1780061726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuUtEv2RIQpNuzR/xXhc1VDTRjgz51KFxcDKZyYrP1M=;
        b=DwTRfvhy58j85w91k9/XJ7WEfkhTomgUhE4dZDOigJcC4SDig/t8sHBlUz6eojLsrg
         4jVrXAClP+SXGEM7rrCEdX918jNYnPt5baaTcZOSyXNeQeu0tn0hOKVPfGrRZqaVnChX
         F9rO2EYHoIBq8RpuriEqG6eX29jUucwXcM1ZtVKCbTCFddbdV/K9PU7+K5BSu/nz51JS
         N725RB/9aU/J8+I8bPmJimysuIvUd+G3f9E8tUeIxHSdRkZDayNdb/+4ihkZY7YtV7+t
         R6IBraCZR0PU5H7o0pmdIEijb6+7bmT4EZRvQWild/arubyzj28uHKoHWbfhaHcKX84S
         cjZg==
X-Forwarded-Encrypted: i=1; AFNElJ83bBK7Aei0vvheAFYjkEatbcNZD4mMxSOx5Ny9HRDs+mI0+t1+Rb2EgkeQklQDA/+ZeauhBN5krt3E@vger.kernel.org
X-Gm-Message-State: AOJu0YwhUkW4bE0M5aNRyIuvIWcRrSlVSfnPpJTEzzU49POTFszk22uS
	mVrxqNxKSo8cI7oDX+N/gR/ZnaxCplenIx16JZY0kw+w+lhoWstI9Yayp0WKkDv4E5I=
X-Gm-Gg: Acq92OFfR6t5R1H2JXUVPM8Il2Im5XRhVubqyKegp1tEM42MVLc7Y5zC558J+vvblJ7
	ekWGEspYztSbR2uUA4t+fXtfa/SqxwNz3cqgKV+54b9rOKdZRTENI58zmJWI35lcqrc8I15kv1q
	0OqTWnzfMTsD2+8DOMnPpQJQWL6DOXJXUsJXhANyELuGqj6nQwgTa6sipr+gWfHq2a1CidlwtJR
	nS8ddDvENkm1mWOvi8y2iPbzS+8oBlDVDBTUAp+B+iXVNB8BjorNSYINfI4mX5yDHSIq6a1dTus
	6GrcGk+UJ3lm9aN1X8z3h1fjdDCAA1rPjz6ZmWWioUGBu8l1YcHWh7iVVruPPqOo/jYwqDbRPLR
	lywde2rDTfSfnFruMhbcDzrxRDi2cx5LECJusK7bsT68P8B7WgmrLQSpwJ58l4YjYTitpsHjsBk
	0uY5go5Aq3ZwapOA4WobHO73NXp77q8eN/JyA+oL7J4D7TgzR1mVTdQEyFErJ/HKDv
X-Received: by 2002:a05:6122:d19:b0:56f:a329:6859 with SMTP id 71dfb90a1353d-586606b9fddmr2140643e0c.7.1779456926571;
        Fri, 22 May 2026 06:35:26 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173842ed1sm1508758241.6.2026.05.22.06.35.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:35:25 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-57754ec3462so4944266e0c.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:35:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/oJh+GiMEgKeWk/Es7Dpr+n8s7GgaGO9+Dn7sHv3OTvuGwMl+LshXQqYW5Tpg8DaXsx+/yyd8yOUws@vger.kernel.org
X-Received: by 2002:a05:6122:4b88:b0:56d:9f2a:d6b1 with SMTP id
 71dfb90a1353d-58663771c2cmr1857047e0c.12.1779456924577; Fri, 22 May 2026
 06:35:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506155804.3984418-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260506155804.3984418-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260506155804.3984418-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:35:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqvp=hmafE+UxbpY+zvQUP_oUeNa5XThEyFoaw=7qGHw@mail.gmail.com>
X-Gm-Features: AVHnY4LINUoqykcN6gqjkx-vdZZaVs7hY-T8nDgwUYqRXMQhjzCr9agy9tkXMMc
Message-ID: <CAMuHMdUqvp=hmafE+UxbpY+zvQUP_oUeNa5XThEyFoaw=7qGHw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 alias for on-SoC RTC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 May 2026 at 17:58, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/V2H SoC provides an internal RTC, which is enabled in the DT.
> The RZ/V2H EVK board also includes an external RTC in the RAA215300
> PMIC.
>
> Add an "rtc0" alias pointing to the on-SoC RTC node to ensure a stable
> device numbering.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
