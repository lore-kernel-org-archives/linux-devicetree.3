Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADF43CB565
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476589; cv=none; b=KjMjuVitRah5R9HeVSN1rphpdaJ94qlRDkAYEzKKrJe5Su/vCa5rCvGnPCMhWdOL//9cE9svIe7ZCSxZ7xlAAxGHV2R9rvgfIWo5w0HLBssMRYa59LHKwhkAjarRBoLcaYe1ftj+36gRc19HAZ6jXUYmR7PwVBGLqGBa8VVKNho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476589; c=relaxed/simple;
	bh=ui4ICGb/kqsSx5sis20c9sxB7gn9IT8brWRsdIH3KRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBY+VJzFnyyu43psQUSLME8R8fZGjlmoNdSwsVNLOzzI7hffYdeJiaKOrnh1727iiVyB/2bo1GZaqJrQVSlKRLzfGw0YX0yAecBA2mkWSQFHg0+97DSFrUMPtzQIwuTetuaHq/Oapr/Bosvwm/Q2PUdjP0YorSn1ugQ2OmTevLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qi9v+Eej; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qi9v+Eej"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2dae660f31bso31695275ad.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476587; x=1790081387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mP8qopDle1Sc4k8F6w5GND/XUp1RUEWcrZG95tdjUPs=;
        b=Qi9v+EejoaESJfqg0DxCAhJ+vzmv2U5tRMMcu5gUEzephwpDPIbHfDdqG7Vr2UADsy
         o+whucndZgFuG+nbe7gYKarCTPxZVsbYkj1Z0xcbpeqrBH8dzVWBuD53/JyVzLo7TTU5
         12Doywp/58/OFqaCDuBKwISw4mDFbiz/acitsXgVO2UidiuxTZTnmF0+rp/iJF6FogWz
         ZMOX7G5qkfi5fFQGsoCm2yU9wfYekV0yfMJ6fxtRkfCyb6+NdQXiYGOwCIlYZxkWSwH9
         jQd2iSaSOzzYjtdX8GVbsfUF/i36KXtnuCx61hR5SApsS2sYhbhPWPTeP34hC6zT3e4w
         KIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476587; x=1790081387;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mP8qopDle1Sc4k8F6w5GND/XUp1RUEWcrZG95tdjUPs=;
        b=n1imtEJ915zVzGtAWS3DRgt1zToWWNRBrVpeI9TJ0nGjY+WagxBIf2LLG5NWzw7R0w
         /t1AZCjvcvLZJqDBI+lTEfjXrG/doIUu/X/iuHVNvd7RZ0l3avQa9r4k4SF20cYJHHpw
         dlK0FyvAIB2APp8ImAbUPYf8Ys0kLsVFFGR3xIOUHNNicC8PkkbGKaHZqxTgGBKiBdio
         v5fVU1HVpDzTPS0e7Ge9TvxyzNKhOfTH/kcuHtiu7fUAx/JjWPHYYspptRKzrK3uvRwg
         bkDL0d1zRVgd/m48wAe88I1AzVVKUr1MFXDwuEdmBme9pgzHfsqnXF6HmBaxpoAN5pY5
         OiiA==
X-Forwarded-Encrypted: i=1; AKwUvBzvuh80GoTZWYX8/3KZCZcEVi5oy7zj3BawOOrVDtfBpoMRh7VOekL/yXR1xEt2eBEMJ052KhmsWxsD@vger.kernel.org
X-Gm-Message-State: AFuF++m101fZupMJUBIPvE3lneK1oSrSy6mOCAVveIY6BfPWVP7xKqwX
	LOI0L6uAJ1JVBmHL7Dr5r9+kqyj1NxSGC+LZy6u3lK90qLzUdoCFq0Pd
X-Gm-Gg: AYBFou35j8czUTuV9BH2++ubOA7gJcLLf5eHX6gLZYQSPF9xjJsUKLiN2dCW17swGuh
	e4EifZcUrFnmaXCiAsrPLczbZyugDFHr6joEw+Lnr3+FRQUP+JJ0Bq73ZixQ6npUJE5AS9RFyxl
	/xe3BfcCVTHp9ZgZEO1idBU5cQLUEHznm02Pf3Ux1E7P3OtVVsRQ+QTDbJSheUM682ncxjnfKAS
	/3lQRxbiEOTfGkCpL5+ei+jpKjcFXOUKUK2XCjOZ4SpMbIJUgbUhoTukiC524MopoRVuneaGk3k
	CnCywFYZFtOcaNaybAY6m0a1H5naYYzL3jp8QypfWgU2uEwTd9qn0VXOARtK2B+gNgHDqSghInL
	Dk4m9m1Y72QeFV0BzcbJxZHlWfmhQNBUMcFywW/dUswDaiyc1TQAjICdbXP9EkZU9jrxFlPT/pa
	Nd1Dw+B0b8MB1z66xApWF8QqfyoJrTg91Duyxi58oP9hxuAyQx8vZAsA6JAU6Kn7cpvGt1inx24
	Z1ig0w=
X-Received: by 2002:a17:903:1a0b:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2dd6c7134b4mr167097285ad.17.1789476587316;
        Tue, 15 Sep 2026 05:49:47 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd6f8ebbdfsm26424855ad.38.2026.09.15.05.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:49:46 -0700 (PDT)
Message-ID: <86a09d26-2de8-4590-b135-31564e2c7049@gmail.com>
Date: Tue, 15 Sep 2026 20:49:32 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/10] mm: memblock: add missing HugeTLB flag name
To: Mike Rapoport <rppt@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org,
 baoquan.he@linux.dev, pasha.tatashin@soleen.com, pratyush@kernel.org,
 m.szyprowski@samsung.com, mark.rutland@arm.com, kernel@xen0n.name,
 alex@ghiti.fr, hpa@zytor.com, ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-2-chenwandun1@gmail.com>
 <178936321614.3691424.10386784926753862087.b4-review@b4>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <178936321614.3691424.10386784926753862087.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/14/26 13:20, Mike Rapoport wrote:
> Hi,
> 
>> Commit 7d163a75f821 ("memblock: make HugeTLB bootmem allocation work
>> with KHO") added MEMBLOCK_RSRV_HUGETLB but did not add the corresponding
>> entry to flagname[]. As a result, memblock debugfs cannot report the
>> flag by name.
>>
>> Add the missing RSV_HUGETLB entry.
>>
>> Fixes: 7d163a75f821 ("memblock: make HugeTLB bootmem allocation work with KHO")
>> Signed-off-by: Meijing Zhao <zhaomeijing@lixiang.com>
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> Link: https://lore.kernel.org/lkml/20260821020910.3428585-2-zhaomeijing100@gmail.com/
> 
> Can you please send this as a separate patch, I'll pick it to the
> memblock tree.

A separate patch has been sent.
https://lore.kernel.org/lkml/20260915124641.2498280-1-chenwandun1@gmail.com/

Best regards,
Wandun
> 

