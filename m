Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75E63F211F
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 11:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463592; cv=none; b=TE+bhQr7XFv0QHr3PDQNIgOFaVsDYmkLEp/xsq786q6Hc5VPJEAYNUx0ihl/HVNPWgC+N6kpZnhyEYW7I390ga+Hh+11vJlPh8hyo9uUdLYZNxy5ceunokIgSOYrHeaaZdI2i7WtbOM1A1uxcoS0A8g7fyurGjVEdgE3wW0hHIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463592; c=relaxed/simple;
	bh=XXFyujGrM3k+GZFKEyqRdilaXBG204QClf2AQk9kJz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGqSlmyQK6Ieo+1iwP4pK/eWMwkQWh/Zf43m0HjP8UFgtBvhm3XYI5lIXwLH2XBkNGY0RDevk/COIozr0uO0/T+NLeqHjmaNCeSdV+9R20wsibs3UzoxT3WbG4T5CahZiBgVcLn5WgK8WosodFSgPDV16gqRCK9PQNgcmTMKTfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8d6d5e45c43so1375670485a.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777463590; x=1778068390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eQI/JeVJWqMxkzWYnwpYH2rFZzbRa7DUVbDEpXwBWE=;
        b=CfE6WABhB5toOgNp6rB6Wp8IrZ7cG2Nhr0BunnWNiPzFP8oR61GE5iR1kEVtX1EQ3K
         Ee5/6b68VNEUWuFCFNjTF77uF4MHpCY3CrB4Ne4thvq1r69Yt/C+GW/u94PpMdSIfNjp
         JmEMBEUVdmkdQuzvhF/RpEIxpu8ReY9shz3i5ug87HSA5yxrJdaHJQcu26HsTGkqXFXP
         S+A5vtI4tGBEQpyvb8gXgQzXZSrG6PBUP1WWyL9qHcyIwW9MALqOVoUdUniaIyFBzJrc
         T0pH6y1zKTwbsqMeNMWT8uk+4dVC+8pVs5g26BZVFLKUZW33anPW1oDRreBgYq8Yz+r1
         Q7xA==
X-Forwarded-Encrypted: i=1; AFNElJ8xBDuRFMQjNb2TSjGAkqruPdJvE7/aQCAOwvQ7q5OJysA/L5wylf+sVkD07ISYqJW7JxjKhtVmXQBL@vger.kernel.org
X-Gm-Message-State: AOJu0YxBJ0BgA2dXwX137kCcAlGAV5Wqc4yCnBnsJCCP1PvFCcG5FSBN
	6HsLLFCkPMQBQzH/Rm2XJsfJggDh9Aq/ORQ4yz5RCK4t5PdckZPTzPSJnZEMLm8r1ME=
X-Gm-Gg: AeBDieszTu8rOBGNC2ZtwmAnMGVtzZrwUpl13apD2FnRyeRVAZFpShVaSpj3HAsXcTv
	jq8hj3vy4iUZ2O6S9bkJZR43YAUpFfckIxBfK3XBA6NUj6IhyyhoN7c2lS5Io/ttkUwWDDjhgtx
	HqIY7bsdGk42DRFqyUQHJ6itavFU0SYohCN8oekLs9AeX1bIRj4cC+p1mv6YSePrR1KvDSxkWge
	Bc8CZKwgW5hBYWHaR3dAEULsgwh3G5fxMgdo8V/M8ILWHsAnhxZZMQ3hNz4WmAcphKHn4QvIXob
	J3+JTfxTiXJNBZ/jG3kQEkrB50Bl/YHs0QP918pamLgza2Rnu+IsRTWnXnLPnPTFRfF3Yt5eA1w
	YGgTQcvZEVuPiLE4+xW+FM1LHdecjgYu4fs83TZaShQu9NY4RljAC4/55HHnJMgd95rR0v5Np5X
	ADdM9BXiknLYga3LBlrFf0O7HkvXNHe0XlgKflpbG25n6JRLSu9uh43o75fW+KTAbxdKm517U=
X-Received: by 2002:a05:620a:3721:b0:8d7:531:cb8e with SMTP id af79cd13be357-8f7d97f9982mr1004943685a.49.1777463589725;
        Wed, 29 Apr 2026 04:53:09 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f93f582e46sm149187685a.25.2026.04.29.04.53.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:53:09 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8a1e1817db6so98821136d6.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:53:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+z2ClHpb2bbWGzg1wsUxfhOrJQle+DV3oiBrZ3gvUxP1UlFRUGk1ctUTGu5rpiLyor8goGL9XOdiyZ@vger.kernel.org
X-Received: by 2002:a05:6102:8496:20b0:60c:fe65:7dbd with SMTP id
 ada2fe7eead31-62808c547e7mr2534931137.5.1777463176356; Wed, 29 Apr 2026
 04:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 13:46:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU7Wv=ff34PGtauGE=pxu-gz60bYckFvC0s_7+NGF2sSQ@mail.gmail.com>
X-Gm-Features: AVHnY4LIrMWzlW7YEacrKVCpl1tXW3XTPU8aR2UA76Yz1rMTuJKkQscGTQj67Yc
Message-ID: <CAMuHMdU7Wv=ff34PGtauGE=pxu-gz60bYckFvC0s_7+NGF2sSQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] soc: renesas: Identify Renesas R-Car R8A779MD M3Le SoC
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 19 Apr 2026 at 21:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add support for identifying the R-Car M3Le (R8A779MD) SoC.
>
> The Renesas R-Car R8A779MD M3Le SoC is a variant of the
> already supported R-Car M3-N SoC with reduced peripherals.
> Enable support for the M3Le SoC through already existing
> ARCH_R8A77965 configuration symbol. PRR reads 0x67c05501 .
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
