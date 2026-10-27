Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126374;
	b=4xOOzThSqK7lricytNzT40UdeSqf1EyoWKUfvfUY6Wfa80hx2XIln2OgXUdevvSQyXCY
	 AwZvPJV2NEFC6HWNkiWjESrxvFojzUCbZ6v+0cJddRmOa+mw78zwRiEqqhG+iKGuITM2G
	 g1VM/CZrWuGZO09uuOaFSD2ClAn8wR+YYoc481nROQThLlmAXkyL8qKBw4CFW74vV7rm5
	 Tn49JlvZmGiQL17t3BwMFpfGj1VUh/uQEXiUAEt6Iz1YaaoOLrXcs6O9vcFEtr3dniB7G
	 8R3MImhaA7Sgus2UVsuDIm3sX8Z3iTjRT3Y3VWhdeDHfixr031w2R36+EN++yxjVhKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126374;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bskxJSqG6c0o4PNksGKA1/LdyXGJr0htoC5Aj5uMg10=;
	b=fBlSbXyBGr3cyW3n+Dl779V3yVoghZVjWmaJm/JJh5VBG0Tdp12W7bZ2EQ0151bOD6ah
	 BNSqV6sS6t0S/Os9Bn3/mCYPpT8AZNg2SqScPRkC7jguPy3bMZRdwP/EYUdfY2Jbb+Pzx
	 pGX16b/f1YbW9GdCIqaxEXihzJWyERZcOqdEkzEIDJ+Y46nMQ/g6TXg3TjmTs4/OsGSRx
	 EvfsBLd2M6/vjZG6JNFAr1wfuG6QrHS6YOxkrWkTSJQjrCLCvzqeZj/OMCkx2C36LaX2W
	 Y9qFS9dK1Pcj/0du8a5OJ1QhFQjvVdrzY7dSiI2Sul4i2uiTeT3/yCvgHlUq7xZTysg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F607606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F607606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc0892f92cso45975137.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126373; x=1793731173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bskxJSqG6c0o4PNksGKA1/LdyXGJr0htoC5Aj5uMg10=;
        b=ZjYejHqRPyWKuS4E02yHUi3XS1hP7f3eo/m4wvDP1VqjyhY3NB27kbeGqaQMSge0n4
         am6AQoBWaEk2kdL1BsbccRe1U16iyl7a4slGnJLlqqOYNhzRzSbOccPmYc3Ji0QcHMR+
         39L0PBBVPoRRwv5spFbUYlDyCawjUi+698SDtAHk4ZubCueE859GHtN18EKqkg253QR6
         s3uraZxfu6rAJiNqlPa4L8w4SENvG3wT4Q/uo6pg6At1KLTElbG4QEZmiK6POEcFG17n
         JC5XNRc/bvgBE8I9xRzTSugh8By16wkMrAYuawslZKEEeQc/DtfLp32YNJGwg8yPxm9B
         EDxg==
X-Forwarded-Encrypted: i=1; AKwUvBzLkmjbHVeKXGq1Xq7PsKmJBpj+Pud23zbKjuOEMJO0Gx8Cu7kRf9OZQ5YIcGHVdTtnFqQPnbn5IOMn@vger.kernel.org
X-Gm-Message-State: AFq9FYI7zoPa93Pr7Y7+Yal3RUsXfMf2WXnqBTc69XwszD5iT3VsW9B3
	zQpQ7CCjRGRlaFxJPnQHwXz/AYT0JexXeeYP9ZrLDp1kqpQiha/Q75Y8R3KAJF4p
