Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67563DA5B4
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 14:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530693; cv=none; b=T6d7HlJJehMsLIJnaum9pEx1bQAL1jaB5JeTnp/NFAKzffIyJK5KFqfga3qBiSeRCkoKeWu5BlMa1OiNSa5pvZtbj8UDuf2DwDSU6lRFS/4ukhycCUSYp7QcTbu2qVZ0ZJQ7yNq450R9d/1qOHfrQOonuI/e0F1z21mdYVfmCzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530693; c=relaxed/simple;
	bh=N0Tq3wBr4CAjFB00AM90m7/84+fWcmZngE4AWv68E3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A91G5JybVfLJpuANUEuPBgrh4iwWjKK2LqIpIE3tAQoGk5QiM/D2IAc++KPaAaCN0dA2CQt6nPotsgCIQ+Krz7iJ/XWn27War2RnaF5g8tIQ04OzKEyehW2quRGHXRB+5pp+Co5ZNFI9hjCYTUzn1aTP4SqCC6aHXv6X6nLZunw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=nHj/g33x; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="nHj/g33x"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so301866241.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 07:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788530689; x=1789135489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RgvnR/pqmrGBFs87lYL82eHWSI/zVKIkSdkMcH+Sw9w=;
        b=nHj/g33xx62y03GK/XJque8RZVtWUDouqYv9EuGbILo0k6iYVbzMeY5WMaBIpr/Gk1
         ln3OYETtvUYZxGelq/VMd4BS7VR+/BwLqwBichNU1OyN/6Xz91w5kXFqMIc/Ly1Ou6Wv
         hOgJ+apNC2Cl4tLcTlC0GUZn9Ekmo8AQITvYB8bm/Xm5X/TqClsiPez5T8pzbBy364PJ
         nrJH0QjWCswcVxSiyqHdZ1MHZFQEUgGKjDPXZ/NGnkJAlwiRFrWoQHLKHC8jcSA0s7EH
         z3/gCcmyyIDz14x5GO2gJweCr4JzhWErsvE/b1NYwY0cCM7F2z9rN4VhCKY4KM/39Fr8
         j6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530689; x=1789135489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RgvnR/pqmrGBFs87lYL82eHWSI/zVKIkSdkMcH+Sw9w=;
        b=CQKXg5vjXll03E3xfuo1Ovd/Ph6M1sPRvX4j+87LVtpB9qCVGARAzLCxUNSeS+pzuQ
         BVVSmVydXsrxKgHh7f2rsic5wyosYx7OLYXrwL7D2EyDWifARjvbOnLpT9DGTLfVTzPd
         bHNnY+7fjg1H11ANymEp7qBgJdbZpvHEYCghIlz89fKC69+rliAJaPQi88My74lcLXzA
         kdEfAI7uG2t9OjYJEIYmu8I/A/m6Usd9/02A0HbJ6HzD4aesLTrtBLd9W1eZeoeSliHW
         3H9VrLJMW/BvPFi0UoLfOvS8r9j5taty6eT76BfGO4NGM5Xho8xfnlNxFpdtDQlcNB/1
         jK3A==
X-Forwarded-Encrypted: i=1; AKwUvByzweiGORsi7nb7Rtl721FuiiCW00xS7g2LuGhk34NBOl2jJ2sJU0wpWH+mc0knxh7mS9JYuiwNjEoN@vger.kernel.org
X-Gm-Message-State: AFuF++lyiC1btwuzipwI2BDotzA/B7b2frTjwKa5TDgu2GQlPb2ySuzb
	wI8FdkNAaRqs03405LSB1eOQ9Fz2SfUHP0CoRSki+QPUK9il2CGvFzSDEafU4W73L0AmnR7F66Z
	SCX2T/Vc=
X-Gm-Gg: AYBFou0ZCQfeVdl5qDUE+dt4nbbucShSu9VAsqEDGfazmByjuirmISU4Y6nljZmgr0Q
	A0nd0PL6KIgG614e4jghLlTz3Hz+HFFpidFhSmHGCP5BIlmojjRG3IyU7Igmw6xDOUDFDkX4j2y
	O017W+nKwTye9l5xYQmgbDmtl5h3gfdJG5LrDIE8sodP3Amrpxj12wK1K7jJQJ6+6XHyKHtiovl
	dwzf1symB69gRlD5Z5M6fVDvZuUCbtNZlkz4KA+dhXFqBGv0qtYndZjVSGx77vkLB51i74NIjBA
	mC7Mi+5HSx8xzsayjSxBealV3XctQdxXh09JhfnAYwtyRg0hOlVaTMYAJwzvQDGRATy0l0UgG5y
	zDecr646NfKryQjRVPfYA4wooOHY93UgRevejqkP/xREkRem9nDvjuTM3FFjxHydR0ch5ebWI/g
	xnsCCm0iGac1+1IGJ8cLqCs0H+LSMc+H+TZRKG5V96hkqp14dxmyzzuA4jaEY0
