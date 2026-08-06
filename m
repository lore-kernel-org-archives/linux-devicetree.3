Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC259468C09
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 11:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786016888; cv=none; b=U3CsnJNY4XO5p3/esBkQtGAaLs/SvDuAkPW17c7zNfTxaXwugftaA2G9wd21qXRG7YUqrTHCRo5XgYxr2H8XLyid4rWsAFaFq/l9UP/r1yiq6kzNXzenn0EUdMZKWzMY6gJ3LBMGt/Oz0zhuRfYOj9EQ3bKEL4/1ybi0VATJ6MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786016888; c=relaxed/simple;
	bh=AfagInVYM8gAh9w0VoONI52XecLbRcbGI4KUe8vgmRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IV8mgsimpRH8B/hh8lLadbR6o+Q0QUC7v8T3srIGS46CA+Ci0vgCkH2B7V5w9P1kZVH7+TFgdhUDU/h2+J/dw9ovoyVRFc/mp+fMOwiJi95b8WJ5VK5dWg7jtgtsC9QeP/aIaqvjW2NVwVkzfMliuRTbGynoZ56LPcqC88vD+Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U986ksZt; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U986ksZt"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cbb818e57c9so1134662a12.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 04:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786016886; x=1786621686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jTa6A1M2H+9bU9KnW8JJI6pSOlN/z7qEBlNWI2ijSbE=;
        b=U986ksZtaXLsQfWtbRf5NIXdaH4zlznafsEouQ1GGW8bC5tbpFgBbcxv5n6jnxJbBs
         8zlPbiheqi02tp+FOXofh0Iag8oW6PRqOGQGpwtrWGXyiBA7bzI2AJYCKUvVsv8tmV36
         J/OaU6Yro5NTu6wSozCha9SIQLJgXQJZ10XQY+6cStKLB3vyolXDNWx6szciKkCDW5R/
         njZfEtu78VGeEBmv8TufxPPaS2K/vPpXesIVpHAwcXTbNU3NIFRgQ/BlUZQCuDXO/w3O
         30zbw+HjCV1I6/AQa1eKxJHlSvhybyXDWGRpfPyNJ+/FRLHQRppL+ZxW269Z9J4uWUOw
         fLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786016886; x=1786621686;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jTa6A1M2H+9bU9KnW8JJI6pSOlN/z7qEBlNWI2ijSbE=;
        b=dM+pXWJn5hy4DWQBa+nnq7REpO3IgSlFZO4Eatg8TT6XSp0gYLPk527CaB94Va431d
         ZDSrvRQzZ1l8lK68Cyg5wxMa9hCYzhDzWem+eFdX455YIA0wY4PaHK5nPXf5BuajIsMH
         vwbUZclabmtLFuqJ4B0GnDGjCF07k4wvP80sc3ZxN16rX3ac+j+P/qcoTc/TormF3Rpj
         Ie9R/CQhAVmg0sZr9d0jU8wglrPwexvUKhLBCSJDvsiGXOt/BOy6zyagNu/vpg4hQHR5
         Oj4oGMPJVxHq4xoM7JOr8T97mXq6DhSU5rewzKpA93AZ2ulZvRti+3pOjvgu3glMqsBk
         V9/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqYfmIBa9wMDL1H49TvYUq+eQ/TqN1UsPIpGqE5Yn75IKx1WnZGAp7SGCL2PxDabHAf/FL93o7baAFR@vger.kernel.org
X-Gm-Message-State: AOJu0YzH/6+6NCh+9UJI2wChJ7VCU/6Vv+78ZXeP4bjRBs+qJHA0ixLA
	Xv7Cj8qK1+7ceRhkSUMj6Lz6SeUCWs9Z7DPN8KWqyD1+pxtyWXJuu4dy
