Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14F03D9DCA
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789349; cv=pass; b=fDPCfugAYEY09qRbo6rXtmFwFa/b2YxDzjDPgAVW/ufHj2goX3CCxLRSbPWcO2uXdXpNIAo5HLkpMrIpQoF+JP4/PdmemwNvNb1v0CxhafwtEsqie2wAJWVwnh4RLCZzkF3mC3cShLHMXnZvjaeIdTQfPlo7mgtCx+ZqBnCcpy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789349; c=relaxed/simple;
	bh=Odn8V4Jyj7HSHR6zsb+AXJEMe1hlNU8CNhlMB76w9UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RxRD8ulHvtQC2FyMdfQtY1ewwGyXJNkT9ICBMrpsRodeoTiOWh/zuNPH7A+e05Cxz4ma38robKJ3U2Pn0YngmoxLwgh6vizgWaJ3e4FmKwZxb/hYkxOhOQauvNCPngGvh2WBlbj54mW5HxPWm6v17yGc1Szsl4bA08VfIRePFIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cV2EXpNN; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cV2EXpNN"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso10935115e9.2
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 06:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781789346; cv=none;
        d=google.com; s=arc-20240605;
        b=hVyFxiNqP7A2B1RKp3AgptihPWpuaBUAxjRWmP4veNYIfzQp2qXjqDZYrwB9rBJQF2
         MajrDV4R09cYd2QgIQl/Wfz7lnw9nyue4tlMiOIAJ0175vO6YTUDjhPlcZSQD7U6vDPK
         ecVKHecxtjW9cNOty4QLSQxheJ6btxut0l06SM978fVj3Mt63ZgqpaM2eXRsxwJf/SOs
         iNhFvc/hv2cbVa7clOXWIp+52gkhVRzjYWN7EQwPa/5g5yFNDQOiNPDe1ftiijwb7hE9
         qssvwOAGQPhoVYrBPntjT7H4sXWxlBlaoREB+vtu6d4shp0rLy39z5toJ7Kber/zmTuv
         i4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r3QY9vRVEn5lFujWnbDukyrJMoT8zbIIk0s1XIR+6sY=;
        fh=YQfsmG8YZvfq6irBSffFRGxJbUAAdyaiaYAEfhj2G+I=;
        b=ckmgiRTuBR8piGRTcO+FQORCkNqi428pzxRrs1093VkOimfzLTWFEY3nz1NuGCJRE4
         emftXJoxF/cqlYjIkIEKFsm+jfUkxn7NFNvoEEasMdkEt63dehqJyJZOI9B8e4ueJodN
         XNK1vpRfOSfyRLf9XTK/kQuPc1TpzlkhDXc5r5vQVuop/RpSQZH7ByzRbgNGc5TiKQLR
         C5ccBeoIYr5aqHJQNJFAB2f7mqYdKHyzPp5L1cu2ARxMCkNcWzAGuKx07Ng4peFAfB1j
         tkHbV8TFb5HXjy/0YuVZhdJOp40oisWj9aeWGqnFNJjLURU6YBqSBejaPDbye0jYI2M4
         pxRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781789346; x=1782394146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3QY9vRVEn5lFujWnbDukyrJMoT8zbIIk0s1XIR+6sY=;
        b=cV2EXpNNI4ws6wXdj7IVEfDHEHkFelEga4rqKEfuAoHNVuUel+PqNbZa0Sd9ugPXHS
         nGrUge/8C+1u/UZgN51JUMuT0jej9wLa1FCIMClEf+G42AEA0SsigrXUOav3CrkykmKE
         HX2EdTq3hbpWY7nqsM0kwF+ug9AmC/tI7q4O5Hnr+KnWcx7jSV7Ppe+UV33goRubKnwC
         a8IcRDHC6JwhFc/0ugLK1OxcnRMuX2HIbeizWRe9fjN7wqOAaR+YMgoGpeg7yWqzD+/L
         vGHHoPYIlpMrTJ+2LW5/fyPVOoQ7cKMQgxUKTMORF5KcE05a1iyLiOu+O6yzj3XCvCeh
         8e4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781789346; x=1782394146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r3QY9vRVEn5lFujWnbDukyrJMoT8zbIIk0s1XIR+6sY=;
        b=AjQxINAYrSlulrWJ/SyKK2jag/JiX6zbz0fTUwAEODOivYqxICRLK7+YlyLYi4IbCu
         LP0DDADgW8exlQrmctxQI6+zPtNifp2aoZeRUyIuKg78gl8OQ1AzA3TdFSEgqjRGFWdv
         ffYRh7hhrvK6xpUrVlk8x4lb77mpSd2cEm76NmUqJJXNfG3b9S3UeRIFLBgYAxCobouV
         cj/mQyup6N2OVYh9r27QyUZrwWidnlw/UZ9eBSKoa46PTvPqsyKdWRoxANIUBZ0vUc5L
         d+hXMIhVyzowMwcznCZtMnH6mOxN3u/34dRAdlenZ2ZJIbJUbKtNaklmOHHKNHXCqdmG
         G+Fw==
