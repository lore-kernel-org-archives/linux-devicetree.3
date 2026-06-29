Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4107B39657B
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 18:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782759352; cv=none; b=uAWeIsEN2AfHuOdMPDx9cooyni0SWrzDnFOIBswBiTOt2mVMYv5bkXqq35eDfc2rr2+4+fDn5lA91S9jlVSuzsDoialuBI+koE0CW29J0OGPz7XkOovcxR5TCgBJIhU2xNf4khKN5vBzW8/eydk6LC36lkG42GmIfisrRl92WHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782759352; c=relaxed/simple;
	bh=/tygSJ+Tz4c71hbnSUm6Y1+0DuA4LX1ppuFQ3tGuM2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xv/xChej2ABw1oDTzugYzQojyUUSx81m6Nn0GmEKfJRBZpmCPraRovy0faK7Ox3g9YLrNs2IznxyyB9/jhpR3GJNcd9aqF3kPQwYz/xli++0ULCZzFXFocsE3220ltD3E/IEljTEz43YC6XKkmBSmQHmzVu7jlNT0VMtLX1HqmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=S6WHVo05; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="S6WHVo05"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e6b5737bb2so4094499a34.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782759349; x=1783364149; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ACK0vFthHW+jDVGTIXTjlhgZggTZeawplRcDp+RV9vM=;
        b=S6WHVo05v2RFcTru6gdeyY7VWJdY2lYOWekq8VBumRvcJXAUICpCAsqAWDYAN60qcD
         KxLxWDvarwmdSrnugo7AApFhOGuE50ddUEG3Qg7A1HKg7Cr8JSPnisIRBaWgzWhb/sv1
         u1+E7nuSouy649d+e6QAbZiVA0LdkqxyBe5iyP8aJqE4N1j6dfKyICeBhFcz2Q1oqO/D
         Y6KdX7ezn75L5ZkO6PUPG2ipqx8oHOa1/cTGcrsY6t9UP1Z8QgnG+SsWEk279l+P0kX+
         hlsBHpxZj3fvvVMghUQFQPHMEhwv5rScyrPeIgGtC/Z+u6yL3GKwFibdx8yI7qjL2LIb
         Vseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782759349; x=1783364149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ACK0vFthHW+jDVGTIXTjlhgZggTZeawplRcDp+RV9vM=;
        b=La+0NT07w8jysQviOG9PXNXDpNdDeCWOCCrVM1xZG1jealmBgBy3Ukua1beFbIoQar
         gkgH04XojP8l7v2M11a12rohD5TW5a9LmiMZeiVq000DULYZkNBg6gJN7xG41aDfVGfi
         67y2r1dNlM+dTTjZGn6LjZE3aENWgJZS40hUOigtbDhz3bWKtZxUpsNBvUz7eMf3RzUD
         yOFtnq+rDPS3o8LOuB4e5RU5nmEGZa22+2fqgzR5qJHKF5nnhfVOqozE2K6DvblaVXvF
         16tv5ipy5b8LB9WpTmZ0O+7Bmt6+mZlkyW7/kGsZkVs9yPCQ0rPQkvobFY2vzMOhYlqh
         3YFA==
X-Forwarded-Encrypted: i=1; AFNElJ96V3v/DRqg4MkqmmvbKUZZDjsiZBb2V2c3tav2MRQjVifD2C9PZ1cu/HN8Qva15E1NKyVzXZxe86ni@vger.kernel.org
X-Gm-Message-State: AOJu0YzmB5AuqSlRqUw5DNu5w/d6r7uI952+PI+lrlJ1s46ehcJiWgWm
	cg2SNMz2/EkB8JQE+PQ4ZO9MlqVYy5T9uxnVfZL5wyaTmQBRe4TyIzKFbZQV82/jS1w=
X-Gm-Gg: AfdE7clsCQbXhkd7s7MD1lk2J3JLmWw42a86CLMmlS1F32S9F3v6TJMd9vcaoCqT8Nc
	u2E17R7X0dWw0SubnxNDbA5BZmb3dN9KgixjAlegeW0WEHMp9Sz2RHgto+HPITMqivHf9ZJSYc+
	6w7AboRWeU6lGcsB/nVJwIxU/Pns7ai+UOjAu79aEGDQm8P28e7RBtmUFGxnDwD3n30DSvViWLk
	l/YqVsdviZBvtHJBe/8V18M6cL0plrbjvoSxEtPn6WWMOf0prW8In/QIVi/m/Kojxz48hrfJip3
	JlIZxj2OJcdNpEQEJfYHjOYRHSlyrn1vkIj4qGujM0Hm2f/WwEA46QHBE3/u9/2eQrpElEAcmqD
	gwJEDxUrlIz+uyJeIjgYToKik5Fip9BJWIR/JoFVdS9PxrTnUAtFZNn2bu/Tiw8vVf+YfxxHLDG
	i9jDXUkqd1F5rK1+DS1sN+E+tM12iaii2P4dsDxHLJYA+Ti60nEEhYf0igtq4DZ0I=
