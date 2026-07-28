Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66C1435517
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 13:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243951; cv=none; b=Bl/4MX8aLtSFzWh2M1yWua9MVhEoTLG+AehotCS2FSk+JNDKb9uU7LVlr4tPRFviDoS3vXvZlxYkymh703i2O34N0G1GkrK1wyR0U/inlOteYQrHini1w0Kr3cBlCQGavAZbl7ZXpQutAhCkifFsMeUrzQhESwNSz+FwGhX1RTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243951; c=relaxed/simple;
	bh=r5WSFBmkwljdLSsc/dzbyuBziEidVcP84APtfukq1sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ld8q8CZPLSeN9OFe4OsXn4W4LD7LvHKo4bTdGXSeezOmKYaSknFyCojewVeTufeV71Q7fw1PO7xV+hsMcjzmFhdzaQnNPQkaIGZLIeuAouU8mZM5gsqsEccRPS/3DZkozZLwoqaBLJNURQtwPhYbyt+apXgz3/z8MJqkOSiGwiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8PhTYo5; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8PhTYo5"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-456395f4e7bso2360343fac.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785243948; x=1785848748; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YbV6e6mV/G6JXllO00Yh3iiMBiWEbF5BD3K0uJ59MbQ=;
        b=L8PhTYo5UeFpJ9ul5GE/W8USpc3+oHRIx/CZnWlLoaYDGFnwuC4fgIg04QtSFN+W6q
         4Bv5rffa4u59wpmLtLz8mERN6gjZBCbxX81CHLHbEzq7JQjnOgzEMMsAphEAaRi1xDLH
         dQQCgD0loDXyLuo4fNbQ2jI6R0KJRe6FRUlsZmDVctUT+wpWXiH+n6/L10l2YHIvqu3b
         NcqSf2eeAIjNG3ss6EWGBTUqcQxIZGud25P+r05Zgd7LBlgXCOmD2lqbL4pxhVFCi9bj
         goOXlCNKGxGyJLwkOzzbudQR9i+ezNwkV5NNSVz/1KTrbkgfGX/KIn00Xif63mOka+c1
         vMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785243948; x=1785848748;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YbV6e6mV/G6JXllO00Yh3iiMBiWEbF5BD3K0uJ59MbQ=;
        b=c0rourayrSliXQTQuHQBeRn0xo+1f7ZJ3beCqMenRAtJ1Vlk8wFRv9s4uEll0v0TXE
         T00OjnKqzLduiIEFjh+d0cMdPuoG2lpqxNiojbtlqr/RojK1dhKvTBaWMUYoKgF+Bysz
         2tDBVnVDFXFDoDj23MMzc/XFPc2eh9ok7ANlfUnYFW84jAvROKgBapiHLaCHi+Q6726p
         24Jnr/HUrXURU1lxy/2k4SASm8EGQgy8xokXKX9OPn0DC7rR0ksjPABexrsHQOuollCR
         hSvMQy4ZpxLZZoPC4cevNRJAD0rRzffuj77mxAq8jCTJiuygTbY/kxm7EHekTLqyEAoj
         AXTw==
X-Forwarded-Encrypted: i=1; AHgh+RqnIJwh58mq7/shsd8A25Vk4Aw+lPq1x/+17iC5BmaCDO3K+xKjyqKGc7JXLhOD3KRfLBC32NrnMzfY@vger.kernel.org
X-Gm-Message-State: AOJu0YwyIEhixYcZk0BY06I1S0tS9zL8s/6H+2GDCpq/CERC5Q7m3rt6
	ym91cel9apHlASHIknE5kzgESm5zMrYpw1yN5NTV+1ssPkF78j8pZbQE
