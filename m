Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D8638AC92
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425559; cv=none; b=VrM8opXzgcMfI5sed8Ly3WuEy8Qs2GNkXY8+KDM8RE4xmP/83D1dcQoV9DLexIc6jbWUlxLfVmvxglfWBhKMPLfuvvzONulTOycyOltm0B+MwCGeTHxR3T8NdJPhsf0o/8V8rwmU/xCrCgAiW+R0kPgTmQTcdn5RZn8wjDB3m0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425559; c=relaxed/simple;
	bh=nCjep19YpVy7ptXJy85uM8qZLDh2PaaoyCU7UFW2ucY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMtiBbOZHlSSctzpQuwO8CTPbMs6/CKq4SyaxDaj4Qis0RIRjfSWDwu3udnwNQHaOQmOk5b2d8Mj75g+8WMbDsF3tldXDxtDUb+RWJ9FUmAjDVSZqa3FKQQA3tw5GyDDBePUXhdt/J51SkcldHMQYg0v8A4uUItYQfAgqe3El3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bfc54558d5so1243552e0c.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 01:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425557; x=1789030357;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C4rlCOn37h5gJZpVKAKNeNVZ0qRLT1DFUGwUmbfCeTs=;
        b=KxuiRdujh5AEJFiOh2VvuYgeixnXX+4DnnuYIR4umJpMOvbE8sxHygtJXSeiE3McXL
         eJJixobojCvE2sg1qDeOw6tIccHV7yCeSggslKojn7ivT8Mmh+5fMxJl11vHa8P+OA7N
         9px6pyRTXZ5AkO+ondmGZUhUxgbyKkq2bo1IUdxr2HXB1jdORoJ9VUgcexvFgD1ZOA8E
         52OSC3QPuPl+KGSn344dlOkigHq0LhWp0TTY6CauxXgepivxiEsumVqZlySQ37X33Gd+
         noBQOXazCcpeZNQNX+wd5rKvavTqVGUGnAdUIxhRumeuhmq7ZfQOHm63eqIWNnN1oydu
         H6Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxDOZqCYNX1GtW+6q6q8UOWvbfNpfZcBe0PLOs+Lsz+sHBvMNyMOQuzK9kgyS9blkyazHMryw4Wf38C@vger.kernel.org
X-Gm-Message-State: AFuF++noaZ77RnEAb49ncQGk2JD4onzoQnzf9eilVZIcC3VozPD2FVV0
	JIUnVndFBHliLvPerhHT0wo0PukMPfbHol//1CdGGrkQcbEYMikD3Ze+nS2tg/tGqoA=
X-Gm-Gg: AYBFou3J1GLMwRG8b9p4cgB25oWQCQEYzq63ihmtd/HHAfxiv2Ha/GBQxmijRlJfogL
	rEVjdbAdXhUEvv4RdNxCgtiCGmHaWBl2ty2vuSyOtuCHkGny45oma3bUpnReaWmoGAR/MriW9ZK
	vpy5aXH8zYEkCccNzr0NSEzhGfD0rgBv5V/+5DTnXU9JgOx3HtLGPeKl54fq59sOqDWz5Cq5/4t
	fANDi89jqyNwjJ+BTYMqBWSbKc+xb+ZAgTSY02VsQ4QGcDGUcmQFZpvFj+cfoYvlfASiWsQBM+2
	e+yDu24yZaqPlNNkrfjnIU264etUCSElhTvBFd9pitLj3X4/b259noEFio9TevZ7Wf/EQxwr6jc
	BUSl+emarEeoo49ALg6WOwTZZvoj3w7Slrmek4ztVxEEjov9Ld/PVk9FQ6GJ3/83khRt0EX21BI
	enVWhlbPkzL5HZnzaf1o5H2xzsMR5qSKe817Ui+fRgB/JuVCt3p/DegzygWEb2JAD9LQX2ENS3E
	Txhrdv4nfAAIAkcP9ykvWmK16W84EjreeOJ
X-Received: by 2002:a05:6122:6b17:b0:5c6:58e2:8a7 with SMTP id 71dfb90a1353d-5c7dce4c183mr1467564e0c.4.1788425556931;
        Thu, 03 Sep 2026 01:52:36 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd73a328sm3911868e0c.3.2026.09.03.01.52.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:52:36 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-78a220b5778so767643137.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 01:52:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzZ54VcIEBSCTlw9xHdbaNNws4/nJEnYwaq2pZFcpYM+GnyrSrhbQ0sMaFTjIP76soq1fLOm1nPjeIU@vger.kernel.org
X-Received: by 2002:a05:6102:84d9:b0:778:6695:2f71 with SMTP id
 ada2fe7eead31-78a2efc74e0mr951843137.15.1788425555897; Thu, 03 Sep 2026
 01:52:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
 <aob6pW_BQbW_hF2e@ninjato> <aovmzeyXAQtb063B@ninjato>
In-Reply-To: <aovmzeyXAQtb063B@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 10:52:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYg-QhMZ9e0i=Nzym7-8fcFfahkTT1HKwxQ4d=_0YDng@mail.gmail.com>
X-Gm-Features: AcwNN1V03wVoMTHnfOLNCqV0N8TGrKgNMWk4P9bpEKw35T0AC3SEfctOY_5pVKE
Message-ID: <CAMuHMdWYg-QhMZ9e0i=Nzym7-8fcFfahkTT1HKwxQ4d=_0YDng@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] pinctrl: renesas: rzg2l: Add support for RZ/G3S I3C
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, linusw@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 24 Aug 2026 at 08:38, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Thu, Aug 20, 2026 at 03:01:25PM +0200, Wolfram Sang wrote:
> >
> > > Changes in v5:
> >
> > Tested with my G3S + I3C setup. I3C still works, I could also not find
> > any other pinctrl related regression with basic testing.
> >
> > For the series:
> >
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> I'll reply individually again because patchwork doesn't pick it up like
> this.

That's why we use b4, right? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
