Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665DC279798
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 16:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785686496; cv=none; b=mdwYHrKVmkzWiZ7KXA5ZK2I7UYOAlUV5okLpi628YoVoNjSNspxzTs9fZsx8tLRTwYpDsIGv6SI0uXlGfmD5irYyA/LM8Pc5IDNwgPAAa66HY580hAdbCqMA82itRUjvlF92Fa9zPf/U8dwmair4fdJeu3TSkoaFzqqtMGLmLvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785686496; c=relaxed/simple;
	bh=jatuBD+bPXjgYDgUm4cT+DleRbfJJnJoNvIuRMWW1VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t8opmJrUvTtvX8ON9dxlfG7gFxA26+DDd1ZK+zwuIWqtUGOdfu+iK3oLuhWvk782qPoUK91Si+KD2ZdS4YSkA8+5c9cNXF4ICH8QilywX/2cINrcYgWhLmjOcE6OBjT4a/dxUpoxqy3tmu6oL/Rtv/K33HPF2gR/4Ki+YUp6rI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=E5jupX1/; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="E5jupX1/"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6acb51944d6so1376367eaf.0
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785686493; x=1786291293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=foh7gM8l446Brx2CHYzHFbFF7Zo+xXckH05CdcizIR4=;
        b=E5jupX1/U+//TX+qYoOXsIDDFRN4+bTdk9y+F+MDm2sPNxlkPjmiODqz3WGyljYT6J
         obfsoIevjvSaRoLTHSy87i9sX9Mkv1E3haEom5QiTFsUX9iYOmH4FKX0BvhYm+2fP6Qt
         D4fdweOy8GP5AJZZ8Sg4mspxHeuh31ziySTFhlatFnlNF/yHKixXPm0roPuzfF83uMeF
         V+EPiXAL10akvg70+H/o9oVZT1o1wYHTzpqZwlJINB8BxqHlBEhwsgPRxggt15OA6Rpg
         CQKJac5gHKjwbp/deR94dIOscPaNMpQn05odAzgLsp+WR4z6pTcKLr2DlQLe6EwnaO9Z
         NWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785686493; x=1786291293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=foh7gM8l446Brx2CHYzHFbFF7Zo+xXckH05CdcizIR4=;
        b=FA25I7Ip0RTMGrAOjiWaIj19aLmfR2VRsHJHc3U0m8q+SwaKGJLynvzhc+T/XhfAcb
         CJMbxY432yATjPYjjaP3nEBCKmJlsfuSDzV00kicP913eTJi15OVjtvrvaVpxcSpLrCm
         Ck24ZN/Ia+YOiByvRke/sVlBx3Vq/ot1tPQO97CteFqbOe4WWrJZnO30VeAMBWLo865D
         Ds1JlSau/l8bDOSmj3nlkrjEBgJU+qxNC3W9JK1Gmb2DlmkhnyEY6TAGM8/5Q7fwMCJY
         i+SouSmtb5RqIBEob+fq5rcLgRgTuga6bu0NTjD/2zyL8RdaMmlhhwqJY3bSdQ8Muom6
         bwvQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcekdWl3xM+kR5mI9hLaYuzJQp+FZz4Yj8v2P0thKAH7STQmNTflCqYM34+GS9c2GGoSS5PL2DR1rK@vger.kernel.org
X-Gm-Message-State: AOJu0YyOtpvuVurVT57K6DOEF5szFeXTYNg/1V5GyCeCkf9PDVwk7XRe
	k7McbXfBk7eFubiSX7nB5sO83LcCbuZD2iSYAuNZLt4RDuqel9mTWvXmO8vNTsLE4qE=
