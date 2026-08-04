Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AEC43B6C5
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 08:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832203; cv=none; b=H/G2xRg2qjvFrmJB4JAQt2iU93+ewZYVGhWM46H6iOQ/nJI1nS+/8vzVAhfnDwHCj7CE/CcigSWnNnIfsJCdFElsfPyvQp48Iqtq/4gE4doN+Dlh3+plTgK5IIR3cS7Bani/q+N18pkpK+30mv8P/RRXNRMCTpFS3EntUyUkozM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832203; c=relaxed/simple;
	bh=8a7Bz3Wlks6VmUuy1QdCs07MrDDdazuF93jL7Wz6o6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rl39UUgSn9bxOoWqkTM5FOywv80xyDJPmCAkyWy0NyUqISCL/eNJW5AeNdWhc9/P105Xc5ySz25Dw0VcAsXqdW0Sc8K8TDJvBLuZ0TPVwcwdT662c7PUhthKfO1GMpC/+/RMM+xf2ISQ+CJ4DfUjYFYZF88p34oagZFIQUo8ZGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkECgT51; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkECgT51"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84867f07d63so4979544b3a.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 01:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785832198; x=1786436998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WegLssWBkCTfdMAfMFQf4uWctgk7OkqV1+UwWvmH+Mc=;
        b=WkECgT51v0QKJOMO0vp+rtJyr7ZiV12WK5afXiBMVQHLazv/s5ZrQVFgx48/vaOrjl
         nW5UoGcZ5SV59UfhNpH1fx1wyWCqLy1kpyPNICpFiVooYdSEChcyeoutlT9urdzyYwcN
         JxPYEMvlWJk7/KMhM/hH7FOSt5x0bSNUVBoWYv/K8x1h3DRr4mR/oEbSjq69XXKssAV7
         RLQvMG7LkqKDahLjOu0IEbISF3tDLUhQH0qKQnVn9oNkFYpZeRaZ7P4ipVwBVrnH+zn4
         EA6AyfQDo9RKDoeHKgkJrLm4M+QKle2AZdlTnLvOJRNKbLnENUyN+i0N0IKwYjoqFPOo
         ghcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785832198; x=1786436998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WegLssWBkCTfdMAfMFQf4uWctgk7OkqV1+UwWvmH+Mc=;
        b=h4ZkGU8gruE/xeXiQZu/mqp/RD8iGvcfemJM2Vs78VHN9ZLYhfmOwQM+aVpeJ0CGAd
         tzn41HRL7WoKZ0GqGcC45eg8FGtLLN7xbsfAXeRTlYYn1bXK4I1HGJis4zLBI7Em6Uwo
         x78XMBNIBPhFPnf/tRPxeRnGrguIL30bQY7E/diCTzmNGxHv0qbHoCTxVvoJwtPYHtzN
         MxwT8lLBpzrDrJ4jZf4BW407qjZrW5Z7eYzXEeM70pvOquqbsc26SvtwRUYQNA6aTO3k
         yuuwzJtLdz2gZe7w3AlrPz3j/hAwbxW68+U634vwvtQqW42LRL7wreF0rFXluudcdoKE
         YOuw==
X-Forwarded-Encrypted: i=1; AHgh+RqKvqH0Od4/BHNhDnB/7O4igiaUskoPSX1yxgj/EyItpc24PNKcWAMY5xLIIK3K7iKo3v/Zry0JwdFi@vger.kernel.org
X-Gm-Message-State: AOJu0YxF8P0r42uE6tLi6+xpv6PL23ElsizLn4EvYfLIMRYQ7CNZKJ/Q
	ynxvJkD4bVHjDAkso3y16/wg7qU7PHXPufXR/T+qhAO6a40FvpJKBlSZ
X-Gm-Gg: AR+sD12VnOOknKlH1rEhZMp4DDBzVYn+RYS1ulfLJV2m3/Nio/UfspBUVZzTiSvbZr8
	4fPoOy/qAxUf/TOP1L+zKUSKkPd89/VLtSoEF/yAaRk188QSbgvRp3aQkNbvZvHqZckifH8oLq9
	4Yng1mi9yudIFW3t1ttMhzfIPtZXAl0L99xSQRXuDrSJOXPnbkczMdCbF79f7Q/yt2zUoSJq2Gr
	b1kGPUTxRLq3Zoz2yluLeOy6oSnmmFkLNzFF5iH3PwDMq+ediXixeldUioFgCc6bA/C2j0gxTke
	ggaC/mUO/HrC/24mavlbrHowc8RRHkHN5iMLhHVZtVpG1b6jfwky4+jizEwCGUHwjBmtI1A3kxN
	Y2TuvQycJWpKZ2KXNQeytM4uhCEcQv4oKx6AqMVkx9P7CweiSSUOpjtguXJYZkweXo0ECQblq34
	tfh3YqkrLmtjmBJLL/xieAlLWujRbdIV4awDsZLGMCTWpt8zv1avmdhpXuX/2GVaH0f4SuNb9Ki
	xXTAteb30fo6X8a8lw6cGznvcQBmSJub4OzbBj34sjROTE=
