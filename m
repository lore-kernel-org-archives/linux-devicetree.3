Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367B442AF8D
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661503; cv=none; b=HHHr++LGF2ao+4Jz4n+jUWC+m1nsBtlLZ9qkHKKZfxY/QhyppMm/weHYJQQA+zJJDu1Su5m4D54EHvUO1GT6yxNeUnyrE/ttBEiFDqDs15gEQWnEdGRhHc9ODCAWGeEvr01v2FophC0yDe8Bg3dUpNm5k9rtrUz0emI5h+GSoPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661503; c=relaxed/simple;
	bh=XVZs/xqSmR+34+BrwmpxC0cd+dGU1Zxb/J9zlN0cTU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dEvqIMqVLaEcn/iHYEhfHoXnt0wSPqp7/Kk9W9rtNulmZgHlvUGJ+K0mFVZU04BFKZ7rlUnK1Hz31gyiCT2OZRmkv5nlJ0sc25SMseWVEbAMwykPcY4x9ADWTQJTrrlj1PJbhBI7IPDq98vu5QuGKxZqHB5fUiZh2nU0GWP0dTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8200b55dc47so72963317b3.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661492; x=1788266292;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ILP07iJKBmCL4umuQJDRJxi/o8MvR2u5/1eDo+tc9XU=;
        b=Yd4KFTeBGsyXn/0e4TSlzFGxkSbysI2AV4AYYTveA8kS/r5Sjn1dcVy+84BlDW80Oe
         hPgTH+US1gAAeDT2vpOSruuvSyhFxRq6c5o9MByPUdoavwbOCEPh1RQ1/nbN9jQLBlJ9
         zNht7IRu/zUjdSA2z1YGXolOX+gb2cfg7lyQ8PbPZnPGrfbT/nNcgGd9SiGJFa/5WOzy
         9YqBSgsIgwGM2xXK6fEDYMUE7IDDoQG4Jk9DmTNrchwGB/UYAGStb7RbDJDYq6hMneRh
         OeXSb1z6JRt+xTBw/zn4qz55I0QjonwLC1UBtWNzTy7OAmr41dfTtPNkZzinO/VwYjqY
         ik0A==
X-Forwarded-Encrypted: i=1; AHgh+RrKXSUSkgqX5bZHkAOM261GtbSUjfXNNsNojTVJJF5iIukODRhCctucaK/pFXLlVT8J+GRc0Tfok0Dd@vger.kernel.org
X-Gm-Message-State: AFuF++lS/Hboj+5nL00ACcaH+DR9fDzTnLd9kzNL+PFL8aEScj8Rj4Az
	HfGB7Ko8lGT4WMqgyERMV86C1w+iq6L/07nc03gLDX7HpixcxaT6FosTvlIDhRGrw0A=
X-Gm-Gg: AR+sD11tR+33FtUtNWNkUiz/F9y2CHOYX61e+ORiRbpSl0JyMi40bCrF6MpakFDfAwi
	rghbpUnKx4xGxQjZO6Jy5e8RZUHEIadOK6ag8zHgfEY57uLjcX3hO4Ub8v6R+T0vqafSFf4NFkA
	pS6tBKYrwIMyH7imo1JelK0W72G9+sBVaCOWn7s+NgcFS+aiqbNyA4B3Z+dyUvBGaiOfiguxV1k
	iHdGhC1V79fEYDMI7CPyQS2fgvOC9UEGK+4rDg1QWtoRGGc1RTG8vQhr/NO44qx/DUKNuD9qPxi
	bPhaWLCA6mnjN9h6OdYr78AcZoWD6hj14BySvFkq/T7lVyl8nj6HgdUxu0RIMT+irJGUcaF7Tpc
	QCbZwOe7FH3G3gYkoXTSNEk+6cnrQROhj7PhwtUyjZEuoLlYKmq2VhPzZI1066xIq7JsiXetyeC
	P3xMvutqw/gUyokd/i8VBDh6TZ+/jowieh9cDQKrGMNVYGyPHAzo+Hb6VkpVCc+UjDan1y5lv0Q
	znZCTCIY8uqeB1KWo/zP8OB6Q==
X-Received: by 2002:a05:690c:6983:b0:7fe:1333:c745 with SMTP id 00721157ae682-84c9b31383emr99719567b3.27.1787661492402;
        Tue, 25 Aug 2026 05:38:12 -0700 (PDT)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com. [74.125.224.46])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84ca5188f03sm48521757b3.8.2026.08.25.05.38.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:38:12 -0700 (PDT)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66ce4a63e17so5632358d50.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:38:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RphbqsBbOJHh+/rpnPAS3aB95pASRP5rMcbJ0fCKyleb5wgqhcLuAc+KWLi8/YF/k/X1KGNBSzliomu@vger.kernel.org
X-Received: by 2002:a05:6102:fa4:b0:778:9033:e337 with SMTP id
 ada2fe7eead31-77bd12c12c9mr7782019137.7.1787661031227; Tue, 25 Aug 2026
 05:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:30:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXwbEUjqxWyXFK0WSDh5B_hXj5n5iH4Nk3_EpBVQDbtMA@mail.gmail.com>
X-Gm-Features: AcwNN1VMSQ32o_cnpnsTpSPX7r0kAj3W65LFTE0SdyuxEiBV0BGPSBvqvVU8GfE
Message-ID: <CAMuHMdXwbEUjqxWyXFK0WSDh5B_hXj5n5iH4Nk3_EpBVQDbtMA@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] arm64: dts: renesas: r9a09g077: Use CPG/MSSR
 syscon for WDTDCR access
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
> The WDTDCR registers for wdt0-wdt5 reside in the second register region of
> the CPG/MSSR block. This multi-function block is now exposed via a unified
> syscon regmap interface.
>
> Replace the direct mapping of the individual WDTDCR registers with the
> new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
> node.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
