Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF2E3FCC
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243785; cv=pass; b=EAvO6vX0uGuYIltLnwb+M9x693HtpOYXGzVabVp/Fz0+ZUJHM16cNjibRmV3lkY4LRPh3XG6mnj+qhoSmG4JE5koOZEsKXK1omXP6fyLEre5Fldx4rdmwtgwUZOW7tix0gnl6AuWmnl36a2whGKk19vYN+P9ugjfbPk4z0CRMFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243785; c=relaxed/simple;
	bh=g8oimaORGIUiIaEIuPOcRHBRcNq8Tz0N0WhtWq2zChE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=prpvmJaPaheb4SGwGOTj34QDuAPXxvofB6uxIPFde8hSo6l2xohWO+gbBfO4EOlek+9aYvrAOwQAUC5bT4kietTnmIGYdBM6IGofGuKrWe+gL+pjLiP4L4M/F7enOusVUzfW0kv/9Dttz/FhPYeAnE1LM8ZfnEl0AbG7pj84NtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkUhTmjM; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkUhTmjM"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ab46931cf1so40759685ad.0
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 02:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776243784; cv=none;
        d=google.com; s=arc-20240605;
        b=lSKwMJiaSBsh/0yjJl4D/Pd48iW2A9X2NGMxAAiSb/sUrdP7VbySj6IdXbWEwz5GbX
         wE77WpYONKAT0nklNKEwvA1qXiKsi0VlEeeEoP+p6Y73lXEIKetT6y1zHM2oAWQN3SRR
         6yIHAL3ef27LjALGtzGYCva7ca5jkDjoIZI/xgl71LBbu1Wzk5dYir6el8s3EgSaa4WP
         EDE2gfEv08Rm47vuNQ5R9iXLcunP+OZtPpDbwtP7n6HBPK29GvpUpe0lPwAgp3fYYggK
         HArtL8EKyeQ1duTAYzJZ/6svzX66Ov66yEtgi7eFNz5bS3VuTEGgxgWAjb4YNeku09RD
         u+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GhSm6AC+EBob8Si9/iWbHEozFaMuoZoR04/c65WN25w=;
        fh=JWLIZwAnCsyzy0/vkUG+JtcEGboAIHQZvMmljKzYDNY=;
        b=giCfX8vtdQ5lWSNg+b4r2vrMrGQFef6CitBVU71BZjFzLw53KRR61WNk89Grwkpbug
         bLYr3OTSWyP9fESsHH97atwo33NkPU7gTdsecUsq4JWssdLqFLFO5OABzN/G8uknhqwX
         iBKXLvO57nRYen7XYPu9Wo6y/c0DxZMxVi0+rV1OW8TBprt/Iw9FvJsRStoIFUihv/i8
         e/QDierB2++cqmNU7Hqi1LF2udm3A095hq3YkX4TDdsfmdjX3n9O5i75od6l8Hkd8q0j
         qhc5LxZaLbM87tUQ+8oYrPEE+o9bU3nPMMevAD5nKEEzsNMB75KWccZUsVoYJKJPHrIG
         WNYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776243784; x=1776848584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhSm6AC+EBob8Si9/iWbHEozFaMuoZoR04/c65WN25w=;
        b=QkUhTmjM7pkE6g+5OaZLFr/xsxJki72icpopITnJXsTxr/eoNjsNLWlhkb2LxYMrL5
         rU9XzA1ktSeZzK1rtjMamf08jlXU9wLaOEQ14IC2Noo4jv6o+xrsXquYxIXJPNDbz7xd
         toh9ib+sTh18uq389ZelxTojGvIV3G620IlnNtwpr6W5bD8E4we9lA8Y4vo9ZSU2fMId
         E2rvqN64dTEbLFryoRZn5nWX6Zi38sZRnZCUjCiBQKSlu0W6RrUh7N5u8KxLz2B0WKlp
         4pBaOy/mSBYb2Q/Wmc0YZ123pCpEPPa/mu4/NtyrpyI8n1o440TYLiEuS/zasPKQnPNj
         9a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776243784; x=1776848584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GhSm6AC+EBob8Si9/iWbHEozFaMuoZoR04/c65WN25w=;
        b=fYRfi/z2hBdwIckcmhhwXzce7IeG5BjWUvuk6jcIgwxC+3LtvfarvlKRhvtgClAW8O
         FFvb+59Oe1a/1XpDSurYwC5VZZ5DK5T1Ym67zSQc6D1oISeIPg6Pgms5KNf2NxVL/zPL
         FwysvzxfqvFKUjlSqAixRF1JzrHP1rEoNBRCm0HaTOhbOtjsDqK4Qd7F0pmilxOZDV0A
         cYpM+2Plw34P+0sh4tEJZMBzTI+3XzMnuu7L0GQtCdv8aJR6VVJJ/ImS1cPOzrAsWNhz
         kfc2ITiqODt9Ia6fcG780BUu9BiBARj3UsO65XpDQqEIwzbmjjA7WOECtxTBfOBILwlu
         nrDA==
X-Forwarded-Encrypted: i=1; AFNElJ99+491IVZ+ZdBgktC/L4IDpCISStnmp3uwsw/JJuMPdnvN0ynYyu53YbAcUIRnWRM/7pyn3JniURrZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyhtWy5h6HsKhwDasMaLql1i0L57KqCt3WIIJ1NcLfh6iz92C+Z
	9sIwHvpLtQRio7p/orWs2T9KOVcMyR8pSv7IQB51zRJ+SaR9dhYWoC4uev2xDLqcNfCOB/GMUU3
	R8p/QhiA6zz1+Z9RARU+DxAE1rWYJrIk=
