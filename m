Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BE63CC327
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840667; cv=none; b=rG4eSvJCHqKdH1mowxip7AIcY+JXEHEej0DpvaEyYH/yYmlDcV38Jy+nWxVg5DIpiFv8dJ/BbU2RnVneKbE8rhOssakFZeglk2sAXQ2lmOxGRzJLt+W+Ho9nKuYduh72+Dh3P3k9OHA3gWf+V4YsYGgt3KnT43cfQo+ELU6oX3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840667; c=relaxed/simple;
	bh=8xEDce2Q5TNrRuQOskR4CwZF5AI16FzC3URY6q99CbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fd/2yFJ1g3gj+V8inKKMKTOFpxiTLlAxtDPdDjHMLvTCg9LN6uRVz3oTtg5BRZbncR1tN/A6vfifZnlO3N48nSH7uzGSqZCxysx+N1CFkeeDhwHB1FR88jZft0wsKBa71ZTD6LL0EakEGCnxfUSipK2xn5iDDco3s0X/r6KF8JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bO9+CUBL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bO9+CUBL"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b45cb89f7eso57692065ad.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778840665; x=1779445465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7lGapQgwNQPPih2EM0EGGV8Ut1x59WEYoqlJ7vxU+bQ=;
        b=bO9+CUBL4H6Hma1NoIdx9kG2qqLaACZATb+igSKSbDdL00z5r8JbRHInHxVDYyLXgd
         YH3wDYIJlxZEs7kf0wUoPQxya1Dmi1TkhWhr/leudwS0KCwyGdanHruBXN/t/O8w/sdX
         brwhMGizWkXaCewVyQRIsX40xaES4PK6+Pvbf80tdmFSDeb43bs8Itdu1jUcyKlVWJox
         NZjCaJvGHRPmh/Q9BPMHJUfvPw9inkx6Enxjy82msw6UqZfCtB+h+E+QNx9oxmMPW/+2
         1WqISJawLkoK2hiJE0rIET+aBW3QmdhlIwWpmRalddy1EM6jT6CV2ymts+VBzSpFrWe8
         nDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840665; x=1779445465;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7lGapQgwNQPPih2EM0EGGV8Ut1x59WEYoqlJ7vxU+bQ=;
        b=MbWd48N4P2KdsJSoyFPQx2/4TiUcaBu/+NwRPTHTrzZ0BSK5ZqQ35ZCSe3tdfedQm5
         0GAkc2tDk8jR8egRcRkINBDzC+Zb1yv5inDCdts3Jb+zk5K7TdTyKX0Gbsnk181sYXIU
         +nTuA/qaGmdaPdCjuJZBpBHdljsbpGnS2JwLutKHplZMc0kOjDfQpgUhyVt6MQBI4kMC
         Pi0KnsQ7Fwd9eqbLlbSvAKFzgtlO+q7Lud91k+O5Imu3KjKsSV0AGaO5LYmRfUVqO1z2
         QbBXjaHKUV4KCr14rSc14MnB8bmQ/iOnVQ8z2Yb8nhSju+gArngeSBPosXsoG2le/tiV
         vsrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9aLGsE2Ow8QX75H8HzIkw1/ZHMHuxCdTjm+6Ijq4dWuZr90ekVQ1OeG1I94M3vm8PPUtlpnsd8ajrS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7XzgZvBK8pSYDU/5dSqLStqJRW5EGh5aMLzl3qQC8Tcop8HZJ
	uwS/xs5XBn5T11Ui42Azhlop+emI1G/LO2QZ1t4inPB6yg3+0HHKt6LK
