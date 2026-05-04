Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7EA3FA5D4
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 19:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777922812; cv=none; b=V/V9F/gUqKLaPaPr1PJyGfFf4UTGuDuekVVsctDznDzWmfi2XIJy3IZcHiM+be8dhvYvJLeYOMEiwGNNdJs1g6VKAHQJ1UJ9gN9wuahdPrP93pU3GH/BROkYyUfVpznSgKA77fZe8O4slqWh3cc5yMn9NJh7ueQXHYog5Q0x4gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777922812; c=relaxed/simple;
	bh=sASxvmxm4NYk57Kzk+zWsxxSkgmmvWJ+ADgKtzgBcKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=myKvrFn7K9pazVOOj1Nop6vTp9m08BX5sPuSrrFPk+p9F1EqdGBvHOrGZyRlcOpT/a6Pl96Al88BCJaQFtOG+7BXKtkaEF0gqkgMsj2UwWcj8ReF4bKBo6l2cB1gs4KOlqQr/gaPayYHuIamGcSN+PFFmR0oKUoZvSi2T22N0tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=onMHqcmL; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="onMHqcmL"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-365212191f6so1397468a91.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 12:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777922808; x=1778527608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cTcvhNgcr7S4Cz3nerEDWFy/RWfW3N6YyG0A4VR1wYg=;
        b=onMHqcmLx/WzU4KQi9fXRu/QMT5OQdzwHEf6NIFIflP64ZU6W5xPSHGTwQKV9zqNCq
         hTcO7Bh0yOUoBKmadjDNAqo0+vgBAqH68XvRPvYTjpZMp60ILSOAEmJvtYgONq0T1C5c
         RxAMlWFn4b6ystpwnFgddhBiPKAFsG909lezVG6xsXQaCZXh0Rzvg1bMxDk9C0tkf8pM
         Km73PlAwVdgBSip7nEw/joFTYp/DahkVuHDxMcU+V7/30KgcEEK9z4FkgHDkQEL73tER
         XkHpgl+euXxs755AROF0Ob7dmJwz4efKUBb9k53x8F122ygu+RqCjNMS4D/YcvSlQpKr
         iPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777922808; x=1778527608;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTcvhNgcr7S4Cz3nerEDWFy/RWfW3N6YyG0A4VR1wYg=;
        b=PrQTNvbzYTZo2u2aNJs6pUDAyF6HoX7mDrSPtxsDTpE33S93tMR/pqjfmv+6hNINy9
         qH4JUEs6K+uuhxbIQEi53CXF6RC1Zy+jL3pRkyM5COjwkJup9qYupl7D2b1ahU0MI5KE
         1dmHUT0qG1aEDn1dvHV5qlye7ucZEZuCaNTOrS4czDfW5pnDNIwJi/ROX+3wYgRY6PEz
         VeQliM1sTntPet459xg+oEUenQQoyvu+vb95eUS/WFoLwpgA9LUHLOUMhTXDeW0FH3GH
         Ii1lHeUumuhZlZ4lSXszVN6YjEjH8TbEXZyf63pKGcTGd+xKDuNCjQR2sL95FpdznWPr
         liqA==
X-Forwarded-Encrypted: i=1; AFNElJ/T7T221LouYgCJ0XKdEDvsgcMu7Tcutiy4xnpBTXUDmgrFBEYkmftSm+Ci53DTqnne2RHn5iH090nr@vger.kernel.org
X-Gm-Message-State: AOJu0YyGNjiAB1DfNvJJGlphhCZqpTW4bbAW7WD1MOU20nCRcKbNpABQ
	tbC7vgEV0a7lU4Ybt9FvyRUxSHGeW7UEqu/NCgfR6Tx6ycyGd6pF0iTp
X-Gm-Gg: AeBDietM+TaohL2FTLCjIUhHoC8/7xxmvtprhg+ahdCZtuhOHAKTnpnaS83BeSsR4b/
	lk9l1fsSJMOxOFlAFsYS7oGwiwQTNNmDQhebbNxjBDMkPw6X/VMgA5qxh/rlJkf8a1eNGtHyDw+
	K4tk40YbFaCqxwfvvlhOYHW7yARyyP30NdzgbZbcI86Y8Mj7Cux+jJJrHwM/m8UxFziT4LFyaYV
	UKbeeh3XRfzW7iwKDKdmnzYUoN7G5EtbNXyDld0qZt54AF6MZsiOYenwcewbdZbvylDk0adPluA
	hY9zOELk5/iTJWiRAm8PgOrTIMjuKEzRORsHiIPWK+HSEBzVgsSF4jidmQlLr8WoOIUQAeXSzVg
	11K+/EK2BmBsOZ0axGmKwsOjUzY/hQPHcrQ8CYQHz1gc9Co4EOxlUhcp+3M7zqZqkRSLomM5CKC
	Qif4N57GaSmAjEvw2OdcveYnOe276PfaoynD58CyFZDety1eLVtZC2adtffNKvuSI4lJI/22m2j
	xC3EDiiiNw=
X-Received: by 2002:a17:90b:254e:b0:35f:bf4b:c396 with SMTP id 98e67ed59e1d1-3657736f0camr255503a91.1.1777922808457;
        Mon, 04 May 2026 12:26:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364be00b175sm14823232a91.9.2026.05.04.12.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 12:26:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <66268e35-4897-4c40-b358-1c973b70426b@roeck-us.net>
Date: Mon, 4 May 2026 12:26:43 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] iio: adc: add Versal SysMon driver
To: Jonathan Cameron <jic23@kernel.org>, Salih Erim <salih.erim@amd.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, git@amd.com,
 nuno.sa@analog.com, andy@kernel.org, dlechner@baylibre.com,
 michal.simek@amd.com, conall.ogriofa@amd.com, erimsalih@gmail.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20260502111951.538488-1-salih.erim@amd.com>
 <20260502111951.538488-3-salih.erim@amd.com>
 <20260504183215.37c8ae65@jic23-huawei>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260504183215.37c8ae65@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/4/26 10:32, Jonathan Cameron wrote:
> On Sat, 2 May 2026 12:19:48 +0100
> Salih Erim <salih.erim@amd.com> wrote:
> 
>> Add the AMD/Xilinx Versal System Monitor (SysMon) IIO driver.
>>
>> The driver is split into a bus-agnostic core module
>> (versal-sysmon-core) and a memory-mapped I/O platform driver
>> (versal-sysmon). The core uses the regmap API so that different
>> bus implementations can share the same IIO logic.
>>
>> The core provides:
>>    - Static temperature channels (current max/min, peak max/min)
>>    - Supply voltage channels parsed from DT container nodes
>>    - Temperature satellite channels parsed from DT container nodes
>>    - read_raw for IIO_CHAN_INFO_RAW and IIO_CHAN_INFO_PROCESSED
>>    - read_label using the DT label property
> 
> Various comments inline.  One thing to check.
> Is this one strictly a hardware monitoring device? Or does it
> get used for more general ADC purposes?  Did you consider an HWMON driver
> for it? The above sounds a lot like hwmon. So why IIO for this one?
> 
> I wasn't awake enough on v1 to raise this!  Sorry about that.
> +CC Guenter and linux-hwmon for that discussion.
> 

This very much sounds like a hardware monitoring device to me.

Guenter

