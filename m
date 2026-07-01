Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CC0344DAA
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915868; cv=none; b=Ivy5SEvq6fTIvJe1bmNp5YpOhKUubCLaV+SL8HZeoZZs53VKWSjrQBLXMwvVKDDSBpWzQjHdajPebALdZz8ynH8dI9c2fxRE3uTbW5TiW2NdcwrJTljzLxhV41LhlpzVX53Lc58GS/c8jyafa3LzYHCcaRfiP8OL1r/xroTT9JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915868; c=relaxed/simple;
	bh=WjX6Uv6PwaQ78oIsHVOsGi1i4g+J/hD1ZX6kfwXpHoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lg1HjMtSiWlQAKi1O8uvkErHExGa4HuVzwkXxwWdWnvnTM657yAJVEqZGKKfLuMO6508TfnC72UffxrbKgplUyrMtxB4bQqJZyYcdiK/+MPqCXlxgZ4sMF0I3IoLFgU9xc9cHNx+qD7EWJORjawzfxRlkgDNshBNNjX85qAadUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJnFtCaL; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJnFtCaL"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8479f1a86ecso403064b3a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 07:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782915866; x=1783520666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cQgE5Coeqhf4kFtxJ/8eUiYVdplw0+IBrf+l7oeSMjE=;
        b=XJnFtCaLSV2bv8m2YP8NcQeuzF2zKi8y1XSs1fG3HAzYKxaCKNyf3rB0HDyfFvGX+R
         mz3wrlnNNCNxKgsesAciCJoGxstDGsHiBgKkHnXEZi52Q/DgH9rI8xIFqjJB1Arrs/t0
         3KUu6kKAE7WKswf6yrD7q5U5F+AktYWezMVfaV8VLBEy9/08UPo9JYU6dGEjjvJF/Hff
         hOhyQRo9R/HFaFzQbXj3RmBHo8gdFPcG+b7hXb1/SZpUBBSUWXy2IrTb8oqiddVCrfLD
         1rN6RtGGl0TvgSkeubKfQs3z7TzusB56qbXCb1EnpnEf7W8N1Y6P1tB1nuNESIp/RRGI
         ZKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782915866; x=1783520666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQgE5Coeqhf4kFtxJ/8eUiYVdplw0+IBrf+l7oeSMjE=;
        b=C12m4wKFGVnXs63z+TQlbZnjJH0W1f8h/SJN2am1sHW3hFKY4VyIlqDRZBZWQKzNLe
         fHKslm2oaZRRDBOMwrkPgsZKiSfoU2Y5/j0AvRK1aws2dVo1/Ny4itjkolvRsC4SCdLS
         z1OWEstkwgZtRB//gPWBH7+dOYdhUrAhHZ6I7780ZKiugnShKN3O7m/veL/kUFkrxVdG
         RHZz2MigW9Ry14FrleksoB2SclSS+40zrbuNx3roQ3W9ipHB/mVENu54LTavqX9boUVj
         XkYfn8Lz6RiT0WCLTdLoyPaesHefWJcrZsQqr4K0t6xhK3kgY17jn64cuRVg9awlS2vF
         1SlA==
X-Forwarded-Encrypted: i=1; AFNElJ8v7URM/fcErVjzc5U5yKQDl3n2LFME+sYOOezF/iOnviSCwJdganUTP2Z3nDW0eXxJ8f1x6rxzfqzY@vger.kernel.org
X-Gm-Message-State: AOJu0YzFekUOhC943pBbBXphsHk7q2JCD5vPNpw7YaFBLjvuoP2iEzXr
	jp4vly+3TIen9J6ejqlyI1sjxCsWBk5LkKoXVNDyKP+TK+MdmKZE6ej+sYfvOA==
X-Gm-Gg: AfdE7cnytU7YhztxtfR7l/Nr/ZI6iWOExCdCqgClAtMvH5pWJiOhrbHiY3bk/7mV7S/
	lseAL8K+csLYS27XyoK1PHydyIvmXO7jJ95SVN93By8dagg9ztOyBRV1IYrDPBBSaPa/fxu5HtO
	2vW8FNpoRhjW5P6WxmQ3tx9auW1UU1UqyhlQCGZ6BdIg5K7nx6I9tjigmXpfnXFKs8bTZc7Zzpy
	W+zdYWYbS9AMkEM74DAlQxWwqMuUrxIyRgGxvmfgtW5g6ifBHWN4zl70vgk3uS8BShijwJUfre6
	BDaAMldQRM/QTbk8oxHm6cZzLqLD8nkqWv8hS+lfvW4JW5ZP8fo83XVzee4tU09oEtmtPjqfHjs
	uA9ccpqMtjJdcfKi9k6iQ9zr1WNeU3R4DWoBXfNatjsjcRqvIsBm8nhBBRXrzv/ptBAtm5EjBTi
	bVU5c60acMJvCgVRmCLhp5IAYTDx8IWikq1OyWEPRdGYbaBSFi8KpVn+5svf9a5w==
X-Received: by 2002:a05:6a00:2986:b0:845:e3af:dde9 with SMTP id d2e1a72fcca58-847c51415e4mr953263b3a.38.1782915865802;
        Wed, 01 Jul 2026 07:24:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a0003615sm4160058b3a.17.2026.07.01.07.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 07:24:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <648a6df5-56ae-4e50-b1be-5ebc834d6866@roeck-us.net>
Date: Wed, 1 Jul 2026 07:24:24 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hwmon: (emc1403) Add regulator support
To: Svyatoslav Ryhel <clamor95@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260619103153.216444-1-clamor95@gmail.com>
 <20260619103153.216444-4-clamor95@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260619103153.216444-4-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/26 03:31, Svyatoslav Ryhel wrote:
> Add support for VDD power supply for this sensor. It is required on some
> devices for the sensor to start up and work properly.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/hwmon/emc1403.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
> index ef1ccb40ed6c..d14bd90ce424 100644
> --- a/drivers/hwmon/emc1403.c
> +++ b/drivers/hwmon/emc1403.c
> @@ -19,6 +19,7 @@
>   #include <linux/mod_devicetable.h>
>   #include <linux/sysfs.h>
>   #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>   #include <linux/util_macros.h>
>   
>   #define THERMAL_PID_REG		0xfd
> @@ -660,6 +661,12 @@ static int emc1403_probe(struct i2c_client *client)
>   {
>   	struct thermal_data *data;
>   	struct device *hwmon_dev;
> +	int ret;
> +
> +	ret = devm_regulator_get_enable(&client->dev, "vdd");
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to enable regulator\n");
>   
>   	data = devm_kzalloc(&client->dev, sizeof(struct thermal_data),
>   			    GFP_KERNEL);

