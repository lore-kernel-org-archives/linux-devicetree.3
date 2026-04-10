Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE2C1A239A
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 23:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775863829; cv=none; b=ukuYGnk/CFABkUPghL6XHB7eReFXlD0zGoETWCHt82uM1yPdDSfUFo3ZFknqqoJZWOz9i2oyBViD7IYr0sIO1X6F9Ilp6Cb/vFYd9CYYW8T1s2PTsXTasgRZPgW7VKJcFS30lRatcZ8MwpKFIQOI4fCtO89kOv0p/JL+j2RitnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775863829; c=relaxed/simple;
	bh=ewgjmd657e/eEQ+LvG32K9eZ2WwzhV0N394VPULSD4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ct1KdsvBWzaecdAK3HMzrxE0AwJ3EM8WD34MsPlSDMJCJ558iXHmsNi2QK3lefbxa/DNEwPrlJ42S9UWbUh8Ns1wb2PRbmUj3600LaA/ntNcV0/QX5IvrwXo/wBWn6rLwkoHZ2AcoYEE8K37A5zC/Dzc+okrDTYGEvS11nkChtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GW2Pedf3; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GW2Pedf3"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso1044384a12.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 16:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775863827; x=1776468627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CeIJ+47YJHgVFNBVdBgFqyz4yoe5uld63ghpZqILQvM=;
        b=GW2Pedf33VnBMIholB+9ApGIXZ7stas5hvWIS2+8F/EDLlXNKKnQ/pez/2s5WxMwFl
         2rg/rhxbuTo/aowPRwUwOuXvCzI0nkBAJKx6YclhyGFwqcBCpMndzepE4ZujkHM9nl/n
         mLc8LclylgPv3BWDuATb8P5hWsHjEtcRRvQX9bKs48i5t6U01MLmRHH4K6huYDjn7e4l
         MrHH1Zb3Gl+QKT4NqvkyftvuHPdlt5uENAJEkAPZhZkXchHpkyZaIzQGmzjpJCi3kDfS
         M+4nKApz/W44kPexPSE/9oZV9r5sIzsE9n4qAKYGODubhRsefvDYRvyO8f05mtDhve7w
         mGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775863827; x=1776468627;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeIJ+47YJHgVFNBVdBgFqyz4yoe5uld63ghpZqILQvM=;
        b=OP7sKb/h3887r41imrCC1PXA4PSEdsEKI6nnchrbfgsqUPXBRFkwTT1Lv+/T3S4C6r
         WGxyrfQGyX2EAACHjKfH6HS92PZ/6GK5Y+s49zuS/snh75X03IOBmEns1WA4iLOw8NLA
         Bfh61e/ZJtt+OL/b6qBQ3wNOqFcH4rxrC1CV3vM7k8bkSheAcFRJ3ruKSL0bHTQd5tv6
         UVu26PkMgfvN3e7rBovF+bV7lmBE2U/+kaJO4SIyFx/iEWdUQKUeLzDoThgIf4rWwbVn
         izb4TeSBm1Ocf0IcZtPrrqwMl0MqcUvwaVyw+r8hNSQBtj5Ulwurr5LsvBwzfJiKQiAi
         7oJw==
X-Forwarded-Encrypted: i=1; AJvYcCVu9Mncr0Dcxa3MnN/ZcGrQ+q778+kOZQeEwq8uQAUlCBk48ytPAK+x5iZ+h6eo+2cISVPcE3JUIpS3@vger.kernel.org
X-Gm-Message-State: AOJu0YxtICx4AGovNYfGL/AfxdB/Q6CxvZ8P4Q/KmgPAiHvxEIE2jra5
	hDpmrvb9BZp1QaKHqVZqTaRAfZTAY/WbMNAZe88LUYyDviBybIS83mcs
