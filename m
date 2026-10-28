Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199043;
	b=QB/vFh3zTX7lyrb3+MVbdBcvwQbCbf8munJGnoIXmd+zU7kD+jGskkG04xLZ/3O10Lap
	 DmBKUxyAc97xyk2bLdYArOlvWRgXU6ugYu+UpimR+xx4P7d0QEhp2XNFNagqqXnvGculi
	 4p0JP5cmJ4g/NatswBjQA8DbU18KoWcRHch95Lmmow+Aj0bEpaw3p0zmAvOQ0vSvUI2eO
	 9B69IQNTbU3RO8dz9T59vWaJO348vRHiZJDNFD7tgMdbO0fmMOLywF8FBHL6hJFSb2GiR
	 k7XZMojO8vRqP5KBDkiA3KJk0awfL5mbuIWRr5JaCr2j+PfjmOjFoXpGvt+B+G+SfIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HF1altOhSOliHgMv/AZ/rbBGnqwe/0k0dVHlSjsTcys=;
	b=pA0nJrj7o3+jZL6S/QbP56yN+8Tq1+kx2DyhSVtGXqU2nPonYOW72uqeU1vb6WnThg8D
	 9TfG1CLX4lfALohscqVxR0tdIvygLJMGeHkkkUMo00yEN2KAq1I6G47drj2+Fh3+GtnTr
	 syD0Q3g9JWS/vwQT5Mcbo8BhYuB9/giaUmIbIEjzGhDEg8z/cHXMeRNxNUQhPM5uuCqmC
	 OoCd9IHIQM1OqNSIlWi3FVK+bERgJMkJP9fKU6UvAbFXTqrf2yaSpLnT2/FJAe+LKlQij
	 2QZFhwkccLQJpwCXEwI1bTccyvvJxModMWPHZSK4SHAfFSAjirqtmHpOpMNRB3Yni9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y2RQn6fs;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652C5606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 652C5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y2RQn6fs
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c434376dbebso202721866b.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793199042; x=1793803842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HF1altOhSOliHgMv/AZ/rbBGnqwe/0k0dVHlSjsTcys=;
        b=Y2RQn6fsIZRhcK8lV3PlbyIGDGsNrvP/2tFWapgKkI5LPIPXQUseGChPE9UjL4RgFG
         MKBrm/Dn2RcCEFFOC11nYOn+JqK0E8vlMIaAMsudPBvt5aYdEY7RvIWXR3hlLqG3m4I1
         1W2dHpOnuVTz8y903UuAZYH3z4w2Cx/jcfuJ3Uc5vFEzmjsoE6P4BzQ1j8nsOwjp4xTz
         r3/2eYqHv2zPbm51Rk4CRERbnjRZMzhxiIlFJUNsGnR2khNsn6uZM/hLALkaDbrUyF4b
         y0JDnJLrbelAqQjHtkbOhSl0JrGrMndTeRx7wyJepirTFwHMo8rIdUGRCTN29i2yaXoW
         cdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199042; x=1793803842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HF1altOhSOliHgMv/AZ/rbBGnqwe/0k0dVHlSjsTcys=;
        b=euxOU0JJhlE6dy6xcTGzCyXFXYMLFAlMcN/DirTPGNtKO7wNIE0cEIXx12+NfwTIMO
         O8Xfw/m6GuLpbAIyFzfABw0NkO+ZOiqlwaI8h1YgXYtwx62h9PMQvvs+aNq/cMqn8Jez
         YrtIlCAjBOBaGyOzd6oQF8tvQiZOQKIAZRHIepEQH0cIACNR/TiZZPlWyg2VqQqAo1F9
         KtoS5mSH00n+wzYCr3p3RtFzDYzzFV84akAjYFGO+GiR4kqsYSaBmE0xjJn69hxYmNqa
         QOFVyxaS4efMP30KZuUK/jvKORuF06ein7AXcyndTygjOO4Ka98EkzI1afIMLNXwSEro
         Jj6A==
