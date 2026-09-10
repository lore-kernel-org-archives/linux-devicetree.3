Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0555F463B6E
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037726; cv=none; b=nRvFBuUpe3nKUSOxNJU739LZH5FWC4kSQIPiuOO5ONx+yMMwwzZ9CsfEnqualuH9kQLz7FL0BjYbiN3gX07DLPPEXyEgGH/p/NZJrG/dGnZNSjjjiH2ZoM/3G4OJbR0s5NCTKtVVY1jkUfgEFlebkmK+ADF4NzgtFfVAlbfTfoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037726; c=relaxed/simple;
	bh=1NyCcixVrXL60MDlTpGIFvmNay2sIq1Ok+sWjQ5AMxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mEFZ0DX70QwfymdhIk30Yqb18aZPAEb4NcEILpQf8okHKBx8tQ9reLKB9i0+oMzwEvsEYV6R/DwebGjNOw39H0eKf2bS9aAMqLshPJQ8bDmr6GnOKDfYaPbpcowjnyhs6d6Rp5vZ5XmfwVjzyYhxF+i6SeB7D73qavwqDRI0wS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TplkauLe; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TplkauLe"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-38fd9408220so1998258a91.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 03:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789037716; x=1789642516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/lsWiPytaCYG5VQwzNu/fNcbbKarnBsAuYB2BQ7P9w=;
        b=TplkauLeUN8EE/NyAJDEHkz5dh7EISNKsX1rXSX/8DugajgRxytxtP/Kj9aMPWOFNL
         l95eQmKyPHsiiLl3TIWLSAe37AOZx7JrEKnTlWDjTDF6twnW5EMNMnVyg1WIU+aHKjxW
         4gIKk89f6ovOxQvdGyjZEcSVgYoj+/j7EZKH8EvHbjcSWo2QUwY67GQsODcAGqarjFVP
         0/ZJQJI6wC4B00yb14S4hadQlrvvj7uIZ2raem/zbSK4Y/JwXPo8hlN5QDHG/VwCyu9h
         uUHKwJmL9zh2p0edSrtncCabvFYFY+iPyseLhWXX6ZGT+SIc8/8K4h+wjI/QN+b2vImY
         K/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789037716; x=1789642516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/lsWiPytaCYG5VQwzNu/fNcbbKarnBsAuYB2BQ7P9w=;
        b=fhKLkwlbOuibK9wQdr+aRqsMsM3CwsgQbXs6xWImasFEdqxsbwMyZRKZO/CB/gBA2Y
         6EYhqoZPC4fw3ML+B1kzLlpbH+G3L0GIqW8DgkNuGC7SxI2+kFTiKEcjjP3wYrnMBigj
         Md6057OS0CeQh+KFceRWJWWTAfR9d8ixI9f1P2buGxjSShaRyfUaNA3HfS7edA1Tb98d
         oVpFGB4jM27DcJ8vIBr34smlt4ddeu2CKqTjISWLXafBF8f51SqAhRceqpm+npMIiPRY
         4noPQB5A92a64K4GywT7UtZcV5KP2ZUfxfSTujGdJxIm+JNnGuOXx9NqIlus4Rtq+G6A
         gYyw==
X-Forwarded-Encrypted: i=1; AKwUvBydgNsq89Kj3dJ1Srruu6bhaW/Q7/tioMf3IibD6APzDD9Gud/5VmmpzemIDHVE56+oH7098GnO557X@vger.kernel.org
X-Gm-Message-State: AFuF++mzmpVy0+Cqh9c0puh3WVJxqqQ8g2+SXwKkgfFkewRB5j8Nd8/V
	BeGANT3i4pRpPkBirNY4+rI7uePKCw9ooRUX5J7rblALXMUKtYEM7AU5
X-Gm-Gg: AYBFou22r1Pwu0u7I3S2B1FLTuAQea3rtLessMgFepQAOjCuVBvK08Ja70nZ5GlPm8H
	on93JqBmPL2h+itv6Ej0Zf0gGH4fbe2HlR8zIONHIoVnPF3Uwjp14bhS2UBoIS0Fd9oHYwoK6j0
	8bQvPh6XA/e/rwxJuMmBUwXUIGyrzGYkGYp8LmjH8pIipNuuRWFvS5r11yUCzyt43cccpYVDUnv
	nE4VXMXfv8F0FuDBvm4dSW2OVcYsWrTolrEChJtO5tuYWUih1P4Gj9V8LaugjE+PqAsJ/tkiljn
	mon9DwSU+Fm8OQgNcAgouYOJ22i97wAzuk5svIL+eQdOKpMx34XIrmj10Uf0sF37CKYDZJ/YjGu
	PyBkDZSdIKBl4bojGiyynsOHJelZfl3h+dAj2ta37ulzE6cViNK61r2W8LSSHWcl5Hk1wEV9fi/
	YloGpLr/nc/j2iqdJafesVGxgiGcpEiOjf7ZY6i6i77D42UmbOudXoWs/CwfNdHXcN4DufbvGQz
	fdJwFZBdR5xpBq5bQ==
