Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF232690EC
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 15:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788102162; cv=none; b=DMK1vail4XPPEWKo2uRnxB5xR9bI1Erdix0pENCsbQWRgzTrILJ9ql7ynvdiBWHtijdDa1bd8L0UfKd106E827sVWl5QMPoHoASjogZ6dYnL0DZ3Y8c2mtoUQkcZ4aIuWqJmOgamxDCq4CDZadbWAnaV5dzP5MkxLPH0jQD97tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788102162; c=relaxed/simple;
	bh=8b5Cu/WzFELCN7I99cyIzKY4tM/BIzLp/hfo1qCjLvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFf/9QjjFDyZMbV89TihrpnQ8sW2i0Hsoi926WAnbBTrlfY9c4F5ocdSqjDbDk3ypiXXu8EoRBYp5A2bOhNPXHX4tHREjRdJSb789bPPT/SCqgFp81ClEBXtV9lkepek5vkrDNvHlHhzpfIaS0iLoYaAK1c4nVA6ZggHjEhDf+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCWzWu54; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCWzWu54"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8487214ad2bso3485053b3a.1
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788102161; x=1788706961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4YMamzAVSqXj8/xPRdP9NGRtFgjUVXMOQM5Ll4+vfHg=;
        b=TCWzWu54thRUsTOA0kgj/XnMst9KtjAFE7JjcnqLIRcgcXbSIdC7MynZYvLMDRCdp3
         yQ23gZr1Nd/pJZfBDLOja8A3jtPxDFmwmAAuE+oN7lhdApXPNzsCJ1/qjhaRPeZjhm8q
         TVV+n2Z3KMjBXjapwFRiBbOUg32UlMTTD+3rDj6yz4bykW+9DFm6FtoTOJBLeK4tJh++
         JC1//hEIThLY6LAfTHTFNygzFV/UobPBLXPFku7/0hlsqiArFx2NRhZ1GwQr8GLV/rND
         LoRnpY16gdo1H51YJZj03mF5qEslyFb/Ya+H+y2HaFghAEqBRpnwOK4zYMGQ5scdr8/C
         iKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788102161; x=1788706961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4YMamzAVSqXj8/xPRdP9NGRtFgjUVXMOQM5Ll4+vfHg=;
        b=oyrr2etChuGBgfkwECYdUc8O29TY/o/Y10hjLHqGFeutbRVWZ4dPAFgzYz7bdLuc96
         so1bih2Ah+VRMQfs+6U3bkXJkfU30avKxUUyDc39VJetTwFQy7FUoVlK2GcTf8qikiLf
         bGmgdftCN9hzY9CPOs6gQINIox8nzyD5FuHMgzxUCOBaS4VcdhI7aL/Iy+6k7pHPbQRX
         X52LuwjSTXsBwn/RNL2pj9ycZcGsevlZAaJX/H8R9a0C4k3ZcorWYV1Hzclwi29p8cPJ
         zZqMQXpfCYJDbzPGjTahw1xU/SiNxjukjFghPL4nOA7Aot9pTNzXHvYnXXmh0M42gKin
         +6tw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7JeixNL9YrFtKWB9qXe5d7AASa1JAqjr7H03tX5QywIgnAz5tYhJ9iWEwl4x5kcSFjsgRRFslqHch@vger.kernel.org
X-Gm-Message-State: AFuF++nMnfj1vutslzAkV08coHRdzHvOH/7Nx9d/k0w+ZUvNTRAdEVOM
	5DKIP+Kej3qP5ivdnYKd9EtyLbtjNk33z7VSSuWIt9OFI3Ntijwu8btO