X-Gm-Gg: Acq92OGNl8lcV0/JFwjRP++BYfsUJCpl0zpwgea2zObBjUuipQbpnT5V+yrOuoUg5Ib
	4PeROWtgt5PQIpoRMyNpVRBJXRDBibM4En9s1t9LC8F4OSS434QABMlqo6FjSqMn93xybz9hwaO
	2/ATJLgxA+cYuhf5WlZrWdHJTw1NJgiYbZaqzoCnQ8RUPjr93ebu2s5zcJhWgbcwpeXoqK/qaqQ
	/vTm0IBlvcdmGO6UIUSyNUlSeGoPJCXP7R+Iyv03UKMmqKz+n9y+vYEMdMcMxBI+76DaHnqhT3K
	spRR2bXPxzvvW/TIMQss6ujnh40sqrmGJT1JyQDJxgpSmWGza3xjxeAEVp9o8YIXtWz5kPoXvye
	HaeEEBVHb/WYXu0V4fEd2tuvQNNzWJmj3mVZYgX7Px1WG4J5hff8Vqw7sN4ja4gaiq+KY0m8UAU
	VjcBCHFESEzcRxN+kXTtBoT1yMikjby99QZisa/2/EYfoxOynfJFT0JmDgE2vdOv4uBQIAXCAOx
	jDMA7N2xVU=
X-Received: by 2002:a17:902:76cb:b0:2ae:ba5f:3ac3 with SMTP id d9443c01a7336-2bd7e78576cmr31546395ad.2.1778840664890;
        Fri, 15 May 2026 03:24:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8698sm52556945ad.40.2026.05.15.03.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:24:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fd9b767e-18e5-40a6-b503-52427852951c@roeck-us.net>
Date: Fri, 15 May 2026 03:24:23 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
To: sashiko-reviews@lists.linux.dev, hehuan1@eswincomputing.com
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260515092128.483-1-hehuan1@eswincomputing.com>
 <20260515100355.A7497C2BCB0@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260515100355.A7497C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/15/26 03:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
