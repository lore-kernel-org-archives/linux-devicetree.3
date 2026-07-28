Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2B43A9DB1
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 13:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785244290; cv=none; b=GyhCATPC0j7KfWvkK6OKWuTKpr/XSs1RhjLfLgiNTHvzQX1APAQefgkGH77v14Y32DL7Hp2NGPzoeA8cysvAye7uWLaf+aoJBvjDJT/OSA+JA6w4G8ffqxgHRsgvSD1HM6KSc+BeFnWEpkptqBnGVOteT2TnovZTWGmUD+eJHRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785244290; c=relaxed/simple;
	bh=ICU62a4M/EaMJi+11NC4QXk4bKTL6YCpSQRypY6kR9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FnhTHwqctGdokC+AmY1AAxFGdeI2elrTGlBL75dOiH/lHUUJa81Vbb+yTRyiQfM+KvL/GMw5A7ckjKovj1rXYh5pS6aEGEeRyZ1ZLU8I8YU1EnNTZUW3lTeXm/JLD2qumPV07a5FqF+NajQK/bYnZDUvfcmjEnH7fDqJbXfQKQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmsxC44x; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmsxC44x"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9696369925aso1197605241.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785244287; x=1785849087; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TyvQqlJVIFXzdizJw4kAZvTS+F6Y0W9n6wOXYzXOeDM=;
        b=OmsxC44xfwkeYbNGYw8ZoANC4hx2RUshwo7rrrx8U807e2iiymHw0DpqqS7fIxo9CB
         pthl7N3dKVcBuUFyARILcgAyPgIWJhVNmlSwzrBGf6dzvz+EVTWWBs/VyPRkTDfE0T90
         zq7+hJQQh5TNzqz7jh7trrfgSbDBOJFRbmGjtrGiX2moUaY1A9OAHyC+3q3IhXLuWYVl
         u0zG183RLS4iGusVEoxJhXwEtx27a64Nf8RUann6ZTY+955641o1U5i4zrAKv+umIDH5
         pzu/+7+IvnSXxJFvmwGeEWJqiVDAkpjSDcNuXl7qIE8/0Qbhdlw3VIxS4NgeA2WBIPiJ
         gI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244287; x=1785849087;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TyvQqlJVIFXzdizJw4kAZvTS+F6Y0W9n6wOXYzXOeDM=;
        b=Wi9+KKyOlgg6lIytXsHolqJtHAZBbGVrFii/AjPGOlEnYShNm3m8Cz+RQlf61QaWZz
         2tFnWdFpNYqA0rVGPvOcQgpTbS3v7k7Hb+n8PhCG+fYh+2mmxfu+yUIOgZrOc0ac03AJ
         /BTpl5E4fshqJM6quwWW1BqHoF1HzjnqlkZuVPiZ54ZlqB6z7nZ0Z2V5ofguE2bKRG4f
         QgvqBLVeIdCWajN+zLikRDHDEtI77GXMgeA1ZLi6WELFBy82RJmia3iA+a4/s2IGXu+I
         h+pU1grxwPAx5LaVSsN7hz48+0cbkN27ZhH9kjmzLpHDs5ktsBqxPNODo464ngeRW/RU
         LPEg==
X-Forwarded-Encrypted: i=1; AHgh+RpKGjCjoac0Z0wBB9VNQaeQA0mx17MeSUyCQKREs8lESHndf/u9V2fDEDRaH4AuTymjmMkBsaswJRlB@vger.kernel.org
X-Gm-Message-State: AOJu0YzLkf7nXkTX2FMTStk6KXRk20sy/5R40tOudPgjtL2h4EP969t2
	PhiatuJCO09JFdli2SL5uWT1oQ6iIv51dANfVPXJvY8qtVCBVr797cnw
