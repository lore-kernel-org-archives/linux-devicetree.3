Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795241025;
	b=3r0urumNy11vtI6QChuNshl642l/yR2gKGn/nKtVEUFc4MRp4MXLxpGoNGJm9sKBe028
	 gq21gUmVvDmTa7Ra2x1grEoo9FBH/DjvfVQkCpYvY4fGcJg0dndUzEyCnwkHG1GaDYUFw
	 4+4zNYykn8QDRY0Ys4Xi2fewCBDLm62aZb/3i6/S9KR56yLSB1wJkoDj0FXgqmrfuw7ho
	 dUeILo+wcst583Q+0UARqZp1aSWOUmmgjs8dR1AiORLeJrW33aYSrWSxDzhllpWM4sfnf
	 eoVj4aQr5PKs1FWYezrMIPeu463qKx8p+Y3FLjKdJuGcJ+FUbWzpbZWG3FARYjFZbtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795241025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
	b=3GnMbBa5GHTHJlvQs0bPSgaR3UZMByZryHA7UQ6rS5IQm4hMWemmJbBD5kB+26xcghn8
	 y1vXGtPx61N8vVyiCuM+/kSRHNRN0tVGETjrN/V61Kw5xFZqxN/ANqF6lKGEokf9yz/Y0
	 qnx7x9yXYzvM89eDl11XEJAx69dFX9p3u19rFaW0NNENGDvp5/28Vu3f9neN2QZjzMOls
	 txpXeEZNYgwqByinUmcvzM108TTnslcT4+8wO8/Ej69yQzk58fQGpp7bGx/xr3JPNnBbj
	 pQKXzzGK5cvkuVJon6A8MUjKH/M/glQWBLsHJnkCIBswhvUGGCTsfjbsT9JYteqR3ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkncotie;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DA0606A680
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 06:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86DA0606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkncotie
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380c28f9e35so2529869eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 22:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795241024; cv=none;
        d=google.com; s=arc-20260327;
        b=rfFPQ83y0l23ifZcDbw+r36sxrOJ+sosLosL9z6Jbp9UaJQkxXkqNL5Yu21s09IpIn
         g/0Lf0o/GjOCCRgfsBJEsh4AhcSQOICkASlpiAo4d6pEbq1ZX6X0KW/pUJX9BIDgMg0/
         7q3StIUBzRPdn413xignGTpA+vrV4CdASIaI5WW7qV8Mf25yvVkMoObVufbrUNHeQpc+
         Key80KN0/7n9bRuA+3MEpbtyWAHu8nO07M6GHeW9Zo2wfU1nBSZgXLbVFDkp+F9vlzNH
         wkkDN9tNKEuZ956zJI0wSSX14Mya3+AHy00uR24/ltFeDg14SFARzxsQJfmzLLncQtnT
         hyeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
        fh=y7qv3XLev3SM85QOGqhLMo3iIjAGZijENm3ocxppJ2o=;
        b=Zmw62XtqJDpvSR/6jFFmCaW/aHQYvIQCm6jK5cm4bYtHQgf8N5I8mXkJXFo1Ax2Sus
         YD231dbunZtRxo3Gs3oOejh4sfRmKo1XTw9egXTcBB6IuMQrxLGrKk9yt5RuQgw6izq8
         WC0ZJDcXxGtXjfhNC3XMMuXtjZbKAbVuuHVo7Tcm0di03GCDl4GdE34mhU5d5yKbVoMo
         GU6cPmyS4QWxsfke8ppoEFfofewToqhPa5zOgnA58kOYcPXtiHg1cE/ow4QXU4h46fpz
         3x7YZxtd4BlnZla5ysS7oc2VZTgHaPOKjd2it95mTrHF8eh91UlsAKLGhVxhSTH7COYW
         28Ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795241024; x=1795845824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
        b=fkncotieei3fyS8dWHzQm7M/AiGBj/CRGEBjdC2UYG1K6VO5O9PEVGFKKay9ckmx2z
         zS1y7h/y5IxeZ3c8VwbcVrRA3fVJQZM0IhChkXi1Jcf6wHM4gdrHWTdnteCJFFq8zo0w
         n8BTRduL63yAAFof8sanDkZWtT5UVPZsL9GrIebedHVQ7AXGV9w6BEEZqgblcJKX5xjJ
         jJZqdlB2de/PLQzCNejdlU18JJJVQQ0yNkz49Ypy9sabDWehPHpH2m2620BjUoL8UfGg
         5xugqW/nCm6pmHsgiOEnVtzjfSpmhpGmvx1U/cQXyj+xMuG0VuxXmQFXV2b7dI17fZZU
         ZCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795241024; x=1795845824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
        b=iTHiuayjBG44Tjw6azNAzTK1Sv1eCXxNfN9Z07IO7YhHD8C1rtfQEIQJXC91iMFcu2
         e29rP3latNstp42hXQ5S4da2teAunjabnJQRHH+P7z5PlmJv6UWPqvQjFLVdpctA2un5
         H+Nm4UkIi8v5Wlh8eWjHcGi9Jkb8ru7OitZ4VUqM66sVubfr2NJQhuuwJ25HJRnsGKx6
         C48631f3KgVhb8t8TzYhMkkJdDGmt64nLjA3mkIT1DfCgeqielt7azzkCwwdJH+WTFOX
         Kc8ik9pHkQ6qHMcxpVnJV3UDyW1yHCKMpgceV3GMQPQHdUjKuoTwTWQZfO+Iqw5+p/1S
         xUPw==
