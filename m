Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28843B71C0
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 22:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781561276; cv=none; b=ihORqUlTTskIWQs9ebO/geB5GyaRV90zXiuVtEUIKVOxAduw8GAx6gmL8xu23+SLe/X0FRGma1gi1bkvxCIVxy5OP/g058Ne5ceFQRRqM8tc9RR2O6s73kthtD/EPV+zcMSFT0hIxR9llQJTbfwcI+YmD6H8rog2H4Nr4YhAFrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781561276; c=relaxed/simple;
	bh=YfbpY7Bc3Dqsf70uwxALqNV6kXHWLWzxXvuWJJpKc98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DOyUvP5msEEUAyG4FuJ/sb4dLuDownjqwhAYzC0m859XjwJMGL/fELm3UBbgOtGDSIfp7TrS7DvOl8Pi7MdsGfE4N12udb4aqxQo1jCyv2OsLWeEXEOMp+b7FxtvpHDhoOoS3ulecYSGPTZL3EgTgQK2oyrF8Ay02jW3edpNC2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Y6yKOH/w; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Y6yKOH/w"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-43d08bc82deso3747417fac.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781561273; x=1782166073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9qFetXIKm9GhA/aEeRCm4t+hK+zcMVI2EtnnmBeBC2Q=;
        b=Y6yKOH/w1UQcdirdADVjMBdVSgaSdb+gAayEVACuyR/ANYCuX06CsAQZQpNO4HBoaN
         8KfArtVNhDsX2suplO6pjqgTtfg9Cyf5jFkQ7mxY5csYxxMhQxnhdLg0SLt1x+Qw91rh
         65IoRNAArkHn2PEPUHQ3KHd8R5VKMLZVS+8u1DtjccEYdYPLb3BqdIH79s6PVkfCNxhe
         Xpt1CE4Dc6JqdhHndVM5D2JUzBDvf52pFGq+TOMTTlIv6uxE2XhWQ2z7MAXVpighSjOQ
         /ikKKv+BeAJ7+Bfb86Foa04H4KWJuVHgT3n0QwU2tlf90CZfE1j6WdMwGPY8uXzU/3fl
         5HSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781561273; x=1782166073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qFetXIKm9GhA/aEeRCm4t+hK+zcMVI2EtnnmBeBC2Q=;
        b=OxTGAaiWjwZunLPtgIxWJVIgx9MCtBy6tK8cPcoBZRFcSTx2HqxnzNmSlJCBLtVHDd
         T8uq+Q7ihtrjmftwVI9gQRcGz340IkPdsrJy+o6VH64M7aVtkTh+Vsr0pEpJ64cC3ZBt
         /lYkowEkgkh69UcjQDx11gUGtTT7WqejNxwDkdTc8XxzKQvE7U2YLwoYNwqIBc474/eb
         J0kfdaDfd1DVXEWciRbPP3PNxbOTmiiSlpGekmBBCfk7MJ5QmO8kidtfag63Qcrwhx+i
         YNhzl3WLuPctAE/DOQCMq/TQMrbNYkwGFcUkU+uqwUkkqDE5TMQMyPqAuTfvMUdHk68P
         W1/g==
X-Forwarded-Encrypted: i=1; AFNElJ8J8tZ8wM+sZmTthohSF2lzVIVHpdYFt/OW1znU5j2ZEivWgZW1HBkI253UrBrE2KOmzL65ODYkPKdo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm++C+mJWERy+Bd6cxp2n8a75lYXOlqX1TJaTYH6Nf7vkXoAq1
	GUWyUXnEsTx4gTIqdg+DyVm1TDafQKSGAmcHaxFoHABefv8NPtW5QuYOqgJlbv8AdP0=
