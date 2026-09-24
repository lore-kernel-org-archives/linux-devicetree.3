Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A9549364D
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257483; cv=pass; b=D/dWTPEfN9mMISKoxtU2ebGflXD9utmzlgXLiMKmJS3q6XPc4e3fDK9AHM3gyhVRPnzHBh70nC+Xh1gPNLjryw35LP5MPBtxjItK8QrNvYThsfk8JznwMRkzE+1Sr8bPyEXT+uO0/AF+6QHJMjfGv+vQNrYcOS6cnKxfdL1Wfso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257483; c=relaxed/simple;
	bh=srpUlNZOrzAYgQzUQn9udJrV5U4zpQZLaeztMl04WB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UmbJLu29SkbgEpVN3Ja0+L1tnvPQa6Mu14IsCuLfTyqHjXUbuqytGANugieFMjDQyXsli10jlrXXmtT8Syf9CROTD6DNHebKBXxtgXMezfNBPWJf6zPZspQzZG5TweidcUfqVly1huUvKLxSMl7ee4JExfswjyi+azj8i94NkOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anxL7Pzb; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anxL7Pzb"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so1465349f8f.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790257473; cv=none;
        d=google.com; s=arc-20260327;
        b=pxI37+fOz823W+WW+iUCj/lEui39j2x/bAGGBZeYlq2UmxP5oAhGE+T9lm+Bt2QpzK
         EdAhbImtMZ8jjYbvwVk/iT3M+MI5rP6WiDZoDLjg+Lwv/M4WxNk00fZ4dWCnaEkFVC7S
         htKVKnhO/dOtkD9keYV/nVf8CwrC+E6MtrTzV5XXGky08nyE+hi2Dj4lLP+VxG/WWGkp
         g6YGuPIvWqo3rRKPGp+XtBoj9sDrD0D0mUYFDh7KcHjoAgrrihq4D04XJIggMPQL5hEj
         vNpv2YliAajMXAxHdl+CAq0baJSoXeNKt+yKq3gvefygZCmOo48Dx3dx0xHOVTazJtJj
         4rwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1vA/7F7T4hKWXEqYJVanQp0Khdd6KmZi7BaKquhMJvs=;
        fh=HylG2R9i5sarM1xbzYYXIhZio3S9IW7hDoykmP1ja4w=;
        b=BKMO8dTVCkmcDV5PNUsHG2n2IvqrsCVnfxHNCdA46CUK/RGLzouHshJiSLPOs9qg3i
         SAvCRkgbvQZp5vj7RB5C48GRXWv+9QpKWI3aa8mhJPXnw5iuUkRVm+M4h3PycLXfoZSf
         1RcYdO1NGs01l/g90Qhk2muJex5doA+bd2icviUWZi3yyRPj3JiVMqaxS9kV1tNhUxVW
         Hrs+Ne4sz+6ywziQRz6JdQ924zDyH+Sx1I9LrHLLrvDfULLypn4ed018cNFZ+b1jOpv6
         aVgX+38xGLDp7gd8BTuIrNdp0e5ozicITuaOCodCmwS2veyi/l/CTuWtaU72Gn1rbMBo
         h+rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257473; x=1790862273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1vA/7F7T4hKWXEqYJVanQp0Khdd6KmZi7BaKquhMJvs=;
        b=anxL7PzbC+Glj0675LuiLX2EL9/S0omdW6sjEjFXfdLxLktXdt4fRsU8E2yTvcubGL
         xx6Th8xAIppIlgHDda/ncRZXSc4pX4BFrhfyTbpBRkXHGBQJT3vTPG5ekMNBsKsq56AO
         KnfixPD1mQlvc2FrVJSKzO/4VIw/KXnRm2OhL2VMyQEx3oHehLEjtJO/R7tUVus0Kb6Z
         9tepv+ST7PoCEPjrWOOL5ddjTImeqa62ItJKB+1Or+ikMJariaU04DK8AXjLcEhq8TzG
         b55NGZFFY/iyZQxik9NF1/UXKAXUqsPk7JlolvyalrkIeJCvbBekFUeFLkVRoDD9gzUc
         q1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257473; x=1790862273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vA/7F7T4hKWXEqYJVanQp0Khdd6KmZi7BaKquhMJvs=;
        b=0fJCjovbpvKaKJs4W2m2keJoNnsuseyTbKLdcs/EcHUzGXpxsGpO7aRYhfGKRQkgjp
         NqGsWrofQZZqQa9ylR50VsE/UVRbvduMHc3pzuBfbLsGxxbY6MXz6/QWFCSywv0idCXs
         3ijp9NjGkFL+g6rq6AC9MA1O8i4jSUcyVEFeAtSC3aj9Mx2/gDMgUTCdZcNi2lKhdva7
         Lkgqs+nHPpQOuTprg/1m7LrzwAGbpa873cmIK61U44Ww4lbugthLwgt3vKufa7pdqb7L
         7Zu21BZs0Y4+8ipeyB7G5GJHIlVjZHMnF29f3eU5mXVftpSMnbHR89htJRslMSw2buEJ
         ibtw==
X-Forwarded-Encrypted: i=1; AKwUvByqW+L350z8PsLoDwAXxsrEjT8q0dU9CZsKt+eXOjLuzrepriuLwZ9gPk/NQMVZPk6QeYoiYBAFXuTa@vger.kernel.org
X-Gm-Message-State: AFuF++ns26mPlotdEchkxspD8EbnVNU5esq+z+rlZxKEQ2QLI2Fs7h8v
	Hkzzi/MBqMDtL+gxuCUNOAFb2K6mQx9xShFpVRV39WnXWIfNB7HNhWzkrOvahIenHJB6VeRG2lI
	CoAL1OzbqJ80CBkcVmb8FY2bOExSEfS0=
