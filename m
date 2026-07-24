Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14513F3280
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 14:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784903957; cv=none; b=MoIvr0EncqmYRxVV3E6b6WEONJrQ2L3BOYO+Iv6fH+5apJiivmaNeGnNIqLiLeUZH/nk8Z2V5fHv31MzWnhJCVsUwB1wFEbo0rQSpcB/dtJsKVAhz4AvInsiC/uiILV3FIrxvXroJRfUUk7d4AW+Sfo8MFrzIU4Yz9v/PngGqf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784903957; c=relaxed/simple;
	bh=qwH94DLIB7dhjexW2Ov73pc9+u+IGg0Yc9qPyosGQS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ku5wXdSSTWfZl+MUkdGcKe0URiJXNmIiS9X2McTTob7y5SAMcAhnoJgTz6XsKp6kC9Himka7BDP2Lhqzpn34118pM5o8fO3oNj9/wvyDHPxeA82yz8IL6VMRjRyzOn3uWOlcfSphdpsa3oDPAAlr1ecrGGD/nrN6HlN0pvO6zPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wg6klG1P; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wg6klG1P"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so177791e0c.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784903948; x=1785508748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T8TvgdhQY1bgvemL1xhDLy9Sz7Qig1A4ISSSjeskkls=;
        b=Wg6klG1PMBf0BowYfiFXTJ+Gtmf3KIjQTbM/4CqW0HuXAJv5BoiAqd9bHxWWeCvYTR
         qoipQQjviyRNHUaaU+Us+cPwDNszIr9w87XPbG3HNA9nx3jszBfiA3S03ODqGqLkAh6e
         oFfj1eUnaZiK2aT3hlcHfPDWn3o8hqQV9LJT8Nb6frSg2ot/A6VYPLzSEUkp/yFrNz+4
         Da0lMSAtFh6Q5FqzIUyvGtpyeiO1d5bdHQKr2EkhWZlPJ6hBh68667ormLDN6K6XUm4t
         fcEYEXYPusbEKwUr0giTcZY4POEUawhH1N+J6hVluj/k01LZf+0Ic3pWY0cCTw7zoBIk
         Z13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784903948; x=1785508748;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8TvgdhQY1bgvemL1xhDLy9Sz7Qig1A4ISSSjeskkls=;
        b=mHsIPVZj0+f4sm5KZkkRv6IgueyNfN8KRcZto0BUYkOH0h2xs/TPDttaFdXydTVgLW
         RMYANNOh9ykrGwTvQcuUy++NlqUQ/EdmfKABqZuL7RUkBvWEnuELS9A0gdvy3FKYXyQn
         FFLZ2GI6TVt3HbvqVwgEoMn8uYMSRaQ6Zhux0Vb/cNAKLFqnq2uZOYVnWYiFK8bN3G4C
         MiI/Q5A/rZM/p5112LQQzkAwrxaf2zGuVPLknAlmjGm6XPfPea/BImVVadsJ7M1UD5Wa
         a2UGzPLEaSMAKGCoEPpR7NcweIZB9tbw2N1Rjsfyp8fL1pSD2irFtrYDQDeGnwnnYyL4
         cGsQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSyARvCDZ755hU6reeg+a7Gmj2Ou0h5SRg9HCd2fB58kaWTlsiegoSE9zq9TcvRVDngvgkjQ6qqB4T@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj93MRLdO7ga4QUjBoXOy3UPaCHb+Hrvj5USkarRG8if36s5N1
	TFP9lnFA/ewEpvpFUlprPySpB8m8EN2UfqVnlmcbsxoGa9R5bHikGLuk
X-Gm-Gg: AR+sD11zhLnzfnLdDSWXASYpFCGwY9/qdLRCeJ32jsusUeszjQW8Clyfkb037d7djv9
	T0XeWoLBXxha7QdLr3Rt1VWpwDvaoEZGbf7WzE9Av5YwEVLne6fobuLgKyVVJZPyzYkPWeENv53
	Cx/lUq0HqMMuvSRFocNthI42eQ95yBZ+RRfBV1qRaEhk5yTpUX/pYBkasX+h2q0Z50VEyQ5FlKF
	m0KrZUfNa760UYoe+fckr/a2FHfkEUH/V/MupprodxHrCCHanFDmS4e/gWKU498aFeMt2VVUQoU
	JQXmhaVHayk9vsmXOd/AiQ4Bbq2YYjnBYDjSPid0ORBPeAnv40IYfxi4fGEN5Vwtc9j2s3DXPMv
	03Avcw4z9gJb7s6keEq8wQ4xE5tMmBPXDsL2578GtnNMEiBHjNW9GADE3z1rC0bySg90mCH677+
	Lrx+ktkHKuvw==
X-Received: by 2002:a05:6122:e1aa:b0:5a4:6680:64f0 with SMTP id 71dfb90a1353d-5c2da0434d8mr3538060e0c.4.1784903948539;
        Fri, 24 Jul 2026 07:39:08 -0700 (PDT)
Received: from localhost ([2804:30c:90d:6100:8a69:5cf5:f1f8:a1e1])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c2c654c9c3sm8815019e0c.18.2026.07.24.07.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 07:39:06 -0700 (PDT)
Date: Fri, 24 Jul 2026 11:40:11 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	marcelo.schmitt1@gmail.com
Subject: Re: [PATCH v8 2/5] iio: adc: ltc2378: Add support for LTC2378-20 and
 similar ADCs
Message-ID: <amN5Sw-EsciZCF1V@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1784835663.git.marcelo.schmitt@analog.com>
 <1c12e37f273d4f99916768e1a9b44dbae30f9d0c.1784835663.git.marcelo.schmitt@analog.com>
 <20260723200452.082871F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723200452.082871F00A3D@smtp.kernel.org>

On 07/23, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The IIO scale factor exported for the LTC2338-18 is incorrect due to an unaccounted internal resistor divider (missing 2.5x multiplier).
> --
> 
> --- Patch [2]: [PATCH v8 2/5] iio: adc: ltc2378: Add support for LTC2378-20 and similar ADCs ---
> commit 79bd7cc98e49057401d7fb8d26685b9092c4787e
> Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> 
> iio: adc: ltc2378: Add support for LTC2378-20 and similar ADCs
> 
> Support for LTC2378-20 and similar analog-to-digital converters.
> 
> > diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> > new file mode 100644
> > index 0000000000000..107388f870626
> > --- /dev/null
> > +++ b/drivers/iio/adc/ltc2378.c
> [ ... ]
> > +static const struct ltc2378_chip_info ltc2338_18_chip_info = {
> > +	.name = "ltc2338-18",
> > +	.internal_ref_uV = 2048000,
> > +	.chan = LTC2378_DIFF_CHANNEL(18),
> > +};
> 
> [Severity: Medium]
> Does this chip info need a field to indicate the scale multiplier?
> 
> The LTC2338-18 has an internal resistor divider which acts as a 2.5x multiplier,
> but this struct doesn't currently contain a way to specify it.

I guess it makes sense. Might split support for this specific part into a
separate patch to avoid it holding on the rest of the series in v9.
