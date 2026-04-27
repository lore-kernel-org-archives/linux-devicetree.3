Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D633B6C15
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777288541; cv=none; b=cSQsdX4/7V/Up8ICfvxrMcNhQQz09LkMuEeEEhB9QGbFy0TfPOMF4IPXLmsaaYeo5njw1oVP8xx26K6WlavASzLR0o5vYoeWv7eDeCRWn5w5JbZIFMC9eEIrNIJtcUEgkzzOgroc24zL5O6YE4DdF8+F/+q+NHeHd3xRiIvxRp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777288541; c=relaxed/simple;
	bh=zlrr2Yu1uoM/mY1F/y5KY8NvkTswYtCilqPxh/eNl9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XrPKfMx4XnfgjJddtXR8Ree5096wqnC0h51jeYGN4GDxNOG/er42YMd7bSXxWokOq2EFco7VNHH2FpRUERf92M96NjijtY1MKOSKp2Fr7TGuzsL91uiwVH+d24S12gisbdsnYdYtiZMnroMn5LOjNPw7W6UUQei+n3DXtP4npeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=FUXp3eM7; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="FUXp3eM7"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-83178c0f29cso2725804b3a.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 04:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1777288539; x=1777893339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Rje4x4SovYBJkB2QxRF5jrWyY5IZK3xvV8YvRMucwE=;
        b=FUXp3eM7naSgV5IwSdhb6InelulGm26+3yaMSmn9fP/RcPVquIXPhJ92iTZZd/4f1H
         Jg5KkWaq3ByGm0OeTLTgshlVH4MrSRVkmetSPlg7+eqd84FlY8eWUsSBefWflYUJBXzA
         RWbNtfaWxPdTnYe7LQ7/1OJK+sYFis1cZSJk90frWxFAYyYwH/5eYTgrieAecr+IneeN
         tZPp6syW9Kq5pGdGrkNl2F9ZxLWi7bE6cOiXK7WrlsEP2Bolee6AmVvndulSqiteR5hJ
         QE8H2Ok3tZEkpHLv5Wu3mQgzioMjrddXjbG64pBaLjFGJc0VVXhIqRmwvPx3PhDxcwEt
         RLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777288539; x=1777893339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Rje4x4SovYBJkB2QxRF5jrWyY5IZK3xvV8YvRMucwE=;
        b=QFC1tLkQnVhWhzIbLWwGG+8GIvvuTKbpDERxAhYlausraAo+CVC7EukfywBF2wXxMa
         IijpE+kmiY/qrrXg2oBWoyyyYkjsaqdREfp/GA7Cd8jbeaScE/wBCF7dN8R1IrRsyoTw
         ohmCmczWe8CcKaS7UtJ2xDIPZQsReN06fklKhKUM+01cqz4Odu21ML795uXGcsEKp93s
         YhqHzNuf+ft/204EZm+fgHJwtX60KYTUA4iqOH2ZfbKH4W4uVf4wU7lnNSc4yG9ZKowm
         g45ysWR/LlXjFinQcrz2X+uDvkwjyWe4tlDHv/m4I4r3/72SEmmiWhDZK5HQj3/5gUJG
         ORjw==
X-Forwarded-Encrypted: i=1; AFNElJ/HmjyDfBNmH9P5f8u1KMadyE/bh5a/GtRyvjSCNZpBZeac+epQ/D7WmjHYXBTDNs6PoGc+UifhyhUi@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc33DLO5PRqxPnKciOdOBjnekn4OwngIIu2CSUyG5ftUvEr2+G
	LMFzNVDDwAYHCtvu5jcyw0J5xH1oDegr0v2C3egv7vc0Qq8+4ZiwzKD75dhniQI/w4Q=