X-Forwarded-Encrypted: i=1; AFNElJ+yEiHqgudoshU72bQ7G2Snup+ecqnSOZX9FqB4DXHktiEadt0oOUk8tqtychO6XAzuz/wnK4HtBROZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4sLYOohhhX/XVGzbvyVEBKO5rMJJeH0CiGeLBv5iDg0+idwvM
	WuhxVG90VUD9eQ8i1iIfIHD6IcgkkLSvwykKsIvysVsjdO/GS2lXCuIK/EzV9GrMS04mBbvPb1c
	tH3PoUl0sq/98kRWObMrVorVq9csx4XY=
X-Gm-Gg: AfdE7cnSEnHFh+ReiPTv7O8/JXmWuNhRZqhh8VcM30o+U0s+FCdjMvy/tAuEUpVByPD
	fCcnxfUTGqnR9XIBdWs5QUDs7i+B0XMsUwQE3t8jeL9mi2Dsqvfmdx685/fPxHeP3jn2p+KAfNY
	T/0/09AZjiD7xeHc7vccPHZ12S761nkxu5Pntg3/VEbsSXJA2mJJ1EmodQiDjrZ6WvzbgaSKhAq
	nbD4WsagXXDiSEjeAynU9llgAHjNiX4/3G3BR40DFrvKJpXs1+dZBIOKGCwW2WxE4gfVcO73Ln+
	AJuj7AwHdGiLRDZnmcqY2WbQBnWzGp4w3B5Fqi8DxsXxRjBBF1oJ8UiHEiECgFCSn/Z4Y1N26AF
	tWu8+k5XKpskL1sMPsgW975SwFg==
X-Received: by 2002:a05:600c:4f84:b0:48f:d1b8:9ab1 with SMTP id
 5b1f17b1804b1-492381f0ed0mr59299565e9.9.1781789345605; Thu, 18 Jun 2026
 06:29:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-13-prabhakar.mahadev-lad.rj@bp.renesas.com> <ajKAqn1F074JJazF@shikoro>
In-Reply-To: <ajKAqn1F074JJazF@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 14:28:39 +0100
X-Gm-Features: AVVi8CfPiYA_UbaiFhMeEgi8lZFPPJfpzknvE_2jphmqJ4vHnB1AeT84dC8Do0Y
Message-ID: <CA+V-a8uaNXhqMvw+SqiV5D-EsGGCjeu3Qz9e_RRrnJOqqE2g_Q@mail.gmail.com>
Subject: Re: [PATCH 12/12] rtc: rzn1: Add support for Renesas RZ/T2H and
 RZ/N2H SoCs
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

Thank you for the review.

On Wed, Jun 17, 2026 at 12:10=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Mon, Jun 15, 2026 at 04:48:05PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add a new compatible string "renesas,r9a09g077-rtc" to the OF match tab=
le
> > to support the RTC IP variant found on the RZ/T2H and RZ/N2H SoCs.
> >
> > These newer SoCs integrate a closely related variant of the RZ/N1 RTC I=
P.
> > The RZ/T2H and RZ/N2H variants lack the RTCA0SUBU and RTCA0TCR  registe=
rs,
>
> The RTCA0TCR is also not on RZ/N1.
>
Ah, right I missed "Not available in this LSI.", I will update the
description accordingly in v2.

Cheers,
Prabhakar

> > those registers are not accessed or used when operating under the
> > rzn1_rtc_ops_scmp configurations, making the current infrastructure
> > compatible.
> >
> > The RZ/T2H RTC variant also supports a 1 Hz output signal on the
> > RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
> > marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
> > distinct RTC variant despite its overall compatibility with the RZ/N1
> > implementation.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> With that fixed:
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
