Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7814C3C3445
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780566541; cv=none; b=N8T3qz1Uut9zuNAi1c8fEeOQhOmf4Cxu3zLZq+7l5QL1mdXe59QyXmytkWkeQLQePbEGuLyWy6cck0RY8z8y6+cgSaxyy6u9s8yjxepK/qOOm7ijKW3UEXptxFaRdzGz2P6wjY2zZbYOmmFdOpfkt7zZZRJ+9s9r7zq9bsca+r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780566541; c=relaxed/simple;
	bh=9ccdKlMLp3ktq3NWcjK3eTgouh7Xi9aiQybPD3Ap1o8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X3RN1SZihUM9sT1r4R4bsr3RuEhJ3fy11Pfv4LNkfCMnieceJ+WGy8M22YCOlwcjqU2R699YBZnRsL/i9VqHCj1wG2MNDgqqrSc3LhVbMIou9bL2NTuiiU8OaVR9iM4sq3/0huhetIwQN9Zzf/NJ4AoOGlRCnOfMHeSfhmrFMYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9639fa0636bso852200241.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 02:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780566538; x=1781171338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPyZKtpWg5qnni2e5fD9GWWB7qem8w+cCv5HCayF8qI=;
        b=DZLZ19yzcivZtnhSyoVD1x0Zxt79az6cfVDg6oydcZIUUKaCqUyV9FBBfmNw9V5v3q
         +lO7X27ELfupNQyPsaLbfwUqLw1tssiZDiGDgQQf+VURzmokFcI30wR15YejtunGh11/
         klIz3z782JHOGWEhAJd/fxlrUD5nVbFcXS4233+VWr0wN9k5xtJUsg8N23Up9LK+qi4i
         SHcBMl6VCRnUERxBLZDhMZZOOLBNSTsJUv0RCsYh7F3EKVMhKLye+oUe53/YW4X+OmMi
         z8z9OvkOfQeW23HCUZgDP1cbNTaVfeFQjl3E5me3+eTWCB+wA+r9QpUc9JEBOgkwqHvs
         OquQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Pkz/E9xTRlZABoafbZEGNFvWaGPCOjA9KNj4aN6y2KKh52FSZfJwP5CdIn/x1ylBzJrX+7rJb8eTU@vger.kernel.org
X-Gm-Message-State: AOJu0YzJTluPG264oz9wPHqdAWEDb+aK+E7b/IJqB6Ls/o5CqHVjBAYx
	9hXDYFxKfnAXcVBbU1jaUR2GueIQ+41l6TgYNphlIqBClrL3L+yhP+pxIGwmAZS6wes=
X-Gm-Gg: Acq92OGu4sPAcfV84Im9ir9MD5yZm9MCOJCftC0ieEMkrSqppT3evIb2tZi2LfUGJgp
	cDjqfZYWqF+V9+MBP3mWrJ/gjAzaHsLeIddO9RHnckRXoh1/yiGvOlnYD2gsyO2nZrh4Z55LeT0
	GRTAAE8Ve7kPGxx2QJ12LOZDxDcvj3T7t9aBhocPQH+KuNsEyg+5ykqys9MbaP0EQzy3ajfIchA
	SiHqhoxwutXlIPGYYtp3y+Ieh2YZb5Lj2Zvj3re+roUil4n59M4ZOdlWlKZ+JY0ldAWf+NvEf+5
	UlbQRmogNisUBMR3gysP+ehVlcF44AD5ryNId8qq++QX7nJwKz1jm/48llHBtWyVlyMGvATp+iK
	IrZlfNlwsihJ4EW5LOHN2p2KJn6Ep3wxXM5KsuexOV0QwJ/89OsRLXFIl6oIwERz+qLvfOJoLc4
	/lcLauo8EQ7QB53QX6Zzk3brBfsmN8+GUpQ2nEMswReiWBNaWYk8xYVToZlF1DdBxbs6fvq8Q=
X-Received: by 2002:a05:6102:80a8:b0:634:92c:bdca with SMTP id ada2fe7eead31-6f5438aa1f6mr1235429137.3.1780566538413;
        Thu, 04 Jun 2026 02:48:58 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb649b5513sm4500965137.8.2026.06.04.02.48.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:48:57 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-963b09d5b91so465869241.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 02:48:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+XPwGo+2U17LCESygEomCFBhVh7sikzNG/K1xTWjXtqnfqvR+lUS3Xnjk0+JP9eohUtcgBG7x5mPfu@vger.kernel.org
X-Received: by 2002:a67:f889:0:b0:6cb:b3db:c31c with SMTP id
 ada2fe7eead31-6f52c84f821mr959856137.0.1780566537239; Thu, 04 Jun 2026
 02:48:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603151642.4075678-1-claudiu.beznea@kernel.org> <20260603151642.4075678-2-claudiu.beznea@kernel.org>
In-Reply-To: <20260603151642.4075678-2-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 11:48:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_T=G7os6KBG6xTnphnhQ9pQtd88BUkg61S7286bZmFw@mail.gmail.com>
X-Gm-Features: AVVi8CdhQoz1FuQPTz5BSOMe5fOJfBS7YW1L8CNma8uYS8HEHOx4e8eahLsemts
Message-ID: <CAMuHMdU_T=G7os6KBG6xTnphnhQ9pQtd88BUkg61S7286bZmFw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave()
 on power source update
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 17:17, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The rest of the driver uses
> raw_spin_lock_irqsave()/raw_spin_unlock_irqrestore() for locking. To
> avoid concurrency issues or deadlocks, use raw_spinlock_irqsave() via
> the scoped_guard() helper for power source updates as well.
>
> Fixes: bbe2277dedbe ("pinctrl: renesas: rzg2l: Add support for selecting power source for {WDT,AWO,ISO}")
> Cc: stable@vger.kernel.org

No need to CC stable, as the bad commit is not yet upstream.

> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
