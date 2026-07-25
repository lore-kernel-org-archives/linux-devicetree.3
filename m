Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCDD2C0296
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784989399; cv=none; b=RpcAjtJiicUanpDdxd/KAyq3oHgEpcLenZqvypIQomoPHtSEmD0dZqnMNwNR7Lx/Li66OJdyDtjEspEuIfRZ2K/sa0Gh9mjU7zjyDMW9U1HRB8PwlEy2PzJa8/4xhXA7+FcYytowPnUVrJX4PZ4eArG7IC5rsZinTYbqkrnQtbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784989399; c=relaxed/simple;
	bh=CkQtizK4VkMHMnQs8GKBodR2V58IDw4SiMug9gws+T4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hRwVxcsfRY7T3bD1LDMSe45oI59PtueNRg9PaFpMHy9Pouo/DWnIe6HdWkz8xRnpbANQumpMltf7YGH9NUervXdovNjJsZK6cwiaRqXaerr1MPL1EkiPVXzeljggIdLcsJ51ZUigaXDFe9ngh6tvSbp/o6fF7omochHQVKPGNCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMWbKylS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMWbKylS"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e507b079dso655655b3a.0
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 07:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784989396; x=1785594196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+uBAPRCroeRo5mjG5+ZSRsQyaGZHZteMBuB0HnXeE0=;
        b=fMWbKylS8VL1Y+JcCAi3ngznQL/v9IWpegITRdPktZ8wru4OymgEgs1I58ztFHLRXO
         dd8eN1E1Nvjejcddb8UNvmctLp3bmmT/5cUybZiC8mOMECibI+P20sVyUq3oDDC0E0kw
         5vAXZ4dW14iFuVb+zlXouUHY57j4dhtgX3FUwjVFzuvmN3h8l9NAWml4kVoU8IDTnrwt
         brizDnmNSLmdlj2vs8MK/MZt8fC7VMIwbpwCxmfjejXnt06jDyK3y9n6yZkxvCyxxtbA
         0ayCMMvhfggjvEMYEmlX6N9FjOdchhvWYJKRX+pZFzXQZwE0w2ZTBjt7bHWXxcKScBdE
         bqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784989396; x=1785594196;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3+uBAPRCroeRo5mjG5+ZSRsQyaGZHZteMBuB0HnXeE0=;
        b=cwEPyJ/CSAJ2TLfvfNyCHZeccKM3XXNOOelejOTr9ZNcD+PL/DS3nDHRfx0vckDfVX
         8slQWU0pqXBW5JX70jK5Zn5CujxH+hpezTS5joa1lprTztF3Ea22iMrZYTIxpl5wwH2r
         SdVvJZ0E9P2gkGfIJTK3/PTPMxdC1kkPBZFB/e1oQ3dSOLay67k98YR9UbGlwE++ZOtd
         gVYdxJUUm1ILr6FhiVvY5qdyAXUqGwaFKY29CW53Zfbl83Wjo7PvwBHVCt+AYum1qQtE
         tyI6LWEyw5uGnObhgAghO6JUWw6nleg4TYNWYVRjmE1KMv0vJ4K0wFzbyg1ab6FL//sW
         SP6g==
X-Forwarded-Encrypted: i=1; AHgh+RprWpp0330/j91AmdlcBatA5pldBCJQcq3Mai+gCmw+VFt7hGU9HZI5S3fgfeYyObqnOYcOX3hKFiHZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwWzCJm7V4LNs0uyME8Y6Q1cEccrymvs8cEgruRoUKJ5NpKhvV5
	j8gJclxVuPYEIWbWKl1FxW8x+uTD84DhavbRLYLcUbYKjPi0yDc7kKzg
X-Gm-Gg: AR+sD10EmYBU3TzrcaxHO371GPdl3YeMWKMX5a7I0CuVnFUAQPzKodfHwlRfvmN48ft
	ARSlPp2mVGL6prCNvx22wOpp//ot7KB9SlMwE8xKQUav3ItgpUyQW0HrRu1pr3v0RoRfFMMuBYb
	7n5ikcyL90cFngGMPfdnwI1HDEWM/NQP2HJo6Kvk58H1DDu/P+LBY9m+t+kEHlzoxMGCY/BmaeZ
	HtdrCW845wVsfHu7JmapLG6D1iyWt82R4GZwKMOWBx5t/whxUBPy6OUHIHLmK0Cp6VvHKMf1ciX
	DvWKaoEjfmjwNoPVQR7KQu2mUJadhZoiQd23Ea+EGdYPemfGRv9raZbYGhfifJyNzSb9MWYHBzE
	jA2i7ORROSfF/HLx/kZ02MwH2XPp9h7IeOZD2CUu8vUhJ2c1Hg1sy3M0zKUDcVQcM89BkqtO5xI
	4x4q88ttCTNSIu90HFI8BWcrKiOHX7aWD/8pkPXGIH2fM/qPXBujw=
