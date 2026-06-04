Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922401A23B1
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 09:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780564697; cv=none; b=Z5rZlgGBVbmU3M256x0PX/8B9+/LZg59cWCesnYMzVzxmWthMqa4m58kJbPgCx4PjmNI7MtARE7MkP1cAQrEtc0i2wnTeWBMDryo/7XHPp97vkBT5PcIQDFjPbOMGYtXYns4sj8xYNOblRlS2cW2egsgbeTqKpSs/3jcer7sklw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780564697; c=relaxed/simple;
	bh=Mpu1O4t7OQcsTOr5C8ljDCMbWiLVCF2byHGao00K5Kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+6XCxeeeul9DjtJvHUdO/NATzrCXjfvNV1F34Mn+60IdnDeka3cKbayP/6Kaa+d4e6b4p/iqz1c77DJzIn2oWx7MKVR55D4N7D0JneiP/B7QljxYOTYycBzFgQ/comNVSrrjeGqGBC6HiB587Aj8qlNNLshe9ke+vWvl7aQQJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqCSL2Md; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqCSL2Md"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-36d6bb38b44so335697a91.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 02:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780564695; x=1781169495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9dTSEEZGMHnZUETkD5f3nrjeQdILJk7hEEyXeY0PvtM=;
        b=bqCSL2MdLp+U+n/N/KQxxDBxDSLvvNJAD6O39fmx9IhvQtCfg7M909NvXpQAt/tb9k
         EjNJGcVlFy/6DJuK+DbsTc8wySVR1SNDSqrX+2y6Iw/BVbgEoiK93ME7oSLSdSC3OUzB
         phd8zXqv6VRKWdXEaBxMTBpi15VXrUL+JToIeKCNMfptQJnEVBdrjpdJWx5PfchUhthw
         ROac5Fb274BJTtQRQdI+eIG25xID959Iev9QiVluKXR/Vl6loFLaF4cz3GxQbv0/Xcyj
         kGKFYkCWFXVHBsbyvRFa5CmDk7+7zd3bqnERHuwC03MXqa+vEEvJWS3xhPtGKMwUbE9i
         qDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780564695; x=1781169495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dTSEEZGMHnZUETkD5f3nrjeQdILJk7hEEyXeY0PvtM=;
        b=gX/63ifreJvTr9YeseYaE+p8KOpkpR+BFECWlCcyape0r65KLKaoF3oqqzJ9R7VTbA
         5hDwzdcx8gNOMCIBKNthfasziBOub/67qJ1owWi+d1NqH30vDJc9O7g44kiBEJ0vhV/u
         y9sCrYgmdCFe1F7OstkPoSXW2sXGQuQw8z4swUqqvQFaS22pjpHB20RzvP+bhMtTFWs1
         kT00Rj/9SIhmh27UMB/HlcdiVcIqSs/C8ub2FUBfsRigwO55SDiSGzJ4TQhylYBkoE7w
         zruZQ/v0Ozf3yIBmq4WZoIwo1jSCOAIPLYYAL9WP82e69LSR5dcr5frYm1/59scRx/pG
         ExBw==
X-Gm-Message-State: AOJu0YwYk4Sj/IftHYL/tUyIsOTGjFIEQ4Umg3XH49eEQm4AJrqmfi2q
	KYp1W1GYk+bqc3YfeD0M/yWKg3MO+2c/Qt2NsvxBjmLrBQPBxrJU9GO3
