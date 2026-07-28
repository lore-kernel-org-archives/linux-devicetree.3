Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73882331209
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 05:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785217373; cv=none; b=Q9isDaHbc2QpBxIeStvFb8YDckk+Rgdl2tCeNZ/FtqU0/EyclnDlVFbRx9+8uc4YeKTvUw9v1RUwuW1eWuH7Ddd6Ph6Fpri2WPoKVBl+2YHtkFMtO1nvGC4/+SodIeWWIB/VDi5o9tuNB1PHPe06KFF0PQZuomhLZeLPpXnoxp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785217373; c=relaxed/simple;
	bh=wCT8q/0nlgscrLNTp0KwDXUgOzsFprRxVJaZo37zu0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bgKyE40vwpl3dyffDRnKK7O6xmA3T0MgL3wgI0agiQzjKSe5rJtar/I8Kn5Xzs1tOHoXWZQ0pX8XXQpOXDd+COIsdVP5mTKKnASIeA2fbf5RZGg8AC9zTxT+viAJ36j9zfITehBU6ZWFaJZiTLL4xaf19Is86Fp/5J0f0mJk5GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XL/Tdnhd; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XL/Tdnhd"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cace91f112so39012545ad.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 22:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785217371; x=1785822171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yq1p0CDP6hyxUWCWe/TuoZ+uG5M6P/R77gWBoKBA72A=;
        b=XL/TdnhdLDw8VVGzOCLkbRUbfwhX3YhKLVLTn/5k7iFUvWOnWvrKHFdawbz5b9X2u+
         zbSZvnQriTqTPRQr2oOVAiSuoKmZ63+K/jBjELsNEy01u6ayuPUOnqHkXIIpx2wWI3fL
         i3HN7rcin6+xLc8I+4zvtfCUtRFmNcc6MNcs/a4gr0F8/kcKyGSgrEzR4NDuVFLFRefP
         6V+ehKHo+6O+n/5vjbQkO5I7oUgO8YryOzfwwwBK5QNSoIE0yz8C25cXoB4ZsH878+p1
         FwEGYzEzmF3xplDDVpwDJQ6yCvDh1ZrUMxyQmp0DDU9IkQWAG+Y2tI/tlokoXkkMRJ3Q
         nqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785217371; x=1785822171;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yq1p0CDP6hyxUWCWe/TuoZ+uG5M6P/R77gWBoKBA72A=;
        b=eUKrHrlfyJeeHbP0e/Uij+Gs+ilUGsRNluhL8eEfR3/AhJwqtGQ9I+zZaYnfpt/wg3
         QL4SDXgG6EH+3i/IQEEPUOuAaBANQJAyH8A3kK9ozJvCRBKBPK1TX+pVd3O3AUkFGvlx
         v8fr7KmpmfPK2ONK/8+i/ujMbAN0jgjA3Y9ZnRLNz5BSeqFUCtc8kS+aBC5AkCUiVExq
         I5pXo3EBl4zg3DLIZ8tTcapH25+0pzlNiBP8Do3KV9jIecpddvDfJyz9itZflpz1LKr8
         mCsRhQEY4ugSvbjyWUYbdM3ec3X8JsmDOGhrV3SC2NxexIVwCnnHPjo8UTqMMIbdCYop
         vdtQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7b6nD2XrfTf8g375nSkg7IqE957rQQ0M0AuKxw6+mT57i46DvFVjS2aWzVIf/ZBmG8MAHgq65Khci@vger.kernel.org
X-Gm-Message-State: AOJu0YzkhYk/82qJLuUVTy2RUF7a1db8IlBXd8hppI/G2G3oaF7MteIu
	a++2R+aPbN/v8JVGU+jiTkvNxrncWsQKnx/5FMDMCDKZ/zHkwc53VoXg
X-Gm-Gg: AR+sD13q8xRN4TmD1BIk89wM776rMILxrplhnyecPIAiAZVXWdeNt7s191P6JjkaybD
	dcHlXfX/lmR8tUUa9o15AxyUo1CX1GXXcD34JgR1mkeymo9vd6gi6hFwBEBDqAmnV6/yH0exXYI
	5zotFAm2s86H++UslbpFjyneRox71jzM0YTp6mVKeQ91RZu0zLE0a6N1lgGFIFL+unvsXqUM3Hi
	Ho9A0K9npD04rYsKlqIpDj1PqcTLt3Bs1cLc3PQO0P8DPODFYpOdKVZFS+oSWnVSDZR0IASlCCU
	Glx6dNfql12aIG5JB5B41xVMN7fj5Fod43B7fZvlDEG0/LOv4SP4BI1WnseL0C8/RzTEb9etqcK
	jCLNCEMaG8HuvjaOSj+39jTxYp5yVh0bN0vQjsPfWHpN6Mkn0nAYDnahXYREEzG9d8SALnVzOHI
	hDS+YooQbwboGMptWeyqRknf34oSKrF9UlrQ4sWSUScPcnFxw90DjeGbak16WXXA==
