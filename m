Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA8735E95C
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774253087; cv=none; b=VOT4j55Gzvx64VrdOqRH/LBO9vN8JsW6AaeDSGV9BxdTdOIZr9Iu38Sqt3pOTd4cSdcSSrED6uiK6UsTN341WPJ0emyQdf/1O5bR3ubJUzKMiqG8hqA4/LBUtatO8TwT5yzKWzrkVt5Jj1EHhQS2c6G84LNhT3KbsePzwaIs8ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774253087; c=relaxed/simple;
	bh=FyDVmny1lKyWZt2C7R4yP3VBgsWQOTJUxnxweCTKAwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lvuu8c1AbvST/bSGHZQcvr3tkwMZx8O//JDRR7qfolaBZM2gbl/wTGnapB4lFURwr5YzYGDx/UgDRI9Tbr45kwBoR5z0RhSqI+TdEXs1DZHm9mZxAPEP1w4o83leIPme3no+611cLps1dDcWOzkaIyZl1c8SgrLUoCW6s1QHLro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BX5xhkIf; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BX5xhkIf"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b98133bdc4bso453703566b.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 01:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774253083; x=1774857883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PnblP8CQvZiJ+kABfLMIcb8M41A+7UuV9nDV/q05Lhs=;
        b=BX5xhkIfvOtqQ+sjrT+1bj5fWaMel8xH5mIAqCWowwymiggcRsJCAdObEaM/ARuC8e
         ho6/k2dBk+OFzuL1SKBOB+i1X/lheByloZsQ59Dnf8L0XXM0SGlw/KaYIbJ+QGc4Tzos
         qnFmU3PeLJMOlci0HfHcUdQua4gK4ag1NAhWgRb9SHsxvT0DGSzt4c0CU8Cf4xllQZTo
         HjiCD4Bw5hRrVGetx/obZznK/jK7goDMXP0amnWcUHyN5mr+XkhdNAoO8kVl5R4pvzKg
         8p4xdM76chodZnbkIbl6rXQ0Rwe7Ju5vJmIJoSmkh1pxiMygW7xboN+chUvVIydL2Lzm
         gw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774253083; x=1774857883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnblP8CQvZiJ+kABfLMIcb8M41A+7UuV9nDV/q05Lhs=;
        b=R8J6cFu+f7Xt5s4eBJzkdM7BIfdGHZVQTEUeAvIWJsYrutysgHwr0ljgvaWh852eAE
         u9wTdCYu3/gobS3DAM83Sgo2bz86AwhMnMrdaOlvFVSg3dU/Zli3cEcZPtLEANl12Nmc
         wzLrwLowJmj4LkhPC5oDNHtgB2roaAqrSMscGYd5Wmpad5SMpNkijuGyVikv2zx+39sq
         Xk3JBMXtFYj4uTT36BltbHoHAJ/y7Hwp4wlZFYimg22kkF9pAH6YizK2wHCzJ/NyH+AN
         kTbWQ7NEgSNdncOtOxufy2Ch6sgyBrysvQ1VP34Fwen4KL963yGBP33VNwyA8E1U9Ubv
         aiiw==
X-Forwarded-Encrypted: i=1; AJvYcCUNRR7ZcxE0NxH5Oq2d7J9FXMVsATf67ZucX/PLQ7MbigiLVDV1B0ssJxrJJU0BKfNCMschfGlIGfXk@vger.kernel.org
X-Gm-Message-State: AOJu0YwmKTbiaSOcxJ00iL9BqVLuauoLX422At1SX6kR1xnKwIen8JIY
	8G6KVte9jdc9AEn29KmumqFU7grHhPxm/R7smX2XeA3ZMiIv1lVcCgzw
X-Gm-Gg: ATEYQzzbaHmgQepdIwmyapMRo+0/nJr7DaiNH7jjiqv9dBeCh5ujmIT8wvXxrCNeYkt
	GSlkAn0bRaTcb3QVk7fsoF7ceOTinkhtgn6aYVIJZ+9Of6HY6u63S38cvVzguUq+2fXxdBkmhph
	ma+bl6G90kJvtjL87HPSSO4xrkQeeiP3QdsJcp/euNeF/AeS7UrNVv5p7usJ+TCq6dOZUIfYH3D
	wM7M1CLcSy86RpA4SdppxrBZeVkLAdEeNnCtTHZwMbzdJhAFsMIRTfdaoZxlXSMTLMl/FvDQ2c3
	4uYzqY0Re7JkxTkfJhj5jrKXyXJfLuNH12nY5GhA2S5mrO2htqfVl2xCjlxp9eDsIemWT0M8AOo
	Kk2umxq6dKsHxMXQLrb02Eo/IW5cQz4afpIPq4ZmWon0lfL9RJql3130WkvIDZLLHjJVMnH+wWx
	CtGCg7TsrCxCsQadmPilwcEfFX
X-Received: by 2002:a17:907:1604:b0:b96:ecc3:781b with SMTP id a640c23a62f3a-b982f0a9521mr828589066b.1.1774253083079;
        Mon, 23 Mar 2026 01:04:43 -0700 (PDT)
Received: from [192.168.1.31] ([178.231.179.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8dc51sm458431466b.22.2026.03.23.01.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 01:04:42 -0700 (PDT)
Message-ID: <3bb1da4f-f2dc-421d-95f1-5bba9e3e1aec@gmail.com>
Date: Mon, 23 Mar 2026 09:04:41 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Val Packett <val@packett.cool>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org
References: <20260305093941.305122-1-zstaseg@gmail.com>
 <20260305093941.305122-3-zstaseg@gmail.com>
 <9ea41e6c-7643-452e-abf4-f35238807a26@packett.cool>
Content-Language: en-US
From: Stanislav Zaikin <zstaseg@gmail.com>
In-Reply-To: <9ea41e6c-7643-452e-abf4-f35238807a26@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/21/26 8:36 AM, Val Packett wrote:
> Hello again :)
>
> On 3/5/26 6:39 AM, Stanislav Zaikin wrote:
>> Xiaomi 12 Lite 5G is a handset released in 2022
>> […]
>> +    touchscreen@0 {
>> +        compatible = "goodix,gt9916";
>> +        reg = <0>;
>> +
>> +        interrupts-extended = <&tlmm 81 IRQ_TYPE_LEVEL_LOW>;
>> +
>> +        reset-gpios = <&tlmm 105 GPIO_ACTIVE_LOW>;
>> +
>> +        avdd-supply = <&vreg_l7c_3p0>;
>> +        vddio-supply = <&vreg_l2c_1p8>;
>> +
>> +        spi-max-frequency = <5000000>;
>> +
>> +        touchscreen-size-x = <10800>;
>> +        touchscreen-size-y = <24000>;
>> […]
>
> I have noticed this previously and started wondering why the size was 
> 10x higher. Now with my own device (motorola-dubai) I actually found 
> out why…
>
> With the actual 1080x2400 size, the mm values reported by libinput are 
> 10x higher than what they should be, e.g. touching the bottom right 
> corner with libinput debug-events:
>
>  event3   TOUCH_MOTION              2  +1.493s  0 (0) 98.80/98.75 
> (1067.00/2370.00mm)
>
> (2.4 meter tall phone! :D) which was mooooostly "fine" except Phosh's 
> on-screen keyboard was accidentally detecting super-fast down swipes 
> as I was typing normally, and suddenly closing the keyboard as I was 
> typing.
>
I wonder why some other devices with gt9916 (there are a couple in 
mainline) that specifies 1080x2400. I don't think we can make this 
assumption unless there was a mistake already in those mainline dts.

Best regards,
Stanislav
