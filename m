Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57A940823E
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 16:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542582; cv=none; b=ilj9PaJwXEkiSugp0VRl9H/Sq83UY0U8Uyb6GnlFUoMwgTNlTQPU2W7dIgw9RYaNidhxhNmbRK2sjEs1DGcjmc3QCCIN42yZ2C83DWO9otQKQWi9N+UMnug3OV6q62UCF4/mOU1WGMY0JWn+hbm1crLsTUld17HUsT3hPuBFYnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542582; c=relaxed/simple;
	bh=Pc2pOJEBsLAZw3jUPSNAlyT2q40nl8r8RvBKNH4SJRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ghrb2Z73pUVdsa887C7He3/zHXG4AzricHjTvbujFoY6vrl5EtstBpxtskiyitTWDWL1uPvkJDiQpVgjcq2UOxtXJSpyzCvJWFy15N9v8eDflb94x3rQSCXpHipiIzCIvwFmIAxb21zS/UcKCtTC5Jjr1Eavj4yyug5am8PT3HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1ERjTEa; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1ERjTEa"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2aaf43014d0so7998475ad.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774542580; x=1775147380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mM33SC4UnhVMrEBz89GjfG2tBHsawhNUgqbbkCAWGy8=;
        b=C1ERjTEaVkZziGL0w1sxyPw2KagbeRwBwiUz5eN9ZCzyF+GLOpHcuFahgK4QamYACS
         Cxs6XXtrB3Ml9jHHAh7JTaxQ1aLnolrlh/EtxRBD1ETvHOaAmlQ31EgK2UH37WNH7uAH
         JKcAgzGo6UomcGWTpa6WOCx7zqmKhVe9opQo5pOdb/2rmrZmJBbqsWbguxGhbuQNejmC
         0koHAPR4d2/6rDuMUElpiKYC6X334vTVgDfgiLx0J5My8KSeiZWlrYzcg7AfbhvhUGpq
         thzNf5Xh4GgYEz8ao3NrMs02YnBudvj4ZgCG19+XqiSzrBR/teU/jUdoXUGxlQhpzT7s
         LsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774542580; x=1775147380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mM33SC4UnhVMrEBz89GjfG2tBHsawhNUgqbbkCAWGy8=;
        b=AlGZRxFVupvsBjuQpCWDFJgtPuFk8lWuj9fzSEEUo58goLHG0Kq3/YvFUT+JLsM/gz
         n06Pz8XP6Rj0x1huwFeeupcOwhhdsa4cJqzXOup9Btq0XPx/2jpN/AkVswADDMnJZTR2
         Ky+Twsd+sYFK1kv85lkTs6vsPq8IiWtAPFKhhI+1/wAORXEMhETEv5MF+qyAU+uqUdhO
         3jaHEsOx1CyEhUh5agOuFLIxvNn3OiORvhP8S4vT8MDE+nARrKIen3ZYhjqPL+WwRzFY
         yp8Nt1ueAjsFuawfrkR4GsVf23tzmwLOGBqxkUuoqm4sz1vB4OUW2jNUd05pjYEM5Sh4
         O4oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnNV0wL+pLyEzxfCQ0B2409WQAyQVC20mALyMpjPBEtgf7hvb8xZGC86cTN3D+Yf+Bt0O4FWfoWZJc@vger.kernel.org
X-Gm-Message-State: AOJu0YzanR/7yKLan3pcoZC9h8TocYuM/ua64xldvWR4IooVVsRKlVSa
	Y+d+1c9uJYMYKlXiqBqXVGz3t/tVTtZJrCHgLXXw/uad8Z/HvxV2ZKJo
