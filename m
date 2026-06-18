Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75B43B27C1
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789197; cv=pass; b=murNip3xJLNBwELauxpcGVRlDQFlDc0OEv0+yIy4k6U5wotd7LjzKs2FZwv0+LmBOgyDtW8i146B96VOEJsufBEQ6Ng6tczIglrza28cAUja4HqUqHGYr8xoEj6AHpIqEBDwyMbqurkd4G3nIVA/dZw46dqhUFc1Ov8GUw6vpaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789197; c=relaxed/simple;
	bh=rwavQHNR5vCqgAC2vGU4xALCWjqvGo2uf7/b/yg58XQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZkFmSQmaZ56v7nqtYkcS1ak4Gny3/OWbjDUzjs9Fdj/vCGS0CrR01rLC92sGSYeQBJgWrV1cqpwCvTe8bWNtAf4vBNtywaFomKQD5x/5CuPunXMat1G2XqL0kI8FDZDj5CcLheFVBcxx4TzCPDi935i6wZnFOPhCo/NPRn+xGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCE9Ut8n; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCE9Ut8n"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-46255b269c2so680445f8f.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 06:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781789194; cv=none;
        d=google.com; s=arc-20240605;
        b=SQNASoIgKMTXbf5lF7WZapgCgEngzth7j0gxm0y+WtR2hJXhNvLT3y88biJukrzoXr
         EjDOMRKvDNG1De3AAgtV3YYGsnuRMxwaFA8ZhJG6GEe1U7fNf3E6sBlhf+cEIwhryM0m
         PzeuZHf4O4OmwP9SEAzILiUtRSluZmU+OWVIst30fpdJNCroDMSDdi4+H0aSGqGOzYHq
         aW+kNCOHbgNM99SPBau4m5rD4cC+sJSk4sS7HgI9DW7xvQl6c4fAJ39AKRyI6Uc3GDm8
         a8oRE47DmEY3uJxUTAbP0vzkQmW/AkhHlQ2B67xwvR8s0LmWSwMfg4gejiwJigBKTIBY
         yrMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zPwka4rh++Oi4jW6U/0Wwv1+lcJvYpPIzYXrVw3cc/g=;
        fh=9+0fhW5H7Xu8VoxzoPC/bZE47dCwF+nCDrXzO4ZP8RA=;
        b=PpBNBBHsr/IFiKQyg3Wi2Zj4Wn8j4dPXRSF1F0+74bjogoSMV+4IEUFGfE0I80HN+5
         ZppOW1x48TXX1An3lUKWpfRVQA8tEHiN5Ff8tVSQ3Aw+aLsiZwpuuFpbH+O2qlpTayFK
         hDVxvkTjj/H+Rgki0cr9OBkObY2eNnUyr7Qc47fBZ2aK5VkaDcImUIFxbNazJWqOZ6z7
         E/gIv4vFc/5fs/xB9q4wfnjkP1e9GanFc46w59ZTMX3EyddIZBXFpWG9MC77rzmKPnIp
         sMPzmQvOB6KtkYoNpz7ZsXluXyLCM5vsfVNJv0frBnykwyqQEQvgR+ZcRaqb74RHN5SB
         o3+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781789194; x=1782393994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPwka4rh++Oi4jW6U/0Wwv1+lcJvYpPIzYXrVw3cc/g=;
        b=LCE9Ut8nr5XQKA9mqz0RAx1uXSQ6iSs9JYchrR0t2lU6Rm25vLWFv743kzSDdlsSx4
         szJSCkKdQvMlx2xZccpyTWCEUTbQ/sliF1So2SegEOMtECdlypU7Yv/OEGJqgaCSmOJW
         5qq6tE3AZN0HeJYE3WSysGISHE5/BCV4pBOIDO04l0Fem6Ovqoc3QFMW3zKAFCvNEsqA
         25DEgTgSFD3Mxi2VYHvSBzaXH3eRGjFRsgBamwWjL8ASGJSfi0x2o+CI1z4TeBRwWBCx
         bBgWyeoXgf8+Sr4MXqU7H0A/ZXhR5Nbt24dUhrjaZFHuMUUEDPy/wlkiWVB5/dYsCaaB
         xmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781789194; x=1782393994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zPwka4rh++Oi4jW6U/0Wwv1+lcJvYpPIzYXrVw3cc/g=;
        b=qyL+E9Jkon9bUEO1b7XHqHxhCe8R8h6ZaCwaGTtQQlk45FXvmv99msDFCNDyntBaQf
         VANP+PxmSzlgLQ2Pq8buwE4ZeGVVt0kyYZnDbQfj42K8SqApCf+ImVLxqAIPdorq83+E
         EF0u4NwxKz5VEwcswgEIdMmisZxQsHDikN49OE9ZVGGYTss40iMvHHC3L3pCgp5xVtmk
         YHKB+eJqMojjdnUt40hqdxct48VuCP7+JK+VelCq67DdMf7XYKaZ7pTfVRTC+bbeMgig
         JMH9P9L0GlMMc/atNdabM5QZVD1h8siR7Rp30NyuIWREzzGHHs98itRjY6rr6q5br8go
         QJvA==