X-Forwarded-Encrypted: i=1; AL+hErE8Fyoww3/S3EDPZnxSX/k7D+keOmD68AnThTi3DMekN9RMVdFa/pWSrAkHYNAZ9wVxsfxMZCNQbbyV@vger.kernel.org
X-Gm-Message-State: APuU4Z+46dqWsK/y9NInQTdoWBkslgmxXRIuhNtIK9LEqWD5QfRe/2qc
	hmKehZ/nQSiSbk5iZg1AZMdASQ3jDTPQk2RtcycjxniLvtwioNK5mx2qy/+0nX2Jh41MY88rZR9
	ZYxtJ9oI33Gyu5rqFMnVUwBtr/FRVaQ51RA==
X-Gm-Gg: AZFdTZd2z/Lgcrmf5O6CleaCJKg/WmRcvfBQhdlNjrIb7gYcyzCZ+poxOhH5Wu9Yl/9
	+qcA1Rqe8f+dQqm5hO6pRfE70lXr2+glo9OWNt88jmlOrpkVibWvHA6SW8EwlATWHrozcFQieRL
	RA1liVcx7fQEK0XDt0G8Z7pEFx74+x6XlRv57e61Fug/N9UdQfIMQUK45SDcTWeuIepMJb1XQhV
	rHRrqHzJR8P1o362K0Aubzek6jZt6PlGS0KcBZ7yMXG3wWkEIrjWyqo7cXg0Y2sJPI7Gpwizpuj
	jc6VaciwpHn+BYi9KQTokOD1t6UWQHV9/4mQr7zV9Ts4xm1/+XAQLQkP0wYzJFpTP2QuyQ7JlnC
	tTcUjGQjL0Xx5D4mrDpKoaM5OK7+Rdw84nPpPeR8bnDKiYVu1Nhosfkcd65Q2pz2SOasTixJVhT
	aT0tAlV1t4KK8xCLUiF3/MWCPxnNhD/g==
X-Received: by 2002:a05:7300:e9c4:20b0:383:6f73:eb34 with SMTP id
 5a478bee46e88-3856c6b00fdmr6323139eec.2.1795241023623; Fri, 20 Nov 2026
 22:03:43 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113161819.36847-1-clamor95@gmail.com> <20261113161819.36847-2-clamor95@gmail.com>
 <20261120143147.GA2466366@killaraus.ideasonboard.com> <CAPVz0n3u3oe1+H_w9jE2afb9PQT0VLtYVqfHeVNc3D+tLN6NDQ@mail.gmail.com>
 <20261120213116.GB2472094@killaraus.ideasonboard.com>
