Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F55047F2D9
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 14:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076241; cv=pass; b=Jg2GOc+r3Itd1fHfLVFXilaaP46dw0lN1ZRKUNTwATJ0mjWezbpPYKrtWlWYg3zHrXKMN08ZlqsMfX4nSvYaJ21psSYvSBxFrCM3cJnVC+l9N8sMvm6+hm5nxWniyfnAp4MiHiYfmFO7M2KuG/kK1nde8gY7MHGX/4/R1n4lm1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076241; c=relaxed/simple;
	bh=+RS49Kd2DbvtubK5kt5W1aYVEDo05KG7Xep0OnmpGgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGoLEUm0ZDSSRnPV47jsqnqIAUev0fJdNBSOZl/wt0shWKRDCadzpA/IyT+/ngTml9qqvwhzmo62FMTR1Wu1fNZg1ZAL9cnD1kO0DWOBwI7XDZjFeSVodJK5li8dawI80CQgbDCC8HPms0YZ/Z6c8PmUi/PdCT74k19dtd3ksiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PULCZyqm; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PULCZyqm"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-95cc8ac98bfso1232388241.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778076239; cv=none;
        d=google.com; s=arc-20240605;
        b=XoXtq5pWmONDQO+MFFTePHwVXANko/8+fRO6qKkiPpSwyzEDB7EVRbJwZ17VAwqxYX
         +kuY9lg5G9f3uSjIZiIK35p1ld8Xm3sXAleP4IkndE8pAF9WrOLtqvw+KxUuBeTuCbWX
         gQebyTgXQSieTgNvEbGgO5tUAK5L2Do1X7uhs67lLHcJUQQ7QVGv+Nhjv7+iPfYBLCAb
         XY9161ac4ojJQSwWOFpgiML/hmiy0zYIyb87KasPP4UDmHsJGfNBox43r4abgYOULexZ
         4Wr4WyhISDXOfT5f3n2sGCmNQf/q1vjMvudsheyDbAVCOiXEHmBG0Emg7aHEWXYfCPU5
         qU/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jsD9mMCCpukEdwiIZPox/sOpEjhE31kEGDjuvOB20/g=;
        fh=dV9Z4nGn2MRX5pudezPnb76Rp/ppehUNMchpP8hwt+A=;
        b=CYxR585EpCdP9GIqBHL6u3b1Fm31ZznZtSRhJQJiRUrsGJY0S/LTSUJmBFvKPD0W5w
         /oohWCO81UwjWDN4eY+xiwHpz0r0u9tNhuDVlEjIOhKsdrhBc0BuHngN8E3T8rpjMwr6
         WMCZsQK/nbf5cjNBoMM4kkpPuyzBg5Wh29JknqSSYgK//vEzBDEqrsexFMXd0xa0dNK3
         Xhpkk3b3P8boNOJjXZugKVF0NQP3Y5c+8NPwW17mKPXB+fsiXLvA+rnnvlB1HEon2B43
         Dk9IDNwgxn4AZJoheO2W5y2oqcnEL6kciAaXKLrYHl9P6k1OHoBfgO91PaIwTGdOlGXO
         r/bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778076239; x=1778681039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsD9mMCCpukEdwiIZPox/sOpEjhE31kEGDjuvOB20/g=;
        b=PULCZyqmUCNjLBfLOu5f7dfJkEQ6msYeV+fw5aWICfkcD0ZmkqfGBU2C0Qg1+JMkDR
         w7aOzJd2QmvEYej6f78uHwDEAT1DJPTIfU4sLPvy4m7Ef4yPQUhjec0fwgpxGNdIQ5v/
         fLkLqqLtjfZsw64TQSrGjOkUb/4FgdNmRGH51yRH0akneC3BQFFJsLMu/xGwo9a+WhsL
         DCcm1BFRqPHUY4CZnZ6JtXK63Smj8+fBdwUmwzOcanaZFwrM+DQ3VEw2rKja3DZX+dHz
         kqdKH9RojKQ3ILEtPPk91qt4c8Za8AXKObaMmnhESUM2ayhOkMdhA4ssfuSc4iE0mCMq
         Xvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778076239; x=1778681039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jsD9mMCCpukEdwiIZPox/sOpEjhE31kEGDjuvOB20/g=;
        b=sGRTFwq2oAeTsyHGQ1eB/h/Oycl7H5avr36ukSm0FgJ1WzJLatH5LntxkaylhMNgij
         z0emzYzBZyl02Cxe6XswiX//mUe6zKgxJxPKwmhchQamnSVFfGm/MRuvN85FB8+eIMb2
         EE3cBYeV7N5lUynxoFt90e4G7/HB7wficZAZmrBxfGgQPAMWYmxvLllk6YUjXJMXtZJx
         0mACC1g9TSbcu4zTe7dviv6sL8nzya1Oebci9xADiOKkRwv6ZVl8EUeGZ03+PV2Yd2S8
         bky2t35Yf/VUWXyU+85ClGTy2lQwmmqy5w6zWjcfL2m1pO6vpQXTp+JoPKPOXOI9SXYE
         xsZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KTMOmZFeNvhQ7mNS6GmWc97PDBjh51sDUa4IcGv7SvaeuBEa6VV79t4FBuH/GnB5HIZJiFMERkWvm@vger.kernel.org
