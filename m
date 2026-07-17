Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B8E3CB543
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 06:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271102; cv=none; b=KR1jio7qnGUkhwuuD0MKmGC+G3m8/OvdjnscixSedrorPNSELDoHZYW9hQc/QlRq2K+FRbNYH4pimrNO/FIMBU/UpPpHogmCNwndbPy6yspQpqyKykGKG36HXWgKhVBEppVwBCqTSuRhddFUTVweEuYTwpV9vnB5efQ/kC+UKtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271102; c=relaxed/simple;
	bh=lcV4Pb2mh+fAEOpbU3PIl3OXS7WicGJvoP7zaEWxSq8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aglZ7ZlfH9bQ236wzsf1Bjih/kXfL9EO2CNPVBhFwrz9A5Bmq8KrPTfN97KLfVu3q61vQoo6OU+Ku52eUjYptyaTqCYvBf8IYhGXTMm30wVWl2F/k9EIQVNnudwMIDODHtFzkAdqoj0SSl9STMn0S82dEtK6d4m7wDuCRlHGjaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcaLHxgy; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcaLHxgy"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4629051c9d1so2461277f8f.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 23:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271099; x=1784875899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9UY5ZnEeTRAKjye0Gd13pSYVq2II1CClrTvBqjd8pp4=;
        b=XcaLHxgyidntXUvzNa1qRyxKEE4O0AG8smjjjp+uh2vrhFVwGt9uFYDNAesjiQjwNy
         WpVS+waPgleDiTb5umUv4zr8E/uQK+n4XiwcJtPMf2+MNjTm1/ZXxZEXCHj4xHPPW1Em
         cvDcwF4E677cAilZ8zd9mWbe6TOjryl/SkyDAR6X4GFwHHuT5WKFYtAXWfRtAo6E6SzN
         XcaOh5vixp/Q/i/qNil5JhK6Rhi6k7hyEpt66O1AyU8fWWUrYWDjZnR4qc/MLpvoRhdh
         nLXq63ofwvfPFo3e6fMEbtRZmfWDLOzShi0wF+YngyJDUO7pzbvde8Pim/W+GF7jn1P1
         mKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271099; x=1784875899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9UY5ZnEeTRAKjye0Gd13pSYVq2II1CClrTvBqjd8pp4=;
        b=dmlnXngQbIL7m9S2P7ROL43Tvfv3o408FT820foCyoFGePjGQjbCgQU3K+Uug7O0Be
         KC5K+WUsucoqH9gkFQL4dMEHwe3BUrgITQGVObnfsRdfBgjZ6ovYLtMIlDvJ7GCGlGtY
         fRYdtRpH0N/ym7jfgUamy22Q2S7OmOZEOnxsE2Z6Kx9OeaZSY4USaRDkRK39fB32SEIw
         WcYWH8S+n/VeVAXYTxYoohqyPl6e5uiyWGzYdpH91cntCagdj4ICW1Pbb2uGco0Yqvxm
         rYyHM9jS/oRB94/zZ8iFGb4FRXZMfCqckb1SK0R3RbvK8HATGVqW6NdUTQjiLRLYvnJe
         844A==
X-Forwarded-Encrypted: i=1; AHgh+RqqQk9IuQypIeRSw+6wUmRdOsfzuI2qAp4cmLDdqHFbrqT+xk3ung3fc7jVijZXcnI37045s+ngLGZw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+qFXd4E/bpyNz+ltmux25Wl5cX3LwbiLYeUQjM9BPJs9JFD0W
	MzFPmCr/EQLX0WyESMW2CDt9rtKbse0eGmvRfMO0Et3gwAU5rJ/ogDAJ
X-Gm-Gg: AfdE7clYnGGNMK0APD5cPZzBCwwqjzPJ2DFoo5DugMz3PKCV8q9RAGuvnz7fe0+8zPw
	9jMzF1Nzir99AE7Ef/V/Y0tu41f08n+zvbrudoy+Ruw+Fmtm/gulIapJpyLu6IXKKDf9n+oa6Rd
	10cBTdzntNWIoLBKpAUT7oNhDDK6Byp3PxmJ7Gu7EtmvupIagQMZI1KUt64gV08ZTinyO/iURZ/
	MUz9WFzQNnaEOID/Eom/EabD8tcXsC9Znp0RN+iAGM/EuTup4JDJxnMPjrmLBUY+lVD/WSI9dAz
	Y65UKmnUillKMS6tGkUPGkBhpJr41OnYvul19hJOXImVljdh/+f4VOj2uR0yfVfklxTvPETaA98
	L50RBtQ481gqJBN+R4eNz4z/HJe50zOrJcyclj2zAVG6ugLpNC6qopPeuesob5gyXvP/LLp++sm
	y1TZJkhe01WVHXKUojYRzecXYB454eLCDCOiLQvs16ZRevyoDhwfvudnPQJu2fOFwywxc0TmRo0
	O3Pxg==
X-Received: by 2002:a05:6000:4b14:b0:47e:aa3f:f822 with SMTP id ffacd0b85a97d-47f6233be35mr1797439f8f.53.1784271098535;
        Thu, 16 Jul 2026 23:51:38 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49acesm1136427f8f.6.2026.07.16.23.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:51:37 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Fri, 17 Jul 2026 07:51:35 +0100
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Michael Auchter <michael.auchter@ni.com>, linux@analog.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/8] iio: dac: ad5686: missing NULL check on match data
Message-ID: <ondynh4kmchzugk2l24klamrcaje3qxnhgiks7gnc46wwwvo35@hysk2zaimb2e>
References: <20260716-ad5686-new-features-v8-0-ebb0051af5e5@analog.com>
 <20260716-ad5686-new-features-v8-2-ebb0051af5e5@analog.com>
 <alkmAcDvSXr_COc_@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alkmAcDvSXr_COc_@ashevche-desk.local>

On 16/07/26 21:42, Andy Shevchenko wrote:
> On Thu, Jul 16, 2026 at 01:14:18PM +0100, Rodrigo Alencar via B4 Relay wrote:
> 
> > Verify that chip_info pointer is not NULL. If a user binds the driver
> > using driver_override via sysfs with a device name not present in the
> > id_table or of_match_table, match data will be NULL.
> 
> ...
> 
> >  	struct iio_dev *indio_dev;
> >  	int ret, i;
> 
> 
> Move an assignment here as well.
> 
> 	chip_info = ...

assignment? this is an input param validation

> 
> > +	if (!chip_info)
> > +		return -ENODEV;

-- 
Kind regards,

Rodrigo Alencar
