Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90633BB12D
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 15:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746506; cv=none; b=agmUyjbQrcYXQHrzqADTCDctzCYPzZoghUycTkcxBziAcuewR0ht1rtMrvTbZa3tkXkSTNjzbQpdFhG3oEi56zPg/AeXFxYFJDEwi3+PFVDDvjbZbp1Msq3KG2KzQpWre7hbppJPn7E8upY2qklKq1tUQakAgsNX+NwsnXJ5U0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746506; c=relaxed/simple;
	bh=GqLnvZkmBn/+jdSRiIjOQLiMbdgqd/ohJyb5VcFNH64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKrrM1gfrt1Roq0brYrqT3TMbglyITZD6XXNA3xY9BN+X3+eI784Y9a3p+oXN7ADRFC43cRDlyknxy8yndGyGNZgYMtHwEuwqSXYrp2+9UWuLAoJdoTQMO0KEWc8W58/Ql+5V33G1ybFszaEgZVy41hi/hQShy40iuFUSHILggQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SRryUTWy; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SRryUTWy"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6a13fffa9b6so1324937eaf.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782746503; x=1783351303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RoN6vMVFKf7cav/D/vQQNE2Ex9fB7yojp9INli3pPQ4=;
        b=SRryUTWyUOERn3+W4f25FkqSBAp+0GXtS2Zd/Xot/JtAesczfApSwHDdR1YDv0VlGr
         SENJ1C3dBorbPEx15kid/EeVhgvFQYcaEJYv0M2Ufb6ZnjCaV58f+6ExW0aoB3zr9KOj
         f4/4DpR9/1/EZLg1AVw+lHO7pN00SsuIhx19DdZdHMYzwNnulG4bF7hVg+iJhqaBZV6F
         s8PCjW6SYFfnCdRhdK2KcEIVmXBw1OKHLaxEDqSTr9/OBYusc2G5wWW2M/q+uNxAfL7W
         EqIkn0sNvUWjMQkw/pLwUZR+MvTu6AUCkqeecdHrBtXcirwAl9NpN2GXWNtZSHwFU8cz
         Ok7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782746503; x=1783351303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoN6vMVFKf7cav/D/vQQNE2Ex9fB7yojp9INli3pPQ4=;
        b=EHMETDuFssgc+6wNGhRydOKsE9Nk3HprOg541zLmiPq+ZJ+rTWokPl51NVUE9NiFjt
         2joek5mwLuf5A1nRNXCYq+DQpMxAFjkaoitmzxJDHeBKrPVAuBPmTALetG+WMy7a0tiV
         KesHcTLL+pdNz1Sze06HxJw+Cm/qgdjr88J9VgvaNFqWbBcZeWw0/9XshYjnEDOtc7JG
         EIKYjvTCsoxidfm+Y/b4AL97JLuDBcsCSWHcE+t3C8DMO9u4iZFjsmF+GaYrg8LZmI+O
         dpvASS7P2V9nQ7P0l6YTUjR26u5dUcYZrpmb23ZPJltooa2UvcngD/7NY8zUH2Mjb7J2
         k5Wg==
X-Forwarded-Encrypted: i=1; AFNElJ8jheFzflBimmNxo8UO91eyVXdGINm2iGIoFACeixGZZTcclvbc186ZilJop+TdsHUX8T1kDKnPXf4X@vger.kernel.org
X-Gm-Message-State: AOJu0YzmmhR9BGrcMKCk4NESKeSEz9q4ZGYClpa4kVLw4FlSxHNKyZ1l
	NwGDUlYJ8l6QIeVQ6/iRjO7gNhaH5R7Q+01sEnvNxxH6JIvmsfC51OPCB3OZN/Qszz0=
X-Gm-Gg: AfdE7ckBkaLNBW/NY+A+3VynZ5o6kuEMHMAUgqiaxdbUvqR6+fsSydogFo5oTP5QrJS
	NSEu8zeDrQGxK1o1rP5VHPdeOPjmDfCLM1HEpxMXtWZBSdI7KXcniksuqi33wNFi2Rz7S8xJ0sU
	rLMTCeWVDrmmkpm6e9gtXeMxCBCxxqzVWd2V9l3IEMLLQH6rmZxR9SJoiRJqNel2Y4VanhOji4p
	+qXenhoQxz3s7YtqZu8nPp2mUsJb96VCNBb4aaBxOmfdUCc5TB1ZGR8sof9aOQfyEzz6Wpi1wA4
	7daDWoFGg74B5Hv0OWJqxKxYBemljQ3vcwBj3KdEkqCn44gQm2SZn7zXQt1hZU8HY+ryOVA1CtT
	Mfu9GrynpiatP0M0dt3yY5bsVnStw1bHIU3uAtGBwF4cHWUMt8Acn9MKiqVp2bd18yvEVM9DQVJ
	VEurxx5ONFL9HGwQkTZYap+QC6nMbsSiAkHHDOllUjsg3m1gknZFKLezqBByaVPwqCNWHz+16BF
	g==