X-Forwarded-Encrypted: i=1; AFNElJ/ZKmyOA2MtCitX8zGzfp/bzw6G1Hdq1Z9MO0ctKWA+P4msg8LxT3rAYOFVF5k+nw4RD3s4mMAuOGs0@vger.kernel.org
X-Gm-Message-State: AOJu0YyoRqptI0s+118f3/ZpZFNayRkR7jTk/bluYEDNT7eN0a4KruIO
	M/ZJ1uJSQeRt/lViHRpGaIZNh0fIMiXQngAPyJBYUU+AFFEAtAuZsalhfcUqaaFdScIHkevY3lb
	8f/X2oTxpCET2tazWj0P8Gb1nE1mowXk=
X-Gm-Gg: AfdE7cnw3jly1Q5sUlPFnV7XcvA3HCDrt3uFfxkPi8ijSEn739bg7fRUHhznGJNt72v
	KINmlPo4p5hA2DGJ8eUXcjb7dDl4ypibsA1Q3MKkjCgcEU4eavCKlmX3jNNO53O2UVI3H7Bgb5n
	LsikNXUooLIiFABYUZIO+eZ08lu629TI09UR57r5QKY/4Ko2AlnNQJ2uSQSpcnxaeX9kH3tAO8G
	DuUK/1OuiyMwDn4ZmZ4r+qGi7X5Z+l3NpRtN/hFXuYxdG0Ij8/Ne02kfS1EMK504TiNqX5qgMbV
	qolQNFHkhQeCtJ9NRIvgLwU93EkHn0I1YhOu9N7DZ2/UzzdojxBkYq/y3Tqx5QdLycAU8L3zAed
	oxZSf8dJoPqw/05s=
X-Received: by 2002:a5d:5091:0:b0:45e:eec6:500c with SMTP id
 ffacd0b85a97d-463ad9aeb84mr4495060f8f.39.1781789194279; Thu, 18 Jun 2026
 06:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-12-prabhakar.mahadev-lad.rj@bp.renesas.com> <ajJ_qwXhJbKB3Xli@shikoro>
In-Reply-To: <ajJ_qwXhJbKB3Xli@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 14:26:08 +0100
X-Gm-Features: AVVi8CdXToo6cMOBg12R_0ExFj-dio5Daw5TR9InAuTm1Ov-5-tnr0T-5nBIcxA
Message-ID: <CA+V-a8uhjm2Pmgb0VNinHJXKhxfbXJvqFMxG0rWeaBdWnSTWrQ@mail.gmail.com>
Subject: Re: [PATCH 11/12] rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK for
 register access
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

On Wed, Jun 17, 2026 at 12:06=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi,
>
> Sashiko found issues with your patch. I curated the list and left only th=
ose
> which I see as valid. Please have a look at these issues.
>
Agreed, I will replace the 0x3f with RZN1_RTC_SUBU_RTCA0FX macro in
the next version.

Cheers,
Prabhakar

> Thank you and happy hacking,
>
>    Wolfram
>
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Low] Incomplete refactoring: open-coded logic remains for RZN1_RTC_S=
UBU_RTCA0FX
> > --
> >
> > commit 2e16f66c80c483d619655d20fbb859a42e9d1b6d
> > Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK for register access
> >
> > This commit replaces open-coded shift and mask operations with the bitf=
ield
> > API in the rzn1 RTC driver to improve readability and match the hardwar=
e
> > manual.
> >
> > > diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> > > index c7ef3c81180f4..9f9cf9882fc49 100644
> > > --- a/drivers/rtc/rtc-rzn1.c
> > > +++ b/drivers/rtc/rtc-rzn1.c
> > [ ... ]
> > > @@ -306,7 +312,7 @@ static int rzn1_rtc_read_offset(struct device *de=
v, long *offset)
> > >     val =3D readl(rtc->base + RZN1_RTC_SUBU);
> > >     ppb_per_step =3D val & RZN1_RTC_SUBU_DEV ? 1017 : 3051;
> > >     subtract =3D val & RZN1_RTC_SUBU_DECR;
> > > -   val &=3D 0x3F;
> > > +   val =3D FIELD_GET(RZN1_RTC_SUBU_RTCA0FX, val);
> > >
> > >     if (!val)
> > >             *offset =3D 0;
> >
> > [Severity: Low]
> > Since the stated goal of this patch is to replace open-coded masks with=
 the
> > bitfield API, should the remaining 0x3F masks for this register be upda=
ted as
> > well?
> >
> > In rzn1_rtc_read_offset() just below this change, there is still an exp=
licit
> > mask used when calculating the offset:
> >
> >       *offset =3D -(((~val) & 0x3F) + 1) * ppb_per_step;
> >
> > Additionally, it looks like the write path in rzn1_rtc_set_offset() was=
 missed
> > entirely during the refactoring. It continues to use open-coded logic r=
ather
> > than FIELD_PREP when constructing the RZN1_RTC_SUBU register:
> >
> >       subu |=3D RZN1_RTC_SUBU_DECR;
> >       subu |=3D (~(-steps - 1)) & 0x3F;
> >
> > Would it make sense to update these locations so the bitfield access is
> > consistent across the driver?
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615154805.=
1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D11