X-Gm-Gg: AeBDies97fnS3oV90HuktdIJSCFw+DusC59tmsYDFADHaR1XI1vTKi6OV89agwEakhQ
	bQka7iMM5rt+ML7zwHs96mWYgsfUvx8QEbtuaqpGe7swoldv+PXLZnL7Yc4vVFShELnPRg+U2FJ
	BgYhPp9vIbr3gfxxWqV0UWgOw6XpNENEilLypmBFuxEHsUpIL4x4Q1ZeQwx9GJSdvRIkhwmNbh4
	ZU9/nXSXJustdBpKCbFZj2sSpR9GEWyQ055lfVsbNo2ycKDsutgNYAUDy3B0keuLB6lCBpaiRAu
	2lxX5/A1EV5hqafV7XS+ipM01hgCN9GKySg3fqPVXg+P/OJ9
X-Received: by 2002:a17:902:ffcf:b0:2ae:4d6b:b2c7 with SMTP id
 d9443c01a7336-2b2d5c7e6cbmr169035445ad.9.1776243783873; Wed, 15 Apr 2026
 02:03:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-3-phucduc.bui@gmail.com>
 <87tstepes7.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tstepes7.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 15 Apr 2026 16:02:52 +0700
X-Gm-Features: AQROBzApjElQGcdJZxtKJThRB3FUMvNfZsYqiHMqwpO1zQDkjasjpTPQUplvsIQ
Message-ID: <CAABR9nFN9C4CGsaZoWzrHEjibBLqQ1KmM8o5oG2-pSMcrgMsAw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] ASoC: renesas: fsi: Fix hang by enabling SPU clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

Thank you for your detailed review and feedback.

> 1st, please insert white line between "int ret =3D 0;" and "/* enable spu
> clock */".
>
> 2nd, besically, FSI already has "lock", and using it for several protecti=
ng.
> Please re-use it, and don't add random new-lock. It makes code confusable=
.
> Then, please use guard().

I will fix the coding style and use
guard(spinlock_irqsave)(&master->lock) in v3.
It=E2=80=99s much better than adding a new lock.

> 3rd, I don't like above count inc/dec, and mutex_unlock() style, because
> the code unnecessarily complicated. It can be...
>
>       int ret =3D 0;
>
>         if (master->clk_spu) {
>                 guard(spinlock_irqsave)(&master->lock);
>
>                 if (master->spu_count =3D=3D 0)
>                         ret =3D clk_prepare_enable(master->clk_spu);
>
>                 master->spu_count++;
>         }
>         if (ret < 0)
>                 return ret;
>
> I'm not 100% sure, but I guess you need to count up spu_count anyway
> regardless of clk_prepare_enable() result ?

Regarding spu_count, I=E2=80=99m not entirely sure, but if we increment it
even on failure,
the counter might become unbalanced and clk_prepare_enable() may not
be retried on the next call.
Would it be better to increment spu_count only on success to keep the
state consistent?

Also, I have a question about the context here.
Since fsi_hw_startup() and fsi_hw_shutdown() are called from fsi_dai_trigge=
r(),
I think this runs in an atomic context, but please correct me if I'm wrong.
If so, is it safe to call clk_prepare_enable() under guard(spinlock_irqsave=
)?
Since clk_prepare() can sleep, I=E2=80=99m wondering if this could potentia=
lly
cause a "scheduling while atomic" issue.
Would it make more sense to move clk_prepare() to init time (in new
fsi_clk_init() ),
and only use clk_enable() / clk_disable() in the trigger path?

Best regards,
Phuc

On Tue, Apr 14, 2026 at 7:27=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi
>
> Hi
>
> > Enable/disable the shared SPU clock in hw startup/shutdown. Without thi=
s,
> > accessing FSI registers may hang the system.
> >
> > Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> (snip)
> > @@ -1492,6 +1492,18 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
> >                         struct device *dev)
> >  {
> >       u32 data =3D 0;
> > +     int ret =3D 0;
> > +     /* enable spu clock */
> > +     mutex_lock(&fsi->master->clk_lock);
> > +     if (fsi->master->clk_spu && fsi->master->spu_count++ =3D=3D 0) {
> > +             ret =3D clk_prepare_enable(fsi->master->clk_spu);
> > +             if (ret < 0) {
> > +                     fsi->master->spu_count--;
> > +                     mutex_unlock(&fsi->master->clk_lock);
> > +                     return ret;
> > +             }
> > +     }
> > +     mutex_unlock(&fsi->master->clk_lock);
>
> 1st, please insert white line between "int ret =3D 0;" and "/* enable spu
> clock */".
>
> 2nd, besically, FSI already has "lock", and using it for several protecti=
ng.
> Please re-use it, and don't add random new-lock. It makes code confusable=
.
> Then, please use guard().
>
> 3rd, I don't like above count inc/dec, and mutex_unlock() style, because
> the code unnecessarily complicated. It can be...
>
>         int ret =3D 0;
>
>         if (master->clk_spu) {
>                 guard(spinlock_irqsave)(&master->lock);
>
>                 if (master->spu_count =3D=3D 0)
>                         ret =3D clk_prepare_enable(master->clk_spu);
>
>                 master->spu_count++;
>         }
>         if (ret < 0)
>                 return ret;
>
> I'm not 100% sure, but I guess you need to count up spu_count anyway
> regardless of clk_prepare_enable() result ?
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
