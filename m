Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF393DDB0A
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 02:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788230582; cv=none; b=JsLKZ7ukiAlv9WdbhiGBhxyF/sacUx3crztSgVMw+84WoD1/7V9Q3LNxH/8+Ktwh55oHITyiJ43t7/ykRgRvIrZcpSVc68h2tZ8nJromPU5exrDNhjx3tKC253oPU4Je5MHyCwixyuJdFWhXXEC9Eba6kuBckmBMu3mx/Sk7x/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788230582; c=relaxed/simple;
	bh=sSqNFSEIRBnxWbpBl9DNQaV0K0s7qNoKhmjQApcnyt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WpzwnXit4gYjZ8wB/NzkqvkJwL7jgw7noLiJjYx7uFA6TwuXqlYDKJUOPqSSJdqErDRIfhKYQHALBxe+yjg8LN9K86uC67pM1D+5ydM8/SiKcqy0e5++5e59zAS5Jg7LMBCouiiwIQNRekgZS1/LtuvOGF8xbgVuaxUP7o/40CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=pOUKH6fu; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="pOUKH6fu"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-52cd38ddcdfso37641871cf.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 19:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788230570; x=1788835370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uiSGP8UCJwVnm4V+RqkD0yHeg4awqeThcks0aUo6ivg=;
        b=pOUKH6fu5UMy60eDBXdFP4Yn7TFcmTQO2Oq2lQrlNMYTWKG59RCZM3bYvKse17sVWm
         oOzZn59Qb9LnaOgdx4HDvRCRD9hl6mCmMO3b+Q3QES5dqYwFa9aSo9mpzCNDQIM1DvJm
         n1QGIjqqJmuuqI4atocV12Fjsumy020DKwI+UaH6qVDpFtq4sACZT+HU/noHW1cnjDSl
         /n7DTQxM2+yJfHCmxn8IwUSrFHG2A2+uV3UExoA3X+AdE0UxZXzhz19eXUY5yuFWaEUQ
         K7Kck8Rj6rkszdHEtGbAjuixBi47uLqnbWDW5b2VXuTSHud94pb8UDHZemLHxHXmwZUx
         9N4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230570; x=1788835370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uiSGP8UCJwVnm4V+RqkD0yHeg4awqeThcks0aUo6ivg=;
        b=sA52ddZs70rmlvFhGYgV1ZTSMKKFHGvAHNDGcDNoq1adHTJOq5HUvIGazjIXmCT8de
         hb/k/UNWOybInPPPnis/c7wdmajJ3wlTgA3xegx60h0ZBVViLCuIXZxmDr0teFYdmwgT
         BYtJZtf7MmTBRHoC6nmqSIg1VgTJQwCxyQgcfwoZC/3brkdHuZEqRBovMclPpFSbMqoN
         jDAMZ2b7Qm8oBOa8zAVhCYRZq7qaGxIp1ElIzc2loM3VTuRY3MmEiSnbv45qB4Em4kSY
         wioX1u1R3TivhXnMGSeblmglGmeUDuuA8YH81lvFhtW2EMEYA6wkP2ILQrxTOdF0Xpgr
         IxHw==
X-Forwarded-Encrypted: i=1; AHgh+RrzHyWGjyBHiHlyNq3e5X1EpRy4acGfQkiPbu7IP4AiIm7eVSZ2K7hnWgD6PjnZ0slxd3vTRLqu4zTE@vger.kernel.org
X-Gm-Message-State: AFuF++mgZ3ZYrNRTO/MVHCxWKxzL01vI3tueB6Q04wsly9sqXXOClv3z
	tHJSUax04bJUQmHq2TwExJJUYzecliX9CfjV92iKhYULueveaUq1zWS7KfBSrYg9+neopc78a2I
	GvEqIOv4=
