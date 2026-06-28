Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F512045AD
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 07:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782630970; cv=pass; b=h7qVD6aKCq6X/41swgse18O8UmG6oG/dk9nI8emsCtUDUdwgAN4hRB+8PWfVmNJ9nNnsR5STE0Ua3tRnYCXSn5ufD+jBiY8YCZCYdS0nseGaD508vMHUAMn4PRweok6hbnZ7w0sOY2TVmBxWAQEvavRQKUmHioQ0ACugRGBqFYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782630970; c=relaxed/simple;
	bh=Clnfi/kv4cLVv5dhNS8JGOOv22pyEAHj1VloGHzKTnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+p0yQ4E2KJYH7mtZc5cJzbIgzDdLRYZthmOTktVXWYC9kxfcfA9VrT8Ujls9+80C4mF7sL5xekYxL+bzbBZNlL7UpcduKrPOaTaSEurPVMM+aeLNzfBa71uCe/upXZMzmOyA4SpaPVVjjOf6r9Z02hEn145Ta34C8JeP/iJGmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MvgTQ8Vn; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MvgTQ8Vn"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-80cd342a796so10174797b3.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 00:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782630968; cv=none;
        d=google.com; s=arc-20260327;
        b=D5iAfm1t32WhvD9ER8ri7//rfqTBay/ZhETXowiK4ym4Y8zJmuDKNc3jGMp8Gt02I7
         ERgxddSowe1U/lkXppTTIfs0DY7EOQk5QQ9NQAOrHP1NoVcwwvbQMDgC8D0b93sQR9n0
         bF/X8q6tONSr46Hf8OxdU0rJDfaxYRoCSS2g9Gp3vj6XreTq9+m33jJq/INYLBYhjbOK
         jH+gFCXcPXNWSWmH2kGWY6xYl5zykM7p/B3SyXYMclcNXc+bFQ6duXD2cXAL70JPqj8P
         Dj8y3vZ0okYr+9xtRTEq1KP7r3SvlUnbdGT+TyJuRMG1GrZElxEsJZhsePbugDCjLOfi
         QrKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VYkMilNx7ZRv+pY9kOiaVDU1vZlVNUL8U5Tb17+D99Y=;
        fh=l7naXfeMQEo9RaYW8qxWeqhttAC3Wzufq6pNZDyy/F0=;
        b=ivZQU3avPw+8Ao6ph3knMhhpjfF0DwIENVUfrLBv9PTtyUbIhhYXCUVjkHIEgdRxeY
         HiRYswWRfDu5lB3D4YsFglBfeuyvIl0zxRk5vHLMSgtrA8DDdUFVXLv2aakRWMR+afwc
         ZT+C0S9jhSqeZ6iNYIfArH8JucgqH5JCViQ1lB6rL4SLDvLyUdeReTG4Bs+1dbIjNyF1
         D+vKPPDJlpKgwRz2YW3wb/Y1THLcLGcZwbejNbIxNP57eIxjF44oxfqk6D3pL00WNG47
         w3NvxbHHzqBu+r5BAYR2n2hAj+lrgXv5qbXAm1axw2oBJKpItfW3cVglyTCDczt4chlw
         yt1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782630968; x=1783235768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYkMilNx7ZRv+pY9kOiaVDU1vZlVNUL8U5Tb17+D99Y=;
        b=MvgTQ8VnZkfYJnspd9Q55a+i9zhmPZcZrczGz5XDGKwmdamvtWz34yhhCqSBFs6jHu
         IoLgE8SCNiXjqXcnkZQQ3Q5KENUNccNzkcca7UA76PFzd5UrpQr6zEVdvkJk/g13B/jx
         6qSGZto+2yzgq+cvho/ivCbqzz6NKoiEvMg4isnJoESaoedHbYlAdlRrnHYetYd6iKa2
         uL+MXBIa9VsJNaWzdw9uCenqYLbbZCpznonTA1QwP43HPDhtUHPfeGgm7ruAaAVJRym3
         EcKRNCOnNDObZOoCjBTuufHXHTCTPFf4sWER4FUBdTTrbp/Pz3dEqZtw0aB55Z8FrUna
         vOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782630968; x=1783235768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VYkMilNx7ZRv+pY9kOiaVDU1vZlVNUL8U5Tb17+D99Y=;
        b=NBOEbzKQVG7inJYpG9JImscktyIql7X1QzbYaYVT7iooINhgghfJgORTs1Suymy8ms
         GZ5zBb6ZOgunn/+phXtdwN8J+TUl9oU6f/eZscIFevbJVZ9FEbIV8gzLPRLvjJX92KSf
         jOWXWlUoZ6Vwx4vg5j3YNI9hgXPJxrTPkz+bWvUrKX628TxzoHSezrVYPLD+MNsZdA9N
         lpAzj9TK9uu9VvDolZtFkMZo/mGry80P8WzMXGJptwdlRSuqLG4zQrS9Rvm8xJneJfcL
         Xh+zN+FyuA9JUnGhWNXfu7y5f4LXoGTdiX1E0iRXlJzRcSW/6xyg1YKurmuZDQ3AjIcQ
         uatA==
