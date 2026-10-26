Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793014102;
	b=2ziftFrqe32oNRWYJIKcVAmBX01SXOeH1b01QuiUbnt0BeBaJCWhXhB7SNqhGUbnIw+q
	 LEurfqHQbfKEsFdZF3Bs1jRFemDEHovlkCngj3Hoyd+dBWm/E+8rU8nCmn2STjY6MEmIh
	 H/NE4EL2E6MzWe/axU9GSZfbVi48Zc2lvmh86op2H8tkB6ESYyDJv16xRGDiyKJ0w4G/l
	 C1J49kFxvlZGfk3ctgQSFpqPuKxdB9AF2qLA3+AMtvqXB2Ltzz2L9upTDoJ8NkGWIT5nW
	 MGW9+jZxAtMBhM94Ndem59tHJnldbp6Sj5Fk9mZx7upNaXlr3Rdb3KnChpb9aaguoXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
	b=f8lQyiM1kOrMMA9vJvhmSv98mtdtho2dzddr+z7PGVbakRGIxxjiCItVHORo82NpzRji
	 z5cYHqA8m4IywaXn6rX9rrliuL49Y5j3WO/xZN8aKodxnDutcQ4+X4P/Vih9MzUQ4W186
	 O0bXoXtCacI20CTg6QbZsqqxUNAhpgSETmKJsa4ieTjpTkNgJOtZNWxpcQbWUwcnqnQGX
	 mCyRgaE3kxNlbpM8X2zfl7zAu17VtHtAOQXyT4w/Z71BAI8PVnxnFMNHyT2Dj4Dl33eYP
	 ae8TQZI68U+jl60+sGrQH5Tsd7hbxLSU9UKpBq6c2qnnCu/N92EQYknhLxgke+16p0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mOTUJ3xu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD5D606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CD5D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mOTUJ3xu
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a064dcfcfdso858255b3a.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 04:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793014101; cv=none;
        d=google.com; s=arc-20260327;
        b=fwooGLwqDJEy1ulNk6Vlk6QDBWW3obJq+eDwKAMda0O2qF6R//DeYnNdVJwLHCNju4
         6C2WMkP/wwaq1VgZ/kqMqhJF9Qm0NVRvNpcDIoUx6NiidncKQuyu435cm04XTsWqfGUN
         HpUyPcNGan0c0QQJt20omoXay/AWXw/M6trh+pOr410gk+bn8K/Ha9PYRYCosyH/++nB
         CnIcgh3TvlCs+CRjnpXgbNmMIxNDC/UOcax9W4c6T5GIaHCdv5Iq7qZ/0622Dzd5+/2e
         Ty4utAx6QaulAGv+Kn8qOhcU+WWm+SpLf+eU5Qo0w2o/d0br7YU2OsJF9COoKhwsOt0f
         UpaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
        fh=GEVef3ALIriW1BCO3sHWNQwSKpzd931to0x39Xn4Ynk=;
        b=BxLlCQt3tZf4A5eDwr5jKDmzpbQohCzt8rSwRTeEO4MNf+9IiMYV7RDsF17GfYmzLX
         ybF+9UXQPBl5kw6SSm7/fhEvHjK/eDJyG78xUuy2qVNgyZiMoOig4rFvjad198aVM7AW
         vshs/j/L4i3J9bQSoKsjYLkU8frKZhLpaBDps7nM5dLdgM/pVfGgBomtKNh0U9uFyxoN
         /aA4I2QdulsBHrDDRezzRXGUKstWm+im7YlYimDsa89+Wyl3tU/UFhGmyV8Y8jeHE4Dw
         9gI7JjGl5LQ7T3YxK/mCWJ6bcS64257u0D9LgdBAQ9QbSaGJFx6J67mwhdxqjtnkZaom
         Dlvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793014101; x=1793618901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
        b=mOTUJ3xu703cPmtcG3UrlXZWO65PcRz+Ljj4tHK+BkhN+Fuviyrzhsg03ja8kNLaOl
         +GkqBnRH33Xer93HUnKA2yFN3HNX/BNub3O7CG/xn47P/q5BqGu+igHhWNR68Jc5EH62
         i0oELWv55SBX8nbMFgxerKr7Pp4Sms8e3QKZrrzZRXHa1dep5xm8nLwGWML4jjio+ahd
         fkrT588vKdYvqrysAp74/NXD9ErP16ae6AjkdvdqIaxfiqJvW71ZDMhy5QcipvAD0aba
         k+gzAH/m06k0vq6eTOB+4poUEV3LEIUGYze7g3RquAhJE5tAH7HmehJbaNnnH3327v9y
         mUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014101; x=1793618901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
        b=mty0ZDlMQFbUww3r/dd2HbONlWvg0OlnbUq/SMWjLjHRSCmiQVMwbaFqjqNBb9Ovq7
         RExNHxr1HI53flYzbjuibWDPjY8Fe19vhT7mfF4q8aXeHDp3Jv67H9iYaEOBUXDE6efZ
         c3ha7pBJ6jtvhmW1o760rxnXu6BRwppRuqmnc5h1CJIfLcT15D9gBPMpordbWi6erw8z
         H7zMpdsIqg/H7166ipm/s3ku9UAmQDKzVqpR7JMAOTggUIAnfbgoT/cob7PNRcbxoBWp
         FH7TwdvvW8FhCff/NNFNbWwxobhFAjkiAFrOhE8AZ9KiIRxlxHOOOSMiIN9YIvT8LPFb
         FOsw==
