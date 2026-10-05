Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148E3478E57
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 10:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197290; cv=none; b=HtHLILyzaZgWtR4K9FiffQyAPepRzV0lgYCTR9JeuWnzt9SzjemK26lKieZN6o+bHr2PL30twN6c6HGpD86Mm+DgXFyR9HIv4zkinEZEvju7WW7jcw76JuIrfbkEigIvyFweqsUeS/qDu3mYwAJ0w3DuKwcQyWvdXXBjZ0BeMEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197290; c=relaxed/simple;
	bh=ubSttLXNMaUwsbAPAyklYDd9f5MzlxSqVoEXakDEc5Q=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8AzDqNLJSTh4hY7enw9+yI1q0n41gbpxdFcjE9yWzNOUWxynpz2K2a+3NPDyW8ZdxQ9zgl9ET0XXigKnrJ7bu6iZsGcZbE99MYLJmsBKuf7/go0BsX360DQBefhOpG8UF311f6+DHRUwbsRmx1/OWetxhhwlNzlcYhTGN3jPKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oJD1bgt2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oJD1bgt2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a1722c37c9so6144935e9.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 03:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791197287; x=1791802087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0E0kZNEEosSgGH99aMOAH+blyCZGVgX/b9FbaeaxoPo=;
        b=oJD1bgt217/c9vunsxHa4Jrx84L7wvb2tQyIM26bMn4UNv9AfMcs2DrKbuftWbK5vY
         EGPMyQrr8hZqNSLtFfr16Ck/+lvj5KIhBaDQ2XaW52goE+28yRvXDc9eXypd2+k5Tpgn
         IjeH/z/Mjg0ANQserfFCnk9Gn6HW4LYOLBh3lFITJFZHr6upD9Bfr3RhZmARp4XDdqbD
         mUlbqtpAkbu1zi+Aw9giymYk9SnItzD27mQr2w8t6rre7JUJL49KdGNQuoF8ocG92e8H
         jMas7ABmn/oUf8xQXmjG9xDbzSZwbSvvSowlV4oPlsN740q8SIo70NBTuTR02kMDU6ox
         iUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791197287; x=1791802087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0E0kZNEEosSgGH99aMOAH+blyCZGVgX/b9FbaeaxoPo=;
        b=IvdINzM9E2RsnlVS1BfucgiL5lCZp43IQ2mWaM0hkqtSXytKH3q/8adm/KOac4XIhe
         oR7T1Vt+TnA8jE1i3XRHrbiZ5PtrcOW43lyOo9U4OyUCjogYpO++AFuEMAQUUNLGpJP/
         Hs8BptFcCBg1FR1pWACWYz4OutDdQI4+H0Tm/e+OFKx/FThlIwYpvi+1gX4YNQvYH6x1
         ViQ1p3Try6qx2zuRIfLhanWF8BmDBQrV3ry3G+b5ZBxfyMC4E8sx7GmnhcYXz/lBlvFO
         FdnjTU65zCFU4Gy2iJuuFdqUdFCPm7HcF/0fPwmKkuE80H8zUlPZjHPm+CA4U3Lbpe/D
         JPTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjL4hJY590tHoO/VlBc8LkMynbRzEB2uJTTDrGsbU64KKTEroutzQUoeGn9wycbSG88V87oyiJuiU0@vger.kernel.org
X-Gm-Message-State: AFuF++nE2HYJYGqmWP+yUr2NcRXA6/lWztmrBo5+ooLwhZh63nuAkkqY
	JCURuGgY+P9rYTTU6/UOJs55fHqpP4QOyJDP85jj+gSUwQPaE/2dsGmmj40cGJMISg==
X-Gm-Gg: AYBFou2mYxBoa+ttOeVRo3AgevGMlgf9T58Xh7AvPgd92FATGxJUe4r86M4hAbcvSwX
	l53gkKCG3/qp7L3E+8eP1ekTm2keWmTlUbY24cOo2uJZfIwhlsGN7/5dg9kOwa5XG5BmY2TwWle
	PEzf+t8fe+Qe/xre06Ayd+Qo2lktJcQ/uJ+6xThlmKD7Qa5KpORPATRnDYeT+OCFmnO+mHeyYs7
	fmKC7lqq0q6ZtrWJvGB4pzi6tyOA12KH9iMDTP7lWU3IhjXcdUXYS4Y7tsgZRvXs9KfRilUNOk8
	YJOEv8W+u/SIqB4kxnkCxD6VbCUHGWSD2dEfDEqGMkCwpoK00r8iAnupTbaDd/OH59FHYmrrpNO
	TOO1lWf8xpS2r4Qf7UhJKvapZc37ts3x0AMpL7ixDDLa0LAB5CFvgiEO42YlJa0+rkMgxVWyzPY
	YNCG+Zkd+92u4CeZ02lLE7huFC7pjmkqu6qmWQG9OFKPZHnxoc30IyCiRFE4Gfl5pAsfIJJHn0Z
	0OQJjBIXtNHgaIUGc3k68aeD0RtNcr0wS/c7qkdtvM=
X-Received: by 2002:a05:600c:a112:b0:4a1:7690:d878 with SMTP id 5b1f17b1804b1-4a17690d93emr7713595e9.17.1791197286488;
        Mon, 05 Oct 2026 03:48:06 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm329471285e9.4.2026.10.05.03.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:48:04 -0700 (PDT)
