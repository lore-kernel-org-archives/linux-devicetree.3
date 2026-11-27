Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770159;
	b=nAs9jI7GOuRv44j8opj8nCP1keX8xuco4VPyxdF2owJrPNPCdVlOY+KCliLmBsGNEFxM
	 HqyGIG+IkW7Q0BDJ4f/VHumAHR3qvnBIJhYM53Zv6EnEqxUOlJJAtao7FsIjVCQ+IH9tf
	 esVjZYH5v6Rs4KiUjpUHRP36vq/9GqPZZEfyiLJPqJz6pDNvLt0lzY3xva+2HFhcg5Pw1
	 2tEkJ/Jc2gQm0CW2DAevLaKaULrimqE0k0D37JGQPr7FfwrI7jjWtfbMoz41eQ2nqgg1i
	 0jsdX8ntf+UdcXnRyKE4I5r8rL5GHeXyDTUPLjJe6Adp8adWm3089lMa9h3rpQ78Uqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770159;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=MddIBkgdQOFDGAQ07Ug9TP59jWzEEbHLbOPRkStxXzo=;
	b=48pVL3nnnDXXTUNyrKnpYiLoS2OhdviEiln0OY/MmcDo1e870YW0JE0sfye4+LzP58tB
	 cybkdBKgMdsQmMWg3UyTJkPWuHBTqVuBe1L0SSnOot/eOWuF1l30IaOuRVRMzUJHbJ/zZ
	 u87bYDiZqp5bLXqgzqdZSzbjy8cCtfa31KGpfaGT319EXmq3FxaHhglmdfBZdVp2DNvwQ
	 M3A1qihjy3QQnnj0Ltbtfj9O7ahm7MwHACDYHCIsvEScsq1TSHtCoJdDaRq9KFzSYW3ZS
	 xxpV79pMTFXPZZ67hnj7Ejoj6aXjzG3eLY/BJJbbhNigdjYYqoWTve4jQxK5NvEkzfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70321606A32C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70321606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.66])
	by gateway (Coremail) with SMTP id _____8DxjdIpRwlrVYIjAA--.34927S3;
	Fri, 27 Nov 2026 17:02:34 +0800 (CST)
Received: from [127.0.0.1] (unknown [223.64.69.66])
	by front1 (Coremail) with SMTP id qMiowJDxTs8lRwlrqr43AA--.44776S2;
	Fri, 27 Nov 2026 17:02:31 +0800 (CST)
Message-ID: <fc2bca05-a705-4538-9457-da18b478792e@loongson.cn>
Date: Fri, 27 Nov 2026 17:02:29 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/7] thermal/drivers/loongson2: Add Loongson-2K0300
 support
To: sashiko-reviews@lists.linux.dev, daniel.lezcano@kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 Binbin Zhou <zhoubb.aaron@gmail.com>
References: <cover.1794211535.git.zhoubinbin@loongson.cn>
 <038de1cc102684e0abad6c25cac0138f065a0311.1794211535.git.zhoubinbin@loongson.cn>
 <sashiko-outbox-204590@kernel.org>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <sashiko-outbox-204590@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxTs8lRwlrqr43AA--.44776S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEECGsI5P0GNAABsF
X-Coremail-Antispam: 1Uk129KBj93XoWxuryDurW7uF4rWF43Aw18JFc_yoW5Zr1Dpa
	y5Aay5ArWDWrWDZw1jyw48AF4qq3sIyFy3Zrs7K3yruws8A34SgFyUtFy5X34xCrW7JF1U
	Zrn0qFW7C3Z8ZrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0Urc3UUUUU==



On 2026/11/9 16:32, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] thermal/drivers/loongson2: unmasked trip IRQ in
>    ls2k0300_thermal_hw_init()
> --
> 
> commit 024ebeb46fbe6ba2893fe68297ad030cb9ce5fe2
> Author: Binbin Zhou <zhoubinbin@loongson.cn>
> 
> thermal/drivers/loongson2: Add Loongson-2K0300 support
> 
> This commit adds thermal sensor support for the Loongson-2K0300 SoC,
> reading calibration data from the CHIP ID syscon registers and falling
> back to an uncalibrated slope if the initial reading is out of range.
> 
>> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongson2_thermal.c
>> index 4ce162dfb1229..68e6105051c60 100644
>> --- a/drivers/thermal/loongson2_thermal.c
>> +++ b/drivers/thermal/loongson2_thermal.c
> [ ... ]
>> @@ -87,6 +122,107 @@ static int loongson2_thermal_set_trips(struct thermal_zone_device *tz, int low,
> [ ... ]
>> +static int ls2k0300_thermal_hw_init(struct platform_device *pdev,
>> +				    struct loongson2_thermal_data *data)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +
>> +	data->regmap_cfg = syscon_regmap_lookup_by_phandle(dev->of_node, "loongson,chipid");
>> +	if (IS_ERR(data->regmap_cfg))
>> +		return PTR_ERR(data->regmap_cfg);
>> +
>> +	ret = ls2k0300_thermal_read_calib(data);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to read calibration data");
>> +
>> +	writel(LS2K0300_THSENS_INIT_MASK, data->ctrl_reg + LS2K0300_THSENS_CFG_REG);
>> +
>> +	/*
>> +	 * Wait for the ADC to produce the first valid conversion before
>> +	 * using OUT_REG for the old-fuse sanity check.
>> +	 */
>> +	usleep_range(1000, 2000);
>> +
>> +	ls2k0300_thermal_detect_old_fuse(dev, data);
>> +
>> +	return 0;
>> +}
> [ ... ]
>> @@ -178,6 +314,10 @@ static int ls2k2000_thermal_hw_init(struct platform_device *pdev,
>>   	return 0;
>>   }
>>   
>> +static const struct thermal_zone_device_ops ls2k0300_thermal_zone_ops = {
>> +	.get_temp = ls2k0300_thermal_get_temp,
>> +};
> 
> [Severity: Medium]
> Can this cause a thermal interrupt storm on Loongson-2K0300 if trip
> interrupts were left enabled by firmware or a previous kernel across
> kexec?
> 
> Unlike ls2k1000_thermal_hw_init() and ls2k2000_thermal_hw_init(),
> ls2k0300_thermal_hw_init() does not clear LOONGSON2_THSENS_STATUS_REG or
> disable trip-point interrupts, while loongson2_thermal_probe() still
> unconditionally registers loongson2_thermal_irq_thread().  Because
> ls2k0300_thermal_zone_ops omits .set_trips, thermal_zone_device_update()
> in the IRQ handler cannot update the hardware trip window or mask the
> interrupt enable bit, so the comparator will keep re-asserting the
> level-triggered interrupt on subsequent ADC conversions.

The Loongson-2K0300 thermal sensor hardware does not have a trip-point 
comparator circuit — so .set_trips is intentionally absent, so I think 
the interrupt-storm scenario you describe cannot occur on this SoC variant.
> 

-- 
Thanks.
Binbin

