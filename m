Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B42A3C9EEB
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 06:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785823384; cv=none; b=LAmWXUMtJugjjaZ0QQ/FdMaKZ1C/8RcLIuWNb2iTlBsst5UyHwyXm14Z6FqWaxbsQMvIWOHnMub1afv29rl3LcKHOqn2hWrMOiVZaBmedD2p2TYFXN8YPeIvBbanGvzmEyFjsoVgSteXd8kzakzIYO6SsqPFdYMHOjvXa3zabWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785823384; c=relaxed/simple;
	bh=WzGPQZPZvSE6OgmQ2f+YB2EIUiU59wlOHVjvsMguvtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnAzO5fgwwQiVcqBJ7JLXVqeUcfyw/XlWDus7lG2lB3U3a2Hr+H3jeTzP1q0t0V7S6mBNMIcfPoDMRC4DTGvZCxxrwvFssxAwBMdpSHm6VCm2ftN++PByPcod58nUfBKU7+qP92jGQA7jZlFmQ5AGYRLRY2zRvF8m9wo59ZYbOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3NVvUF5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3NVvUF5"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cca0c5799eso36404105ad.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 23:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785823383; x=1786428183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqptnEF5UgYmd45YEaHNyWvrU1VG+w375D9PvPQlhLU=;
        b=s3NVvUF584JhtO2/HeFxA+81KUn8jNMGJBmLkzirrbrYTxYwzollkY8lY7qY2BBVkV
         va3XvSGkDdMg8qT0X9e83T3GBJ2NjTknbJ/dqHS5WdgLU2tFJOmwcEnWAB2TOhJiKriB
         RF+pl224INA1L66gzR9mDDv18U+MieEj1IJxKh3Y+VkPu//KO2cTJA4huW5l+ZU8xl9o
         BPBMfBac7wQBOUUhc6zZnclF8Z2Ia8IcefwNrt3Rhnit5CT3tnB3TBr2BiwHndewZhof
         CTwHc94/4ixs0i1C5RtdwTTPBZxtPGBOuxuuxU+dfAvinSLFj1aIeRgsLYcXRMLq9weN
         KRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785823383; x=1786428183;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqptnEF5UgYmd45YEaHNyWvrU1VG+w375D9PvPQlhLU=;
        b=b2uUx/Px2hRv1zMyJ7M3wJt6iW+4OWWp347BnkjKjoUtD1BKiorJp1D/sTq4veDnzE
         jtyzBFeMI/QwaKoXd5V5vENkxHmWQzRuisBpCrGYmrpivE6qCOm1IR3RmTdjJ0mWHd3Z
         50cSCYPPV3NMF4iIiP4MOhhqBvCnrzHsLYjH1xVdH0R1DxVaQWSVwRtXBWGBJMfq9gp3
         BVIccFLZcsP554wad2Jc4RFDfdrnw4LaX35Hn+IMzBJs7lDi9tSDMhy7LE8T383B/G/i
         u+UTsyC8WQ4QHSEJrQEbr2A2eZOUFiOiFGejRJQPKLXmVJ3v/M9SzAjDwWLFvCqdA8gR
         0zZA==
X-Forwarded-Encrypted: i=1; AHgh+RqDOh8vWcioNWG2IdfxsGJw1BKRuOC4qrSI1SVNsLDL6FgwPZUVy1h9umx6RmiZERDXFP1eGZTZmcM9@vger.kernel.org
X-Gm-Message-State: AOJu0YymiUzKSn5or2IchnQuxn5xwJZnwNE19XZK2QYkvEvUMJUQxBZm
	DyDsFaMfMLB2i4vft65ioEudq1M8D0bHLxkiI0t8Ht/PcUErTN+rgNTd
X-Gm-Gg: AR+sD10kAmi8UTP8Cl8tUY2j32orn5Z47PpRVKVyJ4A27ehNGVa8cV+NfollExydkDb
	bvhFIcIYM2IHiLWEdaHyTy7WpwGGEIJjI9P2DS/JPFut8ikTln3cbagn0SDxvAzsHwlOboHIplK
	zvPV8a3mc6JstCO3BLYtdfPdb6itb9J01B0ADMK+E/M8al1Fb46xuBk5dNd8iYBunuSlgAX7n6+
	Uc3NSPj4CCgGHSyVROJgidvEbXDueUHGZGTavf6EFgQophITbpktQ9CB0inlM6BXW1tdwIFx/eN
	7OTfBMydJ263X9a9KLrSRP3PlNbE7K3ZikjpN0yYHZZeQ5T/7Q6oH2qoDack/vFbQvQ+pVlGOzb
	q4MmxulfWco+oPCaRhvb8Oz3hLU/3UKOwL5F6BelSlDNC+pCSyjHN1Ot6+4FiI8m2NtIz7cp2Zn
	Aj3K2eMtgocHFpc1695rRrhsGPj90wFSDkYuFq3aHVafgyuUXUTTzfftSf+K/pappwNlxgJHQ0E
	2KclhqZoUYHtReI2jEkjH5slg1x1/6FQzNe
