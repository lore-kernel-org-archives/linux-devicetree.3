Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6CE347FFE
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781675345; cv=none; b=fp7v7sG/zq74yfI3fBRxEcwa7cEvO/asHSuWSnFcfp1bcf2xqC0ndB2b62MkQSSWYuULxtzwp6idjON2k84IWlBCfu6AyNZHfNLyi6ZDLVsRoRCGmOtWTfR0rJiakDf4XTgh60ccbRZMrsr8Ho34s5QM0wo7ijchLMRQSXSboJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781675345; c=relaxed/simple;
	bh=tOLPobJGImk32z+uI0P48pC/EhiuZZJOvuzAJ9JDBuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hh48xEkNhmEJ+zUNhRnWBqOIG2L3lNTa16HwRRK+JOB8oFr3ZqNhDy56Y1PU7Kr7yluFALJjuvxxEZqMAJqZuAlqjTQoPMJ2qFJfw3fqtNSnoTytq/2Pa5SUWeZC84nNn36vvgOGBMwZo5Gfz+ME7s1cocwR8EWyH20xv9hAC2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1SeiIiL; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1SeiIiL"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa7a7ad475so5883703e87.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 22:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781675340; x=1782280140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GReM3q6YXZFLN+dAGJRab/+ogzJoSPpuLtrW0PQUfak=;
        b=N1SeiIiLfnFJnlCjG5p1yn54k2DQe22AJq+6aeUDudC2tag9Y6GWhC8VVsQ6jKDqC7
         vkmPSRdpJYRWluEQDejJaQgjXh01mWPuUTtzvZ2FXj2LnJszSYcpYMiFPPeC2Ax+0qPS
         VlsrJUbbklzhGBXdcCx3BZtbxaZnje7FBZaPoQKZkAq3a5gHPCkMC+ZEu/1ZVb/a4oV4
         l67FIN8SMCZQz9hPK5fO4mNInpRNd8Kjp08fMz7h3+/qPMifFPeYcCTOdqT1Ma4QX1la
         BSkxBCyxRtTB6N6KI0RCegp5ppnILGHOWxCfRSGMbGAIlTNqqbkp4oqZZxLqrWA4Bxvb
         I+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781675340; x=1782280140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GReM3q6YXZFLN+dAGJRab/+ogzJoSPpuLtrW0PQUfak=;
        b=Q2bDuuRgIS2MRnvmZQw0TI6eT/+EqG2wlUeCxH/11vw4Mk6e8QUMMAbqP5Pk8AcLUL
         UTJtM/I0jEc8kaTvB8cOE3+/jDaNnVj6WF7umkfEDqudbWA+6XiHOdOxglcbI0eS6hWI
         hGfuhAti8vhh5Y1wgnGikUwrU0nWSLbl6/XYqylz8chSbkI5mbueAoZDX/sQIJhdKkPw
         kou5DcWYNmVALJe6wZ0Eq3LZUavBR+LNFtAaaUNf8uqeQCXl9wOZn7IlBLy9qVrIDR9G
         cLynBt37KfobPsUStPEesw0cljo7gprwBLSn3SGtTXj+HQ3qKStY3mMJ7UMMuen3CTjz
         nRZA==
X-Forwarded-Encrypted: i=1; AFNElJ9H82Xlif0q3wt4ydXuSi1EV0j3TSkw9hxDLtYO+7WJkGsy8YeycSEICL3F5/2dBQgMl2xOPhrllkJs@vger.kernel.org
X-Gm-Message-State: AOJu0YwxW9mt8jz+nSWrfjYYrkCAZ2YDPizfynH7Ctp4xeza8PwJGs1S
	u3d1j79sRIKzP80Pemy97r9uGMDZ/yAGyJqW6+f+qYMkc3DwCTPws37A
X-Gm-Gg: Acq92OEsEScwEY8RvKxb7BRzPD5fY8LHoup8ymR5IYbW41KMqP18HHwsENUW9IqYKUi
	dTIJ5MNUZM1U5Oz7ivhnXizADdwtIfTg8YL9iGlkx05uMrLVV4xdf+jn6fI39akn346J6cQdhTe
	LY0eVRTRI4UtXWNWhhWaMzL90LwlV30WA1Z5Mq3ld/xwCx7Lm8+JH66JeaLEanAcSKoRXdrPDQW
	9IepUbVEZQvU/5fRjoTWQAi0XY7kRwRelwCpvFWTUeIfYX9tgIl2wWDCYafN+8AmbXQfp2IFIOp
	Q5bBb6RkbKsIIehAy0XDD/oJwbPoberaWNXHeEUClO5VrvsmtXT8UTTSew5RVNPmKUHC9n64e1i
	YZF2Dt73T60AV9pDl4catFWY8aNqoHexV8xx36fdh9lsg8NHnfaafqjpwz3hBR/TI2GwZMYO8Xm
	lS6B7WOqylBTFtFquewpZhDU/uwU5K8qEWP7HaliSg/QuKHLGf1BnHUjFWNYhueukMRf8KelmCi
	BbPIkrw
X-Received: by 2002:a05:6512:63c3:10b0:5aa:66a5:66cb with SMTP id 2adb3069b0e04-5ad47efff06mr318251e87.25.1781675340163;
        Tue, 16 Jun 2026 22:49:00 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1baba7sm4087383e87.83.2026.06.16.22.48.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 22:48:59 -0700 (PDT)