X-Gm-Message-State: AOJu0YwIbSloasxrETnL+zVqi+34EGuU+8lNtUrY8YBAekkrrnWg/pLK
	qIRoLb8faQsMsrP91i4q2iqTxbmzRbx3xsCjY6cHmG1ECkiS3ep5A0nJKrr39lSF0kU4oS1Mqt+
	xXOSQdk0MheFIu4wAegUttfS41iLwULw=
X-Gm-Gg: AeBDiev1gJHpsDjPt85QI2jvSQc57ZXYx8vMaoHu+I/LRuTdbPZqDG3qKDllXJlMijj
	l04yaPtk5F6rbYuNtf0gWQdHBlighdEmeApepBmomTc/l3xrTN1dpMeODISNmiNPAeRGfXA5KE+
	KyDJbaX1ISVKMnanYueK7HtJliX6TiurNGgqG90tXZrmVi0d/xpOkHUyBGups4CZj+BiNx3FozI
	yRYY7ldeO0jYvpRWqKjzvn5op2bfxLxJpsu+X5R/Ld+/vKxEGZ9+YkmjJSLwqTwTKXWAaFZYY8X
	+S2irdWpveH2KA894QaDO4EUE6hmyF+aoIlLUz5TeJzibgjvSQ==
X-Received: by 2002:a05:6102:4a8c:b0:605:889a:89a1 with SMTP id
 ada2fe7eead31-630f9041b24mr1272953137.23.1778076137325; Wed, 06 May 2026
 07:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501095433.1609309-1-mitltlatltl@gmail.com>
 <20260501095433.1609309-4-mitltlatltl@gmail.com> <OmTXoHZJTSGePymL9I-1Cw@puri.sm>
In-Reply-To: <OmTXoHZJTSGePymL9I-1Cw@puri.sm>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Wed, 6 May 2026 22:01:22 +0800
X-Gm-Features: AVHnY4Jp93agdi_Y8mXGWuXYD7rYu7UJTV_Ohq4VXA590K98lCrI7__F8JibURM
Message-ID: <CAH2e8h6YM1D6K-SKg8UUL_-jJ0uuEvU1iK-xZtguNTurfO-U4Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] media: hi846: Add 6MP and 8MP modes support
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Martin Kepplinger-Novakovic <martink@posteo.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 8:51=E2=80=AFPM Sebastian Krzyszkowiak
<sebastian.krzyszkowiak@puri.sm> wrote:
>
> On pi=C4=85tek, 1 maja 2026 11:54:32 czas =C5=9Brodkowoeuropejski letni P=
engyu Luo
> wrote:
> > Hi846 is an 8MP sensor, but the upstream driver has only supported 2MP
> > mode for years. This patch adds 6MP and 8MP modes to maximize sensor
> > utilization.
> >
> > Note that these modes require 4-lane MIPI CSI-2, as the downstream
> > driver only exposes 2MP, 6MP, and 8MP configurations in 4-lane
> > operation on the target device. The register sequences are extracted
> > from the downstream Windows driver.
>
> Has this been tested in this form at all? I tried, failed and looking at =
the
> driver I don't see how could it ever end up using these modes in its curr=
ent
> state. It can only cause troubles when used with 2 lanes, while 4 lanes a=
re
> completely broken.
>

I may have messed up. I tested it with two more patches. The first
patch removes 480P and 720P, the second uses a new 4-lane init list.(I
just sincerely followed the downstream) Since I didn't think much, I
thought removing modes would not break things, I just tested without
the second patch, so it works for me.

> The driver defaults to its first supported mode, which happens to be a 64=
0x480
> mode that only defines its register list for 2 lanes. hi846_set_format wa=
s
> supposedly meant to check whether the mode returned by v4l2_find_nearest_=
size
> is compatible with the used lane count, but it does so too early - it act=
ually
> checks it against the already set mode rather than the one it's about to =
set.
> This means that you're never going to be able to set any valid mode when =
using
> 4 lanes without fixing this first.
>
> And even if this was fixed, with 2 lanes this makes some calls from users=
pace
> that previously succeeded now fail when v4l2_find_nearest_size happens to=
 match
> a mode that's only supported with 4 lanes. v4l2_find_nearest_size would h=
ave to
> be fed with already filtered list of modes to fix that (which would actua=
lly
> make the check mentioned above unnecessary).
>
> Of course these are preexisting issues in the driver, but they make it
> impossible to actually use what's being added in this patch and to add th=
ese
> modes without causing regressions. So far these didn't matter as this dri=
ver
> was only ever used with 2 lanes, but they have to be fixed first before a=
dding
> any actual 4 lane usage or modes that require 4 lanes.
>

Thanks for your feedback. I think we can use specific modes for
different lane modes. The snippet like

    hi846->supported_modes =3D supported_modes;
    hi846->num_modes =3D ARRAY_SIZE(supported_modes) - 2;
    if (hi846->nr_lanes =3D=3D 4) {
        hi846->supported_modes =3D supported_modes + 1;
        hi846->num_modes =3D ARRAY_SIZE(supported_modes) - 1;
    }

Best wishes,
Pengyu

> S.
>
>
