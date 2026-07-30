Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E140538E8AB
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 04:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785384880; cv=none; b=bzYKoQCc859jlURBkcBHbQ+NttmN/kpc9p6mcfgSbFvpInOkGfGCM9S1ZvtNuhjLttXXpj0GZpzKadG7ZhoQhg/X68RZrz75kzwcshsKqd7D5IWSOedV+48nRN6kvlOdE7afXZ6mcytw7ZuzKjrsWGghC6VlVY+GonE6x743hhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785384880; c=relaxed/simple;
	bh=0Q8fQ7ih08tbw4lzBOTN5MiSutzmizbN15Ync8bM+X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HFsHZDdv0IfsUMFaz6H5qi/S44akoA9HTyyv03POEk1K0OittX2+DBCMn8B9RYPOp4lR9b2YGyhyHe7eV8aFwRL686ZfO6m9qhY6JGJpxvBhWb2mhUbUbN8Sd2dr2Gx2GOf2mzagOqUWSricfyEYXjMQKCvcMxYf4KKi/3ePUAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGC7gc1T; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGC7gc1T"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8423f236418so1339315b3a.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 21:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785384878; x=1785989678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vtrD6B8jP+hl6az+0jgCn+3wLAQryXG9np2Gsxpe3Z0=;
        b=YGC7gc1Tru2Qz3RcApXnn3kTyi9kg2GeZNRD3n1PaSwUyTZm4o6/ERFo39cv2jKp64
         0YDj3pd2lMx9Ws1H1fZMRdiISfMzdWyMlK2ranaRqqZf4S7gnve5stdBLQT3x6i3bwIk
         MXVV0qPCHN7rn4PlT4ffKqxgGRk5Drk3cWsmdLMZp8+Bc6mQOwD3kHhBZaEY5HWSVrOP
         xlNNBZAUOVFkaOVGYORBvmj5kzTNBqV0xWCZgnsj7AOoPC9X770Eja5eH7KVSFuirpx5
         tY5/rnzxxqtpgW7+F29Z3V09AWQESEC9tqqepB/wkhGBR3iU6pvCMNRwpydiBHTSWMuA
         qVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785384878; x=1785989678;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vtrD6B8jP+hl6az+0jgCn+3wLAQryXG9np2Gsxpe3Z0=;
        b=YJ7OSwZtA91zoc4nRqagFb8J6Be39JTQHY4pzM3lvCFcbBjXshrRBPdn/5UsQhp1VT
         /09OCBgsAmb1RdDQhI4cCe9YGjoc+JXtoCgyWRmcG/agLcAZDXOskfFCLtYFi50V06CT
         GmBRMeps1nLhhE2m+3LgKKg0A65RUcDV4oVe8O/1JRSBaeqrHpwOJ1Q9Ggbw9CL2+f5h
         +/LFciEuVjVVBl85jbGeH5qy1FdL+34a04P4R1RWf/qMrQHVPIMzLr8eqsYKmSQ0MPwV
         NRlUAy+4uM0rtxXbABDGOwRMtjtb0ZQaxV9+NHCN6fz4qCxQY+ryJcyYtzhE2IBDX2XY
         4wQw==
X-Forwarded-Encrypted: i=1; AHgh+RqtpAHFtaM8fpJ7LzWbSbjsdCSmhqzGyOI/uGSeKJiMBBXYdVxe7J3QfYCYzzVkRnCgowMfSpANRfXj@vger.kernel.org
X-Gm-Message-State: AOJu0YwDGcS9R+vSDJdzxouTNep9x+t1FQ2O/suPAmo8FutJJOL885NZ
	+INHjfeJTYWPiquTA1dLTngpOCalP+WNUGisfLH/evBjBqJrIh161ebU
