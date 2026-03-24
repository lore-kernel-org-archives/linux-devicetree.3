Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0863C5DC5
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 08:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339677; cv=none; b=RttdOnGCm1VnMg58S1w2ze2UzdS+AAYsnCoHvUaDh9qRyJR33QSIxsTj1n97gW6esQOMuUkq6qsU5X4f5TeccwLWd7u+8IMiGRWmWT5Sj8rgG6bAOjmZzRR619G7BRzczX8xtW442Idg4j25FxknsKGZ8XiOxhISenqxMtDPmis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339677; c=relaxed/simple;
	bh=IceAUN0OJIIAbe19yvKfIpOhT3L2MW8JFDntDXdVY0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HBPxz30FLANRnQVnjiKjCbykeqPn+vLMnoW0UyG2irNcd5B0SQEzQHLNkn2/wWv5+/MUIODi0pX3vA3Rc91N/zby1yqc+rm9/r2Y1iy6zFqxR+MqizpSbDZvl3+NSnxzSz2U18GVk2g7Ua1XtVH+flSXatq514xA1GrAtZJUjQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nooFF0DD; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nooFF0DD"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66971ccfcabso1548436a12.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774339667; x=1774944467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hU4A868t/KxQ8kSoseiIZSNGuwyJwQACouL71HeRn80=;
        b=nooFF0DDlWn3Xwd8OeeEkkhVBO18PJvGJFaweNxgRiO2KJbPXWL7L3SXtnPnoJkEFj
         0KXQyGk6VSxP8Domp+J2O83zhz1NEnInV+3hr/qdCsaeVgRy8LmyDY4upSYdZxhpLoVx
         pICFCvdP4a9lyJIWd0cnJS2n2zVCLdPsV1wWy8FlsDRkcGoSix4Co75yxNgm2Ry2yu3I
         USs20T7rG5A35iXfNIBhwBEWbqKUfC8dOMZaAPSafiC9ef5CLO/9byt/Pbeoc/cKuxW6
         L4CDagq89oyvmU+lmu63q4NGKnt1/oglSvCqnYRJ2BmLFNIrmAI+CqxT3mpNIT/sdbuz
         qYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339667; x=1774944467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hU4A868t/KxQ8kSoseiIZSNGuwyJwQACouL71HeRn80=;
        b=Jm/mAIV54R2FhyTOyTtFiY+C/WXNxy/6GJ20fEez0FqXRWDeztReXS3VfvFVmVgc93
         g1vTU59d2lA7QZsRyipOoqxbNesjFL8wydzS5vYa86hfLsbD1/gl8GMaFVw7E9QKa6bv
         5g4he5T+nCZlJ9A5CegzsM7IlYD53B2nhkYknVJI18JaJxpy3GzQxFPpwu9xcLofTT8H
         fG03YHUyVHmu1hkzgv0j5Dw9P7fquFBq4o3yKFMRMxgHs5BrqJUvE9QWzMgQeh50inzU
         t0o2dUqJXLmOIbXRhViR/iIxPkgPhhI7YRBSEw4U37dcwhqpckkhjycYFjknd4YZf5uP
         hCTg==
X-Forwarded-Encrypted: i=1; AJvYcCWIz9A+plm1AfLLeQRRD4BWhofDPrEiHqCvgN9ZUxITCOcCa8CgSlx8bc2f5Mo5qmk3+ZeILssEtCoq@vger.kernel.org
X-Gm-Message-State: AOJu0YzKkjh9eivJx5PaanABeELTxuDwyTxORLm6ijqSYabhzIjmsy64
	qYewxPemjkX5puXy2BO3hSbF7ndXQBGKR5fsm/6SaVSbxTayfo588Mw4
