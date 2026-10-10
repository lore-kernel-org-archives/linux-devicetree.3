Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5F73655F5
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791614418; cv=none; b=ctCg4VsdA5S0OmR2JUx0cBNMSrVCmiv96phpbwxDJTlAhZorqioj5v/yO5EzlXcijpYrHGxMhrCgSHo4CeBeBWDQTmFX9owJZaeh05kfyVn/hEkUfIQ9161K0uTK3RbGQB1jTExULRZDg2c8bAFJH5R/EFODWzNvY9R6p4Wq72w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791614418; c=relaxed/simple;
	bh=x8Cff06Tv8gURCR4EEWfNk+YjhvlG4mM5mfIrfMm9Ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZxqQ30flT8DXQC8yTFSPmyZKwFx+AA5SMHqCvqWPzUyPnc215dwzNJsyQL/txsU/SuJJCiIqYuXh1RbnNgDKD84ayOu7h6/3UP8tj8u9waVMCcCLdD1bPdl6JELsgI0dZhzKIprzdYsrMUa9Sbd3PIi1UF2fCO7I/F3yfbU1Z1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H82HWy4M; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H82HWy4M"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-3ab86ae9b80so100389a91.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 23:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791614416; x=1792219216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlbA3upGwk044fKBz43T5VJDihz4e5V6S7+qAUQy3Tw=;
        b=H82HWy4MneTfxHnhTsKHKny8qvP3ofRAM4i/vesekbzXkEE3Kte1zUcLHSvg7L9rqA
         lKM2Hu12HDTZ77RZL8C7rg0ep5pEF8eyTl9FgaH3ncRIcZH3lN+UwYX+/NocWyzvp/RJ
         RT73kXDBW9UfX9586AiOd/nnbBXjz4eZrxxAbSiRuB7okvj7btS9MS3bSgfsQ5gjz8EC
         EsYCw2ptESwscOJiCsVuWekfar6FVJBkccwHcWzc+1mgJuwFZUW/VLodKgo5+DVzYfOr
         WxMMZP5da11s/xOMyub9nBz/jiwH+fcKfbNpxLDWz199yRZasxzJM+lYUKKiU/oqP5x6
         S2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791614416; x=1792219216;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KlbA3upGwk044fKBz43T5VJDihz4e5V6S7+qAUQy3Tw=;
        b=eOCzFWBJkKlzOzqHhJBxmbLLAfvmPdg7p8k9jHR7J37BoaR7s54dA5Splq6dB7VhFK
         1hswMs/ZlpSycfOG/Bj+yrnTFF5MvK4dnz6diDtfgyvhOjSHjztxn53zLfi1Rk2XmTr/
         Qo9Kn4k4AFxwMuI/81vTBi8HB6TZRRTO5zd2iSR6WZ7PtzC6FflXqpkmYiTqgJN3PuzU
         2r5Z3NVs6os/8RgQFSLEUAz41TlU22rTBNfWXL5reaNf/cFbgI3Mv3qLbJsrSfH/iBuh
         XB+uzJmb0D5i+En+lBjlM/zwqkLsSLxD9nHgLhDtdBIZ1UXPpTar6UQEUpGb3Lxc8cOK
         7HQw==
X-Forwarded-Encrypted: i=1; AKwUvBzBf5qekQ3w/081x4FuSwfJq6j2JFA/pC/tLZ4YcVx5xbAvhV3p3Qtor2OIfEzFpT1lTG+go+WId2QL@vger.kernel.org
X-Gm-Message-State: AFq9FYIhV3ixKfmAS11fpfKOrRWHHUbnubuyNVdZW59sRX9FMJHDF25y
	VQiLX56ElmS11LbydzB9qq2psdJbBZcOGY026F46o6P/wsHAHopuDJ9i
