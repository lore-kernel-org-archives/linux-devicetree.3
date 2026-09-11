Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA46282F2A
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126260; cv=pass; b=SAh13wSSSpn6nWST21HDwkm4/TifNFXEiN/mbJpiPMx+ceXy0H4VZaVHPYlrMTurpB/YU9/sohm+s7zBFzDP1/NPiWFcEkmMty2peZGeiul2XCMUtELkoD7LCpbP7BHrhLXODGFXkWbkk/FOzbAi221bM3YC2VigM/7gNEIzQP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126260; c=relaxed/simple;
	bh=8oBNrn73qh+O/Q5uT6gV+BncjX+bawSkeldQVubHZBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ervb52iXX0lZVFFOyByBzm3IsmJ9Zca5wgVUb259j6JTK1tRRghA56X8XEc2v9qWX5h3Sf56wsAsFcXbEtrujTYsjhCZofRCcMN2uIVSaBTO0hybgb35Izf9vBngDCprifOSeeOskFblzpWrVYvHJfsIxRrn/+X3gE9PNGqupJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WE9E7auj; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WE9E7auj"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48436216a98so499829f8f.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:30:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789126250; cv=none;
        d=google.com; s=arc-20260327;
        b=DhvK6V9nlC+2FJMjl6Fo/bUDH1xihRIE5oknmfOw248Edj2SXaXRwroW6sUeQczrM+
         qsF0+GLQCKrPbK5yVYkic/hvkoIXybRiJplAxad0ROT4H6JfaI7GC/AHAEghaQ81KQPU
         pBGkZwZUjhxKFQX208gKANfWHg0A1EisgFzW77Cw1u9JK5Ft3w7x+j3G4EXxrY3gR67V
         Waubg34Z/NK7QFV5oM9B2l/LKwVXQ3tTHa/mPQmtK9/sbweb77iVgMfQtkpoPInLpYIz
         dPRsUf5jPoOFCMZLZU9HolaRWiqmWnZnqqs6RkljSZMnOEDbeZT5gvaZBE7EHnO/1Zq+
         CYNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EeNgemAb7lsaMF3mg8j+vPdtgIOxXFzORulJF8ZPymc=;
        fh=/TjaZKtErn+AR/As0xHTq5Q/AO4sgi0WSfAn+az6Xl8=;
        b=Zrxfm03Ky6nYVrhBNToYPkXpuupAdIE4Dog29C4+r+DG5nNz9FJOnnBCDmb7Xdrhu+
         WkDtK7G0SmZCzbp0SEywl5aO3goUHwdwLExwDdcxPTses+uBNtEn8ZQVMuhJ1yq34Ecx
         frmLFWGfoU8ov4Qrp/vimESrTr8O5iJxqTRnVHiiAQhmieqq1bPjlMG/FiHjD8EXAFu5
         qoN+Mj5HuQlnPT72ub2wDrpNBs+oIkRkeYpP2ZsmDJUO7Ae4eXDLP5rE4pLeI+OZ75nB
         VKutwC8tyOdyR8+F65Ohk5KQomhNFTtdvS4/hgHxj0v5zn8F9ghBAZl0XPaWXAkgSe98
         /5GA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789126250; x=1789731050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EeNgemAb7lsaMF3mg8j+vPdtgIOxXFzORulJF8ZPymc=;
        b=WE9E7aujDX9wgvf2lKhxdC/OqsF0xAz/i4dlFOfi6kfoOelL8kcK7kOl6nXmJUKfsa
         scWbnvam0Py3pPCUVzooFmLEUpeQBHR4lIuYmday3tnOZqRcVBwNwO1Lp0VJ91wQEpLP
         e9Y2c9/boyZgnLYgxk+JyGdj4M3Q9ELn6rHFVJZxQuKtkqfSG3MPsGjf5rNRPo2pBErA
         iSAK0i4NgB5FARkvKPBemWtfCehRuie8NTTNvD82Z+WMirZg1OVl/5cDHBTShp29xvbo
         EPOpMSlqSPlSLiSAHmujdYhUsiWT6SRchM/CbLRhyLg2+Vd2kahSQ+BIDyv2NtKfSMjc
         h+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789126250; x=1789731050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EeNgemAb7lsaMF3mg8j+vPdtgIOxXFzORulJF8ZPymc=;
        b=d3d+p4qiIIPlHclNxCJTu/AyFW8C9Hji19IYVk6/DdpYdSLh7zNTR5kVAwZDyQM59i
         MoWqqueQ9HKoV74yAWJa5OHB1k+WpfiqNiMGGZkyNFh4I+G2wxDrSXf4KKrIYFQngL+R
         kIKwHAvOJnx5HY1cK3jKnct1jQygQL99n17EMZAj+mePGLJILHbV0dBDQweAWqCY0vUr
         JtqFtBjI/ZJ2gJZKwwyvWQly5EPDq5C9hNme3b7YlIbQ6GHBUDFl5hIOwXvkQQxVAxF0
         AKKFsgjYHrarZvv+HrpSWQw8EMKb90bt1VQEp5S8RClgIJsg4d+cZsWFyB2K5Ia6rCER
         tmdQ==
