Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4306930C345
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 02:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780625467; cv=none; b=LcJHvvgufA5Ue6qjIkEgzmjmOwcgh0qBTYtwzKdyRSgu2Sa54N6lhpLzexNzp8D35dM1xIEDEzANw7n/rH2GbYHoHJ8WqMpSxzhGwBPq11ZicRS0fko6mMcxGv9VNJtCRoo2H3+zRvaAB7BATleLgP7N09+un3gsagk8AoI/VpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780625467; c=relaxed/simple;
	bh=rt8QiFKCUtKyRyCjlNWltkcE+h7JQzz3Oiq6lIOH/YM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S4ubPU/tTOFbqtGT+GYua/BeEQLA5OlIZyHmJ7A0tuTjAWOXUgbgver+16bZp7Nf4fQdxsSJpbzjXgovdMoKmAUM7nP8wRL0f4NGRXBS3u4x9qSrfgLmdNMZJeQg7T2apjkcXF+BiuK0MVZOfvQj+WT8e2HvkAIqBJ5vLB5ued0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktCt3VFF; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktCt3VFF"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c85825bbc4fso832396a12.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 19:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780625457; x=1781230257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ULATv2+XYxYgQ4SMTbT2+7ryN++47TE5p2N63JMlAZU=;
        b=ktCt3VFF+LPPU3LJ7KNs3A63FURN9L9xB9iUXTNXW0yzQr6gahxzD+ic/qqeACXVs3
         b/9bE21L4nO1XqQiafI2PnZ3b+mNw65YoY9BDS/8RhQ3MekNq2yjSjuZ5c0iCUkPLRmu
         MkNUhAABdUGYTP+ppfBv0QmSPWgI1ivY99UYcHr4Rt/X2aTbZa1u+RRTpCqhLdP1w7nt
         wPXPcgrhR96r7e7y0lE8AoRfaQUYTRMw4Hk8lXSg9n2Czut1ugSS4C1nwPRRFxoH8UcN
         ITGH8JSpjbHfcc7qcaz57tXTfrtJ+Xr2yk9sOzKiirnYji8g+owxN6dzCsEjfV1pttf8
         EidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780625457; x=1781230257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULATv2+XYxYgQ4SMTbT2+7ryN++47TE5p2N63JMlAZU=;
        b=hKXFG/KrNUWo/RE576D6Bqmh2zkRcC5JvrCX2fzqDhrmy4vQx1FH3zFpN+gryABJnE
         YWkm/CUdcO5gU3oYVinmnV8TW+ES2Sa+AUEYFboYBgR9FaCXVeE2WIPqLH3KVeLq+MRC
         tecuoQ36St/veCUeujjdHH6Dmd3ubK6bM8rJF5+wmEdNKiJ/JxpObKeUjq2j5YauzHFs
         xMHyLP6rC81LsBJswxQeYyMuDCA6UsBqLLDDx71gjDs3b1ypOnsOWb8JoC3EV4fGuia6
         S1wICK4y3enm+kPMOldJoADkYezREeo1lxYL0UKbOGJVUXzE9mwG9lxJ9Rh3Jf1RpsuO
         PjwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Fo4rwRjSdoFMhwCS1Mojhp1ydDd7mrU2zC+f8EVervloaNyZCIrx+aN5L2KWYnhi2UqXvzSvoHCn7@vger.kernel.org
X-Gm-Message-State: AOJu0YzY7XWBjOEtxyIjyjQvuVDTgbRg76MlqhSP8ZOxJFsAkegR3Cik
	BXNC5tHAG4H5HImSbVsvTdkYdblde8huWRh8wOa9Ayk7t8xK59b9uQwK