X-Gm-Gg: AR+sD10caGiQi8y1nnQtwA93gvJr7uA2uEo90XwxJqOZi3PrDftYYAXkGDs33h+HnF9
	U14dHLbcuOru4YnM+o5nxNyjYzHJ0H/+Qx46jtY7UkaireNEu8HTTPI3NF/nK/HXPxd5cZ94IMz
	U518Hsz0EsxkYw2ua70mbrdo4cUiV/QxKJb4AsfcOTUdOH7oG3DWHMiurBd7tGeP5eqsbPHMJNf
	fJ2o6ONPhK01kzgWyz5WRiYMVhBs3kSUh4l1t061uqM2F55Km2jWjZwjBhEF3N2jld6RYqUE+IQ
	dZ3uftTajl7wuT84j8njajnYvmUfkvbcTUMUTO0ExrDHmRCXLVKI3BQmX+acgD1/a6FDeW0J5CP
	1VSd724tC7GpRucRHpQovADCAnmhSWvBhS5RVgU5WCHaK7nPKCJ28mXwkwRyQeJIIl61wJy94CX
	0djGggMY9DrIvVFHHhSbx3NVo8iUcGVm+XrlzeI2KijGowjWzx79KhuQLBJO9V8KpGR8/lt5tCO
	Xjb+1RIUIy0aiFth9ae0y8t3AbMLtREFnjp0VpseIYeu6t7
X-Received: by 2002:a05:6a00:4c98:b0:848:6447:e0a6 with SMTP id d2e1a72fcca58-84ebc1fd269mr1163841b3a.9.1785384878141;
        Wed, 29 Jul 2026 21:14:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02fc6afsm2241052b3a.36.2026.07.29.21.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 21:14:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <148bb518-a4a2-44a4-b796-aeb5aa6f459d@roeck-us.net>
Date: Wed, 29 Jul 2026 21:14:36 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] hwmon: pmbus: mpq8646: gate the writes
To: sashiko-reviews@lists.linux.dev, Vincent Jardin <vjardin@free.fr>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20260729-mpq8646_v0-v6-0-98848151cdb4@free.fr>
 <20260729-mpq8646_v0-v6-4-98848151cdb4@free.fr>
 <20260729220705.978B61F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260729220705.978B61F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 15:07, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Debugfs attributes perform I2C accesses without acquiring necessary locks, risking race conditions and bypassing hardware write protection.
> - [Medium] Mixing goto-based error handling with guard() declarations in the same function.
> - [Medium] Debugfs write functions mask negative error codes by returning 0 (success) on hardware failure.
> --
> 

Feedback seems valid. Please address.

Thanks,
Guenter

