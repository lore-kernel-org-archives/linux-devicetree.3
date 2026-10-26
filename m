Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793048604;
	b=o/tJlNQY0JKfcJJ/Q3rChDAOl+B0K5mWX805r9tvv5RB9wXSWeoAvlvIS+4XM9cx2SOe
	 fa0vGZunKsr7kL+5mlZR91YYfEAedarVeoEovgeijSflVoIC7HRh78MalLLVkH3d7FSk0
	 jK1mq3zwfjOi9llq1q5WdoiLIK5FeZSpB1+7mtDHGRSuQJoM0jU9kT7qKrwqZ+CT7acpm
	 VvtNIPIceDglAjCw75dPohBwBWqSH5LU+7aP1vxQ8wmqiXEvLPj8QiqLbYpBu28kfKMV4
	 1g1LqWA0z24OX+t+7bUHc3nFHTd1CBLZqynRE5vJ+mPGM/w2h6uDbCgNhLjFDi/lowQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dymsYL1VvcFeY1Miiq7ZnoIAQ+NOEvB3M/n82aiIv+A=;
	b=FdJ9fq1kDzYcbk8zHV79kJbkyvBvpF2Av4f5LH3vFWsTBdkQC9tVjGxyZqcwHl7VLqLa
	 Z5DdC/togsL4DsE/8wnjV6JoN47WnWPOZP+jKMysQQuCBJFJjitF9dSPUn2Ic0qdorn+M
	 0WA1FLxJBVJI57ZZ83ubgs4tYOom5bIxrZ63kG489gFMDHL9qwABZCxWJEqndMvKTi/Rh
	 YAUGjA/wfzApEd4KoQ3dPWE4tm7NQTfavUlPOAPn9POuEwck0LDTpYuUwhO2VeANgVetZ
	 J7AuBmvLwq0YIDyKpQI0NjMmvuiT8UTC1DlULD77jXxLusSVMdbnnYsNtXDzFOHI4Zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J4mmIZEw;
	arc=fail smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF053606A320
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 21:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF053606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J4mmIZEw
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so2373945e9.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793048602; cv=none;
        d=google.com; s=arc-20260327;
        b=SEQL7SG/3tPi8Gl0h6fD1waxfHY2+f7aR3dwJzofRj+eyVY3FBbiNcx+51IXuoJjj+
         lmnKbOXDwOWFiYirvL3yp2/LiW6Ss0zK+IXQMDluTLSNjYu9tjV4Q5b1ZcZ3ZM58GtPR
         43Ofsc+/V0ubzCo/05FQbHJIOCl+HDVIaF7/qdGZv/iwijiFlh7IsL2Vt/TKvoSb5fuL
         4D96Ykkt7LRsXGAwf1KBK1K6PFKEm/22nDhdFlX23MKd4BKuIlkQ0RALzvYK7i4gEiNE
         tuGgSB73QwS4IC5WkmZDortT26yGKLK+ubdwrFIktMj+Z61Dm7zpBCvFQQYh+TbtZ91s
         F40w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dymsYL1VvcFeY1Miiq7ZnoIAQ+NOEvB3M/n82aiIv+A=;
        fh=J+JOI4Ig79KLTJC2pT4sjvk7Xu4ZdAiGaPD/xpFWrIY=;
        b=ZLNM3EY9hTaHuj0bbr0HTK6AESpl/1BAcQDmYqdiHCUlWantK36/F9/b3FkZlvdWYJ
         IQzh/mR+1fnptoLyhoJlrBZz19Uetoacfrl9UtN8MZ/PNlrDg0xHjLbDkz71TPFtNKQc
         oFZrdcxCXQFGpmvnIeGVTT2WP3AdjSumkWWCZVJirPXRPoXnkzL6MFgSUc4pjtWfYbgN
         bKJpHL/IZPbt6uJ3VEYa131EOls9IMFkCELEpFzHDTHfFc80RT3kuI3cKEdy2gwlCEv1
         6RxYR8YU1z6XX4H2Q5EvGf7ClxkOJb8DLEEO8ZZVexY1LZThQed04eTvtXyoYT4nkQVO
         gUOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048602; x=1793653402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dymsYL1VvcFeY1Miiq7ZnoIAQ+NOEvB3M/n82aiIv+A=;
        b=J4mmIZEwt4xAZc/sYfig3dP2HTPTMXUowFakzLhqmRtHDYzfy4fKcc/jKzgkWKUl4y
         kfxevcilcAXNLhls9B9ffl7fT5Bx6N+k+sMMLl0VJ/ERgGsWBR20PdjLpa95tLS7KHLY
         fKXBJVAne81Te2GZhpX722UgI2K7eI9ZkmTOXBE15v1e+T8ofbrEQoawaxeNwl86QhS2
         oyEf9TmoDNZmG/YJyOj6DjPD8zpNkbCicaUAxYDPB0gVWeryXW+t8ABqf4+6P/OyDMpt
         WnaF34wsz1SWka93dSpQAUhgd8pU4kECfewoMLk/3alh2NeAdwtZvSJJ75fTUIXnpZTC
         uqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048602; x=1793653402;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dymsYL1VvcFeY1Miiq7ZnoIAQ+NOEvB3M/n82aiIv+A=;
        b=sijxj2U0kwcPMIAL5gvwH+uaub6X/OzOToE26uMUw9yvSm1dCaCXB/OgqR7NVrUBtI
         Viu/1xKR8dlN8Tu2Vskhc/hpCID14Thh0GGzdYpuvAa7hqs92JdPKEgq4IyltANtA7Vx
         w2eto5HZaXJOnk8LvavupBfaCUKmq7q+bVVTAG0WubQHvDKSC0KHIBxZPm/1z7l8g7i7
         7wM/yQHgW5QD8T9/ht6C1xxAVPZpfED3wswsXfevMouBtm6f+goBa5vGFho8GJUEtbGd
         Ezl+V3ISjMYxRHiyBPEuV4xRnYMJKOlxt41I0cF6IUddl7f/Sgvar3gq2dDKO64+VN/2
         nptA==