X-Gm-Gg: AR+sD12YbnT75VlztWvLwGmZ16OFDBzzJGvLoeUzxm/rj6JYBf88b66KIAPv3wOh6g8
	2QB51s7I+cqfLFtx1VHqENzP4YYYaCqVFMjQLyRZ+iX5NChXavr4YE+0qf+qRRrO1Iwv7vqyZSV
	ga/5F8wIS9VK/6Z20OZsZ99SubLelEE7Miut533ljmfCTjJswl6WL7bw2mFGaoS1UcA7+iK9p7G
	430nGsA+q0FlYeY3UJIm2YXbeRn+MiOcXdoho0NAtawGct2Itc7xPpOo4UAwliSJDcYQ6iK2fud
	lyFQjUNkOwYXjY4VP3InqDHM6XuHiQ9Cb0II3B63+aOTFcjKiCYIz1GJ+daA4mwVTxvlYs2l3fD
	do8zOQzSMFay73aNFkrBINjWkxXnRLH5eeLdvpKPd8dEZMx++hTV2o3wa/xtknIVTsUJHnj1I1p
	OVSamIMQtJKHk=
X-Received: by 2002:a05:6102:3e85:b0:6d4:ba3e:bf97 with SMTP id ada2fe7eead31-7549fa597cbmr951669137.4.1785244287420;
        Tue, 28 Jul 2026 06:11:27 -0700 (PDT)
Received: from localhost ([2804:30c:2739:da00:1cf1:e457:fa41:ad98])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97774ce146csm7173731241.7.2026.07.28.06.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:11:26 -0700 (PDT)
Date: Tue, 28 Jul 2026 10:12:34 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, conor+dt@kernel.org,
	robh@kernel.org, devicetree@vger.kernel.org,
	marcelo.schmitt1@gmail.com
Subject: Re: [PATCH v9 5/6] iio: adc: ltc2378: Add support for LTC2338-18
Message-ID: <amiqwmIHsgO7v8zC@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1785186980.git.marcelo.schmitt@analog.com>
 <39f2ff86cf736ff97286d6451fcc45fdba6732f9.1785186980.git.marcelo.schmitt@analog.com>
 <20260727214022.C81191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260727214022.C81191F000E9@smtp.kernel.org>

On 07/27, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Declaring a variable immediately after a switch case label without a block statement causes a compilation error.
> --
> 
> --- Patch [5]: [PATCH v9 5/6] iio: adc: ltc2378: Add support for LTC2338-18 ---
> commit 29728b1d34f34b2970657e2d83536de22940ee2e
> Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> 
> iio: adc: ltc2378: Add support for LTC2338-18
> 
> This commit adds support for the LTC2338-18 ADC to the existing ltc2378
> driver. It extends the driver to handle the internal voltage reference and
> input signal attenuation specific to this part.
> 
> > diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> > --- a/drivers/iio/adc/ltc2378.c
> > +++ b/drivers/iio/adc/ltc2378.c
> 
> [ ... ]
> 
> > @@ -383,7 +395,10 @@ static int ltc2378_read_raw(struct iio_dev *indio_dev,
> >  		return IIO_VAL_INT;
> >  	}
> >  	case IIO_CHAN_INFO_SCALE:
> > +		struct u32_fract fract = st->info->internal_div;
> 
> [Severity: Low]
> Does this declaration cause a build error?
No, at least not when I built with clang/llvm-22.

> Declaring a variable immediately
> after a switch case label without a block statement is not a valid statement
> in C and usually causes a compiler error. Could this case be wrapped in a
> block to scope the variable, or the declaration be moved to the top of the
> function?
> 
> >  		*val = st->ref_uV / MILLI;
> > +		if (fract.numerator && fract.denominator)
> > +			*val = mult_frac(*val, fract.numerator, fract.denominator);
> >  		/*
> >  		 * For all LTC2378-like devices, the amount of bits that express
> >  		 * voltage magnitude depend on the polarity / output code format:
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1785186980.git.marcelo.schmitt@analog.com?part=5