X-Gm-Gg: ATEYQzxD9lrZ7w5JymBoAtZAfDFW8/DubIqA8n+Lv0XcKdMt5V3blciPYPcD1w1QrKd
	YxjnLGh9oIOCU5maeShwqDzouEHWCS7sfNElgr0Ceqwt70dt5sj9lSGyiCC+j7L0MX5kNKvqwHz
	+vDwKjr22gSqNd673n+liXkb2WDOj3SppmPG2YvIoh0dSlxbM9Tn31ZoRyL/MEpG1YiKUqPf1/k
	Ar1o9wxseHEyzgK5IwMoiQfGBRtOVFfjM+u9oXUjv3guCN5vfF4+nxDNTXnB+uiqQSIakhwHMFH
	Sq+E5WJS1NcyRJc/TWCHsriaUezFxEd/13yz/Kudu5QMPerlYJ/YRwE6dYglBwwaL+y3l7NpR7o
	I8kqLDAQ4u23bIt4hKBHRzihdbNl41SjOt3VWSWCDO+Grw5k2dOknCQrOXLbqdFvsJce8NNEHpo
	OdiM5tIedyyw75K/ce5BkVqH+opATEOGXz0AfKMYYqjbMFLKQ=
X-Received: by 2002:a17:903:1b47:b0:2b0:6e8f:8e85 with SMTP id d9443c01a7336-2b0b09c1deemr95240665ad.5.1774542580021;
        Thu, 26 Mar 2026 09:29:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc79c471sm36143895ad.22.2026.03.26.09.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 09:29:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 26 Mar 2026 09:29:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Brian Chiang <chiang.brian@inventec.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Jack Cheng <Cheng.JackHY@inventec.com>
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/q54sj108a2) Add support for
 q50sn12072 and q54sn120a1
Message-ID: <79e3b8f1-f8ba-41af-96d4-b9a1b84ef810@roeck-us.net>
References: <20260326-add-support-for-q50sn12072-and-q54sn120a1-v2-0-77bc77eedc76@inventec.com>
 <20260326-add-support-for-q50sn12072-and-q54sn120a1-v2-2-77bc77eedc76@inventec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-add-support-for-q50sn12072-and-q54sn120a1-v2-2-77bc77eedc76@inventec.com>

