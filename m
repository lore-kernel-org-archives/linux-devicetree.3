Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B9534CFDE
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915672; cv=none; b=NIY/lVXU6aL4+yxcksNef3au2nctguQuiyahaTu0y8/dqY9kytyzTqVZ/hzCO+9Ds5Xc604gm5qWNQ07+LFBiK3oY6omN1Ox9glTWNraYk5HI0PcMXx1avxRcq8PCK106bATTP+ziDE0Bfi6hBCojyXZ2eqE2tzjXDoSJAuar4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915672; c=relaxed/simple;
	bh=q4UMIkL3pHI1T1cC8daARSV7NQfTPKtbGVkANf4E56c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHvW97fENHQlxaXhVGNnYEfehirZStfC6KWD8i/13oJ0XzKGNNPoJSHfp+hmkk8/0Ax64dbqhHUIpXAl7MTzFjoE+7MReOdijP/Wk89OHqaGwmR0W/7HxcbSlN38rvA0Kvk82/1fDzWBc53WtSHZz+e+sfTki5onulJawThBoVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMSxZrFz; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMSxZrFz"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8478cc93299so360767b3a.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782915670; x=1783520470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=F4j0r6lGZlp22dAIjqHgmQ7+XjePNxdYrAwoeEfQPtc=;
        b=HMSxZrFzTycaEd58vyMmPMICKzFZGL6OBJ0Hh4yMIJgJ+On/pwgDwSYSM+QYhRzhJv
         jTlFflxKGzB6c2dLS40ORH9b4IaMQ92C86p9GVx6vUfoqlSA6wTeq3BGBQhhMVv3kSFC
         Ao7uCTnyIx4xoZJn38e2eYx9tjrwYaz/T4bRq4xKqFVZ/Uq2dwCvcWiGPCeF7S3rJTcd
         XfKbSTrVx7vzefPAKOFowqsrFAYdR42i0KihUfWJz5PZ6Yh4H6KHKVaMpN7n0qbX5+gs
         MRBOx/cXEkcf1eJJ+I0OV9NkWKl7FLhLRf1FKuYTtnFIgNZNkpEE/sCrheiv8PMuA/lo
         tLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782915670; x=1783520470;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4j0r6lGZlp22dAIjqHgmQ7+XjePNxdYrAwoeEfQPtc=;
        b=FG16O7O1z/htivJV42bMjIpBMXCW7M5Ilr94PHODW0UPUIKyJwaFwPAd+gCrxUbRjq
         U6CXyhRQnle7EPOMJOWYaA2kuF2AgUTwRZpmkJlU3emt487SEUcs+7zKkFEDq3wHSmU5
         ceTkZalr9snkKDjlrNPrPfOd+qxIAx+dEIJ2cAK/1g2Cd3HP+yoF/OHPPrtoL/5jvPPG
         snhpu3eEsg+rA8jr4Pe+erVA1Uni0eHomXfdAbLj8pznvMXA1LQtjpmM0ncH8iMuFyMq
         /rQYgPDIyBZmkfigBZ0UQQxW/Ba2x5tuHllfPglsQw+VHTIwrUXIGDGJwEX5/HIFrXHV
         wWuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+C1l0kA9p1Tp2tNVqhFWectjlSkzvm5A+7is7oucvQgLskhImarXXHKpF3HoHrZjQ+9olnJc0EX6i7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/wNxQ/OH81EvdmnaU7kGOK1Dpubh52roPOz9UrcRAALJ9GP5E
	knZSJK3QaSD/B/AAwcAcpddlUzJdXf3Kqcbw8s5E96jUbNq1taGlRZqr
