Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62673CAE80
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476565; cv=none; b=fLQA2cX3MYj6qQfclfyKJHSwjM0lrsYGJ6jh7QyTPzNoUupUNvRTgQtk+mGmJH2DRVGKmRltDpQ1PFC4ZhTK0E3S7pfCZmrx1OSsG7TgwOJyJqGfHyzg6UjZSa720nD8JSALuqCifyhBHr3PLe8VvIIdSpOiMSAfaryNszkusso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476565; c=relaxed/simple;
	bh=oP8ZBzl+K7e7S5kXo+GJljW1HAPBrtpilh/wSXvwTUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6zSRvX6/0mzBSaZ2RqbytvBV6Q83wiVVslfIS/k8N6GDkiaw5S/95JynPyMRqtPDMXMAi6l00sP7ZEarnFGZepC+z/OVYFOIUHPMMuw5pJQefLLXYKZTAMbSIYwSCzYGl0h69QU2zc8l6EJSQ8Z+LroTK3xtPAXjn1ajubyuFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=NJ1Op+kR; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="NJ1Op+kR"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109fafddso263478285a.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789476563; x=1790081363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/MVO12tLI/QkQzG/oUBp0JuONjh3E/nA2a8Kxx1dMI=;
        b=NJ1Op+kRFUhVgJ1fM07jMYtkhKyRkx+M1ZmzEaLiujpAM6Hp2grPsaZoneW/nJdMXL
         UkdKeLoxCrrF1MCqsI2nSyOGAd4udvQko4wbeCqyh16BUjG4mzhfYoIDDIUF+uJ0dY9t
         NXdlui9hnnCqa1pu+myisGKXacT3v/WHt2aXM7TrYBvzRgjDlZE8ll76CRhh/Ax40tYY
         tAxdrrSnSibqK8WncR83ehEGYg6zQUT8J+xRX5q8ucvZkUqZOoNI1dSIz4n4pk3gO32/
         2tRJ+de8NXUaUURVeP/cZwf3zjev+jtHNPJubH4ADVptR8Uqj51aSDSKm8nxlUP1c/cI
         G+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476563; x=1790081363;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/MVO12tLI/QkQzG/oUBp0JuONjh3E/nA2a8Kxx1dMI=;
        b=2hCTlWTJP8vPC7gWAs2h4w91JtcClU21AA1E9vlmbrlOrmIniDUlun4gilzUyYY3eG
         ef0+D2b/zIPRlgYbciZkVlWK/Iswihfg0irfNEU2lnnyIl784OnmhFmo5hib1k73jwIj
         F0CVQthP2r3HDqEMvgTS90DaAHMnPBVjTrIg19JIj0GC+KE3+MtCMBbXDFXj1o7ouvs2
         7dZ8GZEe6RYIIhEzEbqp1RjlD9zskIXBtCoaeoiU5OF6v+rTloQct5RAEUGIcaXeCIo6
         sCwvh29cb+/zr4hfO3SgXxn8MS++7/o0x+iCryMRESCGyeDwpBx+5sWKgpFsLyM8tidX
         BHbA==
X-Forwarded-Encrypted: i=1; AKwUvBzsZEj62DpgOyjAtoEN8cK6nJNMXGCpSeHqXV+2GNArbHIIOICTwneTUIu1UJAv1VbDMt/voMpCckzX@vger.kernel.org
X-Gm-Message-State: AFuF++m8B+GKGqYDomyF1Yj/eAVzpZzDWZk3P19D0QQtNW0gI90+irX0
	yUERoMjtXGKNOQRxcpPFkl/TN9h0edH+66mqHY3h+5vrZMnyBFM3eX6PeI49lnTD2MU17Ko4+Pk
	C36FXOmo=
X-Gm-Gg: AYBFou34ghiI6vRbpKh4jfqVdFbQft0nQG62yszAIDGkiwV0E8fFyDE/gIcy59TW3Hu
	7+MzpPdLjp3HScuM6IpU/dfgBWTEdZ0HaGIwdk1gSQbQHaQXykG9QqWFXYUGetMbr19K3uD5CY8
	j/1/uM8lAYvJ1zP6GWucFlFaQ+rm8fPjhcu8LYfcrZcB/fxASTtBYuSVsXsqALDdGkNuPtovAva
	iv7MPgFygDQsmBj6lWayzI8LFoZ1inv45rT+qcJjMnHko72swLvr42T/cr89ItWa6mWSuumeEdq
	/V6OaN4cGHnDJ4HPGtrdpOHbmBRzwE0ptnFAKNzWQ1vCFZ0nEGFu70KIotg2RpTqRDQtFpyyU+j
	6vY3cpJVgNdMoY9PiJBQqy069/lwHmMJ4YFWiNB3T202vQ2VuVoOgMydsVsF/xTwq9CV8bxPf2L
	KpqFh/Sbh5dyjGYdb9UZmBJ9mo1Srh1akguFe9c13NIvP4s6o5ksFADmOMEprZqn4ank3ovv4=