X-Gm-Gg: AR+sD13np5XGnc2Ea3kZIyhJs8MyNmJ8VcNHlMPgtADRWCMUm4i7FHVT5zHDYy0ssh2
	GIDy5rIxWEpbfNhtYkMiputLuFN/DKn4YdosGI+jmXpL6J/QhA4yhGbmBxj8ncBlElOvDJkyoLd
	vvIvGG/4JKdAG/mtVLAJMamDotOHzCwkIi50Gqc7KHZUdBei0jq8JpUMV5bZrpLoBvjLvDGoPcT
	N7+8WdA0DyJEYJdVVoMirNRUANYbaafRgtHV/A8JqA40ALzRz603J89j1wGLu09MbhKicWpJaYe
	cXh40QsuoLNRcPXSe5rmLzLAv1JmHumR5QHmRSHAcrCs9W1JMPm6uHw9NzgJKDzgaT1bXOAOVFg
	R2yvs9JbN2+0rfbNyuZMwNYV2BepEc91/NaijDRkzsLjTbNZeQXmXZNymGlpsYZayYeJbjA9LUX
	Nt+mHswnzyB+lZ6kVf2h3HY6sUsy6L8k5LuLACYXAW6StF9ivonnvhdewUH3ww48frOdhFxZxld
	ZRA9qd5ob+b0bh/7bzjPVEtGai7/CpTKmzb0FOBSpo7hI8hjQ==
X-Received: by 2002:a05:6820:1693:b0:6a1:363d:bc42 with SMTP id 006d021491bc7-6ae432d60f9mr8461678eaf.15.1785686493213;
        Sun, 02 Aug 2026 09:01:33 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:5487:2b6e:1057:d3d3? ([2600:8803:e7e4:500:5487:2b6e:1057:d3d3])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae3a319d0dsm5050615eaf.13.2026.08.02.09.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 09:01:30 -0700 (PDT)
Message-ID: <cfb955b4-0843-48aa-b201-fa60aceb03f9@baylibre.com>
Date: Sun, 2 Aug 2026 11:01:28 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] iio: core: add IIO_VAL_DECIMAL64_FEMTO format type
To: Wadim Mueller <wafgo01@gmail.com>, jonathan.cameron@oss.qualcomm.com,
 krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 nuno.sa@analog.com, andy@kernel.org, maxwell@maxwelld.cc
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, marcelo.schmitt1@gmail.com,
 455.rodrigo.alencar@gmail.com, Rodrigo Alencar <rodrigo.alencar@analog.com>
References: <20260728214943.29820-1-wafgo01@gmail.com>
 <20260728214943.29820-4-wafgo01@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260728214943.29820-4-wafgo01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/28/26 4:49 PM, Wadim Mueller wrote:
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
> Reviewed-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> ---
>  drivers/iio/industrialio-core.c | 2 ++
>  include/linux/iio/types.h       | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> index 37cf2817b3d0..767a7794624a 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -715,6 +715,7 @@ static ssize_t __iio_format_value(char *buf, size_t offset, unsigned int type,
>  	case IIO_VAL_DECIMAL64_MICRO:
>  	case IIO_VAL_DECIMAL64_NANO:
>  	case IIO_VAL_DECIMAL64_PICO:
> +	case IIO_VAL_DECIMAL64_FEMTO:
>  	{
>  		int scale = type - IIO_VAL_DECIMAL64_BASE;
>  		s64 frac;
> @@ -1032,6 +1033,7 @@ static ssize_t iio_write_channel_info(struct device *dev,
>  		case IIO_VAL_DECIMAL64_MICRO:
>  		case IIO_VAL_DECIMAL64_NANO:
>  		case IIO_VAL_DECIMAL64_PICO:
> +		case IIO_VAL_DECIMAL64_FEMTO:
>  			dec_scale = type - IIO_VAL_DECIMAL64_BASE;
>  			fallthrough;
>  		case IIO_VAL_INT_64:
> diff --git a/include/linux/iio/types.h b/include/linux/iio/types.h
> index 924ac9dc6893..d8944c9e5e90 100644
> --- a/include/linux/iio/types.h
> +++ b/include/linux/iio/types.h
> @@ -42,6 +42,7 @@ enum iio_event_info {
>  #define IIO_VAL_DECIMAL64_MICRO		(IIO_VAL_DECIMAL64_BASE + 6)
>  #define IIO_VAL_DECIMAL64_NANO		(IIO_VAL_DECIMAL64_BASE + 9)
>  #define IIO_VAL_DECIMAL64_PICO		(IIO_VAL_DECIMAL64_BASE + 12)
> +#define IIO_VAL_DECIMAL64_FEMTO		(IIO_VAL_DECIMAL64_BASE + 15)
>  
>  static inline s64 iio_val_s64_compose(s32 val0, s32 val1)
>  {

Would be nice to add this to drivers/iio/test/iio-test-format.c too.
