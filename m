Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D483B311583
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 17:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777137975; cv=pass; b=bkimQ4WO0svC96isbSQnuKrXASameCisJ8Ma4e/gD4kVtuXkpcntJz7Z11JZJA5r5ve3WRhKIzNDCGdKfVRQhEpmza43NdOWzkeXwR4A3BvQAIkl0mQhlLoVtXWLSRDNx8aHIn/3JJGgTxZAxJt6uZjEN7+Mu1SRZRAuE7d3XXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777137975; c=relaxed/simple;
	bh=RwedOSekIaf4d+x8Nq76gSwma6obCc5mF7uMaa+hf80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aypZ33RHUguAEFBn7H+zsIoanWgmH82AfrOnK5JpZbrSnCHV/TGlpDpKz4cMKfILRFOo2oLcEryN6HRYFlq84ggD+4fi2UBOdVkNgD6f/eeu209s4w8EWYXyyUaAMHdtGUk6+hqCJlMPoy80r8cA8/oJe19gFNA6DHuTMHiIn4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srLGDB8y; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srLGDB8y"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d77f6092eso6132455f8f.2
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 10:26:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777137972; cv=none;
        d=google.com; s=arc-20240605;
        b=QL6hQ9lLYIfk781uFymMSdwEAwxP/uyRyqowKDVBSrZ3yoDXV4fN5B71/RbjOcCiyI
         CWSA/Zv4BZ6VDZq2FIFWad69oGa2Yb5SaAHpG2oIV3jlsz8U0nEWLi5eYVKmAyIIXigr
         l50fxsOSnOsYlZ2DleYDwaQKSgrlQSDO2BB7GcZq5tQOE+sKw+2EOt+zAoRiaZwZaIgg
         X6nB1aQGUdqA+RHP3CjyBQfAEqR3MNMv59o9p6hdaMP6X46HZr31E1oa0NupRp3Sq3ei
         D3ZFn/wQCSwfFbGuyl6DKQ1nNMBVs+TnNZaGPg5sILTGbWUU3BF1RIIGIbJ/ZkzQIddq
         8PFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RwedOSekIaf4d+x8Nq76gSwma6obCc5mF7uMaa+hf80=;
        fh=p8LptOqxy3Lb4UFH2/VfC1SO/haw4pKV44GkuyGMftI=;
        b=S0AZd5Hhr73DDP0OhJI3O8DjODRQX0HW3pwvoVMg1DjiXDy0f2FdxfsjabumglCggX
         8SeZt+hvcBdG3dX88nEEIudmNLE7axc7BGRgYhjjId9QRAdQsUxUGbM726EszEPqzkdv
         ghHGgZiWJGMGj7A5WziN+Q+bZnebGbRFaxY1fK4bQfI4qW2ltsIZGwr2w8dTzvqYSWe2
         bM2Rc/Ow4/cY5IcUnK4hZsDsy8+M2pPY7JXTrGYLxzMrqmzO95M1SarGtsq685MlY/Uz
         pzhBwnoVd5lUYyIBYPt2ankUFV5Hgm0c0LFqZ6g2mrt26fK7WTw+3Od5G6EtdS60khf3
         sIRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777137972; x=1777742772; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwedOSekIaf4d+x8Nq76gSwma6obCc5mF7uMaa+hf80=;
        b=srLGDB8yCfgPpTyYiFJZJTTiDGgmDraFPEF57hHY3tfCFMbNMJotLSpMaxAPV9oykE
         u0nq3I8J7vcQ4Ahkr4GvnuQa6wJSwQsMY6jFcLBG1zwiCgnLtr6DnkHJVbYG7JVCG4GS
         B8BzJ73sRAEEHdQMhJEP4S25cbk45hOcNMRXKAZwJr0C3oSs+bo4qDUJjJ0+VaqX2/Qy
         Vfq34E0qFlJEDcoSWky3Iv6vrz8T7sItcgKgdxKciMj43quWyurrN3xAUsvKfUme9XzU
         nVZQAACl0zxJiaoVXJMRJPtdajsqDkAiI1s/QGg4eiEHzKj9cBdDQ2z0VFw6PsQrI7H3
         gRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777137972; x=1777742772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RwedOSekIaf4d+x8Nq76gSwma6obCc5mF7uMaa+hf80=;
        b=LX3ZiZu8bj7cwSw5DnkUq8cuT8EyRVBYHhV8KGuoWtUPZV5aw+Uh+uwcThWdtICV/o
         inH1vLfbod3WWWXqxLhptFSf5HS32JanPtCTQoUMIVLy2d2VBgYS8461mJNbs+SDW8Be
         A+nXL7OS506E0GWH+gAgrMt4KWMT/dwBy/lAYngzryw6PKRimIHKRktguGaJlZbgYVWY
         zW2mAcXNLrt7gF+QAE7wS34FIvSoVt4ugdCbcRKb/COT+9zOMCz91RoBgzCsJ4kcmrv0
         HhOpjz13LWhbvbvGxpAYzcu7vZhUanrILm5RrVSpEiTWY1Hsl4WSOdTqaCHMaumikK7Q
         99Yw==