X-Received: by 2002:a05:6a00:c82:b0:84a:6540:3389 with SMTP id d2e1a72fcca58-84ee47f5779mr12177054b3a.10.1785832198241;
        Tue, 04 Aug 2026 01:29:58 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe7da67sm4940625b3a.25.2026.08.04.01.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 01:29:57 -0700 (PDT)
Message-ID: <fdf0ff5e-3307-41f4-8c9c-362becf750fa@gmail.com>
Date: Tue, 4 Aug 2026 16:29:54 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] watchdog: Add Nuvoton MA35D1 watchdog driver
 support
To: sashiko-reviews@lists.linux.dev
Cc: linux-watchdog@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260804070351.1846165-1-zychennvt@gmail.com>
 <20260804070351.1846165-3-zychennvt@gmail.com>
 <20260804071552.E6BF01F000E9@smtp.kernel.org>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <20260804071552.E6BF01F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



sashiko-bot@kernel.org 於 2026/8/4 下午 03:15 寫道:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Missing wait for hardware synchronization (`SYNC` bit) after writing to `REG_WDT_CTL` leads to dropped writes and hardware races.
Not applicable.
According to the MA35D1 TRM, hardware synchronization (SYNC bit) is only required when the WDTEN (Watchdog Enable) bit status is toggled.
Other control bit updates do not require waiting for SYNC."

> - [High] Read-modify-write operations on `REG_WDT_CTL` inadvertently clear Write-1-to-Clear (W1C) status flags.
Not applicable.
INTEN and WKEN are only enabled during PM suspend when watchdog wakeup is configured. During normal runtime, INTEN and WKEN are disabled, 
so IF and WKF remain 0. Therefore, read-modify-write operations during runtime will not inadvertently clear active flags.

> - [Medium] The interrupt handler unconditionally clears all flags and returns IRQ_HANDLED without verifying the interrupt source.
Not applicable.
The WDT interrupt line is dedicated (non-shared) and strictly utilized as a wakeup source during PM suspend.
Unconditionally clearing the flags upon interrupt entry ensures the wakeup/interrupt state is properly reset when exiting sleep.

