Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF92E3EC811
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 21:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785877653; cv=none; b=YMQu8Y03QFcUGLvnMorDOkimkaRRC0/k2hAqmAP5vb34t5MwZsc/BYvrT+VLF03HUgWbJAxLhEojFhE7cyr1Qfgev1mn08UYerrZ6KyBPRFbXSVgtCHouVAAPQ5zpfZUz/hbf1jYk2qMPrMoTfNuLTbiJk8XdwAH9KpvZZgoOes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785877653; c=relaxed/simple;
	bh=MqyZPi/V5NJx6vV2SdV1+IfypwjkafHwDw7xnDQsGLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMEamLAOQczj5JP3UI0OF3n3pi3gasSlvYT9jMjUfAnuPy8Q0MLUpZHKv1KgH9TCe4vtCNAdkTE4k7gQnuvBv+XHFpOSsgYpwWCcR/Xu+hMD6kmeY3LMDOdlNrAYYiVtYTUoJf11rRa9PlSss4UJmYZ5AqLNEhGVdZZMe6OpbL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBOger9p; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBOger9p"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f7027ca11so147138f8f.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 14:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785877650; x=1786482450; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yOWzmUvYZeYNGqxg/uKSDiCHW1g30hB6ShJQ+fmTldE=;
        b=IBOger9pmHpgwgNKS9R2ToPEZHUkO49SC4HuCKraER8aFLqpXzecBJcSg1n4/eFWIu
         37Rx80QREvImc73Du8X3x0HCKCQXvDHyeoMmfs2tKsmvhhp7wfYZgveB7cuOS9LDmFAp
         wdbskJPJ2eVnd6r8q4Q7uAR2R2D2e5jW4sa0A9H0mIn5Q56X0JnXbqXPcWCo3GvLNxPk
         ZfySkY4furCK+w57KF+ms3m7wteWtC+kclQfdHzfF/cN1nC0MTX3OzDPEoLfrmsJoHkV
         VW5nbOAlDJqAYwhsHt3oSrFDc65A7UD2FHrOW8R+H+/ynVoCXM0kt50iOlJ/ZdiMRq6U
         vVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785877650; x=1786482450;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yOWzmUvYZeYNGqxg/uKSDiCHW1g30hB6ShJQ+fmTldE=;
        b=lqv1KS4uerM7RyHpjcpNs1VxBGurnV/5h561dSPOqLLbTTKaVJRuKhFlaJbGjWy2fv
         5wkozUjF0RidgH/AgjUyRQG9w9y85y025jdyzkMeIDUMuT160ZKlBZvVqwkSeoV3aw+z
         OlCkV+kBBtPV9sE5l1hjKvY6ZNrl9mJVz04IkxORS6vopMF5yxLAegVMuSLjyCDgmyXt
         9l80gWjjXwE4ElN1S/GZDyb1OiXp6zBbFtJpBjnn96UJIG5/cf00lqkvc57xsNNRcb8g
         UqgFF/3tC2uJMAewXyacGqk0HgqkSah8lqD6keFDMEnu9Zm5MnF94fwwqpi2xutSgTaF
         f3JQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVMNaRUeAHQoLnhBOU97EBk5T2tQaZjWrVW/RN44QQl8X/utCPoWFODn0tjnvZZ+8LRl2Dwj32aUXg@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ5gAIQ5q7+jr8988Q5YGo5+DQLXUqiZrPlL2XbJ//mDwjoqnV
	2NBXxEf9EDcv0iSG0sw7XpD2EcS9AR1zbrXnwAUYR79NJaECLIpfTqO8
X-Gm-Gg: AR+sD121oHwYhnA5Hjt5q2hKQiplhzryxmTuluH1b4K0+Xnt1eSiBfqNvYLZb9o6G4e
	PlWAprBx9lymw7QaPo/k/dpsaKxT+5iIkCtk7bnPUP6g90bp674K0CqNHz12pRki0vpPJ9eEaZn
	inRicI24Ggt3+LWaQK8erPkbcHS3HNBtktlT88CRvEZipYJUICSP2ywIp71KaQSIyygfwQEX/S1
	N3HkwDNG82lZTcVoY+bCG5MqFXAdAjI8k4UWAU4QnJmdGe0DIa5DXzoIWKYQ6sczgoayccJpq1d
	pPdoMvre4j/14Dgo0Lqt5ufjrftRPbrc2VzeM94Evwgj9nmUnX0AD8/E199nUuMY2UURflQJunZ
	LYIUgu82ai/uNEI2IcgDvQx6idU7HNNist2oXLE1JdHHV30NbmpIExfcim6JogzVpp+DoJ6dP64
	fZ2hjiRNxFuNurjIqedhSykAX5iHrkQd4rtlWsTE3PZ5ZcXO8WiQJnlmTb8vBr3rPx