X-Gm-Gg: Acq92OH4lVkLobDNnDg5wQ1heYPfCuIRSgWtdkJjVjCs51wXOSRH4YybF268k0i/DYR
	tZX4Cryjz1xahyG29XORgyAte3dTtULOmQRhTq5hVd8CMGSYDJtLXujIIay2isBCO7i8Qmhv2YH
	R77C3LaRxcrj9yRFM0PVuAGdDRHnrHHLgNdEduQFboR/XLQzKRRmuF7n8rZt+GQRnrxlnKWLUiI
	iJWObe/CHCiHbKMVCHPQbpY9I6+3MzqyuwN6MH3p9M6tSm/ljKuAYVDpieahtsZq6/Mqs0rJaTS
	v+YpP9q5TgKWfuSDxHnKEz4qD22DiUwcSjnHQbA4iz8v84ogSI2eu/7O3li20dQkR5NJPzZ5BGf
	rrZbiKKHFDKQtiZy3RvHs+sAm9jXMycLqpmDrxvywErDwfrUWHGXArN7Mh1HXrkiXp6BDnd9r/d
	3dWtniSaWJqFcHr0kP/2Qq83Jmqbi57VbSJkIUhQrTDA==
X-Received: by 2002:a05:6a00:a227:b0:82c:6683:b866 with SMTP id d2e1a72fcca58-842b0c083e3mr1205470b3a.4.1780625457100;
        Thu, 04 Jun 2026 19:10:57 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428288217bsm8833262b3a.37.2026.06.04.19.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 19:10:56 -0700 (PDT)
Message-ID: <b8a5e883-16be-4106-97d3-d4ab69faa8bb@gmail.com>
Date: Fri, 5 Jun 2026 10:10:52 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] of: reserved_mem: avoid stack buffer overflow in
 fdt_scan_reserved_mem()
To: Rob Herring <robh@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
 conor+dt@kernel.org
References: <20260604073611.3954433-2-chenwandun1@gmail.com>
 <20260604074520.D5B181F00893@smtp.kernel.org>
 <757480ae-2d7d-40e9-9900-edd14ed3b3ac@gmail.com>
 <20260604193041.GA1057262-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260604193041.GA1057262-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/5/26 03:30, Rob Herring wrote:
> On Thu, Jun 04, 2026 at 05:18:09PM +0800, Wandun wrote:
>>
>> On 6/4/26 15:45, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>> - [Medium] The newly added bounds check for `dynamic_nodes_cnt` is placed outside the block that evaluates whether a node is actually a dynamically-placed region, leading to spurious error logs.
>>> --
>>>
>>> commit 6a79f526de5e1185b7c79fb469545f4094fb402f
>>> Author: Wandun Chen <chenwandun@lixiang.com>
>>>
>>> of: reserved_mem: avoid stack buffer overflow in fdt_scan_reserved_mem()
>>>
>>> This commit adds bounds checking on dynamic_nodes_cnt to prevent a
>>> potential stack buffer overflow in fdt_scan_reserved_mem().
>>>
>>> Link: https://sashiko.dev/#/patchset/20260604015332.3669384-1-chenwandun1%40gmail.com?part=1 [1]
>>>
>>>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>>>> --- a/drivers/of/of_reserved_mem.c
>>>> +++ b/drivers/of/of_reserved_mem.c
>>> [ ... ]
>>>
>>>> @@ -341,6 +341,12 @@ int __init fdt_scan_reserved_mem(void)
>>>>    		err = __reserved_mem_reserve_reg(child, uname);
>>>>    		if (!err)
>>>>    			count++;
>>>> +
>>>> +		if (dynamic_nodes_cnt >= MAX_RESERVED_REGIONS) {
>>>> +			pr_err_once("Reserved memory: reached MAX_RESERVED_REGIONS(%d)\n",
>>>> +				    MAX_RESERVED_REGIONS);
>>>> +			continue;
>>>> +		}
>>> [Severity: Medium]
>>> Will this bounds check trigger spurious error logs for statically-placed
>>> regions?
>> Yes, it indeed, will fix in v2.
> I now have the same change (and same problems) in another submission:
>
> https://lore.kernel.org/all/20260603152709.941788-1-ekffu200098@gmail.com/
>
> See my comment there.
Thanks for pointing out the other submission. Since the same fix is 
already being worked on, I'll drop this patch. Best regards, Wandun
>
> Rob

