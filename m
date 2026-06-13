Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697FE319601
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781343191; cv=none; b=APMVWP9y0gpdKPNWBVcNvlNF0mVLzfwUcW0u6V2CTIbKTKe26aHIlNSEnk+rNkfAixXVpuaiqdShU9Fy3o+ytAx1h8f3Bs+bQRgZKQtCukXrjhMsdC91mMlcGy85lUnd1ug7uYaLikIex3kmfgIJgQhs2CUdWf2p4NBau/GO2ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781343191; c=relaxed/simple;
	bh=8T+pkFF+lS+JDBAjF8JI0LZg2b8EwfaONvyE7Gy7O/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NRsWZEezK/wkXUQcsFAqY4rQ90PCGhiXyIO8yHf2uH0vs3rlh4u7IkP+NWM1hKRQ0O2/Ij9aT7ebrB2oT24K2lR9a5iBj1OcTGw8yUKyIvygI6r3j7MUyCLWrgsRT0qW53Tg6t08NUXG64Eq/VKnP5bLfcWGseTHOLsn5zEj/lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nbo8lfKS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nbo8lfKS"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso21890235e9.2
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 02:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781343188; x=1781947988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8T+pkFF+lS+JDBAjF8JI0LZg2b8EwfaONvyE7Gy7O/8=;
        b=Nbo8lfKSMTAapEaDESqGhLkme6Ct30PWRFRXdESr9i4iE1XWSBA2ggMSseI1iFLRLz
         MKV2s3HSuvHWyLo0Gurc53imm3bFgs5f7inUajXQcdREjGZ4XDyDii7pVZLxGZ8FBuzu
         u3Hu/nNEDAv7RmGO5TdyzqzCp6wf59LHZHIY7308TWSLxKeCPGqn7F8bjQP9xHbOmLNf
         WJnBmxCRLypFbtsZkDbuWN8wth1WFctKWuWgJTwVRMUb26g5wTJ1ZI5hDJF/avi/t8gB
         aFFVIaKvkL9niZwEZ/YM8BPNTdjlBwQy06b02JjqN+0nwni95qRLPx85rVgT1d/vEHw2
         LPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781343188; x=1781947988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8T+pkFF+lS+JDBAjF8JI0LZg2b8EwfaONvyE7Gy7O/8=;
        b=mRn86EO6S9XUQs5yR8CLjW4aIAAjue0MQweAhGWdze//BZmd/CJNF0xVxjIPieSFyR
         Me5ynu6l37fcIf5AFQsETZ0muUXPrpIT4hYTGO6Avpc5pzlxsbTcUTFayTc9fqI7L+qk
         TsVx2VCZSwelUs7c/63xEdhBSIoYPIhklmEdo049vt4HmqFOPebnBEjiaeqPeK/b/5hQ
         HiYnLwpkKDbgPjTsjOrsHQApUmICCtAZH2JaCz22eFXNhlCHiic+tr+q3MxZrSt+3N4M
         RhgCBQi5czicA8T4rk1e4yEk5u9LW+C+3iQ4TC/OjyKholP3UfmebzFqv+QcujPy09fs
         4RjA==
X-Forwarded-Encrypted: i=1; AFNElJ95C4P9202GB5dmh1Z+qQcTWXVzUCI23bBxi5ESqMV85T1/61uJuEUiw3/+GPjfmwzB01qIPHyJIq47@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn0js3JUB03W30hllypYDbmMxaSD0AWLh3hpCjroiDS2d3jwkM
	MQpRoJFWhx2B6ySTlWny+rB/0QNHHS3FX3w7wSyEb1qSWXBvrYeI5lIm
X-Gm-Gg: Acq92OHCJsLtN4MTLWkfTCCLG9S2bl5GEGiM8pMfhw4mppFAfOKv5c2FsXwEXs5CvQo
	v/g6aiRNE4vuc6UOLzDZNqlZnnVv8wG1kSmMkpOo+aGOQADA46RwA+g5+wxZWnjgmq8LOu3IIzH
	r1dNisIgBu3gixEDz/qmFHJ+sOxoCCIBjF1KUg0r6lT/Rq0jWKttPRxiCwRGrbdMkJKJUCBMk+J
	6fL9b7GYDctCLzIYDGgnqfOZGbylJUFDGECvfNJZcczdnG/DczH4KewJXx2jTcifL9iVOCN4BSN
	P5ClmVMV5PQssWJJs1n+S1m+WS/5L3P+O1Wz91yD7dC/XzI+sM3kEqV1jjjexsav8gXdwclWjQt
	+z/qJobLml43gPGHRhDvtO3ceVKWVYb/iWHXUoZuAS4iZNwae73hdm57vygaSiCc6suRZ0WIMMp
	BY1s002yPLnkwr8EgCD63Pa0l+wQIcAGtQt2vPPBCbBMjGLZHct1sIT+k=
X-Received: by 2002:a05:600c:1f8c:b0:488:d6eb:e63c with SMTP id 5b1f17b1804b1-492200768abmr37382835e9.15.1781343187661;
        Sat, 13 Jun 2026 02:33:07 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26392esm13886883f8f.3.2026.06.13.02.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 02:33:07 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
Date: Sat, 13 Jun 2026 11:33:05 +0200
Message-ID: <L1ZJMTqKQbak6NcKbwFkDg@gmail.com>
In-Reply-To:
 <CAGb2v64wDvLMFn9DYs-kH1S2PpHJat-imxR5eJSQAUYjOp=Xdg@mail.gmail.com>
References:
 <20260505134812.408316-1-wens@kernel.org> <JyKk48uGRMGhs1Z-wzq5pA@gmail.com>
 <CAGb2v64wDvLMFn9DYs-kH1S2PpHJat-imxR5eJSQAUYjOp=Xdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 30. maj 2026 ob 18:43:05 Srednjeevropski poletni =C4=8Das je Ch=
en-Yu Tsai napisal(a):
> On Tue, May 5, 2026 at 7:18=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabe=
c@gmail.com> wrote:
> >
> > Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> > > The Allwinner H616 SoC has a video engine hardware block like the one
> > > found on previous generations such as the H6. In addition to the
> > > currently supported features of the H6, it is also supposed to include
> >
> > Remove "supposed".
>=20
> I can't actually verify that, so "supposed" is accurate from my point of
> view.

Isn't info from manual good enough?

In the interest of unblocking this, I would be fine with "supposed" too,
but manual and all my experiments show VP9 is supported.

Best regards,
Jernej

>=20
> ChenYu
>=20
> > > a VP9 decoder. However software support for this is currently missing
> > > and still needs to be reverse engineered from the vendor BSP.
> > >
> > > Add the compatible for the H616 variant, using the H6 variant data.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> >
> > With that:
> > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Best regards,
> > Jernej
> >
> >
>=20




