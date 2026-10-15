Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BB34825B1
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055985; cv=none; b=QZLpyv5B+TASuzEyXZdc3B8ALxPzofim7Qce2b5VnQqrbxHxFhJeAdH643/rkmSqMqB+lA2aC/8GA6muL17cyV318ChQGcbT3mPhQgeh7+DGoDQfgPKbsDMU7fXfO91jkspSs1XgzZ3bFZ+mmJMFf42UJk66uiHyMiBpRvdPtKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055985; c=relaxed/simple;
	bh=5lFr6N6uEmNx4LE4jroObbL0ac5PVnqi72D4Bu9Q8zY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpJNg28KF4dR82vVEY8suoeM83xzYVOa+9lS9nlx1DEqVnEAkLz7FMYYVC7aeWCnXulk2x/1Mi09kPKSQ5idBDdn35H38ncMJ14rGPD+McsslsbkrcScIB2gLSt2jDvY3FM6WEEdUqVVM1s8T+OcrhuEBrvCvkx2h7Y37xhu7M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9903fde8db8so697726241.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055983; x=1792660783;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2OmWvdxf6P4clpTOVRX+yvdQN7bAC/slAXj+OD7VnrM=;
        b=gcPfcjrs1aau6BAkVlb5jtjwaPyEA6V7OaSDoc8ehWPNFQwWGyfwS3vnNvCeD9jrfa
         bebh2tS/QMzZBb+ObeOaG0OqkuHNzeb9kKv/3O+95sQ8npKT095naNLwAUNzXtK12N5g
         JoZ0pkGo664q7y+3Jt44XZ/n0+cQXEUBpYGldoh9HCLukEJRJFN1Rgvi8g3AWzb7z6f7
         MCm3JQ7mO69nBIm+WosxUhMisx0hXtGTmKKUFbXOIqlcEId33e+uWy99jphjrML2K5WX
         6HyLmaU9CUh3Pgym6NHxIgObpaZjYYRhFUGSKNVGF8jpw2idcnfSbw2YKBEv/Peo9NeL
         D56Q==
X-Forwarded-Encrypted: i=1; AKwUvBwafKZZbvLFIAR+0l2Wz9kJgLX9xJwdbfq+JUR0CcaosNF+Lv43CZG9CEYEDvL5nPeMhIrUQv+AQpjO@vger.kernel.org
X-Gm-Message-State: AFq9FYL2qalxDZJ0mWR0YwlSFTepVeP7Vep0FO6qUn+nnDYaa8XXia4U
	ux+D4bqt8Q0e4jy8dpey94nHO0TzKPO5vfeOSwJ948mcgm9lYIYGh3ttQtYnMNjEL38=
X-Gm-Gg: AYBFou2CciCHgxWAbXPFgn+NrtQEZWtVreGJlqAtEvJtFWuoy6g99Kpad2uL4eohHk6
	r02NRMBdNnAkyk+iAqZaEUxYK/j0yUwMOAA67+ebGYwepZNiGn60JmeZCAEYeLBpdzM+4fAPbFz
	MAOu4IUZfZXv4jGC4Dd8xJr61JQdLIXFPps662NYO0u/gc5J0s4F+d1Hypdo/JlCiHevt17xP+L
	omvk/TNAyxC4a022ODxvaUrCPvVil3eJ5kB9DOsc7rZoxgSIxOBRIsf0iGn1e4F7p9AwHx/36sH
	92/M32eHi8gs01+j9POIGUnZ9zz2kLTXvqddtFgj63PRdDCSowzoLsKhsSJ75rvBv7KcERaMrlQ
	ui6ycGyTkbVhCtCkKHNwKnmhhcZ2im1kGdGO5nzSg8pod/2aTdFA7Y2nT41bk20CzRyVebxyN/x
	ZVhZBJPoGdpRQfwpFkWety/TQWJjHI+A6Fq3tsYJ+fP7KexaelmAl/PPjmd5RhROqRAeW46L8HK
	Fj3hOIfxuqbeJdlHTP0iEbvf5ZhrlAWImpepyBpW71vtVPllXY=
X-Received: by 2002:a05:6102:c47:b0:7c3:5218:1dee with SMTP id ada2fe7eead31-7cb372ea9a4mr4505029137.19.1792055982725;
        Thu, 15 Oct 2026 02:19:42 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb354a9565sm12843299137.12.2026.10.15.02.19.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:19:42 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5d7daf06158so1785939e0c.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:19:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQDOgsrlDlaffQYCWmQdjGb/sbHA2V2VE9kQLB9t66lJESkb4KkJrc6/iqKMIiLr+cRqNp0QebAB+R@vger.kernel.org
X-Received: by 2002:a05:6122:54f:b0:5cf:54f3:6106 with SMTP id
 71dfb90a1353d-5e91f5016ebmr5648393e0c.15.1792055982192; Thu, 15 Oct 2026
 02:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013120831.1046590-1-gerg@linux-m68k.org> <20261013120831.1046590-5-gerg@linux-m68k.org>
 <20261014-expensive-shrewd-nautilus-abcab6@quoll> <d256f39c-6ed5-409a-a7ed-224165d00521@linux-m68k.org>
In-Reply-To: <d256f39c-6ed5-409a-a7ed-224165d00521@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Oct 2026 11:19:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUcGt7RBc0d1A-8O1Dt71RL=epPgmnetj_4NGCPvCj9LA@mail.gmail.com>
X-Gm-Features: AclHuK98K0mB4QAA_fejEAQ7EVeEI9XZmFZLvangzoC3l8jcNy_b9wBdp9Fm0to
Message-ID: <CAMuHMdUcGt7RBc0d1A-8O1Dt71RL=epPgmnetj_4NGCPvCj9LA@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: serial: create binding for mcf-uart
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-m68k@lists.linux-m68k.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Wed, 14 Oct 2026 at 14:56, Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 14/10/26 21:24, Krzysztof Kozlowski wrote:
> > On Tue, Oct 13, 2026 at 10:07:02PM +1000, Greg Ungerer wrote:
> >> Create documentation for a new binding to support the Freescale ColdFire
> >> UART hardware block. This is found on pretty much all variants of the
> >> M68K derived Freescale ColdFire family of System-on-Chip devices.
> >>
> >> It is not compatible with any other known UARTs.
> >
> > You never tested this, so limited review.
>
> It is tested. It is working and running on multiple ColdFire platforms.
>
> >> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/serial/fsl,mcf-uart.yaml

> >> +properties:
> >> +  compatible:
> >> +    const: fsl,mcf-uart
> >
> > What is the SoC name? MCF? Compatibles must be specific (see writing
> > bindings doc).
>
> Yes. MCF = "Motorola ColdFire". It is the SoC prefix used for naming of all
> ColdFire parts (which is dozens of variants):
>
>    MCF5206
>    MCF5208
>    MCF5307
>    MCF54415
>    etc
>
> Even when Motorola became Freescale they stuck with MCF on all ColdFire parts.

I guess you want:

    items:
      - enum:
          - fsl,mcf5206
          - fsl,mcf5208
          - fsl,mcf5307
            [...]
      - const: fsl,mcf-uart

As no new (possibly incompatible) Coldfire parts will appear, a generic
fallback looks reasonable to me.

An "mcf" vs. "motorola" vendor prefix might still be a discussion point ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
