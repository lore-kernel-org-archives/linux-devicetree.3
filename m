Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB1D36CDF8
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255499; cv=none; b=oRlcd9pHqO1DqGBIWiSGCyzBxeIdQrnaBKynUh910G1xSQzWiYZFosgLvk4FcS/OogYNc6oGmz0jWp2RU18MJU2P8Wae9Oa0TOE5XPGVCzRPu4kXNN30AFs7F+OD/s4zD0ZgV+lIlZLd2UlqwbrdwCU+uIKqDWtnlUOGcb/Puko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255499; c=relaxed/simple;
	bh=zGwXx7r0raUE81oCn824BrKeKDOdBBGsvz4O9QbLsMc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3rM1Eg2P6GYU0YkdePGLaCbqNsQybr3xwfUL3jiDGP4nXqFWsBKMpIrxvfNn7nhZuLi49cdtsNd3dDxEH9Yfc4vCuRdguZrWCp0HgRS/CyKJL2E+QXNXTIYy1TMXssnf7ZcFxEn670sqO0OWeCIww8gPlKOEcsXG1642QEQYHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rFCU/nUr; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rFCU/nUr"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68ced97b6eeso1218533a12.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781255494; x=1781860294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jI8LnQZv8N81B+lAF6GsOhfvywQIVQpCH2REI+wbnnY=;
        b=rFCU/nUrlZTsDQVwtFOdGSCtPNdRlxqx0e0N9GR0nqkKMn/VjCJOzDgIlBglbnc1ZC
         HpZsSNccs4H8QfcEHsPwczRJukViMCg9ccMeZyICXFAkw4wvWiDVytyHtLqMQNtsDLVl
         72qD473YJzPiUJe7mXlsoSfl2VkyO7UCSA13Rnhm0i/eeXgzFzvbQHwDPopWi6jk/Nmv
         mmFZl2L3n4q52O+JYRVBNUIaYvLuzypO7q98OJeLjiDZWa4TtP147zknsU/A67h5W3Qm
         N3coJmJ/QZhwX3pnOIbHM4dlJ18YrjYSNh8CTvMKysjKawoflZhiXotbo1/jQq0viLWD
         1gtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255494; x=1781860294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jI8LnQZv8N81B+lAF6GsOhfvywQIVQpCH2REI+wbnnY=;
        b=c5UJivnL4K0fsxkfY90zTF+3eoyYKeX5MCRBgLUm9mtiyJd56DqgHb7GyTU00Md6xO
         AxsN4x+Yhm7zPDakL3NM8Ijh7YrKsL/CXNe7F9Cl38sOnZUikKfA+SmU3NN/zEvYBWFY
         iy8ntOyXlhhJSZQInvx6iXpqRxg7MR8GVGo6k7KSJHHryCq8O8z2wKfp7fbbgzjcNlIB
         nOEN41DIt2qChPYHn1wSs031p/Zs+ISZDk+ZdifuZAfsT+t3RJrSlVhyRjHQBK91dQIt
         eOfsGzCRgKjgUS6kCKyT81+JHaWs8BNClO9FvnOn1uWzILV+HFE3YTlmPqHaYsUPs9ZW
         Cx6A==
X-Forwarded-Encrypted: i=1; AFNElJ+Dxw6ZhVPLGdpJInTIYoEC19PAJDqmYUOqHvQQnqx3QDzaYVb43SRJOmj6IrJapBn1Gk3L7G7bos1E@vger.kernel.org
X-Gm-Message-State: AOJu0YzF8mbNR+FuuFByAQQG96Umrxi+9R2hlWojQIUWvTkweBLRBoGO
	l7NO6MFeDfhmbn5fjK4an6ssT1ZI2qENmYbN+4VyWXMfkwUvNxTcVg/E
X-Gm-Gg: Acq92OGNA/af1yZh829QIGdnmXhG8EBq3uLq71KIwsaF9AC+rLr+4oxGXfpl4nrc73d
	rRGWfSk2zKPUywvMkJfwHVHq2zvjihFlYYBWD5ZFkgh3GzGsNWlraLg5tAJjT2jQ8i1jTyDXRAe
	oQ7OgvBJ9WwlszDlo2llhWsR2J3ANHVyENnTr/cit3yG3ieoN289mkeAGa24I67WrjwMrU4TzMM
	GNupNVd3D+UGoboUOljTDoiDmFSMHG51eTWpJSyXzS9jYkNriKQ27QPuqn8IGzzVTGCtn6NgrHa
	ScJWUi/31hqHimFQdi+f06oyzgd0qgT7DO6q0ZfF/B9k2BMy9Xa301dSfzNH5VI0SLGr+/MBcqD
	YPbxkyUf4XujDUCcMSfTc0eIM3LduS/hxhwCJCx9zv9bi8AoLyzZHrPbpG9674q7iou1P+FbrsC
	u1iTX727/Vfqg5eSMCDmekKEW9qfrX6mwm5RPBMMUokEjanXAIa5HoILZeHe9bZ8PBJOH78P9fN
	fPbaHGvBLUOtDOTDCbarSwtEZllzjxZeg2DS3M=