Date: Mon, 5 Oct 2026 11:48:00 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Will Deacon <will@kernel.org>, brendan.jackman@linux.dev,
	catalin.marinas@arm.com, rppt@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, ardb@kernel.org, thierry.reding@kernel.org,
	david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <asOAYODGZa-7EIV1@google.com>
References: <20260921110050.3977591-1-vdonnefort@google.com>
 <arIYtjmSKCs14SqO@sumit-xelite>
 <arKW_91EeKA-w96m@willie-the-truck>
 <are21BjeS1O3RYE3@sumit-xelite>
 <aruh86rd5FMv2i9G@willie-the-truck>
 <ar5TPvANFUoosxGW@sumit-xelite>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar5TPvANFUoosxGW@sumit-xelite>

On Thu, Oct 01, 2026 at 06:04:06PM +0530, Sumit Garg wrote:
> On Tue, 29 Sep 2026 at 12:33:07 +0100, Will Deacon wrote:
> > On Sat, Sep 26, 2026 at 05:43:08PM +0530, Sumit Garg wrote:
> > > Looks like you dropped me from your reply.
> > 
> > Huh, that's weird. If I hit reply-all ('g') in mutt, it moves the entire
> > CC list to To: and drops you. I suspect the same thing happened to Thierry
> > when he replied here:
> > 
> > https://lore.kernel.org/all/arJcN60nagFKXj2Q@orome/
> > 
> > I can't figure out why that's happening :/
> > I manually tried to fix the To: and Cc: lines in this message.
> 
> Thanks.
> 
> > 
> > > On Tue, 22 Sep 2026 at 15:55:59 +0100, Will Deacon wrote:
> > > > I spoke to Brendan at LPC (?) last year but this doesn't really work
> > > > for arm64 because it relies on being able to unmap arbitrary parts of
> > > > the linear map, which isn't generally possible unless you force pte-level
> > > > mappings for everything, which is prohibitive for perf/power.
> > > 
> > > As per the cover letter it's about allocating pages that are not present
> > > in the direct map. This essentially fits the protected DMABufs use-case
> > > where we don't want any kernel mapping to exist at any time. Bufers
> > > allocated from protected DMABufs are only meant to be accessed by the
> > > TEE implementation or HW accelerators like in the secure media pipeline.
> > 
> > That sounds like it should probably build on top of this series, then.
> 
> The main problem I see with this series is it tries to move from the generic
> CMA allocator to a reserved FF-A CMA pool which again comes from the
> DT. We already support reserved pool allocations via "no-map" which are
> discovered dynamically from OP-TEE.

I can't think of a way around a DT declaration. We need to know what region is
PTE-level before the direct map is installed and of_reserved_mem is very handy
for that purpose. And as this PTE-level mapping is costly we certainly only want
to enable it for platforms that absolutely need it.

> 
> If we can rather support a generic CMA like allocator for arm64 which
> can support unmapped allocations then I am all for it. These platform
> specific reserved pools isn't a scalable solution.

What do you mean by generic CMA allocator here? An extension to
shared-dma-pool? Or having the CMA automatically doing the unmap/map on
cma_alloc() cma_release()?

Right now I have created an API for the unmapping/remapping part. It adds a
burden on the caller, but the alternative solution is introducing post-alloc
pre-dealloc callbacks in the CMA, which looked a bit overkilled to me when
the users of that "ffa-pool" are only optee and the nvidia video dma-buf heap.

-- 
Vincent

> 
> > You could allocate the DMABufs from a CMA region that has no linear alias.
> 
> Allocation from generic CMA pool is already the case here:
> 
> tee_shm_alloc_dma_mem() ->
>   dma_alloc_pages()
> 
> Do you mean it's just fine to unmap buffers allocated from generic CMA
> region since it doesn't have any linear alias?
> 
> > 
> > > > Vincent's series tackles that by using a pool so that only that part of
> > > > memory requires the pte-level mappings in the linear map. That's the
> > > > whole point of it, so I don't think it makes sense to drop it in favour
> > > > of Brendan's approach (which doesn't work).
> > > >
> > > 
> > > For protected DMABufs, we even don't require any pte-level mappings in
> > > linear map. The whole idea of mapping and unmapping is just a bottleneck
> > > for performance sensitive secure media pipeline use-cases. That's why if
> > > we can support __GFP_UNMAPPED with the memory allocator on arm64 would
> > > be the best fit for this use-case.
> > 
> > The point is that you will require pte-level mappings for the linear map
> > if you want to unmap from it at runtime on arm64. If you don't, then you
> > can end up needing to split a block mapping (e.g. pmd-level) when you
> > decide to unmap only part of it and there isn't a safe way to do that on
> > arm64 without transiently unmapping the entire block, which can lead to
> > fatal translation faults during that window.
> 
> I agree with you here, what I am rather trying to find if on arm64 there
> is any possibilty to have a generic allocator for unmapped pages. That's
> the use-case here as well as what Brendan't patch-set was trying to address.
> 
> > 
> > > Now the question is why arm64 can't support __GFP_UNMAPPED similar to
> > > how Brendan is doing it for x86?
> > 
> > Because arm64 != x86? Presumably x86 doesn't have the strict
> > break-before-make requirements we have on arm64.
> > 
> 
> Sure, sounds like you are eluding to that the generic MM flag
> __GFP_UNMAPPED being proposed can't be supported on arm64, right?
> 
> -Sumit
