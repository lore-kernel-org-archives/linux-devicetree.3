Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EC939A814
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433647; cv=none; b=cQ1Z85kxF0loptygptLJbGLRO+agCjhYiBerC/WaztX0L0DNbTDPZxuyAinqZdCCG4zIaDOoRaxcVRXbHJWHZGfUZIT+Fhb37ifd8BgtAWQBOqrxkjdw1g1eg0LnHhSvK056L3ZBuu6gVdZUR32i/FrAonQCjRgUtQFw1pbz+JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433647; c=relaxed/simple;
	bh=odJWbCaP0lmit5rLsXxRBXtkP6ZV4LNpp0nhdo89p6I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r9JFQONhTDDCuvmvTkaw31x/qdmcqd4yKYXBSpKJ5HhU0lHN5/hhcBV63K7H8IGfEnZi+tW1499v5BWb/R2L51jXLVse/jeFTiwGWh8b8NYnLC3f2YAMq7o9SV1jNZnnOoa51kH9Cfr4KId21WBGXEBdCZDCJy0iAHTGpxHORwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6Wi+i3D; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6Wi+i3D"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b9b1900bso3342740f8f.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774433644; x=1775038444; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dFC9v3RA0+njBsaguL/yT+mILr4lqhBw+oEWCcpW5UA=;
        b=X6Wi+i3DJPfitsgNgUCGfJwzqTR1BeZL9HBN9wBb5/pVskRv89DBmHtir5M3DEufFE
         ApA7cZvoy2J1mbPVVjB1CK2iMhyQzNYJ7+xx0XckftRKrlTgH6j1BZbaQ4bjILL+k1Eu
         TG3HkU+cUN0C6Ck9jdr8IXlG5/i7tODdJlAz7HdyA9ytvARpt6B8Tt0pJGmEpQndvPpj
         p0hZaOhsFhrC9uksfPwp3ormm/ObRiA5/8S3hAv3rfw/1Akd/ddmPTdiLpV+c3ulLGef
         lqtCHwVv1JtAleoSizJ4kyCgXsukcQxdH8Oc4g6IvqRPYtiB8GWoZ9NZXdHddj7BPEqo
         T1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774433644; x=1775038444;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dFC9v3RA0+njBsaguL/yT+mILr4lqhBw+oEWCcpW5UA=;
        b=NdYEL15LgqE2j2tcqL3fo/NkMdJb+sjV/Uv/POWyR2HkUL1PWpIbHdiDEj/UMRCiBg
         sfDXNbHmSaN6SZFzozK2pT/0sXhnxnONHcR/0XSNT8vTMCA0W0OSzvtwTtFYKaLEyQEM
         eGS5FcJ/L0zJCT3tTbAPqEt5Ya25+2DFJWNq+HwIf/QjCbv49qc8s48qun2Gje2Nf81L
         aLmHmokjmSvdpCcjwel0pWUlbES7wZsbKCetvuNq1sknSAxv5pBZI0TRN+W9h+MLZSuP
         INK/tu5/vJYuEZx/yluocSsC0GEKZk+qsQ0SiKhkMaHD3Mmi2+3tQt1FcSKvfNfdCbY4
         xQmw==
X-Forwarded-Encrypted: i=1; AJvYcCVjhc8cr/kHAPC/h5mfSx5FdLAzoWkFk+HCs8MsPvYvnYcEx7U1EWXwT3eHS0VnSMM0r3Pouq30sZ2Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+X3zEBXvjkwVSPjKqC87+PEk6f2jZhHAd1jaj5iNNqExsTnjR
	NGLq4W3pD2O7JL2YGmBAtu6Z52g6DIQVZbbxekXTJBeUBTonFfTBgaUQ
X-Gm-Gg: ATEYQzyCldMA8ivQTi943YQGDe/iHt9x1IfSWBK33vgqPo9I0CgQzp7844b++LBmvnn
	QeNDhMpskmGuNPewdJaed1KKb3M94hPe1vuwoEAMFYdYGr04v4L3Am225/OlPaZQqjKJOTNSaNt
	4EI+WQgO1C2wdBXrxPOZXOCNv3yFklZ4EUc98gnpJaAfOxMRRq3MOlo7A3F7McUqHv4BIyBFMdL
	HV4f35tePfN8HcjpZMj2VmHwDkqOREyb/rMcOwSNt7cnveUSBoRdIT6blXUkJz6wvtU7dWEq3OR
	nJ86T5h2e7/Gc3VtfiUrcjp0HEckBSPm/RQFytwr07vOyMgQTRbsZTC98DpfQHOeyIBSg9qTYmO
	g+qPQPyAwotqpH8753QfSGGr+Jk21Rv2GxvgVrIMoI1f3iRbGhuz7ntEc7fh7q4IkWKG/RLsr7l
	URAMo2xdlrAMw24oADliLX1/kRXEksJEE=
X-Received: by 2002:a05:6000:22c1:b0:43b:87e9:6aee with SMTP id ffacd0b85a97d-43b88a57005mr3984417f8f.54.1774433643870;
        Wed, 25 Mar 2026 03:14:03 -0700 (PDT)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b85082842sm10732177f8f.20.2026.03.25.03.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 03:14:03 -0700 (PDT)
Message-ID: <975f2df6090f3aea0524369ef07f2a648064f010.camel@gmail.com>
Subject: Re: [PATCH v3 2/2] iio: dac: ad5706r: Add support for AD5706R DAC
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>, Jonathan
 Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, "Hennerich, Michael"	
 <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, "Sa,
 Nuno" <Nuno.Sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  "linux-iio@vger.kernel.org"	
 <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org"	
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>
Date: Wed, 25 Mar 2026 10:14:50 +0000
In-Reply-To: <PH0PR03MB6351C1D87987E0533F4A07EEF149A@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260318-dev_ad5706r-v3-0-5d078f41e988@analog.com>
		<20260318-dev_ad5706r-v3-2-5d078f41e988@analog.com>
	 <20260321183909.45761710@jic23-huawei>
	 <PH0PR03MB635133FB434235B7542770ABF149A@PH0PR03MB6351.namprd03.prod.outlook.com>
	 <PH0PR03MB6351C1D87987E0533F4A07EEF149A@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-03-25 at 03:13 +0000, Torreno, Alexis Czezar wrote:
> > > > +	ret =3D spi_sync_transfer(st->spi, xfer, ARRAY_SIZE(xfer));
> > >=20
> > > Can you use spi_write_the_read()?
> > > Has the added advantage that it bounces the data so doesn't need DMA =
safe.
> > > Can also use more meaningful types like
> > > __be16 tx;
> > > __be16 rx16;
> > > u8 rx8;
> >=20
> > Ok, will shift to spi_write_the_read(). There was another place to use =
this
> > above, just trimmed it off here. Noted on the more meaningful variables=
.
> >=20
>=20
> I only just checked spi_write_then_read() but, it seems this doesn't supp=
ort
> variable spi_speed_frequency for my future patches. Should I still use it=
 for now
> and revert in the future?

There's still the open regmap discussion. Independent of that, if you can't=
 use
spi_write_then_read(), you need to make sure the buffers you pass spi are D=
MA safe.

- Nuno S=C3=A1
