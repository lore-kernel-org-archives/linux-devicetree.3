Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7162A3B27E3
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786087093; cv=none; b=GrsQ4snY2+sCeu4yPR+mJNC01+Hoo401d7Miv/sW8s77AJX5GaRNo8y38lYs5oEUVCe7avNIiHlRcp8uvQ8/DnY7TGnltjFNOH4Jrkq6TNdNx3dagy4PKx9w2jCKxqWlHnYp87B247LYP92r91todeHeP0sIkvYSsoqAQuIbXao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786087093; c=relaxed/simple;
	bh=8rE4idcUKxQQ+px+vkwWlZkphY3J4f7ZSBLYbBU0Txg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dklv7QRzkGeO4qqnbUiwicmnbhpvlwYk9P1L+PhI94YJd+SDS5YwzlftTbgN84/Rv5GbF0SKmhrK4AG9f3a1aGmbb3GWL71A7O+fGNCmni/B+IH1bivXI4lL6tqZMXHzN3DRbHq/fr9MfCpU7Rgom1b+/KUrGv3eHpSI0MzB2ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ehY06bMd; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ehY06bMd"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca80d708489so1275060a12.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 00:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786087087; x=1786691887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWRiuEYvxeApf3WCErrX4QKIxHG44lrxaPCuF1YNriM=;
        b=ehY06bMdSz0iTloYSg9ExT9pCA9rNB3+AEbqk2W2Ki6ZoiD9Jmv1BDVr9SNEtVDj0S
         w7lckLKqlfc4GqLNmdgeJfhZxeiRtxArIUEmz8lubL65S6tat8YG54TeN0dzwkZpBH+I
         lODfsFm12QwMWjeaqAOUIf8POhh2rDzLTmih3yAA5DmqtC4uNnnKKUUHgDzGzP/pA/Bs
         lWzo0FSL2EGPaXS8UyQyyUvgeIO6CtjjHfbfBBg3LVH8JsaCMNxNrX4315Tni9FeNqfZ
         j++eXmZwTjJOuOJid7wKRkkQ0ClfBUSC9DwEa4U8vD3r6HoQKiXq4a3OUUfle7cLeVGX
         7tKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786087087; x=1786691887;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWRiuEYvxeApf3WCErrX4QKIxHG44lrxaPCuF1YNriM=;
        b=jgnaQPNSBcFFlpJzX3i8Oc+7VtaZh23pbcCKMPJca5A89tXmziM9wT4fC+OXt/EzT6
         oMMieXMsNa/Z68N6xUZ4BAQ9TViswVNC2mhlgjBtSJ10g+5siALQGI481LmbEDyMRpRC
         3XcxpbWsQ7lqCGBOKT1mvLOpkyKiXoNfqHne2WP0j3IiVLvDjVXB0Ub0AMru8PrlhbvD
         WwWF1srJdG1bFTONKcQtBiemxsLAEVC980yxYiwRlBthyjUzKIpAwkFsV0P5pMFfoPyA
         iWs9Bw1Ub4Y8gXIs5Xd/VKCplhm3oz3OXvFe3HlvZ1Emjs7XSqPV+7CGlPsmKYzMCHbM
         qEtA==
X-Forwarded-Encrypted: i=1; AHgh+RrfOWXdTQ3h75c9K6CM0XY2F1pAm9KSRX6tFsofL9QyKnM9AjuFjvPss+j6Xl15T46RU3Q6smwJAXf4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0+FNIAi++Hb3pla52QfXe5EEF55QUIzWykyuIOkP9qkgbGoyD
	oM067yGBXRvfW5hg0ppJ/ZWQOHL+VSgKW+eUeaVG4sQvmvZaJv1dvuDlMdAVcA==
X-Gm-Gg: AR+sD10yKgVSEtDux991fJjBPls9InL0wLpm+q5YITfqN1dn2w84NnCj/RMgFFbS72l
	epsYXg26vyF3+CgQJ4nTGawss+OGtNmEOag5gZqBL6XffNmECiVmhgBHUD17HnunXcUtgN5ryik
	4Ywv5hh/qPkMKaE7UKyDO4d4Tqlx7YdIKxo4LZtsSutfpKTciNYA4j+QR3+0censo2lOYY8Z2AO
	WEtvJOP1+1+CnHppb85vBdgR5fCwfE7p+coC62rrHlz/WI8JSfKIyIOPvMQbisEU0FLcZHrMecI
	eeFxynNw+zhutavajAflkt8BCtbgjIRpqcCn9ja5eS+TFt5/iyucqn/6/lFchzOKQNhD5Hbly3s
	MO+qRgt/paPMxJ0LAlynXLktNHqpb3Y3ARNE0h9KOZ6IzM0sSKjdc7q4V3Cw8FigHClpex9OU7m
	AEeXYVx+RzM85TQ3YPT85wsreb2Q/hh14GwHRtLtmcT3mB8XAWuL9lrzbPGrBv+r6tB8CVL+kcZ
	6X9M8htEKL3nIkx8iNS7YxaarJE20JpnqbX
