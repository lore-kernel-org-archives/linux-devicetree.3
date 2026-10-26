Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793042548;
	b=lsmx6f2kBuXPoq2uQeSjwcbe5O4+SVJybqmCS/sDcwlqjfGmI0TaJ8cCVAtR4fHEFhQc
	 3pmHDDgj/776n80kF81wZP/C7/6tST4iZZFb3mZqlZfe9XBRMjDaYJ+H3mYIR1Fq9k8xh
	 ZkAgd719YwhonuiNSGxqU1YkvPDrlW2HOiW2RHNcbq2Sx8afxEq6EQw/DH8Q10pCJEmI6
	 hnKybDs1oXLCgw8Y+pF23gG54WfjVdDKvGUMbzXAN2Hz9M1ghgb28UF4xSg2CuJLB42AI
	 KdrQF9P5cegc9hkCRK6rtmYzOG47Lu6uhcxFygP6TJHXfxI66frrG2jcGmdwnxCugcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
	b=ibpgBAK0g7YJCS/vTPBDX+88B4sMvCkkmynXflCi/EwC7wm/X+RgKxZthNXVxFbNBt8o
	 dNv6SuTR08qyrMjhFp8bK8A1H+ZVYW96eJUtWtjsBxCqBmzrBZCZIl8Enel6W41+2GRUU
	 9wA/k9F4EP/aG788mRetjVb31XFcT3aDOPQh19n1SUj762xFz/bRJs0byJ7PysnuGeOzO
	 GhU157tL/T+0GFfY3zDmMPYZfAzFdzuv0jx3OVEYX3suEp4FbgSxx3V1nbrGNibDC5UZ4
	 aFjjL4KMtaJLGY1RD0wMQkgZfc/cYfx2vvvNelBu4coK0ohL61ggG/UGK7gxr6vrCxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bdo9L8xn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB72C606A31E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 19:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB72C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bdo9L8xn
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e608cd460eso21585845ad.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:22:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793042547; cv=none;
        d=google.com; s=arc-20260327;
        b=Gok0Fpnwl9KzUDk1bPPI4cCjyMioF6sA16yCoQrd+5uUpAJy10/ZnQjxVzZuQmdMX1
         omcFo3riPkKUM/ZoYEX5cJS9bZ/i8rA72YmTR6OTuN+pYRHaYirS7PvWMSCT8bziO4xq
         QGbUwC/WGUzV3Mpm4ZmPlhTMycj3Gh3/d4O3hzSmaeatokgMRuUAgCf45r9o+W9+KCwX
         26zGcFEMjL7QeCOIyVwISY156yBVA3DEqf/nnzcbTqPDENZ+NuJDFBqJ7feUasWo51nV
         vy9abWuEFWQzxXQpRCSaoEuYayBhkZ4fc8uaj24iP2YSxZZCM4N5LD+PsvPcz+gc2Boj
         LCVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
        fh=1kXZGpqyRh72D5F8zblBb1estBGO1q5A9cUomJRL0Ro=;
        b=at1U7HxQWejM/p58piAurpcxmHxWeFqa7wRPXV6VILwebSqj9dHWTpaMf+RXxtYUjZ
         g7VCiQqGHxJ+EhKffzBN9p1hbvpDcMnW/tAGW8zXadWaftToNiTEnHmTzMCLu97T+hGk
         Buw3mhPFXLhQ8jithPVhRGc6/f22nWBd7ZCsFWTafm7whKemhXLyQrITeXpOAInGuXnF
         UO0HNL2VLQM2THeBk2rV9Ktke70FG/BZmSzlqOL8OCPt1AsMgznEVTAAwclPAaacuXbl
         GSRzZIOOH5QHe+HtyCt+c0pfsrsEH9LJXw28mtHrPkUY2jdgK8lYtx0/JAar00kY2Hrs
         erUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793042547; x=1793647347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
        b=bdo9L8xnCaTnoVnTYyRwdU0hXn1FeG4472V1eMuVO30LmRUV+eGIvfvVYZD1gXCOO9
         BhJVg0rsk4JDnMq9USWnbNMs1x0vf0WnQOyTIpmXY5eMVzr3EgD5jfViggqNu6zXOb67
         LRUg13+1Fpqtoyo8ww04m2Cc2IMXAslAh67fzPKcM+fcSO0OrIhlQt0FYgTajnPYD6E3
         1HaAW3R8fB+zyC9wyJdsbWpfUwBBcfJ91J5uJjhpaYAOvmKxfkwrgkunwbgUMDuC6b96
         XohzLstHtzgb5AuUqBmcsDGcMmPcwVQDf/ZHnVf3NAtZmsjKU+QQysF9EFy8eIxK7E0X
         YrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042547; x=1793647347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
        b=GUy5hxkMcb4Ki4Eea6scLASHjU6icnCX94HeOJ4sRHLLit283xncYzNij2f1XZiGvp
         FSDN2i3RobmnmUAhmEaCrCh3Q+ifkrf+XiTk9t/vQ6S0wLkPGnPUtMlgJxZA3XO77ElK
         vGOX8Uk+Z2+JMTCFoKfIYSgd0ft57fUIhAZ811lCV9frY/a2LMM+IUOy6FypMaEvbMxN
         8cSouCFzpWwkz2YPKg/59HDYodhNPzJn3R0and0GPqvnVaJNteZaOylhD+Gv9nSYB2vl
         nM0Fw5I5pV1LCoUI6Xoje3G12zw98JkqMFEOXRGMzvf4ViOLn/R1Br6pdFsyqvnOf6QJ
         yDcQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8JGxmhdSNoPyRd8iKLrgamo5fAaSipCVk8POemVBB1D+YfZL+7EQAIWr/cib39VjHbDDjvcn5ydYx@vger.kernel.org