X-Received: by 2002:a17:902:d4cf:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2d015db933amr11620165ad.42.1785217370832;
        Mon, 27 Jul 2026 22:42:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbe01sm46119615ad.48.2026.07.27.22.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 22:42:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9559d319-4b44-45c2-ae13-f92099de4c89@roeck-us.net>
Date: Mon, 27 Jul 2026 22:42:48 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
 <20260728-dev-max20830c-v4-4-cec034298535@analog.com>
 <336bd264-52ec-473a-b74f-5661f06286ed@roeck-us.net>
 <PH0PR03MB6351D7369AB790714DF416BDF1CB2@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <PH0PR03MB6351D7369AB790714DF416BDF1CB2@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/26 22:05, Torreno, Alexis Czezar wrote:
>>
>> [External]
>>
>> On 7/27/26 20:32, Alexis Czezar Torreno wrote:
>>> Add support for MAX20830C and MAX20840 step-down DC-DC switching
>>> regulator with PMBus interface. MAX20830C is a different packaging for
>>> MAX20830, and MAX20840C supports 40A regulation compared to
>>> MAX20830 that is only 30A.
>>>
>>
>> Are those chips still not published ? I find MAX20840T, but no "C" variants.
>> And MAX20840T presumably has an I2C device ID of "MAX20840", not
>> "MAX20840C".
>>
>> I also noticed that MAX20810 and MAX20815 seem to be register compatible.
>>
> 
> I believe so yes, they aren't yet.
> 

I just hope they are really compatible, and that the device ID strings really
include the "C". The "T" variants seem to have no T in the device ID string,
making it a bit odd that it was (or will be) added for the C variants.

> Actually MAX20810/815 and a few more are next in line after this. A different
> person is handling it, but they're waiting on how this patches go.
> 

You are making yourself more work than necessary. Knowing that there are more
chips coming, the sequence of strcmp() is not really that desirable anymore.
It might make sense to create an array with all chips supported by the driver
instead of adding up strcmp sequences. That would make it much easier to add
support for new variants.

There also seems to be a MAX20830T. Does it actually make sense to list the
variants (C/T) in the first place ?

