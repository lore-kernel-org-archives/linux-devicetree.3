Received: from mail-qv2-f31.google.com (mail-qv2-f31.google.com [74.125.230.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ECA49F134
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262712; cv=none; b=AKgUb4nazS5X6SbnsEl4/Hg+WdSDhsFU3Fphs1mnuqDzZKhZM0PMGab9onwAO1qqDt6vSuWYA7jbMsMaOIWPZr8v3+gCtb9eKowNu2Kb3ynnKnrJe9FVrFLuXeHw9RjoZMr0bAQGvelltTUhaWkDNt/hzPUM1Xg1BYQKJZ/wRX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262712; c=relaxed/simple;
	bh=rLyOMd/NUGEseSBxyocA0bYOEejNiG1JtJseUmRTyhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HjU1D/ht21tU8u539b55GuPwts1XIzYxG4FW7yObG2XpYQQrIcOP2VmNA/Bs5HCZTKDhrZzCVnYX92sYExsTA3TMKRT6Ns0+LKj1OT1QDH5jCNfeHGZZNGEPthSuv/+TWiBmogeh3PE2Gck6qMaaKeRCWCsvQxj8Wr4Phghr7/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=RGYpLLMq; arc=none smtp.client-ip=74.125.230.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="RGYpLLMq"
Received: by mail-qv2-f31.google.com with SMTP id 6a1803df08f44-91219376dd6so18825656d6.2
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790262709; x=1790867509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=coMqpZSLbYua79ODlaLf8ibI9ASN8s+y7pCadqkcxT0=;
        b=RGYpLLMq9WViukKYYcrS7yWs3gLGpBOBNXu9ZiQ9G9b/p9uvy/3DdHdWcgmKRRKNIh
         pOVoSEOQ37Gp60VV/V7k7qSX6LoHzotEnxK9fHmZGQj3KlF+R/+Gz9QWy7JHdph3W4Kd
         43W3kt8aMOlbivlNr/5ghF83Q0zhDXIcDhFk7c6fC1r1rzCgGdjnVgoY0UWzWt6K2P2E
         6/GqfIdG3bEhdrSHWCKCFZbJXXZ8moGMjHOAJTbJzzyUGLw5l1zoyFCdjsEB2lpE59Ba
         U7iVLgB9JR47ntSvwcjE3GtqkxX9bq59XkVMiC4Tm/IMMOD6LD/XpsLymqpel0qsw4k0
         A6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262709; x=1790867509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=coMqpZSLbYua79ODlaLf8ibI9ASN8s+y7pCadqkcxT0=;
        b=KSR5MRlBrYjovDbCUwu7ivuXfYYetZFKzRiAi2SUc7CLse2f64FO3EeChpjUuuJqcC
         Wfhb4Umo/Wll3zhNItOIPcmlSR26TmhsJdZVgeF39Vhzd0TFL6KcVyh9bYYI56gwxGq3
         5SBo5B1/aPYteMnHJOE8CHXPXSyLDANyHmHs4EYnnNWn/ULB9cPme3GlLIemY7plIxV5
         VKAFaeLvIf4FpxLtrphA76YiuFRZKURmIIZZ+vuy9sZxytPWuKh2ndOvJaMyoXNo9omc
         tYR4fOLtRjv/37Cln3sVRZjnD4Wcty+j/UEo16zw8eHa/zbqACCsLWC/LphDUP4WAyfD
         ZGIQ==
X-Gm-Message-State: AFuF++kX/6oO8gO1hqS0v6ZlBpUI6UCvAEkHE2JXUuZqkVGlZh2r5vR3
	QEGE4ynrBx4I9chR6C7e0HpbjnJCLQexCXqqZBVAV7tN8UqhT6j0q0IPkU8t7nInInQ=
X-Gm-Gg: AYBFou25htyVz8B/4vutJhrRCEVOBOAoDcW+JdjKCQUFTHtwn5FGeh20588p+VoBkRM
	C2WDGmyXvR+wIWJksWxTNQj2bM9j/HJvus8HkqA2yRsH1xW4NEpw0zzexbYNF15tS18jICLsEQI
	J3xbpBKvJz0o3UJgryNaxX9eRp2+QjH3Aoob3ZNF1Vbct1nES5CFiYzG3oHaFFj2QySIu9NiuBc
	w/yxdz4MF78GKDiitOr0S9DrQQhjde0HQg1WFsZ0L6n1tlu7Hu00vGBUa1tni9QZRX94d33RbQW
	EwQ3rS8QEGatSBYEoeH/QsqoCEZZtsAPeCYrOzL3mWqBJiU+fp/3B3WPzLHI0lZWQWBMb2R5mJ7
	tr5D+MN49pRTJ5/O7SOtSg4aQtOfC0qsdtyH2ADobW/InzEhf1NGVXPD94Y9bDRvEv7lqFe0xaZ
	BvEnFryTXqJ3bXzbUMlAP9nwPCVFS9JS26EToqcrh2Hop9bhXnUXTXjW09+x2W9AAo4neZmTTwY
	8ddHyZakA==
X-Received: by 2002:a05:6214:3d01:b0:912:599c:a278 with SMTP id 6a1803df08f44-91421ef6d3amr30758496d6.37.1790262708730;
        Thu, 24 Sep 2026 08:11:48 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e27b698sm18523826d6.31.2026.09.24.08.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 08:11:48 -0700 (PDT)
Message-ID: <5a150b72-e2f9-462c-aabd-103659e3bf62@riscstar.com>
Date: Thu, 24 Sep 2026 10:11:47 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] PCI: of: introduce of_pci_verify_node()
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 conor+dt@kernel.org, robh@kernel.org
References: <20260924150222.1179235-1-elder@riscstar.com>
 <20260924150222.1179235-5-elder@riscstar.com>
 <20260924150934.B4CE31F000FF@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260924150934.B4CE31F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/26 10:09 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] pci: of: unintended error-level logging in of_pci_verify_node()
