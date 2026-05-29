Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F03A3CFF4F
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053433; cv=pass; b=I9TC0ly6d+f7EtYgOYC4eUmVYOLHjU1mTjJ4Nsj0unO32MjGV/JjdjqLOPUfqEEqSvTnLF1lPWGy5XjcSoKNfPiKJjkpbQITun1BV1mJZTUYK/n7pxlC5QMhbpkiqxUdlvTtCZveKMyB+YQ4AlH/GKNnWcLQEuFs/ZvBGdB/css=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053433; c=relaxed/simple;
	bh=L3mfJ8b8ZEM+xhFAaS2hUBo/4NjpVXYO+a9psiGQoGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hbavyIu5JmhcH29UJMW0ZNyDQGzjjnkcSWO1niGRI6irwcEm3i0Oml/+PmYkdZfynPO84ufFdARe4Z30Xz8B0628jw+0HcBMp0Mb3+RnEdY5vNwzJPyb8HQ7BEw8PjlCZXW5+DfvQFtpNlQTwu3uUVDga1WrGdmb66Lvc4P1SXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTj3gXwy; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTj3gXwy"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304545f5206so10569580eec.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 04:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780053432; cv=none;
        d=google.com; s=arc-20240605;
        b=DyFkEfGAd2Lhc5CRYDhsdvzDQQwFQM5qGaMn21DWSuOGrJg5dyWdt48bZJnHisyPmz
         vw55q9yR/IM+aagZlQG33Km1Oh6OUQ78ML0lzxTYwXnnsOVxjneqpwVrO4LFvptZxdSy
         h2HMZV8YzKMuMzjep7jKxFWiZgn80vUR66bt0pRsrtKj+HEUDmwXStkjJtlbmfiwqygY
         DAyD9iTJyWF2Au5dg0PSQCYzC76Rr4GSk0V5NWz6l5FVVI/GlYq8BwOex/fzzB5KNC8k
         1ODuhQjKeq4YrG80AhUvieMmWkLpYq3gw2CzopjG9eajVJWLbbKP1FShqK5vZzsAYVC/
         UX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L3mfJ8b8ZEM+xhFAaS2hUBo/4NjpVXYO+a9psiGQoGo=;
        fh=si2RdK8kXDTD/ixfwxitjcYRLWTuiXZ/OdMuv5HBUfY=;
        b=ZZ3nCkaBeOnlCDRRgh5UWck2H5q43+O7er1fctlsotBREL4UOIlRZqRRYgOLMIXyHV
         qstFe5GrIuXXWcqq0wonQqcjQysep6WQFTzd8G/Y8Q/WtsdLxhHk+pCibqe9t1GXFN6M
         wcMf+cGUzlT+MG2+Kp4bhea6y2UYmozsSq0VmAs7D6cvtIVMOx2akhlxXyprQWd/Ws/s
         uCFDTzuBdfJ0lh0uO+zxyeKqekaMe/lXCR32bf1m2MaCbQo4b6AKKATwTZWP72SkRyrp
         dnukpUFVFqF7qFmiYY72axXY+Fw4VsDsLyJH6GeMIp0LEr7E26hJmUCvuKXD50o6tpoQ
         gFQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780053432; x=1780658232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3mfJ8b8ZEM+xhFAaS2hUBo/4NjpVXYO+a9psiGQoGo=;
        b=PTj3gXwyVBSTT/HcISlafISe3FMEQr96CaFFu7eOrHtXClvmFwtyfUXLrFPNq1Szs6
         4T15J8oeFmFgejfH0lV54qCPetLHJQco/9DSz2wKZeY3zWQLp7j7LRP67beQVIPGJceu
         rG8UMKA9CCPlFr0DB9YF55wJ5Nx/+YlPajyUV0WSHWT1qWWgAKUooDL9Slj53w1On9wT
         VLffTQKVJ89xrmmM2OYjqsPw1oTC8IEJ3zZqey9ZMHlc5g0zBM2LePCuR5PhGP7UCFST
         GnBjdQKM4Pmo+Lb7UzoiwsoxZ2KFkdlhkdxA573e8QmV6ZuKevBQg9BMJNbKYRy9QFf/
         QrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053432; x=1780658232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L3mfJ8b8ZEM+xhFAaS2hUBo/4NjpVXYO+a9psiGQoGo=;
        b=Ebx+1BYrPNwEaBp6vfn8X766DYmZeTf1l+XHv5wt5BGdlgNBl17wwbF8nTs00xLDsP
         WIJvCdLKifJX1BfNgBxUHeVc8QXkTPqpv29S73wFd3U5ZCWkEWKvqxg2rQ/njumHeLIM
         6Ks7fxVs1cqHz5F/Dfp+cqmawoyFvIwb2kWg0Nri19f631KXqakCYgIfBDG/NBGAE2Jr
         mGfZjn8xUZdo9mUWOh6uhmZyFYYY/yoKyb75da+JGzf4OyLDfD0UnJeBEZ/z6vritHYu
         g8pnCc56uhOOjhp89VKMWvO3jRzlspxWzd/rEHhfFKEFVu6N0RI4qcSEUGpT0eOi3270
         2pLA==
