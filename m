Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F9D44E05C
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 12:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515274; cv=pass; b=RSoj83x/Sp0sYlyOTV7Ya0YbVx8RTdeGNhZCcFICkjiQ1L4nJUaOXaDdmBLNnkq+qk9VgnwVRAtAHkdXZhav8Qml9g8PSmJpUHtjZ+7DFvqCEoyWoS6PybdI3sclWMTVtajEL4xApRxvtxLyHY85E/6wNF4MjeSr2Dqe30oKw+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515274; c=relaxed/simple;
	bh=4KH8mGkFSz/seHkadH0L2qYSd3c7ngK9F9pkUSxKmHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tpwQi0aD39EaGWxCu/PftHbOoLVrYQyn2LoT5wNZo9//rJiYXvcWB5UmXBZSK40uTpR3IbEaG63LGuuPgeNB7X7JwdMcd1oIOZ4kc8YYfYVhVXAncUXA2wTDLwzdU3c6HxO5GWLDLpO83y56Olj9aJSJ7McdSfxmAddIfOCtJ18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGeBM7s4; arc=pass smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGeBM7s4"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-96929eff169so747432241.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:54:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783515273; cv=none;
        d=google.com; s=arc-20260327;
        b=Ev+neOrsh9KkGmAxNvHvqNFMMYJannPjVvCqfoge2GpDGB83aNZIcNRyTg8hOsI1vA
         04P7cUcs0f2yIQzGt13J/ecxuIYqbKP6vOZ3p+2rcYevyk8CSKRaWEJJh9kxLrK4aaIw
         ALSpHOkAGFX+rek3v8TeDwSPTmQhQhbUwuC+VKJCfnkwuaAGHXh8nJ3njVWNd7sMC2oi
         a20eanCx5y3F0Li38RhRpfPZgkV+mUFKKvS1hda8illCvFL2HvpBlAA/7YALE/WG+WVB
         lGlx+PaHHnHfxRUKDx/GwVegiCsbBfzwQct7dIffaR1UYFJNEV/gRCQieahZa1WH5tEi
         R/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pF6Z4QJnlrmRAFEbhTsGEDqzggaHUPXZ5ncnx7Kx0I8=;
        fh=H3K81auz5WuLqIT5XGWR/ilNu2pV6uxXaQTRpnG2Pag=;
        b=dIVQ6EUnT9w67QC5BWNyNm3IP9j93O4hwxlmz7xs3jzleYZ25Dr+4P8opud4yOReSg
         2QafO2fdIT1WJy7FtbsvRlG0rkmvmvNP1TvMhL1rJZ3EbeJTaOsPPd/byDej06JwotXE
         WI5xb6dcRZA6OdArwdlKtkqmL1h/B5FrRO9ktnsRok86FGsn7WZwCygSsp3xWcLCnxjM
         VsDSLvxnp3N+VdmpTOX7GNvYLtCdzuFgEPxdr4RstBphJNcMtI/Avi3VFyTCCb06lOCS
         rxPLPHxiKRjvJwrvfHuguxEtObzjuSL1VKwMX4BdJAt09X/ZBpNFJSvgc4mmTzkQ4I8x
         bTXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515273; x=1784120073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pF6Z4QJnlrmRAFEbhTsGEDqzggaHUPXZ5ncnx7Kx0I8=;
        b=EGeBM7s41bI8X2qYVZ0X7vcqIKCrSBNdDEh9YMuRrQM1QtC5rc8mSg3zXlDiq1Xvdx
         j3gPG/ER6LjIXSo0P/18eeM/DQB02W+zdJMWuO78R/mBN7EbvlZM2vA96iFV3glWEnCZ
         UlePfaQEgkgyHNCjqprEWqS5npPgsV11gowcLlvRk4RgSi6vb/MaFrLVmCW22vY3h/we
         HL2V43ncGR71x1gMen54r/O9T3R4Q3In9q/epetGH5d5R7Gf54wk59wmbuUpMyy0qOe+
         Usjt4uuEWz4aS+oKT2TL5s+uYjD1hOxqSM4Cb7nuuJBHf/rbZwcp0KqCLrd1F9tZH2Kd
         VmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515273; x=1784120073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pF6Z4QJnlrmRAFEbhTsGEDqzggaHUPXZ5ncnx7Kx0I8=;
        b=IHYlteNxkyfGQ5nXGqo+DAcnBAWnLJnL5OblooRAzuZ+0sAk7shrUALzrA+P4nIigt
         cTusRBAv67ngIBdz6R+XvyqoLzj3so33iWaiSP4zv+/yGPcO7+HcHOf9KSgZxjMgDCs5
         gbH2YUQk2T9IUpAfDwCJlL3ULLoR1e3BkJPvc36MLIJwgHio0rlbcnRWxK5W43vUu95g
         kRDGQtuvvBfy/l0FuUoBZrPgqa8bFgV+420HLBjkPSSPVrZPAiSBufeD9b2+QbDg1vOI
         aII+/t7Uw5lUBtDO+RMRUkr2QqKZ6eoDG634A6pwJJAi6Pj6RxA5n44rOSC4xPHdoP/9
         iJRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0Czt3NSggAinjmYHrpis4/BYBgXfNT/fo7zhPfJ43MbgZqk3kdHInMXC+oL7uHhLOTZCnSQNs+60c@vger.kernel.org
