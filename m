Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5665A3E6DEB
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788800622; cv=none; b=r0BqF/4HZBMR2CqbXz7okOZfZT+WkwLPI/pDHm/xz0JtHw7REb9hCYGfg6a8jG2JAos66fb+GKIX35cYXPyhCY01H26IDAilHpC/sV98SQkmZLZHl7hplr2VtUDKAS0cey3ZInpwFCH/koRDKuKcWxU7z2VuKEDGFsPRf5zfPUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788800622; c=relaxed/simple;
	bh=yci8SCVSj/c4byzd49bd5AwR54pen4y2tBI3v+juCjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IV/IggTspdOYmiK+HdEVXWZZApb2NZ1S9rY+33xnKK6BOkLg5RBxLKMG3MrzzgA1Ihfc7q9sC+XYMQhWO5bEF+ph1K/kHINMKMA/NNhPwPAIzu8rhY43khnbtUZ7RVu2nf5JInVq8bw1GjEnVkQj+++taP5CZwMB965pMiK3wyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nZDeNsE6; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nZDeNsE6"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482dbe4d247so2143047f8f.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788800619; x=1789405419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D/2WLxDmERbGCh7iT/2ZThPPuDMwAWqV6GCdXRr20bA=;
        b=nZDeNsE6jP4FPqjnfK1c4bJmLBn2c6hGkaeyn4h5czoZxL1PJk6ya5TxZs/XGllZtz
         33+qQTwwT/iiLFDohkfh+ZSzFnQXmbij09UGgWekhvB1npYPJB65bwJhg+AJROj9APAM
         bWo7J5hx0ACi+ZCH302YVBXJn1UARcafCKRxXCZyczFuAyO+rfRvR0TMz/NoqDZLFeyn
         T3EKAW/HCL1X4YorxgytOjmvEXis/npsYnc1YdvX1jUOZGFDTFwlU56QQjd+5IWw2S96
         2y84aipr3iEl5wxnz5qaQ/wIO4dTyLxALWou4j3JGS93phu2V/FIyoKZh8HtJdQrrc3W
         pIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788800619; x=1789405419;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/2WLxDmERbGCh7iT/2ZThPPuDMwAWqV6GCdXRr20bA=;
        b=brn9QjA3cujLPPkS7KsEItt5ipQGlu9VSWQ0LHfJ3li+bBb+25HWq+ZrijBz4yCnCv
         RWB9M1pY78FzjulFOJbKPrPhNtA+5czlRTYZPku1lmQbwCnEIu/9IaUNjHAVfSeEfj9l
         26NsP7unHhp3d62H8RBpLeVNpROmnnEtj+VP05iGSfnvb+nCI1xNYolBWXG3Zp9j3lis
         67ltKNa9Ow00X6kALqKSBF3Y4CrpTf+Rtb+BY1QnDwi8mIEZulsQzl+EJeHeVWqu+aCw
         EaHDR7ce7ReJfHwR9In0JBEuGyGjEsY7o44U3390sOhgLaKi/EwzpsAIB6jvNEhWTn4W
         SpEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxORKkcVMb10Z4T1J9RnxlmugWjHWulRdJKhSD5WSCwUIdypg8LPbB++YnzWSDZoYSBxFgRO44wfiGB@vger.kernel.org
X-Gm-Message-State: AFuF++mnpEAPejkU7nhpulIXl7Snpo+u0t9qYLqPttEJTPDoPGS2OEIW
	COsgQttWzL8osepijc12opNSTaDR2pZnhtmimIhT0NW39H1gR9NIMP/MROUz9FzApw==
