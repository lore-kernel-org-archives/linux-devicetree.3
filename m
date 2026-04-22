Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4122DC357
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 06:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776838472; cv=pass; b=jpgVXf09ApENQwFZLBBXAgenP2Ql5Xgm6yaB2mjkGkNNg6lYwOsaQjHqusWjmXSVDd3VQlo2sYqyKBiIM0AOG4iabQteFcaRnHpHeL2g3+eZX2Bz5K/L65NG0GK3PhPriHZdfWp+Y0PlXYhvVoTmf1g2p8p/jWLFAr/G4fhCDAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776838472; c=relaxed/simple;
	bh=jeF7sRuCE/tgNWpWkEp8CGIbKh6Ye/S47INTgDZFQCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=cgB11v/+AEebjgr0Ay0s8SrIDaj9OBjdG3n5ba9axUS3AqSMRi5SBg/7e1cXEmPeKOSAUz0vGrny3DbkpBBY3BynJPuthn24gUFwFMRW5R/ev7kwqUGnDatTWS9kP1yM3EXiTPds/FefdGuSPBvDO4bGoZFt4mBlWzsRdduXz+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqxSnExd; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqxSnExd"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ba5b107eaa2so231104266b.3
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 23:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776838470; cv=none;
        d=google.com; s=arc-20240605;
        b=JSCn5nbrKlvww+D9lzPnRHHMgwfxV6EjBI76OjmU7tvWoirEVlcOf2xO8M4Kw24HUZ
         2TJ4BPCI0zOdeLFhaiv/C+4HD7EtL0rlvV4U1S6bUoN2vH+nHLmI1mMdeDz7EUDko7dQ
         R9O1UJssD+FNetuyL78nnYmO3Au9ulkN7cmgG164wcjLh1epqdFdThFx2QjOEWblnKBF
         Y/chj8B6bkB5h6/uS0BadIoO7OGvjAh8SQ1JP0TkzJw/s0SosCLLQmDOqbEd9Uz3SpFf
         gb3Azg0/VpQSiPTNo0U4m1Cgc8RfNEO9zPIvud3O9aK16eo41PPvhERKNcBmk5nkfOB0
         BfXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P7E2q6exx7PW87rgGpHFPg1laXVtt9+bH8xKH5r59iw=;
        fh=B5Q+/MTj9Kvu7He0NgkHi7gWLw9YufeTbnes+EwIO80=;
        b=I2O9XFuODXpSk95wfmJJpFilFlaek/D+HtTpHQUGY9ipPGgrScTRF/EvhQXJcMZuc0
         1jKp50ilMzuGn/Sw+qMx6lA/x0FJaUyuUxxtqJ7twQpchWkvwTkOiity0MhPkVU3Csr0
         hyfW69TaSiPTaA/l1695Z4yb+TJFvFAeRiQkqywKbkhCRy+t4X/bboG+3SN7u2DuoxHh
         mACVdEEEH/TaGol9gaP2wo5/O2vzmhJAiXe/eooj6brP615joYB8Mh/KsNebhgZaT/TG
         KQulED2w6jvv2CQ15QfkZGQuJOLtsOE7fn5/YhnPLM+heFXuW2QPjzy4xjlO8pXvfIIL
         QP/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776838470; x=1777443270; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7E2q6exx7PW87rgGpHFPg1laXVtt9+bH8xKH5r59iw=;
        b=XqxSnExdnAhG+HOwVAn8PBPkH047wVCgRlSH6CslrPx/XHjn/6/m3P1QTvC4+A7WeN
         JGujtyGHQkgbRgbIq2BYhu29VJfOQQKXPCQW+p5rFU/dEY/SuHvlKdom6y6isZpJYQcB
         FDZqGHpnFP0e3FnOPBUk6PGtpkA/ifBWiWV8AG5r+vpT3HvPrE87TH9BQRCC2V4MI4Vz
         w8N2TeW28bRDkliOFmWwBo9shMrfkRvE+vVY1dKgMRtbtaJqrF6mqErJ2qatfPwLBehG
         sZJr5aPR+FrlZ+3EY4FSE1u2Azvpq0P7M40bXhB+LciqsNJDi9q3kHcOcQq8SnvByVOb
         2y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776838470; x=1777443270;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P7E2q6exx7PW87rgGpHFPg1laXVtt9+bH8xKH5r59iw=;
        b=h+5xatjg3JwEb8bknKH+5fubNGTTSmE7c760nJmHmw9WnytRh8qWigikETNUJwZafY
         wAKx8Gk2DHUKzIQ6k+QhxekHnDf2AEQdJ4ZqESkBK5wk8tedjDBS/vpOr20/mHkMANpW
         Xdz4yXsVkJUxErP99kkc+ZuHpBKuHo6FZc3+4WB7dqFTpzDbh7mOTjG6p/74s9WX+wu/
         CZ0ao0nzFXUQq+6ua2b2mmq5Ul1zoUqrKLc1voRUuJ2v94hgf5W989JBOgCz7lJpiIzw
         h1So2w2PTgG8TnYjZ400GkUpglWMNVKW/u+YIDDh3mpeO3X1E+FIfO/vVC0RUrUZozAP
         rXYw==
