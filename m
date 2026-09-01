Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9BA3E9C12
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 02:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228208; cv=none; b=UUdr0iWhodNiC5WFDB7rute/qBohnCFTcfNmwhl8NcAh+J2Xg+2ZmYNYhiEKZ1v9rkVw/hDJ+1pjEdUMvKoANXhUoMkELzcFg8U0Lc2gCd6p34kG29CUL+pmCx0Lqw6xSwsIPN11/NeMd9C6n5B4n+UhrNXFGVeidtnmMRQSxYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228208; c=relaxed/simple;
	bh=TX6r7q1YQURmuBkaszMdOQ7QsmdJGZBe7gLlm0x5dJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/i8WGGSlu3t7mrfNcgaBZGlKrnMOneOeKZekaDVNFBqjD+wlW99/Kzvc8qkgrErxwdVTpVFWAdRdCJL8sioRoopwaIvfVFiSqu2NoMzXSAx7yK36j1dqTYLdXS4ER66TDHE01qbcEVl8O8dtSuaFBUf8bR3e1G4NugzCZixY9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=w8c/Ca/P; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="w8c/Ca/P"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-52de50e77ffso51055271cf.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 19:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788228194; x=1788832994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEaLnco64T9D+NWKBTWVLYxPTE2JIhEmYG1CXe1LYlI=;
        b=w8c/Ca/Pt1EZnYbry2L226fQRs/7wD9hr2fJDZLn9fUITYI2GTW8u2nzdfLD3hcv5c
         FZlCh5DstENFE0b3tbV8sG72xlA+Dy6H1xafvwFdYVc9QL/9HVw2fNigasKJBvDL1Cvv
         vLyMB5uyXpL+ZiSlfptIGboEZNRHfOGlZTPg9zoNSgwVX+b+DkjgIBGHEbQuafLsbF+L
         KVyttRgSA+IyIwlJmqTRA9H5jywU5Bej6nyEJQq3IAYcgIVKnY7j2Y21tMjtKvxd1Y1U
         NTQC0LWGGfBIBLrME5ytQRUKhtDyAQagtQcxc9ICoTMRFsekid9uI5hjhcpCbyC/bG99
         pzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788228194; x=1788832994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEaLnco64T9D+NWKBTWVLYxPTE2JIhEmYG1CXe1LYlI=;
        b=nQlmTsMyCeApjCYnn1mRan1V1f1TT/2TxALrs9Tc2kOaqb3qmLevHYcJXpR4L0De1P
         wOeJmK+dEyPtahgKqtY/1LdpE555x/RXnw4Bao5fmLooB6kMgCeQBaPgw3MeZBt/4pwP
         rNDbYS+Ur/W3Ahh8iWwz5K/HRbtrTV4q+BrDsB+q/w67mmP3V9TeLB+4S1IHxpwmHom1
         a6itMWdeVvwoVGfAfKejD+pp2LWOvHzNuDEaqGs7qKUkU80rW714NsKW6iBanexRRz1q
         NlsbatdqwN6Rooxm15lLRbCgFP8mEp5zVl/XtwS9z+8k1eFI6Js7947KIhgaS//uvxSr
         SI0Q==
X-Gm-Message-State: AFuF++n8Lr7X51Pq1TacGPHPZdx44J8ROBIkdwZMIt3BVohAIkGhQhLD
	c5ZP1LYrKssdDmEb71IbdeTqJj8rbms1iMe+axlfn6NusUtCcTSxnRxiCCo+4wvLgJk=
X-Gm-Gg: AR+sD111xMk5Fw1K1yOAkumdV4CSypMC4q6H9xuPR4/qFMpzZj19/eJTNIqrQyt0irM
	wi4khM7kUuxt7deKqSEPVZAw2l0GkKT9ULVNJmywFP142FEymG2B0D/rGwD38Nsq5c4AL5S7Rr4
	ji7ysezCc5n6JjYlhk+43HGZCa/6uAwIHHElpvD8hyVg1E92Ye8mh9ucVrYiuckAqEyhn4qC0VF
	kKRMUX9oidzs3eOXJ6ccwajjY4v7X0Yok76rG1AJwIU3dfxGdhNnm7ucRGYibHFqsCwv1w0wf59
	L1zAsIrdFjf2f6S/q0iTcrcCPt1zxoP0dndOG7jMK7sN14+vEQxbte+ZU+yBryuxpMhNNEbo18/
	BXOrdC5qYENdJLSmDIr1u3IXpiMVp6boA+Chk4955MZxAkgqxR676sA9HS6WdgWPqQ/JVMVMuI4
	xT9DRfn9VtHyT2DiZyXJ+7I4ol8vAtonplcI/ilT6AnwnZuc2lqn9WgSO7GB7X
X-Received: by 2002:ac8:7f11:0:b0:52d:78c9:9377 with SMTP id d75a77b69052e-52fb9665892mr352804801cf.36.1788228193699;
        Mon, 31 Aug 2026 19:03:13 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce44f5157sm97576386d6.24.2026.08.31.19.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 19:03:13 -0700 (PDT)
Message-ID: <50176d59-0f7e-4b38-8760-551eff80bb88@riscstar.com>
Date: Mon, 31 Aug 2026 21:03:09 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] of: address: kill of_node_is_pcie()
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 linux-pci@vger.kernel.org
References: <20260901011338.1323243-1-elder@riscstar.com>
 <20260901011338.1323243-5-elder@riscstar.com>
 <20260901011827.730521F000E9@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260901011827.730521F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 8:18 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Outdated comment in `of_bus_pci_match()` incorrectly claims a warning is issued.
> --
> 
> commit 0ffaade5a7eebd20cc4d79d7c8ed0d49f6da1857
> Author: Alex Elder <elder@riscstar.com>
> 
> of: address: kill of_node_is_pcie()
> 
> The of_bus->match function for the "PCI" bus type is fairly liberal
> in what it accepts as a PCI bus devicetree node.  If a node has no
> device_type property, it even allows a node named "pcie@" to be
> accepted as represnting a devicetree bus, though it issues a warning
> in that case.
> 
>> diff --git a/drivers/of/address.c b/drivers/of/address.c
>> index 499d37ceae210..ee2eb44884d85 100644
>> --- a/drivers/of/address.c
>> +++ b/drivers/of/address.c
> 
> [ ... ]
> 
>> @@ -156,7 +146,7 @@ static int of_bus_pci_match(struct device_node *np)
>>   	 * "ht" is hypertransport
>>   	 *
>>   	 * If none of the device_type match, and that the node name is
>>   	 * "pcie", accept the device as PCI (with a warning).
>>   	 */
>>   	return of_node_is_type(np, "pci") || of_node_is_type(np, "pciex") ||
>>   		of_node_is_type(np, "vci") || of_node_is_type(np, "ht") ||
>> -		of_node_is_pcie(np);
>> +		of_node_name_eq(np, "pcie");
>>   }
> 
> [Severity: Low]
> Does the comment block above this return statement need to be updated?

Yes it does.  I will issue a v4 of the series with this correction
after others have had a chance for review.

					-Alex

> 
> Since the patch replaces the call to of_node_is_pcie() with a direct check
> of the node name to avoid duplicate warnings, the comment in of_bus_pci_match()
> claiming that it accepts the device "(with a warning)" seems to be a minor
> documentation regression.
> 
> Could we update the comment to reflect the new behavior?
> 

