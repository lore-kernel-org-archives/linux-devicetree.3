Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D0A43713C
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 02:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788230587; cv=none; b=gX7LmwGWnnn7PwYUaaeQz6gZQluWi/ok/gEZ8bEdGm0PsU+eM6VxkvwGrydaYoB0sf7pcRoBgcjqe/F2o1Drqr/a73qVEwpc/4MrheaplyNzMchL94Bwn2LaUIswxvbI6qLQkRdSSu5PK7y35QnByS9hqlmAwbNUEPNXcs1vAlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788230587; c=relaxed/simple;
	bh=cavPLdZ3EM365UmMDeiKEQPWG/ZtK6GBzxNXSfWmPAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lyDlQhgFsyVSpvKyyxvCey2l9rj4CPoiBDa5wruLLfHxgK/WXXgHCh2GssapRA6H6UC5UgxRPV+GZEj+7sTBM4xxel++BuB+bYrRYWI+hA85XlVfH0UHXLp+cw/a7tY4GpZ6XXgZmcLDWelAdsB6Dq5vk79ASA9ZC3cLxxx0RuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=AjnFI1dR; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="AjnFI1dR"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-939094306b0so39039185a.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 19:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788230571; x=1788835371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPbdamFgACK5fDGcrO4A3g8qwBFcMj5srbjsH4obLc4=;
        b=AjnFI1dRZTU6NfhEL6iIRCQkgMOhdJZU9gXIHtJ8ZPK/4IvP4wXRmGq9Ktr+X9CeiL
         +dLZgmq52u8NziYnAFozt8Nrzj32+KXEtncXr0uMzhEBwUR53aN7qWCMDCpc0/47WEPb
         iKoeqYi8twNIuYYNgYAP6Ub05XzXqWCpDj0g18Hb7VZsche5WTD38yVCQUR//c8EjV3o
         k6AJd7yVygfZ99Fny5SslOcpWADuQPUxopD5OExJri1D+23sT10mt2453LxrkiiXkI0x
         zWiweRIsr3hG4aepMBIm1eI3DidWPP3Fd+GFM9ASxwwmyoSVgkaj1iDAlQAyD8vmL8el
         naRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230571; x=1788835371;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPbdamFgACK5fDGcrO4A3g8qwBFcMj5srbjsH4obLc4=;
        b=ArVF+jjTBTX4whhzcXm3AoIVs0v8+f+lGJN7iBwjP2wDOnMeboPtV3STICUN6oQ8ib
         Vjx9UbN+iicBEz4SopIjs3WkB+y376Geqt2aAp3RF8n3jpUrPb5AgMDjUe7LrEduXlKo
         111+NXeMXqM9M4IbBjJDTIVoWaSU4aBaHExNW+DT/s0rIEiZker//3uBiZp6r0TX7Unr
         /kt8EFiLsj8wxd2nIaAtZYym9aGpbHGcvGXFYhi3KaOu/j5v5LrgZU1YkXilF87EL0D4
         adhUQgprgT3gTYrcwSMdMM4gnwJn6jVSZdCmE76LlYg8zUgR+Cf6e0vGFv0nxoZy6Tws
         U0WA==
X-Forwarded-Encrypted: i=1; AHgh+RpvzAkeOT7H0kBNoS0LPDnSai1mKJbiXhgSu7wSaanSYftF+/sy7KJ8Z9AvaP9/VZi5SRZQz5sObjjW@vger.kernel.org
X-Gm-Message-State: AFuF++loVCFZo5+fHQJkyp0n3t57X4qJmlER+t9P1XCkujc7BpqAV9L2
	CgbKQoUk7Xm1YqBf2MQp4Qn2M6ZbnpOKrfYxX+5XH4RF140gFmvayhqKgYTMxZkP0Rg4Sl1qSoz
	kKBckCTM=