X-Gm-Gg: AeBDieus9/VaIL50n3DlREjXiualjeCUaW291MYOVp/uxo+UTcVY2O4snwZ5ZrpV1x0
	0Rf8LhvXpLNL8dnCpSdD+i+1ncpv19waCMfSrUyixWwuD2bFzOAVsB+F6eS6HAVF4AE96Nd3ZUP
	ar6UhHHjYHyIO2WRVgEQnPo//tp9l8UC9sadbePMk0U7PF4KZ+tgn15CCe0XWspShgTUb+4BfOz
	ZGfC1u3nsPBgBs7t0o5Qb1YVgRqCTatLJ8DTmC/olPNIJtspma6+7MvUYFCPD4el4zKl2bq1rUj
	mIgk08Xx6xnrQukZqBg3T/errqj8f8lMYQ3VrgNk8CFtpzxNYkjhSEbPEIWmQqqFtjbTuljvsXa
	mVIc6TV+97etlV0CsPU3pQH383Qen+vRa0lVWot6uzcE22+alrTkLyREL2H8DWMO8Bm5atnh6xH
	tdYY83iW4HEQjUbXVVXOQlVauXxyertq3w/p/SX6lD1tiDyS3o4guzVZEgFM+IbUcftZFNj38Cp
	FtejsM=
X-Received: by 2002:a05:6a00:2e15:b0:82f:f4d:23c1 with SMTP id d2e1a72fcca58-82f8c943269mr42638930b3a.44.1777288539329;
        Mon, 27 Apr 2026 04:15:39 -0700 (PDT)
Received: from TAO-BU2-SWA-3 (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0307esm32600350b3a.53.2026.04.27.04.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 04:15:38 -0700 (PDT)
Date: Mon, 27 Apr 2026 11:15:34 +0000
From: Brian Chiang <chiang.brian@inventec.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/lx1308) Add support for LX1308
Message-ID: <sin7miac7dzupdvtnrngzvnkqqqqaojb7ige6465gajigiezsa@o3gsylu4shig>
References: <20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com>
 <20260422-add-support-lx1308-v1-2-9b8322f45aae@inventec.com>
 <20260423-simple-uber-labrador-0b9b36@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20260423-simple-uber-labrador-0b9b36@quoll>


>> +
>> +static struct pmbus_driver_info lx1308_info = {
>> +	.pages = 1,
>> +	.format[PSC_VOLTAGE_IN] = linear,
>> +	.format[PSC_VOLTAGE_OUT] = linear,
>> +	.format[PSC_CURRENT_IN] = linear,
>> +	.format[PSC_CURRENT_OUT] = linear,
>> +	.format[PSC_POWER] = linear,
>> +	.format[PSC_TEMPERATURE] = linear,
>> +
>> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
>> +		| PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
>> +		| PMBUS_HAVE_PIN | PMBUS_HAVE_POUT
>> +		| PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
>> +		| PMBUS_HAVE_STATUS_INPUT,
>> +
>> +	.read_word_data  = lx1308_read_word_data,
>> +	.write_word_data = lx1308_write_word_data,
>> +};
>> +
>> +static const struct i2c_device_id lx1308_id[] = {
>> +	{ "lx1308" },
>> +	{ }
>> +};
>
>All ID tables should be next to each other, usually just before the
>struct with driver.

Will reorganize in v2 - i2c_device_id and of_device_id tables grouped
together immediately before struct i2c_driver.

>
>> +
>> +MODULE_DEVICE_TABLE(i2c, lx1308_id);
>> +
>
>...
>
>> +	if (ret != 12 || buf[0] != 'V')
>> +		return dev_err_probe(&client->dev, -ENODEV,
>> +				     "Unsupported Manufacturer Revision '%s'\n", buf);
>> +	return pmbus_do_probe(client, &lx1308_info);
>> +}
>> +
>> +static const struct of_device_id lx1308_of_match[] = {
>> +	{ .compatible = "luxshare,lx1308" },
>
>Where is the rest of your compatibles? Do not document ABI which is
>unused. submitting-patches in DT forbids that.

Addressed in the patch 1/2 reply: the variant compatibles encode only
mechanical differences (pin length, pin-14 assignment, output cap) that
are invisible to software. In v2 I will drop them from the binding and
move to trivial-devices.yaml with a single "luxshare,lx1308" compatible.

>
>> +	{ }
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, lx1308_of_match);
>
>Best regards,
>Krzysztof
>

Best regards,
Brian
