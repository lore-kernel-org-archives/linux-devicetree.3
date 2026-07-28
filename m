Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F9224DCF6
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785207520; cv=none; b=Ni1loZLMVj+eP3lDbYb9XWe1cs9IggPWJTxIzMDShz8hj9GTUvCf/tIUXVHce1/h6aCs0/lLHrroJilT5/KyI2VVHuiB6n1iNMocGmSoRAIzIyOLXgGDghj8KVqJ0xLKnFPC5cDWQR89kvhcV4VJeeaudVzlJFZ3cxhrbKl3IH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785207520; c=relaxed/simple;
	bh=n5UoZL2wb83PkAUD6T96dvq5LT7Om3pjVqKuJQ8CYKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e5TQR8Fy0EHUdLYdY5/qJBcyfYVAXWD6zqUspN3waSOFzcsJKteMp80suvqrmBx2bS/5RB5vY0mhqffkYlHvnBdTMcvLZZ1804DTxvh3PJwT4HSdVwC4UpIjd0ApYP1ShLDucI4BYJBn02E+jrcSGL5ztdwbJFwItar38yDa/ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAviTgIc; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAviTgIc"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so3426985b3a.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 19:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785207518; x=1785812318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXc32F38MmKZTmXMK9yqhLkQilQPpMqwdQShzx5K5q8=;
        b=JAviTgIc4eWsNYuggCw1uyAs4Tba/XtPTVRAZKk9zM4faUr+t9lsIXWYdBlOscJyUD
         SQhGs2BqLTDvlzIsqV8sx5VfT0Y8cG8mxCIS2AWfxyYCvRVys/7+AlMehGRdUL0t0WHL
         YTlj22OHk1/5LVRKr9RHKMIwy5Rlq46Z+wxr21TUWEiIj8htrv/AsWgUAGcgUNxxjxsw
         ngjQ8iCj2ELCORU2wPYrh5H27Dz8fbLcOH3UGbPTTUtDC7/LjL/1PKwSQc2f+7/uRF9m
         sy9S5bgWAg1ttQMOU4/8Cgz5qCU4xDFvYG6xFg0YddfJPJs2l0zTnVhFwpFZVgJSOtqX
         870A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785207518; x=1785812318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXc32F38MmKZTmXMK9yqhLkQilQPpMqwdQShzx5K5q8=;
        b=eEM+E7PVdlAjYJQnyPgqsiDJgWNqgn/oMKcUIxmL54UiXGLP9xUQJhO1On3SKTGAw5
         R/oLQT3F/yDSvZ2YvQF6x7h0Pj9aK0/aHR8rCsvSqEeJNjdZ9t0J80sF80Kk94tU7ASS
         jygmfmutEtw2Cste0cJW61YRK6LBaVPiLcpw2g/OuUVgDHUZeeN2H5jLzfdPrntf5NhE
         ihAOPFhm2WMZYO7OQdZLrO0njqs8IHqWJYskWDjI+El4laPRmTGB03CeCXB6P14ShJ39
         f13sVbM6U6p6rmewntSC8AsFO36i0h2TO5FwxoH48ATmwAPDORgybBR7Y/py4PmKteG4
         vACw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1hcVemgPuE7dzt+wxrnV8uKl814swYlr9nvCR8CCwWphwkuk6Rtza8Bni3c9Ek1SqUoVkFfwbgN7R@vger.kernel.org
X-Gm-Message-State: AOJu0YwFAJljqZU39NLuXFHQc0kw/MDummhsDZ6jlD2+eoS70wXU6yOW
	Gqmlt11tMT3voYYP58rBAa8AyV5q+0RDV3B6piQSfVNZHXTrFzIplhkOrQBsIA==
X-Gm-Gg: AR+sD137eUf7iiHQaoX6+ySBAJt690FdJmxVwUR3Wy065YZfdp2I7XYo2PtpXS4QrTV
	8qj2AJGrH/bv/JkdYQW9dzWUT3kRK0jwxqzFxeHd8eVMKH0cz1bps3YSrrM6vmsJCT4nabjUwVV
	BKnEZXU5IYM8Iar8mR05uWuTTZOhV/LvRGvXXwz1F+kSjmebjCmxC10O1irMZDXsAxN4og48DcJ
	0EfgwrxgQG6ExAf3bur4tCRmkTwSUOuObGiy5XNK0bFNPd7h1A55baxfm+HfBJ/39t1WVt46B0s
	Vo8g1vYC/tPoEyDMscSrQ6vEm8pkvP0aBF+pezD7274mu0KpL2okxltEXaa3+/f9/EUCfT3RCnw
	1MCceqRjtq3aTZpIa3nKb8NZ0W96o11PBI6KR761cHTxHHUd+CGEvYS7Y3i0HopCkYgwd03R8bW
	OCoC4heh5kAWTSrQJXOX2XGbU1THE/JJRq/qchoN3oozzvxAAYulUCnULv3hqYJ8HoxwVYiusPg
	HeOy/44kFVpZ4IQ48sjcTKuZPq3H6NSIzEY
