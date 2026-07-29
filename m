Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F2946C832
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 18:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785351591; cv=none; b=QYhUk0a3cT7mQ2JMiyyfKqqPJqIfJTFSvHyYMvTD7rT0f0QfKUngUS0lINf80JBSISgSZnKE93MWU4oIoozbjhupTo/wOlogwFlxERtzPBRsqAhm09Ehhs1so2UwzROL3imgL6BBNMIAw6QsvHa86R8Ja92GWiROzOLdhBm0las=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785351591; c=relaxed/simple;
	bh=mZ5Retc8sTP4Eeh8QIfI3mQBHAMGpvWJsNS3wehmuyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sGZvypy0bclRBAphZ/w966Q7PQQ1byL/UJXCwtyqrqWAK168szshJkhFExvupRxKE1JkxzcHJdMSv+3c6WpqBeOR13iuvbFy8S7swa6rwmtt+dU8U8cZh+jIP2ho0q2cKg8kqNCQOZrlb3eU2N1SlohbeK+QjtYPjTahOreyuRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fKRMYvDe; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fKRMYvDe"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6ab08d289d1so821996eaf.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785351588; x=1785956388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DeH+WNiUe/anlxAPKJgAg9qgcQK9PQs4CI3joLBED90=;
        b=fKRMYvDeUiB5Ny2UTRI86Ox40ALIToButMUkIoV9KOAFIhINe52UIsdHN8+hnwNmyP
         A35NcOI6vYnq1ZNn/vtsBixCQ67POXkX19jtYcd0aAm/6hH8VahIe6b+wT3ZtpaSGE5s
         iC5wLzYXS2BtLQ8ZqY5g0VnqyQ5R5/VrZScQPilrfDGuyHkiA2eUXlH+BDhf2TBCzWYd
         SyhbT4htzM9J1gtY0XRK0+ycGTDgTkQABRyKHZIzTsjNbunWB1kx+jGa4wEik6dUpNpz
         Fpast4pILwG4gY0/IAA/gB+gGm5N220YtttFPvD8WWH1PVLN/VQgtT07+L5Z1EiyrPsz
         2rHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785351588; x=1785956388;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DeH+WNiUe/anlxAPKJgAg9qgcQK9PQs4CI3joLBED90=;
        b=Ot6Of970FGi0UsdL7Hoi2K/wsfrcXbZToy4mcuvYSC8NcfUHA3eCD1dQ7xqKa1sm4/
         rp9pQKP8VHiOiDMfu5TxrTRCZsM4YzkR8gPTlCdWdmNnwRT/taxorfYZojLd6GFzlPeF
         +WQGf8k+2ykiW2SLUm+DIzIRmKYx6A1e50JWD+q/ONIeAGgZkgdxcZHB9fSHakdECfGx
         bBt5Ou416RSX5nP/MAiDPgnh4X6tpNNglVwOpJPeYuEkwby7p1XZb2hhLgyKWVB2xVCI
         fvnoZoIh/xcKULj84dFEV/AOqae7XKZsbkfHs/npqGPghq6LqKG109TqEG6azc4nPAxl
         +jwg==
X-Gm-Message-State: AOJu0YyscmvLsneWWyKNLlKpHst8y5xdX02S39Wpt/alWFmbmtAFVfy5
	YwqIKUd+FJiOCikYOeoXaIzuYQZniKE2OXwNviv77PWQDGQ82krpwQ8NSfBWPMJnwbc=
X-Gm-Gg: AR+sD13Fu0+cDFv4bK2NdRBh8TsmbWO8rx4dilRZm7e0koYaCpmH4R841KnSa+2Y9I/
	WKAzpPzX17vrd/SUDfe9Qv9hksTip8rVvAC5pTCDcUmZOqnHVgeffvAa4JPrEVJn8u4YcQcFaC0
	yC1TQhlCkenUgjMeH/nSKZGoS9nBQ2BGrhqNZ4mz01O0IEkImTWXdbVXVi7Wh/PZQD3uFjfS8PP
	KBj05YHu/6NBAaewSPOCJY61mJk4D/TD821thgjLNY/WGXef35WIRwASSkBpnK/arJwfYDE5Uw2
	RVas+z63wPjloYVoSpoLaKOBjxGIMzMi8aSApXGwk/+6lzIwPcIsxcTdP/pAp4b8c6CmG12NxOu
	6R55P5AdNTJevoNgrPUGvDdxsONBGTzMyPCCqDzHK3ivA6MOC+gamoHZ6ChHd0YUBbNVmu6rXBi
	4QHjhSN/16xb/PI0n3gTOYqh71ccyKQNPk+ruxgfdZGbUVfYGR6aAYixpWQlcDAmY4+zlzZAvEF
	vjn0pRkCOtTRFy/L6GJ5iWLLcZpBTg2pnko/FI=
X-Received: by 2002:a05:6820:c92:b0:6a1:98fe:3da2 with SMTP id 006d021491bc7-6ac9697e7d4mr4033926eaf.11.1785351587691;
        Wed, 29 Jul 2026 11:59:47 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3096:ee5f:6f57:afe1? ([2600:8803:e7e4:500:3096:ee5f:6f57:afe1])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca527fe83sm2603945eaf.6.2026.07.29.11.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 11:59:47 -0700 (PDT)
Message-ID: <9ee5b759-30a3-4387-98cb-48e8c2f6a9df@baylibre.com>
Date: Wed, 29 Jul 2026 13:59:46 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-700: Add boot phase
 tags
To: Carlo Caione <ccaione@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Julien Stephan <jstephan@baylibre.com>
References: <20260721-ccaione-upstream-mt8390-bootph-v1-1-5642198f979d@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260721-ccaione-upstream-mt8390-bootph-v1-1-5642198f979d@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/21/26 8:24 AM, Carlo Caione wrote:
> U-Boot SPL runs after the platform DDR loader has initialized DRAM. It
> needs the debug UART and eMMC controller, together with their clock,
> syscon, pinctrl, interrupt and watchdog providers, to load the firmware
> FIT.
> 
> Mark the nodes consumed by the current SPL configuration with
> 'bootph-pre-ram' so that the canonical devicetree carries the boot-phase
> information and bootloaders do not need local overrides.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 81 ++++++++++++++++++++++

It seems like this would be better placed in mt8390-genio-common.dtsi
so that we don't have to duplicate it for Genio 510. Julien can test
it.

