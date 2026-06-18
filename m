Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A0F35B65D
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779137; cv=pass; b=ISoyA8KuHLZ6Vvs6opJ2Jl2cBpNfpldLCT8orhJE8JS/Hj7uFhKmwqbeBp3LFHh7Ws6jMU8qnNedPtUHAowgIwfr1eHj8dAESuEvJf97f4t2gZZzEz+32fQD/kil8BEziz7bnuLqq0hC6oEaNmqHS2huzff6vVUHVObPxbxT9mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779137; c=relaxed/simple;
	bh=FxTHPTEGs32xTR9c7EYu9d5glP/R7XHMD3VZDYPe2+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YERXb3wLgFT/Zl0mK5MEzZ3Y6EEknZyZ1N6/1UIE3WPNc/+OUOxJSLGLKRaKKXmaQNWmIUysd0oo7CjlH54YoVz0yuVCEEI1jYgCfw0p9D+fDCYmMF3qCMzTlLuRW7VmV7Z2CXs7/LIRKoy2+c/sEmn8Lx6/kJaL1IChw1j54Ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WG0Y9YBP; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WG0Y9YBP"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490ac357c55so6802225e9.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 03:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781779133; cv=none;
        d=google.com; s=arc-20240605;
        b=PFnipH/Kwr6+XfCv754FTUEBGinrrkzLsJHTup46jmYhdKj8wUcNzfWPFR8rWTfVDR
         cyMhaOrfsS0QqayHDxqfzX353E2vgwyQNn0gx24zNU9gbgXksCBz6sst1QebSfasB3D9
         n+QVGih2rcQGh30s7reIK/p7qiVq4FzyMnJJ2g8ADhLB0Pg7DiQQ/HPzoeh9fYbvbSyC
         KtIvwd69WP2dBejtdrh7tSCDgnuYgR2nyM33pla2xQn1czIhR4Iim+LMwjPYJJEInwhw
         8/H+B1j3kBl7U6y8ziPwFiM6B9XxNhlW7um2Kr2r+vgQrSZ0HZ27URkPJkNHf+HrehAm
         LK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KljND14vOQKsdbxxFQM55SGvFHxRxUmSYC3xs5Hgop8=;
        fh=oXPtd79aHKwdDOMiuO5mV26PQcRjPb3AWWJEIVRK8rA=;
        b=WD/V3ZR6mtoiHoXoJ3s/zXBK5BB0ay244FiFiu1XEcOYEUKSdEVtl15/+TsZRMFYyL
         Z+t8Ehz/yTbmORDCd/MdCxapCIrrh88n7+emOhKWSMc1MxJqfZmsJpH3nnh3KeVD2d1Z
         hNP25/4nQ/JEiJAK27V0001c15pTpnhRlCUkpTmKRSlKTcJR+Vc9H6aTa5+/w+j4TBv+
         CrAetI7Uqu1JppuCSC+oD1gYPOkGdTckKuDjJ50oSDOlpXcjF5cFNg4Y1eK0ONfeRWnn
         6Jy6NwGbxCDOznhgKmXcSOgCooxX4dME7muA1skDjdw7D2uWRJUXfUjZ6pOMW/P745yX
         ZEfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781779133; x=1782383933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KljND14vOQKsdbxxFQM55SGvFHxRxUmSYC3xs5Hgop8=;
        b=WG0Y9YBPPWN5Hp6tj5IjoQAE/L25bGQl0UN6+RJCjTAaoynkyO1xEErgH8ovHYJUqu
         0hAhkzyFFJCvGj/PyjqZcVqdr0sLR4N4Bcc10vxyKpc6wLhASTMnLnk+GHpf2MOgvOKY
         hcS3cCWMGJs1qlCzcxH7Krk+lehDwBPsp80uuwuNZzG3no75+lf+dG2wc5MHO4BXGj0A
         bgK7I/uk6KKdin2nOoCaNIiP37zgSfqoyJsH7URvN5B1dXCKdCk6mPzuNSdbMMCxKAMQ
         Z+4bRg6FagnpRHOJg6/6d6Z7zB5ouIlDOVjhZnDeqorXYTdYonZ1ZsPnsKS79m0M6geH
         rCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779133; x=1782383933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KljND14vOQKsdbxxFQM55SGvFHxRxUmSYC3xs5Hgop8=;
        b=qD8EQos/sEYuLP2AIpkMb3lRW1GPCfl0AzCiDI4FI9LR7PzQy2eIgfmPZ6dGE0fLUA
         CqYMCYaTaMB2/bjd1Vh5chidP+43v/KgRWZmW1e+Qa9MlhADPqD0nhaosMVW7bn8gFyr
         lBzgcpCx8ahU2wJ7t7N19XU5db6YP1s39K9etlfHTOtF5cXC0Mo6ZRCjkoxRwdQls+PY
         srG4YauCMLwZd/qgsWbSXrJAEl9iuHYck7rxgaj9cC8JkPTIx4gLBit4TswZLEaGehiL
         ZPemGWCHYjftfwXP1Q0Ut4nykGut8DZ+fier1e9u9nfH+Jb4/npodvmO5BpXRdrap9Xo
         QTzg==
