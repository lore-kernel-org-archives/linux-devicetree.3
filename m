Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FBB34B1A4
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577886; cv=none; b=jf4uMVfcRVIEeFKaie//Hi78J8GNP10U6TByYUY8jilr0toBPNbskVa9lc0279dCFKs7dwp3mZUrz7omGm2h9cFn2cOZlsENR7JZeNmc353TfxD1vMmYTrhk5s/YOXdP18uPwEy5dPEhpvL/CInt4bxbVWrB1rrWh3+Ol6qociM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577886; c=relaxed/simple;
	bh=3BozIRFX0XVcRPh14qUSvxNfEz+3z1/4Q1ijWbUu76g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sl5vbCF1ApmPTp+RYLHx4v4G0MLGBdMLGZPIjQfZZqSnVvqHYzNwwHHtKtw1R3ROl5gcMdX/H65seLx4URkWsKULHNKH7XkNGTOvZ9flVpCDAVOciQqmjZCnKSBA4TPJYJduFEThYeDKY8g/jS925eYMftLiaaDPbVZhXJ1P9G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6efdb57db0cso182037137.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577884; x=1781182684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+cgkG2XrmSprydcdZSXs4CV5HHl1wWqa+3ahlLHMPk=;
        b=hLAvgi+ualNEGFSO57oET5RZicSj8kA3MpDRc+ZbvdnQaD/Skw1QMUZb1fig8PVPNf
         KmTUztnkAqj3mwr5X1fLPu0AkJpE/nGrKu0Ec+BXzYI/7k1jRi9XaIz+tWSMfj8lk0vv
         caPSIZ3lPu1Tmw+VE81GZblLs5LKiHYu8lcgGDm8Vtqyz3gIQWvOcEmPngCaFYQ9FwmN
         UMYAzFhUXEwgbPs7FjiGzZCs6vl9VabXOK9u5iSpeMZqafS8AxfAlWTiBYKup0HHE+ez
         l25V31PMHTwGY3gdcF/+NaiN6zHqQb5Y23QsnVIbRkDP26Yq6zRx/nrABAFGGsYIJlX8
         /9hw==
X-Forwarded-Encrypted: i=1; AFNElJ8JfZHPCOCw+98DZFzdCCMXfP1rL3Z/ysyMHpQf9x91HS50FkSbtO3QyATXN2owEGmJ6td1c/GLq9vL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb1Tvp+C0KwT7/9WkEhKaYRM19WV1YxafQLfXNocWoojJj8yYa
	L8s+GqnOp5omSmWX1achVjWvsJKrZypfRzl7LFj3Yx/KGvQaXlnkA5pAzcdgjOvaB6g=
X-Gm-Gg: Acq92OGyZ0fiMk+B0Hd1sTWvQMRBylMCgyPWENnx493zqv4fDRcLkwUm/9kk/HlsdGb
	wlF8lvvR+6vj4bOC8yee7gfNVm/sJuj6Ho/9GNt9R/S9dZs7Jbe8TSWFFrBHZ2qipi0UISg+6gH
	jXf7mZf8Sm/MW2HZn6HWcZ4WpvDfi0MkPfHx40zopYbIreLaaucViNjQ3QkUkDg/ANz1qKCaPHr
	wHFAiiKitVMErNtbkVRdG6VqVHwhfe31yV1ya1L2B2xnX3ziUmfWE1TqI8MqCq4oIwTIMP1RQQk
	cGrC3kiN9zTrwJ/JT0dCCmB21hyb0kwj0bwzPCEmqaNrJd90VV8DSJaiCzGAp+kgsM1iiED/IW3
	TACiy4MQcYTzLHjmbu4/1tZ+yinCxcycjgX1RgwRp+UI7wjvHUZ3bxNSgVrMZAxFFNNePsT4/8G
	Jpenxe+oMNQO6yLA1qiD9iPUKlHeVx1LD/A54GFv6zAstlujARZSeic+Vng3q54CDwjaDwjYs=
X-Received: by 2002:a05:6102:3b12:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-6f03ba37f91mr2654084137.5.1780577884088;
        Thu, 04 Jun 2026 05:58:04 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb5549144csm4922602137.3.2026.06.04.05.58.03
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:58:03 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-963849a4611so210655241.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:58:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9rSWlvQcx1pHWn02VhiC3iHwpiFgLGQzH/gAzJABBTArcHXum0w6AGvM7DnaKUiIA5kJn5UJNoRBdR@vger.kernel.org
X-Received: by 2002:a05:6102:3ca0:b0:60f:ac13:c99 with SMTP id
 ada2fe7eead31-6ec4c6a7de4mr3907416137.29.1780577883424; Thu, 04 Jun 2026
 05:58:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603143340.162457-1-biju.das.jz@bp.renesas.com> <20260603143340.162457-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260603143340.162457-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 14:57:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpoZUcaFcX6t5BACbsPBmteWPvYQ6Fgg+U05fLtp5RKw@mail.gmail.com>
X-Gm-Features: AVVi8CeUJOt-NQH728msRWjz_l9ffseYZ5NXxBnD-eyJOnoWkw_RXypEGFc9mw4
Message-ID: <CAMuHMdVpoZUcaFcX6t5BACbsPBmteWPvYQ6Fgg+U05fLtp5RKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g047: Add max-frequency for
 SDHI controllers
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 16:33, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add max-frequency property of 200MHz to the sdhi0, sdhi1, and sdhi2
> MMC controllers in the R9A09G047 SoC DTSI to define the maximum
> supported bus frequency.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
