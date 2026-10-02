Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43A42874F8
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 00:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790902319; cv=none; b=dQql4FKJ/sf+ZHzKu7DQrEBqmODMLFMyK9fn+lIWtGqXNsuFTVMX3VDwCVOxssBiOnt4ZEUdAF0W0Q45uLundBZQU5SFVZ/jgHmA6c2k497/SL7Rka79wFHAV8EU/E+eLLHzZAoElW8Rmwjb6QmVlw+v6qR6lgZMZqbSaiEhK/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790902319; c=relaxed/simple;
	bh=VlSoJ6brjDXIgaoyHEKlbvSBwJ52Zx7FYjVS3+K0iZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZeD7S/LckiIVsl2uO6991rtY4WHMAHq71HmDVTv+0j2XS0ANWcFI+mGbXDa73hwUIO/kGlQYQVcYEM29mNzBTp1s9wKoUepoKeLhWSTZUQeWSZo3zP2cBbaF5fu/+yTOvGM05yAQeOceJH80cVqUN6TsVStLxR/wsP88i3QCFUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEgXyvj2; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEgXyvj2"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a02551822eso657242a91.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 17:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790902316; x=1791507116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCKENVm5zZAs5I0wb3FVyMlwp/4yjLtmzmHk6dKFgqw=;
        b=UEgXyvj2vv36yw0RvNych4ghTozPphheK928g6dYDH2XIgOmPduYu1KPaXTTWEpdMj
         ed/VO2ZSGCfpaEuNMyGI488IR2c9BLOaUroXrmhj/Xbn98tlcRtzJd7+7UQ4THUUfn/f
         DkY2VLz8JMCCgLI4xRbvDcrUERucj0yCFQXz9y+pu/geXpAeL4ZVZTJgPVTX1Ldew3ga
         5xbNTjUZomEzL8DniZP50zml5qaW0mky1TQnBOVt+mip84bQaofBT97ut5oxSc2UoLVw
         l5boZEAZiDbnLU85h1/DOi3zXWUGM1xJkeR2oXZ0/CYs5JwfKn+10Clr/inlsJZ8i7jm
         /XHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790902316; x=1791507116;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCKENVm5zZAs5I0wb3FVyMlwp/4yjLtmzmHk6dKFgqw=;
        b=Ul6RjbPvoTH02oGNhrIwS0ZYSuNlop5d3dgrlgmGUz1dMyK08Muc73TSIuHXBhEYEU
         IrgGPCJnJgxnusBvmPtYoq6BtIP0IoCtNFz9LXMs+jD/MLPg/KR+9hPqb0Setu/EX6tN
         DcyWph01CQ1D9ga03YZcdj1ChZoF9WruSpSuA0VH7Ngpk6P9C3NOFj4EcyU1hihIr1H8
         eJFYOb3y9yh9qb+jjolFJvP820GSM1g7G+D+nRNXQg2TEbEvxki/f/2Gl/EwU5GCTd1d
         r+MF31UVGjoNYMQ2a2rrNdHLLBfpJGfVgeTRjGAAE/Pq6VK6IURnjuQg/P/aeG4+NNij
         B5Ug==
X-Forwarded-Encrypted: i=1; AKwUvBz7HEG9vS2FovUBPuSCeahS7rCzk/1wNDahzefKOQoS2mnGiL0xCGvmwQVldiamZaOhMn+zgnyMW4DG@vger.kernel.org
X-Gm-Message-State: AFq9FYK6FyxL08ralvwHrr1TEOlLqBtIC9uusMoflEN2c/JLLoWfOQY8
	/jI7Awuw1bIkOIxFeHODmZYqg7Re4fHEuGTQLK055deq2DkMyGmflmah
X-Gm-Gg: AYBFou3kdWBA9HGfVepBlTeynB6GXEtofaHkyk/VCzLMSbkGa0MYzG7lgq6v+/j7jC+
	UzfhkTVuWLRErrc+eSD6a3XBnYgg+weWUu9W5jaNcThzvYEIWMJAtGpaeIrLCdsQr3nvt88gqfQ
	V33m9EyycX02C5wGQNIPZDnDNE+V0TwjXWHWUenYFel8LyoGHUdlhZexrciwfr3++/2iLYvGCSI
	N7uuI9/As75dj7AW+DJyGWADp51o29edibhJ9gmPtXlmVd55wm8nfV3dMaXwwRTmyc/lkJAYPN/
	JsROIqrkuKirfbitNt5F4b7l2SC3eFqGgr5Tfcpq4j4sdtLFmkY+e8nu5xMAr3niXkU6WUTdjk1
	L6TqSkinPpoKskU7lkCNBTujXib4x67GuOqhPHDf+CYxDyKj4ovUqgPWvEUtl9DSHy93yS4R91E
	mDocQW7tYshpXFbVo/kHIk+YyUisQ/izVppGVc9l3oATSjDQNAaYB03DtJEDUmD3GiEtQ8n7ufb
	zXwlNWdU6aUkVknGWisIXdL+QzWyQyk/w1bHg8DPTdGMwY4JBY=