X-Forwarded-Encrypted: i=1; AKwUvBzjJEszrGr/X4hgCKlsLnvow6b/OVKIFvq3StfSf3emUjA+PirB6Us5qw6TbcYnNjoqmYyjdYd+00yb@vger.kernel.org
X-Gm-Message-State: AFq9FYLsbS7E5IcO5Nx01k5y/q4YclKQqa0sufJptjr9c1PbFpUz7Tli
	vTriwcAaAgtoVI5Nss+VjX63KksF47rk1ut/U39IlKkOXb6cbetqzsBH4nhj8rztBA==
X-Gm-Gg: AYBFou2MZ4UX8DuxPfgAnOTw0IHtI1v3dqKuv1suG6sPUarQSqMQmgGnDERSjVY03Jq
	qypyVGHKbD6ktOXEFycWewqQgaLaqDRuuj8C6ik75i4dzaIzF6pfh4Ujx2cUAIu4i2VL6oJTgcA
	UvzAjKD+RfoFND3Zu1LPFzUGus6ufwo5vQb8cOjCUs9ul9AgD8LKj/y1OfTiTWUMnrOKm0REmBb
	dKCee+kRZvvzmBNGW4d03ff4XjUfNSqjLtMAO1EsB4VAVIUC20QeCh8qzv/H3AZ3UB/yo7Sffht
	F+YvHq8UwzxglJTsiaZI3OLSE0v25ribuGyad35ow51yb3upKDxje5UedOXitIXtd1kJB+TmqCR
	2JUEc4jy0AfWOAMdWSuMJwVz/4kJFF1BiswS7Zj355U7GgwVq5ltQHZc5WdvB3ApFxCh8g3i8B8
	Yfu4pKqbDyeNlyWNZBds2BjWcbhQgjyClSBBsTy24swEQK8tW5v6zxkAUp/NKuDe7kFjzdSF5Te
	klKjYLDNyZcuwso0Ca2jsQJBbFP5zs0djwIuLxS2EDPqcoGyQ6da0FGpB/nqGiN2WyxxoxDa/ku
	gpPY/cj6BjUyteYJhTQqTtAmII2yR6W/sLkguycFwLFAGGlg63ussISMK3EcjgS4pTbGtUy+UgJ
	TB8jZ2ppTPQM=
X-Received: by 2002:a17:906:99c9:b0:c29:4b57:503e with SMTP id a640c23a62f3a-c49c620c08emr153260566b.1.1793199040959;
        Wed, 28 Oct 2026 07:50:40 -0700 (PDT)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd35004asm607338466b.4.2026.10.28.07.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:50:40 -0700 (PDT)
Date: Wed, 28 Oct 2026 14:50:36 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Will Deacon <will@kernel.org>, brendan.jackman@linux.dev,
	catalin.marinas@arm.com, rppt@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, ardb@kernel.org, thierry.reding@kernel.org,
	david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <auILvMVSXk9pZh6M@google.com>
References: <arIYtjmSKCs14SqO@sumit-xelite>
 <arKW_91EeKA-w96m@willie-the-truck>
 <are21BjeS1O3RYE3@sumit-xelite>
 <aruh86rd5FMv2i9G@willie-the-truck>
 <ar5TPvANFUoosxGW@sumit-xelite>
 <asOAYODGZa-7EIV1@google.com>
 <asOD31rTX6dNfD1o@google.com>
 <aszdnInyJxLhSQRp@sumit-xelite>
 <as3798SFCfKFirag@google.com>
 <as4ATqhp0bPI03PA@sumit-xelite>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as4ATqhp0bPI03PA@sumit-xelite>