X-Forwarded-Encrypted: i=1; AFNElJ8Bcb1WJYh0w52+NNSl5r4j4dhxiZnqgSD/12MfAr45IeigzKTaLrrEmcfRN1nCi53FS2DMque+oDw8@vger.kernel.org
X-Gm-Message-State: AOJu0Yypr7MA0I5fGAPyjfbHzHQLQlYYbFgzW84gjkJuSmLIBNysx3ET
	tJvV6Anp9hS7ZHCRv5+NTxmd38mVsKZNHtDxw6hD0vpUG4udN5cp6O9OsDrdo077SitIajg8Yk/
	wjKA1n1TNXQ7xOm9hh73UFFkuhosxq1k=
X-Gm-Gg: AfdE7cmsz0g2vyyrk4anDcznUUNQmZzYKdmLRMowtjKR/slvYeIhmlko2NYW8lATZcA
	vfqZw3Qi8VKxfQgxU/xfcg5Oz44kvTDto1ZLI1Z4/Or/R0ZaJB44AgUySVJ8yeCUBjMc/x+C76G
	hNYXUWIRk/yLNznHCbD5DPWmvEt9AEmZPeUE3y92cAi+2Y6xIK3LWVRN+CyCePD1q68KO7GPOdy
	tYLodVsNSbm9FMR18UrXhC00PMSOZ9UbbNbaRn3CpTnfgXcwVJdMHB3cACuV/CSOUIuLzRLwnWV
	KgScNB4/veqh7SgCUcvpCns0zJZOYxeIwxa4Up+A/+7A/VxjYiS/nHrm6Gjz2LQW3lmc+7noAVY
	Q3GHdAWpKgKfhX1c=
X-Received: by 2002:a05:600c:c04b:20b0:490:a298:acf7 with SMTP id
 5b1f17b1804b1-492333ca341mr114316775e9.17.1781779132935; Thu, 18 Jun 2026
 03:38:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <ajJ9kNJtrY6DyQ-S@shikoro>
In-Reply-To: <ajJ9kNJtrY6DyQ-S@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 11:38:23 +0100
X-Gm-Features: AVVi8Cd-U7tUFEAJg3IGSxDM56ukcxBLxZbA138pqjhmvl4iTE10lUkkjXNQdKI
Message-ID: <CA+V-a8u2wt6623mYjhipOvJPo4va+bXs3qirQewocFr2QmUFhA@mail.gmail.com>
Subject: Re: [PATCH 07/12] rtc: rzn1: fix alarm range check truncation on
 32-bit systems
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for testing.

On Wed, Jun 17, 2026 at 11:57=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi,
>
> Sashiko found issues, not introduced by your patch, but still.. I
> curated the list and left only those which I think are valid. Do you
> have time to look at these issues?
>
Can you please share the commands you tried, I'll try and replicate it
on my side.

Cheers,
Prabhakar

> Thank you and happy hacking,
>
>    Wolfram
>
> > Thank you for your contribution! Sashiko AI review found 3 potential is=
sue(s) to consider:
> >
> > Pre-existing issues:
> > - [High] Incorrect hardware alarm weekday assignment due to unsigned un=
derflow when the alarm crosses a month boundary.
> > - [High] Unconfigured alarms in `rzn1_rtc_read_alarm` can return an inv=
alid `tm_wday` value of `-1`, risking out-of-bounds array access in userspa=
ce.
> > - [High] Potential spurious interrupt when sequentially updating active=
 hardware alarm registers.
