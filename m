Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E9D4C4F4E
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 18:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789497744; cv=none; b=ggQzKCBqvdX2NeyySq4TdahFs5hZVLCzh+RD429C46syJhGyNkUBArzKTt/O1jEOjl9F2Q+SGkypdDo49MmePc835j6yBmO2VB381eYQd9h1BrHJcpwNMYB1rBdHZ965a8dhR9kJ2C1ldjwD7Xl8tpauU1fcnzvtStWfhMacQP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789497744; c=relaxed/simple;
	bh=CnLgCa/Xd5S3wMdf/P9+9GT4r29J78Vb6SjfqEB8nTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJroWZcqwJ78dSs4mk08NpfrTUEfbK43zeGdh3Y/2gx5mZcZxhsv7opcC/wNhBcxPoo1Fs7GnDj6Bvn9bbzOadI+QlwnBeNAFwuSynzEI/xIC+CZK4ZIyNCIXhM00f3t/Rhb6gUJEXPSPZnVGZlf9Sa0vqePf0OAoAwPyLegwm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=dLI2BKeU; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="dLI2BKeU"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6e3so995296d6.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 11:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789497741; x=1790102541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EDC4r0VHOK5n3tc4+Odi0PfXGfsyQf0AidjB47fhMwU=;
        b=dLI2BKeUr+zOKdFTIYxUVfpsFlhfiHkqSTL+vVpeIUasZWeBrKKqAf6JbPrQ+8P5sM
         1Ure5nn1lIpC7nhfqjSwgGBtU5NdxC+LUz2rxi63c8V2UNtKreHhui+RyBipUBZRQVPu
         QCI6HVon5gXYUqY01kkK+6NNFvUBCCpcSRsqsKNqhTrzh2OyxVTyTuRBauOnycamLsCG
         hABkJYtrNsfqB+uTAzXsb5bARARCPv7YVNR70RTqNHuYRQMc/99smPy+KSRJXgmT1/nS
         kBPhjNKZ7zdpMUtOgxjQvpYv7HuqaTfGvMBp0uRiVRJMWaIPklBBd+UtCScg1HsjbpHc
         a+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789497741; x=1790102541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EDC4r0VHOK5n3tc4+Odi0PfXGfsyQf0AidjB47fhMwU=;
        b=kBDgKTnR3fEXA8YCrEGluNZtCpPFj72SKbhRO7qNiMhvbAZD9XREHsGjTikkTljedL
         Wt0HbZ6oy4u2xsoH/urdFWa/KWnH6jIDhJpw+Hkbbm1bn0VbFMuRUBlagyi1Ab2vtj1N
         4AoCBY8ZmePG8pLNPwhimTzXUkVjWOPhN5mr/z+BwGjezYOz4rnU9cnRqNJ62cB0YfaC
         WXWxzXZbgw4MckYIH1GUrmSWb05bqpjnyTgMZ6mHKMCgAwBSDzGhc4rajdcgWRZr/0rN
         1DgSoEYcV43Pi7EKieVJ65I5YoKn1UuA1iRle2aHxrQU/jskSMvlqkSjrgJNW/W9yrN2
         8E/A==
X-Forwarded-Encrypted: i=1; AKwUvByjY+bZDJKxxLGuQ3xSPzxh9QSoj0tp+LJqAqOS2wV2JXOUHCo19za60qvKRgrtAB4WAPan9CG4OrG+@vger.kernel.org
X-Gm-Message-State: AFuF++k61BiT0VkaiOLMX3VxteOJHTSz/2hrhsuI3sEoAxPB/MzHQ0ww
	dOpT5j+RDzzcMkluFj96g3lelyzn/mEAyXwvW/WEHyUV9tnjmm9oEC612IlA0ejhKWw2hdHYpSU
	+4plVY/A=
