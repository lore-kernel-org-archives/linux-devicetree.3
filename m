Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C590935AC09
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779012816; cv=pass; b=gejAtGyrIS+LgNcDqXWEjg2eWldFV1m8Cocud+FsLqxvw3qCnuFbR3UyO/6e/145hAdX71itv0/ZW2qupLONm4MU4j/nGFOPC9QUjvvrE/zJbr6SekOWHIx8cLebBttsreroS/APGnlSdHZMhbHtRZfEDqeFnGkI/E7PiyDbcac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779012816; c=relaxed/simple;
	bh=Ah355/SrzZrFxRMEDg0nnxbwUFNinnvYb3ZHH5bVd7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGMaFf6NX7YlNlrRprTsFezLLHZEw0uorsY5WOA2V3AGmlaAXZLikaYyF3mUXtCsNA0PZmHEOqJRf1g6o+vfc5QtKEM+mOeeTH5aMaV3LOdnlOH8mGn3dPpFSxkm4Y9QZGpEbEZLPAJJ++8BC4KtUdPv4+1IStWmLPkqHRO7gcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpiZQz5C; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpiZQz5C"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-303dbfbec77so8892eec.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 03:13:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779012814; cv=none;
        d=google.com; s=arc-20240605;
        b=SzHUVGksad+NRlgw3LyLc3NWlibdt88eV4gxgiL+5jLFGl6AvSy4cYX3y+q7Iwazpy
         n0EdADEJI8lm/ZgaCwSJbhTwkc7MxCFXaUjuKxdZWFSNQRp+I4NRtjLiqf2y31J0If26
         z736nadP+4+taXHG2rqgNxvnkI2d8Mzogz9J4qJ/ie4kpPpWMcDvSCQvMYhpwRwGnnNX
         Y6eMo2qAlg2sCHuoo6gQZN3qZF0wxb+VkrLRFP6s6cEm/HLbNcGAwElcSCV3D2CVCgEb
         dZ90CALOrhd10YMb6qCbZRlaUlMoQ/R6l/4UMUbSBpaBymtlZeQvDcWmkD8OFBamdT2d
         TPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ah355/SrzZrFxRMEDg0nnxbwUFNinnvYb3ZHH5bVd7Y=;
        fh=LMJaeG978+2QqXrz6euiIoJeZlUIh9l0rCJANaNGio0=;
        b=CJGmwLK1Op48XLDGJj6OCFdwtSY16QT4uwN7Pi3lvUAcKF11JNh23iMztnULrIrQNp
         UTP2v9yasyfwrr1mA32L8I5CtibBDCQ227Ej0/w0i2PUEuV97szhgmZHuNJoyFDfthAv
         5RMPH/lJRsXHy25xLHLtx7c/DCbrl/rFHU21QnWUwQWCMk1x48p5kPQ+0Jx2Qw0nBNrv
         462dRNEu5Zw07J6gZCMYTwUiKhoOQNa/Kj4iPARYirtFWQwkLEwgVpSOJqX76pOJUtPq
         La1VjKRSb91pI4LsY9r0oT8Yv0AnQ4cKZrvh7vGtgizg5iptQb7we5/q8eZsMRTfoHEB
         PZtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779012814; x=1779617614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ah355/SrzZrFxRMEDg0nnxbwUFNinnvYb3ZHH5bVd7Y=;
        b=DpiZQz5CG8ZsaOTOglNTkpxyCrOL2GT7MM2PeQzjC+91XVAbmvolTcCxLU63eB8NbQ
         WEI6T07V2j1xZObTgOmqSnbrokDXpO6061B+NXhy4sDdEPgT5a+ubEBxizQ9myDYGlWC
         O62zgIwpFxpPyLkH4EhPQqjEIdOWArEJXc7t0mML/K9fj+90Q+Qw71nRr09oxaXeqquh
         J7egeAQ7ppT4Va5M2I63q2c6XcGN9klLocWjLb7ZYA9A4LNa6W9Uh2Bm5Y2nQku6s9lA
         TgqsXMrnoAr8q01O+m4luSM4rbXjhePOOY7jxaFcDRXNkWopcSeGTB6F6pa6n0Qh3K1N
         t1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779012814; x=1779617614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ah355/SrzZrFxRMEDg0nnxbwUFNinnvYb3ZHH5bVd7Y=;
        b=X4uABgJb8zgiHdHaTpO8+NQYDFWIoLjpjPe9h1dKo7mS+DcaSbWOdgY8gr6SYssOhX
         3I4aZCuqNGt8KmxFBqfPqNeM5kFyKBWecWRmQBp1Ef6Cg2cu+P5AH2xWDPkbWNXKgThJ
         ObWJvX4xAsK3CG8zOZ3nmet2uIQOJPaqTjV/MjXKGbZ3T/hpGYlMoHycgyLmi94Vamxx
         oi2PRGygJwFhOuUgO7fz0oLz9S97gSzWUrm4OCAwSqRDd0UlcltYeiweF9+yVtgnEht9
         BCVimN1vlc/HwGpNLs4MpLhhb3JiAuB9xb4aqh4ADUKenk/8vqbo4khLq4vmaNYfKyAT
         Gu3w==
