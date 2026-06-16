Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7769444D686
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625329; cv=none; b=e2EBK0epCRrNoW+fmBU8mA0Eq8U0VZfcq8aKjxMdrEjY/M2wELM3KZeh4NnlNI9SF7xsvgoWQCsbDJ/tZzic1XVN/cZr/zZ71RhLbhf9bGdiQsQ41WqSjaK0hYqzGdAKGiN51irEIlnjU6MWNaPOrRH65mJs5lcYwvumV7yqyy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625329; c=relaxed/simple;
	bh=bEH96bnIltoEa0z4iZyqds3YfSC1kw1kx0wLvQAGKTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=un2shFJdzmFr/LNoDMb+Rxfd6Zhw7Nsi5laYapSIqvzX/bOHK65jAhVVsP0eSWHyyeu1r5QLMBLPW9u9NXm666oQZAk/756R29G8WGl68xz8Pg603QgMXv7VMMwrTlZI01eTY2QYQckAPHNUxMS7LXyqE2QUBGd9TjFic4Pwl84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpbU409b; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpbU409b"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36da8439078so4087949a91.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781625328; x=1782230128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=AsR19V/9UOzKY0KYtJv6IFN6IvbD4jUVTeC5l3UI9uA=;
        b=GpbU409boDiPjYCu5KuQ4pRLExZCfs3N457SIb98Usf8IjpwmoXer9Ysxn2wvWX1zL
         UIxv2FZALSzGeQv6NI6CfB1ORk4eud3uVzFIYXpicfNfk5L3/VzkHzfWV+TYpjHxnp9R
         Wtwo0RaeZXsbwiXvb1i+fFQrBLlaXCirjGUzJhvngz/OXtVYNTwbl5rDlv6l1xzofKJx
         jaqzNa7K1j22Z1uK+2zPVD/HyMAujwEYAxCqh3ZePZuhmcpeQfSGHg5Rq7SqknJQnZWq
         2YCuPW2XZBV2MGlfqIc09jm1NAPejBwZwQmXSxHLJnq/CpCPcToG31zKp1Jv8jFI1lPQ
         DzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781625328; x=1782230128;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsR19V/9UOzKY0KYtJv6IFN6IvbD4jUVTeC5l3UI9uA=;
        b=fFUn4rc8BysAqgKshd9+Tin0w0L8SaI5wjRYQqQPpH9Sg6asZw46kdc7IAfZ35qcLC
         ncu7+uq+lGhHBRyZwIGnfgZh0hMLCow8EBDUshUPecsrXkBgG3CQ2wGKBYeWtPY8uNdg
         3dsC3nSSYCr7lBil+3nczIzIYjaVXskpMkJRKMtOfj7BxVk5EntG/pZJ/9PWQlXqB5BM
         9Uc332lLKqdLrTRR2HkpV0XaWyxeaVyKsZlxDzEBpvaStyiq0AHCQUnS/b9/hFeqbQua
         +sc2NMGHWeLTPeaZZG+aHi4YYNxlmKKPzQmEh9XVCXJK4uUTJzRLCbAz4mwCJqhKzsN1
         7CSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Skwv0qz2lx5nu7HDtRbhWZCwrOKak3mZNOwlHsMCJ6k7ubdaaQFzMR/ApqpJzcxnlAGfHTBOYOQzb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1iZ6/7ewoDOstV5GPTBxMzBZxrQ91N6AG9un7LlV1Sj8VNIAX
	nV7ivoAYpd1WIexxFSrNkx+DEKmARWv1CMadb6qVy0CrORed59XnFSM66q/u4iA/
X-Gm-Gg: Acq92OEhtuJV6LcZpuAgDJv6jmeAYszbyUgP710LmvorJcEQpwTBsTVf9HgWxTH1GwZ
	YSn6Ku9laF9nNYEgq2AUwZVtLrqCH0RffSY4MV03HgW0svNgORZ8ZqWqAhRikksZDFmARfNjvK/
	HWsy/8ZcRQ3zr+R3s9RJFjDdXNEK9/kK6wKvcz1iKoTzB2OPXwUxausGZ2gFjtAVhyb1PB6rry0
	QEIKRBhCT02KVLEnU2RwjnCN7wj17MN7HsRIUq886YTNRh1y8nL+52ey/NvTYWKnwWkNlc5gpbO
	5bmMREpFsrfuqXX3V/hAxVq6sD87t8rZ3hzSJyosEddFHYdN2+I2LDqQI8iQMspbAXP7VCnhxaX
	uK+xPuwco7NmZ1BzkYeRiYkuQmrX2ok2S8NFFECqfWrefGUzmrdME6o6rHu16W38wJZ3JBZHaXJ
	JdxvtAd+oRL3eV7/9N2J35DS+nGYfioYa132WV09VPnj/HLbQ/JifS4xxWL3K3LRxtYKBUUO5S
X-Received: by 2002:a17:902:ced0:b0:2c0:d097:51bb with SMTP id d9443c01a7336-2c69a0de0b3mr44847805ad.1.1781625327711;
        Tue, 16 Jun 2026 08:55:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4330782b2sm147646405ad.67.2026.06.16.08.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 08:55:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2d1ae3b5-bc52-4043-9090-a78f30390024@roeck-us.net>