X-Gm-Gg: ATEYQzyIbxKaY5TRtboKOOWkO4vbPp8CLC8higcr5ZdwP783rLF1OJJGUNQUrlDnuIk
	IKCHmJrFuQTlzjgqY0i8E24N+B27SmnvHyd76Q/UciKOk7KHW4yONb9B3QJMYxFAllDnd0+7VAh
	kL2omdjseATeCo4QhSfLUqaQp5REuX+GSScgf/+9M5xa39sfyMuHlcarvIX14tpZ4QUykV2cnyU
	xHFMa2mEDjQ9ZjTqyMLAcsxCeYOvBq5Boak3ItCtogHt93jJ1KHdJveJq5G7epQNYXJfKThzf6i
	VO8p5Voq4ROezdLKLxAEnZ9LyRl1sIVDJqjPsv86+ksIcuDG8aFq409zYnaF4uEF1sLFBdUBqJo
	nz4rOHuZoWYYR6/dUcCVa52Gkm5uu/so5p+X79uODdWCq5LgOQlALA5UzmqbcZrCgU1kkURVOoj
	3wn41U1fjYgfPnYSiFkDWMrXUsTw==
X-Received: by 2002:a05:6402:2342:b0:667:2fd:4ead with SMTP id 4fb4d7f45d1cf-668c9b206ffmr10183916a12.27.1774339666291;
        Tue, 24 Mar 2026 01:07:46 -0700 (PDT)
Received: from [192.168.1.31] ([178.230.175.206])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d219abf6sm4487923a12.20.2026.03.24.01.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 01:07:45 -0700 (PDT)
Message-ID: <2fd29380-468a-4f09-853a-f63c67a3a3aa@gmail.com>
Date: Tue, 24 Mar 2026 09:07:43 +0100
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
 <3bb1da4f-f2dc-421d-95f1-5bba9e3e1aec@gmail.com>
 <02913b5c-ce09-4fb7-a3dd-71bf7330439d@packett.cool>
Content-Language: en-US
From: Stanislav Zaikin <zstaseg@gmail.com>
In-Reply-To: <02913b5c-ce09-4fb7-a3dd-71bf7330439d@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/23/26 9:49 PM, Val Packett wrote:
>
> On 3/23/26 05:04, Stanislav Zaikin wrote:
>> On 3/21/26 8:36 AM, Val Packett wrote:
>>> Hello again :)
>>>
>>> On 3/5/26 6:39 AM, Stanislav Zaikin wrote:
>>>> Xiaomi 12 Lite 5G is a handset released in 2022
>>>> […]
>>>> +    touchscreen@0 {
>>>> +        compatible = "goodix,gt9916";
>>>> +        reg = <0>;
>>>> +
>>>> +        interrupts-extended = <&tlmm 81 IRQ_TYPE_LEVEL_LOW>;
>>>> +
>>>> +        reset-gpios = <&tlmm 105 GPIO_ACTIVE_LOW>;
>>>> +
>>>> +        avdd-supply = <&vreg_l7c_3p0>;
>>>> +        vddio-supply = <&vreg_l2c_1p8>;
>>>> +
>>>> +        spi-max-frequency = <5000000>;
>>>> +
>>>> +        touchscreen-size-x = <10800>;
>>>> +        touchscreen-size-y = <24000>;
>>>> […]
>>>
>>> I have noticed this previously and started wondering why the size 
>>> was 10x higher. Now with my own device (motorola-dubai) I actually 
>>> found out why…
>>>
>>> With the actual 1080x2400 size, the mm values reported by libinput 
>>> are 10x higher than what they should be, e.g. touching the bottom 
>>> right corner with libinput debug-events:
>>>
>>>  event3   TOUCH_MOTION              2  +1.493s  0 (0) 98.80/98.75 
>>> (1067.00/2370.00mm)
>>>
>>> (2.4 meter tall phone! :D) which was mooooostly "fine" except 
>>> Phosh's on-screen keyboard was accidentally detecting super-fast 
>>> down swipes as I was typing normally, and suddenly closing the 
>>> keyboard as I was typing.
>>>
>> I wonder why some other devices with gt9916 (there are a couple in 
>> mainline) that specifies 1080x2400. I don't think we can make this 
>> assumption unless there was a mistake already in those mainline dts.
>>
>> Best regards,
>> Stanislav
>
> Not sure what you meant there..

I meant the existing dts files that use gt9916:

sm8550-qrd.dts

sm8650-qrd.dts

sm8650-hdk-display-card.dtso

All of those specify 1080x2400. That means either those boards weren't 
tested (by physically tapping the touchscreen at least) or that there's 
something else.

> I have not seen other devices do the 10800/24000 thing. Please set 
> 1080/2400 (actual size not 10x larger).
That part I get and I will.

Best regards,
Stanislav