X-Forwarded-Encrypted: i=1; AKwUvByFLWZTL67BF5CP0rABO/BUVvaxkR9pq2JpsJd/xDaBjdAvMdepKLxrYaB7Lq08I4Z4NtiqlPjKwEnJ@vger.kernel.org
X-Gm-Message-State: AFuF++miQFR6sTeb5XjFlt2dD7i1fUack+OIdqCB1BKaD55K9Af38Gtx
	bRQskeDt1qUFQBcF0iKWJs2xFyJKhuhXuW8WUaLrs1Qns7fgJtSoWAyN6oDk119ygGIa8KLskPX
	x+NYMPvz7zNBQX4UeAfeamUC3EOcX53M=
X-Gm-Gg: AYBFou1pCvyKyQvh+DaqJy02swGe9HG9k/wnRqQxn2mT5Ht5S8Coqcurfa1IcLPqPtd
	jziSdbn2QKwFmbjIYN7fMyjDyI748tGJWHr6JjaHC5yw+YO0p4Bz/EHNpJmjdF0Lmikvza8RB2n
	0p5eFL6/Z+ScAn2zjTY0A5GGJPjLZXyKNHpbUg4u+7TJZ/7DVejMoQ4XJz5rGAOFvswhDiHAstS
	u9qIT/MB52R128NEyCubjhRSu72IXdbMhppCQiU2QDB82ZJcD7zGjdfxeGHaKZx3bTtA0rg5Dns
	IqwKyX+Q50GLGho6F0m+C9O3f+VpAKR/9a3azuPenA+LWxVxf1ZBbFeybet0aWOKJAkXGBeVGq6
	w5nnw9mWsqNo8RRGaOTFslL1k7v+w1r85DIvGpRSmogCE24NjyJ25tG1jUvC/2hsGH3Kh4AxRNQ
	==
X-Received: by 2002:a5d:494e:0:b0:486:e73f:586a with SMTP id
 ffacd0b85a97d-486eb3046cemr2794052f8f.37.1789126249695; Fri, 11 Sep 2026
 04:30:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260911111731.3404308-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260911112607.3239E1F00893@smtp.kernel.org>
In-Reply-To: <20260911112607.3239E1F00893@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 11 Sep 2026 12:30:22 +0100
X-Gm-Features: AcwNN1WtZyh7B-ne7h4Obd9ZeApvbyPgvZ7Ss5X-8P5TGBqm7FWkrnhW56vuKck
Message-ID: <CA+V-a8vt0Y_9Qi7-KY2_206Be_H9GwG1g57aHwnVgx++A7_bEQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] watchdog: rzv2h: Propagate WDTDCR access errors
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Fri, Sep 11, 2026 at 12:26=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The error path in rzv2h_wdt_stop() leaves the watchdog unconfigu=
red and missing a required delay after reset deassertion.
> --
>
> commit 3f7bad2568920b818b4bdb62349364febc443827
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> watchdog: rzv2h: Propagate WDTDCR access errors
>
> The WDTDCR helpers currently access the register directly, but this will
> change to use regmap, which can fail. This commit propagates errors from
> rzt2h_wdt_wdtdcr_count_start() and rzt2h_wdt_wdtdcr_count_stop() and unwi=
nds
> the resources if an error occurs.
>
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index 7c6a4855bd8ad..cbf414e0c9a3c 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
> [ ... ]
> > @@ -169,8 +179,13 @@ static int rzv2h_wdt_stop(struct watchdog_device *=
wdev)
> >       if (ret)
> >               return ret;
> >
> > -     if (priv->of_data->wdtdcr)
> > -             rzt2h_wdt_wdtdcr_count_stop(priv);
> > +     if (priv->of_data->wdtdcr) {
> > +             ret =3D rzt2h_wdt_wdtdcr_count_stop(priv);
> > +             if (ret) {
> > +                     reset_control_deassert(priv->rstc);
> > +                     return ret;
> > +             }
> > +     }
> >
> >       pm_runtime_put(wdev->parent);
>
> [Severity: High]
> Does this error path leave the hardware in an uninitialized state?
>
> When rzt2h_wdt_wdtdcr_count_stop() fails in rzv2h_wdt_stop(), the code ca=
lls
> reset_control_deassert() to bring the hardware out of reset. However, it
> does not include the mandatory udelay(3) wait for clock stabilization or
> restore the watchdog register configuration via rzv2h_wdt_setup().
>
The udelay(3)is not required as we are not reprogramming the WDT in
the rzv2h_wdt_stop().

> This leaves the hardware out of reset but unconfigured, which might trigg=
er an
> immediate spurious reboot if default timeouts are active, or fail to rebo=
ot
> the system during a hang if the watchdog remains dormant.
>
> Could this error handling be updated to fully restore the previous watchd=
og
> state?
>
Yes it does, if the rzt2h_wdt_wdtdcr_count_stop() fails in
rzv2h_wdt_stop() we revert back things so that further pings from the
WDT core continue without any issues.

Cheers,
Prabhakar