> > --
> >
> > commit d278abd6309a65fff235820bea9a8e8631da47be
> > Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Subject: rtc: rzn1: fix alarm range check truncation on 32-bit systems
> >
> > This commit fixes a silent truncation issue on 32-bit systems by changi=
ng
> > the alarm and farest variables from unsigned long to time64_t. It also
> > replaces the time_after() macro with a direct signed comparison.
> >
> > > diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> > > index fe21fa6242881..06339adae71f6 100644
> > > --- a/drivers/rtc/rtc-rzn1.c
> > > +++ b/drivers/rtc/rtc-rzn1.c
> > [ ... ]
> > > @@ -265,8 +266,8 @@ static int rzn1_rtc_set_alarm(struct device *dev,=
 struct rtc_wkalrm *alrm)
> > >  {
> > >     struct rzn1_rtc *rtc =3D dev_get_drvdata(dev);
> > >     struct rtc_time *tm =3D &alrm->time, tm_now;
> > > -   unsigned long alarm, farest;
> > >     unsigned int days_ahead, wday;
> > > +   time64_t alarm, farest;
> > >     int ret;
> > >
> > >     ret =3D rzn1_rtc_read_time(dev, &tm_now);
> > > @@ -276,7 +277,7 @@ static int rzn1_rtc_set_alarm(struct device *dev,=
 struct rtc_wkalrm *alrm)
> > >     /* We cannot set alarms more than one week ahead */
> > >     farest =3D rtc_tm_to_time64(&tm_now) + rtc->rtcdev->alarm_offset_=
max;
> > >     alarm =3D rtc_tm_to_time64(tm);
> > > -   if (time_after(alarm, farest))
> > > +   if (alarm > farest)
> > >             return -ERANGE;
> > >
> > >     /* Convert alarm day into week day */
> >
> > [Severity: High]
> > This isn't a bug introduced by this patch, but does the calculation for
> > days_ahead underflow if the alarm crosses a month boundary?
> >
> > In rzn1_rtc_set_alarm(), days_ahead is typed as an unsigned int and is
> > calculated like this:
> >
> >     days_ahead =3D tm->tm_mday - tm_now.tm_mday;
> >     wday =3D (tm_now.tm_wday + days_ahead) % 7;
> >
> > If the alarm is set for the 1st of the next month, and today is the 31s=
t,
> > the subtraction results in -30. When assigned to an unsigned int, this
> > underflows. Because 2^32 % 7 evaluates to 4, the resulting wday calcula=
tion
> > shifts the weekday by exactly 4 days, causing the hardware alarm regist=
er
> > to be programmed for the wrong day.
> >
> > [Severity: High]
> > This is a pre-existing issue, but is there a risk of a spurious interru=
pt
> > when updating the active hardware alarm registers?
> >
> > Just below this hunk in rzn1_rtc_set_alarm(), the match registers are
> > updated sequentially:
> >
> >     writel(bin2bcd(tm->tm_min), rtc->base + RZN1_RTC_ALM);
> >     writel(bin2bcd(tm->tm_hour), rtc->base + RZN1_RTC_ALH);
> >     writel(BIT(wday), rtc->base + RZN1_RTC_ALW);
> >
> > The RTC core can invoke this function without first disabling the hardw=
are
> > alarm if replacing an existing timer. If the hardware alarm interrupt i=
s
> > active, modifying these registers sequentially could cause the intermed=
iate
> > hardware state to momentarily match the current time, triggering a spur=
ious
> > interrupt and prematurely expiring the next timer in the queue.
> >
> > [Severity: High]
> > This is a pre-existing issue, but what happens in rzn1_rtc_read_alarm()=
 if
> > the hardware alarm is unconfigured?
> >
> > If the hardware alarm register reads 0, fls(0) - 1 evaluates to -1:
> >
> > drivers/rtc/rtc-rzn1.c:rzn1_rtc_read_alarm() {
> >     ...
> >     wday =3D readl(rtc->base + RZN1_RTC_ALW);
> >     ...
> >     delta_days =3D ((fls(wday) - 1) - tm->tm_wday + 7) % 7;
> >     tm->tm_wday =3D fls(wday) - 1;
> >     ...
> > }
> >
> > If the current weekday is Saturday (6), delta_days evaluates to 0:
> > ((-1 - 6 + 7) % 7) =3D=3D 0.
> >
> > Because delta_days is 0, the rtc_time64_to_tm() block is skipped, and t=
he
> > function returns with tm->tm_wday =3D -1. Since rtc_valid_tm() does not
> > bound-check tm_wday, this -1 is passed to userspace where tools commonl=
y
> > use it as an array index, which could cause an out-of-bounds memory rea=
d.
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615154805.=
1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D7