X-Gm-Gg: AYBFou2BCp1qZhqBl95kiS/dSI5miw2Ycl3r3lIy2gD0bht5GM7baYohhYkUD9LY9/o
	iVqWJb/qOyPnRzvmHn7+TV6v108Tj0VYep3CGo9lZB1QrmpFDN2Ywk4vDe+h88Fa2YzoA7GA8+W
	2EJNsVZSwVdf0aLh75GzT0GAu4x9rLyM9K59ZbZBMreWtIr9BHlxifWmZfFXFdkYTGi0R46E5Fx
	+vjQOKJ7QLfBBuQfxKJC/kyK1egi6b0+ShpybFkROo9jUBJ/4frIDR1OS9so4hbkippWLEW4PYn
	pRoV0mUpcGEbIqichn1TcRpTWcRYc3CmTc/oWWbzUYgKPzalZZtMzcAGzUmHNLzXR0J+YZqNRQd
	Zv5iSNiUqf6hVZabUjtEQBcWYabgFF3bshLQnGPaHsjBpW4HiF00VkWlKXoNsBvB4eB/3SGmBaC
	HvyuXLorcxuZPCK5RHzlyOm0/5hcToQpcMOBZd55avNN3/RdWXCtGWIqQYqKNSHdPoCIVj05M=
X-Received: by 2002:a05:6214:29ca:b0:912:1a8a:31cf with SMTP id 6a1803df08f44-9122e55ceb9mr136951946d6.22.1789497740684;
        Tue, 15 Sep 2026 11:42:20 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be7c43bsm5457256d6.23.2026.09.15.11.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 11:42:20 -0700 (PDT)
Message-ID: <54d53803-507d-42a5-a680-36cc0f0f062d@riscstar.com>
Date: Tue, 15 Sep 2026 13:42:19 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] misc: tc9564: introduce base PCI driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20260915181003.1633543-1-elder@riscstar.com>
 <20260915181003.1633543-3-elder@riscstar.com>
 <20260915182227.A53281F000FF@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260915182227.A53281F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 1:22 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] tc9564: missing Kconfig dependencies on OF and PCI_DYNAMIC_OF_NODES
> --
> 
> commit e821d4f3b3a6f26cf2df684fa3788ceb3794a058
> Author: Alex Elder <elder@riscstar.com>
> Subject: misc: tc9564: introduce base PCI driver
> 
> This commit introduces a base PCI driver for the Toshiba TC9564 SoC. It binds
> with embedded PCIe endpoint functions within the chip to perform basic PCI
> initialization. The driver then uses Open Firmware APIs to populate and probe
> endpoint bus children.
> 
>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
>> @@ -568,6 +568,15 @@ config MCHP_LAN966X_PCI
>>   	    - lan966x-miim (MDIO_MSCC_MIIM)
>>   	    - lan966x-switch (LAN966X_SWITCH)
>>   
>> +config TC9564_PCI
>> +	tristate "Toshiba TC9564 PCI function support"
>> +	depends on PCI
> 
> [Severity: Medium]
> Should this configuration also depend on OF and PCI_DYNAMIC_OF_NODES?

I thought about this but intentionally omitted it, because
*this* driver doesn't depend on PCI_DYNAMIC_OF_NODES (at
least, not at compile time).
> Because the driver relies entirely on Open Firmware to function, compiling
> it without CONFIG_OF or CONFIG_PCI_DYNAMIC_OF_NODES will result in a
> successful build but an unconditional runtime probe failure.

I don't mind adding the dependency.  Even if not having
it is technically OK, for the driver to actually function
as desired those things must be defined.

If anyone feels strongly that adding "depends on OF" and
"depends on PCI_DYNAMIC_OF_NODES" to the TC9564_PCI Kconfig
option should *not* be there, please say so.

I'm not going to post a new version of this series for
at least a few days, but without objection I'll add
these changes when I do.

					-Alex

> [ ... ]
> 
>> diff --git a/drivers/misc/tc9564-pci.c b/drivers/misc/tc9564-pci.c
>> --- /dev/null
>> +++ b/drivers/misc/tc9564-pci.c
>> @@ -0,0 +1,84 @@
> [ ... ]
>> +static int
>> +tc9564_function_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *np;
>> +	int ret;
>> +
>> +	/* Despite being a PCI device, we require devicetree */
>> +	np = dev_of_node(dev);
>> +	if (!np)
>> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
> 
> [Severity: Medium]
> Will this probe fail unconditionally if the required dependencies are missing?
> 
> If CONFIG_OF is disabled, dev_of_node() will always return NULL, causing
> dev_err_probe() to trigger here.>
> Similarly, this commit relies on of_pci_make_dev_node() via a PCI quirk to
> dynamically create the devicetree node for the PCIe function. If
> CONFIG_PCI_DYNAMIC_OF_NODES is disabled, of_pci_make_dev_node() compiles
> to an empty stub, meaning the node is never created.
> 