On Tue, Oct 13, 2026 at 03:26:30PM +0530, Sumit Garg wrote:
> On Tue, 13 Oct 2026 at 10:37:59 +0100, Vincent Donnefort wrote:
> > On Mon, Oct 12, 2026 at 06:46:12PM +0530, Sumit Garg wrote:
> > > On Mon, 05 Oct 2026 at 12:02:55 +0100, Vincent Donnefort wrote:
> > > > Sorry, not sure why Sumit's email was dropped...
> > > 
> > > The problem was with my mutt config, it should be fixed now.
> > > 
> > > >
> > > > On Mon, Oct 05, 2026 at 11:48:00AM +0100, Vincent Donnefort wrote:
> > > > > On Thu, Oct 01, 2026 at 06:04:06PM +0530, Sumit Garg wrote:
> > > > > > On Tue, 29 Sep 2026 at 12:33:07 +0100, Will Deacon wrote:
> > > > > > > On Sat, Sep 26, 2026 at 05:43:08PM +0530, Sumit Garg wrote:
> > > > > > > > Looks like you dropped me from your reply.
> > > > > > >
> > > > > > > Huh, that's weird. If I hit reply-all ('g') in mutt, it moves the entire
> > > > > > > CC list to To: and drops you. I suspect the same thing happened to Thierry
> > > > > > > when he replied here:
> > > > > > >
> > > > > > > https://lore.kernel.org/all/arJcN60nagFKXj2Q@orome/
> > > > > > >
> > > > > > > I can't figure out why that's happening :/
> > > > > > > I manually tried to fix the To: and Cc: lines in this message.
> > > > > >
> > > > > > Thanks.
> > > > > >
> > > > > > >
> > > > > > > > On Tue, 22 Sep 2026 at 15:55:59 +0100, Will Deacon wrote:
> > > > > > > > > I spoke to Brendan at LPC (?) last year but this doesn't really work
> > > > > > > > > for arm64 because it relies on being able to unmap arbitrary parts of
> > > > > > > > > the linear map, which isn't generally possible unless you force pte-level
> > > > > > > > > mappings for everything, which is prohibitive for perf/power.
> > > > > > > >
> > > > > > > > As per the cover letter it's about allocating pages that are not present
> > > > > > > > in the direct map. This essentially fits the protected DMABufs use-case
> > > > > > > > where we don't want any kernel mapping to exist at any time. Bufers
> > > > > > > > allocated from protected DMABufs are only meant to be accessed by the
> > > > > > > > TEE implementation or HW accelerators like in the secure media pipeline.
> > > > > > >
> > > > > > > That sounds like it should probably build on top of this series, then.
> > > > > >
> > > > > > The main problem I see with this series is it tries to move from the generic
> > > > > > CMA allocator to a reserved FF-A CMA pool which again comes from the
> > > > > > DT. We already support reserved pool allocations via "no-map" which are
> > > > > > discovered dynamically from OP-TEE.
> > > > >
> > > > > I can't think of a way around a DT declaration. We need to know what region is
> > > > > PTE-level before the direct map is installed and of_reserved_mem is very handy
> > > > > for that purpose. And as this PTE-level mapping is costly we certainly only want
> > > > > to enable it for platforms that absolutely need it.
> > > > >
> > > 
> > > I am rather thinking of a way to turn the default CMA allocator to be
> > > PTE-level mapped. Since the overall idea for this dynamic protected
> > > buffers was to reuse memory efficiently, otherwise the reserved buffer
> > > approach is already there to use as "no-map" via DT.
> > 
> > When the default CMA allocator is setup, it is already too late
> > (dma_contiguous_reserve() is called after map_mem()). I am not sure this can be
> > reordered easily due to the dependency on dma_limits_init().
> 
> Yeah I saw that constraint too, let's leave it for future extension
> then although having this reordering dependency fixed will be ideal.
> 
> > 
> > So the only case it would work would be when a reserved memory has set
> > "linux,cma-default".
> > 
> 
> Let's rather just turn DT based default CMA pool to support PTE-level
> mapping and keep it configurable via Kconfig or cmdline or DT.

If we need a DT declaration anyway, a Kconfig and a cmdline option aren't really
necessary.

Also, Rob wasn't very keen on having a DT option for the reserved memory and
suggested to have a compatible string instead [1]. So perhaps we could have a
a separate driver that handles the unmapping.

	linux,cma {
		compatible = "shared-dma-pool", "unmap-on-alloc";
		reusable;
		linux,cma-default;
		...
 	}

That "unmap-on-alloc" driver sets the memblock flags and register some cma hooks
(to be defined) for cma_alloc/cma_free where it unmaps/re-maps into the linear
map.

The nice property is optee won't need to be modified anymore. The downside is
the entire pool is now mapped at PTE-level.