In-Reply-To: <20261120213116.GB2472094@killaraus.ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 21 Nov 2026 08:03:31 +0200
X-Gm-Features: Aa3M54qOnB5G9GXqLIL-lPBYx8eezPpq659tGJ_BSKM-GqCEY4niHx2BKUlkMTw
Message-ID: <CAPVz0n0h6xd4DbnpNTW63agospeJFqoV8vnkPYdzB3NmgVRM5Q@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] staging: media: tegra-video: Move driver to media/platform/nvidia
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Cong Nguyen <congnt264@gmail.com>, 
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>, Dan Carpenter <error27@gmail.com>, 
	Hungyu Lin <dennylin0707@gmail.com>, Hao-Qun Huang <alvinhuang0603@gmail.com>, 
	Yury Norov <ynorov@nvidia.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 23:3=
1 Laurent Pinchart
<laurent.pinchart@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 20, 2026 at 05:31:17PM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
16:31 Laurent Pinchart =D0=BF=D0=B8=D1=88=D0=B5:
> > > On Fri, Nov 13, 2026 at 06:18:10PM +0200, Svyatoslav Ryhel wrote:
> > > > The Tegra Video Input drivers are mature and developed enough to be=
 moved
> > > > from staging into the media subsystem. No other changes are introdu=
ced.
> > >
> > > The driver should at least be converted to be MC-centric before being
> > > moved out of staging. I haven't checked if other changes would also b=
e
> > > needed.
> >
> > Does the media subsystem deny video-centric devices from even being
> > moved into it? I have not seen this restriction imposed; could you
> > please point me to where this is stated in the media subsystem
> > documentation?
>
> There's a consensus that devices that require control of camera sensors
> (i.e. "MIPI" cameras) must be MC-centric. That's not documented, we
> should probably fix that.
>

Yeah, stating this in documentation would simplify things.

> > I would like to convert this device, but that may take quite some time
> > and may case regressions if not done carefully. This patchset apart
> > from moving to media is mostly fixes to work correctly with mt9m114
> > and tegra114 bring-up which is quite simple and straight forward
> > change.
>
> Converting to the MC API will require some changes in userspace. That's
> why it's important to make this change before destaging the driver.
>

Noted, I will most likely drop destaging for now then.

> > BTW, may you ack mt9m114 get_fwnode_pad change[1]. I have updated it
> > to your liking, Sakari seems to ignore it.
> >
> > [1] - https://lore.kernel.org/lkml/20261006153619.304520-1-clamor95@gma=
il.com/
>
> In the review of v1, I wrote in my last message
> (https://lore.kernel.org/linux-media/20260721103845.GJ50424@killaraus.ide=
asonboard.com/)
> that the issue seems to come from a bug in the VI driver. Let's continue
> the discussion there.
>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/media/platform/nvidia/Kconfig                           | =
2 ++
> > > >  drivers/media/platform/nvidia/Makefile                          | =
1 +
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/Kconfig         =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/Makefile        =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/TODO   =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.c  =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.h  =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/tegra20.c       =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/tegra210.c      =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.c   =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.h   =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/video.c         =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/video.h         =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.c  =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.h  =
| 0
> > > >  drivers/staging/media/Kconfig                                   | =
2 --
> > > >  drivers/staging/media/Makefile                                  | =
1 -
> > > >  17 files changed, 3 insertions(+), 3 deletions(-)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/Kconfig (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/Makefile (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/TODO (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/csi.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/csi.h (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/tegra20.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/tegra210.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vi.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vi.h (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/video.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/video.h (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vip.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vip.h (100%)
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
>
> --
> Regards,
>
> Laurent Pinchart
