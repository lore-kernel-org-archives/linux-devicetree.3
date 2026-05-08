Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA013DDDA7
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 13:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247813; cv=none; b=WYk3oJFG4jrlPihHeGpPi/VejZ16xLQTxy7LHpySd4VxTbSsfBqftylmRK/vt6Uuk6O+OE9ewXm1t2IrW7a9WOJH0OKVD/isOkOM5CPmX4PKk+4r2l6q2wiLOmV3K0zcQb6cP0iR5gJSeGGsH8rocZIdFuIRRv2gIrP7u0OLU8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247813; c=relaxed/simple;
	bh=vwmK+t5/0R/qMQfaEFIfrqiBe1JOEHiToQQCNOnzq4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2nLaSEbPyVf5QiaGRl8aOMKC1vEbXDIB39TucqcbWGEf2jJnkKb7b67cwUumywi26siTUHh6FI6eR2fChXMF3lqn/gtuuMdlXPvg0VFHss2cQyNZDa0QfJw2sA69iAOBwzSnzlMhQCBo0vu/VMX/d9XNejvnCzGeaIWqUMi+4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkhaPYRK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkhaPYRK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b150559bso15680105e9.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 06:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778247809; x=1778852609; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vj7GjlyaIP+G5nMU9wmaTTa+4+maED9Ta/6ulqHERU8=;
        b=JkhaPYRKNfJv/qbPo7q2t9Lheiwd1/53yIbolYpZAbhGdmAq/JSJw/EUELfKSNBp9p
         33C16l2oYOjLM5b5BkRu6VWfwFtDnRUawkt/u7/4ZK98Nx82TRTvDS/H2cB+IFQcc83n
         PDlXKEsi0/V9hiTEYI7g9eptswhhRxRB0eMUgf7hNOJn+aYkbogvdrKbqsN0YctDuvHj
         sHCv82Qj+jlcJsYP2/QQ7yoiA3+pn3eBsdDOoiWSjqARSQMRVR/2UW+xcbp10Jp9M2e6
         nczPPTD5PbAELi+SKy1K0SJS7eTmUzdb/NP4t/j5u+cbb0PoXsAzVDDjo2eyHNIjrOlR
         qixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778247809; x=1778852609;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vj7GjlyaIP+G5nMU9wmaTTa+4+maED9Ta/6ulqHERU8=;
        b=TABAXMwmyQ8rcLDoIdXN45/3xCDEWYs/zT/9BLg6IIWfMxviePcWgX930C+H+WLpEr
         9PiVp63GBhCc3b2DSQUi6MTGzb3kj3JKyTlFbC6cruqAyN5gBoig0ADWHYONkPxBTcTs
         1SR1fHvpcZGmQHrS7NXVDZGIpa5ZQd0k/4zTSab3KvZ3XhQCPTrDwP9SPC2JF181NYM3
         8El15Kx7v4fxgecM1QfzNjwYKSg16fWICGrGrVZ78LjHTfZQ6XmeQZDWBFEaoe4U5aVh
         e/ylYU2fefZIzJjHpVpGJgdYwk50PpUIRZJ8/byt4QghLiSItGrIzr3C/FQK0MmcUL5N
         Ucwg==
X-Forwarded-Encrypted: i=1; AFNElJ8S118Gq8HJnWAkFeuBgptLrzkJqCSJyAoTq3VKCh4bpfHwD7KRqlMyn+yPQv7+BDKoD24pLbbU4GSY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl2bur95wemP1HAO7ELvQIkwr2igBINLUoeEvyPU+vDnkL1giE
	hYvSix4RhYAkMOLTTvijjGXCbs1Tg/irX7qcSMGtg1+VR338lbsVZPyb