X-Gm-Gg: Acq92OEZQ4K5lsg/Ot6mmmJXWneXlav1YrvmJZS+QRYniTghxgMkz2mMEpVic5t8WkA
	KGW4jo/SyAcg2pRDME3lMG5Z5N837XGQnLAnSJGdgR4VrD164zuiDvOm8yjbHFwQJifkeUGuJdT
	K3+hk4xZJR4z1fGDEKYCaHeFYT79fWnSbepdarO3FoZaXMiPTtaeIvl6iHqVJnRKCQz5N3yiKkm
	CjgvIpjUHdpdHBQycnAtUKCWCgWpY+q0uUNMfRyxUNfS8rA5/b/642KOOSY03CZ4l65AnhFQRSd
	W/GfP5QbCvczZx7PsF6EzsJ1q2gXQZu6UZMk2xHYnPSZBfx8z1Bk+hg4dRe3fgkyZbbicUbP+cS
	b5JwVRQs7fMBkYZyQHIOYXpji2/G7hgpAsF2ei1sK0IQn90lv2RfR1wxzmgLL6L4fxRuEGnTLLB
	TmFV+XZeMFaAC1z+Y0qQ6F0F/JqP9cZgSvh2WcR6Ghp6p7Dk2swCLtSxBBOJ2Cw9EMKbe9cXrvE
	Q==
X-Received: by 2002:a05:6820:88f:b0:69e:9a1b:5c26 with SMTP id 006d021491bc7-6a0a40ae32fmr935828eaf.45.1781561272863;
        Mon, 15 Jun 2026 15:07:52 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:16b0:5133:47b1:a939? ([2600:8803:e7e4:500:16b0:5133:47b1:a939])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44308f190c9sm745841fac.11.2026.06.15.15.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 15:07:52 -0700 (PDT)
Message-ID: <d25798eb-50a2-41fb-ad2b-7ac7feeabd86@baylibre.com>
Date: Mon, 15 Jun 2026 17:07:51 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: adc: ti,ads1100: add support for
 ADS1110
To: Jakub Szczudlo <jakubszczudlo40@gmail.com>, linux-iio@vger.kernel.org
Cc: andy@kernel.org, antoniu.miclaus@analog.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, duje@dujemihanovic.xyz, jic23@kernel.org,
 jishnu.prakash@oss.qualcomm.com, jorge.marques@analog.com,
 krzk+dt@kernel.org, linusw@kernel.org, linux-kernel@vger.kernel.org,
 marcelo.schmitt@analog.com, mazziesaccount@gmail.com,
 mike.looijmans@topic.nl, nuno.sa@analog.com, robh@kernel.org,
 sakari.ailus@linux.intel.com, wens@kernel.org, joshua.crofts1@gmail.com
References: <20260613190957.654798-1-jakubszczudlo40@gmail.com>
 <20260613190957.654798-2-jakubszczudlo40@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260613190957.654798-2-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/13/26 2:09 PM, Jakub Szczudlo wrote:
> Register layouts are the same as for ADS1100 but ADS1110 have different
> datarates and have internal voltage reference that is always 2.048V

If we do a v4, would be nice to mention here that fixing the order
of ti,ads1100 was intentional while we are touching this.

> 
> Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
> ---
>  .../devicetree/bindings/iio/adc/ti,ads1100.yaml        | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
> index 970ccab15e1e..28c5e2dd0ad6 100644
> --- a/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
> @@ -4,19 +4,23 @@
>  $id: http://devicetree.org/schemas/iio/adc/ti,ads1100.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: TI ADS1100/ADS1000 single channel I2C analog to digital converter
> +title: TI ADS1100 and similar single channel I2C Analog to Digital Converters
>  
>  maintainers:
>    - Mike Looijmans <mike.looijmans@topic.nl>
>  
>  description: |
> -  Datasheet at: https://www.ti.com/lit/gpn/ads1100
> +  Datasheets:
> +    - https://www.ti.com/lit/gpn/ads1000
> +    - https://www.ti.com/lit/gpn/ads1100
> +    - https://www.ti.com/lit/gpn/ads1110
>  
>  properties:
>    compatible:
>      enum:
> -      - ti,ads1100
>        - ti,ads1000
> +      - ti,ads1100
> +      - ti,ads1110
>  
>    reg:
>      maxItems: 1