X-Gm-Gg: AYBFou1jeXNAnRkVmwbo82o8X3UMoYZeXY2sr0GMUH0f3NbQ7Nvtde3YG3rum5s20wd
	kJH/FpmFP+5zjCZ4GMAlgvcgfcCvEKP5tM5xJng5I6o/eegwA0ClqdwSfZm2nwkgY3u2BfQb/uh
	tPsFegivAKTH77UoPOGCervpH0adGGV1G7OLSsQBK0kw64BVhtaVCp44r6Ke29tUdJPyDZ7CvVA
	AyRqaOKEQADsgVOuk30yWYNdLX8JliMXFo12rqmAKgiQ9o6PPTHQBOzt7GBTjwDxQLGDsGgMEf0
	OJJ7tWi4yhiAupfCDu/AABufyZyKlwo0iwnVpMtebZZ3J8HgHEZ/ZcFv+YFu3id2lH6lYqFX+tN
	Sp6i8hkef4iLrJGFh682zbOJjdkPRehbl3w8o4jOC4eNmWXSdwLf/vHnOXldOTfEsVy6rbM5NDl
	9/23c3Nh/gVJe5xht2xVfrARuwytis8kR2RwY2Zo5cFlgYnhBYj86GBf7bM0EwXnh8JojeysKMq
	Tzhcg==
X-Received: by 2002:a17:90b:1d4f:b0:3a8:7242:e8d3 with SMTP id 98e67ed59e1d1-3ab3a2910f6mr3570924a91.7.1791614415817;
        Fri, 09 Oct 2026 23:40:15 -0700 (PDT)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3962f771sm3150080a91.2.2026.10.09.23.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 23:40:15 -0700 (PDT)
Message-ID: <42cdc3f4-95f7-4efa-be23-b3fafae84109@gmail.com>
Date: Sat, 10 Oct 2026 14:40:07 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] of: reserved_mem: allocate and map the
 reserved_mem array early
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-mm@kvack.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mike Rapoport <rppt@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>,
 Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20261008152403.766439-1-m.szyprowski@samsung.com>
 <CGME20261008152450eucas1p1d5517eadc2c1d684ff6d4ddc010f6331@eucas1p1.samsung.com>
 <20261008152403.766439-3-m.szyprowski@samsung.com>
 <a8ac6daa-e721-4cba-bef3-3333643db23d@gmail.com>
 <81d6c6be-d03b-4fa8-be30-1425c4d1ad40@samsung.com>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <81d6c6be-d03b-4fa8-be30-1425c4d1ad40@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/9/26 19:27, Marek Szyprowski wrote:
> On 09.10.2026 04:16, Wandun wrote:
>> On 10/8/26 23:24, Marek Szyprowski wrote:
>>> Get rid of the static, limited-size reserved_mem array and replace it
>>> with array allocated by memblock_alloc_raw() and accessed through a
>>> temporary early_memremap() mapping. Such mapping is needed for some
>>> architectures (like ARM64), where linear map is not yet available during
>>> early boot scan. Having a single, writeable array with all reserved
>>> regions removes the need to perform two step initialization introduced
>>> by commit 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved
>>> memory regions are processed"), so all regions can be processed
>>> directly during the early scan again.
>> One concern about the ordering here: the new memblock_alloc_raw() for the
>> reserved_mem array runs *before* the static ("reg") regions are reserved,
>> so the array can be allocated from inside one of them which makes the
>> subsequent static region reservation fail.
> 
> Well, that's what Sashiko already reported. It will be trivial to process
> 'static' regions before doing the reserved_mem allocation, but this in turn
> returns us to the point of not being able to handle their reservation
> failures. I wonder what's worse...

Indeed, every option has its pros and cons.

Could we reconsider the approach from my v2 series [1]:
record the nodes whose early reservation failed in an reserve_failed_nodes
array, and have the late scan skip them.

As I understand it, this handles the vast majority of cases. And if
the number of failed nodes exceeds the reserve_failed_nodes array size,
the system is already misbehaving and the DTS configuration itself
needs to be revisited; even in that case, the v2 approach behaves exactly
the same as the current code, so nothing gets worse.

Also, IIUC, setting a memblock flag may split memblock regions, and since
memblock cannot resize before paging_init(), that would increase the chance
of a panic.

Best regards,
Wandun

[1] https://lore.kernel.org/all/20260818092420.2859026-2-chenwandun1@gmail.com/

> 
> Best regards