X-Received: by 2002:a05:6000:1889:b0:47f:e377:8d61 with SMTP id ffacd0b85a97d-47fec50fecbmr3306220f8f.11.1785877649864;
        Tue, 04 Aug 2026 14:07:29 -0700 (PDT)
Received: from antoniarch ([78.211.212.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec23e533sm2925271f8f.28.2026.08.04.14.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 14:07:29 -0700 (PDT)
Date: Tue, 4 Aug 2026 23:05:59 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, robh@kernel.org, 
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 3/8] rtc: abx80x: properly handle shared IRQs
Message-ID: <anJQBtfXjktYm6Cw@antoniarch>
References: <20260731184831.44037-1-apokusinski01@gmail.com>
 <20260731184831.44037-4-apokusinski01@gmail.com>
 <20260731190522.C11D41F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731190522.C11D41F00AC4@smtp.kernel.org>

On Fri, Jul 31, 2026 at 07:05:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Returning IRQ_NONE without masking or clearing unhandled RTC interrupts can cause an interrupt storm on the shared IRQ line.
> --
> 
> --- Patch [3]: [PATCH v3 3/8] rtc: abx80x: properly handle shared IRQs ---
> commit e06155ed4aeb662277df57a2324e881c6d065e84
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: properly handle shared IRQs
> 
> This commit modifies the abx80x interrupt handler to only claim the IRQ and
> clear the status register if the alarm or watchdog flags are explicitly set.
> It aims to prevent claiming interrupts from other devices sharing the same
> IRQ line.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> 
> [ ... ]
> 
> > @@ -266,27 +266,34 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
> 
> [ ... ]
> 
> > -	if (status & ABX8XX_STATUS_WDT)
> > +	if (status & ABX8XX_STATUS_WDT) {
> >  		dev_alert(&client->dev, "watchdog timeout interrupt.\n");
> > +		handled = IRQ_HANDLED;
> > +	}
> >  
> > -	i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS, 0);
> > +	if (handled == IRQ_HANDLED)
> > +		i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS,
> > +					  status & ~(ABX8XX_STATUS_AF | ABX8XX_STATUS_WDT));
> >  
> > -	return IRQ_HANDLED;
> > +	return handled;
> 
> [Severity: High]
> If the RTC hardware asserts an interrupt for a reason other than AF or WDT
> (for example, a timer or century interrupt left enabled by a bootloader),
> will this cause an interrupt storm?
> 
> Because handled remains IRQ_NONE, the handler skips the i2c_smbus_write_byte_data()
> call and returns IRQ_NONE without clearing the unhandled RTC status bits.
> 
> Since the unhandled RTC interrupt is never cleared, the IRQ line will remain
> asserted. This causes the kernel to immediately re-enter the handler until
> the spurious IRQ detector steps in and completely disables the shared IRQ line.
> 
> Could we check if the status register indicates the interrupt originated
> from this RTC, clear those bits, and return IRQ_HANDLED?
Ok so it turns out that neither the current nor the newly proposed interrupt
handling is correct.

The current approach is that we write 0 to REG_STATUS so we clear
e.g. the BL flag which prevents the userspace from detecting a low
battery. Also, IRQ_HANDLED is returned unconditionally which prevents
handling a potential interrupt from another shared device.

The new approach that I've added in this v3 is not ok neither
since (as sashiko points out) any interrupt other than AF or WDT may be
enabled e.g. by the bootloader and in this case we'd get an interrupt
storm.

In v4 I'll improve the new solution with explicitly disabling the
interrupts that are not used in the probe function. That is:
* disable EX1, EX2, Timer, BL interrupts in REG_IRQ
* disable "oscillator fail" and "autocalibration fail" interrupts in REG_OSC
> 
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260731184831.44037-1-apokusinski01@gmail.com?part=3