X-Gm-Gg: AYBFou2uD2qBkeOFNpgLFJpF+rFrF6GuVVnCFR8yWdwn2Hmdve63vO3Ptq9Wawg3XNO
	4GgJpMJTeCqaRsXmB8qKwujx9R3BvtBUXz1DiSVE+2gi/EFZg32pFnV83CuTLeCae8bUF4Fjfot
	Qqn7g7GPc3z+6QXAtMKubh+8fzZBAaPe6gSaLtcZcF1W368u9QfrHHJoDRKMx3XBYzkk0Vtsqkv
	Ocb7S9kJtv3YwFc65L2MKWd2cD7IsK7HatAtMPmTvxCvX4cpHDQYRzZo3QlgyN02TNlnXZOh4Em
	n017mHWOwGhgH79zjRNG1bHMN4YZ3xDW1sSeGtsObnS7V+YVJgZ37rWla+7wwunwZmg/DVUbN5Z
	lV/TxGGRn/z3GJ+hfSOU0gwEzHJSSvewq5hpgct2U5HdV1KWQUzlJYZZd4yXWNS3x3/tgJvX2tr
	ksLCP+rtO/ogAUU39mUWtqK4VNv4ihKis2DU4pzpPGc0ivAk0crCAvZv9SB0mKhLjT9FWjDCijN
	OFfbUnycGoraBuf8lF+MHGSDaq/JdIX
X-Received: by 2002:a05:6000:605:b0:485:8b66:f5 with SMTP id ffacd0b85a97d-4858b660161mr42549469f8f.18.1788800618759;
        Mon, 07 Sep 2026 10:03:38 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883927a3sm23089736f8f.11.2026.09.07.10.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 10:03:38 -0700 (PDT)
Date: Mon, 7 Sep 2026 18:03:34 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, catalin.marinas@arm.com, will@kernel.org,
	rppt@kernel.org, akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, mark.rutland@arm.com, sumit.garg@kernel.org,
	ardb@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 02/10] of: reserved_mem: Introduce "ll-map" property
Message-ID: <ap7uZuGraZ2N58c_@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-3-vdonnefort@google.com>
 <20260902172436.GB1440252-robh@kernel.org>
 <aplF4NaoFk73d-c5@google.com>
 <ap7CAowlFTFhSFP9@orome>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap7CAowlFTFhSFP9@orome>

On Mon, Sep 07, 2026 at 04:00:19PM +0200, Thierry Reding wrote:
> On Thu, Sep 03, 2026 at 11:03:12AM +0100, Vincent Donnefort wrote:
> > On Wed, Sep 02, 2026 at 12:24:36PM -0500, Rob Herring wrote:
> > > On Wed, Sep 02, 2026 at 11:47:04AM +0100, Vincent Donnefort wrote:
> > > > Keeping last-level mappings is interesting on some architectures as it
> > > > allows mapping/unmapping pages from the kernel direct map without the
> > > > risk of splitting blocks which, under the break-before-make rule, may
> > > > trigger page-faults the kernel can't handle.
> > > > 
> > > > Add an "ll-map" property for reserved-memory regions. When set, it
> > > > splits the underlying memblock and sets the MEMBLOCK_LLMAP flag.
> > > 
> > > Where is this documented? Any DT property must have a schema.
> > 
> > Ack.
> > 
> > > 
> > > Though I'm not thrilled about more flag properties. Handling all the 
> > > combinations of properties has proven to be painful. Can this be implied 
> > > from the compatible string instead?
> > > 
> > > Rob
> > 
> > We need this before the kernel direct map has been created (paging_init()).
> > 
> > I would have moved that directly into the driver lend_pool.c, but then it is
> > probed too late (unflatten_device_tree()).
> 
> Any of the node_*() callbacks from struct reserved_mem_ops get called
> prior to paging_init(), so these could be used to manually set the
> memblock flags in the corresponding drivers.
> 
> Thierry

Ha yes my bad, early_init_fdt_scan_reserved_mem() is calling ->node_init()

So I should be able to drop this patch entirely to do set memblock_set_llmap()
(or memblock_set_pte_map()) directly ino the that new FF-A lend_pool driver.

-- 
Vincent
