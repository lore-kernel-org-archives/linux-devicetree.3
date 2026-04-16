Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82134277C9E
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342793; cv=none; b=ufdVrhdbC9O0x407UQjnt4M3jKN/jac9AyepqzjZ15N7OXR4Y8IHEI9ug9H4l79ZAfkQ4fmXxBC8P3W40R0qMqwpXo1732JQF22pRIebCGziF+RiegvqgiWTWfxmTvIib27EtTM1oM7GyOIxHPkJuYnPBa0AI2blzKd3aXeh+xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342793; c=relaxed/simple;
	bh=F0KRr1fNLI9QNaiGUy7X498/hzWHeh7SvOfYmIbsG+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XzwVKmM8wbvlpq0d2jNcHWEIPbqMIKw04QpltIvSG9mTVUgEZGPAvFcueBK8W7J7EOoqeUpaUxq42oynjp/qurpZzVEy2lrg9LMzWm2EzCxo95DOCwnLkB9YGjII+loyOISPe8WBCWsC262TuzCMLFffTFq4MQrGwmN5U5N5OIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-956948531a1so1278983241.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 05:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342791; x=1776947591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRFemq5MfyXGBsug9FBiLn47cAaLasQlDTsqCZS8paQ=;
        b=HsKBSqa5291Yl8QCdIUeTLZH/IrGtXkOyw1AGY9tT5sRNO58Uh/Iz2UL2u2U1vZHsd
         xeUiR+i9xQshLRmwy0fyLEGuTtuaA7TmeRquzhaOYXGevyd+Es7Udz8LL+YKW1DDCPT2
         9JfGd4tpwjJ2NETuXhfZS1WJkNk+nqzlNlYjJlQ2c8dRl+TKsZS+QrYNaFs0vZeHUfPr
         wEzodtuL4wfCKMq2unBcZTzaR7ATVOvaqhvO5T4ODMt8kk5h0IQECRoUU9O1cBRvqrJT
         3RjJDf0E24QpdmGCv1Os8T32dZgKqoqCZnQHQ9aPmxSKhB6u2A0giv+y9+5htVZRCfef
         z2xA==
X-Forwarded-Encrypted: i=1; AFNElJ9W/K6hZuWGoEAVjCesPmH1tYP0Zm+BPujOguMHUy4j30j9L4nRxOfTRButhP+SgGyn2mDttDaW6uQJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzXC0MmSrbHEGPqU6JqY0bpq0txD1syENzSyIVrHoxnRorscs5r
	XYeMfAjQOMJH8zUYHglp9YM/3dfVs8/2+UZBOVcuuPPdOgI6xaA/IspSyeK1JDDs
X-Gm-Gg: AeBDieuZOASt3C4wXCxO8u17BUv/vhUVZqy5Xlnqbe/kYj5JaXt5L7Sbf9T6WM9pS9a
	RX9MTi68RBIrOAT5gxyho7G3GtcFwksrHmKL416NfiUsNGRLh95NYh3klEnLaoJ2SUkZjWdvPpg
	nRY2OyhjXfubXLeujCuDIDS11Nqw7JOQVsLQ3D27sRqZmEVrjL/vRpu+YsHTwEaeh7h6T4qBJRX
	kCYdWanmfsg4cCzywx6iv46zzcZ3l1JRaKJLkSTxkJylvhObnr7F615rGyEQzrDnecOqxb9NwE1
	OcVj02SO6x1tty5tr6q7+8bcFeSRe3HinJoKujOPkat+uAtL1vvjmOEEhRtyevxKz4+ClY6+1Oj
	7WX/M23XQfpxVwTz8RCkaIGsTXkjO764thk/X8vKzUWQhxR1j2L9NuiSOHuWCYTka0B5R29vxsF
	nkPtLvAeIVe5WxepN0jkMTHxaP/ZPm+8tuT8RSJX+91iVrf/My48yb7V+TSqWun1TvNdqymQI=
X-Received: by 2002:a05:6122:62e9:b0:559:5ef5:b196 with SMTP id 71dfb90a1353d-56f3bcfd5bemr12063514e0c.13.1776342791523;
        Thu, 16 Apr 2026 05:33:11 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56f89dd3540sm3017648e0c.2.2026.04.16.05.33.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 05:33:10 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-61179fc2242so796859137.0
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 05:33:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Ds7iAwQI0wRLh+8YNvlt6y5ML6/Fi34Wsh6te6fARyBAyRhNLg64cKE8MMcs8qSiXz0eeBlHvD7VT@vger.kernel.org
X-Received: by 2002:a05:6102:358d:b0:608:8fb9:9102 with SMTP id
 ada2fe7eead31-609fb6720ccmr10437630137.0.1776342789380; Thu, 16 Apr 2026
 05:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
In-Reply-To: <20260413100700.30995-7-phucduc.bui@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 14:32:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWXPrLxY0u1NxoFatn51+VFZCb21ktieKXoU851HozbSA@mail.gmail.com>
X-Gm-Features: AQROBzBguP3PgGaZjGZ5LvVBGYPHFMcYN5pNT3cJNtzjVS5xLJ_ABy0llU6KPj4
Message-ID: <CAMuHMdWXPrLxY0u1NxoFatn51+VFZCb21ktieKXoU851HozbSA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: phucduc.bui@gmail.com
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, lgirdwood@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bui,

On Mon, 13 Apr 2026 at 12:07, <phucduc.bui@gmail.com> wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled before
> accessing its registers. Without this clock, any register access leads to
> a system hang as the FSI block sits behind the SPU bus.
> Update the binding to support a flexible positional clock list to properly
> describe the hardware clock tree, including:
>   - SPU bus/bridge clock (spu) for register access.
>   - CPG DIV6 clocks (icka/b) as functional clock parents.
>   - FSI internal dividers (diva/b) for audio clock generation.
>   - External clock inputs (xcka/b) provided by the board.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Thanks for the update!

> Changes in v2:
>  - Rename FSI module clock to "own" to match driver.

Where does this match the driver?
Usually the functional clock is called "fck".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