> --
> 
> --- Patch [2]: [PATCH v3 2/3] watchdog: Add Nuvoton MA35D1 watchdog driver support ---
> commit b3e6fc51e35611680a67e3e8fcf506e2ac5f75cb
> Author: Zi-Yu Chen <zychennvt@gmail.com>
> 
> watchdog: Add Nuvoton MA35D1 watchdog driver support
> 
> Add driver support for the Watchdog Timer (WDT) integrated in Nuvoton
> MA35D1 SoC. This driver provides standard watchdog functionality,
> including timeout configuration, ping, and system reset support via
> the watchdog framework.
> 
>> diff --git a/drivers/watchdog/ma35d1_wdt.c b/drivers/watchdog/ma35d1_wdt.c
>> new file mode 100644
>> index 0000000000000..119d58f338bf0
>> --- /dev/null
>> +++ b/drivers/watchdog/ma35d1_wdt.c
> 
> [ ... ]
> 
>> +static int ma35d1_wdt_set_timeout(struct watchdog_device *wdt_dev,
>> +				  unsigned int timeout)
>> +{
> 
> [ ... ]
> 
>> +	guard(spinlock_irqsave)(&ma35d1_wdt->lock);
>> +	val = readl_relaxed(ma35d1_wdt->wdt_base + REG_WDT_CTL);
>> +	val &= ~TOUTSEL;
>> +	val |= FIELD_PREP(TOUTSEL, i);
>> +	writel_relaxed(val, ma35d1_wdt->wdt_base + REG_WDT_CTL);
> 
> [Severity: High]
> Does this read-modify-write of REG_WDT_CTL inadvertently clear W1C flags?
> 
> If bits like IF, WKF, and RSTF are write-1-to-clear, writing back a value
> that has them set will unintentionally clear pending interrupts, wakeups, or
> reset status. Should these W1C bits be masked out from val before it is
> written back?
> 
> Also, should there be a call to ma35d1_wdt_wait_sync() here?
> 
> When ma35d1_wdt_start() calls this function, it modifies REG_WDT_CTL, returns,
> and then immediately modifies REG_WDT_CTL again. Could this second write
> overlap with the clock domain synchronization of the first write and cause
> hardware races?
> 
>> +
>> +	ma35d1_wdt_ping(wdt_dev);
>> +	return 0;
>> +}
>> +
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
> This read-modify-write shares the same potential W1C flag clearing issue
> mentioned in ma35d1_wdt_set_timeout().
> 
>> +	ret = ma35d1_wdt_wait_sync(ma35d1_wdt);
>> +	if (ret) {
>> +		dev_err(wdt_dev->parent, "Wait for WDTEN SYNC timeout!\n");
>> +		return ret;
>> +	}
>> +
>> +	writel_relaxed(RESET_COUNTER, wdt_base + REG_WDT_RSTCNT);
>> +
>> +	return 0;
>> +}
> 
> [ ... ]
> 
>> +static irqreturn_t ma35d1_wdt_isr(int irq, void *dev_id)
>> +{
>> +	struct ma35d1_wdt_dev *ma35d1_wdt = dev_id;
>> +	unsigned int val;
>> +
>> +	/* Clear the flag if set */
>> +	guard(spinlock)(&ma35d1_wdt->lock);
>> +	val = readl_relaxed(ma35d1_wdt->wdt_base + REG_WDT_CTL);
>> +	writel_relaxed(val, ma35d1_wdt->wdt_base + REG_WDT_CTL);
>> +
>> +	return IRQ_HANDLED;
>> +}
> 
> [Severity: Medium]
> Does this interrupt handler need to verify the interrupt source before
> returning IRQ_HANDLED?
> 
> As written, this unconditionally claims the interrupt, which bypasses the
> kernel's spurious interrupt detection if the interrupt was actually
> generated by another device sharing the line.
> 
> Additionally, would writing back the unmodified value of REG_WDT_CTL clear
> all W1C flags at once, including RSTF, which might destroy status
> information needed elsewhere?
> 
> [ ... ]
> 
>> +static int ma35d1_wdt_probe(struct platform_device *pdev)
>> +{
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
> Does this write to clear RSTF also require a call to ma35d1_wdt_wait_sync()?
> 
> The code proceeds to call ma35d1_wdt_set_timeout() shortly after this, which
> will write to REG_WDT_CTL again. Could this lead to dropped writes or hardware
> races if the synchronization from this first write isn't complete?
> 
>> +
>> +	if (val & WDTEN)
>> +		set_bit(WDOG_HW_RUNNING, &ma35d1_wdt->wdt_dev.status);
>> +
>> +	watchdog_set_drvdata(&ma35d1_wdt->wdt_dev, ma35d1_wdt);
>> +	watchdog_set_nowayout(&ma35d1_wdt->wdt_dev, nowayout);
>> +	watchdog_init_timeout(&ma35d1_wdt->wdt_dev, timeout, &pdev->dev);
>> +
>> +	ma35d1_wdt_set_timeout(&ma35d1_wdt->wdt_dev,
>> +			       ma35d1_wdt->wdt_dev.timeout);
> 
> [ ... ]
> 
>> +static int ma35d1_wdt_suspend(struct device *dev)
>> +{
>> +	struct ma35d1_wdt_dev *ma35d1_wdt = dev_get_drvdata(dev);
>> +
>> +	if (watchdog_active(&ma35d1_wdt->wdt_dev) ||
>> +	    watchdog_hw_running(&ma35d1_wdt->wdt_dev)) {
>> +		u32 val;
>> +		int ret;
>> +
>> +		guard(spinlock_irqsave)(&ma35d1_wdt->lock);
>> +		val = readl_relaxed(ma35d1_wdt->wdt_base + REG_WDT_CTL);
>> +
>> +		if (device_may_wakeup(dev)) {
>> +			val &= ~RSTEN;
>> +			val |= (INTEN | WKEN);
>> +		} else {
>> +			val &= ~(WDTEN | RSTEN);
>> +		}
>> +		writel_relaxed(val, ma35d1_wdt->wdt_base + REG_WDT_CTL);
> 
> [Severity: High]
> This read-modify-write shares the same potential W1C flag clearing issue.
> 
> If a pending wakeup flag is set during the read, could it be inadvertently
> cleared right before the system sleeps?
> 
>> +		ret = ma35d1_wdt_wait_sync(ma35d1_wdt);
>> +		if (ret) {
>> +			dev_err(dev, "Wait for WDTEN SYNC timeout!\n");
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
> 

Regards,
Zi-Yu Chen