[1] http://lore.kernel.org/all/20260902172436.GB1440252-robh@kernel.org/

-- 
Vincent

> 
> -Sumit
> 
> > > 
> > > If we can have "cma_unmap" cmdline option alongside "cma" then it can
> > > turn the existing default CMA allocator to support unmapping buffers.
> > > Not requiring a DT change at all, although we can have the DT property
> > > for the default pool too if platforms want to opt for.
> > > 
> > > > > >
> > > > > > If we can rather support a generic CMA like allocator for arm64 which
> > > > > > can support unmapped allocations then I am all for it. These platform
> > > > > > specific reserved pools isn't a scalable solution.
> > > > >
> > > > > What do you mean by generic CMA allocator here? An extension to
> > > > > shared-dma-pool? Or having the CMA automatically doing the unmap/map on
> > > > > cma_alloc() cma_release()?
> > > > >
> > > > > Right now I have created an API for the unmapping/remapping part. It adds a
> > > > > burden on the caller, but the alternative solution is introducing post-alloc
> > > > > pre-dealloc callbacks in the CMA, which looked a bit overkilled to me when
> > > > > the users of that "ffa-pool" are only optee and the nvidia video dma-buf heap.
> > > > >
> > > 
> > > I am not too worried about where the actual implementation lives but
> > > looks like CMA driver to be the better place. I think use-cases like
> > > guest_memfd proposed as a user for __GFP_UNMAPPED on arm64 will also be
> > > looking for this feature.
> > > 
> > > -Sumit
> > > 
> > > > >
> > > > > >
> > > > > > > You could allocate the DMABufs from a CMA region that has no linear alias.
> > > > > >
> > > > > > Allocation from generic CMA pool is already the case here:
> > > > > >
> > > > > > tee_shm_alloc_dma_mem() ->
> > > > > >   dma_alloc_pages()
> > > > > >
> > > > > > Do you mean it's just fine to unmap buffers allocated from generic CMA
> > > > > > region since it doesn't have any linear alias?
> > > > > >
> > > > > > >
> > > > > > > > > Vincent's series tackles that by using a pool so that only that part of
> > > > > > > > > memory requires the pte-level mappings in the linear map. That's the
> > > > > > > > > whole point of it, so I don't think it makes sense to drop it in favour
> > > > > > > > > of Brendan's approach (which doesn't work).
> > > > > > > > >
> > > > > > > >
> > > > > > > > For protected DMABufs, we even don't require any pte-level mappings in
> > > > > > > > linear map. The whole idea of mapping and unmapping is just a bottleneck
> > > > > > > > for performance sensitive secure media pipeline use-cases. That's why if
> > > > > > > > we can support __GFP_UNMAPPED with the memory allocator on arm64 would
> > > > > > > > be the best fit for this use-case.
> > > > > > >
> > > > > > > The point is that you will require pte-level mappings for the linear map
> > > > > > > if you want to unmap from it at runtime on arm64. If you don't, then you
> > > > > > > can end up needing to split a block mapping (e.g. pmd-level) when you
> > > > > > > decide to unmap only part of it and there isn't a safe way to do that on
> > > > > > > arm64 without transiently unmapping the entire block, which can lead to
> > > > > > > fatal translation faults during that window.
> > > > > >
> > > > > > I agree with you here, what I am rather trying to find if on arm64 there
> > > > > > is any possibilty to have a generic allocator for unmapped pages. That's
> > > > > > the use-case here as well as what Brendan't patch-set was trying to address.
> > > > > >
> > > > > > >
> > > > > > > > Now the question is why arm64 can't support __GFP_UNMAPPED similar to
> > > > > > > > how Brendan is doing it for x86?
> > > > > > >
> > > > > > > Because arm64 != x86? Presumably x86 doesn't have the strict
> > > > > > > break-before-make requirements we have on arm64.
> > > > > > >
> > > > > >
> > > > > > Sure, sounds like you are eluding to that the generic MM flag
> > > > > > __GFP_UNMAPPED being proposed can't be supported on arm64, right?
> > > > > >
> > > > > > -Sumit
> > > >
> > > > --
> > > > Vincent
> > 
