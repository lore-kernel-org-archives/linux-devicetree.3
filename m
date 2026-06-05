Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08144372B51
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 02:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780626107; cv=none; b=Np0WDhpth/4yiNW99XwBEu8jicJEvF1EEtAizfeMCAf758To01hYeOLLOwxx23bCVAh91d64lELdmd7hVMG18d4U2a6nHBK3MDoGmoSGdW3E3nSNre7XrXwclDz3aEcBh4V8vuvQqkJorYKzlO2J1nCBJpeKR5W6on7oo/A3qGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780626107; c=relaxed/simple;
	bh=UpSqqvDHDdTEzixob6x+tfaItodOdKYq5bD+PPOrbxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EvzWp2uzGBBUl75OaOe1rnZOgt8nwxMj+0/ph92oleHBi3ebkeIzdS5tD6x044xMYhkfF0D2fhWNndFCvr9UBhyq1d1gsLUILN+MX6WlN4OvNjLqss8nDiBclu09sPBm9VoYVJE7XZp9MnQsXpj4O6KbHVqOoURdAU/x5OvloCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmsL8FVZ; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmsL8FVZ"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-36da151a152so998010a91.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 19:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780626101; x=1781230901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QqLcGGd7rvwHMlJMGTwOXykGd0+t/FmTCrqNKr3eqvo=;
        b=NmsL8FVZX0NohIoqrw0t4LFQuA8mBZNNPQskuGIT6DK66I9DoNe4A8pP0kMtYtWCxj
         fJevjp0iE8mZDf7R+dG7YyV7m6yAFZF3T4EFv3kVQGktwQGzlF6s3869h4ZLGAbNtonl
         nB0jCVj7UxsLw8EnzMEBUt4UydLtNxf34FVZ5z3i63Z1WzClGUN6u7UiFZnfhhXFnvYZ
         gmiXP0gXOOfih+G26W3Lwq8HZ9L+jicMn0MsDyeRG0mjD2YrBXDinNeWxTdtRx06j3Ea
         HRYNeFSf0HV9OlZ4/gZQEfHkSljZjIXw73/gxvl/cQ+PTltg/J8LaihYlnkeSdYxhyza
         09lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780626101; x=1781230901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqLcGGd7rvwHMlJMGTwOXykGd0+t/FmTCrqNKr3eqvo=;
        b=pFyUF+F66JXvmKabhuGUqHiSE9DIfq2e5oMS/kVt9veyHD70+dXRAKLxl9skegh0CY
         87ykuGcHjGl+OEVUvdq++dplJjuxrh0k7dJCIN3IAElT66jVWhgq7W1ptpSVbU4xGjuh
         SYkM8PasReW7QXDbNz0orFrt6TulUkqO1De+o1TeFHwJRhijh24ZXHDQMPVzTaxBd+Mw
         g/QcKluHlNDIOR65kG0M4IhzKLga6D6jBkO6YVHqXRfkaLXaS1MYIxCGlLjzGyuASiV6
         aiv+1PINH/q4b/kBMKf6D80gBKkXd4cQHBtW75WmCvqxOzgqfQt2EUGoGgGPxgR1hlyi
         vllQ==
X-Gm-Message-State: AOJu0Yx1z7EYiDQ0aO/pskojPthtcMlo82RLkc2mhHy8AZP5d2wK2tZm
	DjEKDxEQXbXKqG9lP2j1Uao2ZBENfxYhhKXzCcQZTY24LM3MZCo9F39+vKLvcTKVlggTyQ==
X-Gm-Gg: Acq92OECvr7zeak8iUH7pGNA+Q0+Mip+ZR2SPQAqcd7e9jT8AFu61EdKMKcoIv1y0Ow
	sdJwEt1z+4WgGqlA2A2VpQ+eUUEd7iDSQQtXzMLz1D/lx383lOuP45QGWsSHcwHhSwIQAX8vsaG
	tVCB+YTUuUQjXLFueS4AOXhj3qIv2H5cbVQIUJKvMkCXTbsxmu2ZxWUGwi3y+DpXwFM3BFmBhOc
	tylcPnyEM9FDg4lCweHKIkXFWWOY+eJycVZL0GGu2yRSM5jNAFyiIsuLYyTNT28ZvGzuAvgLQi2
	mrZEOKOgVibidu3GVii7Vd7ysoeru35gZabJCkFx3c6KrWfqUM9t5KtPqwTzuJ9XBRQ3fA6G18E
	3OtMykuJhhPhujkcuqxIjxnOxExhPCvqNsnt0rrjFlfAbTOtRTko5Pw6b4Ne+ljuU6lN3rvFPsO
	3AC/PK7xiQ3KAM4Vff/8weYHPLQKUfgAnuGB1u73BDzw==
X-Received: by 2002:a17:90b:4fd0:b0:36d:66d4:270e with SMTP id 98e67ed59e1d1-370ee5450e3mr1789679a91.5.1780626100917;
        Thu, 04 Jun 2026 19:21:40 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6dba8573sm6088363a91.14.2026.06.04.19.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 19:21:40 -0700 (PDT)
Message-ID: <da7ff688-3d16-4954-a2da-6d3e7d214996@gmail.com>
Date: Fri, 5 Jun 2026 10:21:34 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] of: reserved_mem: add config to extend dynamic
 reserved memory regions
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 saravanak@kernel.org
References: <20260604073611.3954433-1-chenwandun1@gmail.com>
 <20260604073611.3954433-3-chenwandun1@gmail.com>
 <20260604193336.GB1057262-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260604193336.GB1057262-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/5/26 03:33, Rob Herring wrote:
> On Thu, Jun 04, 2026 at 03:36:11PM +0800, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> Nowadays, the dynamic reserved memory regions is 64 by default, If
>> the count of reserved memory regions defined in DTS bigger than 64,
>> only 64 reserved memory can be handled properly.
>>
>> So add a config to configure the actual dynamic reserved memory
>> regions count instead of modify the code.
>>
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> ---
>>   drivers/of/Kconfig           | 11 +++++++++++
>>   drivers/of/of_private.h      |  2 +-
>>   drivers/of/of_reserved_mem.c |  2 +-
>>   3 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
>> index 50697cc3b07e..d6496ec3765c 100644
>> --- a/drivers/of/Kconfig
>> +++ b/drivers/of/Kconfig
>> @@ -99,6 +99,17 @@ config OF_IRQ
>>   config OF_RESERVED_MEM
>>   	def_bool OF_EARLY_FLATTREE
>>   
>> +config OF_RESERVED_MEM_DYNAMIC_REGIONS
>> +	int "Maximum count of the dynamic reserved memory regions"
>> +	depends on OF_RESERVED_MEM
>> +	default 64
>> +	range 1 256
> My opinion on making this a config option is well documented. That's the
> primary reason we split dynamic regions.
Get it.
>
> How many do you need and why do you need so many regions? Seems like an
> abuse of reserved memory.
I also agree that 64 dynamic regions should be sufficient for reasonable 
use cases.
To give some context on why I wrote this patch: the 64 dynamic region 
limit is implicit, there is no message to inform the user, but more than 
64 regions also seems like an abuse of reserved memory. I will drop this 
patch as well, thanks for the review. Best regards, Wandun
>
> Rob

