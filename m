Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4663E123F
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281548; cv=none; b=IQHICDTSIOMZHxL8BxO4mnUOKjGYwvrBTLT1bEBDUtDjRDQ81Iul0Ndy1d2mfl0ZFYUr3TSs3+B1fITLtatrlb4hofbAAOHMLcKgH7NfwwEQUrfZUbiXBZIHEKSr/TrY7Mt1DiKEZUsP/Vnd+4uTtwPUOjbgnaKucNnl/UnV0Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281548; c=relaxed/simple;
	bh=wEVllGGRlitUi5HmXwQREobUqeKu0+IX4H6Zregl6ks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VKY+BW3MoStIPFBk/cXRCk75HLivYfM4Y/Av1svGLtL/86qaqJUcnNXUfBdX8BDAPhF3dqhKhXCpk/5daJ1T0iau2J0VWVhXvIFxmxPV4jFjL/a91OcWNDY7dscAjZJ7wxb2Ipj8msBvD+Im0ZWfTl8Nm+gjD8nJbXF3K7uiV5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67c4aaf76ecso8225884a12.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 05:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779281545; x=1779886345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7Xbs/1G/OLUO3ICUULHrqolwG0BvsCuGFywNTCkVd0=;
        b=o3kPp/yePTQxFPWXlKz4wjai5bw6j1/6X1Q1KGqJGo+US8BiXLwFjrx9X1+hIMbeNm
         OrWqiSiZJ09jpNU35AMPbrXhI8J4jRqlOGr4dK3i0QKS0UpfMNBiGulh+qyzN2/pjwTb
         PYx/qfuKy7/ITf02uBKgfgjuSTgL0muEO0P6tKZJM24a98CtCqW0GEoQlaZZCdH35REQ
         lL6u884tttRYIBS4VfEq3ZNNRT9OwXcBY/yFtQ3LtnLwKG12yH9R0kImoKrrr5iV2ZaN
         eT/ze36d5ichR3DV9ul8IL8sfF1KcVpJ0pbf8RLetxw7T7rsjAQnC1aUySyREGXwvPrl
         o78w==
X-Forwarded-Encrypted: i=1; AFNElJ/x8Vjm9qnuShIYIDOHHonY1UVKOZR1j8vr8KnOAPuE4y7VkbJ36Tu1j6VBjOpn2fPqsiMYbpTWTpXl@vger.kernel.org
X-Gm-Message-State: AOJu0YyYMVikAQ2zA+agX7ZCR93l01uIzLoas2oJgFwDgSbP93ZgklLg
	ufumfHnXYsDu8u1Lpy1T1Bx+X4+vHQkhwiU4zkLqa1C1FWZuD3OS3AxrzdCXKL+mSY0=
X-Gm-Gg: Acq92OFNRl9WgFh4VoyF0jyacjqnzpv6WubHyakzUP70guh+aSv26jL+qlAjcodNFvY
	LQRV5Qov5Y+RiFgWToJJj/ZuGjnoT+8q1vogD0xxlCmgo56rh40to1qXRW0qhr1Nv9v/Pikw8cZ
	O0W5puCHExsCxPFaLi0sRpndBl85urKJjSkENRqVzYJxYdBeMGpInTlr3omE8Ja6c1B+yyfJ/zU
	zp2prfEGvQA7PDRRuaQQoL8HDSAD66SBM44Hkc2jcjG+BZ5dmGY53Vj4xkQFlTvMnUkAiQ51dPl
	N5faAx6UMoRy/FUqo1DcIaH8qLD+6XpcMlxGM7iac6w9Ds1KcTclIZa9WVMbmvuUDilDiY7HwEn
	dJ/qs32rwih7yI5JPUPR1ML4VLIJOU34C5GaQXeo7+ASH7q1x5oFPGh6r+FZoGKD/OIvpNLM3SJ
	i7ELwDfGVGSwnwQOg8TNkwCSRbxesBgM/LDQT1hBh7SU2E/EezAkwYwvEVhI7ZF/x1un2gqdS65
	ZBsZPOz5Q==
X-Received: by 2002:a17:907:a893:b0:bd4:b787:f1d6 with SMTP id a640c23a62f3a-bd5177a9b95mr1331975966b.6.1779281544816;
        Wed, 20 May 2026 05:52:24 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e21235sm844569266b.43.2026.05.20.05.52.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 05:52:22 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so8276179a12.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 05:52:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+V99B8m1/Q7JqAc4tCmDQ7xeJGuo08Jynzg8FhOG94ha7l/UYz+6iksMQ4Z/mSCrg87ZybFDifYE9h@vger.kernel.org
X-Received: by 2002:a05:6402:24c7:b0:67c:2674:a57 with SMTP id
 4fb4d7f45d1cf-683bab3799bmr9664076a12.0.1779281542288; Wed, 20 May 2026
 05:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520115144.60067-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260520115144.60067-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 May 2026 14:52:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWapgcYT8fOz+1uwWS_apAFvAtCEkqMTxWzM2t49TJptw@mail.gmail.com>
X-Gm-Features: AVHnY4IwpQkTbfRh0vPcsz0GG5a7bDpYXgakS3Wb4uu6PL5AEoBqm9urgWKWvzo
Message-ID: <CAMuHMdWapgcYT8fOz+1uwWS_apAFvAtCEkqMTxWzM2t49TJptw@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: renesas: Add max-frequency to SDHI nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 20 May 2026 at 13:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the max-frequency property set to 133333333 Hz (133.33 MHz) to both
> SDHI0 and SDHI1 MMC controller nodes in the RZ/G2{L,LC,UL}/RZ/V2L
> device tree.
>
> This change results in approximately 33% performance improvement as
> it sets the SD clk to 100 MHz instead of the max 133 MHz.

I guess it is the other way around? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