X-Gm-Gg: AYBFou3w7HqLg77WJ1aidbIKNGMWnJS9eBmE9SzUG6oLgcwa0o6prXuNNTxcD6+sg1B
	HAN0zCv4H76+HeAFzjPJhVphwD2lFr7zBSxUqFsG+d1AL27AjjINwHBQXrezpIO/qXcgxmgdWXb
	N8Et0qD8qM4jsh3Dze8g1SDnzUUZo+tjsF78WarFMCFKC8sZh59j9itfcEHDJIkbFT9HRsXnsod
	QCNxTerG+fA1oST0UFdHb3YeGonDzSVYzYuBqMudi2CQe9u2S/rDfp/DmvIcrGXnUvSrRutyxYr
	x9U1HnQUp5eg6usJr9y3Sg1uXmFvQ2HKUOMPmoKAfRziKi10O0bCGPp+7YrNlTf7n3g5cjy91KH
	37aWL19Ynlm9YPJ1pXzpWhc9NX0erWY2qyQx1c721+X92SemqEP02bNacimIkecdw/lR35Lydzg
	==
X-Received: by 2002:a05:6000:41ee:b0:487:71a:be5e with SMTP id
 ffacd0b85a97d-48871751e7emr4423057f8f.28.1790257473544; Thu, 24 Sep 2026
 06:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923104054.3324830-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260923105237.7B87D1F00893@smtp.kernel.org>
In-Reply-To: <20260923105237.7B87D1F00893@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Sep 2026 14:44:07 +0100
X-Gm-Features: AclHuK8zM1ciyUvzD6y496Uq1l_AhIJFVnKp0Rhb2IMAuf1s6F4re485NR0FU3Q
Message-ID: <CA+V-a8uD16uG8cc9m7NHVZXT5bU64TYfu+_1POuXeioRAy6Z+A@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-watchdog@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Wed, Sep 23, 2026 at 11:52=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] watchdog: rzv2h: Deadlock in restart handler via syscon regmap l=
ocking
> --
>
> commit 1e1b26069f70735a537750b22a51257bb422c2e4
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> watchdog: rzv2h: Add syscon support for WDTDCR
>
> The commit adds support for accessing the WDTDCR register via a syscon
> regmap interface for RZ/T2H and RZ/N2H SoCs. It looks up the SYSC regmap
> using the "renesas,sysc" property or falls back to MMIO access if absent.
>
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index 76c1d315b0e77..30b0b70fecaa9 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
>
> [ ... ]
>
> > @@ -93,18 +104,22 @@ static int rzv2h_wdt_ping(struct watchdog_device *=
wdev)
> >
> >  static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
> >  {
> > -     guard(spinlock_irqsave)(&priv->regmap_lock);
> > -     return regmap_set_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTO=
PCTRL);
> > +     struct rzv2h_sysc_wdtdcr *sysc =3D &priv->sysc;
> > +
> > +     guard(spinlock_irqsave)(&sysc->regmap_lock);
> > +     return regmap_set_bits(sysc->regmap, sysc->offset, WDTDCR_WDTSTOP=
CTRL);
> >  }
>
> [Severity: High]
> Is the external sysc->regmap_lock still necessary here?
>
> When using the syscon regmap returned by syscon_regmap_lookup_by_phandle_=
args(),
> the regmap has internal locking enabled by default. Since regmap_set_bits=
()
> already performs an atomic read-modify-write using the syscon's internal =
lock,
> this external wrapper lock appears redundant for the syscon path.
>
> >
> >  static inline int rzt2h_wdt_wdtdcr_count_start_nolock(struct rzv2h_wdt=
_priv *priv)
> >  {
> > -     return regmap_clear_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTS=
TOPCTRL);
> > +     struct rzv2h_sysc_wdtdcr *sysc =3D &priv->sysc;
> > +
> > +     return regmap_clear_bits(sysc->regmap, sysc->offset, WDTDCR_WDTST=
OPCTRL);
> >  }
>
> [Severity: High]
> Could this lead to a deadlock during a system panic or restart?
>
> This function is called by the rzv2h_wdt_restart() handler, which execute=
s in
> atomic or panic context and must remain strictly lockless to prevent dead=
locks.
>
> While bypassing the driver's local sysc->regmap_lock was safe in the lega=
cy
> MMIO fallback case (where rzv2h_wdtdcr_regmap_config disables locking), t=
he
> syscon regmap has internal locking enabled.
>
> Calling regmap_clear_bits() unconditionally attempts to acquire the sysco=
n
> regmap's internal spinlock. If the system panics while another CPU is acc=
essing
> the shared syscon block, the restart handler could hang trying to acquire=
 this
> lock, defeating the purpose of the watchdog restart recovery.
>
Agreed, the syscon regmap lock cannot be bypassed from the watchdog
driver, so the _nolock variant does not achieve anything for the
syscon case.

Rather than working around this, I think the right fix is to not
register a watchdog restart handler on RZ/T2H at all. On RZ/T2H,
system reset is implemented by TF-A through PSCI SYSTEM_RESET, which
triggers a software system reset via the SWRSYS register. The PSCI
driver registers its restart handler at priority 129, while the
watchdog restart handler is registered at the default priority of 0,
so PSCI already resets the system first and the watchdog restart
handler is never reached on this SoC.

With the restart handler gone on RZ/T2H, WDTDCR is only accessed
during probe and from the start/stop callbacks.

Is this approach OK?

Cheers,
Prabhakar
