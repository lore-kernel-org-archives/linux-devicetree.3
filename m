Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE1824677F
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 17:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783532776; cv=pass; b=VFArARfPP/Fo7Xscamd9bquEBdtVI2HiqtvCvirDRJJ7PhT9jAi5GnCxPXBGHlmfxwetUAiabbFSJnOHNMSok/HpR8dBJk3fXbWpnZnXcqNX8I5vXD0pCWuBKsnhUaY6XoM3KfZPrAnr1yfqVKm1no3euAv5nur2/Zkouxr5aGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783532776; c=relaxed/simple;
	bh=YqYHuVpbyJ4b9733iq6UlmdT60GLg182zQNOHDGhxQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tGhRCxEmRZqn/4thS7vN50+3Tg2/iIEGNdeOpCnhsQeBF8LLzxSr3Sy1Didw3bQfLZJKnFlqf6hLIq7BOqHMiNaqfI3KJEVAyiiHFfrN8Uy0aK//ykkorzO8n7Lqekn0MSeHd8cOfKstlu+4gxAksV6ScIrp0BgecBdV1AsdgC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=yBhnCfKv; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="yBhnCfKv"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so106128866b.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 10:46:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783532773; cv=none;
        d=google.com; s=arc-20260327;
        b=PnEo9kUNw+XyH9MLoxcSV5LGjdDfjgHwc83Db1eVMQuJiGxYzZ3qwtrvVMCmmBXYWt
         4sUubam11MluYGrN3h9nESYjg6WsZjYt9Q78tKFviV/tmlvoOSYb+CMi4KOoFYtSVCev
         A5aTkIwqUIK7FNXUScg/t7mlp/hBI848k0VOe1eJ+Th9Cxx9CE15BXF6Q3daDLbbyXZL
         pe8Fa7aJDQA4XAxNJVYQeWzEhGcGARo5sbGyltCK7EQ5QSN7xB3ZC8ACRdx4lVcn+1DY
         VRBw7O1owKAbGTk/agZPukNfHOtRaVaWBm2P7dh2CXqiqTliKCwaLO6J1Q0Ol9IpICEd
         P+xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iqseJKw45hRXs0Xsj9yYbmCdsUhBG43DpFEld216CxA=;
        fh=Ak37jMcgOuUMLdbvunO8C8QqSqQEai8jqRORbSbi268=;
        b=h5dltspA0PlSUnDE7gNxLnlJ0/kAnC+e5P29QnBx8DO+ZJvTGSEyQfvg5+bbG7VeYw
         weKZYm94v8vPyi5AToB+W0kRPp+4CzTupYsXfFBe15sLuYg3Mx0pAAJ0q5Nlk2Yj1wfo
         tgF26dcVql+DVp1usUBWtYfqQsPmGjEPtPGEiWkxrM7yCs8i6or9muQjBwIZMTp3wFlw
         /T2qvMxdL5ZZHAhLeTnsUWqu2lzLUIUpwMf9eqNQwU31K/4A2CMesZNimTkAwoujRrpY
         J3OWzM9nzRyQzDxpwsH2E40h8ismQBOn1hBv5k5Ay/QowW9c6MdSMvZVq3dI/jZV5FNP
         wWog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783532773; x=1784137573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iqseJKw45hRXs0Xsj9yYbmCdsUhBG43DpFEld216CxA=;
        b=yBhnCfKvpw+DobjLZ9PhJeSCYhXDt0RBrgFCSHWzo+ADuJf8iWVVL5IJNx6Sv4EiS9
         hFq/byxYRSdpg9TcF9QHWRdlfwKWY/2yl9JpVIHHouZT63GF3sgowihkD9hI1OkokgF2
         aWWTUhsbwqZj7SaNyVr0MM1cSZO1Jrt1DOwTBI3jDPiQFq/2Xx3vky9L/Gldj3E40RTT
         H3V4otUTX+EaurHtp4sHw43jvC19m0+FwLfd3GWYEPak2DLct9aaAVIP+Cl4denvuW87
         u+pKO8DZrK5IKLfeb1urLTsdjS6kYXDbzD18BU3XIcVKT7aMjW9kWD5cb6LTwZS9AVKj
         HTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783532773; x=1784137573;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqseJKw45hRXs0Xsj9yYbmCdsUhBG43DpFEld216CxA=;
        b=XAFLka+2hGYdxciKFKNvdcUOx7E+q0av4Bj1rXKx1MysNyhmPRWCaAhFxyHPS1U9Q0
         Sn/ZTepHcLu/BWU8d1jcTB+u7AxQne7FLIqXCujNuLz/jpHkxMn9RS1RO05VBwZoHLko
         Y5mTCdDkruj0FMXlQ0bsk9osD6cwUSThmbrNKm8+/l076cHC+9oXyN5NNDMtbh/VyHyj
         XlYKKbsb+H8fCABfMlVwdPY3UIHDwQWLcwBqmB2WZNGoBjHRZ0u96roXZ7OmoXnWfksu
         pFmwpgqvxpqrBZf/5jSr49S3Rf7uWem+nU9gDr2Wd1vdN0EkddGdH0mPy6ta6+UpmzDt
         zEQg==