X-Gm-Gg: AR+sD1054UOEJFy39Zhylvc294jcRgMxbXS0Aw54J9ZR3iAfp+j7UWt/6v6wHy0FktO
	x5LOnMV4zzVtOsj/BdPaf5kQyUPpl1lhAuMX5Tc+gl8zMd0v+d4vYf4DmKiLJNnJoHgMoldcx8W
	bIlfzfH32ZDbYl+a9bAPNJGPFwshNkSvQa5C2D7ielNoLJXJBdzZ8LqdOOsGQbnjrYHuYsUaOmv
	eW8gkeNxaCJQZjELDwN4lckuQI/zmofKJIf1OA4u1MS9k+mSjWxyRu8mvEpEEniXDXRdjPze0Ls
	laOObndS+43iJw2D+ZMC//Kil/NhSjPVtlUFfSQ6RXwMQ6xzzFtxGMocD7srOZVVK3297E27JfZ
	lIYTGTtYhoBXKu1vmjHRuHRKwM/Bc6cUeyRO/K8l0Q+lnCsmi2H/N6D5pnwz45ZGdhImDCn1Hv3
	6jWKEsg8OAN/M=
X-Received: by 2002:a05:6808:14d4:b0:49b:c387:36c5 with SMTP id 5614622812f47-4ad5b9c0d7emr1443628b6e.17.1785243948253;
        Tue, 28 Jul 2026 06:05:48 -0700 (PDT)
Received: from localhost ([2804:30c:2739:da00:1cf1:e457:fa41:ad98])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ab5d917dcasm8030680b6e.16.2026.07.28.06.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:05:47 -0700 (PDT)
Date: Tue, 28 Jul 2026 10:06:53 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, conor+dt@kernel.org,
	robh@kernel.org, devicetree@vger.kernel.org,
	marcelo.schmitt1@gmail.com
Subject: Re: [PATCH v9 2/6] iio: adc: ltc2378: Add support for LTC2378-20 and
 similar ADCs
Message-ID: <amipbdc0tup9x3e2@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1785186980.git.marcelo.schmitt@analog.com>
 <6cf0b5541cce4816877ebe754ef7fc2f0e30039c.1785186980.git.marcelo.schmitt@analog.com>
 <20260727214213.D377F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260727214213.D377F1F000E9@smtp.kernel.org>

On 07/27, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Holding CNV high during SPI transfer breaks 3-wire SPI wiring mode.
> --
> 
> --- Patch [2]: [PATCH v9 2/6] iio: adc: ltc2378: Add support for LTC2378-20 and similar ADCs ---
> commit 4d4231cee28f9742280dd61ed84f85cf3b4e0386
> Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> 
> iio: adc: ltc2378: Add support for LTC2378-20 and similar ADCs
> 
> This commit adds support for the Analog Devices LTC2378-20 and similar
> analog-to-digital converters.
> 
> > diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/drivers/iio/adc/ltc2378.c
> [ ... ]
> > +static int ltc2378_convert_and_acquire(struct ltc2378_state *st)
> > +{
> > +	int ret;
> > +
> > +	/* Cause a rising edge of CNV to initiate a new ADC conversion */
> > +	gpiod_set_value_cansleep(st->cnv_gpio, 1);
> > +	fsleep(LTC2378_MAX_DATA_WAIT_US);
> > +	ret = spi_sync_transfer(st->spi, &st->xfer, 1);
> 
> [Severity: High]
> Does holding CNV high during the SPI transfer break 3-wire SPI wiring mode?
> In 3-wire mode (where SDI is tied to GND), the SDO pin of the ADC remains in
> a high-impedance state as long as the CNV pin is held high.
No.

> 
> Since the CNV pin remains high throughout the SPI transfer, could the SPI
> controller clock in garbage data from a floating bus?
No. That would only happen if the controller runs more SCLKs than the amount of
precision/resolution bits (non-offload use case) but in those cases we right
shift by _storage_bits - _real_bits, discarding any potential unwanted noise.

> 
> Would lowering CNV after the fsleep() wait and before calling
> spi_sync_transfer() correctly enable SDO for 3-wire mode while remaining
> compatible with 4-wire (CS) mode?
These devices don't have a CS pin. SDI is tied to GND in the currently supported
wiring configuration (single device normal mode). There is no SPI 4-wire mode.

> 
> > +	gpiod_set_value_cansleep(st->cnv_gpio, 0);
> > +
> > +	return ret;
> > +}
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1785186980.git.marcelo.schmitt@analog.com?part=2