X-Received: by 2002:a05:6a20:3d82:b0:3a3:adea:83bc with SMTP id adf61e73a8af0-3cba2aea1efmr10198445637.15.1786087087424;
        Fri, 07 Aug 2026 00:18:07 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f1988besm255803a12.3.2026.08.07.00.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:18:07 -0700 (PDT)
Message-ID: <8a1f643e-8aa1-4476-aaea-61342dd45985@gmail.com>
Date: Fri, 7 Aug 2026 15:18:04 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260807060400.2047517-1-zychennvt@gmail.com>
 <20260807060400.2047517-3-zychennvt@gmail.com>
 <20260807061851.698081F000E9@smtp.kernel.org>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <20260807061851.698081F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



sashiko-bot@kernel.org 於 2026/8/7 下午 02:18 寫道:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] Unhandled `MA35_BUS_RELEASED` status causes spurious errors and randomly aborts ongoing I2C transfers.
Not applicable.
According to the MA35D1 TRM, MA35_BUS_RELEASED (0xf8) won't raise interrupt.

> - [High] Missing NULL checks for `i2c->target` and race conditions during target unregistration lead to a NULL pointer dereference in the ISR.
Not applicable.
The target mode is disabled before synchronize_irq(), and i2c->target is cleared only after synchronize_irq() completes. Thus, any pending or
running target interrupt is handled before the pointer is cleared, and a NULL check is not required.

> - [High] Unprotected initialization of shared transfer state in `ma35d1_i2c_doxfer` races with asynchronous I2C interrupts.
Not applicable.
The target mode interrupt path does not access the controller transfer state variables. No additional locking is required.

> - [Medium] Missing `pm_runtime_mark_last_busy()` defeats the autosuspend delay, causing immediate suspension.
Not applicable.
pm_runtime_put_autosuspend() already calls pm_runtime_mark_last_busy() internally.

> - [Medium] Missing reset assertion on driver remove or probe error leaves the hardware in a dirty state.
Not applicable.
reset_control_deassert() is only used to ensure the controller is released from reset, as it may have been left asserted by the bootloader.
The controller is fully reinitialized during probe, so reasserting the reset line on driver removal is unnecessary.

> - [Medium] Unconditional `disable_irq_wake()` during resume causes a kernel warning if `enable_irq_wake()` failed.
Not applicable.
The MA35D1 I2C interrupt is a dedicated wake-capable IRQ, so enable_irq_wake() is expected to succeed on this platform.