X-Received: by 2002:a05:6a20:244e:b0:3c0:9c1a:8952 with SMTP id adf61e73a8af0-3c67e0dbc72mr2275973637.74.1784989395556;
        Sat, 25 Jul 2026 07:23:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc584433sm10233729eec.23.2026.07.25.07.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2026 07:23:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1d7b6ff4-4ea6-41c4-b59c-25e14fdd8b53@roeck-us.net>
Date: Sat, 25 Jul 2026 07:23:13 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hwmon: (emc1403) Convert to use OF bindings
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721095935.439174-1-clamor95@gmail.com>
 <20260721095935.439174-3-clamor95@gmail.com> <amGz2YZogakb5XAv@monoceros>
 <CAPVz0n3WKw74zg0HmBBOo8Z7JV_pku-DjsgKF_74B8EdD5cXgA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAPVz0n3WKw74zg0HmBBOo8Z7JV_pku-DjsgKF_74B8EdD5cXgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/25/26 06:24, Svyatoslav Ryhel wrote:
> чт, 23 лип. 2026 р. о 09:28 Uwe Kleine-König
> <u.kleine-koenig@baylibre.com> пише:
>>
>> Hello,
>>
>> On Tue, Jul 21, 2026 at 12:59:34PM +0300, Svyatoslav Ryhel wrote:
>>> From: Jonas Schwöbel <jonasschwoebel@yahoo.de>
>>>
>>> Add OF match compatible table to be able to use this driver with Device
>>> Trees.
>>>
>>> Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
>>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Please put your S-o-b line last.
>>
> 
> If S-o-b's should be chronological, then this order is correct.
> Guenter added his reviewed-by after I have added my signed-off-by.
> 

That refers to S-o-B, not to Reviewed-by: trailers.

Do we really have to argue about something like this ? Do I have
to mandate the order of non-SoB trailers for this subsystem ?

Guenter

>>> ---
>>>   drivers/hwmon/emc1403.c | 16 ++++++++++++++--
>>>   1 file changed, 14 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
>>> index cd753b38709f2..b7ab6069ec7b1 100644
>>> --- a/drivers/hwmon/emc1403.c
>>> +++ b/drivers/hwmon/emc1403.c
>>> @@ -16,6 +16,7 @@
>>>   #include <linux/hwmon.h>
>>>   #include <linux/hwmon-sysfs.h>
>>>   #include <linux/err.h>
>>> +#include <linux/mod_devicetable.h>
>>
>> Don't add <linux/mod_devicetable.h> please. struct of_device_id is also
>> provided by <linux/i2c.h> so adding <linux/mod_devicetable.h> isn't
>> needed.
>>
>>>   #include <linux/sysfs.h>
>>>   #include <linux/regmap.h>
>>>   #include <linux/util_macros.h>
>>> [...]
>>> @@ -682,10 +683,21 @@ static const unsigned short emc1403_address_list[] = {
>>>        0x18, 0x1c, 0x29, 0x3c, 0x4c, 0x4d, 0x5c, I2C_CLIENT_END
>>>   };
>>>
>>> +static const struct of_device_id emc1403_of_match[] = {
>>> +     { .compatible = "smsc,emc1402", .data = (void *)emc1402 },
>>> +     { .compatible = "smsc,emc1403", .data = (void *)emc1403 },
>>> +     { .compatible = "smsc,emc1404", .data = (void *)emc1404 },
>>> +     { .compatible = "smsc,emc1428", .data = (void *)emc1428 },
>>> +     { }
>>> +
>>
>> Unusual empty line here.
>>
>>> +};
>>> +MODULE_DEVICE_TABLE(of, emc1403_of_match);
>>> +
>>
>> Best regards
>> Uwe