X-Forwarded-Encrypted: i=1; AFNElJ+WdRMLYO6VpcvKUqStJ2qCAxLaVDA9Z8PGVVtFR1TmVbsRdW1HrX6IPuAkuCU96O8yqa3vTXdLRZ+q@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg2P+HxxqNOAEdQo8jqXDz/X4hVkPWvqDg5gcAUM1RRAZTRIWR
	m3qBlTNG8yOybk+ejk6RxfXuHTG8GAsB5gn+W5wkgpsMZoEYcUKB3/+3Rq/yXr1euAVDjBMWWUg
	rCYtgFPSc6tLuhvJ5/QDlQQ0vlA0OeDU=
X-Gm-Gg: Acq92OEonnw+kYLNj7hbRf+e6xcgFrYX5KfmbHYioR1lm4H+6HbwboBHjvRykJVjkrQ
	PraGLeGRuoyQDU2muGF4HHybVv1srGjI4DinwrpWaApQ51mchPTFGt3YF/SOOSpWPX9kDVesMb0
	/M58kOSYGnE8gG1Fsu5BLiJ4N0md425Uk2IlHdWCp0PKggQ2iwzXDvVSd5cJgAPaDym7qT+vbqy
	V2KxZmnA9tcHDviyygNcznUCzNTQeDbvmmBLs2et6hL3HSKqnxIoAi0MzoxXC2wbMgiqGG71BdV
	6sk6iYxVqby5kfh1/gA=
X-Received: by 2002:a05:7300:8b95:b0:2e0:1f09:d924 with SMTP id
 5a478bee46e88-3039813cab5mr5237843eec.5.1779012813884; Sun, 17 May 2026
 03:13:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517074306.30937-1-clamor95@gmail.com> <agl1T8O6kwP7SFZ1@ashevche-desk.local>
In-Reply-To: <agl1T8O6kwP7SFZ1@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 17 May 2026 13:13:22 +0300
X-Gm-Features: AVHnY4IqE6FsGFbbFI5FSmJMlyOUEK62QOSOEKabbR3m07ZeyolRt90bM2zxkWg
Message-ID: <CAPVz0n0tfbwa1AbgO4eKrmNunHvmTFLDqXDFd1=VfLayuafH8w@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] mfd: lm3533: convert to OF bindings, improve support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 17 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:5=
9 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, May 17, 2026 at 10:43:00AM +0300, Svyatoslav Ryhel wrote:
> > Convert LM3533 to OF bindings, add missing VIN supply, add support for
> > setting mapping mode and LED sources based on device tree.
>
> How is this being different to
> https://lore.kernel.org/lkml/20250218132702.114669-1-clamor95@gmail.com/
> ?
>

I have decided to have a fresh look, this is continuation.

> What about this comment
> https://lore.kernel.org/lkml/ZmBcvtLCzllQDWVX@hovoldconsulting.com/
> ? Have you talked to Bjorn A and Johan?
>

No, but since grep -r "lm3533_platform_data" * gives 0 results there
are no platform_data users of lm3533.

> --
> With Best Regards,
> Andy Shevchenko
>
>