> --
> 
> --- Patch [2]: [PATCH v9 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support ---
> commit a1da9304aab06d4fdb61f6ee5807d7913cc199b8
> Author: Zi-Yu Chen <zychennvt@gmail.com>
> Subject: i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
> 
> This commit adds I2C controller driver support for the Nuvoton MA35D1 SoC.
> The driver provides both controller and target functionality across
> standard, fast, and fast-plus modes.
> 
>> diff --git a/drivers/i2c/busses/i2c-ma35d1.c b/drivers/i2c/busses/i2c-ma35d1.c
>> new file mode 100644
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-ma35d1.c
> [ ... ]
>> +static irqreturn_t ma35d1_i2c_irq_target_trx(struct ma35d1_i2c *i2c,
>> +					     unsigned long i2c_status)
>> +{
>> +	unsigned char byte = 0;
>> +
>> +	switch (i2c_status) {
>> +	case MA35_S_RECE_ARB_LOST:
> [ ... ]
>> +	case MA35_S_RECE_ADDR_ACK:
>> +		/* Own SLA+W has been receive; ACK has been return */
>> +		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_REQUESTED, &byte);
> 
> [Severity: High]
> Can this result in a NULL pointer dereference if a target interrupt is
> pending during unregistration?
> 
> When ma35d1_unreg_target() calls synchronize_irq() and sets i2c->target
> to NULL, pending interrupts in the irqchip might still fire immediately
> after. 
> 
> If that happens, i2c_slave_event() will dereference i2c->target without
> a NULL check. Could a defensive check be added here, or could the teardown
> synchronization be adjusted?
> 
>> +		break;
> [ ... ]
>> +static irqreturn_t ma35d1_i2c_irq(int irqno, void *dev_id)
>> +{
>> +	struct ma35d1_i2c *i2c = dev_id;
>> +	unsigned long status;
>> +
>> +	status = readl(i2c->regs + MA35_STATUS0);
> 
> [Severity: High]
> Does this interrupt handler properly process the MA35_BUS_RELEASED (0xf8)
> status code?
> 
> If a spurious interrupt occurs and the status is 0xf8, this falls through
> to the default cases in the transaction handlers, which log an error and
> call ma35d1_i2c_restore_idle().
> 
> This would unconditionally abort any active controller transfers via
> ma35d1_i2c_stop(i2c, -EIO). Could this be addressed by explicitly checking
> for 0xf8 and returning IRQ_NONE early?
> 
>> +
>> +	if (status == MA35_BUS_ERROR) {
> [ ... ]
>> +static int ma35d1_i2c_doxfer(struct ma35d1_i2c *i2c, struct i2c_msg *msgs,
>> +			     int num)
>> +{
>> +	unsigned long timeout;
>> +	unsigned int val;
>> +	int ret, err;
>> +
>> +	i2c->msg = msgs;
>> +	i2c->msg_num = num;
>> +	i2c->msg_ptr = 0;
>> +	i2c->msg_idx = 0;
>> +	i2c->err = 0;
> 
> [Severity: High]
> Could this lockless initialization race with asynchronous I2C interrupts?
> 
> These transfer state variables are set in process context without holding
> i2c->lock or disabling interrupts. If a target mode event or spurious
> interrupt fires concurrently, the ISR could execute
> ma35d1_i2c_controller_complete() and clear the i2c->msg pointer.
> 
> When doxfer() then sends the START command, the controller might see a null
> message pointer and incorrectly abort the transfer. Does this section need
> lock protection?
> 
>> +
>> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_STA);
> [ ... ]
>> +static int ma35d1_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>> +			   int num)
>> +{
>> +	struct ma35d1_i2c *i2c = i2c_get_adapdata(adap);
>> +	int ret;
>> +
>> +	ret = pm_runtime_resume_and_get(i2c->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ma35d1_i2c_doxfer(i2c, msgs, num);
>> +
>> +	if (i2c->target)
>> +		ma35d1_i2c_write_ctl(i2c, MA35_CTL_AA);
>> +	pm_runtime_put_autosuspend(i2c->dev);
> 
> [Severity: Medium]
> Does this bypass the autosuspend delay?
> 
> Calling pm_runtime_put_autosuspend() without first updating the timestamp
> via pm_runtime_mark_last_busy() will cause the PM core to evaluate based
> on an outdated timestamp.
> 
> This could result in the device suspending immediately rather than waiting
> for the 5000ms delay configured in the probe function.
> 
>> +
>> +	return ret;
>> +}
> [ ... ]
>> +static int ma35d1_i2c_suspend(struct device *dev)
>> +{
>> +	struct ma35d1_i2c *i2c = dev_get_drvdata(dev);
>> +	unsigned int val;
>> +
>> +	/* Prepare for wake-up from I2C events if target mode is active */
>> +	if (i2c->target) {
>> +		ma35d1_i2c_write_ctl(i2c, MA35_CTL_AA);
>> +
>> +		/* Setup wake-up control */
>> +		writel(0x1, i2c->regs + MA35_WKCTL);
>> +
>> +		/* Clear pending wake-up flags */
>> +		val = readl(i2c->regs + MA35_WKSTS);
>> +		writel(val, i2c->regs + MA35_WKSTS);
>> +
>> +		enable_irq_wake(i2c->irq);
>> +
>> +		return 0;
>> +	}
>> +	return pm_runtime_force_suspend(dev);
>> +}
>> +
>> +static int ma35d1_i2c_resume(struct device *dev)
>> +{
>> +	struct ma35d1_i2c *i2c = dev_get_drvdata(dev);
>> +	unsigned int val;
>> +
>> +	if (i2c->target) {
>> +		/* Disable wake-up */
>> +		writel(0x0, i2c->regs + MA35_WKCTL);
>> +
>> +		/* Clear pending wake-up flags */
>> +		val = readl(i2c->regs + MA35_WKSTS);
>> +		writel(val, i2c->regs + MA35_WKSTS);
>> +
>> +		disable_irq_wake(i2c->irq);
> 
> [Severity: Medium]
> Can this cause a kernel warning if enable_irq_wake() fails during suspend?
> 
> The return value of enable_irq_wake() is ignored in ma35d1_i2c_suspend().
> If the irqchip does not support wakeup, the wake depth remains zero.
> 
> Unconditionally calling disable_irq_wake() here will then trigger an
> "Unbalanced IRQ wake disable" warning. Should the driver record whether
> enabling wake succeeded before disabling it?
> 
>> +		return 0;
>> +	}
> [ ... ]
>> +static int ma35d1_i2c_probe(struct platform_device *pdev)
>> +{
> [ ... ]
>> +	i2c->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>> +	if (IS_ERR(i2c->rst))
>> +		return dev_err_probe(dev, PTR_ERR(i2c->rst),
>> +				     "failed to get reset control\n");
>> +
>> +	ret = reset_control_deassert(i2c->rst);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to deassert reset line\n");
> 
> [Severity: Medium]
> Is a cleanup action required to assert the reset line?
> 
> The reset line is deasserted during initialization, but there appears to be
> no corresponding reset_control_assert() on the error path or driver
> unbind.
> 
> If the module is unloaded and reloaded, the hardware could remain in a
> dirty state from the previous session, potentially causing unexpected
> behavior like spurious interrupts. Could a devm action be added to handle
> re-asserting the reset line?
> 
>> +
>> +	/* Setup info block for the I2C core */
>> +	strscpy(i2c->adap.name, "ma35d1-i2c", sizeof(i2c->adap.name));
> 

Regards,
Zi-Yu Chen
