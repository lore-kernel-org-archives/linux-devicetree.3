Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795188690;
	b=MowvONTUnhTjtMMQxRcTORowOgF0Mqo4YMjd+96p1vzcfxWEPo3mHl7vD4IwPMOZF6m1
	 KUxeI2uB0EtwNNv93ZUePrQZ41i8LStJJln3v+dhwOHMmXNkf9tyHHYAPCD376kcdLhna
	 /eCN+VMSqgh8Hg5fRaTUHk12i9L+odgBUvYnF5OtyUbAjP4ciqkERxfJ6SBsXKq1uyk/k
	 l+by7sLJhjK7pIz/MNwmxvKlcMA29DZxuAUI3AwtnxpTtXVdu7GZRkbz1G7lcza0RBSLR
	 P06l7hInDHK3R/r3jzfhGnSo2SZVjayxi9AHycL9cKuu4jTiDUJe+alaVq08Mj9gLlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
	b=XJtvzCP4rG98A3plJC3auEDEMzYWstMYQqmyQk/xfuF7PysOuQFFzHRTabpXZkT2vZLF
	 CfqCwJHpj3I73qUsTn6CsT4schUIW52yA5yQz9RGQfJ1bLOZ0hIv0ZzAz3tixRfDIkiNa
	 MaqoBlWW8EqRs55n5kQZlKgyPkpQadpEixvGKKZtDej1/iy3AR99mO58sGc5G/xrQ0UfK
	 bEyAFR+os2S6BHIzRmR7VUAV4DFKaZPcEFvieZpJwauNSqnUNIInO8fqVyMmlpk5qA9V+
	 sti6muvYYU4jlhqxooQ2u1mKHr4ff6jeM0STdJlx6yAlVghZv3gu7iV3+NheYdnSo2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rYiUfnZS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB7F606A32C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CB7F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rYiUfnZS
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3863db981d4so727796eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:31:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795188689; cv=none;
        d=google.com; s=arc-20260327;
        b=EClsyRB/JjR13yHYap+xLEjS2QuosVJb90reSBOtaEH/qTZp+6xhEwxZJRJ1HZmOzK
         IhoCGrjkmzStwrycW5icy+nGCR8dqngxjxYQ5gtZGpyqXhGAKEA8ilIesNohPPBxGMdz
         dnc2Lq7iTAfP2wOqhnbSYFOn5Azwk4IXYyB+RF2+M0Hzz8857l4INaADYvnSXiZc+X51
         IsZ0lcSf161Tfon4sMuMykMKdrTXhqwK+XfbBfsUdamLXxNfJJqQZC1vmWBo5vGAg1GA
         8w+wcQHXqLvNX9gSH8qQoXzlST8KnoCNNOr6HFPLHx7fbmIm367USFFZRRz+F7Ts3G1t
         SAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
        fh=BP6iMaVLaie2SBsndj/Su8kyK11d7vsquTZzHFlJP7c=;
        b=EXLqz1It05zk3eFI6er0WJDgKCkf1lXKEc0LbTBksAHEFjvhNceWoS75jAK/UuBW6c
         zqqyvLXSEXf3TlMUTVQ7xNT8Kk4qeVESucJRum95//18IzDcuKgwX6BYPL7AdqJJ5HRd
         fUHL+Wr0vUtMPxPA9h17XIZ2z4mYux962sHrWC3xfatyD256uxCxoyppsfhl1QxtrXBV
         nV+PsSI6TqTlfcMNNFPe1OyAoMTHaBoYFq9u/2hegxyYE5rcONHING9F7GH2oH1JxJXE
         W2SUGnccBOd2/VGk4CqZ8zrSOGftpXPo+3c3totXOcrbjGUNKtKKOdh+cqUNZFz4zCiX
         mVew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795188689; x=1795793489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
        b=rYiUfnZSuaoielxLAtDf6tRtT09b3z0BbTf3Snshk09+yIK85WTu2JSCR8wJWNFFyE
         BONIXUlNMREfqT8nZtaskrOX9zSYxi5AXvSf30rqFA66oJ3LYHi7J3Mvj5THz6yVbEDE
         iK5wnp8bWy13CPECQBGqxn+SElETm1hRIy5Qam6OqXUD78v+dd6R5PcUnhTiC4ynJ+6T
         ZwdF3ery1c9v5wDocw5m2zc0VAUoNmiEaKySbXM1G28Z5oMGiNN++MUS0Fq9qykbeQuj
         AIBkQy/5BAYptgfXI0Au85iL2L2BqDxHptajlHv8Jnbkj6e3aibZBPHiotbwD8DmFSVd
         qCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188689; x=1795793489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
        b=h/3Lxm4sLz0DME4HF9SODp8AGkWVqMHPHd3yVk9IevuVYAA5SUsMcXfV51kKrqyrCQ
         m5IQ4Es6IIoItbwzq4zTuv2yhW7g0t2Cj4OLDwNnPtYdLWqN2c1I83uoupOhqb35zU5L
         DSNblUEhGfWoOZqj1e0I4lCEoO0ZssVEWQP7CGpNx4gYMvSRdW0B4z4xnWH6DfB22zxt
         iwU9YlQmVKZrqCbihGJYt8VMlTKQCTIUeE4wyT9N/GhuUChYRDs1fbPEgQXjTFXXtcTW
         yAclEECJDBP9lA4cGCfLqOWP8+DAwZ91S9mVveAjAU7pKTJvA2Gxw3A9qgwF+ETE1Iqt
         ViJg==