X-Gm-Gg: AR+sD123eTkDakdj0RtnBnWVnitScQdkceu3yOZTOlOrnyHw8KM93j0GSjO4qddVFlA
	4THZmLZxisSpT/aGKFDQwPDsZFxwRTaXPnPHz/CkCQCjnHvcGj2LXcZ3zlUcq8NarNk5ha6Yzah
	VqfovQShmwWFEXPqa8Pctd6rwCa7zjx2Uh7nNmh3sOSju6QotYt+1K2OieS55h/hHTGslal6S82
	c84Aaf5cUgxVAboEJzutDfqND1OCC78qpma7Joa0NWpoE5czJI9v20FsPWuRGcNj9vcK953/WTt
	EDhhd73hL8idZ+Q+eX7CBxvE89ScGfKwf69jW8sYlNNM5KJtD0yv/mud9jkv3sXxJsRmfjksTrk
	Ea1w+TvnTUxbfBIBMoG9sF1cIEjAp+nxOeWMwOfyWtP4vyLthTf95kZarnyp1XCv7TM3OS8JxwJ
	LVK7JObxsFTwJFeSzTaPyXglW2qkgvnYQhOOO1gmcSs5NA0fTMjfjC5fTyal6b
X-Received: by 2002:a05:620a:a0cc:10b0:930:a26a:fb2a with SMTP id af79cd13be357-939137af782mr2704459585a.2.1788230571171;
        Mon, 31 Aug 2026 19:42:51 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917016ed4sm929269085a.9.2026.08.31.19.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 19:42:50 -0700 (PDT)
Message-ID: <d95aebf1-8319-4307-9d62-f1f3dc7ace61@riscstar.com>
Date: Mon, 31 Aug 2026 21:42:48 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] PCI: of: don't zero flags in
 of_pci_get_addr_flags()
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org
References: <20260901011338.1323243-1-elder@riscstar.com>
 <20260901011338.1323243-3-elder@riscstar.com>
 <20260901012046.1BF371F000E9@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260901012046.1BF371F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 8:20 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Potential NULL pointer dereference in of_pci_prop_compatible if kasprintf fails.

This issue was reported before, and I responded that I would fix it.
I *do* have a fix, but I have not yet posted it for review (waiting
for the end of the merge window).  I will post it soon.

					-Alex

> --
> 
> commit 036872e87dc6e9201c6f86349afb91815a638d1e
> Author: Alex Elder <elder@riscstar.com>
> 
> PCI: of: don't zero flags in of_pci_get_addr_flags()
> 
> The flags variable whose address is passed to of_pci_get_addr_flags()
> is zeroed before assigning a value to it.  Skip the zeroing and just
> assign it instead.
> 
>> diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
>> index 505226b876c56..22fea1905a080 100644
>> --- a/drivers/pci/of_property.c
>> +++ b/drivers/pci/of_property.c
>> @@ -82,12 +82,10 @@ static int of_pci_get_addr_flags(const struct resource *res, u32 *flags)
>>   	else
>>   		return -EINVAL;
>>   
>> -	*flags = 0;
>> +	*flags = FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
>>   	if (res->flags & IORESOURCE_PREFETCH)
>>   		*flags |= OF_PCI_ADDR_FIELD_PREFETCH;
>>   
>> -	*flags |= FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
>> -
>>   	return 0;
>>   }
> 
> [Severity: High]
> This is a pre-existing issue, but I noticed a potential null pointer
> dereference in this file under low memory conditions.
> 
> Looking at of_pci_prop_compatible(), kasprintf() can fail and return a null
> pointer:
> 
> drivers/pci/of_property.c:of_pci_prop_compatible() {
> 	...
> 	compat_strs[PROP_COMPAT_PCI_VVVV_DDDD] =
> 		kasprintf(GFP_KERNEL, "pci%x,%x", pdev->vendor, pdev->device);
> 	...
> 	ret = of_changeset_add_prop_string_array(ocs, np, "compatible",
> 						 compat_strs, PROP_COMPAT_NUM);
> 	...
> }
> 
> If kasprintf() fails, the compat_strs array will contain a null pointer.
> When this array is passed to of_changeset_add_prop_string_array(), it
> unconditionally dereferences the strings to calculate their lengths:
> 
> drivers/of/dynamic.c:of_changeset_add_prop_string_array() {
> 	...
> 	prop.length = 0;
> 	for (i = 0; i < sz; i++)
> 		prop.length += strlen(str_array[i]) + 1;
> 	...
> }
> 
> Would it be better to add a check for allocation failures in
> of_pci_prop_compatible() before passing the array to
> of_changeset_add_prop_string_array() to prevent this?
> 