X-Received: by 2002:a17:90b:54c6:b0:3a4:9416:a2f8 with SMTP id 98e67ed59e1d1-3a4f32d90c9mr3036036a91.9.1790902315935;
        Thu, 01 Oct 2026 17:51:55 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f73557f2sm268666a12.8.2026.10.01.17.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 17:51:55 -0700 (PDT)
Message-ID: <5fe2ad09-428f-4559-99b0-07042412b980@gmail.com>
Date: Fri, 2 Oct 2026 08:51:53 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] spi: ma35d1-qspi: Add GPIO chip select support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
References: <20261001131818.110028-1-cwweng.linux@gmail.com>
 <20261001131818.110028-4-cwweng.linux@gmail.com>
 <20261001134613.16C861F000FF@smtp.kernel.org>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20261001134613.16C861F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



sashiko-bot@kernel.org 於 2026/10/1 下午 09:46 寫道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] spi: incorrect validation of total chip selects limits GPIO expansion
> --
> 
> commit bf74299215867df971e01913ae533377b76db610
> Author: Chi-Wen Weng <cwweng@nuvoton.com>
> 
>      spi: ma35d1-qspi: Add GPIO chip select support
>      
>      The generic SPI controller binding allows GPIO-based chip selects, but
>      the MA35D1 QSPI driver does not currently enable the SPI core's GPIO
>      descriptor handling. This patch enables GPIO chip-select support and
>      specifies that the controller provides two native chip selects.
> 
>> diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
>> index 30e3239f777d6..0644bb2990b8c 100644
>> --- a/drivers/spi/spi-ma35d1-qspi.c
>> +++ b/drivers/spi/spi-ma35d1-qspi.c
> [ ... ]
>> @@ -638,18 +664,21 @@ static int nuvoton_qspi_probe(struct platform_device *pdev)
>>   		goto err_assert;
>>   	}
>>   
>> -	if (!num_cs || num_cs > NUVOTON_QSPI_MAX_NUM_CS) {
>> +	if (!num_cs || num_cs > NUVOTON_QSPI_MAX_NATIVE_CS) {
> 
> [Severity: Medium]
> Does this validation check incorrectly apply the native chip select limit to the
> total number of chip selects?
> 
> If the Devicetree specifies a num-cs greater than 2 to declare additional
> GPIO-backed chip selects, it appears this check will cause nuvoton_qspi_probe()
> to fail unconditionally, preventing the use of the new GPIO expansion feature.
> 
>>   		ret = dev_err_probe(dev, -EINVAL, "invalid num-cs %u\n",
>>   				     num_cs);
>>   		goto err_assert;
>>   	}
>>   
>>   	ctlr->num_chipselect = num_cs;
>> +	ctlr->max_native_cs = NUVOTON_QSPI_MAX_NATIVE_CS;
>> +	ctlr->use_gpio_descriptors = true;
> 

Hi,

Thanks for the review.

I don't think this check prevents additional GPIO chip selects.

For the MA35D1 binding, `num-cs` is limited to the two native hardware
chip selects:

     num-cs:
       minimum: 1
       maximum: 2
       default: 2

Additional chip selects are described by entries in `cs-gpios`, rather
than by increasing `num-cs` beyond two.

Since the driver sets:

     ctlr->max_native_cs = NUVOTON_QSPI_MAX_NATIVE_CS;
     ctlr->use_gpio_descriptors = true;

the SPI core handles the GPIO chip-select expansion when the controller
is registered. The number of usable chip-select slots is expanded
according to the number of `cs-gpios` entries.

For example, with two native chip selects and two additional GPIO chip
selects, `num-cs` remains 2 while `cs-gpios` contains four entries. The
SPI core then expands `ctlr->num_chipselect` to 4.

`max_native_cs` only limits native chip-select indices. GPIO-backed chip
selects beyond that native limit are still valid.

Therefore a DT with `num-cs > 2` is not valid for this controller
binding, while valid configurations using additional GPIO chip selects
continue to work through the SPI core.

Thanks,
Chi-Wen