X-Gm-Gg: AR+sD10boZqooM4EkVTo8r3zsBU/c+ZEfs2hbeDcQ8vBrG0Jpl3rqnbvsdK/nnVeQR+
	TrlGrQCCygGFfYiPE4g3Ua5lzfbD7iovzTdscARhxXTov7/VMTGNfOL7SeQi0Q12nMdNrmz4EdX
	HmYqYMfRDR9k+qNM7+/P/UY9GG5ukbhrCmSER/eOgB5kN5wveM96r0cc6aPt6CpIhBlwSLYwggc
	hgrxjaHhMRDW/jK4A+DHgKejtY50JiUjuugLWjGYmq2q/KOyugUGS5PqZPO/ehzIcr/ek2vr2uj
	SGKBZ5vhcjsAjZg9T0dj0n4vYGVpKYM8CQpxsNbom/9dHKKuSBUoVOdfneWjYv2HX8EGLwh+tL9
	ykpDpaKdjb6YLfGGCWgUI7untFQVRFKe5Af6K3QmCLOAWdevIuCJC6Ar6UnYIuH0mbDJsiLL1rT
	aAGbLAwvHLy3H4xPuKulXWLbbOhgQMVnZv9HSy950kG6q0/whQ2AUNU5wBApILUwPJ3hIr
X-Received: by 2002:a05:6a21:496:b0:3c4:1916:9d40 with SMTP id adf61e73a8af0-3d2672043dfmr35677104637.12.1788102160582;
        Sun, 30 Aug 2026 08:02:40 -0700 (PDT)
Received: from localhost ([2804:30c:97d:e800:9454:1179:18df:ab33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm31939929c88.4.2026.08.30.08.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 08:02:39 -0700 (PDT)
Date: Sun, 30 Aug 2026 12:03:29 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH v2 5/5] iio: light: stk3310: support the Sensortek
 STK36C61
Message-ID: <apRGQVfPKWHvE2Ct@debian-BULLSEYE-live-builder-AMD64>
References: <20260826175409.326131-1-jorijnvdgraaf@catcrafts.net>
 <20260826175409.326131-6-jorijnvdgraaf@catcrafts.net>
 <apEMCqQXyj1tAMoP@debian-BULLSEYE-live-builder-AMD64>
 <20260828154705.11962-1-jorijnvdgraaf@catcrafts.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828154705.11962-1-jorijnvdgraaf@catcrafts.net>

On 08/28, Jorijn van der Graaf wrote:
> On Fri, Aug 28, 2026 at 01:18:18AM -0300, Marcelo Schmitt wrote:
> > > @@ -417,10 +459,10 @@ static int stk3310_read_raw(struct iio_dev *indio_dev,
> > >  		mutex_unlock(&data->lock);
> > >  		return IIO_VAL_INT;
> > >  	case IIO_CHAN_INFO_INT_TIME:
> > > -		if (chan->type == IIO_LIGHT)
> > > -			ret = regmap_field_read(data->reg_als_it, &index);
> > > -		else
> > > +		if (chan->type == IIO_PROXIMITY)
> > >  			ret = regmap_field_read(data->reg_ps_it, &index);
> > > +		else
> > > +			ret = regmap_field_read(data->reg_als_it, &index);
> > The above seems unnecessary. Why changing the comparison from IIO_LIGHT to IIO_PROXIMITY?
> > After the proposed update we would have the integration time for both light and
> > intensity channels being read from the same register field?
> 
> These arms now see three channel types instead of two, so the two-way
> branch has to put the intensity channels on one side or the other:
> keyed on IIO_LIGHT they would fall into the else and read or write the
> proximity fields. Proximity is the odd one out - its engine has its
> own integration-time and gain fields - so the comparison keys on it
> (the write_raw arms route identically, hence the same change there).
> 
> And yes, light and intensity read the same field: the chip measures
> the colour channels in the same engine run as the ALS data, over the
> ALS integration time. Stepping that field through the driver doubles
> the ALS count and all four colour counts together (measured on the
> device: ALS 30/59/120 across three settings, C 83/167/334, R/G/B
> likewise).

Ah, so both STK3310 and STK36C61 have register 0x02 for integration time and
gain configurations that applies for all light/color channels. I think changing
to compare with IIO_PROXIMITY makes sense then.

Having a closer look at the data sheet I found for STK36C61, I noticed registers
0x13 and 0x14 are not listed. Does the newer part has ambient light sensing
besides the clear channel?


With best regards,
Marcelo
