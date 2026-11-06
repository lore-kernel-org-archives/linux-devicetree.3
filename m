Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961919;
	b=0v2/sfTZuTdfybgANeGcpN2HLUyQDa4Qi4bviikn5s8YXO6KaTHIj1MjRHdcPSq5aEPW
	 uP2WiYr1Fthnofpg2MZzBKaNMD5GIR4eInYy12oJidBV93UFL/zczsyHpB+cuIKSlftJo
	 naWx4nYw/pyu7bfjlZxMkLLZNqWWtmZ+RpuUEDJJaSSoJFZnhBMJsB7sBBaYESsdJnVm/
	 vvtPwx4eKNTkuTQ4R6DwgInjA7JtUPSNJZSH1FxG3bNISQY178hFsPxnl8Ot288mgrZWe
	 6P8z1isrpuFBe/FmSm71u1UZdS5n8CUEKRWubpr+51U9/E8KXNdfxJddeEpwZyTiWAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6ysUKDhkycj13Q2P+bjvds2QR5Xb4PbnZNX+l6BEN+k=;
	b=T53Ua2j66HmN7mxOTR6LEmh6Nb4P/tYbU01qfh9win6Biz/ZpJGe6kM7LAtf8g/lTVMY
	 MtQSsj9hzHoUCBxM+zIZ9B8wHJ5tRnSHUtQxTfLfBT+PWcmGWzjGD4gIL5fg1VDBbGtLW
	 bzpLe8UfHfye/U2nRhVsUn6T4CGjW2TPG3cx25Sg3DcwJOFUOpN8TrFgiX0Tbl34tqKAx
	 hN7WRUWpzNnoqLYfnFg8ZzIZbeYIVbAU7NPq8KgvKwN6vEUW1hM6gyVsfVqaFKM4hDxOa
	 /HusuKQwZ/HpOUNBPTF6AsJ9f2V5YHnP/LkluMlat1ajDfI8zuzbCkgy0Eh29wnXVNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cxI0McVE;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C339606A32D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C339606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cxI0McVE
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a208d93758so4877045e9.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 02:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793961918; x=1794566718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ysUKDhkycj13Q2P+bjvds2QR5Xb4PbnZNX+l6BEN+k=;
        b=cxI0McVEZxvYVPSgVvIQV5DYjt6Ul49jgRYb8ULILj7HzTvDDg6XMCwmvIxksapdoV
         DNwMwogXSW2Ra1Sk4XmyjuYCGrtYj0xUtW0PWlmt1/Immcy8dqz+hHBJlXf6luqHht4e
         a7tALuhWxrmIkYKz7/ovpz2IQGjFNHgQHofjvypTpbX866JoVqhPXsiuVMfUsIW9d3gw
         TzyPSI97WZpDz5zDya5TYPrVp3jgeNZcvTYPjlmJG6EustmHJ4PnPuH/AUwNMGM+i/Og
         FH4GavtEXnIiTRsferH1aH/s1fKo0NEEYtUHCLFVr+d9qw0jnmkK7fUZbRnkpkAMRXbS
         LtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793961918; x=1794566718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ysUKDhkycj13Q2P+bjvds2QR5Xb4PbnZNX+l6BEN+k=;
        b=uyoyzKqCZ0xxUXiw75vqCYk9k4OtJAl/d3ST06UVk/Q+SuIUHOI7/LTKF9t5T9P/K3
         35jXPvV6wOwAabikVSlORayaiat8IycpgYWFvhky47fR2PRD3im+LQzrNmykfxJvJEvA
         uQD9dVKXgqu4DV99RHlmb1ypLrHAE4hHzrcy2Og7LUTPclS3ZeEHIEp48M6z7mzIT5Al
         VbfVk3aUNnbTnd1t+f/zLMU/LKimAZoWy9MAF/0vyJQe92M6AXpj1lkQZh4ff3XWXmFm
         VjmZitB9oDeSzpLcaLUMTJuFBwiq5fLsiNZ2EvIHm4l6wybmjrZFFUhPOymGnsb9FHF8
         rThA==
X-Forwarded-Encrypted: i=1; AKwUvByFCikfk9kjpZj8CtRGAtys0J1dIEpxhjPq3ZFz1w9fmQ/4D9QROF6fQ/eUCEUvoTBbDrJGk9EgTj7k@vger.kernel.org
X-Gm-Message-State: APuU4Z9E1q1y4YA0U8MGq7sw1z/R6b1kxatHQXXH1qNchqUi2jPTCGq8
	AJVePUPefwiYqdABkKId+ZiY+B428ggrNCeUILQkjwJBXZS+qf+IcLZ4E3v0zrmj2Q==