> - [Critical] The timeout calculation for sensor conversion evaluates to 0 jiffies, causing all reads to instantly fail.
> - [High] Missing pm_runtime_disable() in the devres cleanup path leads to an unbalanced disable_depth.
> - [High] Clock leakage on the IRQ request error path when CONFIG_PM is disabled.
> - [High] Race condition between ISR and main thread leaks PM runtime active state.
> - [High] Incorrect initialization order causes an IRQ storm during probe if an interrupt fires early.
> - [High] Lack of internal locking in eic7700_pvt_hwmon_read allows concurrent hardware state corruption.
> - [Medium] Useless and incorrectly ordered devres action for unblocking sysfs readers.
> --
> 
> commit fe78922d5101b3a07ca5ea0fbd0fd5e9cba0dcc9
> Author: Huan He <hehuan1@eswincomputing.com>
> 
> hwmon: Add Eswin EIC7700 PVT sensor driver
> 
> Add support for ESWIN EIC7700 Voltage and Temperature sensor. The driver
> supports temperature and voltage monitoring with polynomial conversion,
> and provides sysfs interface for sensor data access.
> 
>> diff --git a/drivers/hwmon/eic7700-pvt.c b/drivers/hwmon/eic7700-pvt.c
>> index 0000000000000..cdcfa031cdbdb
>> --- /dev/null
>> +++ b/drivers/hwmon/eic7700-pvt.c
> [ ... ]
>> +static irqreturn_t eic7700_pvt_hard_isr(int irq, void *data)
>> +{
> [ ... ]
>> +	val = readl(pvt->regs + PVT_DATA);
>> +	WRITE_ONCE(pvt->data_cache, FIELD_GET(PVT_DATA_OUT, val));
>> +	complete(&pvt->conversion);
>> +
>> +	if (IS_ENABLED(CONFIG_PM))
>> +		pm_runtime_put_noidle(pvt->dev);
>> +
>> +	return IRQ_HANDLED;
>> +}
> 
> If the main thread in eic7700_pvt_hwmon_read() drops the usage count from 2
> to 1 before the ISR drops it from 1 to 0, will both threads fail to trigger
> the idle callback?
> 
> This could leave the device indefinitely in the active state. Should the ISR
> use pm_runtime_put_autosuspend() or pm_runtime_put() instead of
> pm_runtime_put_noidle()?
> 
> [ ... ]
>> +static int eic7700_pvt_read_data(struct pvt_hwmon *pvt,
>> +				 enum pvt_sensor_type type, long *val)
>> +{
>> +	unsigned long timeout;
> [ ... ]
>> +	timeout = 2 * usecs_to_jiffies(ktime_to_us(pvt->timeout));
>> +	ret = wait_for_completion_timeout(&pvt->conversion, timeout);
> 
> Because pvt->timeout is 333 microseconds, will usecs_to_jiffies(333) evaluate
> to 0 on standard kernel configurations like HZ=1000?
> 
> If so, this acts as a non-blocking check and wait_for_completion_timeout()
> could instantly return 0, causing all reads to permanently fail with
> -ETIMEDOUT.
> 
> [ ... ]
>> +static int eic7700_pvt_hwmon_read(struct device *dev,
>> +				  enum hwmon_sensor_types type, u32 attr,
>> +				  int ch, long *val)
>> +{
>> +	struct pvt_hwmon *pvt = dev_get_drvdata(dev);
> 
> The driver registers the temperature sensor with the thermal subsystem via
> the HWMON_C_REGISTER_TZ flag.
> 
> If thermal zone background polling directly invokes this read callback while
> a user concurrently reads a hwmon sysfs attribute, is there a race condition?
> Does this need an internal mutex to prevent concurrent hardware state
> corruption?
> 

False positive. Polling is through the hwmon subsystem, which protects such
accesses with the hwmon subsystem lock.


The other concerns seem real. Please address.

Thanks,
Guenter

> [ ... ]
>> +static struct pvt_hwmon *eic7700_pvt_create_data(struct platform_device *pdev)
>> +{
> [ ... ]
>> +	ret = devm_add_action(dev, pvt_clear_data, pvt);
> 
> Because devres actions execute in reverse order of registration (LIFO), will
> this action run after the hwmon device is unregistered?
> 
> Since hwmon unregistration blocks until all active sysfs read operations
> finish, the reader would have already completed before pvt_clear_data runs,
> which might make it ineffective for unblocking sysfs readers.
> 
> [ ... ]
>> +static void eic7700_pvt_disable_pm_runtime(void *data)
>> +{
>> +	struct pvt_hwmon *pvt = data;
>> +
>> +	pm_runtime_dont_use_autosuspend(pvt->dev);
>> +	pm_runtime_force_suspend(pvt->dev);
>> +
>> +	if (!IS_ENABLED(CONFIG_PM))
>> +		clk_disable_unprepare(pvt->clk);
>> +}
> 
> Should this custom devres cleanup action call pm_runtime_disable()?
> 
> If the module is unloaded and then re-probed, could the unbalanced
> disable_depth cause an "Unbalanced pm_runtime_enable!" warning and corrupt
> the power management state?
> 
>> +
>> +static int eic7700_pvt_probe(struct platform_device *pdev)
>> +{
> [ ... ]
>> +	if (IS_ENABLED(CONFIG_PM))
>> +		clk_disable_unprepare(pvt->clk);
>> +
>> +	ret = eic7700_pvt_request_irq(pvt);
>> +	if (ret)
>> +		return ret;
> 
> If CONFIG_PM is disabled, the clock remains enabled. If
> eic7700_pvt_request_irq() fails here, does the function return without
> disabling the clock? This could permanently leak the clock reference because
> the devres cleanup action is not yet registered.
> 
>> +
>> +	pm_runtime_enable(&pdev->dev);
> 
> Since the IRQ is unmasked before pm_runtime_enable() is called, what happens
> if the hardware asserts an interrupt in this window?
> 
> If eic7700_pvt_hard_isr() fires, pm_runtime_get_if_active() would return
> -EINVAL and the handler would return IRQ_NONE without clearing the interrupt.
> Since the interrupt is level-triggered (IRQF_TRIGGER_HIGH), could this cause
> an infinite IRQ storm that locks up the CPU?
> 