X-Gm-Message-State: AOJu0YxL/tdzqS2LhVUDgWhnUba3k41Q2t6NasJenQRoZH+ZxmYkccHf
	HlRiClKsd3rv/G92YzcyKuJ1jC67WNfZ7p9YntR+LHJeYS5Boi7L7Rz48PDWylfqT7v/FWeh5al
	TAzfIJwXV8VIJNkzSTvwuulqLFmB//fY=
X-Gm-Gg: AfdE7clVD+82uY+kVjlKdQD7enqTpPrD2dLDIJQgpoS0mx7aMEvDSTbqiAc/Q0ixhSY
	rP5f22OO0iuzuWDhzBWjDKJu4tVyRFZNotyXEe4nHd7UY/UzcCB1zAGFNxULWcBqhBq72A4edcg
	5Q594gIqjQrHQpXwYi1V2p/8KQ5ZNHgV3aVTuh67YdtXceZIXvni8P6N1dOgF7yAFmEx5gDaFUa
	pdS0zzlfu96DbDup9nZ8tjZJG73BZM6AApBtNSRNW6w7E5jXuFKe/fctM3T0kSQW7mrKGx0sA==
X-Received: by 2002:a05:690c:6ac6:b0:7fe:bd7:9cae with SMTP id
 00721157ae682-80a6a496acamr120226927b3.44.1782630967897; Sun, 28 Jun 2026
 00:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622083046.3189603-1-tmaimon77@gmail.com> <20260622083046.3189603-4-tmaimon77@gmail.com>
 <20260622084246.D01A91F00ADF@smtp.kernel.org>
In-Reply-To: <20260622084246.D01A91F00ADF@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 28 Jun 2026 10:15:55 +0300
X-Gm-Features: AVVi8CfnmkRHCHwHniRXRzrKmmVWuj6G6RgacnVW4_rojVzgCVFn156J9Mj_5vA
Message-ID: <CAP6Zq1iD2GA2Aae2Vz0UvNG5RSv2N_H-jAnfDy4Kjm6Pn1htxg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] watchdog: npcm: add bootstatus support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the comments.

On Mon, 22 Jun 2026 at 11:42, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The first watchdog instance on NPCM750 clears the global RESSR r=
egister without caching it, causing subsequent watchdog instances to perman=
ently lose their reset status.
> - [High] Non-atomic read-modify-write of the shared INTCR2 register clobb=
ers concurrent modifications and incorrectly handles W1C semantics.
> --
>
> commit dafe1267618ef0158376caf5f3acee9d7fe7b1b7
> Author: Tomer Maimon <tmaimon77@gmail.com>
>
> watchdog: npcm: add bootstatus support
>
> The NPCM750 uses RESSR and the NPCM845 uses INTCR2 to latch reset
> indications. Read those bits during probe and map them into watchdog
> bootstatus flags.
>
> > diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> > index e62ea054bc618..98660419ec3f0 100644
> > --- a/drivers/watchdog/npcm_wdt.c
> > +++ b/drivers/watchdog/npcm_wdt.c
> [ ... ]
> > @@ -169,6 +250,92 @@ static bool npcm_is_running(struct watchdog_device=
 *wdd)