X-Gm-Gg: AYBFou3TjWOakhkOpYMiiDURRhq4gs8SMvus6BZLtEkVB9nafPhCJxFDhA4wiZD2x6J
	jNbwMOnyfSCoZd1+YiN8a8NUF/gg43TQzDVfENLsTQwwHj7RnoupIC1ovN+HPHbsK4jtU1JP7AE
	SladoV/ga6j63H6kRR1SAHMHnt+exC1DtyyfRezu9gth3ea1QmDNVkVv8aHm9u+dRioUcLKv7If
	p9ndZs89rcL2XW3nSb9U9y5IcD5QwYIiJlFGrNESfl2DSp8a1ce3SeOMhnOqxIa2zgSnWs5Hbgx
	7vbSWeBAwn5qLhNWa7y6lTfUcamnWhzZ1gibBWasmjW+yUK89ZxWmsoN7R+3QsU6JpHy0IQNc3M
	ZIE634wGOqOFsXZ8Dt0ewy85W4dBgCzZ6ydQGEiBRlfjCivEIG/NJlfRL+iB0K0XIkrA6Ynovz/
	WTk+3IzHEPyHay0ve5hR9pX7eW5li0w9byuIelNvc98Yvvnlg+RTczIKsbW2IfgESFYtSFpaEwB
	4tUv3AX+ifFhIX/cPfBkD05MKl46RYG0a2k+ynOF2VqSYhlNBi05Gne6pqZy82uOapBv3n7GXi0
	SQFyPC0wy1pOCBxJa1BaT40vwt6yVaMD6UClEjKoX5NuKWsp+UHB5yqSJiO+qFg2
X-Received: by 2002:a05:600c:3b02:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4b6df5eab2emr32006075e9.20.1793961917300;
        Fri, 06 Nov 2026 02:45:17 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b73d28cb10sm16111895e9.0.2026.11.06.02.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:45:14 -0800 (PST)
Date: Fri, 6 Nov 2026 10:45:09 +0000
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
Message-ID: <au2vtZFyfUVWeils@google.com>
References: <are21BjeS1O3RYE3@sumit-xelite>
 <aruh86rd5FMv2i9G@willie-the-truck>
 <ar5TPvANFUoosxGW@sumit-xelite>
 <asOAYODGZa-7EIV1@google.com>
 <asOD31rTX6dNfD1o@google.com>
 <aszdnInyJxLhSQRp@sumit-xelite>
 <as3798SFCfKFirag@google.com>
 <as4ATqhp0bPI03PA@sumit-xelite>
 <auILvMVSXk9pZh6M@google.com>
 <auQ5hCdPFz0BmvDG@sumit-xelite>
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
In-Reply-To: <auQ5hCdPFz0BmvDG@sumit-xelite>

[...]

> > > Yeah I saw that constraint too, let's leave it for future extension
> > > then although having this reordering dependency fixed will be ideal.
> > > 
> > > >
> > > > So the only case it would work would be when a reserved memory has set
> > > > "linux,cma-default".
> > > >
> > > 
> > > Let's rather just turn DT based default CMA pool to support PTE-level
> > > mapping and keep it configurable via Kconfig or cmdline or DT.
> > 
> > If we need a DT declaration anyway, a Kconfig and a cmdline option aren't really
> > necessary.
> 
> Agree, it rather makes sense for DT independent generic CMA pool.
> 
> > 
> > Also, Rob wasn't very keen on having a DT option for the reserved memory and
> > suggested to have a compatible string instead [1]. So perhaps we could have a
> > a separate driver that handles the unmapping.
> > 
> > 	linux,cma {
> > 		compatible = "shared-dma-pool", "unmap-on-alloc";
> > 		reusable;
> > 		linux,cma-default;
> > 		...
> > 	}
> > 
> > That "unmap-on-alloc" driver sets the memblock flags and register some cma hooks
> > (to be defined) for cma_alloc/cma_free where it unmaps/re-maps into the linear
> > map.
> > 
> > The nice property is optee won't need to be modified anymore. The downside is
> > the entire pool is now mapped at PTE-level.
> 
> Sounds reasonable to me. If folks are really worried about performance
> with generic CMA PTE-level map then OP-TEE already supports no-map based
> reserved carveouts for protected DMABufs too.
> 
> -Sumit
> 
> > 
> > [1] http://lore.kernel.org/all/20260902172436.GB1440252-robh@kernel.org/
> > 
> > -- 
> > Vincent

I have just looked deeper into and cma_alloc can't unmap automatically the
default pool. Callers expect a valid linear mapping right after the alocation.
dma_direct_alloc() and dma_direct_alloc_pages() zero the allocated page,
dma_direct_alloc_no_mapping() runs cache maintenance on it, and the userspace
available heap /dev/dma_heap/linux,cma zeroes it.

Also, it isn't possible to use two compatible strings for the reserved memory.
The registration stops at the first matching compatible string. Layering drivers
won't work either.

So while the pool can still be generic and serve as linux,cma-default:

  linux,cma {
      compatible = "unmappable-dma-pool";
      reusable;
      linux,cma-default;
  }

We can't escape providing an additional API to unmap/remap in the linear map. 

-- 
Vincent