X-Received: by 2002:a05:6402:5d0:b0:67b:cd1f:9cc1 with SMTP id 4fb4d7f45d1cf-693784eab8cmr881007a12.6.1781255493455;
        Fri, 12 Jun 2026 02:11:33 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937938a3dbsm425280a12.16.2026.06.12.02.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:11:32 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 12 Jun 2026 10:11:25 +0100
To: Wadim Mueller <wafgo01@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Maxwell Doose <m32285159@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Marcelo Schmitt <marcelo.schmitt1@gmail.com>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Subject: Re: [PATCH v4 3/4] iio: core: add IIO_VAL_DECIMAL64_FEMTO format type
Message-ID: <5zznk6hw5snapkpyftxqmmhqd4ih6y7it7v7yrnhgjbc5jk2ok@7bwn4xst5iwz>
References: <20260611132700.671322-1-wafgo01@gmail.com>
 <20260611132700.671322-4-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611132700.671322-4-wafgo01@gmail.com>

On 11/06/26 15:26, Wadim Mueller wrote:
> Extend the IIO_VAL_DECIMAL64_* family with a femto-scaled variant
> (scale 15), following the existing MILLI/MICRO/NANO/PICO pattern. Both
> the read formatting path in __iio_format_value() and the write parsing
> path in iio_write_channel_info() (via kstrtodec64()) already derive
> their scale from "type - IIO_VAL_DECIMAL64_BASE", so the new type only
> needs to be added to the respective switch cases.
> 
> This is needed by drivers reporting very small SI quantities where the
> existing pico scale loses precision. For example the Sensirion SLF3S
> liquid flow sensor reports its volume-flow scale in m^3/s, where the
> SLF3S-0600F scale is ~1.667e-12 m^3/s: at pico scale only a single
> significant digit survives, whereas femto scale preserves the full
> sensor resolution.
> 
> Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
> ---

Reviewed-by: Rodrigo Alencar <rodrigo.alencar@analog.com>

>  drivers/iio/industrialio-core.c | 2 ++
>  include/linux/iio/types.h       | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> index 571b8ba4e..685661cd8 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -713,6 +713,7 @@ static ssize_t __iio_format_value(char *buf, size_t offset, unsigned int type,
>  	case IIO_VAL_DECIMAL64_MICRO:
>  	case IIO_VAL_DECIMAL64_NANO:
>  	case IIO_VAL_DECIMAL64_PICO:
> +	case IIO_VAL_DECIMAL64_FEMTO:
>  	{
>  		int scale = type - IIO_VAL_DECIMAL64_BASE;
>  		s64 frac;
> @@ -1030,6 +1031,7 @@ static ssize_t iio_write_channel_info(struct device *dev,
>  		case IIO_VAL_DECIMAL64_MICRO:
>  		case IIO_VAL_DECIMAL64_NANO:
>  		case IIO_VAL_DECIMAL64_PICO:
> +		case IIO_VAL_DECIMAL64_FEMTO:
>  			dec_scale = type - IIO_VAL_DECIMAL64_BASE;
>  			fallthrough;
>  		case IIO_VAL_INT_64:
> diff --git a/include/linux/iio/types.h b/include/linux/iio/types.h
> index 3b8a2d82f..1f2f03d5d 100644
> --- a/include/linux/iio/types.h
> +++ b/include/linux/iio/types.h
> @@ -41,6 +41,7 @@ enum iio_event_info {
>  #define IIO_VAL_DECIMAL64_MICRO		(IIO_VAL_DECIMAL64_BASE + 6)
>  #define IIO_VAL_DECIMAL64_NANO		(IIO_VAL_DECIMAL64_BASE + 9)
>  #define IIO_VAL_DECIMAL64_PICO		(IIO_VAL_DECIMAL64_BASE + 12)
> +#define IIO_VAL_DECIMAL64_FEMTO		(IIO_VAL_DECIMAL64_BASE + 15)
>  
>  static inline s64 iio_val_s64_compose(s32 val0, s32 val1)
>  {
> -- 
> 2.52.0
> 