X-Gm-Gg: AeBDieuJWEKgbNU03B3N2EZ1RVJf3AGKlec+DB8P/tAcGq92akRVICn5JuA3xTWu6Ww
	woZHp1SXcdLos4mHU3458emypxcS42vxn71X/5NxTJmH7PuVz83ntumTwnD5M9vOkX+rbV4MAbL
	8cOC0hyQalPjqhDXZqFMLLAS6MW2+NoljyMcM+MA/ZrBkWoCPwGeQ1arxJTZkmNxV3G7U0FzITq
	0cUHoHaNrovDMSy1LgGa5aXrHYjWdB706jH27RwDHS37Ei/aGot7Z5ifacr6DLub2kSQKFygyHZ
	g6zhl3IzcUZ4zXkMsyC0DCC2caa1BOG8NL2P/6bBrjdfpHc8IvyvsfhDZ4uu+wcSSxFqtgQtZwl
	ZSiANGKyKQCXzFop67gwtt1zua7syzLWr9U7bXHf5xMtlr2L3p0ckYVXPAOakhwJCt6cH+bqJaF
	kaCLuUnjkVdh42MBM=
X-Received: by 2002:a05:600c:a118:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-48e51f37363mr157605975e9.17.1778247809122;
        Fri, 08 May 2026 06:43:29 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db171c9sm144165e9.30.2026.05.08.06.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:43:28 -0700 (PDT)
Date: Fri, 8 May 2026 14:44:22 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: "Stan, Liviu" <Liviu.Stan@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, 
	"Sa, Nuno" <Nuno.Sa@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] iio: temperature: ltc2983: Add support for ADT7604
Message-ID: <af3oezNmmBhI4Yu4@nsa>
References: <20260427132526.272716-1-liviu.stan@analog.com>
 <20260427132526.272716-3-liviu.stan@analog.com>
 <afCVtXBHIIoLlsRo@nsa>
 <SA5PR03MB83772D8F6A3CC39094DE5241F63C2@SA5PR03MB8377.namprd03.prod.outlook.com>
 <af2no3bJA9MSjXvV@nsa>
 <20260508121441.39ad9f65@jic23-huawei>
 <SA5PR03MB83778AB3C41E0AF56EC754F8F63D2@SA5PR03MB8377.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA5PR03MB83778AB3C41E0AF56EC754F8F63D2@SA5PR03MB8377.namprd03.prod.outlook.com>

On Fri, May 08, 2026 at 12:46:50PM +0000, Stan, Liviu wrote:
> On Fri, 8 May 2026 Jonathan Cameron wrote:
> > > > As for the IIO_TEMP question, the chip's custom sensor table stores
> > > > temperature in Kelvin (same as the LTC2984 custom RTD table). For the
> > > > leak detector, coverage data is encoded as (P + 273.15) K, so when the
> > > > chip converts Kelvin to Celsius on output, after the driver applies the
> > > > 1000/1024 scale, the IIO output is P * 1000 millidegrees C - 0% reads
> > > > as ~0 millidegrees, 100% reads as ~100000 millidegrees. But yes, the
> > > > actual useable quantity is coverage percentage, not temperature. Is there
> > > > a more suitable existing IIO channel type for coverage percentage?
> > > >
> > >
> > > Will defer this to Jonathan but if we can have a real of the coverage
> > > given the temperature, I guess this is ok. Given that I think we don't have
> > > a better channel (unless we add one?) for this. Or just extended_info...
> > >
> > 
> > I have no idea what coverage percentage means in this case.
> > Can you provide some more details or a reference?  Google isn't giving me
> > anything useful.
> 
> A leak detector is a sensor like the raindrop detection modules, whose 
> resistance decreases as more of its surface is contacted by liquid. In this case, 
> for example, if half of the sensor's surface is in contact with a liquid, the 
> ADT7604 should, with an appropiate user-provided resistance-vs-coverage 
> table, report 50% coverage in the IIO channel.

And, AFAIU, depending on the coverage the resistance changes and that's
how we get into the indirect temperature variations?

- Nuno Sá

> 
> Thanks,
> Liviu
