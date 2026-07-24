Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37289380FD1
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784899424; cv=none; b=hITS49oNpLj2sH63IiMUR7fA6WJejy91kb6zuAueP6Pvvei0E5wl9kJ1DRKecHLlpjqdW+84sHuX5USlDSi+ZZOrZb5UjujyiYgKfMDhHktKVKRXl3YFOtnzRb6lPxp2zh9TesAQrFxqqhjG+OHGKPmz4HgD9zhFR80c0EpcQlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784899424; c=relaxed/simple;
	bh=dsG27043LpPVjXzZmz2hnoorsjFLp1BIJEr/GrYPrCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uhhpjHFHGEQLMx2CeGOre2lEoVrPnIU0BZNs66WA7jcHM5u2emYL9TZzLr33L+JeJdvGD/ZKRcnkeWEuvvhoBaUfJ+YCuc9yZlHGjitGNIlydXtnCeczDW3PPetNAT9xCfgmQepqIYdixax5HUVodGQr6QgnJh0dCQGFBGKwcss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8W/4NYP; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8W/4NYP"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso277440a91.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 06:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784899423; x=1785504223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4KLdqBJ9m8N6gbh9mNy7HdnwgQSv5c4q06yTDhqqvA=;
        b=S8W/4NYPRWyTrEWgq7nJgnvS1FL48kPuh/fwDSEn684KOXVNjdKmVudt8Vky7212QW
         pll3XSlCaNL4yRQrmHCdx0HxXU9jQsyycBCWhWC/vGyMdqmHkijYicH0TuLfMcDsMsyR
         1EPrGV94LV+9Dakf/1ZplOOUJu/LKj6iY32sdzH9nhxkcVXSJ48JIJWiw/dptciKy5Il
         x0GrYxpIv16dvrEHsjngJ/oY3OcGa7jfDLgC2pQc4gO9lvCh7HV8YHJF/9jIHbjDPYEq
         flVsxvTM2+nofoDAFw8hH5jKjl8QRL6zyH1Up1yKmTTawk3zHbInWxwrRCxSlcxpKdXB
         MaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784899423; x=1785504223;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n4KLdqBJ9m8N6gbh9mNy7HdnwgQSv5c4q06yTDhqqvA=;
        b=eD+G1xIFMLJV7zhRevrMdbhkNykqp3v+kC9i2IHFszL+CRhDaVPToXW5Wf0EvS/DhF
         wHhs2SuMWTYUGMPW7oHR4+dKShY3TeQJ1sYnpQkeVnsNM7P/bX5ISMzswrVDW2e+nVFW
         n0CjufM+LXtlOuzwlGUXF0t9mBfVPR70+gcw75I8z73q8Zqlju41zET4+UjXm3PnK3G6
         WAGBxNJIVRjwb6eUbY5rmjVeCvuc7vGuAXVaKYLl2RUf8d7WUXxtKLqZUp6RPgQlDsQc
         BX4SlQA5E1qWZEYfa4rnr7qVyD+Ur7o2iWV7ZvlLPuSMY3PNYSW0+NFwbdIb/7dDfp3h
         bXGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rouhlar6Q8f0AeWrj/hhO4jrNWs51b5C3YUkVMjg3jdN8OLBeWh5F7tdADwlZVyg+Nn/iPbwwi8anQ6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2pq1f+RlF2mH/xNT5f79zyM+dchV+LgPL1NetGHdPmpDBvfbO
	LeNowJjdAZjF9UQDX98m8s2jCHUvfubLR2U+uZZ8V9WVH83qRb93GCmL
X-Gm-Gg: AR+sD105D6wWLfdO1Q11gwOLu8kJlhHXjy3qYpuXMwUsN5RcnScTvDUc5kCWi/SD9BO
	shO1RGisGbvjPfWBU0zUZnkat8k7F84zza5XVQYyYq0Hx38SQmb1tqbyOzGc9AX9aq6cO1Evt97
	6I1lsvgECYrD5WPuP7Q0P1kF2Bb61q2cCbucDmy9APrQR219Jr4/FzZiSpiB+pycBaUleAa9zqD
	p9szsMdaO8SbrnXXzDWzeYBPrW0h7JpuhFEgBVQ74lm/NEcvC/7gkLb//J2OYkP7zPhaO0zK6Oh
	NyzkB62VOPB9OfnEFrBd+buEbqnayZsbUO96LKHJxX+K2f7/bsvDadbMhZhrXngm+UHf/bcOAsw
	I6qgRRKlnazEn5+KjOXVphILmAhNtE+MHrigqC5pLAGvTKOpbJaM+ezdVG7LS3m+Sgy24+/kjor
	pjWqLWq1aABFfA2HYlXLKu3ipDPYhp3o83R2W2vMhv81i5J/RkpS0=
X-Received: by 2002:a17:90b:4c:b0:38d:c74d:29c5 with SMTP id 98e67ed59e1d1-38ec69a9a7amr7207518a91.19.1784899422532;
        Fri, 24 Jul 2026 06:23:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d2d1d0d1esm5108701c88.0.2026.07.24.06.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 06:23:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <453f9a14-f457-4429-9f22-4fe9e8e78cca@roeck-us.net>
Date: Fri, 24 Jul 2026 06:23:40 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] hwmon: pmbus: add MPQ8646 driver
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260724-mpq8646_v0-v5-0-5915b5ae9aa2@free.fr>
 <20260724-mpq8646_v0-v5-3-5915b5ae9aa2@free.fr>
 <6abbdabe-91ec-4757-a646-8b2b2d4058d3@roeck-us.net>
 <amM74M7myX2tJXMQ@L30177.local>
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
In-Reply-To: <amM74M7myX2tJXMQ@L30177.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/26 03:18, Vincent Jardin wrote:
> Hi Guenter,
> 
>>> +	for (i = 0; i < ARRAY_SIZE(mpq8646_alarm_map); i++) {
>>> +		if (newly_set & mpq8646_alarm_map[i].mask)
>>> +			hwmon_notify_event(priv->hwmon_dev,
>>> +					   mpq8646_alarm_map[i].type,
>>> +					   mpq8646_alarm_map[i].attr,
>>> +					   mpq8646_alarm_map[i].channel);
>>
>> This is wrong. This will require a new exported notification function
>> in pmbus code.
> 
> OK, next, I'll try to factor the body of pmbus_fault_handler() into
> an exported helper, something like pmbus_check_and_notify_faults(client).
> 

Yes, that is what I had in mind as well.

Thanks,
Guenter

