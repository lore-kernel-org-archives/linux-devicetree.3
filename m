Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC5335F170
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126817; cv=pass; b=H6vIAckZkt5zLGcwxsZTvNHV3h0oaCC1ebAuoxCLrsVYcHDGxalFnCkGmRhO2IGLxVTXtFwD0F324BR3QPf4fInlUMqF8vInWSW3t86qtMZbuPHlb+1lFiTFH39D7WN7ycT8pqVgczmFKwJwqCrLHBQngy/MA9cimq1oRK4Fb30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126817; c=relaxed/simple;
	bh=jXGJ1+Cv6nGnyJj2lXAv0ULWiPCyAn1DaGrDuuzFGiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srumg28TyOhA+TaOpNF2WReyu5V43//tQkeW/Ond2ETVyVg3f9FZrS1i2lYxorcU6eoiJAEk9KaOYZndm/BcGE9sOilhZHfCpJJ0r0x9UAcTjhcWlE6RP8iKq53nGeHHl7XWD3BUT2fzVHX90RsRO+7wsMvAQjfDmST5LHD5u+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZbMltyq; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZbMltyq"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso464625f8f.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:40:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789126814; cv=none;
        d=google.com; s=arc-20260327;
        b=dhMF9/x2BeY7jr31uRS6Vb1zi0IFGxyIH1XTYoiMp1lbK/BNUN/wAUdWvukA55mALa
         3x+vpwivbDZkWWoshYOvpVuJMBXDiTWgrTy3bp7Ewjzfd0eEmy08Jq5AM1G/zF5Q1ToT
         xgk/fgYrEQVlbrReCBQI4CTSsvvirP/NrHINMzWUvMYglpgLs9KVI6HrJ4SG3O/kUKHQ
         qVR+ISGAkYxGmZNHx9r/D+OeluzgIDpsMLI2a4FGUY8bro3UTL4m2WPHzlrSsVbbwB80
         LpaF57v9nV1REAuPREZSJU5VAlbonf1p4C8UpZhmUiXXaeiHXPD7eoUaHmKzXzaSgKx9
         3iMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VG+qeXnRBa8SMBywMNzx/mbp44ozs4FNe3yNR5x/cvA=;
        fh=KHPVqoRv3g/lB4MInHdU+8g0zUekgU2I1OvS0GWXu+Y=;
        b=CjOARN6m9aSjHXJHdwStar7pB2gX1N9ELs6x6yVrjTNXW+BAHpxQtNjn8xCnw8HPwD
         ADFZ+xJmnqv15A9y5ndjt1k8Kg0KOBbqr5RXHjwYcAp30fvDbmbT8mg5gmuGc1gJBNwr
         tu9N13IGKIK+al4wD9c81royECo97LhVcWHnAX/LPaIPTvwTgd/+J3rFgqp5QHp8Vrh6
         mai38lv/pcjz/jGRaIlDUwzqZsVwHwLlQAhKxase6/RPfne8dNYbvkorr59VRLlCBB30
         ywFZCY5+VaT+68npirZW3Bxwb5+ET5FGD3FVto2cKi3A934f4cVYMr8YpTmTBH45lEGH
         lDhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789126814; x=1789731614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VG+qeXnRBa8SMBywMNzx/mbp44ozs4FNe3yNR5x/cvA=;
        b=pZbMltyqOoDJE0Rt5RTvlbbNvoX037nNu3WO8yDdb846lmGTRnSwQ0V8J3C8NQgeme
         CB59e993VaDl6G8sxwbUc+3ZmR348edxcM9bQ5+KerdkQhdO7ui8iMbN/AYSSnYpyoJn
         l4Zzyr3IxKy/UHS/B9imMrITUD800I2bKLvnf6HWUFSUERiAeGkVjHY9x9KivebIM5EW
         fKTjGc8UA3GL3ILcQ0aQitEwbSVO4ZC11nn4mEUgIFt41iP7nwJxqkbwVC8KBX/1+NUW
         sMZzDO8jvstySDS4KWUSj0oO0gotgWvkAU6t2/HWYfk5t4QskZDR/KJxVE9azTvDJGUq
         dORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789126814; x=1789731614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VG+qeXnRBa8SMBywMNzx/mbp44ozs4FNe3yNR5x/cvA=;
        b=qHuGCOvMLW6zAIeODPxBKflYp896tdTrRDV2fE0k48NkyP2mI3SmkihygoS4ZtPSfM
         nREzDKrHlhkrfIysOPvbFSxbSsiple3Ll97KRTe4drtSCbr+JCGex4TKwnKMsWBUfavh
         RE6ZDU+rMFhIByl4MwpcXSzQHgKKcmDA8mdakM1msAjNTh3vOZzdBHGJRSSINyJ+9PQk
         7tdWvPc4/+J9kM3Q6vrZgssSgUR3xPCCpmzVHrlGXctKh2Ebi5Yy6b8c5TRLaKcXzsNq
         lmIkuTqhWWvbH8ynqAIngjx15l6F2/I9zG/1dMmZA16tXsSJYY3o+EMZoUMKTrEuTvml
         AALg==