> --
> 
> commit 0e8b20efbbe63f895449027a5712b691b9eeaa56
> Author: Alex Elder <elder@riscstar.com>
> 
> PCI: of: introduce of_pci_verify_node()
> 
> This commit introduces of_pci_verify_node() to verify the device_type property
> for PCI devices. It adds a runtime check during device enumeration to warn if a
> bridge lacks a "pci" or "pciex" device type or if an endpoint improperly
> includes one.
> 
>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>> index a51dff91b196d..5a040ed836744 100644
>> --- a/drivers/pci/of.c
>> +++ b/drivers/pci/of.c
> 
> [ ... ]
> 
>> +void of_pci_verify_node(struct pci_dev *pdev)
>> +{
>> +	struct device_node *np = pci_device_to_OF_node(pdev);
>> +	bool device_is_bridge;
>> +	bool device_type_pci;
>> +
>> +	/* Nothing to check if there's no pre-existing devicetree node */
>> +	if (!np)
>> +		return;
>> +
>> +	device_is_bridge = pci_is_bridge(pdev);
>> +	device_type_pci = of_node_is_type(np, "pci") ||
>> +			  of_node_is_type(np, "pciex");
>> +
>> +	/* Bridges should have device type "pci"; endpoints should not */
>> +	if (device_is_bridge == device_type_pci)
>> +		return;
>> +
>> +	dev_err(&pdev->dev, "PCI %s have \"pci\" device_type property\n",
>> +		device_is_bridge ? "bridge should" : "endpoint should not");
> 
> [Severity: Medium]
> The commit message states that these warnings are "meant to help developers;
> users should never see them."

I suppose I should have said "error messages" rather than "warnings"
here.  I think dev_err() is appropriate, and unless a human objects
to this, I do not plan to update the series to address this.

					-Alex


> However, dev_err() logs unconditionally at the error level in
> of_pci_verify_node(), making it prominently visible to end users and
> potentially failing automated test suites on boards with legacy devicetree
> nodes.
> 
> Should dev_dbg() or dev_info() be used here instead to match the stated
> developer-only intent?
> 
>> +}
> 