X-Received: by 2002:a05:6122:f18:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5c7ed29d58bmr2786695e0c.1.1788530689514;
        Fri, 04 Sep 2026 07:04:49 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb62710sm221647985a.28.2026.09.04.07.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 07:04:48 -0700 (PDT)
Message-ID: <0e0b02be-a438-416e-bb0f-515b7ba80052@riscstar.com>
Date: Fri, 4 Sep 2026 09:04:47 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] PCI: of: avoid allocations in
 of_pci_prop_compatible()
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20260904134607.1856121-1-elder@riscstar.com>
 <20260904134607.1856121-2-elder@riscstar.com>
 <20260904135954.696FA1F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260904135954.696FA1F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 8:59 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The local variable `bufp` is incorrectly declared as `char` instead of `char *`. This truncates the stack array pointer `buf` to an 8-bit integer, leading to severe memory corruption and an immediate kernel panic during runtime.
> - [Low] The local variable `i` is declared but never used after the patch.

I'm very sorry about this; I'm not sure how it even happened.
I must have included the wrong patch when I prepared the series
(but I normally check builds as part of that process).  This
should not have even compiled...

I will fix this and will send out a new version tonight or
tomorrow.

					-Alex

> --
> 
> commit 0153310b625600febac7ea5aec9fbd9871d0af03
> Author: Alex Elder <elder@riscstar.com>
> 
> PCI: of: avoid allocations in of_pci_prop_compatible()
> 
> This patch replaces dynamic allocations for three compatible strings with a
> single stack-allocated buffer. This avoids subsequent kernel crashes where
> allocation failures would unconditionally trigger strlen() during device tree
> properties initialization.
> 
> Link: https://lore.kernel.org/sashiko-reviews/a647bd56-7dc8-4fec-9d96-834622054cdf@riscstar.com
> 
>> diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
>> --- a/drivers/pci/of_property.c
>> +++ b/drivers/pci/of_property.c
> [ ... ]
>>   static int of_pci_prop_compatible(struct pci_dev *pdev,
>>   				  struct of_changeset *ocs,
>>   				  struct device_node *np)
>>   {
>>   	const char *compat_strs[PROP_COMPAT_NUM] = { 0 };
>> +	char buf[PROP_COMPAT_NUM * PROP_SIZE] = { };
>> +	char bufp = buf;
> 
> [Severity: High]
> Does this incorrectly declare bufp as a single char instead of a pointer?

Yes this will be:

	char *bufp = buf;

> Assigning the array address buf to an 8-bit char truncates the memory address.
> 
>>   	int i, ret;

This will be:

	int ret;

> [Severity: Low]
> Is the variable i still needed here? The loop that used it to free the
> allocated strings was removed by this patch, which will leave this as an
> unused variable and cause a compiler warning.
> 
>> -	compat_strs[PROP_COMPAT_PCI_VVVV_DDDD] =
>> -		kasprintf(GFP_KERNEL, "pci%x,%x", pdev->vendor, pdev->device);
>> -	compat_strs[PROP_COMPAT_PCICLASS_CCSSPP] =
>> -		kasprintf(GFP_KERNEL, "pciclass,%06x", pdev->class);
>> -	compat_strs[PROP_COMPAT_PCICLASS_CCSS] =
>> -		kasprintf(GFP_KERNEL, "pciclass,%04x", pdev->class >> 8);
>> +	ret = snprintf(bufp, PROP_SIZE, "pci%x,%x", pdev->vendor, pdev->device);
> 
> [Severity: High]
> Will this snprintf call trigger a kernel panic upon dereference? Because bufp
> is truncated to an 8-bit integer, passing it as the output buffer pointer to
> snprintf() will result in an out-of-bounds memory access (unmapped low-memory
> dereference) when evaluated during system boot or PCI device enumeration.

This will be fixed by using a proper type for bufp.

> 
> [ ... ]
> 