X-Forwarded-Encrypted: i=1; AKwUvBzDoGIHAFN6JqWk9SKylJ3c3ZSe8becCXEGAM2SHKLFJNnDkY8SE18j7RdHMIIA8D1LpMIZOwvCC7H7@vger.kernel.org
X-Gm-Message-State: AFq9FYKzLefWc8myb+qSjujX3TLXEP0EJqYHNaiofq8lOgKlnyiRS7sT
	6axdzIIGq7Rv3bpBMpGmcbgsB+7xqS5qk7gzJ7NzpOqGgkae3rYoLjJVcW6HNFQq5CuhPY5/3e1
	xB/9njyBIf9t40kH2JWX4MkGbfqqeQdQ=
X-Gm-Gg: AYBFou2BH0RYRTWfZDx2hLP9n3mg5xp/tMQu13vL6FweeK5A4NX2MDEOD3W7MRUowml
	mIVVTY/PdyvYkC794t6dBoRB01brS4M2wX+N/gggd7J8tl393+gICwxWLOFgaEShtVhJflr1CP7
	tA4wc/CvzLNhJggBVo30Q4lFfNOsavl/zIwODCR60F6kFOjKOEAwW5DQRbB0o4Oq0mzJ3HDfRp2
	BCvajVsZiFwgQDlZn6f5FP7NnNRmFzE//56qoSyvAP2vYUufG71BS+jLQ6Dk4qVdhz2FCIAohpP
	yUcw48pc+b97giXDzPACZ41ZrvmVeQn1S7dvWDGzCeeN2Ee/XgRNYgjn7vnHML9s5NDIkyF76Mb
	qd+wU6SvPs1zQ1Q8XeCFn8CobboiGzDV3IHGPLbPaCXVpBiDyKXkdTO3BTgxQ0PtLwwFCGMovg7
	MWvxKpsQKufrAHuGiFt394qpE/Uqb24TeVhri3E0OzSyxjDkzu1u1GGLwxbrCAEcl8oS9yQkOy4
	rzlDw==
X-Received: by 2002:a05:600c:3d08:b0:4a2:1960:6fa with SMTP id
 5b1f17b1804b1-4a7bfec49damr17336865e9.4.1793048601950; Mon, 26 Oct 2026
 14:03:21 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261023175919.160103-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <atyKo0pTYZyt5XJc@ashevche-desk.local> <CAMuHMdV8Q9UKrpoZuZfDUutrG=bOwcNWLnht1bufv0YVXJPNDw@mail.gmail.com>
 <at8uFFHk7DHH9e1l@ashevche-desk.local>
In-Reply-To: <at8uFFHk7DHH9e1l@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 26 Oct 2026 21:02:55 +0000
X-Gm-Features: AclHuK-DOQOqCxrYWenC1byTCwdE5LPCv_pLXEQMP8Kff__QGFt5Si6oKbFTyn0
Message-ID: <CA+V-a8tL+bqTtub1=nL51CJ-b6RGkRMYNttcvqGbXLRchPk6Mg@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] iio: adc: rzt2h: Add support for RZ/V2H(P) SoC
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy and Geert,

On Mon, Oct 26, 2026 at 10:40=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Oct 26, 2026 at 11:14:53AM +0100, Geert Uytterhoeven wrote:
> > On Sat, 24 Oct 2026 at 12:38, Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Fri, Oct 23, 2026 at 06:59:19PM +0100, Prabhakar wrote:
>
> ...
>
> > > > +static int rzt2h_adc_write_scale(struct iio_dev *indio_dev,
> > > > +                              struct iio_chan_spec const *chan,
> > > > +                              int val, int val2)
> > > > +{
> > > > +     struct rzt2h_adc *adc =3D iio_priv(indio_dev);
> > > > +     u64 req_scale, scale;
> > > > +     unsigned int i;
> > > > +
> > > > +     if (!(adc->chip_info->features & RZT2H_ADC_FEATURE_RES_SELECT=
))
> > > > +             return -EINVAL;
> > > > +
> > > > +     req_scale =3D mul_u32_u32(val, NANO) + val2;
> > >
> > > But what's wrong with the simple 1ULL * val * NANO?
> >
> > IMO that looks like a useless multiplication, which will be removed
> > again in some future "cleanup"...
> >
> > There is a reason the mul_u32_u32() helper exists...
>
> I don't see that. The 9e3d6223d209 ("math64, timers: Fix 32bit
> mul_u64_u32_shr() and friends") tells a different story.
>
I'll drop use of mul_u32_u32.

Cheers,
Prabhakar

> > > > +     for (i =3D 0; i < chan->num_ext_scan_type; i++) {
> > > > +             scale =3D mul_u32_u32(RZT2H_ADC_VREF_mV, NANO) >>
> > >
> > > Similar Q.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