X-Forwarded-Encrypted: i=1; AFNElJ/T3OP8h06GR/xzc7vcdLhmGemKHeF9B2p07DpGuBHa46HTpHLxSNJ7pXNiA3HsDKlIbje+2RQrlNz6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4MiuKWntnpmTY1PLvgB9jNYP2oMOwznHYW9204ciaqXrMcDlt
	PtT5OyxBJOj6/bkrq7tKzsTRntDQo9J8M5NDlSbhazcXfXaC6vx25oP0v3Jl2C+TkS/ULU0hH4h
	uejFgSls5yUHpYaWLIInEkb6nfOenZwK9LnYUpyA=
X-Gm-Gg: AeBDietflrZnCVXKdsnkGxp3u+SlKMLbs7hoOO1VlxVNYu9Bp2s4H6VEz4qqHYaJH7r
	3D0Vc08M7GhHNMDQZ/5XzYMEXUwltXy0N9h8g2Km9GkcVFiJXRlmtu3wOIVur28kpYmG2U81wkn
	PJfGd/l5PqAWVPY0Zb92l1PRh1QleVV8NrRaUp4XsAiPKskzHBMSIMdP3cVbqccTBVckVtdBHyi
	D+kggOTTRH9VSsv7WXOmGod8ZvKvbwEvEeloBFQeyBkO4dhktWZegH75LVD/6dF1BrJBqD1VtEB
	egjhoBqa9u3d1MPcKqxTPsXsLdmG1A==
X-Received: by 2002:a05:6000:2008:b0:43b:4982:fc73 with SMTP id
 ffacd0b85a97d-43fe3e08fc2mr58462746f8f.25.1777137972116; Sat, 25 Apr 2026
 10:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424071305.89503-1-clamor95@gmail.com> <20260424071305.89503-3-clamor95@gmail.com>
 <aeuMn2w3kSUl-wxF@google.com> <CAPVz0n1POe_YuA+RyvLLUdO2D526hb_YQUXJb72Y1h6mW8M6kQ@mail.gmail.com>
In-Reply-To: <CAPVz0n1POe_YuA+RyvLLUdO2D526hb_YQUXJb72Y1h6mW8M6kQ@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 25 Apr 2026 20:26:00 +0300
X-Gm-Features: AQROBzA_9iTD099b4s043poUUm1ygGLV5Gp-CHdWMZvtjYJQbgX7maV6jEZDk6Q
Message-ID: <CAPVz0n2-JE6E10O_rFZYPSET62HfAz3Zw8vyNa8xoALQQJR7Xw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] Input: isa1200 - new driver for Imagis ISA1200
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 24 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:0=
1 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BF=D1=82, 24 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18=
:31 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Fri, Apr 24, 2026 at 10:13:05AM +0300, Svyatoslav Ryhel wrote:
> > > From: Linus Walleij <linusw@kernel.org>
> > >
> > > The ISA1200 is a haptic feedback unit from Imagis Technology using tw=
o
> > > motors for haptic feedback in mobile phones. Used in many mobile devi=
ces
> > > c. 2012 including Samsung Galxy S Advance GT-I9070 (Janice), Samsung =
Beam
> > > GT-I8350 (Gavini), LG Optimus 4X P880 and LG Optimus Vu P895.
> > >
> > > The exact datasheet for the ISA1200 is not available; all data was mo=
deled
> > > based on available downstream kernel sources for various devices and
> > > fragments of information scattered across the internet.
> > >
> > > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >
> > There are a bunch of valid sashiko comments, please address them:
> >
> > https://sashiko.dev/#/patchset/20260424071305.89503-1-clamor95%40gmail.=
com
> >
> > Thanks.
> >
>
> Acknowledged, thank you.
>

Hello Dmitry!

I have a question regarding this sashiko comment

> +static void isa1200_play_work(struct work_struct *work)
> +{
> + struct isa1200 *isa =3D
> + container_of(work, struct isa1200, play_work);
> +
> + if (isa->level)
> + isa1200_start(isa);
> + else
> + isa1200_stop(isa);
> +}
Because the driver tracks isa->level locklessly, if an effect starts
and quickly stops, the workqueue might only execute once. When it
executes, it sees isa->level =3D=3D 0 and calls isa1200_stop(). Since
isa1200_start() was never called for this effect,
clk_disable_unprepare(isa->clk) will be invoked on an un-enabled
clock. Does this unbalance the clock reference count?

This is a valid comment, but I cannot find how this should be handled
among all available haptic drivers. Maybe you can point me in the
right direction?

> > --
> > Dmitry