> >       return readl(wdt->reg) & NPCM_WTE;
> >  }
> >
> > +static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device =
*dev,
> > +                               const struct npcm_wdt_data *data,
> > +                               resource_size_t start)
> > +{
> [ ... ]
> > +     if (of_device_is_compatible(dev->of_node, "nuvoton,npcm845-wdt"))=
 {
> > +             ret =3D regmap_read(gcr_regmap, NPCM_INTCR2_OFFSET, &rstv=
al);
> > +             if (ret) {
> > +                     dev_warn(dev, "Failed to read INTCR2 reset status=
: %d\n",
> > +                              ret);
> > +                     return;
> > +             }
> > +
> > +             if (rstval & NPCM8XX_RST) {
> > +                     ret =3D regmap_write(gcr_regmap, NPCM_INTCR2_OFFS=
ET,
> > +                                        rstval & ~NPCM8XX_RST);
>
> [Severity: High]
> Does this non-atomic read-modify-write risk clobbering concurrent modific=
ations
> to the shared INTCR2 register?
No, the INTCR2 is accessed only by the WD driver, and reads occur only
during the WD probe.
>
> Since INTCR2 is a shared global control register accessed by multiple dri=
vers,
> using regmap_read() followed by regmap_write() drops the regmap lock betw=
een
> operations. Any concurrent modifications to INTCR2 by other drivers could=
 be
> overwritten.
>
> Also, if INTCR2 contains Write-1-to-Clear (W1C) status bits, writing
> `rstval & ~NPCM8XX_RST` might incorrectly write 1s to all other active bi=
ts
> (clearing them) and 0s to the watchdog bits.
the INTCR2 is not contains Write-1-to-Clear (W1C) status bits.
>
> Could regmap_update_bits() or a W1C-safe write be used here instead?
It is not needed here.
>
> > +                     if (ret) {
> > +                             dev_warn(dev,
> > +                                      "Failed to clear INTCR2 reset st=
atus: %d\n",
> > +                                      ret);
> > +                             return;
> > +                     }
> [ ... ]
> > +             }
> > +     } else if (of_device_is_compatible(dev->of_node, "nuvoton,npcm750=
-wdt")) {
> > +             ret =3D regmap_read(gcr_regmap, NPCM_RESSR_OFFSET, &rstva=
l);
> > +             if (ret) {
> > +                     dev_warn(dev, "Failed to read RESSR reset status:=
 %d\n",
> > +                              ret);
> > +                     return;
> > +             }
> > +
> > +             ret =3D regmap_write(gcr_regmap, NPCM_RESSR_OFFSET, rstva=
l);
>
> [Severity: High]
> Will the first watchdog instance on NPCM750 clear the global RESSR regist=
er
> without caching it, causing subsequent instances to lose their reset stat=
us?
>
> The NPCM750 SoC has three watchdog instances that share the global RESSR
> register. When the first watchdog probes, it reads RESSR and immediately
> clears it by writing the value back. Because the value is not cached
> (unlike the SCRPAD10 mechanism used for NPCM845), when the remaining
> watchdogs probe, they will read 0 from RESSR and permanently lose their
> boot status indications.
Will be change in V3
>
> > +             if (ret) {
> > +                     dev_warn(dev, "Failed to clear RESSR reset status=
: %d\n",
> > +                              ret);
> > +                     return;
> > +             }
> > +     }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622083046.31=
89603-1-tmaimon77@gmail.com?part=3D3

Thanks,

Tomer
