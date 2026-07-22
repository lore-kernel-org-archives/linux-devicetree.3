Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E6E381EB6
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 18:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784746792; cv=none; b=mMOn26QbZ82+j5K5tm//s8R40GHM4oZzYVWOAUm3NtVisuMSTjHFnfl+9CHpvPRg1rGaXtPFEt4VpHKovtnEsOhJwxBiwM3kB6w46yxBti3+9aoXU42D5rH5/xY6z7aHyImIuWVM+Zv6OrHgwB759f70s8vqZft62yPY5rbPONg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784746792; c=relaxed/simple;
	bh=SWE5xEokraCLrBzxKLFN3ueo1NNiNLPdJXP9d9dXNx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ux9D9TL0Bi3Hr6Iwb+/KbNmDHNUPDcxS1MsiBNHF/MqGVAHLW1NeFxg+3J/KK22zEIKyq/gCPcY2xpRZWs/RfDDKNDxGGdWxq4OAj7CVcibfdKpWxRzc1WW0dmKEMJYKk2rZ4BicuslR49/U/Lg+TxrD54R+YdVhNyrNqbTXI6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xh4439CC; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xh4439CC"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso9043087b3a.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784746789; x=1785351589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6ZLC0o0pPH5ppMj1NKH//VtPE1br/BJv/qJB9TBuCI=;
        b=Xh4439CCV1UV04M1W9evEzbvAW8U8YuGVnsak4mnx388wnguPsARLgk6hU64meJYi6
         xCog9zHDIi7v7daTJnVWbpCWTNLhv6pHxoTRLXbbjU/oEnXcSAb7Z/CGsFkZBJ3nwy+T
         2HJAL0aR4MhzKcWOShD8FQt5Vj12774E2idoAI/BsWY5e0soqeyVEtOW1xpUqxE7oLIE
         MVS25FENEBlXz4hgT2DEppExAO01cJeHbyrZn25jEgKUIBZW/2Ta/aJZwSvzlZfh2i5c
         eEdxcOfcb1OWGTU8hKVltq0uhugXzejFmCuRQmCEUaKE/bye9974uMDWxCMqkbI9O4Ea
         oxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784746789; x=1785351589;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p6ZLC0o0pPH5ppMj1NKH//VtPE1br/BJv/qJB9TBuCI=;
        b=mjpPHQUj6Airx/sS7zU3CP3kQYaWyC8TLVzwwfUET40rmdVO/1rvhYOw2Blt645AHJ
         Qi67cJjMqNZRcrZ3OqXOToLx3hZ6rYxhudCtoTEW2xpXim3nvBoT9PhVcXouh9c6v2Hx
         pTd2VXo5iw+uvb2gZRFW0hqmXcHve0EE45w8qJdVR29OvTAD/NRWV5Njw9+Fd12dnXFU
         OM3t1xCD05bampLK2ANV4QfyHkP8TwRfNZYMgP6BYsY4KfJJObYQnQKDUtBmnec5Qh2U
         b2EjmbCutqm93hPolNJx2utJ4tzOUUYoNN8X0JA36eH8lg+yTE6CogocB+o2RHVz2fW1
         o7NQ==
X-Forwarded-Encrypted: i=1; AHgh+RowVqvRcat7btoLZWhqM2CLlyr/cFigddiIdcVFUCo1H4mzXNfiNE08VGTx9olNJEJiYQfId2s60BPu@vger.kernel.org
X-Gm-Message-State: AOJu0YwcSkpPOksrrT3hy/PgQhyKa2v3G5nx57ZvDic/JoJE9yt5jc/+
	N1o513XjkBvLZHkaR88U03iidxX6vE+8Ex5uTHR0boJRm0WA2SdXwLJ+
