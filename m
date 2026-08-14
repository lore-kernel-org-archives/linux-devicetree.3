Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE3C3CFF44
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 16:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786726535; cv=none; b=ALeMHn0R2HwjzbUMJ347/m9HIOdw9L4L0S6clYz/AFzBiW71WCgfZ5lEuLXEWGjt0+2JHUULT9VewUp0nBw/vR6Vg5afPOhLxz2tuGDDpD+k8JbQ5imLT3jdEAVgkraaYKyvDRYzYNN22z+PVLd31+bZA4vc8vDlfk2h8GZxltA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786726535; c=relaxed/simple;
	bh=k5EloMOSTVAa9CzBTiI/tnt1aw0B//WUVChQ0e1YpDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T6AADX3YLw3ZyNmdxqhTEXgxlbiTsXDZWSBEr5YZyOcyPKCwBLCpBX2+JaxFNYVDI3SGHA9oFFdCBfuyheh/pF1Kka6t8swB6PefYT5ZcmIVIO8Uk50JQ3kRMtNpG9lIK0CeHRDTWdB0mB9Ks/Qa9/ltpw2VYAdobBsS15k2Fc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=CTmaAcJl; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="CTmaAcJl"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52b4e988c77so8909601cf.3
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 09:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786726532; x=1787331332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTW05gzNIpG2NVGNH+SKktP5f5MLzIfsgAEdY/wEjzU=;
        b=CTmaAcJleqxEnKYz3WBrXorkx+ByXEpbjMMbQNZelj6TbqSPWjUqYtFmrI1qpJgGkv
         TKPAMRNNLIQWw3ekDT2Im+6WGAPPhFJCQrnT7ZhkD+DAsIbvnaXr3o+TuFpT7gBO745P
         gnTYG4A4Y7lpYRZmD9kfITzxPc36zTgHlPh4K8m3bZ6bw94SH3hv9buYgUjx0KVjmf6Q
         DrRO9SvcDwi8mBg/ioggEWW0fIYiluhZbOJTQQLuh9VgHxj9i5z2XHXn+JfwKmFsDoNC
         sZgGE3x9MvH5SCVaLs4RRCiTunSKA+6YsU5POJ5tD7sijsUjozid50Or0xFU4rwaLBi+
         a35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786726532; x=1787331332;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTW05gzNIpG2NVGNH+SKktP5f5MLzIfsgAEdY/wEjzU=;
        b=RRQMsYP+sAk/MJ3loOgUFwSbf21eo9RCJrxuWs0a8o6phbnwzGpSxblKFCDLiERDEc
         lDFZw14lD11jpQYza7O9Eo0xsmXaO5FKbmrSsTyzbt66VlkzuFoncaJ1uI2I4L1E4oQq
         maTXgT2o/KpEu2b56lFL1wSp9h8gM9h9YIuNE9C1YVOloExoAhaPtQgNzZuZt63yy1ki
         0U1suovTXuTea6epLolJGF2R93c2EiEUgaTWELMabWxj/S8T0D8hlT4fEaYEvpHDhrd3
         eDjubBJ7rbixh16hmnieVXjbQmD+YzzeA/2198ZVndph+6sYugE+u9NjH0NqR2bR8Pz7
         zgkw==
X-Forwarded-Encrypted: i=1; AHgh+RpOE+6RvVi3Fdb4BlNesA9+zhk9l6E/L4oVDWJQbNIqJuGH+yYf+FsBSjRpUXA3iVJ5kGzg7LxHugCG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1c8dyadle3V/RYGJBxhvct1P3/ZGA/wqORdzXNxYdE6GhFrqf
	O+KI9Xgar0nsPsVT7sXh0etuj/KCm9w5yXDDtKKabrSKzP6rO1WoVyBQy+ea4TKNZlWrwHH6YRY
	jUCekZX8=
X-Gm-Gg: AR+sD11nx1Qaryk5GWkXptzRydpeHPztnnfoWplurKdLXUkIf/grSJOdFvma0Xwdmub
	SBQSlb9eX2ZAjgc6sqFVdNhrSzPZunp7tyUBEKmv04QBO3Ft+sgCi8e4bqaYdfOOVaVMVnawq1x
	wehk0Wu4lhX+FjP8gIyILzWotDSj8a/2QgUeUnLPcOv4yt2kfgWI+7VRH5Bnq+M0kinW/7sXTdS
	ZyncMOY9YYblRHSex43eE4xoQFK+eWI4htepfO9DNv6uy6V5p1oQDc8fUIvOXLyZcwLNSViRgwV
	ZbHRevrAGFZ2GLdbC8zBscFQAcX5JBHXbvoq+vpOIlUETq6/QL9NVwQYrGGrWzu9SwwY5Albeo3
	l8ctqoo2Hj5Dwfoe2Wk2toyMGMRR3xuDLwyMF//hDP15aIHmiIE/hlamnrX684uar6vE8cMwZeg
	K+9Th/iSHkwSrWsg7OLeYQLMhPmi1B/HqKsoncpvlrAdmAeZbNgDGwBqeADe7x
X-Received: by 2002:a05:622a:608a:b0:52d:8257:666d with SMTP id d75a77b69052e-52d8541dcd5mr85954931cf.11.1786726532365;
        Fri, 14 Aug 2026 09:55:32 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d84071799sm24476161cf.20.2026.08.14.09.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 09:55:31 -0700 (PDT)
Message-ID: <4bb8bd0a-3e33-4fe4-903a-69b2c708a017@riscstar.com>
Date: Fri, 14 Aug 2026 11:55:31 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] misc: tc9564: introduce base PCI driver
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, krzk+dt@kernel.org,
 Conor Dooley <conor+dt@kernel.org>, bhelgaas@google.com,
 daniel@riscstar.com, mohdayaa@qti.qualcomm.com, lbiancon@qti.qualcomm.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260813222943.1655453-1-elder@riscstar.com>
 <20260813222943.1655453-3-elder@riscstar.com>
 <2026081455-eternity-douche-900b@gregkh>
 <56aef294-8d1d-40f2-a371-ea3f5ede2ccf@app.fastmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <56aef294-8d1d-40f2-a371-ea3f5ede2ccf@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/26 2:31 AM, Arnd Bergmann wrote:
> On Fri, Aug 14, 2026, at 03:11, Greg KH wrote:
>> On Thu, Aug 13, 2026 at 05:29:42PM -0500, Alex Elder wrote:
>>> +#define DRIVER_NAME "tc9564-pci"
>>
>> What about just using KBUILD_MODNAME?
>>
>>> +static int
>>> +tc9564_function_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>
>> But wow, this is a tiny driver, feels odd to have it in misc/ but ok, if
>> you think it should be here...
> 
> We have drivers/misc/rp1/ and drivers/misc/lan966x_pci*.c with similar
> functionality, so at least there is precedence for putting them here.

Yes, exactly.

>  From the old days, we still have drivers/mfd/sm501.c, drivers/mfd/cs5535-mfd.c,
> and a few others that open-code the on-chip components as mfd cels
> instead of using devicetree description.
> 
> At some point, we should think about grouping them into a separate
> subdirectory.

You mean for systems modeled with PCI endpoint bus, right?

If there is consensus that now is a good time to do that I
don't mind doing that work, but won't unless it's clearly
requested.

					-Alex
> 
>       Arnd