X-Gm-Gg: Acq92OEz2jDQKYH5GhEV8s0fAwJoZF0OpjVdO/dAB7JvbtxqCOYVhD7ILaIbfq9B8gn
	mlD7ZWCUE34eGGwer7sU2cjmTSNBHOVNn5/iYR0m0panNveF7Ch1cEQqEQGHsoZJ5NaKkrnq6Y4
	lk5LC5YPlKfm+biJJIop50B7R8J65rUlx5ycs7dU6vfZGopnXU7IAY8U1oo9wcJdvPx9ixHHhrV
	OmsBV+o9hrKfsYFPLbigroG1Ahvaa29toeEUqixRTxVE5C9ekw+5PEZxdugg3vZshi0gl4Lu0BN
	NhgIv+1VrqxoRn7Q2OJVYGZLr378Y65zh05Kz+NEpUPK9lIngMQ7Vpbk4khMslpDHystbI+ZMWw
	b9OsJewzG3+o/2lB9I0QXGSVuyJ0PP+GL8KdFfUScd14z4QnjfWnI+ony271ETXpQI8PiWgFM/t
	EDGd3LUJnF9zMzZ2s+EolNJgjKmBykBs879sDfanyfldHcLE6hyEFQ
X-Received: by 2002:a05:6300:228c:b0:3b3:1c7b:ff0 with SMTP id adf61e73a8af0-3b497884d60mr8050475637.32.1780564694812;
        Thu, 04 Jun 2026 02:18:14 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b315esm4353216a12.26.2026.06.04.02.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:18:14 -0700 (PDT)
Message-ID: <757480ae-2d7d-40e9-9900-edd14ed3b3ac@gmail.com>
Date: Thu, 4 Jun 2026 17:18:09 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] of: reserved_mem: avoid stack buffer overflow in
 fdt_scan_reserved_mem()
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260604073611.3954433-2-chenwandun1@gmail.com>
 <20260604074520.D5B181F00893@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260604074520.D5B181F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/4/26 15:45, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The newly added bounds check for `dynamic_nodes_cnt` is placed outside the block that evaluates whether a node is actually a dynamically-placed region, leading to spurious error logs.
> --
>
> commit 6a79f526de5e1185b7c79fb469545f4094fb402f
> Author: Wandun Chen <chenwandun@lixiang.com>
>
> of: reserved_mem: avoid stack buffer overflow in fdt_scan_reserved_mem()
>
> This commit adds bounds checking on dynamic_nodes_cnt to prevent a
> potential stack buffer overflow in fdt_scan_reserved_mem().
>
> Link: https://sashiko.dev/#/patchset/20260604015332.3669384-1-chenwandun1%40gmail.com?part=1 [1]
>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
> [ ... ]
>
>> @@ -341,6 +341,12 @@ int __init fdt_scan_reserved_mem(void)
>>   		err = __reserved_mem_reserve_reg(child, uname);
>>   		if (!err)
>>   			count++;
>> +
>> +		if (dynamic_nodes_cnt >= MAX_RESERVED_REGIONS) {
>> +			pr_err_once("Reserved memory: reached MAX_RESERVED_REGIONS(%d)\n",
>> +				    MAX_RESERVED_REGIONS);
>> +			continue;
>> +		}
> [Severity: Medium]
> Will this bounds check trigger spurious error logs for statically-placed
> regions?
Yes, it indeed, will fix in v2.
>
> Because the check is placed outside the block that evaluates whether a node
> is actually a dynamically-placed region, it evaluates for all subsequent nodes
> once the limit is reached.
>
> If the number of dynamically-placed regions exactly reaches
> MAX_RESERVED_REGIONS, and a statically-placed region is processed
> afterwards, won't it incorrectly trigger the warning claiming the dynamic
> nodes limit was exceeded?
>
>>   		/*
>>   		 * Save the nodes for the dynamically-placed regions
>>   		 * into an array which will be used for allocation right
>>   		 * after all the statically-placed regions are reserved
>>   		 * or marked as no-map. This is done to avoid dynamically
>>   		 * allocating from one of the statically-placed regions.
>>   		 */
>>   		if (err == -ENOENT && of_get_flat_dt_prop(child, "size", NULL)) {
>>   			dynamic_nodes[dynamic_nodes_cnt] = child;
>>   			dynamic_nodes_cnt++;
>>   		}

