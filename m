Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058212D73A0
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 13:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527130; cv=none; b=T/RkG0T9fKbyBQV95LFsTWYkkHD3+b2vC2KlP3olQtX3YXRfph4ux7v9scESNW6jWVF9yjLyX4WLQr69FMpJRq9/Sp5Mp9GerVcKtIxHzuiu4DDEfAsRLz6n8pTSyYmr93/aSero0DA+pwr4AlzWKMwi3qqr4sTqYXfoq+vQpVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527130; c=relaxed/simple;
	bh=2pDxHO8wpZZL1aVsWi+EAA7ecsGJLacrfFeBli+WCFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dZkVagUSUXNt2jPG68OLj0Dzilsf2FqhlEI4R8VBzG89E1Yo1UoDpzdQxhGKL7h+weUsfzKbFxbz9qtVh/CrdM6Nq9+MB26qjn7eDJ/SGO35Uz+uayN83Yuej6pDYZ3ovL7+wRnWEOBR65ZXvQ4UBbq/EG/GbThoS2mlkCK/bPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97e76cabd96so304148241.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527128; x=1789131928;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CgqnNAj6IteboRwdvP7GVLALXi8ReI521PLZ9Y7Kkfw=;
        b=h7LlsC9Jb4SUzpJfoHyx2yaLAStrvQS1hZ0BS+eAQUQy/Yuq0LHeqWlcY4ERPDjpvU
         swIyYNvWnIpu2fiG3Zl/MQj6pZRZVjnxaRxskH7AdUyH9jw5Wx0pjuxxRU/iXtBbkO9x
         YyQp26nLFoILq7Ol/S+VFMG5ZGlzI/kjnliJj2KhojVhlSImIoixiDE9Zr/zUgdvdySd
         WU1tT7tNnlhJV5YqFftUEhkGThZzSjAm+d/fvJ2resWq3alasAx4MRIfEJo86U0di3nr
         RqDGemRlNr9eZZiFB3inLOJzy+LtGpyecZ9R7uUE6RB5J4zt/jHp8my+MSGiN1WcoghZ
         BdAA==
X-Forwarded-Encrypted: i=1; AKwUvBxq7Gvr3qwQdfucuhnxULXtXwDN4Zd6tpPqWdUNbWPphRfZSEJtPMRUZ2Ujk65u9ONV6LIEefC2KerW@vger.kernel.org
X-Gm-Message-State: AFuF++k0lx0T64rDY6cR2VEyDGPbI5S7Rb7BFh6wiCTGaHZh1M2Q2fNP
	lTz02QkuqEpIXKJEkuQh4s9Em0r8+XABUugeFIgtwpE6pJQsJ2Tw4Dbyl796odwZxA8=
X-Gm-Gg: AYBFou2go6WeZSgttwwGZPW7JV+V/f8pxhHbQxer8z3GoMcNKvXSdIMKPJksPVVTItW
	USyBYexZGXmYhApAWA3zuOxQHMkYHJ09Zr8sYEN/wFpUPU1ARGrBvjFp2YyyPVTE3LiSpooksuu
	bHdCULymDVTO5RkfJ7eF/4e/QS99/j+Sp5EnC3AkhXJg9QC/3FA/yWiffcKIlLbPW0bxpHkTaOJ
	BnHcd+h89qWZB0eJGEseYcr9WA1xa4d/Fn1zXUcL1UlVWCP6Aq3X93aSkNex49Z1Uw/xsGuC4UW
	pWFaBpsXpovEhKlyTwIBUaC3pm7FaW4Izz4o1MLLPLtr6YE2xsE14LtucxKr9BjT+bmJscDanhR
	EuVfKL0gEn+8rKid+E08uWThLb1HvwzajTcPgIsMpr3UZRMr67TN7AQ2GZrugmrZKeutUlEvhCQ
	C8CY16NheJqL4HYyTf0TcZ/k169BFSQoE2fI5k1PVWtiyycB96pH3hv1Uq1UgF8YWK0FOzFz6Ie
	Qo/lyd7wqS6PO8j/z+8OS3WT9xANA==
X-Received: by 2002:a05:6122:794:b0:5bd:af82:fd9e with SMTP id 71dfb90a1353d-5c7ed437367mr2147142e0c.8.1788527127815;
        Fri, 04 Sep 2026 06:05:27 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9809e56231fsm169412241.2.2026.09.04.06.05.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:05:27 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c7afda4515so598182e0c.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:05:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzYG+BnrQG6rlazKuv4ZfvEBfEKcdoLAyh7+PvsEghOl+lXToyKWJQ29CaHWoQS3+K6CU3E1GSM1PdJ@vger.kernel.org
X-Received: by 2002:a05:6123:67:b0:5bf:b500:c4f4 with SMTP id
 71dfb90a1353d-5c7ed285aefmr2496181e0c.2.1788527126515; Fri, 04 Sep 2026
 06:05:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-5-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-5-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:05:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWPd16C-AazzCHJ+Rz2_qMrTwOp1e=u793LimvW99b8Mw@mail.gmail.com>
X-Gm-Features: AcwNN1WKYIgtG8pquOg-3QDCj5oIF82tVACq3CFfADEbuvkkdmux6vPLdOD-FKA
Message-ID: <CAMuHMdWPd16C-AazzCHJ+Rz2_qMrTwOp1e=u793LimvW99b8Mw@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Document the missing I3C power source option
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 14:54, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The I3C pins on the Renesas RZ/G3S SoC can be powered at either 1.2V or
> 1.8V. Document the missing 1.2V power source option.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