X-Received: by 2002:a05:6830:6d26:b0:7e6:ed97:ce52 with SMTP id 46e09a7af769-7e9ec724d6emr557381a34.20.1782759348858;
        Mon, 29 Jun 2026 11:55:48 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3533:aa22:9a69:df1c? ([2600:8803:e7e4:500:3533:aa22:9a69:df1c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec2ba18esm461442a34.16.2026.06.29.11.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 11:55:48 -0700 (PDT)
Message-ID: <2cdb9cd4-8e6c-4bdf-b14e-2191b104d229@baylibre.com>
Date: Mon, 29 Jun 2026 13:55:47 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] iio: adc: Fix incorrect reading when datarate
 changed in single mode
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jakub Szczudlo <jakubszczudlo40@gmail.com>, linux-iio@vger.kernel.org,
 andy@kernel.org, antoniu.miclaus@analog.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, duje@dujemihanovic.xyz,
 jishnu.prakash@oss.qualcomm.com, jorge.marques@analog.com,
 joshua.crofts1@gmail.com, krzk+dt@kernel.org, linusw@kernel.org,
 linux-kernel@vger.kernel.org, marcelo.schmitt@analog.com,
 mazziesaccount@gmail.com, mike.looijmans@topic.nl, nuno.sa@analog.com,
 robh@kernel.org, sakari.ailus@linux.intel.com, wens@kernel.org
References: <20260622221550.374235-1-jakubszczudlo40@gmail.com>
 <20260622221550.374235-2-jakubszczudlo40@gmail.com>
 <5e96801b-50dc-4752-8e00-1a80984ed997@baylibre.com>
 <20260629193329.34fab6e3@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260629193329.34fab6e3@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/29/26 1:33 PM, Jonathan Cameron wrote:
> On Sat, 27 Jun 2026 17:31:24 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 6/22/26 5:15 PM, Jakub Szczudlo wrote:
>>> When device is suspended and it is in single mode then changing
>>> datarate doesn't make it actual wait for new measurement, so to
>>> be sure that read after change is correct functions that changes
>>> datarate and gain will wait for new data.
>>>
>>> Fixes: 541880542f2b ("iio: adc: Add TI ADS1100 and ADS1000")
>>> Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
>>> ---
>>>  drivers/iio/adc/ti-ads1100.c | 74 ++++++++++++++++++++++++++++++++++--
>>>  1 file changed, 70 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
>>> index 9fe8d54cce83..e3c801381434 100644
>>> --- a/drivers/iio/adc/ti-ads1100.c
>>> +++ b/drivers/iio/adc/ti-ads1100.c
>>> @@ -15,6 +15,7 @@
>>>  #include <linux/module.h>
>>>  #include <linux/init.h>
>>>  #include <linux/i2c.h>
>>> +#include <linux/iopoll.h>
>>>  #include <linux/mutex.h>
>>>  #include <linux/property.h>
>>>  #include <linux/pm_runtime.h>
>>> @@ -43,6 +44,9 @@
>>>  static const int ads1100_data_rate[] = { 128, 32, 16, 8 };
>>>  static const int ads1100_data_rate_bits[] = { 12, 14, 15, 16 };
>>>  
>>> +/* Timeout based on the minimum sample rate of 8 SPS (7.5s) */
>>> +#define ADS1100_MAX_DRDY_TIMEOUT_US	7500000
>>> +
>>>  struct ads1100_data {
>>>  	struct i2c_client *client;
>>>  	struct regulator *reg_vdd;
>>> @@ -123,10 +127,49 @@ static int ads1100_get_adc_result(struct ads1100_data *data, int chan, int *val)
>>>  	return 0;
>>>  }
>>>  
>>> +static bool ads1100_new_data_not_ready(struct ads1100_data *data)
>>> +{
>>> +	int ret;
>>> +	u8 buffer[3];
>>> +
>>> +	ret = i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));  
>>
>> Do we actually need the cast here? char * is like void * and should not need it.
> Hi David,
> 
> Any more background on this?  The void * implicit cast thing is in the
> c standard.  I don't think there is anything equivalent for char *
> 
> Thanks,
> 
> Jonathan

Oops, I must have been mixing that up with special type punning
rules for char.

According to [1], char is not compatible with either of signed char
or unsigned char.

[1]: https://en.cppreference.com/c/language/type#Compatible_types
