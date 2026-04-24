Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1573845CB
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038480; cv=none; b=ho8zCh6PKoR3B7UDRYR1bqQ2jluBcMUBJzKFeJ/MLr3mvopMXUnEE1uqcHQk2ZPYQrACCxPkm99TbXvOtRy4IpmV+mouq8XE72/MqjM1xxU1je+jKp7wYegRV8e+/JQySfUr/Cq4Ix18Z+ANgtPNQwHVOHNI1pbz5/2HcbRIlWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038480; c=relaxed/simple;
	bh=09Sh707RFRsbA4Cpc6VOVQ7w630BPN+H1W5SBQ8X4i4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RhcBn6C8lFo68P01TG3dNVAp5jnyBuhw/c+7oL/zI2WtthL0T0eVf7tDIOQfvnHCMGi2/M6K7okMSOJAXgt5HlPLszeM3armqW/knmGYnrkIvzQwBdNSc5N3JNfw7e8Zj2N/LFP+syyGje5c8tPoIJe7+Kw1Ov+ggAO1NDW2mPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so6915758a12.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 06:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038478; x=1777643278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxbBEAEmkzXg8sufmQelLSZfpgBcx3HXgkzS292cULs=;
        b=oqrjbiu/HSOi3m9HcQZFqzF57Nm97uVTBcRtXN/GW64SAdDUHA5weLc9p00/cLRuOH
         ba5OFnOQWkZ0GI2ns37wxkXdC0vc2Zh+brRr7p62kTWGGwO+QZtVcYJfx1jwVq//PrdB
         M5kI/Q3RBJhk58xez1IAegooJn0oEgmztbTz//WW+ytAeHb2HEgnH9IxG9FfbL4nNIlJ
         iITq1W8+LLkZeIf7P+LWZzwf/UpaKWcn0YStD8IZ6VFl1XsCBG37ojLqOjpLNB5MNUTl
         QkHF343GF5AN9i5hF/y3UeLhghkPSR/o0dQeMQmcl5zgZHLvkHp8yKGQmng+mL31/MwB
         +2Tg==
X-Forwarded-Encrypted: i=1; AFNElJ/cOSKVrACAJJLSuk+hz5I/6sXjdcynmKQFR3TTS54bDtKIYbTEyCJjLquqVZ13RKgeAUomJVvjTLre@vger.kernel.org
X-Gm-Message-State: AOJu0YwbfQfUKOVVStbV6FBbLXMrlqh0W+/Wdmy7DLzUm4lT2uP8jTpu
	5W8T4b2KZ9F6sMSP1XkfRmt+D6QedBlTyAgme35G2w/aA8kB5qmFRO+viepHPIeynZo=
X-Gm-Gg: AeBDievGeH88oU9BVttD2o0ssorUiCSYA/T50yZFyMyiex05VYfFGHh5UPEN5GoR7u+
	jR+4LoU/lQfKFxQVqh3Di82VGCxMbua2HNmOCAAHnqjO82eosFiMDKZlRg9fRUX3WWpXkgO0ba4
	e1a4Vj56vQMtPNb3XYdsT7PlzUSXENYX4+BETBPZzs6vbAbpbaZFNb7fIvlU7OcCI0jnzfx8/LI
	HBNxj03SkL+gGLEDy7EZ2np95F3qztJKDXuxekLKtyPnWx+7ydaV6Q7mCHmkjKGGKjtyh+FLO0b
	oOig5cwszb5X6RgY32hAgAsUIU92M5q+OYrWaBeCRKwF0T0SkA/h/V0+nvYh1Umjd6+DNgwqtvp
	CIGkxAH7vKqtSUOOVG2KNO9BEvNim7vrSoG3HCmfU/AtXP79j4nmpdhc3Yzdf+3DyB6AX+LnfzU
	j0cfcxpSjj99cNSY0dwqlzPLS8etwxJhVDAfaMSxpMU82aO0LmpoNQ+RSI0K2we6tY8Omzyys=
X-Received: by 2002:aa7:d602:0:b0:676:9c6d:5c59 with SMTP id 4fb4d7f45d1cf-6769c6d5f1cmr5460141a12.2.1777038477622;
        Fri, 24 Apr 2026 06:47:57 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d69708sm4886774a12.28.2026.04.24.06.47.55
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:47:56 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9c603ec2dfso1041925966b.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 06:47:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/YAyS09sfrwSo0ZTW7VD/FIBcqVEAHq0GOpsEff97bz8RYMfdYcGQBv+z40BmDH++K8yKzggPY1dcj@vger.kernel.org
X-Received: by 2002:a17:906:f593:b0:ba5:234:13cb with SMTP id
 a640c23a62f3a-ba502347802mr1522477166b.4.1777038475099; Fri, 24 Apr 2026
 06:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org> <20260422233744.149872-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:47:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtAcB1SoYz4jZo4s7shMi3+=Ovt2pw6YgRedvSiDT=3A@mail.gmail.com>
X-Gm-Features: AQROBzCeSX9qxN5yqtzC3-PAZZnXar2rEL_AsOuEwJq4ANARfzjj6L8MVrx53_Q
Message-ID: <CAMuHMdXtAcB1SoYz4jZo4s7shMi3+=Ovt2pw6YgRedvSiDT=3A@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] ARM: dts: renesas: r8a7740: Describe coresight on
 R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Apr 2026 at 01:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe coresight topology on R-Mobile A1. Extend the current PTM node
> with connection funnel, TPIU, ETB and replicator. The coresight on this
> hardware is clocked from the ZT/ZTR trace clock.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