X-Received: by 2002:a05:620a:1a29:b0:939:6ec8:6928 with SMTP id af79cd13be357-93a2985d5c8mr1045812685a.16.1789476562792;
        Tue, 15 Sep 2026 05:49:22 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a382ab7b3sm169560185a.19.2026.09.15.05.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:49:22 -0700 (PDT)
Message-ID: <7b85bdf3-d3d3-4e06-964a-3e5e969691da@riscstar.com>
Date: Tue, 15 Sep 2026 07:49:21 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: tc9564: introduce base PCI driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260915031038.1087264-1-elder@riscstar.com>
 <20260915031038.1087264-3-elder@riscstar.com>
 <20260915032059.60CC61F000FF@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260915032059.60CC61F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 10:20 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] misc: missing of_platform_depopulate() on probe error path
> - [Low] kconfig: unused REGMAP_MMIO selection in TC9564_PCI
> --
> 
> commit 526cbf40d582cb34a1f4613745e5ca7890f929d2
> Author: Alex Elder <elder@riscstar.com>
> 
> misc: tc9564: introduce base PCI driver
> 
> This commit introduces a base PCI driver for the Toshiba TC9564 SoC, which
> implements a PCIe switch and Ethernet AVB/TSN bridge. It performs basic PCI
> initialization and uses of_platform_default_populate() to scan and probe
> child devices defined in the devicetree.
> 
>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>> index 7364931dad3a1..91950d2928f07 100644
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
>> @@ -568,6 +568,16 @@ config MCHP_LAN966X_PCI
>>   	    - lan966x-miim (MDIO_MSCC_MIIM)
>>   	    - lan966x-switch (LAN966X_SWITCH)
>>   
>> +config TC9564_PCI
>> +	tristate "Toshiba TC9564 PCI function support"
>> +	depends on PCI
>> +	select REGMAP_MMIO
> 
> [Severity: Low]
> Is the REGMAP_MMIO selection required for this driver?
> 
> Looking at drivers/misc/tc9564-pci.c, it does not seem to include
> linux/regmap.h or use any regmap APIs. Could this lead to unnecessary
> kernel bloat if the regmap infrastructure isn't selected by other
> configurations?

This was an oversight when making the conversion to the endpoint
bus.  This driver no longer uses regmap, so that dependency will
be removed when version 3 is posted.

> 
> [ ... ]
>> diff --git a/drivers/misc/tc9564-pci.c b/drivers/misc/tc9564-pci.c
>> new file mode 100644
>> index 0000000000000..d7ebbd90d1584
>> --- /dev/null
>> +++ b/drivers/misc/tc9564-pci.c
> [ ... ]
>> +static int
>> +tc9564_function_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>> +{
> [ ... ]
>> +	/* Scan for pci-ep-bus nodes and probe their sub-devices */
>> +	ret = of_platform_default_populate(np, NULL, dev);
>> +	if (ret)
>> +		goto err_clear_master;
>> +
>> +	return 0;
>> +
>> +err_clear_master:
>> +	pci_clear_master(pdev);
>> +
>> +	return dev_err_probe(dev, ret, "failed to populate platform bus\n");
>> +}
> 
> [Severity: High]
> Does this error path need to call of_platform_depopulate() before returning?

It looks like it does.  I now recognize that of_platform_populate()
(called by of_platform_default_populate()) does not unwind and clean
up its mess in the event of an error, so doing that is the caller's
responsibility.

I will fix this in version 3.

					-Alex

> 
> When of_platform_default_populate() fails midway, it leaves any successfully
> created child platform devices registered and sets the OF_POPULATED_BUS flag.
> If we only call pci_clear_master() and return an error here, devres will
> subsequently disable the PCI device completely via pcim_disable_device().
> 
> Since the orphaned child devices remain bound to their drivers, any later
> attempt by those drivers to perform MMIO accesses on the disabled PCI
> device could result in PCIe Unsupported Requests (UR), which can trigger a
> fatal SError/MCE on many architectures.
> 