X-Gm-Message-State: AFq9FYKJX3mZNx8lew1mEz2g6Af/80XmAtDa0eAX2V/mdJxX6WXUrcU7
	o1isU8B0MrWrjaM9xH1hZcDdiGGr02/huMkoumch5CwW8zO/jAAilwNd6jkdKBiuvUPQs+qsFd6
	VGFLd8zbTc6kJkAvhZY45H6fXsjOYl5o=
X-Gm-Gg: AYBFou2QMwbLY77EgaJZSyaeL+kGcthSgvjuhIuVDxzPXwtYGG7AmTR0vNTmc3avASz
	/HceLBKL2KLk+pC8XpCTjtbRkrwZLtQ0p5xORYKuJotYookIxrdqbmmsWPdtLMohMVYVtaXvVbb
	9fHaEv9Mb3CbpZTbUW2j8mcvc4JoUgSKO5v8vVy9My9wk0jp0TmDpVLdKKO52bXJunNhwOj6UVh
	W6ukfZ01pEGzQPVvksAfmW8cf6rVUOh1Hq3bC6j595iJMXiRv3Nmz0g0B6Xbk7cMKw2FogU4qJS
	azsF6AOLOIAKux8p5sXLnLg90ANZqvRh7YkosF0Dou1Jjt0ZMkR3lE0XoQaBBO/UMQ5+dVxh9HK
	RuU9D6H4O8aklFbtLYtcEPWPrqkOfsdhIa9Qa4CvZjm8HLaWVMb/b
X-Received: by 2002:a17:902:ce8d:b0:2e5:a355:56e4 with SMTP id
 d9443c01a7336-2ea9c5e30a0mr60160345ad.11.1793042547045; Mon, 26 Oct 2026
 12:22:27 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025142412.112216-1-pmazzini@gmail.com> <474d4ed0-b011-49dd-853e-697448382a0e@arm.com>
In-Reply-To: <474d4ed0-b011-49dd-853e-697448382a0e@arm.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 19:22:17 +0000
X-Gm-Features: AclHuK8V-ReT1uOg9VTcgyQYzBbm5tikcDUgJYabpKKgd9T74yNLPiBsMiogtYQ
Message-ID: <CAAxh=jupBYZsadg09ig1v+3OkfjLAf+Hd9NwoR_D=te9XKxkTw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: sunxi: number the IRQ banks from the
 first one that has IRQs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Thanks, understood. I will wait for proper reviews and for -rc1 before
posting again.

Pablo

On Mon, Oct 26, 2026 at 4:42=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi Pablo,
>
> just some heads up about process:
> - Please do not repost that quickly! The kernel doc says to wait at
> least a day, but that's only the lower limit, in case the series is
> almost ready and there were only minor comments from real(!) reviewers.
> I would wait for a couple of days, after you got some proper reviews.
> The reason is that reviews (by humans) take time, and it's not like
> people are bored waiting for some patches to look at. So they might be
> interrupted by something or need to do some checks and research. It's
> pretty bad if their effort is ambushed by a new revision, which now
> means they need to start over.
> - Please do not repost just because Sashiko said something. Wait for a
> proper review. It's probably a good idea to acknowledge the comment, but
> don't just re-post then.
> - Try to avoid posting inside the merge window. Depending on the
> subsystem and maintainer, your posts might just be ignored, because they
> might be busy fixing up conflicts. But more importantly: you are missing
> the correct base: you should always base your patches on an -rc1, unless
> being told otherwise explicitly. And since -rc1 won't be out till
> Sunday, this is not a good timing.
>
> I will comment on the patch set separately.
>
> Cheers,
> Andre
>
>
> On 10/25/26 15:24, Pablo Mazzini wrote:
> > The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
> > none. The A523 got a DT interrupt for its unimplemented PA bank to work
> > around that, the A733 would need the same, and on both PK is written
> > past the end of irq_array.
> >
> > Number the IRQ banks like the static drivers do, with irq_bank_map for
> > the A523 and A733, and drop the PA interrupt from the binding and the
> > A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
> > made-up interrupt.
> >
> > v3:
> > - apply irq_bank_map to the A733 register layout too (Sashiko)
> >
> > v2:
> > - give the A523 and A733 an irq_bank_map, and drop the PA interrupt
> >    from the binding and the A523 DT
> >
> > Pablo Mazzini (3):
> >    pinctrl: sunxi: dt: number the IRQ banks from the first one that has
> >      IRQs
> >    dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented ban=
k
> >    arm64: dts: allwinner: a523: drop the PA GPIO interrupt
> >
> >   .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++---=
-
> >   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
> >   drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
> >   drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
> >   drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++----=
-
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.h                     | 7 ++++---
> >   6 files changed, 17 insertions(+), 16 deletions(-)
> >
> >
> > base-commit: 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db
>
