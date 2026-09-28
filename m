Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C955472092
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584629; cv=none; b=Lda5QihX2kkm93c31IwDLw683YRzZs0qr/L+qn/QZqfHN8Sgq5l74qhrgGSgAUlfuwMp1ZHTXNZkSE274GWVf73ZfZX6WNMiOCNVQKNjKNsg1TjgfwhpkCkZX1FIkyvAqnLG4oeaLLkyiWU0d1VO36DqS0abh/pyCCS6TC5MI94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584629; c=relaxed/simple;
	bh=EX9eicHVwaUoiSZxx714UBw/LKTiMCIyWd9jiYJIXM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tHdY0zk/ERqz58UMHT3PIOQOE+UXQMk0C3BPX47kRWtbh5IXyjY8Wo4KmofIXIU5yLsDLx8oiw35ykF4becTRjj50dDqSLuiCa05qcpK9t7RnxPTXFvrVXBn6zzngkACQlWJYlH8hqLCNfmPC0mKR0o5HnvfwplOvkbycoatIXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5cd1d9d65e2so1741769e0c.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 01:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790584626; x=1791189426;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zyTKehMDkFPkqWKZx92kuclrg3hevtjSeeDpDpZ8x8o=;
        b=dVlL0rtQSB6z7bGme8ObQOsf7qCJRAIwBTpfg7bLR8JE1GgPXbGHIVrc+8b7pswMlX
         83A4WA+4HVBhlGrLRqEoQR6/uLXrbgFmXYS+6DQZUZBO/WJdVUDSvsX8apa+AvP/E7n2
         N+T4o13P07yP6e8DbPtsVvwdwOhjQJ8G2UFE30ap2z7UVRATXhdMqfhcEC4RiIOtz85A
         4WeQcgrCQHtpyKCA2GMJH8YYEykXM6sqOPOf0xkVX0TrRmsdfJfbrmT4Mf67f1CnQfs1
         FG3JctCYmqP/ompktXb23wDZ1z0u/QQXfq/STKWqxX+yFBRrygi+ll5QWCJTe6IXYcAC
         Xi2A==
X-Forwarded-Encrypted: i=1; AKwUvBzlFPhZr2JPTrpYftBKDyjaxiAtgLhFfHEdcWHRuAEEI0tgU1XK6i18rYYwjs1lgMO+yGbrVcEyb2eL@vger.kernel.org
X-Gm-Message-State: AFq9FYKB4Tv0I8O3EG7nhKW8XQi9YOfemDTg6InQTLf/Pem5DGx5QLPz
	y/UTn+DXk5p9Kg1doNBMAPLAEeCzRFfZJgJF7oPWfRt5yuuLOXnKbl1xDscGOPZi
X-Gm-Gg: AYBFou3kKPwD9W4fAPpgSZ69vGpqLlKO2Brc1YeFk4UFuue//7KNBIUeFSbKb0IYeQW
	ra+0CbQcaRwCe8AR84/OgeHqRqCY7AhzkX5AW0mOrQDzMMeExlLhVmUH9+jHKk7JDdfObbJhNcR
	WWUaHkL53O5/iSFgWwrgNBjWlEuGXnCvxXUEfRdCcSVhCskjn+InkMYqtUZXF4cKmqGqV1VNtPZ
	AmeW2vVJ0Ta6ImLUJWSYdRuJcPIeE4leKW7QhPRDF47LVpiMAj70vGMTeHuKKAENdSdGz+mJmaR
	D0CVWgNldnOALc8QB7nul/vNNKy7HPoOVCMjvRvA5MkZUYXSWb+6TMPESmzO2BSX5V2oDrO5ZpS
	zwbiCX3DPocGwoL4/XzCxZI6NtISULggquQYDwyJzMwEUhbWM7GZ8t1BCs4pg6nkIL1GKrI4qGz
	Urmku9fcgq66skLzjM7d7khw0eRtva1ECjni/n7K3R7w4ognhw8E2cZVVx2WilcTyJVyShCW9fo
	PauxHACckiWx3q6XDmRB4P88ygdUJ4ggVNK
X-Received: by 2002:a05:6122:8b13:b0:5c9:c435:e927 with SMTP id 71dfb90a1353d-5cb090264e6mr5603712e0c.1.1790584625758;
        Mon, 28 Sep 2026 01:37:05 -0700 (PDT)
Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com. [74.125.227.38])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde4f99222sm8063888e0c.4.2026.09.28.01.37.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:37:05 -0700 (PDT)
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b2eb9b9809so1316303137.3
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 01:37:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByPZXZAZX0lqfCatzrv0G0IxbRSSoahW9wZj2EqWrPFQvO/rPad/XIYxdL+B/QnOr95bOrR126NJAL0@vger.kernel.org
X-Received: by 2002:a05:6102:4412:b0:7a7:19aa:8a85 with SMTP id
 ada2fe7eead31-7af1eff69c0mr4934230137.32.1790584625197; Mon, 28 Sep 2026
 01:37:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917111349.52250-1-wsa+renesas@sang-engineering.com>
 <20260917111349.52250-4-wsa+renesas@sang-engineering.com> <CAMuHMdWy6ksspwvj8jRxf6_OATU5rS5p92KyG4+sEF+ag7S9NA@mail.gmail.com>
 <arlA1YuH709wjtHm@ninjato>
In-Reply-To: <arlA1YuH709wjtHm@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 10:36:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6v6Fu+mTy83TNRoSEjbaaup8sZb0AE1DZbYc0ZGV2_A@mail.gmail.com>
X-Gm-Features: AclHuK8tJz3nMwMQn-AWIXUGX_sO1CRpFshT3Dx9kEcVgOI32UtUqTiw6p7Mi64
Message-ID: <CAMuHMdU6v6Fu+mTy83TNRoSEjbaaup8sZb0AE1DZbYc0ZGV2_A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: rtc: rzn1: add R-Car X5H support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Lad Prabhakar <prabhakar.csengg@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Sun, 27 Sept 2026 at 18:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +      required:
> > > +        - interrupts
> > > +        - interrupt-names
> > > +
> >
> > Sorry for missing this before: the "resets" property is
> > completely missing.
>
> Yes. Prabhakar, looking at the N2H and T2H DTSI files, I assume that
> those also have resets for the RTC and only N1D has none?

RTC on RZ/T2H and RZ/N2H does not have a reset.
Please check the MRCTLx registers.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