> --- Patch [4]: [PATCH v6 4/4] hwmon: pmbus: mpq8646: gate the writes ---
> commit ec4599677b214a57f0796000d18d9f3b6e5d4fb5
> Author: Vincent Jardin <vjardin@free.fr>
> 
> hwmon: pmbus: mpq8646: gate the writes
> 
> This commit adds unsafe debugfs provisioning and benchmarking helpers
> to write specific registers. These operations are restricted due to the
> risk of browning out the board or persisting bad setpoints.
> 
>> diff --git a/drivers/hwmon/pmbus/mpq8646.c b/drivers/hwmon/pmbus/mpq8646.c
>> index 1fd41d89e5bef..0034cf5919345 100644
>> --- a/drivers/hwmon/pmbus/mpq8646.c
>> +++ b/drivers/hwmon/pmbus/mpq8646.c
> [ ... ]
>> +static int mpq8646_dbg_clear_protection_last(void *data, u64 val)
>> +{
> [ ... ]
>> +	scoped_guard(mutex, &priv->mps_lock)
>> +		rc = i2c_smbus_write_byte(priv->client, MPS_CLEAR_LAST_FAULT);
>> +	if (rc < 0)
>> +		dev_warn(&priv->client->dev,
>> +			 "clear_protection_last: CLEAR_LAST_FAULT write failed (%d)\n",
>> +			 rc);
>> +	return 0;
>> +}
> 
> [Severity: Medium]
> Should this propagate the negative error code from rc instead of returning 0?
> Returning 0 masks hardware faults and might lead userspace provisioning
> scripts to assume the write succeeded.
> 
> [ ... ]
>> +static int mpq8646_dbg_clear_protection_last_force(void *data, u64 val)
>> +{
> [ ... ]
>> +	guard(pmbus_lock)(priv->client);
>> +	guard(mutex)(&priv->mps_lock);
>> +
>> +	wp_orig = i2c_smbus_read_byte_data(priv->client, PMBUS_WRITE_PROTECT);
>> +	if (wp_orig < 0) {
>> +		dev_warn(&priv->client->dev,
>> +			 "clear_protection_last_force: WRITE_PROTECT read failed (%d), aborting\n",
>> +			 wp_orig);
>> +		return 0;
>> +	}
> 
> [Severity: Medium]
> Like above, should this return the negative error code in wp_orig so the I2C
> read failure is reported to the caller?
> 
> [ ... ]
>> +	rc = i2c_smbus_write_word_data(priv->client, MPS_MFR_CFG_EXT,
>> +				       (u16)cfg_orig | MPS_MFR_CFG_EXT_CLR_LAST_EN);
>> +	if (rc < 0) {
>> +		dev_warn(&priv->client->dev,
>> +			 "clear_protection_last_force: gate open failed (%d)\n",
>> +			 rc);
>> +		goto restore_wp;
>> +	}
> 
> [Severity: Medium]
> Does this mix goto-based error handling with guard() declarations in the
> same function?
> 
> The cleanup guidelines specify that functions should either use scope-based
> cleanup exclusively or not at all, to avoid confusing ownership semantics.
> 
> [ ... ]
>> +static int mpq8646_dbg_store_all(void *data, u64 val)
>> +{
> [ ... ]
>> +	mpq8646_unsafe_warn_once(priv);
>> +	scoped_guard(mutex, &priv->mps_lock)
>> +		rc = i2c_smbus_write_byte(priv->client, PMBUS_STORE_USER_ALL);
> 
> [Severity: High]
> Should this also acquire the global pmbus_lock?
> 
> Issuing STORE_USER_ALL without the pmbus_lock might expose an unprotected
> NVM-busy window to PMBus core background polling.
> 
>> +	if (rc < 0)
>> +		dev_warn(&priv->client->dev,
>> +			 "store_all: STORE_USER_ALL (0x15) write failed (%d)\n",
>> +			 rc);
>> +	return 0;
>> +}
> 
> [Severity: Medium]
> Does this need to return the negative error code in rc instead of 0 on
> failure?
> 
> [ ... ]
>> +static int mpq8646_dbg_restore_all(void *data, u64 val)
>> +{
> [ ... ]
>> +	mpq8646_unsafe_warn_once(priv);
>> +	scoped_guard(mutex, &priv->mps_lock)
>> +		rc = i2c_smbus_write_byte(priv->client, PMBUS_RESTORE_USER_ALL);
> 
> [Severity: High]
> As with mpq8646_dbg_store_all(), should this also hold pmbus_lock to
> prevent NVM-busy window races?
> 
>> +	if (rc < 0)
>> +		dev_warn(&priv->client->dev,
>> +			 "restore_all: RESTORE_USER_ALL (0x16) write failed (%d)\n",
>> +			 rc);
>> +	return 0;
>> +}
> 
> [Severity: Medium]
> Should this return the negative error code in rc?
> 
> [ ... ]
>> +static int mpq8646_dbg_reg_set(void *data, u64 val)
>> +{
>> +	struct mpq8646_dbg_reg_ctx *ctx = data;
>> +	int rc;
>> +
>> +	mpq8646_unsafe_warn_once(ctx->priv);
>> +	if (ctx->desc->is_word)
>> +		rc = i2c_smbus_write_word_data(ctx->priv->client,
>> +					       ctx->desc->reg, (u16)val);
>> +	else
>> +		rc = i2c_smbus_write_byte_data(ctx->priv->client,
>> +					       ctx->desc->reg, (u8)val);
> 
> [Severity: High]
> Does this need to acquire pmbus_lock or mps_lock before performing the I2C
> write?
> 
> If another thread concurrently calls mpq8646_dbg_clear_protection_last_force()
> which temporarily lowers the PMBUS_WRITE_PROTECT register, could a direct
> write here slip through and bypass the hardware write protection?
> 

