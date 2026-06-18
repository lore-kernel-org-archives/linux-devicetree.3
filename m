Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43DB3F8EB7
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788244; cv=pass; b=CzsTDjmdajGMRa6FNnxB0sgz0aMLkhZpOIAvdj6lw/saeIl3foGTlS6zFntPFhMMQNUJ/I9aKgP1yqiixXiDkelFCzK+FLtJV4ksu0txXcBTSL8iELn6ON5nJN7L5DPPB5d3Xe15ElF9EzxihyIrkciApf+SFfK/XPlMJU1F+/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788244; c=relaxed/simple;
	bh=d+QNhcciioN8943WQueiVIs1K1U1Kqo6ylyvJfyMYfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5oA21aDGV+4OTBsaqhfE9/zuGfZ4GvDFIE29/II0sw4CGnV3TIEAHG2bppbH9ITaqzZUCD1I5cIQy68nwoI+92faF5DJUuPfOzmIgkAgwhiE54Z0WzkUf/C6tkLemhgzh27DTyWqeSSq/hbYkmcc/ToHZxATWZ9VTyyvBVXrrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3GVcUzn; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3GVcUzn"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45fd464d51fso581278f8f.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 06:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781788239; cv=none;
        d=google.com; s=arc-20240605;
        b=QswanreN0pbo4HTdOw2IkM0UkgTqXIcBNdKn8LmSiUgTvz5DLaGGRGgZiuwBE6beip
         tH2rGSx2VOeM3HrLtyisB24q96G47JEImps+E2jn7g5r1K8G9+zsTQ7apodEIEuZfCtB
         NsCRiz42uL3KTsJwP/N6j9bO4IkhfHVgLcneC61rH6O5JsGaGaAwLOx3aDFJ137L8Or5
         b/RaC8cKUHK8r6utQdZOApru/174cQQPu35cQ+fWtON4vD5Mi/iXzEwTUcGaGkYgt0aE
         yKV2ZRWr+2EnH03oegQ+5h8J2aWHQJHQEtRb4ie/pixAdTF22HjzhISoFWSTmSrgIakS
         bfzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/QSBzVEzraYQDEb/IQn/Kcl5edw3AQ6HF2dH6T+QYIs=;
        fh=OJOyS9foKcEiNkQnGsiesMLOSRUZDUgo7eIvd6VXHdo=;
        b=PYCmwyg8KjKDvaCpr8plBUhWgNO31XRSnLhNwCj874UAhjtISZa5O8/bDWo+GVZo89
         7x2GJCCsPGZFQuM93/T/QnRNYn7ohBl5rnhlduT+fWBAwVNl+KkHeG6QBHBy1N1XQ2e2
         hoFSbpS00XIRjJHsIpg2I5+t32TWTwn9yspsIuXzHGLagLvbtt3K50/SaDDRfoWr5RSJ
         y2PUEuLiOYz98rNWDCfRiS8GEHebIF1avbQGamWOeB29jdOsxx2jDuMKof/ZLfHshQZL
         Z3LzWMOhA7kpev/SgnPsF0+XFenqfSIw9U9S7T2R7zkEqmgr1s4gFu8VjXKz3K1FMgoW
         VjCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781788239; x=1782393039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QSBzVEzraYQDEb/IQn/Kcl5edw3AQ6HF2dH6T+QYIs=;
        b=b3GVcUznlTFfdK9SwEaQz+tv5zxEyN1t5qL56kCeauLhEgnmcNUTgagNb9ZnV9JdlS
         5Gfc94Qo2KmN601PI0iEfdmkDNaPG9CL7M+oxg83o/OnYtEbSPoRw8cIcFJKnGTtWzLM
         8q3ZSomWvSPZR2g1BRarb/77FpqpoD9XdBtiM3phdFx6sGXNP97MI5s+CFlu63xsE7fe
         5MOXCsL0qVZMdtQXFDtv6cxBi6Y3GVpiW2HgPJtdvyH+OxChoorMWtFpBYIMmSQwyj4R
         Ww+6GS8gHipmz5nlkLWbyVF/kUz+hKxOswanOOqxWlfNtzfvy6Pua/FbM8tCG2umzkaT
         t7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781788239; x=1782393039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/QSBzVEzraYQDEb/IQn/Kcl5edw3AQ6HF2dH6T+QYIs=;
        b=sk54N85rTIY8xNbDtk1JMCJT3otd7Gcf/hZB+7UzJySlBawxpIpoPB8+vSc0XodPZ4
         PPv+zfmra9CA0sDM8CIyEdju2btnZCVpYCcK/pDAow10mleFaLnOa3xF97JErDN9aziM
         xY58B+W6MI3TyMFtfSTZRF33DwhFmUCHH5fKDFjHxrwfrkC9upXhDcmTvyACfonq0tvo
         N77o9g8Iyw4xb8/ghDDp5Aen/SPAGcumSJeLytFNShPTbx3Fiz7tiyQdl7A1B1Ej663I
         sFEHjxJqbV6MrOH8NXYjGqoxGE2TQz8qF6Ex7Hmd9Y831oq1CB57QhHKFH9xaY0VB0Ei
         KVdw==
