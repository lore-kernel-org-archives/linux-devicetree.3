Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5242C296BCF
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782655381; cv=none; b=T7qYboCsIWpWreeqRZpZ5i6xKnWsfKv8uMhA9Tm28zT+4NBdFz3zzMDuPXzeALy3A/ivuqPuX4OJgf1VQ+MRtYhoCLnf/tjWF+4TzxjeGyPIwgG3yQd5HPCCpPoVFLPXV+9Hl0errC0PKx70+U0JHHEyp++ynuaEDbQCsIlN/y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782655381; c=relaxed/simple;
	bh=OQ5yhZ1oEV14Y+jT/b/a7GaOoJ1UaVSImFMvRqg9/0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s1nRVdsfavWt/j02s5C68bIZ05W+CCcD5F9V4VKs/r8ifyMCd1/8zEzmic4M1bp9mODI93KfQrwA/LqixsHVxl/yu2seNVhwKsgsyW6X//5flgCfX7ES+4DpQfPzPztn5a6x9GUFGr73vvZARy+Dwz/X02+6seRswmiixaIL934=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dc9vNvjB; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dc9vNvjB"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30cac93dfd7so1028109eec.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 07:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782655379; x=1783260179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EUdgbv53aIghJCqB+1zZYKm53UkH3WojYHbSrrOE1g0=;
        b=dc9vNvjBU3DflcpXuWx7V1SqC6037N69PGEJ2vfeoJatX2yv1fbs/XuIdTaDKD+DmC
         siVxqEw0FImV6QJZWn2xT57RhK687RCXiCZIIHYXJreCD/808v28VUcu5iByOMEdzLTp
         K/lsbn4ajO1vjK7gfv2ck9vvBhIzAeqRQLM14EkXal86G3JjATCS7P3lvIH0TL1wqxWH
         4sDHfGHq4YmB9DfzHq6/caU638XjVBZdq328SMx/jfBdAT+GeHDwMFUNhXbZvk1mDKp9
         sdxKy3uqb3yW8du8yB6P9EJaJBGVASTV35lT3JD3QvSNYEYXkDfUcqjLioi+w8RrGS/3
         LBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782655379; x=1783260179;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUdgbv53aIghJCqB+1zZYKm53UkH3WojYHbSrrOE1g0=;
        b=aLmSNdeTkSoImcFvTlD6T8R70N3Y2ML3Rl0csny95uQ/j2BSiJvU4KSTXWkDhmRW0R
         03cicuvQyXegZYeNo2YPVzAbOyyjgf8PBC7IFcVAE4TtGYkY/vNDyZQbBXU1pOpCgyHb
         E3O8C06l6kYsBrPoCLIJ6zfn20zhflQKlUJoiXr7Klw98eoObLetwBfS53sVPl6gvvFa
         LIh7Kp3P1Z6St6u1Rfd5Koc/xvYuhMg5floR33oJXPP2iK+xIvsKbDfoi1lUaYkYyFw3
         ap2ddRIk6JjilY67tpquFKRh1jOtXbtqX9aUEQNlbZLRW6YuS4g4LcLvN7pPyoGjUPKS
         H3SA==
X-Forwarded-Encrypted: i=1; AHgh+RqXNDvBL6yjROqa+qT5LA2qoCdqJGhBFEvrVkBR9GRvte9UKPuNojaInyONngLTXeeFXLKmvAZJRZ81@vger.kernel.org
X-Gm-Message-State: AOJu0YwQedNg0cSsQbg1S+ySoEfM2Cdx6N3/tviBMmzX1UL7Qt3Hn673
	jcAAVdWNWhhZ3fAJGu5wy6jvzTnSzQd/mwGkJHhXe37ICA4a29SRysS4ZVwzPg==
X-Gm-Gg: AfdE7cnPiAr8n/YoruodRSi0w/evGVkgf/WZycHlJWcqSRyI3T4fmHl+cseJIVZiZhQ
	VUVPF+KyXbMIoahU95GDvCy01EzxGPoEm9cXfKeigIHxzoDiVQea6l2criT2fBp/5aFDcKdyTsf
	WWIEavVDipUGCOekeEi0ze8I4MygVXfXS6gJCtg36qTDT4MyVzoEOe9M46+UtCALfD5+5y95AcF
	F13D2UcE/ynGY9oQvZ+puzCJgs9pIPPjyovd+IHc7gPpb139rWYVwr6G+tFbflkLRNaqXmiVRMM
	MR2pEcV90SNJyc6i73dcxpM1bms0ykVpe1wY4Tffpn0swvHhhRhe4vftVPJTFouEGn3tAdcYtco
	0WDyGzJqgXoI77Rxm4xaYVUW3JEn8aui1ryXn+DAr2t+p6cqxP3ktyiqO78U3nwI1pei2asngJV
	TYf9y7kXY0CLY3jAN5lEZ1or5HwoxueidK2LJ18vdm1SJ0vsZSHWpDek4d2rIv0Ems5ydRFMT2
X-Received: by 2002:a05:7300:aca8:b0:304:70d0:4f03 with SMTP id 5a478bee46e88-30c858d23aamr11142737eec.6.1782655379179;
        Sun, 28 Jun 2026 07:02:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm36165406eec.19.2026.06.28.07.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 07:02:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <faebd355-a9f4-4360-b123-87103ac512e8@roeck-us.net>
Date: Sun, 28 Jun 2026 07:02:56 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
To: Sebastian Reichel <sre@kernel.org>,
 Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, bryan.odonoghue@linaro.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
 <akEj6XEByCOkuJaY@venus>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <akEj6XEByCOkuJaY@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/28/26 06:50, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Jun 24, 2026 at 11:08:23PM +0200, Daniel Lezcano wrote:
>> Expose the Lenovo ThinkPad T14s EC environmental sensors through
>> the hwmon subsystem.
>>
>> The driver now registers a hwmon device providing access to six EC
>> temperature sensors corresponding to the SoC, keyboard area, base
>> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
>> are exported to allow user space to identify each measurement.
>>
>> Additionally, expose the system fan speed by reading the fan RPM
>> registers from the embedded controller.
>>
>> This allows standard monitoring tools such as lm-sensors to report
>> platform temperatures and fan speed.
>>
>> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
>> ---
> 
> I gave this a try and for me the fan data is always 65535 (i.e. -1):
> 
> $ cat /sys/class/hwmon/hwmon66/{name,fan1_input}
> t14s_ec
> 65535
> 
> This is with the fan running:
> 
> $ cat /sys/class/hwmon/hwmon57/{name,fan1_input}
> fan-controller
> 2564
> 

Not really my concern, but those names really add zero value,
and I would argue that they do not "allow user space to identify
each measurement".

Also, do you really have 66 hwmon devices on those systems ?
Seems unusual.

Guenter