X-Received: by 2002:a05:6a00:2d03:b0:848:2f73:8ffd with SMTP id d2e1a72fcca58-84e93378c58mr462507b3a.70.1785207518364;
        Mon, 27 Jul 2026 19:58:38 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5344e583sm3710262b3a.57.2026.07.27.19.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 19:58:37 -0700 (PDT)
Message-ID: <d117c544-1566-453d-880e-c4d903e09e23@gmail.com>
Date: Tue, 28 Jul 2026 10:58:35 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] watchdog: Add Nuvoton MA35D1 watchdog driver
 support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260724091427.1689980-1-zychennvt@gmail.com>
 <20260724091427.1689980-3-zychennvt@gmail.com>
 <20260724092454.EE24D1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <20260724092454.EE24D1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



sashiko-bot@kernel.org 於 2026/7/24 下午 05:24 寫道:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] Writes to REG_WDT_CTL are missing required hardware synchronization waits (SYNC bit), risking dropped writes and hardware state corruption.
Not applicable. SYNC only used for the change of WDTEN.

> - [High] The watchdog timer is not paused during system suspend if it was running from the bootloader but not yet opened by userspace, leading to unintended system resets.
Fixed. Added a check for watchdog_hw_running.

> - [High] Driver fails to synchronize the hardware timeout with the software configuration when inheriting a running watchdog during probe.
Fixed. Added set_timeout() before devm_watchdog_register_device().

> - [High] Read-modify-write operations on REG_WDT_CTL inadvertently clear W1C (Write-1-to-Clear) status flags, leading to lost interrupts and wakeup events.
Not applicable. As noted in the cover letter, this does not affect the W1C flags.

> - [Medium] In ma35d1_wdt_resume(), the driver writes to REG_WDT_RSTCNT before ensuring the control register changes have synchronized.
Not applicable. These two operations work independently and do not affect each other.

> - [Low] Spelling mistake in Kconfig help text.
Fixed. Corrected the spelling mistake in the Kconfig help text.