Date: Tue, 16 Jun 2026 08:55:26 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
To: sashiko-reviews@lists.linux.dev, hehuan1@eswincomputing.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 conor+dt@kernel.org
References: <20260611090639.777-1-hehuan1@eswincomputing.com>
 <20260611091748.A6EAC1F00898@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260611091748.A6EAC1F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/26 02:17, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The IRQ is requested before the PM runtime cleanup action is registered, leading to a possible use-after-disable of the hardware clock in the ISR on driver removal.
> - [Medium] The interrupt handler `eic7700_pvt_hard_isr` does not check the hardware interrupt status bit to verify if the device actually generated the interrupt.
> --
> 
> commit 0f4c8aefb83780ee09652639eb2843f01c2baf38
> Author: Huan He <hehuan1@eswincomputing.com>
> 
> hwmon: Add Eswin EIC7700 PVT sensor driver
> 
> Add support for ESWIN EIC7700 Voltage and Temperature sensor. The driver
> supports temperature and voltage monitoring with polynomial conversion,
> and provides sysfs interface for sensor data access.
> 
>> diff --git a/drivers/hwmon/eic7700-pvt.c b/drivers/hwmon/eic7700-pvt.c
>> new file mode 100644
>> index 0000000000000..3b3aed74c3941
>> --- /dev/null
>> +++ b/drivers/hwmon/eic7700-pvt.c
> 
> [ ... ]
> 
>> +static irqreturn_t eic7700_pvt_hard_isr(int irq, void *data)
>> +{
>> +	struct pvt_hwmon *pvt = data;
>> +	int active;
>> +	u32 val;
>> +
>> +	if (IS_ENABLED(CONFIG_PM)) {
>> +		active = pm_runtime_get_if_active(pvt->dev);
>> +		if (active <= 0)
>> +			return IRQ_NONE;
>> +	}
>> +
>> +	eic7700_pvt_update(pvt->regs + PVT_INT, PVT_INT_CLR, PVT_INT_CLR);
>> +	/*
>> +	 * Read the data, update the cache and notify a waiter of this event.
>> +	 */
>> +	val = readl(pvt->regs + PVT_DATA);
>> +	WRITE_ONCE(pvt->data_cache, FIELD_GET(PVT_DATA_OUT, val));
>> +	complete(&pvt->conversion);
> 
> [Severity: Medium]
> Does this unconditionally process the interrupt without checking if the device
> actually generated it?
> 
> If a spurious interrupt occurs, the ISR will prematurely clear the interrupt,
> read whatever stale value is in PVT_DATA, and call complete(&pvt->conversion).
> This will cause the waiting thread in eic7700_pvt_read_data() to wake up early
> and return stale or garbage data to userspace.
> 
> Should the ISR read the status register and return IRQ_NONE if its device did
> not assert the interrupt?
> 
> [ ... ]
> 
>> +	ret = eic7700_pvt_request_irq(pvt);
>> +	if (ret) {
>> +		if (!IS_ENABLED(CONFIG_PM))
>> +			clk_disable_unprepare(pvt->clk);
>> +		return ret;
>> +	}
>> +
>> +	pm_runtime_enable(&pdev->dev);
>> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 3000);
>> +	pm_runtime_use_autosuspend(&pdev->dev);
>> +	pm_runtime_get_noresume(&pdev->dev);
>> +
>> +	ret = devm_add_action_or_reset(pvt->dev, eic7700_pvt_disable_pm_runtime,
>> +				       pvt);
> 
> [Severity: High]
> Can this devres setup lead to accessing unclocked registers during device
> removal?
> 
> Because devres executes teardown callbacks in reverse order of their
> registration, eic7700_pvt_disable_pm_runtime() will run before the IRQ
> is freed by devm_request_threaded_irq()'s teardown.
> 
> During removal, eic7700_pvt_disable_pm_runtime() disables the clock:
> 
> eic7700_pvt_disable_pm_runtime() {
>      ...
>      if (!pm_runtime_status_suspended(pvt->dev)) {
>          clk_disable_unprepare(pvt->clk);
>          pm_runtime_set_suspended(pvt->dev);
>      }
> }
> 
> If an interrupt fires concurrently and the ISR executes past the
> pm_runtime_get_if_active() check before the clock is disabled, the ISR
> will attempt to access hardware registers while unclocked, which can lead
> to an external abort or kernel panic:
> 
> eic7700_pvt_hard_isr() {
>      ...
>      eic7700_pvt_update(pvt->regs + PVT_INT, ...);
> }
> 
> Should the PM runtime cleanup action be registered before the IRQ is requested?
> 

If not solved, these questions will at least have to be answered.

Thanks,
Guenter

>> +	if (ret) {
>> +		pm_runtime_put_noidle(&pdev->dev);
>> +		return dev_err_probe(&pdev->dev, ret,
>> +				     "Can't register PM cleanup\n");
>> +	}
> 