Message-ID: <46b3f680-91a9-4a2a-a197-8f0ca5e38b90@gmail.com>
Date: Wed, 17 Jun 2026 08:48:58 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] hwmon: adm1275: Support ROHM BD12780
To: Guenter Roeck <linux@roeck-us.net>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Wensheng Wang <wenswang@yeah.net>,
 Ashish Yadav <ashish.yadav@infineon.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
 Charles Hsu <hsu.yungteng@gmail.com>, ChiShih Tsai <tomtsai764@gmail.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <cover.1781591132.git.mazziesaccount@gmail.com>
 <c92f1356fbf967dee3130f2eb0da08eb84800d47.1781591132.git.mazziesaccount@gmail.com>
 <67bec6ae-4f21-441a-8c5e-b56bd1a2ab84@roeck-us.net>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <67bec6ae-4f21-441a-8c5e-b56bd1a2ab84@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for taking the time to review this! Feedback is appreciated :)

On 16/06/2026 17:13, Guenter Roeck wrote:
> On 6/15/26 23:36, Matti Vaittinen wrote:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ROHM BD12780 and BD12780A are hot-swap controllers. They are largely
>> similar to Analog Devices ADM1278. Besides the ID registers and some
>> added functionality, the BD12780 and BD12780A mark PMON_CONFIG bits
>> [15:14] as reserved. Hence TSFILT setting must be omitted on these ICs.
>>
>> The BD12780 has 3 pins usable for configuring the I2C address. The
>> BD12780A lists the ADDR3-pin as "not connect".
>>
>> Support ROHM BD12780 and BD12780A controllers.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> ---
>>   drivers/hwmon/pmbus/Kconfig   |  2 +-
>>   drivers/hwmon/pmbus/adm1275.c | 46 +++++++++++++++++++++++++++++------
>>   2 files changed, 39 insertions(+), 9 deletions(-)
>>

// snip

>> @@ -487,6 +489,21 @@ static const struct i2c_device_id adm1275_id[] = {
>>       { "adm1281", adm1281 },
>>       { "adm1293", adm1293 },
>>       { "adm1294", adm1294 },
>> +    /*
>> +     * The BD12780a is functionally identical to BD12780(*). Even the 
>> pmbus ID
>> +     * register contents are same. When instantiated from the DT, it 
>> is required
>> +     * to have the bd12780 as a fall-back. We still need the bd12780a 
>> ID here,
>> +     * because the i2c_device_id is created from the first 
>> compatible, not from
>> +     * the fall-back entry.
>> +     * (*)Until proven to differ. I prefer having own compatible for 
>> these
>> +     * variants for that day. Please note that even though the probe 
>> is called
>> +     * based on the 'bd12780a' -entry, the ID is picked at probe 
>> based on the
>> +     * pmbus register contents and not by DT entry. Thus, if the 
>> bd12780 and
>> +     * bd12780a are found to require different handling, then this 
>> needs to be
>> +     * changed, or bd12780a is handled as bd12780.
>> +     */
>> +    { "bd12780", bd12780 },
>> +    { "bd12780a", /* driver data unused, see --^ */ },
> 
> We don't usually do that. There are various A/B/C variants for many chips,
> and we just use the base name unless a difference is warranted. Either this
> is needed, and driver data is needed as well, or it isn't. If it is not 
> needed,
> it should be dropped.

At the moment the only difference I know is reduced amount of I2C slave 
addresses. This shouldn't be visible to this driver.

My problem is that I don't know for sure if we later notice something 
that requires differentiating. Thus I would like to have different DT 
compatibles (or other source of I2C IDs if those are used to instantiate 
the driver). If we don't do this, then we have problems if we later find 
out that these ICs require different handling as users because we can't 
differentiate these ICs if they are described with same compatible/I2C ID.

The "fun" thing is that both variants have exactly same MFR_MODEL and 
MFR_REVISION register contents. Thus, these ICs can't be differentiated 
by reading PMBus registers.

This is also why the driver data entry gets unused. The existing probe 
mechanism in this driver, scans the names in this ID list and compares 
it to the PMBus MFR_MODEL, and then picks-up the driver data to use. Now 
because BD12780 and BD12780A both have same MFR_MODEL, the scan in probe 
will always pick the same driver data entry, no matter what ID was 
matched by bus code. That's why I added the comment here.

If I drop the { "bd12780a", /* driver data unused, see --^ */ } -entry 
from the ID list and add the of_device_ids, then I think this problem is 
solved for the DT-platforms. As far as I understand, this would still 
cause any non DT platform to describe both variants as "bd12780", making 
it impossible to later differentiate ICs in the driver, right? I can do 
this, but for me it feels a bit like asking for problems...

My thinking was to have different IDs for these variants so hardware 
description could have different IDs for different ICs. Then, if we 
later need to differentiate these ICs, we still have an option to change 
the probe to trust the i2c_get_match_data() when PMBus indicates the 
bd12780.

This however is some extra complexity, and I would like to add it to the 
probe only if it really is required.

But yeah, having an ID entry in the list and driver data not used even 
when the matching IC is found, is unusual and would have caught me off 
guard. Hence I added the (long) comment.

> 
>>       { "mc09c", sq24905c },
>>       { }
>>   };

// snip

>> @@ -712,7 +732,16 @@ static int adm1275_probe(struct i2c_client *client)
>>           break;
>>       case adm1278:
>>       case adm1281:
>> +    case bd12780:
>>       case sq24905c:
>> +    {
>> +        u16 defconfig;
>> +
>> +        if (data->id == bd12780)
>> +            defconfig = BD12780_PMON_DEFCONFIG;
>> +        else
>> +            defconfig = ADM1278_PMON_DEFCONFIG;
>> +
> 
> Please add a separate case statement for the new chip
> and do not overload existing chip data.

I originally did just that. I, however, was not happy with this as it 
resulted quite long own case this IC, which is almost identical to this 
other (adm1278, adm1281, sq24905c) case. I wanted the code to shout that 
the DB12780 is indeed (almost) identical to the adm1278. But yeah, I 
agree, having "if (foo)" in "switch (foo)" case can get confusing.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