X-Forwarded-Encrypted: i=1; AKwUvBy7R2vRmaVSqhKi2VFDpLcV71vzo9Fp5Rvb0D2iQhfQgoQ9K2QYZcwQn18jFMvcFN+lmZEx0cWYyQcn@vger.kernel.org
X-Gm-Message-State: AFuF++lvMkMe5mbMaS9Vkl2gIqqjrPIdGh3IvdwcKX6/QvEqH7bxKSK/
	znGoHWEIjYIwoaSK/IqVanJDzdeQ56S9zYw0DICeVYm4OyWxv5nWcbtx8xEJ1x3TPx9kkjjcBnb
	2kwx6HvWHByeF00tbeWYltL+Vs8VVZD9HB4krBZmLpA==
X-Gm-Gg: AYBFou381tUJDuWZKj/uw5zp9ILzpo85Dmkk5Y2cxhZxtS5j0KVk2v68fL3du7O6JyC
	dbte3Kq8pImCqvwkaOsqYqj2A5pLCfLnFjMJAKbXaZyW8xNOMwUfG/MgOlWYhKtKMXHfeFGTIWT
	osokZ05IHChrRL9H+vdg/tZEYsHPyvoEjyREAaMReIUEPjC6C+pnsGGWyQ6/9eJ+VW3fe9CkekP
	Fyn5cvpUOqdVgTBwZiSiY/bUbaEOp8LJWeI/fGd4sRfWx/S47/0x+j1pBwxTERZHXMtbEzQPAaV
	Etl95urusMzBQV5UiBKTuFnVdb4kL4Jd1pddz+BLCXbsU6TVJWxF4cao7fZzJK9DSmJwYaes4ct
	4+RwvZsTxvw5lkTev0taufKYAyJf0h10oRyNiYCJyviK2P4WARmoqwAnnc8CthxsR6mncnEYkBA
	==
X-Received: by 2002:a5d:630b:0:b0:484:3604:c7bd with SMTP id
 ffacd0b85a97d-486eb31c4d4mr6627074f8f.17.1789126813565; Fri, 11 Sep 2026
 04:40:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260911111731.3404308-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260911112804.39EA91F000FF@smtp.kernel.org>
In-Reply-To: <20260911112804.39EA91F000FF@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 11 Sep 2026 12:39:47 +0100
X-Gm-Features: AcwNN1WJ8okh1HOUuJE3ueC1NR-zA8LxQ9g_9pvoKKyvz8W9CWr4L1YVLC5FhrQ
Message-ID: <CA+V-a8sQZv-NbarMqTHiH4C3TaanEJF-pAb56tpZpN9M-xWBzg@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
To: sashiko-reviews@lists.linux.dev, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, linux-watchdog@vger.kernel.org, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi sashiko,

On Fri, Sep 11, 2026 at 12:28=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Watchdog restart handler may deadlock during system panic becaus=
e it executes a locked regmap operation on a syscon regmap.
> --
>
> commit a3a7e98fdd4da0cb2994accaf697498b31aba4d4
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> watchdog: rzv2h: Add syscon support for WDTDCR
>
> This commit introduces syscon regmap support for the WDTDCR (WDT Debug Co=
ntrol
> Register) on RZ/T2H and RZ/N2H SoCs. It retrieves the SYSC regmap using t=
he
> "renesas,sysc" property and derives the WDTDCR offset from the watchdog
> instance index, while preserving MMIO compatibility when the property is =
absent.
>
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index 550112446db49..9dee410ab7f31 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
>
> [ ... ]
>
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
> Does this introduce a deadlock risk during a system panic?
>
> The watchdog restart handler, rzv2h_wdt_restart(), expects an unlocked
> execution path to avoid deadlocks and specifically calls this nolock vari=
ant:
>
>         if (priv->of_data->wdtdcr) {
>                 /*
>                  * Best effort, ignore return value and use the unlocked
>                  * variant of the function to avoid potential deadlocks.
>                  */
>                 rzt2h_wdt_wdtdcr_count_start_nolock(priv);
>         }
>
> Previously, the driver used a dedicated MMIO regmap with
> .disable_locking =3D true. Now that sysc->regmap can be a syscon regmap,
> which is shared and uses internal spinlocks, regmap_clear_bits() will att=
empt
> to acquire the syscon lock.
>
Agreed, I will update the syscon regmap in the CPG to drop the locking
and let consumers handle locking.

@Geert, would this approach of consumers handling the locking be OK?

Cheers,
Prabhakar

> If the system panics while another CPU holds this shared syscon spinlock,
> will attempting to acquire it here cause the panic handler to hang instea=
d of
> resetting the system?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911111731.34=
04308-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D6