X-Forwarded-Encrypted: i=1; AFNElJ+Yw1Zsg4kn0mLCL9+eUYmxVCDuwhu5RG/TukpY3zirOkxI0jQiagloZXt5awYbXhZGreiloWBHEz32@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3QUGwPXlNbGo2nnSVC6eBtgEE51VuPP+THXAy7GIHoLUkQHZW
	dCPMiACIQmmXl7uIvo8do73790E0tIwEFgZuLls/8PvKXKpZDBHgPx9XUf2PyYmwnmb/zXf1Tcr
	1YQFFy4KlODOb9kbAoGDrSpuVjpo8AhA=
X-Gm-Gg: Acq92OEa2uXxIFBBOKAQuW5xadcnZ4QY4o7N2WyrtigDHbsfJA5WpwcJyahIHWvosry
	wol2efsiMQ/pakX+QmRYEa5k62oXUOFsFh3U8uWpbwC3/eYHiZq0SPzd7Ba/LUT7CXNOXkaG10P
	wtioF6DcwkgAXWmurCJhlsiJO+1K0hnHcTp8cstIs/E2nqM50sGv7LrAGoDrHU/otaf6joieMOA
	PZdbOfbpwKfIghoT9ZfvTfGxTmFU9R3ZVLsajJEBaAaXJ5dp4DtLe6M88dgW0Z8L6S32+yELvY7
	2mpyVjoSvotYsMTJ/UU=
X-Received: by 2002:a05:7300:ac81:b0:2ea:c085:44b1 with SMTP id
 5a478bee46e88-304eb17ec82mr985940eec.19.1780053431705; Fri, 29 May 2026
 04:17:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528135123.103745-1-clamor95@gmail.com> <20260528135123.103745-6-clamor95@gmail.com>
 <ahl0La8OQHXAlV3m@aspen.lan>
In-Reply-To: <ahl0La8OQHXAlV3m@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 May 2026 14:17:00 +0300
X-Gm-Features: AVHnY4LHdqQWkZI96KeyzyHPIcreHN1kHpCMC5cCziI3ntwRYA4WURCN1WE3agw
Message-ID: <CAPVz0n0kpYBACOo=YyNk31KGwBEoyrf+dii8V6QY4iRCGd2PNQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] video: backlight: lm3533_bl: Set initial mapping
 mode from DT
To: Daniel Thompson <daniel@riscstar.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 29 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 14:1=
0 Daniel Thompson <daniel@riscstar.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, May 28, 2026 at 04:51:22PM +0300, Svyatoslav Ryhel wrote:
> > Add support to obtain the initial mapping mode from DT instead of leavi=
ng
> > it unconfigured. Additionally, update the linear sysfs code, which uses=
 a
> > similar coding pattern.
>
> Words like "additionally" in a patch description can be a sign the patch
> should actually be two patches. In this case the patch would be a lot
> easier to read if you cleaned up the linear sysfs code (patch N) and then
> added the new DT logic (patch N+1).
>

I looked into this in reverse. My goal was to add DT logic I don't
case how sysfs works. My code matched with what sysfs does I just
included sysfs change as well. I might better drop sysfs changes
entirely since with such pace this patchset will inflate from 6 to 15
and beyond.

>
> Daniel.
