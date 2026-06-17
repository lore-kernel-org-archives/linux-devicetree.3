Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0B43C09EA
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692664; cv=none; b=Lp87sxwoothp2Xf7qPWsyw0u0PRoSEYg/3FBU6wovcHzsYp5IglNSbbBzXECVpDGZYZOhk5B02wih2EAHRJ978oGiL0bbdVP1W76o8nHESs1cVSsUgCU77W7Lb4aM/iMqo/lAkDi926LsKRBMf6NCi0vCTKGV48bmYreX3qF0EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692664; c=relaxed/simple;
	bh=vALBa141v9+4vjbm0tDzeCmo10QrWJe8iyZLknBjxgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+ZTLoG2o6naDkr5HAyp6ZDiYFPTiXwDLzuTodTHMNszLNZDS8LEhH6gbIphxowj0oCw9syDMgnvDFcJbpQYLFaTmJScSz187ekcL2ufkDlPfRmHP6L2VoX2Ui+aY9YCLAU5/7oYBrKhFyKD176twhTuw/cDwfN1wkBqgSbwokg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1YmmjYD; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1YmmjYD"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so45235b3a.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692657; x=1782297457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AhUWEjlecPu7hlJvyuwWPRxl2TYmG2bGNVOKZVs0d90=;
        b=E1YmmjYDjCUx9OJ3ntJZw/6fpoMkUtMDaBpQkhkwZsHP8jc4Q4qCqd51Dz9g5oLhFT
         DKEcwsg28cmEhDTRqov5vllPZZOeUDXLb3Vvyv/um6sKdzpRdybDlvDLzDIRxuKJgHaS
         YVOB7ewjj9yZ+fSMWUVfX1ntJxShCLCCVO3AOVx506Z/mhQ3pZjcGOoaDVUlej2VclYW
         XhCnQURpfN+32uSxJovqD60JWiotlpf+S2Tp1ZVopyIeeQ1yBYG035FrADRVIY7o/4gV
         0rtp7CC1pCpBaPNDCbdSs5qsENh+ygCl2GEXD37UuJW4q5jfV3eh6ooupMMjfdhzYt+A
         NDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692657; x=1782297457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhUWEjlecPu7hlJvyuwWPRxl2TYmG2bGNVOKZVs0d90=;
        b=GxKQFXV0JW+j/u9S7xFcRs/WtIPr1jEn0bbiPsn8PFyw1r0QFt6axRfLOSqaO4lHos
         bLIoN/jp3cnAnEKWWTyGjxIQkLoatEarwF/EitlR31EPxqO+QJecsg0EX7tIW3DoN/fo
         BB1J0YtKRkg6ufSGsKbnXcWq4LuLboUOtLz/kVQWgcU2kudjbQX2cK1HWZ6/xuFC01Mu
         en8RZPGh7N9csVCsdIA5CHBVxImEqL+bQmyOy/2wUvGw/myr7jULmZgPLmo3sa6mf2sT
         uupoV5WvG0Jq1uYkP0hYiDS1PF5AZizx0yA5BwloKlnYZdtDe3B7CFqCCUy/Gs+1lWO7
         /JHg==
X-Forwarded-Encrypted: i=1; AFNElJ8tJH8a5t8hwCtMucFfEvn6OAhqAa+iJlT2c5Si+oB6JdZEWhlWyKo5HTtk737mZtoSX1yeZJYFwsq4@vger.kernel.org
X-Gm-Message-State: AOJu0YxthkGQslESP1pYyJtz6fp7vcx9bTX2N15zgTCoQAR1ex3ZGEjG
	zYBrt7vtOhYm9GNO3FOiyn9IUlw7DTquTv3tTw2K4blZIMODUYHUVrtw