X-Forwarded-Encrypted: i=1; AKwUvBywS9YCIf58mWdV6BePD6Zej1iiaCIa0p6fPeTpdwvxM14k6ZX0W8FiJMXfo6xxL+HcGTPMhJdS9MLy@vger.kernel.org
X-Gm-Message-State: AFq9FYKilO+WL4AGXzKmuaXOCWNHSX59T1x0X+qIQJKcPYypzIW/1+Dl
	Wcjvfs6HrJoND6ddv4NTDm0f9ziSGM3Za+qegujslwNJ/ixzgycIqP/hD2RCU4iGnee6lfy68m/
	zYSFb2TrVyBkBLG48QSoyRLwkhgw47qw=
X-Gm-Gg: AYBFou1VYzD/fywe7eVisHHnguZ7lv9NOSkqbhuHWLENUniQ9grWKt4hqxTnAzZNRmi
	7X2KMdkAIvu+Ght96hcXlVyIlotYMSFGyjJD/5JTHuD52bQ4jQ081A3g1BZ2Q7vjCBRkA70hKbn
	ctUWvJXbU935t4uEEwDGODv2S5R6BzEeddb8EM/2puen5d9cvrLyY5HZkd4o06NJR7Ra0fGwa/W
	G3w/PYYdUEdSvSjx+Nzzksl9LDSVrIVosFdHSP29nodHhzzuUsXRJWYNM4uBeprf1IuDuvs9E+y
	9Bwi59gh6gg1JGzoo9eIdszl7dv5gAeYiruCEfLHFwVb88vol5usc9S0s0lxlnLy8SWJ/QZ0xKx
	HgA2InEPKiqYtioifPu7K98hs16pKyZqgJO0RtdEzsVpFC+IVIMGQ
X-Received: by 2002:a05:6a00:bd81:b0:89e:8915:24aa with SMTP id
 d2e1a72fcca58-8a367a36becmr5121820b3a.18.1793014101519; Mon, 26 Oct 2026
 04:28:21 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026003918.155321-1-pmazzini@gmail.com> <20261026103730.3a79c2e6@kemnade.info>
In-Reply-To: <20261026103730.3a79c2e6@kemnade.info>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 11:28:11 +0000
X-Gm-Features: AclHuK_DqqwJbE8Mxuk5nig_6kiigbCl4FyLzQRmggV5Ihs0oknU8AOuwlyhfVM
Message-ID: <CAAxh=jtYnDNQTUOf-cBN=w1Km+cBFOgrW8moNbHfqcApwxXbgg@mail.gmail.com>
Subject: Re: [PATCH 0/7] sy7636a: power the panel only during updates
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Alistair Francis <alistair@alistair23.me>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mainline, on top of linux-next. I started looking at the hwmon IIO
bridge. Coordinating and cross-reviewing further work sounds good.

On Mon, Oct 26, 2026 at 9:37=E2=80=AFAM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> On Mon, 26 Oct 2026 00:39:11 +0000
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> > The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
> > can not power the panel only during updates.
> >
> Yes, that is the common use case, power things on, tune update process
> to the temperature, update, power off. So it makes completely sense.
>
> > Read the temperature in the regulator driver instead, as the TPS65185
> > and FP9931 drivers do, and remove the hwmon driver. Boards that relied
> > on VCOM staying on mark it always-on. The regulator also switches VCOM
> > with VCOM_EN, gains VCOM voltage control and binds to the I2C device
> > directly.
> >
> > Tested on a PocketBook Verse (B288).
> >
> Which kernel do you use? Just curious, maybe some further upstreaming
> actions might be coordinated or cross-reviewed.
> There was discussion about in-kernel hwmon readout interface like it
> exists for iio.
>
> Regards,
> Andreas