X-Forwarded-Encrypted: i=1; AFNElJ8BVG8mGAUc/9nR6+IjgngWHTikarFrAKaxnEObK886hzes+dDjIQS0+xrx1cdFdGoGg+QISo55KdK9@vger.kernel.org
X-Gm-Message-State: AOJu0YxvM2TdQ/x+1TJfztli5aaVx/jegK5cYEhrfL5AMAADygtL9c/E
	lTlBgz/mYiWFShdar8QsUz/OGNzQPFF8piVVATmLUIN8LAUriyr6qzvpwyX7CRs9CUxjezwt+bT
	h/0/wrTkWHuAQYRKmTruOnEKQ1aYLgn4=
X-Gm-Gg: AeBDievVNfJIbMKzhS5VIgctLWEYa9kgqB84JGArKuNkiOFF/9bzEbhC3x8xsEMGPMT
	qUw75KRWCZUIyQdXwbaY3e47bN2h9RMsM2CowmzTMxnnGnFvDnauVeKHH9O3bND7KEcuAOCmGo3
	cm+/kyFK8tnOWIDvIC1B/7miiLo0IPYXG56Odfd+i90XfdIamALKWkIs3jVo403gSuUwu3XvM3O
	Ek3E+iMxI4cVBAH6oD2Kvl0PYkh3bx7XJgpOyCBOVlQgv8zFWr8vdDHNVgTtD0ojMdNUonURDSk
	m90WBS0rBibDiEM=
X-Received: by 2002:a17:907:1588:b0:ba9:3162:182 with SMTP id
 a640c23a62f3a-ba9316201a6mr261303166b.19.1776838469610; Tue, 21 Apr 2026
 23:14:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
 <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org> <CANAwSgSNHO3MNewNzpYbhuj4K3NTdfzDC9KPoUHbFH97P4M_UQ@mail.gmail.com>
 <DHUCL24GMX7D.369IWK9DLPZPX@mailbox.org> <CANAwSgRt5-t_ah=phGc+CQYHG-CdWJuOX-2VTW6xE7n7EnVsFw@mail.gmail.com>
 <aeaXszeaE62rM6BJ@aurel32.net> <DHYOIIFMGH7J.228ISQ7XYFGKE@mailbox.org> <aeevr6Zj3Pwm9wux@aurel32.net>
In-Reply-To: <aeevr6Zj3Pwm9wux@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 22 Apr 2026 11:44:14 +0530
X-Gm-Features: AQROBzCenitl4Odlgd_JfKGymltQZPnNxQ-FB_fBcOyLvkgF7DPs6UdEgDyDJDo
Message-ID: <CANAwSgSCo-mESo6=KSc08oUzTWAgzpYu0JaW5KqmnCNiPYHjxQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>, Anand Moon <linux.amoon@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuwei,

On Tue, 21 Apr 2026 at 22:41, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi,
>
> On 2026-04-21 16:10, Shuwei Wu wrote:
> > Hi Aurelien,
> >
> > Thanks for your addition.
> >
> > On Tue Apr 21, 2026 at 5:16 AM CST, Aurelien Jarno wrote:
> > > Hi Anand,
> > >
> > > On 2026-04-16 17:07, Anand Moon wrote:
> > >> After reviewing the Banana Pi F3 schematics, I confirmed that Buck1 =
and Buck2
> > >> Both supply the CORE_0V9 with 0.9V=C2=B11% rail. To resolve the rest=
riction errors,
> > >> I expanded the voltage range in the DTS to 500,000=E2=80=93950,000 =
=C2=B5V.
> > >>
sorry I was wrong from the doc below 1.2.1 CORE Power Design

The typical core voltage is 0.9 V to 1.05 V. Actual voltage is
dynamically regulated by
the **remote-sense dynamic voltage** adjustment circuit inside P1.
P1 BUCK1 and BUCK2 must be combined to supply the core rail.

[1] https://www.spacemit.com/community/document/info?nodepath=3Dhardware/ke=
y_stone/k1/k1_hw/k1_hw_design_guide.md&lang=3Den

> > >> Additionally, I updated the DTS to map the second CPU cluster (cores=
 4=E2=80=937)
> > >> to Buck2 to better align with the hardware's power distribution.
> > >
> > > Actually the output of Buck1 and Buck2 are connected together, so the=
y
> > > should always be configured with the same output voltage. And both
> > > clusters should be mapped to both outputs.
> >
> > You are right, I received the same response from the official developer=
s.
> >
> > Therefore, I'm wondering if an additional regulator-coupled-with: prope=
rty
> > definition is also needed here?
>
correct.
> Yes, I think this is the way to go. I even wonder if this shouldn't be a
> fix with Cc: stable. This also has to be done for the Milk-V Jupiter
> board, I haven't checked the other boards yet, but I guess they all use
> the same schematics at that the PMIC level.
>
> Regards
> Aurelien
>
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

Thanks
-Anand