On Thu, Mar 26, 2026 at 01:48:06PM +0000, Brian Chiang wrote:
> From: Jack Cheng <cheng.jackhy@inventec.com>
> 
> The Q50SN12072 and Q54SN120A1 are high-efficiency, high-density DC-DC power
> module from Delta Power Modules.
> 
> The Q50SN12072, quarter brick, single output 12V. This product provides up
> to 1200 watts of output power at 38~60V. The Q50SN12072 offers peak
> efficiency up to 98.3%@54Vin.
> 
> The Q54SN120A1, quarter brick, single output 12V. This product provides up
> to 1300 watts of output power at 40~60V. The Q54SN120A1 offers peak
> efficiency up to 98.1%@54Vin.
> 
> Add support for them to q54sj108a2 driver.
> 
> Signed-off-by: Jack Cheng <cheng.jackhy@inventec.com>
> Co-developed-by: Brian Chiang <chiang.brian@inventec.com>
> Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
> ---
>  drivers/hwmon/pmbus/q54sj108a2.c | 97 ++++++++++++++++++++++++++++------------
>  1 file changed, 68 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
> index d5d60a9af8c5..cc2b32ad935c 100644
> --- a/drivers/hwmon/pmbus/q54sj108a2.c
> +++ b/drivers/hwmon/pmbus/q54sj108a2.c
> @@ -22,7 +22,9 @@
>  #define PMBUS_FLASH_KEY_WRITE		0xEC
>  
>  enum chips {
> -	q54sj108a2
> +	q50sn12072,
> +	q54sj108a2,
> +	q54sn120a1
>  };
>  
>  enum {
> @@ -55,10 +57,24 @@ struct q54sj108a2_data {
>  #define to_psu(x, y) container_of((x), struct q54sj108a2_data, debugfs_entries[(y)])
>  
>  static struct pmbus_driver_info q54sj108a2_info[] = {
> -	[q54sj108a2] = {
> +	[q50sn12072] = {
>  		.pages = 1,
> +		/* Source : Delta Q50SN12072 */
> +		.format[PSC_VOLTAGE_OUT] = linear,
> +		.format[PSC_TEMPERATURE] = linear,
> +		.format[PSC_VOLTAGE_IN] = linear,
> +		.format[PSC_CURRENT_OUT] = linear,
>  
> +		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
> +		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_POUT,
> +	},
> +	[q54sj108a2] = {
> +		.pages = 1,
>  		/* Source : Delta Q54SJ108A2 */
> +		.format[PSC_VOLTAGE_OUT] = linear,
>  		.format[PSC_TEMPERATURE] = linear,
>  		.format[PSC_VOLTAGE_IN] = linear,
>  		.format[PSC_CURRENT_OUT] = linear,
> @@ -69,6 +85,20 @@ static struct pmbus_driver_info q54sj108a2_info[] = {
>  		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
>  		PMBUS_HAVE_STATUS_INPUT,
>  	},
> +	[q54sn120a1] = {
> +		.pages = 1,
> +		/* Source : Delta Q54SN120A1 */
> +		.format[PSC_VOLTAGE_OUT] = linear,
> +		.format[PSC_TEMPERATURE] = linear,
> +		.format[PSC_VOLTAGE_IN] = linear,
> +		.format[PSC_CURRENT_OUT] = linear,
> +
> +		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
> +		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_POUT,
> +	},
>  };
>  
>  static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
> @@ -270,7 +300,9 @@ static const struct file_operations q54sj108a2_fops = {
>  };
>  
>  static const struct i2c_device_id q54sj108a2_id[] = {
> +	{ "q50sn12072", q50sn12072 },
>  	{ "q54sj108a2", q54sj108a2 },
> +	{ "q54sn120a1", q54sn120a1 },
>  	{ },
>  };
>  
> @@ -280,6 +312,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
> +	const struct i2c_device_id *mid;
>  	enum chips chip_id;
>  	int ret, i;
>  	struct dentry *debugfs;
> @@ -292,14 +325,9 @@ static int q54sj108a2_probe(struct i2c_client *client)
>  				     I2C_FUNC_SMBUS_BLOCK_DATA))
>  		return -ENODEV;
>  
> -	if (client->dev.of_node)
> -		chip_id = (enum chips)(unsigned long)of_device_get_match_data(dev);
> -	else
> -		chip_id = i2c_match_id(q54sj108a2_id, client)->driver_data;
> -
>  	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
>  	if (ret < 0) {
> -		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
> +		dev_err(dev, "Failed to read Manufacturer ID\n");
>  		return ret;
>  	}
>  	if (ret != 6 || strncmp(buf, "DELTA", 5)) {
> @@ -308,19 +336,25 @@ static int q54sj108a2_probe(struct i2c_client *client)
>  		return -ENODEV;
>  	}
>  
> -	/*
> -	 * The chips support reading PMBUS_MFR_MODEL.
> -	 */
>  	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to read Manufacturer Model\n");
>  		return ret;
>  	}
> -	if (ret != 14 || strncmp(buf, "Q54SJ108A2", 10)) {
> +	for (mid = q54sj108a2_id; mid->name[0]; mid++) {
> +		if (ret == strlen(mid->name) && !strncasecmp(mid->name, buf, ret))
> +			break;
> +	}
> +	if (!mid->name[0]) {
>  		buf[ret] = '\0';
>  		dev_err(dev, "Unsupported Manufacturer Model '%s'\n", buf);
>  		return -ENODEV;
>  	}

From Sashiko feedback:

In the original driver, the PMBUS_MFR_MODEL response length was explicitly
expected to be 14 bytes (if (ret != 14 || strncmp(buf, "Q54SJ108A2", 10))),
indicating the hardware returns the 10-character name padded with 4 extra
bytes. The patch changes the detection logic to loop through supported
devices and strictly require the returned length to match the device name's
length exactly (`ret == strlen(mid->name)`). Since `ret` will be 14 for the
original hardware, and strlen("q54sj108a2") is 10, the condition 14 == 10
evaluates to false. This causes the loop to exit without matching,
erroneously printing 'Unsupported Manufacturer Model' and returning -ENODEV.
This completely breaks driver probing and hardware monitoring for the
pre-existing Q54SJ108A2 device."

> +	chip_id = mid->driver_data;
> +
> +	if (strcmp(client->name, mid->name) != 0)
> +		dev_notice(dev, "Device mismatch: Configured %s, detected %s\n",
> +			   client->name, mid->name);
>  
>  	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION, buf);
>  	if (ret < 0) {
> @@ -341,6 +375,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
>  	if (!psu)
>  		return 0;
>  
> +	psu->chip = chip_id;
>  	psu->client = client;
>  
>  	debugfs = pmbus_get_debugfs_dir(client);
> @@ -359,9 +394,6 @@ static int q54sj108a2_probe(struct i2c_client *client)
>  	debugfs_create_file("write_protect", 0444, q54sj108a2_dir,
>  			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_WRITEPROTECT],
>  			    &q54sj108a2_fops);
> -	debugfs_create_file("store_default", 0200, q54sj108a2_dir,
> -			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_STOREDEFAULT],
> -			    &q54sj108a2_fops);
>  	debugfs_create_file("vo_ov_response", 0644, q54sj108a2_dir,
>  			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_VOOV_RESPONSE],
>  			    &q54sj108a2_fops);
> @@ -383,27 +415,34 @@ static int q54sj108a2_probe(struct i2c_client *client)
>  	debugfs_create_file("mfr_location", 0444, q54sj108a2_dir,
>  			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_MFR_LOCATION],
>  			    &q54sj108a2_fops);
> -	debugfs_create_file("blackbox_erase", 0200, q54sj108a2_dir,
> -			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_ERASE],
> -			    &q54sj108a2_fops);
>  	debugfs_create_file("blackbox_read_offset", 0444, q54sj108a2_dir,
>  			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ_OFFSET],
>  			    &q54sj108a2_fops);

