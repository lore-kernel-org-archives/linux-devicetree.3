Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085D940BCB2
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 10:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429809; cv=none; b=XaAYsUo9ir2u3gQBN0S/AXh13kq0l1yQpzFo4hu4iRAUM72/AUTdfdoHuL3izkFehZvKDJr6nHBiXBtWU2w1WcU+9sh+mKZbYHDj+uOfX8kYo5M70U+Hr0fa1CSgJcUsVOFGKB7KZVzEGVt9tjUaInICTl6Inrj5lm9YkM4ddiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429809; c=relaxed/simple;
	bh=ntB9fs616qYfrLPBRKjSLmOUV5UErT3QQloiRYYK6Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6uFdWuRvldQ6cgXfQ3ZTGLnTD2YzRhFsyGk5Mmq/V8Izsxqal7NKKW294MRvM+Hh3pRsaicplkjlzv7WJsH7Vw1AeyQ/jVhX+2zY1InOb0PwDvWd2EXz9/OPPYfUD8nIa29bsi8L4/SibTs/yrAXBVa9Pujy98NJixVGhBUeKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N2yP0L5n; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N2yP0L5n"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso3436187a12.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 03:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788429799; x=1789034599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NTFqZaE5WeXzEFHRWSBbenebslM+9RuyFvHTxQmSgMQ=;
        b=N2yP0L5nTY/nWVm0VWA89oNldW+PU1Jt3gfaVqOXAnY9bB/QeHSmFFmdQbe3Cz+by3
         7KB1TJjTLdkvGM+Bvi7mzxou2UrcFixYxnRqvFlso9KU/Xd5h2TZ3S9ySvrJXAzCmZNY
         yLfJWqwCouYKU758pymZ/e5DL+Tj0Hd7Rh8MKCO1PJoI/tdwXntU7PMoY29SCXncN12q
         365ER75fZuiMk1b5+SInrsIGov1Dxl1NqKqs4y+61JrLi2DGY5s9Zx7rz7K+kgBApyYb
         KlBrpoweG+JLXLAQVj4vOAst8SN0DsdoBaSVISG+dmIYoaeowS1oL4ZFIs0ujBxy2ZD/
         HvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429799; x=1789034599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NTFqZaE5WeXzEFHRWSBbenebslM+9RuyFvHTxQmSgMQ=;
        b=S7IbTekBFFLGGb1e+JS1IjbuZ3RpeK++sBIvTGFRu19nFqvkqNawu+wo1AL5ITgVLi
         m8AzNA6ZlOE3testL+ph/cG9NsrY2UiHfJg9raX85E9U4eufSFmf09MPM4equ22s+oJ3
         /FHaIzrnLT7B41/gE8eijTiDrAHQdypOVBUSgN69ti1PAVgeEHcG4RsjYVM3yqffKn/+
         5PueR7rFO6qk/caigRUbRTghpFL/Cw91bZrZXBWPxqOoprf6VnPz3zKHGvGqselZLgGE
         UUviIL01UebB32Rb/x3lV9SWfoOkEJPZRuYDaCQFBBZRH0TlGw5qcCjW5Lt7evQwuk5E
         fixQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGevCBpqCZtGc+2uql2bzc08IsSDv2/2UtzNKHnE52785EEzKLqQ32jPnKUPsqG3JLwwsxWr3fvbvL@vger.kernel.org
X-Gm-Message-State: AFuF++l1GMNeU6ab1glAx38mpgX131KXakNVVqxy9qqUBFk2ZZvs8DqA
	Qn4k2okuV244Smr673MTvMC3ROr9KeIBfZPal42ZEQ0mWaYL1XGBRVIlQLYoAS1jeg==
X-Gm-Gg: AYBFou3mUH2vgWx+1H+jP7clQXymoBHvHqJVfDHwrlNC8w657qfPkJ1soIanCJC5hBU
	UFDDmCbZ5cQBEPhKyOniVAIf5NfZt22t6OYRs18YgHCXNvvzMhsXYg9e54gNz4yFG9S4l5l7GsM
	ifARpPM373XcfEwK5U51VIKnH0qPwgxKpzHYbYlQCWZHh17P+D3PuTi/2koW4ECnK8HckSJ127K
	XNfUWIyU3bUqwUVh9MKcQbhFyDR6db6psqbSYLHqinpPKsirDg8v1CjNL4eis0uMistgCKeBatv
	U/A99gDirs/J3MWerZVFapBMf4A6lrCMASx1rQDauaOF8vmpeGOPzz1NQMshYBIY9ISyi+r7i0Z
	PfeJvk2PlTheYtJdFF5J1xsY5sL2LuRyO7X2ZXYC4Azf7oYSff5vhmtrGcl06Dtj27ssrhnV0Na
	IAzn8OQ8ATFtev6W+8VCMOblWu3Yd0IzhkYsUTkoQGdeTX6PYT8VrasQzkCuBzuE+EBvW/IWGu4
	/ytPxMen3iqlw50Aw==
X-Received: by 2002:a05:6402:1ed1:b0:6a5:f4f4:5c0e with SMTP id 4fb4d7f45d1cf-6a6829afd97mr6824116a12.14.1788429798174;
        Thu, 03 Sep 2026 03:03:18 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8b47f7sm2104420a12.9.2026.09.03.03.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:03:16 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:03:12 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Rob Herring <robh@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, mark.rutland@arm.com, sumit.garg@kernel.org,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 02/10] of: reserved_mem: Introduce "ll-map" property
Message-ID: <aplF4NaoFk73d-c5@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-3-vdonnefort@google.com>
 <20260902172436.GB1440252-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902172436.GB1440252-robh@kernel.org>

On Wed, Sep 02, 2026 at 12:24:36PM -0500, Rob Herring wrote:
> On Wed, Sep 02, 2026 at 11:47:04AM +0100, Vincent Donnefort wrote:
> > Keeping last-level mappings is interesting on some architectures as it
> > allows mapping/unmapping pages from the kernel direct map without the
> > risk of splitting blocks which, under the break-before-make rule, may
> > trigger page-faults the kernel can't handle.
> > 
> > Add an "ll-map" property for reserved-memory regions. When set, it
> > splits the underlying memblock and sets the MEMBLOCK_LLMAP flag.
> 
> Where is this documented? Any DT property must have a schema.

Ack.

> 
> Though I'm not thrilled about more flag properties. Handling all the 
> combinations of properties has proven to be painful. Can this be implied 
> from the compatible string instead?
> 
> Rob

We need this before the kernel direct map has been created (paging_init()).

I would have moved that directly into the driver lend_pool.c, but then it is
probed too late (unflatten_device_tree()).

-- 
Vincent