X-Forwarded-Encrypted: i=1; AFNElJ+Uio1z06xMCULhDNR5fVcHA6ld1Rwt1X/Jq8ZXu1pgfJz8eP+A/Em8AoVkuXoLLo1eMSaooZO2rktX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+fD7lI5EsU54TV0A60y9R4Q4iRDJsCti4xFgIw9TebYNo2jC9
	2K5SBBl9uVxXHjfzXj1vRShuT2cqY0CVHHtfIYOJ4SxPpZzp/Q1XAk4eft/fNdoy5+a34FBhVws
	qLwPZWULsN1gpopBQ+rzoHYRiYAYII2I=
X-Gm-Gg: AfdE7cn9dUaE6TYs81c5sVW7fa0usuVcUNAgrMADbBALdPTIaEFuJTN7gWMbuZLWkTH
	xuFd+Ta62z6kcZHUy/SGYOVVRrP52rlPQpY02ES1lQg7NkunALdebS9NOZRTHXBHd4Nd01oGS5u
	C1paRI0e//B8gPPW1p93wxvpFbUUCcVO2HZ+do5IvI7/cvr1jATl0QAghhuB/zGb0126GFuJWLd
	JJWLGPTGJbLLanA0jkpuc3ttyv3ww5INqd6Fy3z3Tt8zDr/nkfHCZC7wMLCSBcVNEUNMoImRTAU
	DGRIJwoRCu3iakZuy1G27hGBP7X10s9TeZR+oLsD4dfKccZBFEdR3TtzXjqb7KbMEhPqlp30v4R
	44G6kghG25150hLk=
X-Received: by 2002:a05:6000:240f:b0:45f:f142:d56f with SMTP id
 ffacd0b85a97d-463ab7f925bmr6142210f8f.12.1781788238861; Thu, 18 Jun 2026
 06:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-10-prabhakar.mahadev-lad.rj@bp.renesas.com> <ajKAPJGrea01XVeI@shikoro>
In-Reply-To: <ajKAPJGrea01XVeI@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 14:10:12 +0100
X-Gm-Features: AVVi8CeIE9Zqpx5xUuMdz4g0V9M0203aYYbu2RDELhF5fjl_rVj_ZIbbsG1xByk
Message-ID: <CA+V-a8t-phAuaH5g_3Nt=2d=KPw2QqA6r1dqOZv9k-Xhp5q2Zw@mail.gmail.com>
Subject: Re: [PATCH 09/12] rtc: rzn1: Use temporary variable for struct device
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