>>> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
>>> ---
>>>    Documentation/hwmon/max20830.rst | 27 ++++++++++++++++++++++-----
>>>    drivers/hwmon/pmbus/max20830.c   | 27 ++++++++++++++-------------
>>>    2 files changed, 36 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/Documentation/hwmon/max20830.rst
>>> b/Documentation/hwmon/max20830.rst
>>> index
>>>
>> 936e409dcc5c0898dde27d782308d4a7e1357e73..b850f3b6e40d1f1d0cec944be
>> 40a
>>> f02265aced59 100644
>>> --- a/Documentation/hwmon/max20830.rst
>>> +++ b/Documentation/hwmon/max20830.rst
>>> @@ -13,6 +13,22 @@ Supported chips:
>>>
>>>        Datasheet:
>>> https://www.analog.com/media/en/technical-documentation/data-sheets/ma
>>> x20830.pdf
>>>
>>> +  * Analog Devices MAX20830C
>>> +
>>> +    Prefix: 'max20830c'
>>> +
>>> +    Addresses scanned: -
>>> +
>>> +    Datasheet:
>>> +
>>> +  * Analog Devices MAX20840C
>>> +
>>> +    Prefix: 'max20840c'
>>> +
>>> +    Addresses scanned: -
>>> +
>>> +    Datasheet:
>>> +
>>>    Author:
>>>
>>>      - Alexis Czezar Torreno <alexisczezar.torreno@analog.com> @@
>>> -21,12 +37,13 @@ Author:
>>>    Description
>>>    -----------
>>>
>>> -This driver supports hardware monitoring for Analog Devices MAX20830
>>> -Step-Down Switching Regulator with PMBus Interface.
>>> +This driver supports hardware monitoring for Analog Devices MAX20830,
>>> +MAX20830C and MAX20840C. These are Step-Down Switching Regulator
>> with PMBus Interface.
>>>
>>> -The MAX20830 is a 2.7V to 16V, 30A fully integrated step-down DC-DC
>>> switching -regulator. Through the PMBus interface, the device can
>>> monitor input/output -voltages, output current and temperature.
>>> +MAX20830, and MAX20830C are 2.7V to 16V, 30A fully integrated
>>> +step-down DC-DC switching regulators. MAX20840C is similar but can
>>> +reach 40A. Through the PMBus interface, these devices can monitor
>>> +input/output voltages, output current and temperature.
>>>
>>>    The driver is a client driver to the core PMBus driver. Please see
>>>    Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
>>> diff --git a/drivers/hwmon/pmbus/max20830.c
>>> b/drivers/hwmon/pmbus/max20830.c index
>>>
>> 7c1e94c43ac4e5d1b4f69dc77b02e424a674e908..029733a377123ae6a861841d
>> b4a4
>>> 0dd540f1149e 100644
>>> --- a/drivers/hwmon/pmbus/max20830.c
>>> +++ b/drivers/hwmon/pmbus/max20830.c
>>> @@ -99,13 +99,12 @@ static int max20830_probe(struct i2c_client *client)
>>>    	 * which do not support SMBus block reads.
>>>    	 */
>>>    	if (i2c_check_functionality(client->adapter,
>> I2C_FUNC_SMBUS_READ_BLOCK_DATA)) {
>>> -		/* Reads 9 Data bytes from MAX20830 */
>>>    		ret = i2c_smbus_read_block_data(client,
>> PMBUS_IC_DEVICE_ID, buf);
>>>    		if (ret < 0)
>>>    			return dev_err_probe(&client->dev, ret,
>>>    					     "Failed to read IC_DEVICE_ID\n");
>>>    	} else {
>>> -		/* Reads 1 length byte + 9 Data bytes from MAX20830 */
>>> +		/* Reads 1 length byte + data bytes */
>>>    		ret = i2c_smbus_read_i2c_block_data(client,
>> PMBUS_IC_DEVICE_ID,
>>>
>> MAX20830_IC_DEVICE_ID_LENGTH + 1,
>>>    						    buf);
>>> @@ -121,26 +120,28 @@ static int max20830_probe(struct i2c_client
>> *client)
>>>    		ret = ret - 1;
>>>    	}
>>>
>>> -	/*
>>> -	 * MAX20830 IC_DEVICE_ID sends string data "MAX20830\0".
>>> -	 * Return value should at least be 9 bytes of data.
>>> -	 */
>>> +	/* Verify we read the expected number of bytes */
>>>    	if (ret < MAX20830_IC_DEVICE_ID_LENGTH)
>>>    		return dev_err_probe(&client->dev, -ENODEV,
>>> -				     "IC_DEVICE_ID too short: expected at least
>> 9 bytes, got %d\n",
>>> -				     ret);
>>> +				     "IC_DEVICE_ID too short: expected %d
>> bytes, got %d\n",
>>> +				     MAX20830_IC_DEVICE_ID_LENGTH, ret);
>>> +
>>> +	/* Null-terminate the string */
>>> +	buf[ret] = '\0';
>>>
>>> -	/* 9 bytes of data, buf[0]-buf[7] = "MAX20830", buf[8] = '\0' */
>>> -	buf[MAX20830_IC_DEVICE_ID_LENGTH - 1] = '\0';
>>> -	if (strncmp(buf, "MAX20830", MAX20830_IC_DEVICE_ID_LENGTH - 1))
>>> +	/* Verify the device ID matches what we expect */
>>> +	if ((strcmp(buf, "MAX20830") && strcmp(buf, "MAX20830C") &&
>>> +	    strcmp(buf, "MAX20840C")))
>>>    		return dev_err_probe(&client->dev, -ENODEV,
>>> -				     "Unsupported device: '%s'\n", buf);
>>> +				     "Unsupported device: '%*pE'\n", ret, buf);
>>>
>>>    	return pmbus_do_probe(client, &data->info);
>>>    }
>>>
>>>    static const struct i2c_device_id max20830_id[] = {
>>> -	{"max20830"},
>>> +	{ "max20830" },
>>> +	{ "max20830c" },
>>> +	{ "max20840c" },
>>
>> I don't think that is needed or warranted, given that there is no matching
>> devicetree node.
>>
> 
> I see, will remove.

Same for the prefix string in the documentation. You might want to mention the
supported chips, though, in both the configuration and Kconfig. In Kconfig,
that could be a generic such as "MAX20830 and compatible chips", or list the
base variants, such as "MAX20830, MAX20840 and variants".

Thanks,
Guenter