X-Gm-Gg: AeBDiesrKpbjc++Ek/Xk/SCUNW1Ncy6oG5ny6MDNTxeTzA3gK1oMrjRgZMqTSZqTf+r
	ShUFk+G9JXmR+R5QUWGl0oKXSo4j/OLavi87xwJIA7fMmXEcwdOffyhpNX+sYBWWBjjsWMVO7PI
	sAdz5HQjAlPoC2Z47g5ktTbL7tLFSiEBD9ojPQhloVnC19qC/jrIwBJgB77fOsmOuujDHVMQiKF
	v/BodH0j28OH+QeBYyktfCggQ7JR8u6V5Kebs7PjbuJSfSaRpcqzqH+l2oYeORo35L3FYNx/tRL
	obbeT3y46WzbkA/HvqXWcNeiPjNn2yySSPvl6JQIKlX72u124HkPbrXHQGO4ffalxMVTqsHLcL3
	iLS8jMKATpzyfDLsKaQerlLN6BhlRS1hQPTK+l10nWjvba8n3eOhVfqLNgtvrgEh14tEaYILIMG
	uGr9BC7HJAlb8n44UuErx8t+YpzyS2r6iaVw2VCs4fNiMWV/IjxtDwT0qZ5mL7QNCa7KT6ZKn5
X-Received: by 2002:a05:6a20:a114:b0:39f:75a6:16e3 with SMTP id adf61e73a8af0-39fe3c92b93mr5535562637.2.1775863826973;
        Fri, 10 Apr 2026 16:30:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79216fff97sm3607104a12.7.2026.04.10.16.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 16:30:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <65e1ea4b-0269-47a8-be71-c286c032dc2e@roeck-us.net>
Date: Fri, 10 Apr 2026 16:30:25 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] hwmon: (ina3221) Various improvement and add
 support for SQ52210
To: Wenliang Yan <wenliang202407@163.com>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402081350.65559-1-wenliang202407@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260402081350.65559-1-wenliang202407@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 4/2/26 01:13, Wenliang Yan wrote:
> Changes in v7:
> - Fixed unnecessary semicolon in ina3221_read_value()
>    (reported by kernel test robot)
> 
> I will address any additional feedback in the next version.
> Thank you for your time
> 
Sashiko reports lots of issues with this series. Some of it is irrelevant
(for example, enum values for chip types are always lower case in the hwmon subsystem),
but many are real problems. Please take a look.

Thanks,
Guenter

> ---
> v6: https://lore.kernel.org/linux-hwmon/20260225090324.112145-1-wenliang202407@163.com/
> v5: https://lore.kernel.org/linux-hwmon/20260119121446.17469-1-wenliang202407@163.com/
> v4: https://lore.kernel.org/linux-hwmon/20260114081741.111340-1-wenliang202407@163.com/
> v3: https://lore.kernel.org/linux-hwmon/20251120081921.39412-1-wenliang202407@163.com/
> v2: https://lore.kernel.org/linux-hwmon/20251118125148.95603-1-wenliang202407@163.com/
> v1: https://lore.kernel.org/linux-hwmon/20251111080546.32421-1-wenliang202407@163.com/
> 
> Wenliang Yan (8):
>    dt-bindings: hwmon: ti,ina3221: Add SQ52210
>    hwmon: (ina3221) Add support for SQ52210
>    hwmon: (ina3221) Pre-calculate current and power LSB
>    hwmon: (ina3221) Support alert configuration
>    hwmon: (ina3221) Introduce power attribute and alert characteristics
>    hwmon: (ina3221) Modify the 'ina3221_read_value' function
>    hwmon: (ina3221) Support alert_limit_write function and write/read
>      functions for 'power' attribute
>    hwmon: (ina3221) Modify write/read functions for 'in' and 'curr'
>      attribute
> 
>   .../devicetree/bindings/hwmon/ti,ina3221.yaml |  15 +-
>   Documentation/hwmon/ina3221.rst               |  24 +
>   drivers/hwmon/ina3221.c                       | 548 +++++++++++++++++-
>   3 files changed, 571 insertions(+), 16 deletions(-)
> 

