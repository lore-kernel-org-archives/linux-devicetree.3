Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9EA376A1A
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 02:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785378933; cv=none; b=fb8a6wmpLtX+6Cr3Bxq5rZGQJiNmYyBojmhEaX1n8T8jiX+NNQigcLEqfuiswM6l07aWQhnNO958ca4sB7T3mDbQwDeplWwjfC7RcMYhxRDRPwbf/6at0g/6qNmFzOrY5Edl0t5onaYMsKLUfl4XsTxTAZfdcaQ1B+lyplC6b44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785378933; c=relaxed/simple;
	bh=6Y48ZIdMNNpL4QVK2z7qD+SFM1e++4Aj0Ygca+6+vKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxGLv7sDv4jcW8Q1bSUZevAWxND6MrL4XLQFM6wl2ytt/juL9IaFSgPvEO+lYRuMOzJepqum2QRapdnXK0GakZpNemgZmCLGestb7fJ3RP/1ap5MVxShavXPzaslvR/j3uywX+hhOkJyGBEkIu9dTDzuM+sHSO0o8FaDt2dBAyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bI3ixwTP; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bI3ixwTP"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso993627a12.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 19:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785378929; x=1785983729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2rmqyOk2dYLKOaM5sRcp1NgPLaXmeuvz/kFO5pY5/A=;
        b=bI3ixwTPwi7erv4qkSMFET8BovDo/Pi9N2pguLclebFhoS/pCB2q9BR65HZqEbq06I
         tKQLF583keUP3mohLCniymU69AtCeHJgUw/feBSZIEOtgorYftNuj+1hZg/pVpMAl/ws
         p250Pvz72czLxO0v8X9rgsh+oPMg5kBtBg0QuBtx+/8Rtq6yjcREFYw9mxnU6kicogQh
         HwwdEl1mS93Jg8nyygAz3FVXI8kT57EmDQWC5Z3OoUmTe/2slimm/kUD824SZHQTC5FM
         0wgbD8lV2DCRJJ1dhQwRfWbMGEmx/uoHtMxSepNBxDMLjHiFlH71axhi6f5V8PKtud9b
         L+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785378929; x=1785983729;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/2rmqyOk2dYLKOaM5sRcp1NgPLaXmeuvz/kFO5pY5/A=;
        b=EfrLDRxWSkv6TmAkWjZ8GcCJmGUE64C6e/hlcqlOIBtjjjitNRK8k6FG+B6CRUvq0Y
         jdBq7+AZPlNkkGGj+nchsRv6Cg+du7OnCdo4CiK+FpB45RLb8OLsyjKR7uTAIoA1tIe8
         5jfdOFgR1hKKIlRwMExerK8WJ3/dvdgGMsHxNI7X0GICaWJTXPPblEGjubsExw/tzu2Y
         cBNst/SY080xI1E/MR2b6k+SaHdPs3WEpgX28JZlkGd2988H85FvfcPUgVqguxLcigYS
         6xDm6Xv0k/6AAq4EOOYsA1WPaWCHwTRfA0XsQjr4Ua1wX8xrX+PmT1H+uIvaKM3ko4al
         xEzA==
X-Forwarded-Encrypted: i=1; AHgh+RpyQR0jEKW0vzYYHkgXeVuhhI9BGg0R1o6Kqub/qBOeNufqnFDmyIvlJjIJny+hDCVYiA1YrJ90j8xK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy777EL0c+SzuDBO140FdGCQz2j04/2KvtJvZ2BrdbxLixwG1bh
	/UH1a9eqy2ixEe5qsL7bKL7LD8mW9TzLMav4ijcw9ZXGFgTsvBBUYnut
X-Gm-Gg: AR+sD13BdZffExVopWeibdyj7xgYVioKnOWTm30TDpzggk0k/TYf5eZmK14Qc+wwIz5
	H7srVYTMM4wtCpFJVVt0yhMSEELJp8Oi96g3hSU1QxGfrPOeJVPGpSlfRg25va6OGNDmasJ+6tW
	+86wVEGJmmTmq7BL71akbdg77ofA+ujiLSWR8tVw2Pn2cjh0YgWlFszn13cthr0SZSQBc//dSkT
	KoJaV7c8DlpjxxkMHNAvxTNpD1QQkJU3mTPXl8K0lvGnXC6cB9ujInyY+Sj11QALE28V/vnN3LL
	kxZrim09wQHdKqxkRHhg/bpMAgahpmpr/zufBfMI7zVx+pBgSBGV9+2eyRL/WHeWwUZkyANJxVJ
	KtQAv2UD5PsWHbEDrimVl/IgC6Myj2nza1iD69XdZAjgSCM4fImJ/Gr+J7AJNOeDmuA6spz5Ix7
	XbCjNm7mr5t57gNwqEfKwht3Ly7czCyWxpFWqTaDoBg7CDaNQHvecAeeLtRipX5raOktiiD3k6W
	w/MiBhuC8f0EEPY9usFpWPMZGVgPZSIOPsheMEp1ixOiOUR
X-Received: by 2002:a05:6a21:2291:b0:3c3:824d:5200 with SMTP id adf61e73a8af0-3c90085cf49mr662407637.41.1785378929470;
        Wed, 29 Jul 2026 19:35:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13f9a041e36sm2433441c88.7.2026.07.29.19.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 19:35:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <07433bfc-95d0-4de6-b4d0-b2ca70623776@roeck-us.net>
Date: Wed, 29 Jul 2026 19:35:28 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
To: sashiko-reviews@lists.linux.dev,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
 <20260730-dev-max20830c-v5-4-a7553f84ee74@analog.com>
 <20260730011406.A6B871F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260730011406.A6B871F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 18:14, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The patch adds support for MAX20830C and MAX20840C devices but fails to add their corresponding compatible strings and I2C IDs to the driver's match tables.
> --
> 
> --- Patch [4]: [PATCH v5 4/4] hwmon: (pmbus/max20830): add support for max20830c and max20840c ---
> commit f53870a8f52f5aa8dbc791f9a7e148eeab915f24
> Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> 
> hwmon: (pmbus/max20830): add support for max20830c and max20840c
> 
> Add support for MAX20830C and MAX20840 step-down DC-DC switching regulator
> with PMBus interface. MAX20830C is a different packaging for MAX20830, and
> MAX20840C supports 40A regulation compared to MAX20830 that is only 30A.
> 
>> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
>> index ddead72a8db5d..94433deda0113 100644
>> --- a/drivers/hwmon/pmbus/max20830.c
>> +++ b/drivers/hwmon/pmbus/max20830.c
>> @@ -21,6 +21,12 @@ struct max20830_data {
>>   	u32 vout_rfb2;
>>   };
>>   
>> +static const char * const supported_chip_ids[] = {
>> +	"MAX20830",
>> +	"MAX20830C",
>> +	"MAX20840C",
>> +};
> 
> [Severity: High]
> While the new chips are added to the internal string matching list here, does
> the driver also need to add these to max20830_id and max20830_of_match?
> 
> Without the new compatible strings in these tables, won't the devices fail
> to bind to the driver when instantiated via Device Tree?
> 
> For reference, the existing tables at the bottom of the driver only have
> entries for the original chip:
> 

Sashiko is getting a bit confused. Patch is ok as-is.

Guenter

> static const struct i2c_device_id max20830_id[] = {
> 	{"max20830"},
> 	{ }
> };
> 
> static const struct of_device_id max20830_of_match[] = {
> 	{ .compatible = "adi,max20830" },
> 	{ }
> };
> 