X-Received: by 2002:a17:903:185:b0:2ca:52ce:6f91 with SMTP id d9443c01a7336-2d0522983b5mr136311625ad.27.1785823382566;
        Mon, 03 Aug 2026 23:03:02 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa492c74sm98315ad.54.2026.08.03.23.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 23:03:02 -0700 (PDT)
Message-ID: <db91085b-ae1e-4cfd-8f8e-89c379684303@gmail.com>
Date: Tue, 4 Aug 2026 14:02:58 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20260727081859.1737223-1-zychennvt@gmail.com>
 <20260727081859.1737223-3-zychennvt@gmail.com>
 <ampnhe-GqNoQwmJZ@zenone.zhora.eu>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <ampnhe-GqNoQwmJZ@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Hi Andi,

Andi Shyti 於 2026/7/30 上午 05:06 寫道:
> Hi Zi-Yu,
> 
> ...
> 
>> +static void ma35d1_i2c_stop(struct ma35d1_i2c *i2c, int ret)
>> +{
>> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_STO_SI);
> 
> I think there is a valid review from sashiko here.
> 
Address sashiko's review, I will introduce a new helper to handle
bus errors and spurious interrupts based on the current state, while
keeping ma35d1_i2c_stop() unchanged and used exclusively during
active transfers.

>> +	if (ret)
>> +		i2c->err = ret;
>> +
>> +	ma35d1_i2c_controller_complete(i2c);
>> +}
> 
> ...
> 
>> +static irqreturn_t ma35d1_i2c_irq(int irqno, void *dev_id)
>> +{
>> +	struct ma35d1_i2c *i2c = dev_id;
>> +	unsigned long status;
>> +
>> +	status = readl(i2c->regs + MA35_STATUS0);
>> +
>> +	if (status == MA35_BUS_ERROR) {
>> +		dev_err(i2c->dev, "Bus error during transfer\n");
>> +		ma35d1_i2c_stop(i2c, -EIO);
>> +		goto out;
>> +	}
>> +
>> +	if (ma35d1_is_controller_status(status))
>> +		ma35d1_i2c_irq_controller_trx(i2c, status);
>> +	else
>> +		ma35d1_i2c_irq_target_trx(i2c, status);
> 
> Why are these functions void? We should at least print an error
> in case of failures.
> 
Agree.
Changed the return types of both TRX helper functions to irqreturn_t.
On unhandled/unknown status codes, will return IRQ_NONE.

>> +
>> +out:
>> +	return IRQ_HANDLED;
>> +}
> 
> ...
> 
>> +static int ma35d1_i2c_probe(struct platform_device *pdev)
>> +{
>> +	struct ma35d1_i2c *i2c;
>> +	struct resource *res;
>> +	int ret, clkdiv;
>> +	u32 val;
>> +	unsigned int busfreq;
> 
> you can immediately initialize busfreq here.
Sure.

> 
>> +	struct device *dev = &pdev->dev;
> 
> nit: can you please sort the declaration by line length, in a
> reverse christmast tree shape?
Sure.
> 
>> +	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
>> +	if (!i2c)
>> +		return -ENOMEM;
> 
> ...
> 
>> +	ret = devm_add_action_or_reset(dev, ma35d1_i2c_pm_cleanup, dev);
>> +	if (ret)
>> +		goto rpm_put;
>> +
>> +	writel(MA35_CTL_I2CEN | MA35_CTL_INTEN, i2c->regs + MA35_CTL0);
>> +	writel(FIELD_PREP(MA35_CLKDIV_MSK, clkdiv), i2c->regs + MA35_CLKDIV);
>> +
>> +	ret = devm_request_irq(dev, i2c->irq, ma35d1_i2c_irq, 0, dev_name(dev),
>> +			       i2c);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "cannot claim IRQ %d\n", i2c->irq);
>> +		goto rpm_put;
> 
> The actions in rpm_put are executed twice, considering
> devm_add_action_or_reset.
> 
Agree.
Removed the redundant rpm_put label and changed error paths to return
ret directly, leaving PM cleanup to devm_add_action_or_reset().

All these changes will be included in v8.

> Thanks,
> Andi
> 
>> +	}

Best regards,
Zi-Yu