> --
> 
> --- Patch [2]: [PATCH v2 2/3] watchdog: Add Nuvoton MA35D1 watchdog driver support ---
> commit 31ed5d4971c74d4f75935b7f98c40e226cdc3521
> Author: Zi-Yu Chen <zychennvt@gmail.com>
> 
> watchdog: Add Nuvoton MA35D1 watchdog driver support
>     
> This commit adds a new watchdog driver for the Nuvoton MA35D1 SoC. It provides
> support for timeout configuration, ping, and system reset functionality via
> the standard watchdog framework.
> 
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index 08cb8612d41fe..972740fd36a69 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -720,6 +720,16 @@ config STMP3XXX_RTC_WATCHDOG
>>  	  To compile this driver as a module, choose M here: the
>>  	  module will be called stmp3xxx_rtc_wdt.
>>  
>> +config MA35D1_WDT
>> +	tristate "Nuvoton MA35D1 Watchdog Timer"
>> +	depends on ARCH_MA35 || COMPILE_TEST
>> +	select WATCHDOG_CORE
>> +	help
>> +	  Say Y here to include support for the watchdog timer
>> +	  for the Nuvoton MA35D1 series microprosser.
> 
> [Severity: Low]
> Is "microprosser" a typo here? Did you mean "microprocessor"?
> 
>> diff --git a/drivers/watchdog/ma35d1_wdt.c b/drivers/watchdog/ma35d1_wdt.c
>> new file mode 100644
>> index 0000000000000..e5247e55dfee4
>> --- /dev/null
>> +++ b/drivers/watchdog/ma35d1_wdt.c
> 
> [ ... ]
> 
>> +static int ma35d1_wdt_stop(struct watchdog_device *wdt_dev)
>> +{
>> +	struct ma35d1_wdt_dev *ma35d1_wdt = watchdog_get_drvdata(wdt_dev);
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	guard(spinlock_irqsave)(&ma35d1_wdt->lock);
>> +	val = readl_relaxed(ma35d1_wdt->wdt_base + REG_WDT_CTL);
>> +	val &= ~WDTEN;
>> +	writel_relaxed(val, ma35d1_wdt->wdt_base + REG_WDT_CTL);
> 
> [Severity: High]
> Will this read-modify-write inadvertently clear Write-1-to-Clear (W1C) flags
> like IF, WKF, or RSTF? 
> 
> Looking at ma35d1_wdt_isr(), it appears that reading a 1 and writing it back
> clears the flag. Should these W1C flags be explicitly masked out when doing
> read-modify-write operations on REG_WDT_CTL here, and similarly in other
> functions like ma35d1_wdt_set_timeout(), ma35d1_wdt_start(), and
> ma35d1_wdt_suspend()?
> 
> [ ... ]
> 
>> +static int ma35d1_wdt_set_timeout(struct watchdog_device *wdt_dev,
>> +				  unsigned int timeout)
>> +{
>> +	struct ma35d1_wdt_dev *ma35d1_wdt = watchdog_get_drvdata(wdt_dev);
>> +	unsigned long target_ticks;
>> +	unsigned int val, i;
> 
> [ ... ]
> 
>> +	guard(spinlock_irqsave)(&ma35d1_wdt->lock);
>> +	val = readl_relaxed(ma35d1_wdt->wdt_base + REG_WDT_CTL);
>> +	val &= ~TOUTSEL;
>> +	val |= FIELD_PREP(TOUTSEL, i);
>> +	writel_relaxed(val, ma35d1_wdt->wdt_base + REG_WDT_CTL);
>> +
>> +	ma35d1_wdt_ping(wdt_dev);
>> +	return 0;
>> +}
> 
> [Severity: High]
> Does this writel_relaxed() require a call to ma35d1_wdt_wait_sync() before
> proceeding? 
> 
> Without waiting for the SYNC bit, could the immediate ping command be ignored
> by the hardware or cause hardware state corruption?
> 
>> +static int ma35d1_wdt_start(struct watchdog_device *wdt_dev)
>> +{
>> +	struct ma35d1_wdt_dev *ma35d1_wdt = watchdog_get_drvdata(wdt_dev);
>> +	void __iomem *wdt_base = ma35d1_wdt->wdt_base;
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	ret = ma35d1_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	guard(spinlock_irqsave)(&ma35d1_wdt->lock);
>> +	val = readl_relaxed(wdt_base + REG_WDT_CTL);
>> +	val |= (WDTEN | RSTEN);
>> +
>> +	writel_relaxed(val, wdt_base + REG_WDT_CTL);
> 
> [Severity: High]
> Because ma35d1_wdt_set_timeout() writes to REG_WDT_CTL without waiting for
> sync, and then ma35d1_wdt_start() immediately performs another read-modify-write
> on the same register, could this back-to-back unsynchronized access cause
> dropped writes and prevent the watchdog from starting properly?
> 
> [ ... ]
> 
>> +static int ma35d1_wdt_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct ma35d1_wdt_dev *ma35d1_wdt;
> 
> [ ... ]
> 
>> +	val = readl_relaxed(ma35d1_wdt->wdt_base + REG_WDT_CTL);
>> +	if (val & RSTF) {
>> +		ma35d1_wdt->wdt_dev.bootstatus = WDIOF_CARDRESET;
>> +		writel_relaxed(val, ma35d1_wdt->wdt_base + REG_WDT_CTL);
>> +	}
> 
> [Severity: High]
> Should there be a wait for hardware synchronization after this write clears
> the RSTF bit?
> 
>> +
>> +	if (val & WDTEN)
>> +		set_bit(WDOG_HW_RUNNING, &ma35d1_wdt->wdt_dev.status);
> 
> [Severity: High]
> If the bootloader left the watchdog running with a very short timeout, could
> the system reset before the core's ping worker can keep it alive?
> 
> Should this also call ma35d1_wdt_set_timeout() to ensure the hardware's
> timeout matches the software configuration when taking over a running watchdog?
> 
> [ ... ]
> 
>> +static int ma35d1_wdt_suspend(struct device *dev)
>> +{
>> +	struct ma35d1_wdt_dev *ma35d1_wdt = dev_get_drvdata(dev);
>> +
>> +	if (watchdog_active(&ma35d1_wdt->wdt_dev)) {
> 
> [Severity: High]
> Does this need to check watchdog_hw_running() as well?
> 
> If the bootloader started the watchdog (WDOG_HW_RUNNING is set) but userspace
> hasn't opened the device yet (WDOG_ACTIVE is false), this check will skip
> pausing the hardware. Could the timer then expire and unexpectedly reset the
> system during sleep?
> 
> [ ... ]
> 
>> +static int ma35d1_wdt_resume(struct device *dev)
>> +{
>> +	struct ma35d1_wdt_dev *ma35d1_wdt = dev_get_drvdata(dev);
>> +
>> +	if (watchdog_active(&ma35d1_wdt->wdt_dev)) {
> 
> [Severity: High]
> Similar to suspend, should this also check watchdog_hw_running() to ensure
> a hardware-running watchdog is properly resumed?
> 
>> +		u32 val;
>> +		int ret;
>> +
>> +		guard(spinlock_irqsave)(&ma35d1_wdt->lock);
>> +		val = readl_relaxed(ma35d1_wdt->wdt_base + REG_WDT_CTL);
>> +
>> +		if (device_may_wakeup(dev)) {
>> +			val |= RSTEN;
>> +			val &= ~(INTEN | WKEN);
>> +		} else {
>> +			val |= (WDTEN | RSTEN);
>> +		}
>> +		writel_relaxed(val, ma35d1_wdt->wdt_base + REG_WDT_CTL);
>> +		writel_relaxed(RESET_COUNTER,
>> +			       ma35d1_wdt->wdt_base + REG_WDT_RSTCNT);
>> +		ret = ma35d1_wdt_wait_sync(ma35d1_wdt);
> 
> [Severity: Medium]
> Is it safe to issue the ping command (writing to REG_WDT_RSTCNT) before
> waiting for the control register changes to synchronize?
> 
> In ma35d1_wdt_start(), the ping happens after ma35d1_wdt_wait_sync(). Could
> doing it before sync here cause the ping to be ignored by the hardware?
> 

Regards,
Zi-Yu Chen