X-Gm-Gg: AR+sD115e/Jw1tFJZ/E4i0fCvoXP6T1wI30f4nylO4J5K4HuqTdNLJGIBQO3tXiFhrX
	CMOzU4T9+u75/YzwfIajfm23Y3Qxv0rz11+Tq6Rc1yxDohcRzt19iYV5tYw8R3R/J+JQqUJFwy7
	2Xy3RAIzQyVxf8plAV3tGTcvLM7ADKggJnsqmhY6u09qOf39EONSdQ6A4Ta6u5dc75/UEc2szvo
	AH1dhiU9z4TxSywlziTwCs/nRgTV+mpaVxVSAFXwhIwDUrPDyVy3WN+S44HmKi+otENfys+hEAj
	xPaE7iFgcRhFIAGqlPsFjpUMIs4KTlhKNRhkzZ1EZYOVUtxJa24OxGiFYO80A6g36Aqcs2/cPuv
	Rsi3hhhP07zq//PrBujVPAzJqvvldM+tInurTq3SsU/BWz5UhEnSpJhEkTr+7mMTFQqpyfjCbBE
	hFGAkwhLUwm0POEYgPJh6lCo8OYs4VmBQ0HTx2yoXdL7v+UzJNh30pyCeYJPdq
X-Received: by 2002:a05:620a:3703:b0:939:1fc6:3fd6 with SMTP id af79cd13be357-93948086f3emr719892985a.18.1788230569828;
        Mon, 31 Aug 2026 19:42:49 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917016ed4sm929269085a.9.2026.08.31.19.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 19:42:49 -0700 (PDT)
Message-ID: <cde3da8f-933a-41ef-b7b8-f78317ca2d67@riscstar.com>
Date: Mon, 31 Aug 2026 21:42:46 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] PCI: of: introduce of_pci_verify_node()
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-pci@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260901011338.1323243-1-elder@riscstar.com>
 <20260901011338.1323243-4-elder@riscstar.com>
 <20260901012128.2AC6E1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260901012128.2AC6E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 8:21 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The check in of_pci_verify_node() falsely flags compliant CardBus and PowerPC PCIe bridges as having an invalid device_type.

I was unfortunately not considering those types of bridges,
and don't have experience with (or access to) either.

In the devicetree code, of_bus_pci_match() does check for
device_type "pciex" but does not handle "cardbus" (at least,
not explicitly--the "default-flags" bus type might do the
right thing).

I would love to get some pointers from others on how to
do this correctly, but in any case I'll do a little more
research on this before I post version 4.

					-Alex

> --
> 
> commit 72a980b9469901bec37d04c04dd8de642179aa44
> Author: Alex Elder <elder@riscstar.com>
> 
> PCI: of: introduce of_pci_verify_node()
> 
> This commit introduces a runtime check to verify PCI devicetree nodes. It
> ensures that bridge devices have the "pci" device_type property and that
> endpoint devices do not.
> 
>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>> index a51dff91b196d..1838a3109514c 100644
>> --- a/drivers/pci/of.c
>> +++ b/drivers/pci/of.c
> 
> [ ... ]
> 
>> @@ -1085,3 +1085,34 @@ int of_pci_get_equalization_presets(struct device *dev,
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(of_pci_get_equalization_presets);
>> +
>> +/**
>> + * of_pci_verify_node - Sanity check some PCI device node properties
>> + * @pdev: The PCI device whose device node is checked
> [ ... ]
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
>> +	device_type_pci = of_node_is_type(np, "pci");
>> +
>> +	/* Bridges should have device type "pci"; endpoints should not */
>> +	if (device_is_bridge == device_type_pci)
>> +		return;
>> +
>> +	dev_err(&pdev->dev, "PCI %s have \"pci\" device_type property\n",
>> +		device_is_bridge ? "bridge should" : "endpoint should not");
> 
> [Severity: Medium]
> Will this falsely flag compliant CardBus and PowerPC PCIe bridges as having an
> invalid device type?
> 
> The check in of_pci_verify_node() expects all bridges to have a device type of
> exactly "pci". However, valid PCI bridges can legitimately use "cardbus" or
> "pciex" as their device_type property.
> 
> When a PCI bridge with one of these valid types is added, the following call
> chain unconditionally triggers this error:
> 
> pci_bus_add_device()
>    of_pci_verify_node()
> 
> This could emit a false dev_err() during boot on platforms using these
> standard bridges, which might alarm users by polluting the kernel logs.
> 
>> +}
> 