X-Gm-Gg: AYBFou12GWB7UibvGxcJpnx1eQjhuhby1mGgMnXTGHR3b2C+PoA62IK5OkRX7vpBM7c
	p5Dk4lUSItF9ZGv7/StrgDXnve7q922DdZ6BTcePDJ2w7F77BzDYdKmuOWcnAz2+COUPAlplytP
	7xq/EXNFEbgok1SkGgGrQFzaylQSTjEoHzCTEEpb03BZZN8iVIsmZC4xnxKFuG0iMXQY2o0DarC
	7Zdv1r9aguvTcGceSOl2KFn1GRW0AJwoTH2NHiMgYEAzCQeiD5Gxh2uUoG74obZeJlO06wq3gwA
	OLDpDRi25ulvP3eIUw9VzFBfLRDFuzq/Xh/TK+pX6f1XfrMKeenj62VZj3X8LW40ieywIS1f9fv
	ywRSsTptGYnlU9DgIsehwszPkzAFa8DY6omoSxnj8GI/v2P1Y+08qxJFTX+RZ2fA4VPhmaOFDsL
	tCY3YJEdkrKMlEWWzRdCEB+LMeDa3aXQj6boasp7OAl+7VBM8usIaygW3n/fOEFHb6SRbiSib+c
	jYc8qyo/nFueKRrBaDua+nK5hunVNVXj4xCTROaeKl5oy/H0pYCAsrjOV9R3h8xRjj9uE7kvDXV
	E9VXKSYtyzF2Ohhguw==
X-Received: by 2002:a05:6102:2c0f:b0:7c4:a0e4:1a79 with SMTP id ada2fe7eead31-7d03a5a8477mr66843137.19.1793126373451;
        Tue, 27 Oct 2026 11:39:33 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-991259c4dd0sm3348971241.3.2026.10.27.11.39.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:39:29 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7cc81984fceso48436137.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:39:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzz5L7w3md7vZ2VHh0OTZ8N27n82rVg8vSzYuB3l7cVqxJ6+gwA+Ooq6/N/ScUIYjoCxXCUN+E0P+sj@vger.kernel.org
X-Received: by 2002:a05:6102:4422:b0:7b3:7653:5487 with SMTP id
 ada2fe7eead31-7d03a64ef2bmr58613137.32.1793126368843; Tue, 27 Oct 2026
 11:39:28 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
 <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org>
 <asz8oEtow_lrUU7K@zed> <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
 <atXol9eFjLKxgTpg@zed> <CAD++jLm5iRKbb6=ZY0r1q_bb-zO3DAe3a7MxdDbpBT3ZU6_z_w@mail.gmail.com>
In-Reply-To: <CAD++jLm5iRKbb6=ZY0r1q_bb-zO3DAe3a7MxdDbpBT3ZU6_z_w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Oct 2026 19:39:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWKH2pPR1-j-AxV2LVy5xeuoymYv4MnXw1KSvAu4F-brw@mail.gmail.com>
X-Gm-Features: AclHuK-ZyTwLWgoRI-o0BtmWvpg5NzrSx71dPROAi-SvxTYl1PL6GLDh7YhiPW8
Message-ID: <CAMuHMdWKH2pPR1-j-AxV2LVy5xeuoymYv4MnXw1KSvAu4F-brw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Linus Walleij <linusw@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, 27 Oct 2026 at 19:01, Linus Walleij <linusw@kernel.org> wrote:
> On Mon, Oct 19, 2026 at 12:23=E2=80=AFPM Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
>
> > > +       /*
> > > +        * Allow the ISP's 2500-vclk reset recovery time.
> > > +        * 200 us cover the RZ/V2H's documented minimum of 20 MHz.
> > > +        */
> > > +       usleep_range(200, 300);
> > > +
> > >         /* Use "software only" context management. */
> > >         mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
> > >                              MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK, 0=
x01);
> > >
> > > When we now retrieve the reset and assert it, it matters that
> > > we give the hardware time to recover. (If this works I will make
> > > a separate patch.)
> >
> > Unfortunately this doesn't help
>
> Since it is clear that:
>
> 1, The clock and/or reset ordering matters.
>
> 2. The device tree order does not in any way impiy any sequencing
>   or such sematics. (I.e. we can't really change these DTS patches)
>
> 3. The bulk APIs for clocks and resets have unpredictable ordering
>   (clocks will process from left to right and resets in the reverse order=
...)
>
> I have concluded we need to request each clock and reset explicitly
> in the driver and sequence them in code.
>
> I sent a new patch series with two additional patches to explicitly
> order clock and reset enblement.
>
> See if this helps and how it looks... Try dropping the reset patch
> because I suspect that ordering to not be as important as the
> clock ordering but I could be wrong.

The driver uses Runtime PM, but I see no calls to
pm_runtime_resume_and_get()?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
