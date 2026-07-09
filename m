Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55943FE37B
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 10:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592965; cv=none; b=f74fH/F/WWXDbWH0uZtKr375qUj9/qHWgEQ+JkRFajPnrS1rcErxpVH8eYhnyTKmKslUFNlD3RTz5Bk6nvrF81eAQBdZ74NkTDvhEHOKzdkuHVw42rjGlpDc6LtPcPFOUqacw4q0g5KUzvqOPP2WdWUTj93zM61EHoTefhVjFOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592965; c=relaxed/simple;
	bh=SGuHeYTcGstwO5n9DDhvCGTcKVnams+042+BkbBAGTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKFmX/2UCsufdlJ+P0lnen9w/RukMJGKgy6tB3X4mqqsOOeVOJmAHlbR0SjZzqsjvDkOsawCPXPlNh2ANNgfahK8Flf3pR7Ti+kkwb29f+7nBbTA50o21nMX3vUv0JfYNrnQLwycpKtXbbVBniLwNUsaFRviDL15JWo4VOqpU/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bf9466412fso310213e0c.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 03:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592963; x=1784197763;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZamOEqvf20g5QpO72EPkaDRuNkZPExK+6Unu2WZF2DI=;
        b=MEuu8N8fPDAvjepA69tvpjOtRr/ULtN+XNwHjUWEU2sYxGNVxuKq9emE/gomhNBTQx
         xBtuUOkcE/Cto8LosS6gAzzJ4L9FlWlVRUaYJtIGRSoRX+acVrAfaFhbgGV5B4wrirUn
         ovQ99OeL1YkE0l/mz3yaxoldRiHs46Idrc9jYs8Jw0usucXcTMYxDMgyAP2w6yDpU5M/
         W8hbW3JZHy0chTy/DNE2OFHKk5gn0awgnfJ8TGsYuIexjN3/K7elNL7kvzv1oyfERiwc
         3JJ8w1hsWkAmBeQEt3cAPJQU7a1pnIDmX91exjXyYPBgDNCpl4vKVjKbkhHvuy8cHA62
         LiCQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVbmguEaPfYWDlZ1bxQZB/4kJe70c1SRyfWRpPIvZBykIxRzk6xrwtyDHMs8Znf5yAMh9L2fiPZTL6@vger.kernel.org
X-Gm-Message-State: AOJu0YyW0DQxAi/OAObnjC6fXzNGVzPBuMwhE4i0RaZ38ui4wboNv40K
	ZqQ2UHBjBWFdrXx0ZsGbziZIDdVOqjdxQUrMqrdAyE/kVHD+A3srWtoK33UCEdHq+zA=
X-Gm-Gg: AfdE7cm5oeDTowqphfX75f1stTQC+anw+zYhO42I7edy7+b86hf7ovcjbcetvvlnEIR
	v16EWNIXpxfxutPBvkUaO8WGVq/olR2Y+gV+6u5WGDVxsgrB2hAxGUUIcgheFwo9QVW00k2ULji
	CFdlrLkMK1nBM0Ux2D9jMxYD2MliW7ppjDMdhOKe9sdUm3xbwnuaI1YHsmxef7wPnMmBspId1xK
	UcG2ZhgZzZjb+fXrPa2GSgyQ+ZMCB1H2gWJvw2Cnq5czL0G0NX7gPEfrvNWxUinKW0oXwmzPMar
	dTls4aORpfrDaY+bD0EQpb4Wz4OUfOOmTVKVmKGYxXms6Y/F9V4QaqQU2hKoewFvuPfYP2KhQmG
	EBcOWM1fH1Xiz5jdfsIAsh+yYsTSWuVV0SpB+yBTSkbXh3BepgePFZqL5jW4lnWzBBp/3KiTmjr
	//uTk6T6h1Qm2TstNwK22++Rx4cT3bATHu8S6xO4eAC4X7rV3Q9QgwZg==
X-Received: by 2002:a05:6122:288d:b0:5bd:a810:b090 with SMTP id 71dfb90a1353d-5bf75d57b8dmr3399781e0c.5.1783592962892;
        Thu, 09 Jul 2026 03:29:22 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf8bc8e082sm705348e0c.1.2026.07.09.03.29.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:29:21 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bf9466412fso310182e0c.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 03:29:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpBHgbW+2m3bSH/icU2z3k1E4SBA5ZEFgIsG41GaWhhLlupNsLQ/OBNeZZqM6vHH1tUDDn5xgrwszTF@vger.kernel.org
X-Received: by 2002:a05:6122:16a2:b0:5bd:9d27:1ded with SMTP id
 71dfb90a1353d-5bf75d09a7dmr3522535e0c.3.1783592960849; Thu, 09 Jul 2026
 03:29:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <23f979b0903ca11513ac339ab8b6dd40435603c5.1783505142.git.geert+renesas@glider.be>
 <a069d50d-030d-4189-ae9d-37f989829da4@mailbox.org>
In-Reply-To: <a069d50d-030d-4189-ae9d-37f989829da4@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 12:29:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCXVYtN+jykp3Uz4tBHpWwW488=NguxSpWkYkO63BB3w@mail.gmail.com>
X-Gm-Features: AUfX_mxryCBg0UJms9GxmXbM4sVe50wH12jLcYc8l3gBc8Xa9jNslCUWm3ZIyfc
Message-ID: <CAMuHMdWCXVYtN+jykp3Uz4tBHpWwW488=NguxSpWkYkO63BB3w@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 8 Jul 2026 at 23:55, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/8/26 12:15 PM, Geert Uytterhoeven wrote:
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -358,6 +358,7 @@ config ARCH_R8A78000
> >       default y if ARCH_RENESAS
> >       default ARCH_RENESAS
>
> I know this ^ is not related to this patch, but is the "default y" and
> "default ARCH_RENESAS" above valid ? I can find exactly one such use of
> Kconfig in the tree.

Thanks, both are valid, but sort of duplicates.
I will send a patch to drop the latter, and restore consistency.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