X-Gm-Gg: AR+sD13gZp863c2sRpgz/IwprXwQ3XqM2L4ixTPGN0qmjZ4UvndLtMLzUSDTG3FY/qA
	1hUbhXmdoR/io/WckBkYS3jwTH4N4lDJzIF7lRh1kfP5e23h9RlrRjERKQcnZE4wTXIZisFiWXW
	R+uus5T4sH9ja7nkW1iMk02IWAwDmpDq5QTlRIRQv8zfUeiLR3p6EFG+mpPdm0AX9xmAT/16eKv
	9yeuIAW4r5f63oa8OR+XudBH3UABXzfcrtFYy7RVx6juR6VLWUz/nptEO+UlEj2kCck9LtAD7C5
	Vr0wUW6qskhjCtt+wyJL3JbAwZNjjWXgGe7EWpXwMKRXYdYkhTlS6uJjScsslHWTIpJOPSPxsO1
	OVamkDwoC66Xiwvj561b7r1WYx0gCK8jGVnQKClvtXLdyg7luzSyh7X8kssa9xm8Rsh3kz4dgRl
	NF5NeV2dSDligPx2XofU9bTfjkxC2O92Ua06shM4u+jXDViIaW0YbuCfKrHtQRx2H3uwxf
X-Received: by 2002:a05:6a00:2e9a:b0:848:6ba2:4139 with SMTP id d2e1a72fcca58-84f2e0dbe21mr14854028b3a.36.1786016885959;
        Thu, 06 Aug 2026 04:48:05 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f459ba3ebsm1238852b3a.46.2026.08.06.04.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 04:48:05 -0700 (PDT)
Message-ID: <200a2b10-9f71-4e5e-9908-349c0c711073@gmail.com>
Date: Thu, 6 Aug 2026 19:48:01 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] of: reserved_mem: add dumpable flag to opt-in
 vmcore
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
 <20260806093519.2907771-3-chenwandun1@gmail.com>
 <20260806094742.356B81F000E9@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260806094742.356B81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/6/26 17:47, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Incomplete implementation and write-only dead code: the `dumpable` flag is introduced and set, but the promised kdump filtering and overlap checks are missing.
> --
> 
> --- Patch [2]: [PATCH v5 2/8] of: reserved_mem: add dumpable flag to opt-in vmcore ---
> commit 873defcf6278254b5c39d8d3500f986e38a79da0
> Author: Wandun Chen <chenwandun@lixiang.com>
> 
> of: reserved_mem: add dumpable flag to opt-in vmcore
> 
> This commit adds a dumpable flag to struct reserved_mem to track whether
> a reserved area should be included in the kdump vmcore. It sets the flag
> for CMA regions to true in rmem_cma_setup().
> 
>> diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
>> index e8b20b29fa68c..55a67cee41ea0 100644
>> --- a/include/linux/of_reserved_mem.h
>> +++ b/include/linux/of_reserved_mem.h
>> @@ -15,6 +15,7 @@ struct reserved_mem {
>>  	phys_addr_t			base;
>>  	phys_addr_t			size;
>>  	void				*priv;
>> +	bool				dumpable;
> 
> [Severity: Medium]
> Is the logic that checks this flag missing from this patch?
> 
> The commit message states that non-dumpable regions are later marked
> MEMBLOCK_NODUMP, and that the flag is used to check for overlap with
> /memreserve/ entries. However, this flag appears to be write-only,
> as there are no corresponding checks or calls to memblock_mark_nodump()
> implemented in this commit.

Not correct. The checking of dumpable flag is in patch 03 and patch 04.

> 
>>  };
> 
> [ ... ]
> 
>> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
>> index f754079a287d6..63ff134dadd42 100644
>> --- a/kernel/dma/contiguous.c
>> +++ b/kernel/dma/contiguous.c
>> @@ -565,6 +565,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
>>  		dma_contiguous_default_area = cma;
>>  
>>  	rmem->priv = cma;
>> +	rmem->dumpable = true;
> 
> [Severity: Medium]
> Does setting this flag have any effect?
> 
> Since the promised kdump filtering and overlap checks are missing from the
> code, this assignment currently acts as dead code. Were those checks meant
> to be included in this submission?

Not dead code, the checking of dumpable flag is in patch 03 and patch 04.>