What is the purpose/value of keeping this file outside the if() block ?

> -	debugfs_create_file("blackbox_set_offset", 0200, q54sj108a2_dir,
> -			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_SET_OFFSET],
> -			    &q54sj108a2_fops);
> -	debugfs_create_file("blackbox_read", 0444, q54sj108a2_dir,
> -			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ],
> -			    &q54sj108a2_fops);
> -	debugfs_create_file("flash_key", 0444, q54sj108a2_dir,
> -			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_FLASH_KEY],
> -			    &q54sj108a2_fops);
> +	if (psu->chip == q54sj108a2) {
> +		debugfs_create_file("store_default", 0200, q54sj108a2_dir,
> +				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_STOREDEFAULT],
> +				    &q54sj108a2_fops);
> +		debugfs_create_file("blackbox_erase", 0200, q54sj108a2_dir,
> +				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_ERASE],
> +				    &q54sj108a2_fops);
> +		debugfs_create_file("blackbox_set_offset", 0200, q54sj108a2_dir,
> +				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_SET_OFFSET],
> +				    &q54sj108a2_fops);
> +		debugfs_create_file("blackbox_read", 0444, q54sj108a2_dir,
> +				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ],
> +				    &q54sj108a2_fops);
> +		debugfs_create_file("flash_key", 0444, q54sj108a2_dir,
> +				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_FLASH_KEY],
> +				    &q54sj108a2_fops);
> +	}
>  
>  	return 0;
>  }
>  
>  static const struct of_device_id q54sj108a2_of_match[] = {
> -	{ .compatible = "delta,q54sj108a2", .data = (void *)q54sj108a2 },
> +	{ .compatible = "delta,q50sn12072" },
> +	{ .compatible = "delta,q54sj108a2" },
> +	{ .compatible = "delta,q54sn120a1" },

Why drop .data here ?

Thanks,
Guenter

>  	{ },
>  };
>  
> @@ -421,6 +460,6 @@ static struct i2c_driver q54sj108a2_driver = {
>  module_i2c_driver(q54sj108a2_driver);
>  
>  MODULE_AUTHOR("Xiao.Ma <xiao.mx.ma@deltaww.com>");
> -MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2 series modules");
> +MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2 and compatibles");
>  MODULE_LICENSE("GPL");
>  MODULE_IMPORT_NS("PMBUS");
> 
> -- 
> 2.43.0
> 