X-Gm-Gg: AfdE7clNsyIYZ6txZd8zYEWOr38OlI4NjD4xMD/FEikMsmuhpj0yxzSyBL/rNjaBB2F
	7lphoPcM/u5snvYBezZVOVzpslSchqYIicsCsJTruiSCknfaanXnVixLVFe2Gk9pvkW45IMZwV+
	8MJQTg4eWk4ZQ6td94vIAKpFZpMSRE3Il2/wdAQShUxWkmMfxek43a/7sf2J9sKZcBXpHaKbJ6T
	QZ33QrAYSVFRNR25bpLDJxG7oyR0FwMlh01S3SxkMawb7eFN/0cW8nDj4SzqQJN/P8i589IgDSU
	aTTOb+IRW++E5KRh+NHXdeXQcZJFZfRsAYZ7AQt/kFqTHzzXelcKNVICuq+GRZFYYGZdeS/uijy
	FUpdbJdnEx6SZvWRhoYTXtZsyY1ZdO7crm97bqtQUJX4J24icN+zjFvYyctF6WsZdVxTdMA6QTW
	0DNP+CxifsenJrC3Qx73D6l8en2H3Cy2MtdtlZVQFideRaK2IWvsvmavU5momGOQ==
X-Received: by 2002:a05:6a00:464f:b0:845:ebbf:e7be with SMTP id d2e1a72fcca58-847c07424a8mr1621253b3a.23.1782915670237;
        Wed, 01 Jul 2026 07:21:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd382sm4162882b3a.35.2026.07.01.07.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 07:21:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <42717caa-4cee-4b32-af24-6767ab9f9b45@roeck-us.net>
Date: Wed, 1 Jul 2026 07:21:08 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hwmon: (emc1403) Convert to use OF bindings
To: Svyatoslav Ryhel <clamor95@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260619103153.216444-1-clamor95@gmail.com>
 <20260619103153.216444-3-clamor95@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260619103153.216444-3-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/19/26 03:31, Svyatoslav Ryhel wrote:
> From: Jonas Schwöbel <jonasschwoebel@yahoo.de>
> 
> Add OF match compatible table to be able to use this driver with Device
> Trees.
> 
> Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/hwmon/emc1403.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
> index 964a8cb278f1..ef1ccb40ed6c 100644
> --- a/drivers/hwmon/emc1403.c
> +++ b/drivers/hwmon/emc1403.c
> @@ -16,6 +16,7 @@
>   #include <linux/hwmon.h>
>   #include <linux/hwmon-sysfs.h>
>   #include <linux/err.h>
> +#include <linux/mod_devicetable.h>
>   #include <linux/sysfs.h>
>   #include <linux/regmap.h>
>   #include <linux/util_macros.h>
> @@ -659,14 +660,14 @@ static int emc1403_probe(struct i2c_client *client)
>   {
>   	struct thermal_data *data;
>   	struct device *hwmon_dev;
> -	const struct i2c_device_id *id = i2c_match_id(emc1403_idtable, client);
>   
>   	data = devm_kzalloc(&client->dev, sizeof(struct thermal_data),
>   			    GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
>   
> -	data->chip = id->driver_data;
> +	data->chip = (uintptr_t)i2c_get_match_data(client);
> +
>   	data->regmap = devm_regmap_init_i2c(client, &emc1403_regmap_config);
>   	if (IS_ERR(data->regmap))
>   		return PTR_ERR(data->regmap);
> @@ -682,10 +683,21 @@ static const unsigned short emc1403_address_list[] = {
>   	0x18, 0x1c, 0x29, 0x3c, 0x4c, 0x4d, 0x5c, I2C_CLIENT_END
>   };
>   
> +static const struct of_device_id emc1403_of_match[] = {
> +	{ .compatible = "smsc,emc1402", .data = (void *)emc1402 },
> +	{ .compatible = "smsc,emc1403", .data = (void *)emc1403 },
> +	{ .compatible = "smsc,emc1404", .data = (void *)emc1404 },
> +	{ .compatible = "smsc,emc1428", .data = (void *)emc1428 },
> +	{ }
> +
> +};
> +MODULE_DEVICE_TABLE(of, emc1403_of_match);
> +
>   static struct i2c_driver sensor_emc1403 = {
>   	.class = I2C_CLASS_HWMON,
>   	.driver = {
>   		.name = "emc1403",
> +		.of_match_table = emc1403_of_match,
>   	},
>   	.detect = emc1403_detect,
>   	.probe = emc1403_probe,