X-Forwarded-Encrypted: i=1; AL+hErE2y8mjFSFUvDy+4BSV87UtyhlU5uPdCWggLKxFieUGr9zyGidHDluJA/J1HKyLkgtilUIGfVU9j8XT@vger.kernel.org
X-Gm-Message-State: APuU4Z/IccYCk1w47hvOUO0WhYUfPpcnWo+6OVKccWJXWbbQkzjWUP8m
	5vszSH9MRV0/iAMRnyDKsJRiN8hzMDWWcok/w+igGyM/Bi4GQbuzEkt4q1MLu+Y6NMHKzWWSG/V
	Y/fb94GwHwKCPHGlc6VD50obzHo4syy4=
X-Gm-Gg: AZFdTZcvyGKR505XkrbzNDtIkw2lfl9PdoTgn4Po8C/jX1QlkzWBNTonE5B62XVhGRa
	0KW/oisUEWtNzTFyxfrPgJwB+Lh1yk0MfDjDBJsA4wKB5AHxCMWrReBZjfVHfj27de9ujYvEcUX
	ogLCmm/0Bfgg8Py6XzNxDIHJK5Notj+CpVKz0BbLzeQ9oZWQvhZfSqMX/ZyS7Js2E0VR7nn6I80
	wJL4XlZpr44PZQfWy229KlOlXVkkMWvqMWftZGrW2Sl9vdmJQdENnIDJOs/D6NWINJLO1IcvO6c
	Pg5lSvQ38Ys46IN09nRYwiG605ASUnq9WjjA9YqZqiIfMFPhKmGfJfnUzWBMcTfUBpDSDxQ5/bM
	u6fNFh11LmXsV7/i95DIoD7Cp3y8EMzBqlkZyZXEDSa6gYMbdTWuvbZDjSyRbbs7c1q3ZUcpbXn
	Rs6PBgWqRVibLf0LulPj031YACwqAGGBHKr30825w47AR2JoY0Qaw=
X-Received: by 2002:a05:7301:6408:b0:383:1bfc:f1c0 with SMTP id
 5a478bee46e88-38570f27a56mr3129077eec.32.1795188688670; Fri, 20 Nov 2026
 07:31:28 -0800 (PST)
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
 <20261120143147.GA2466366@killaraus.ideasonboard.com>
In-Reply-To: <20261120143147.GA2466366@killaraus.ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 20 Nov 2026 17:31:17 +0200
X-Gm-Features: Aa3M54rmNUuNZyda5qhpJslp9i1jTMK9Hg275DVhPVt4wZMMMc9yhIUe9r0PTkY
Message-ID: <CAPVz0n3u3oe1+H_w9jE2afb9PQT0VLtYVqfHeVNc3D+tLN6NDQ@mail.gmail.com>
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

=D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:3=
1 Laurent Pinchart
<laurent.pinchart@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 13, 2026 at 06:18:10PM +0200, Svyatoslav Ryhel wrote:
> > The Tegra Video Input drivers are mature and developed enough to be mov=
ed
> > from staging into the media subsystem. No other changes are introduced.
>
> The driver should at least be converted to be MC-centric before being
> moved out of staging. I haven't checked if other changes would also be
> needed.
>

Does the media subsystem deny video-centric devices from even being
moved into it? I have not seen this restriction imposed; could you
please point me to where this is stated in the media subsystem
documentation?

I would like to convert this device, but that may take quite some time
and may case regressions if not done carefully. This patchset apart
from moving to media is mostly fixes to work correctly with mt9m114
and tegra114 bring-up which is quite simple and straight forward
change.

BTW, may you ack mt9m114 get_fwnode_pad change[1]. I have updated it
to your liking, Sakari seems to ignore it.

[1] - https://lore.kernel.org/lkml/20261006153619.304520-1-clamor95@gmail.c=
om/

> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/media/platform/nvidia/Kconfig                           | 2 ++
> >  drivers/media/platform/nvidia/Makefile                          | 1 +
> >  .../media =3D> media/platform/nvidia}/tegra-video/Kconfig         | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/Makefile        | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/TODO   | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.c  | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.h  | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/tegra20.c       | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/tegra210.c      | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.c   | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.h   | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/video.c         | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/video.h         | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.c  | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.h  | 0
> >  drivers/staging/media/Kconfig                                   | 2 --
> >  drivers/staging/media/Makefile                                  | 1 -
> >  17 files changed, 3 insertions(+), 3 deletions(-)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
Kconfig (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
Makefile (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
TODO (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
csi.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
csi.h (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
tegra20.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
tegra210.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vi.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vi.h (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
video.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
video.h (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vip.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vip.h (100%)
>
> --
> Regards,
>
> Laurent Pinchart