X-Received: by 2002:a05:6820:4de2:b0:6a1:7644:772c with SMTP id 006d021491bc7-6a18939bcb6mr63450eaf.63.1782746502661;
        Mon, 29 Jun 2026 08:21:42 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3533:aa22:9a69:df1c? ([2600:8803:e7e4:500:3533:aa22:9a69:df1c])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a189173c3bsm53188eaf.1.2026.06.29.08.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 08:21:42 -0700 (PDT)
Message-ID: <4d81af47-277d-40c5-94d5-8c7d59dbd0c4@baylibre.com>
Date: Mon, 29 Jun 2026 10:21:41 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] iio: adc: Add support for TI ADS1110 to ti-ads1100
 driver
To: Jakub Szczudlo <jakubszczudlo40@gmail.com>, linux-iio@vger.kernel.org
Cc: andy@kernel.org, antoniu.miclaus@analog.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, duje@dujemihanovic.xyz, jic23@kernel.org,
 jishnu.prakash@oss.qualcomm.com, jorge.marques@analog.com,
 joshua.crofts1@gmail.com, krzk+dt@kernel.org, linusw@kernel.org,
 linux-kernel@vger.kernel.org, marcelo.schmitt@analog.com,
 mazziesaccount@gmail.com, mike.looijmans@topic.nl, nuno.sa@analog.com,
 robh@kernel.org, sakari.ailus@linux.intel.com, wens@kernel.org
References: <20260628194341.66752-1-jakubszczudlo40@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260628194341.66752-1-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/28/26 2:43 PM, Jakub Szczudlo wrote:
> Add support for the TI ADS1110 to the existing ADS1100 ADC IIO driver.
> The ADS1110 is pin-to-pin compatible with the ADS1100 while providing
> higher resolution and an internal voltage reference. This patch series
> extends driver support for ADS1110, updates device tree bindings and
> Kconfig text, and improves the overall hardware description for the
> TI ADS1100 family.
> 
> Tested on: Raspberry pi 3b+ with 7.0 stable kernel
> 
> Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
> 
> ---
> V4 -> V5:
> - Correct pm macros to be more generic
> - fix variables ordering in new functions
> - delete unnecessary casts

Either this changelog is incomplete or some of my comments on v4
were not addressed. (If you disagree with comments, that is fine,
just reply to them with your reasoning. If you don't reply, then
we assume you agree with them and expect to see the changes here.)

> - Link to v4: https://lore.kernel.org/linux-iio/20260622221550.374235-1-jakubszczudlo40@gmail.com/
> 
> V3 -> V4:
> - make fixes patch the first change in the series
> - correct error handling when short read
> - use ACQUIRE macros from pm_runtime.h in new functions
> - Link to v3: https://lore.kernel.org/linux-iio/20260613190957.654798-1-jakubszczudlo40@gmail.com/
> 
> V2 -> V3:
> - clean patch from unreleated changes
> - divide adding support for ads1110 into separate patch
> - add missing changelog
> - Link to v2: https://lore.kernel.org/linux-iio/20260607183542.368184-1-jakubszczudlo40@gmail.com/
> 
> V1 -> V2:
> - go from creating new driver to extending ADS1100 driver to support ADS1110
> - Link to v1: https://lore.kernel.org/linux-iio/20260527164312.355729-1-jakubszczudlo40@gmail.com/
> 
> Jakub Szczudlo (3):
>   iio: adc: Fix incorrect reading when datarate changed in single mode
>   dt-bindings: iio: adc: ti,ads1100: add support for ADS1110
>   iio: adc: Add ti-ads1110 support to ti-ads1100 driver
> 
>  .../bindings/iio/adc/ti,ads1100.yaml          |  10 +-
>  drivers/iio/adc/Kconfig                       |   9 +-
>  drivers/iio/adc/ti-ads1100.c                  | 145 +++++++++++++++---
>  3 files changed, 135 insertions(+), 29 deletions(-)
> 