X-Forwarded-Encrypted: i=1; AHgh+Rovk5q08hHMCkdRkhzRrEL+ORNVqCNQZgxkzYKlEP8lTJiANr/PmkZalEbq5Nzh08arRddDBwU4hNb+@vger.kernel.org
X-Gm-Message-State: AOJu0YzPNFuqeWxtiR141PLmzEpfrpVP8y9ewvAzrbx3cMOOkpiisd6J
	2JIQggNWbdbnLSxkWBr1TzOHOHWrlc+JAOE+qE1phHs6ixr3b/xVnkFuUfx4j8/Ud6CEP2wXxod
	xel9/w6N98f0IiU+DHJLTRBX210EGKqnY5apvYhjiYvJ6KCJG57nZ0aU=
X-Gm-Gg: AfdE7cm/5i9iHhZ88Cfdoqkru7mW23rmTDPSlepoWnnL+n/IoDdd8TWjMb8ZWL4Qwoq
	WYaGRLkWZddv9CF+VbZTY7/nSpV5oV+MEHj7w2nzIPoFs1C43J6NOc8UHzZyypWJqzaQA/GZkyb
	M9rxYELVZLPp2D6ym4IU6p8zQ4kMpFvUE52C4QulPkLWY3FN0oZDrCT1dFi/yD14vxy645c4IpX
	5RVMA1Kf4Y6A/UVi8Rk1WuR9lTbiScEQib73UiOoQ4JPuQu4Re1tphjodIy33LcIsZYAJY6uvju
	g55fc6rrA98U/NsS2BblIx/SaD8AgSfEU4dSbf2jBBVBAFZrSDE=
X-Received: by 2002:a05:6938:a08c:20b0:c11:fb01:c642 with SMTP id
 a640c23a62f3a-c15ce005650mr115272066b.17.1783532773640; Wed, 08 Jul 2026
 10:46:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708165201.624271-1-robert.marko@sartura.hr> <550f7779-8188-45db-8de3-c25eda948cbb@sirena.org.uk>
In-Reply-To: <550f7779-8188-45db-8de3-c25eda948cbb@sirena.org.uk>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 8 Jul 2026 19:46:00 +0200
X-Gm-Features: AVVi8Cfz0AdebYHyA0wucUiR5Guc3jIkYaeEJZQYyfl7PA2Z50uPMBVIKA0DJLA
Message-ID: <CA+HBbNE6Y=N2677j5Lzs_edx1bTVjtmrP6jTaT-Mh_5GdFNNvA@mail.gmail.com>
Subject: Re: [PATCH 1/4] spi: atmel-quadspi: add controller init callback
To: Mark Brown <broonie@kernel.org>
Cc: conor@kernel.org, nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, 
	robh@kernel.org, krzk+dt@kernel.org, alexandre.belloni@bootlin.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, daniel.machon@microchip.com, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 7:23=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Wed, Jul 08, 2026 at 06:51:08PM +0200, Robert Marko wrote:
> > Allow controller variants to provide a custom initialization callback
> > through their capability data.
>
> This doesn't apply against current code (specifically the DT patch).
>
> As mentioned in submitting-patches.rst when submitting a patch series
> you should supply a cover letter for that patch series which describes
> the overall content of the series.  This helps people understand what
> they are looking at and how things fit together.

Hi Mark,

Thanks for pointing that out. I missed that the SDMCC is not yet
upstream, which is why this one didn't apply cleanly.

I'll make sure to include a cover letter when I respin the whole series.

Regards,
Robert



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