On Wed, Jun 17, 2026 at 12:08=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi,
>
> Sashiko found issues, not introduced by your patch, but still. I
> curated the list and left only those which I think are valid. Do you
> have time to look at these issues?
>
> Thank you and happy hacking,
>
>    Wolfram
>
> > Thank you for your contribution! Sashiko AI review found 3 potential is=
sue(s) to consider:
> >
> > Pre-existing issues:
> > - [High] Asynchronous pm_runtime_put() is used instead of pm_runtime_pu=
t_sync() before runtime PM is disabled, potentially leaving the device powe=
red on.
> > - [High] If the optional 'xtal' clock is missing, readl_poll_timeout() =
loops forever with a 0 timeout, risking a boot hang.
> > - [High] The driver's `remove` callback prematurely disables hardware i=
nterrupts and drops the runtime PM reference while the RTC device is still =
fully registered.
> > --
> >
> > commit b7f73c7d0932a6e78b12419c5912ad3243637b8f
> > Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > rtc: rzn1: Use temporary variable for struct device
> >
> > This patch simplifies the rzn1_rtc_probe function by using a local temp=
orary
> > variable for the struct device pointer. This avoids repeated dereferenc=
es of
> > pdev->dev throughout the function.
> >
> > > diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> > > index bc6af59744e48..25cad9213147d 100644
> > > --- a/drivers/rtc/rtc-rzn1.c
> > > +++ b/drivers/rtc/rtc-rzn1.c
> > [ ... ]
> > >     if (IS_ERR(xtal)) {
> > >             ret =3D PTR_ERR(xtal);
> > >             goto dis_runtime_pm;
> > [ ... ]
> > > @@ -486,18 +487,18 @@ static int rzn1_rtc_probe(struct platform_devic=
e *pdev)
> > [ ... ]
> > >     device_init_wakeup(dev, true);
> > >
> > >     ret =3D devm_rtc_register_device(rtc->rtcdev);
> >
> > [Severity: High]
> > This isn't a bug introduced by this patch, but does registering the RTC
> > device using devm_rtc_register_device() create a race condition during
> > teardown?
> >
> > In rzn1_rtc_remove(), the driver manually disables interrupts and calls
> > pm_runtime_put() before devres has unregistered the RTC device:
> >
> >       writel(0, rtc->base + RZN1_RTC_CTL1);
> >       pm_runtime_put(&pdev->dev);
> >
> > Could userspace still interact with the RTC during this window via ioct=
ls
> > or sysfs, potentially causing synchronous bus faults since the hardware=
 is
> > already suspended? Should teardown be bound using
> > devm_add_action_or_reset() to guarantee correct reverse execution order=
?
>
> [wsa] Or maybe not use devm then?
>
Maybe just add two `devm_add_action_or_reset()` calls: one to clear
interrupts and another to call pm_runtime_put()?

> >
> > >     if (ret)
> > > @@ -506,7 +507,7 @@ static int rzn1_rtc_probe(struct platform_device =
*pdev)
> > >     return 0;
> > >
> > >  dis_runtime_pm:
> > > -   pm_runtime_put(&pdev->dev);
> > > +   pm_runtime_put(dev);
> >
> > [Severity: High]
> > This is a pre-existing issue, but does using pm_runtime_put() here (and=
 in
> > rzn1_rtc_remove) leave the device powered on indefinitely?
> >
> > Since devm_pm_runtime_enable(dev) schedules pm_runtime_disable() to
> > execute during devres cleanup, calling pm_runtime_put() only queues an
> > asynchronous idle check. The immediate return triggers devres cleanup,
> > which executes a barrier that explicitly cancels pending async operatio=
ns.
> >
> > Should this use pm_runtime_put_sync() instead to ensure the device is
> > synchronously suspended before teardown?
> >
Although there were some patches accepted for similar kind of issue
reported by Sashiko, do you think I should switch to
pm_runtime_put_sync() (Ive not seen any issues)

Cheers,
Prabhakar
