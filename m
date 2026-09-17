Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751754F0542
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648568; cv=none; b=gBv9P4A34ceZs92ISyq8H3+R1rWb2DhebQOvGjwJTDny+2gEebiwE2n8IcHbqGNjk5VQKp0uvpHIJ9zpFe5umX8HAq4Boor28hatR3gOTbVqduuP4sse04dfnANuM64pYidH07Um9JmqVs7bU4gURmxSjXsJRLg9FmBI2kn90PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648568; c=relaxed/simple;
	bh=3jBklx3OV81z21pgMfCutwA9rsrppPeVwShGVq099SI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cLKJ7Ic9Pio2dlqbojTzQ/pjaFDLOFIs0pBh9tHGM28PGbeIQ6XFlAFdfjuNP0aGbtxgMteH6TBTGupJYiuPz9mg4bPrim+byx4cVmPTA+U9wTjG2I278ibSkL/EYPHwIkjrHz9SO+Alo9a4ilTwIsoCDo8aKnFbLDFXLT0VPD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e512ee9so266411e0c.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648558; x=1790253358;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aDhAcwvSBAcGlBOnGD+Htro9uYMnuj1oYxROHQFN0Ig=;
        b=f4/weSGPwVWMMaeYfRr7YgSwtAxSrW4GYftcnS7U5LCdk2sx3JebMO2I9yeginplvL
         YIweCqqfyCTSpoiMxw9yhCAk1ptjjlk33OogeneBgfL6wEcLoXflPFVOTPLGGSRvvY5q
         kRQfPIl0g9LB0DVRyEXi7LBFNc3OMy7VpJmRXyNsi9zW36cI3dZIuOth9R1GKKDUq03x
         D2ACtLj4I3Bt7XVyoDGJnQZlcqA8YJZzAQYb63dt0pPUahbI2ZlTzoksLBvQFgUpLJLv
         TIT9xIwvjxqnHgolhy9Sv/fri/MnzLAppJO7eTm0zgCuUN3943re15LGFvII06gRuQra
         ykrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwA7OrKPZa4wn+kgsfCGp7j2pgAaGEBzQ1EYr6avdVEQsszpOAigRIhbpirozMOkQF38YeE3U1EJ3gF@vger.kernel.org
X-Gm-Message-State: AFuF++mPNoRu2KGBDZrdZn4ItunvoLTmGiR8YeDd8CdZHn82ngsnrb9t
	oj+DzjWvOMx/XW3pRA1c9xVDnF7Wdl0A2D3+PxItq/AtM2w5FRkngiecpN2WEZWfulA=
X-Gm-Gg: AYBFou3Z5DovVw01JOhPfHYN/D6ZAk1cTPdOFexdwIXj/+gg5ANlQgPHq1KLtWJhEf8
	yYDWQIcwWpIhzSgjgCvOre/t47cQSSsRY5acwHbtMYWTJbLOzoURmVZc4Xv2ZiLa6El8Rn1YEQW
	tHXWXIZIoDxHj5FR7jflJcJVJxtLJw4TlcjSMqO/3c6IL3FtMcjE+HwqY7QTgsjIjydtyKA9kHU
	qttbrz+0Er3xrDmHUUCqqZ63eKisOLQFCAw+pFt2gqXSuSctbVTxt5vys2wRbMtZFwm8cb7h35Z
	as5Hm5/pmO+4WZSOJjq24EaYvYGq328JoZ6Q7pvMfLlsvpPdlV6+qm+vBOYdg6E8l9vR8Dr+lC1
	4j+lQJfrxMjgSaP1iWkcPjr+acVpVkYBhhpbtYUeQaM9/m84+zG0DCm6t8GtI7vCs98EUqpDrBh
	UMRj+s52dPvnJNOCL8zy2ORByL8dGOP7dxMh0+eqEKxpq3hAkWbfBp/PhDT5RC/YHMnv3+RuetB
	Rzy+T51caGswHhphupTgFUeRtSwX929VNCCWA==
X-Received: by 2002:a05:6122:1d43:b0:5c9:a60d:3277 with SMTP id 71dfb90a1353d-5c9a60d3a1cmr1996707e0c.11.1789648558124;
        Thu, 17 Sep 2026 05:35:58 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9a5361498sm2471517e0c.4.2026.09.17.05.35.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:35:57 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c72bfe7so206933241.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:35:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw2eGNgZ/xEOQH5m3Ds7+DRZs1Ya/VyRAKQaM/KUOuKmpZ27Bsp7kN1dct/ydc4o6OBsPZRV1U+pK2q@vger.kernel.org
X-Received: by 2002:a05:6102:160b:b0:79f:eeb7:d643 with SMTP id
 ada2fe7eead31-7a028c6cd05mr6743315137.10.1789648557334; Thu, 17 Sep 2026
 05:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917111349.52250-1-wsa+renesas@sang-engineering.com> <20260917111349.52250-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260917111349.52250-4-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 14:35:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcFKZO7GA-nQ-BH-1k127ZAjtUaZqHAbu5FGTmuCmk3Q@mail.gmail.com>
X-Gm-Features: AcwNN1UeqeHi3FMvuG4r-xFK5-Yd1nEb0E4krEULSwZN0Cf2ZFOfdU8KBvHRK1E
Message-ID: <CAMuHMdVcFKZO7GA-nQ-BH-1k127ZAjtUaZqHAbu5FGTmuCmk3Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: rtc: rzn1: add R-Car X5H support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.csengg@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 13:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The RTC on R-Car X5H is a bit special because interrupts are not wired.
> Future R-Car Gen5 SoCs will have them wired again. So, create a
> dedicated entry for X5H without interrupts.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Change since v2:
> * handle only X5H for now and do not fall back to generic Gen5

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