X-Gm-Gg: AR+sD11a0ZduaAM/IQX0rRieoOP0hiHfVbmdAGU0BG7v54ncg+owH4ucB8jNWKByFg6
	I8M+UTStDfVpm0dl9sWATVYkPF7WSopiLevItMAfj5DSo4o4VCMM7zp0ecJYh5qlHwlTMV7dejP
	xZj5rmHARKUhZudnTsUcUYzX2HguSjoTvj1F8Dd+N1vLH5Z7+NOUw3SpcnBmJbK43gh14MtYKqi
	t9AwcvdcGtxePafC+h3TahuU4cjgS88rF2w/eo9fcOEVNGZZIWBUyuxCuYp3vlYctXyCP5DE45i
	m3Mc5aNL/dJFsdHs8r8CMeuQyPnMafWMq562oBzKuVQuwDgVGrsCKG+LVXw3t2CWAvQcyqixI/Z
	9xhye71L4T99PRwZDWWv/Na5Buby+TyE6NZ3mUeCNvEXorksL9djDT+bGklWjk1iWh4hVxHK5UU
	BATc+hOU9Y/NvSAjIxyck8kJiUi/XEGNpQNzVwUmH7gyPrqPXh9Zg=
X-Received: by 2002:a05:6a00:a88e:b0:848:2f84:f42c with SMTP id d2e1a72fcca58-84e2bc1a3f9mr113390b3a.69.1784746788971;
        Wed, 22 Jul 2026 11:59:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ebeeesm1509889a12.10.2026.07.22.11.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 11:59:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3635cd34-4c11-40fe-a9ff-48b752fb5150@roeck-us.net>
Date: Wed, 22 Jul 2026 11:59:47 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
 <373bd00e-bfcd-4f6c-b64e-a707af01417c@roeck-us.net>
 <cdc0fb5c-d277-40b4-8b00-c73eb881c062@oss.qualcomm.com>
 <4f2d9c51-1059-489c-a469-562ec52015da@roeck-us.net>
 <24a0ac2f-792e-4296-949c-047d9ce1c1f3@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <24a0ac2f-792e-4296-949c-047d9ce1c1f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/22/26 11:19, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Guenter,
> 
> On 7/22/2026 11:16 PM, Guenter Roeck wrote:
>> On 7/22/26 10:38, Manaf Meethalavalappu Pallikunhi wrote:
>> ...
>>>>
>>>> I am curious: Why not use static initialization and use the is_visible
>>>> function to determine if an attribute is visible or not ?
>>>
>>> ACK. There is already a comment in v1 suggesting the use of dynamic allocation based on the available attributes rather than static initialization. The intent is to avoid having to perform enable flag checks in multiple places.
>>> . >
>>
>> You lost me, sorry. There is only a single is_visible function,
>> and its intent is exactly to handle situations where some sensors
>> are not always available.
>>
>> What would be those "multiple places" ?
> 
> Understood, thanks for the clarification. I'll revert to static attribute initialization in the next revision and use is_visible() to control attribute visibility where needed.
> 
>>
>>>>  From the earlier exchange I had the impression that there is a large
>>>> number of current and voltage channels, but it looks like there is only
>>>> one each. That doesn't really warrant or need all this dynamic code
>>>
>>> Yes, this hardware only supports one or two channels (voltage and current). What we discussed earlier was that each channel can have up to three threshold alarms (warning, critical, and emergency). However, the hwmon framework currently supports only two limit alarms for these sensor types. I have not added support for the third alarm threshold in this series to keep the initial driver support aligned with the existing hwmon capabilities. Once the basic driver support is accepted, I can queue a follow-up series to add support for the third limit alarm.
>>>
>>
>> What does that have to do with attribute visibility ?
> 
> I was only clarifying that the channel count has always been small (maximum of two channels) and has not changed since v1. The earlier discussion was primarily around the limit alarm attributes. That said, you're right that this is unrelated to attribute visibility.
> 

Feel free to use (and test)
https://lore.kernel.org/linux-hwmon/20260722185749.2313572-1-linux@roeck-us.net/T/#u

Guenter

