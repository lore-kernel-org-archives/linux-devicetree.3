Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC7F16A956
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 16:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785686853; cv=none; b=ZTQAFJwMcDkM+gRl4VnWBbkZ/CyI9dwUihPp7mjyqUJs+/Q2BON25GLoc+QXVCIJDMAzcDpWdFCad4Qr/WsNSz5dylgZ89cuucGbuGx9gHqkncFk7mo0wBqJts8h2OffykCrErMgWJwJB8pNDEB/Qvfb/H5Uc0AFGUHzxOgXc3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785686853; c=relaxed/simple;
	bh=UBPdsCxr/JCnW5FBHSIVkwAzSjCcMNbdBUUw+0OCw/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eytwA5+SIhjksS+KGfdL6/6pZAhKstqqjFP72jLn+24SI35zx7DqI2vcpwYjaiy3LLT+pSz3tOX87s0dGnMi5TPZUN//4tGerExxBGDuJSqSe/9HLfWRl6IiCWYMy0PhNUlY6EsAnhZcG8C7rE9z9gt2mur4eTePwzkG3NpQnB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Vzbwhr8T; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Vzbwhr8T"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6ae4aff94c2so696746eaf.3
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 09:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785686850; x=1786291650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wcLf3H2Vtv+WaWlh5trUkd6eQsIi/+7/uByN3DGgnMg=;
        b=Vzbwhr8Ts+KmiwB718XcEa1f1U1b9E8xPGthUGKKWYfT1dHAVxSgB6UPUPzlNjvAW9
         HLY2lx5cKF9W1Gt4Gmgf/zoproHdw0ZqMjFfvzj1zhSUmXjFH6Rj5QXOVnbVoemxm21X
         R1FmKvhaKD3nWvtRQ707L8HIVj8KSPfGxw64e7ZQ5VfpLo8wsZ4wtWIrrHx/d43VyWs6
         CVOQWCE/6YRTfRVrzjv5FlQXjmZ7SG6IzFK3TLiQu0gVg24vBhbJq0GoFuTj2w1MSb5L
         OSGf4f0hPqJ0tdI4Qnsy4h5H5f0JWvfaDbotONkqiztvMNILsVd6EoAkOXrWpKyNW3Xi
         gn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785686850; x=1786291650;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wcLf3H2Vtv+WaWlh5trUkd6eQsIi/+7/uByN3DGgnMg=;
        b=qzJeGJI0UOJN/eaE/i4T/EEwmqVoeuyCkMz2u07mJd44E3V5neTsYSerPFcNyVhqas
         oru02UNIM71BRSamk4PmRwqmcttNzziKeSR7bEf5kHWqmMpuiO0ZJntOI8wGXDZqCJHW
         OXxKB29/FOu0/16Bs0SlpknpC4k+RI27emwZZgvPxDc9IVf3CSvTjuT/uMIsLqmHfKc0
         s0GUnscUKhGchGRm3ojq3aMD12qcPHa/xblCOfNj9Ou86W/HEn+0yGXL8A6RvtYvVoYc
         Fx6galJhw8MBAdUE1edwyEYPP8dMb32CnWupsY212oyTr4FkKaRL+aXwh4lz2RRehQDw
         X+Ew==
X-Forwarded-Encrypted: i=1; AHgh+RqIVg14M7vPi9uwrl7rUFUY9mhGzghYLv/suDhvgCFouOC+H0YnAlH6U+4cKI7d+FJHtylT+BHaZo7j@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxs4/v7B7Im+VwqGXm18OdZ1biUPxPLBLo+8NCMXJKSnt/RmW/
	4pzms3LBG6zJ5l1oIaMcrZ78jh1Qg45Mkz4pmFhvFAvYPTgeey4EqzEI4LMLFR6qusY=
X-Gm-Gg: AR+sD13fUsMW5p3y3DznXIdD+tcz3dzbQTs+d4sCGfs91Z4/uyOitN/nD/gX3hFxmZ8
	nRaPtUwEU4AC/4AQLGxTk5OmbgjXFl3+Ut9uAZoFZXLP/Ixhacg4T0yj4LzFq8NqnePd5VZMFyQ
	g85QDTsewh2PBDnbRpt9lSIyFa/246WdcDyKngxQEI2s3O0/CVp1+wXam9E/cjGPTiSqQ0qy1Yc
	YVzTsw7rC5wqjPMkKfT0xZ3269BRFlpZvBzytylListHpSs4YKvwntNBquMukEprSnJ6uFMVOWh
	2fLlOtRR9cKitYODWupmKjAoCdG71ajaJBZysYz9lgulASEyrEa2Zo7IUw9nxmVHQkJ+oybSkiI
	OCDFHd2tRVaMDppl0H68xpBEEgxL7VjPQIkNGRWyNb1UMvGe+0MwJkmaNFK3wjpUBaFFTtO2c3v
	gIPe/ct099qnwLje1jaeBrfSm2CMuLgaO2fPim0hjl5wUy0mVw9npmVasUf0KcDrek0BreWMTa8
	6nNlljTteQHxwG/zCpKuGZoRi8DgR7rRsMvz8A=
X-Received: by 2002:a05:6820:83c2:10b0:6aa:ddf8:f17f with SMTP id 006d021491bc7-6ae43514968mr8221908eaf.23.1785686849225;
        Sun, 02 Aug 2026 09:07:29 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:5487:2b6e:1057:d3d3? ([2600:8803:e7e4:500:5487:2b6e:1057:d3d3])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae3a0c724fsm4851976eaf.9.2026.08.02.09.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 09:07:28 -0700 (PDT)
Message-ID: <1555adce-4cce-45c5-b3bc-1898d1bab46b@baylibre.com>
Date: Sun, 2 Aug 2026 11:07:27 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] iio: flow: add Sensirion SLF3S liquid flow sensor
 driver
To: Wadim Mueller <wafgo01@gmail.com>, jonathan.cameron@oss.qualcomm.com,
 krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 nuno.sa@analog.com, andy@kernel.org, maxwell@maxwelld.cc
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, marcelo.schmitt1@gmail.com,
 455.rodrigo.alencar@gmail.com
References: <20260728214943.29820-1-wafgo01@gmail.com>
 <20260728214943.29820-5-wafgo01@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260728214943.29820-5-wafgo01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/28/26 4:49 PM, Wadim Mueller wrote:
> Add a driver for the Sensirion SLF3S family of digital
> liquid-flow sensors on I2C.  Currently supported variants are
> SLF3S-0600F, SLF3S-1300F and SLF3S-4000B; they share the same
> register map and differ only in flow-scale factor and calibrated
> measurement range.  The variant (and therefore the scale) is
> auto-detected from the product-information register at probe time;
> a sensor reporting an unknown sub-type falls back to the variant
> named in the device tree / I2C table, so a drop-in replacement part
> keeps working on a kernel that does not know its sub-type yet.
> 

...

> +static bool slf3s_crc_valid(const struct slf3s_data *sf, const u8 *block)
> +{
> +	return crc8(sf->crc_table, block, 2, SLF3S_CRC8_INIT) == block[2];
> +}
> +
> +/*
> + * Read the product-info block and pick the matching variant.  The
> + * sub-type byte returned by the sensor is the source of truth; a
> + * DT-supplied compatible only seeds an initial guess and is overridden
> + * on mismatch (with an informational message so misconfigured device
> + * trees are easy to spot).

In the past, Jonathan has always argued that the devicetree should be
trusted more than what the device self-reports. This seems a departure
from that. Why are we making an exception here?

We have to trust that the devicetree is correct for everything else
that can't self-detect anyway.