X-Received: by 2002:a17:90b:4c44:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-39b261cdb38mr58067406a91.13.1789037715868;
        Thu, 10 Sep 2026 03:55:15 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77611asm3990224a91.6.2026.09.10.03.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 03:55:15 -0700 (PDT)
Message-ID: <7dd9e1c3-ddc8-482e-a560-e8dc4f2f0aac@gmail.com>
Date: Thu, 10 Sep 2026 18:55:08 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] of: reserved_mem: skip init for regions whose
 early reservation failed
To: Marek Szyprowski <m.szyprowski@samsung.com>, robh@kernel.org,
 saravanak@kernel.org, rppt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
 <CGME20260818092438eucas1p20115e5d33908e32ef4433cb246da8098@eucas1p2.samsung.com>
 <20260818092420.2859026-2-chenwandun1@gmail.com>
 <72074a49-2963-4f96-b939-79bf95a829cb@samsung.com>
 <af87036b-0809-4880-b088-545780b4d963@gmail.com>
 <7a964778-adc3-4186-9122-3858bb61c372@samsung.com>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <7a964778-adc3-4186-9122-3858bb61c372@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/4/26 16:49, Marek Szyprowski wrote:
> On 31.08.2026 15:04, Wandun wrote:
>> On 8/26/26 21:14, Marek Szyprowski wrote:
>>> On 18.08.2026 11:24, Wandun Chen wrote:
>>>> From: Wandun Chen <chenwandun@lixiang.com>
>>>>
>>>> __reserved_mem_reserve_reg() discards the error from
>>>> early_init_dt_reserve_memory() and returns 0 unconditionally, so the
>>>> caller counts the node in total_reserved_mem_cnt and the late scan
>>>> initializes it without checking whether the early reservation actually
>>>> succeeded. A region whose reservation failed is then handed to a
>>>> device assuming the memory is protected.
>>>>
>>>> Propagate the error so failed reservations are no longer counted, and
>>>> record the failed nodes so fdt_scan_reserved_mem_late() can skip them.
>>>>
>>>> Recording the failed nodes explicitly is necessary because
>>>> fdt_scan_reserved_mem_late() rescans the DT independently. It cannot
>>>> tell from memblock whether early reservation succeeded.
>>>>
>>>> The failed-node array is bounded by MAX_RESERVED_REGIONS, the number
>>>> of static regions is not bounded by it, so on overflow the extra nodes
>>>> fall back to being initialized, which is the current behavior.
>>> I'm not very keen on such partial solution. Indeed we have no place to
>>>
>>> store the result of the early init call, but we can check if the given
>>>
>>> region has been earlier marked in memblock as reserved or no-map in
>>>
>>> fdt_scan_reserved_mem_late(). If those attributes don't match the
>>>
>>> region can be simply skipped then.
>> Considering the later patches that reject reservations for overlapping
>> nodes, checking the memblock state in fdt_scan_reserved_mem_late() may
>> produce false positives.
>>
>> For example, if region A is reserved first and region B is a subset of
>> A, reserving B will fail because it overlaps with A (in patch 02/03).
>> However, during fdt_scan_reserved_mem_late(), B will still appear to
>> be reserved because its range is already covered by A. As a result,
>> B would be initialized even though its own reservation failed, which
>> is contrary to the intended behavior.
> Imho the overlapping reserved regions are some kind of configuration 
> mismatch and it is enough to detect them. fdt_scan_reserved_mem_late()
> can first store all regions to dynamic reserved_mem array, then check
> for overlaps, and only then initialize those, which don't overlap and
> have proper memblock attributes?

Thanks a lot for reviewing this series.

I did try this approach, and it looks clean. The overlap check works
well for regions within /reserved-memory. But there's one case I
couldn't make it handle, where it seems to still produce a false
positive, please correct me if I'm missing something.

For example, region A is reserved before /reserved-memory nodes are
processed. A is not a /reserved-memory node, so it never appears in
the reserved_mem array. Now region B in /reserved-memory is a subset
of A. At early reservation, patch 02/03 rejects B due to the overlap.
But at the late scan, B's range already appears reserved (covered by A),
so it looks like a successful reservation and gets initialized.

The root issue is that the late scan can only tell whether a region is
reserved, but it can't tell whether the reservation was made by
/reserved-memory node itself or by something else. Maybe we still need
to record during the early reservation stage.


Best regards,
Wandun

> 
> Best regards