X-Gm-Message-State: AOJu0YzADLyEFL7aDGK4h0y23lsqqfAthcuRg6qD9pOv4VmEJW6xciJc
	53fRUB7tsz4oaismwC5w5NSx2VPQkN/Kg/N8CKC78HilN67kagc2KUf9M9z09xQuwgRGqC49g/C
	yG+4YlZYV+uakgRQxdDYcOGw7QMb3E3Q=
X-Gm-Gg: AfdE7cmw1MzQ1v7DdExhUQjCfsmyxhOeIKdiqT0hqmnJjIOs2KR6UFpz5g13Mfrs5Uc
	KdqsVA3huljC1ufvJ5A/yLyLWSo/mdHiRXMAyxZjEiCGokSDUpdb2nvjnuRVKptaBBDs4CHb0vL
	Q5NE6p5+YxGeiQZmqhlspw+MUzrekuWOXaSubxHro8HFREs9lC9LHzn+WGMZqWjMZ696sK7uf0t
	phM7nbMY97NtoV1te4Ac4akDX74jWwodqUxWOui/lszWpsWIgh0lxPTSm1rBLuMqruUO+Zo
X-Received: by 2002:a05:6102:8484:10b0:738:9c21:1b70 with SMTP id
 ada2fe7eead31-744c248347fmr2627225137.19.1783515272662; Wed, 08 Jul 2026
 05:54:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707112714.2261727-3-shofiqtest@gmail.com>
 <20260707140545.0000029a@gmail.com> <ak0X8yrg5ujz8r5L@ashevche-desk.local>
In-Reply-To: <ak0X8yrg5ujz8r5L@ashevche-desk.local>
From: Md Shofiqul Islam <shofiqtest@gmail.com>
Date: Wed, 8 Jul 2026 15:54:19 +0300
X-Gm-Features: AUfX_mzInWCIvscsRQXhs2s8ccCnggzguweifxX9eaebhUCx9qb3sZM9knbA-t0
Message-ID: <CAOTCDVth36hE1JqAi3vJ3hKuqhs_yyjV0ZZx5mZotiJYzNDATg@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] iio: health: add MAX86150 ECG and PPG biosensor driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Joshua Crofts <joshua.crofts1@gmail.com>, linux-iio@vger.kernel.org, jic23@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, u.kleine-koenig@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

I want to address your concern directly and honestly.

I did use AI tools during this development, primarily to understand
kernel conventions and check my code against subsystem patterns. The
implementation decisions and the responsibility for what I submitted
are mine. I should have disclosed this from the start, and I did not.
I apologize for that.

Regarding types.h: Your feedback was not ignored. As a new contributor
managing feedback from multiple reviewers across nine versions in
overlapping threads, I lost track of your comment from v4. When
Sashiko flagged HIGH severity issues, I panicked and sent new versions
too quickly without properly reading all outstanding comments. That
was a mistake in my process and entirely my responsibility.

I am committed to contributing properly to this community. All
outstanding comments, including types.h, array_size.h, and err.h, are
addressed in v10. I will not send another version until I've read and
addressed every open comment from every reviewer.

Thank you for the direct feedback. I understand why you raised it.

Regards,
Md Shofiqul Islam


On Tue, Jul 7, 2026 at 6:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Jul 07, 2026 at 02:05:45PM +0200, Joshua Crofts wrote:
> > On Tue,  7 Jul 2026 14:27:14 +0300
> > Md Shofiqul Islam <shofiqtest@gmail.com> wrote:
>
> ...
>
> > You're missing array_size.h, err.h, types.h
>
> My comment against types.h was ignored. I think that this contribution is
> heavily assisted by AI (which has to be mentioned), otherwise I can not
> explain such an ignorance and mistakes from a human.
>
> > > +#include <linux/bitfield.h>
> > > +#include <linux/bitops.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/irq.h>
> > > +#include <linux/module.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/regulator/consumer.h>
> > > +#include <linux/timekeeping.h>
> > > +#include <linux/unaligned.h>
> >
> > Blank line here.
> >
> > > +#include <linux/iio/buffer.h>
> > > +#include <linux/iio/iio.h>
> > > +#include <linux/iio/kfifo_buf.h>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