X-Gm-Gg: Acq92OGeTIGdgeUnnUz/x89ZXnaW4Jc/BOS6MfX+kJIcjj8db63w/oLgKeFWjvj4rgV
	fxWnCFWmeFHvl7NostC4cy+93mHx/YlBNpGYKrHfVr1vw8UHCA9IE2C98nW6HCcJIc4kE9pu/ec
	Z/LZbRGQzwe/5EtMpVhjSIcmMS8WkppkoVmwYo9zCu+HtogGdP/u/3Uewput7Y6KNPMuBZ0xX3a
	4ow9viwCbv6BvXu/lHv3akNTKyQiJvcyHIDsFO2dfV8BN9u6GBCO88iGZDE0GfuG2kD4MfgycJ4
	31RDlgQE+wQJQlJ8cSslV/umGXGyKBoz2wNFVWkVfoW6V3WJA5ekIc5FWhzHp+vh3Q11FxXgWgo
	4Vehwe1peXkz3ruODJscVRk5Mc2EzsxkSS/xhOBqnEOPPM2kwj5H0q0u26Mhx54xkDgZLBCaxbc
	SJif61pj3PsxCNex6v48WBksTijOwy+U418T05jzhsvvErTn6KQIZNYK2+Gp/GaJbZsc28gpKAv
	IBZ
X-Received: by 2002:a05:6a00:10d5:b0:842:4a39:6047 with SMTP id d2e1a72fcca58-84524550f44mr3301789b3a.29.1781692657527;
        Wed, 17 Jun 2026 03:37:37 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ad03fdcsm15269159b3a.24.2026.06.17.03.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:37:37 -0700 (PDT)
Message-ID: <bd90109d-5c1c-47d6-ac1a-c9b81de5cf7b@gmail.com>
Date: Wed, 17 Jun 2026 18:37:33 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] drm/verisilicon: add DCUltraLite chip identity to
 HWDB
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260615065003.76661-1-a0987203069@gmail.com>
 <20260615065003.76661-6-a0987203069@gmail.com>
 <62c0b8ab9b6d9f994daa8bb60b3b626688af7d5e.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <62c0b8ab9b6d9f994daa8bb60b3b626688af7d5e.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/15/2026 4:57 PM, Icenowy Zheng wrote:
> 在 2026-06-15一的 14:50 +0800，Joey Lu写道：
>> Register the Nuvoton MA35D1 DCUltraLite chip identity in
>> vs_chip_identities[]:
>>    model       = 0x0   (DCUltraLite; Verisilicon uses 0 for this IP)
>>    revision    = 0x5560
>>    customer_id = 0x305
>>    generation  = VSDC_GEN_DC8000
>>    display_count = 1
>>    max_cursor_size = 32
> I suggest make this more human-readable instead of replicating the
> machine-readable data of HWDB.
>
> My proposal here:
>
> ```
> The Nuvoton MA35D1 chip contains a DCUltraLite display controller with
> model number 0x0 (sic, the model name contains no number either),
> revision 0x5560 and customer ID 0x305. It has a similar register map
> with DC8000, only one display output and only 32x32 cursor supported.
> ```
Thanks. I will use your proposed wording for the commit message in v5
>> Placing this entry last makes it the gate that enables MA35D1
>> hardware
>> recognition only after all the supporting ops and DT binding changes
>> are
>> in place.
> It's a little ambiguous that "last" here means whether the last in the
> patchset or the last in the HWDB array, although I think it's not so
> needed to explain the reason of the place in the patchset.
>
> I propose just say `Adding it to the HWDB to enable it to be usable
> with the verisilicon driver.` .
I will simplify the placement sentence to "Adding it to the HWDB to 
enable it to be usable with the verisilicon driver." in v5.
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/verisilicon/vs_hwdb.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> b/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> index 91524d16f778..7d630a667a3f 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> @@ -129,6 +129,16 @@ static struct vs_chip_identity
>> vs_chip_identities[] = {
>>   		.max_cursor_size = 64,
>>   		.formats = &vs_formats_no_yuv444,
>>   	},
>> +	{
>> +		.model = 0x0,		/* DCUltraLite */
>> +		.revision = 0x5560,
>> +		.customer_id = 0x305,
>> +
>> +		.generation = VSDC_GEN_DC8000,
>> +		.display_count = 1,
>> +		.max_cursor_size = 32,
>> +		.formats = &vs_formats_no_yuv444,
>> +	},
>>   };
>>   
>>   int vs_fill_chip_identity(struct regmap *regs,
