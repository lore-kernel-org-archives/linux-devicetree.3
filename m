Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C0126B971;
	Mon,  1 Jun 2026 23:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355211; cv=none; b=suw0RrXpvRjcicbG0N71RFH34K4wFlhEb/D+uhnJ5Gu52SZlh1hOTdMVhGtfFfPNR6POzRh0XgBv6VE9OygxjmVG+ugXka1EDW6jyIIKggkSttSnTY0A1Qa3WV4rTCApTsnA5v20BfRUcGJ3NcYA8vHhrOcUDF4JJMvxAD2bHQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355211; c=relaxed/simple;
	bh=ksPNto4GiLD8jh3tfYRwpiuAUrDlXU2PdsIDNh9nT5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPvWeG086ZOpBOnGLjMq4kFyiQDITwZPvzsQVDKUyT0P8hyFtoVMGyqnm/f7xx8auuMOR8nDp9QEu6YXtBVs0PUDTys9MnxLdvef0OQ5NtSQfsj/7Iw/spfzm/8RERy16ex2Uow9UGC8AChXYOgBiwrNllrwjCQzDS0B/v9+D0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VZr2P6a6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZr2P6a6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E7A1F00893;
	Mon,  1 Jun 2026 23:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780355209;
	bh=E7R1Z5LYo7pjeNoc7ep6ZTYiQ1+vt+nuVQVM/JRsDg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VZr2P6a6rxEsszH9oX0SGvC5VIHiToe8P8ovQ/YysKwyMk2wC3eOWD5vo9Kw8atuv
	 +uBYid7EKetA5r6XY/8stwJLIyPjZzSWZvrsYzUhi5Jhnbhpo6JynIcwES/u7LsGQw
	 EflDcWw84c6+GhriFQkUk+fhEMqJ30inG/jNHT2bsvXOxLCs2jg3j05sk7Y9KJy/Yg
	 K2jsAuE17whwOdG2qHpowhA3u1lAOMO7XeigILZaIoIht6mxw3gH3HjiTAI5+Pl8gK
	 Bjd3wkjPgJ3v8oIfSg/lQLxM2AUEde2jWmKLHdtJfnpOp1Bfjq/3vLURYEubqYX2gm
	 HrFAWChToPdSw==
Date: Mon, 1 Jun 2026 18:06:49 -0500
From: Rob Herring <robh@kernel.org>
To: Wandun <chenwandun1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, zhaomeijing@lixiang.com,
	saravanak@kernel.org
Subject: Re: [PATCH v2 1/3] of: reserved_mem: avoid unnecessary memory
 allocation when __reserved_mem_check_root() fails
Message-ID: <20260601230649.GA154030-robh@kernel.org>
References: <20260519082427.4181476-1-chenwandun@lixiang.com>
 <20260519082427.4181476-2-chenwandun@lixiang.com>
 <20260520-cuddly-imperial-bison-ec3c4e@quoll>
 <0dd4546a-6133-4493-a911-41c35ec42c15@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dd4546a-6133-4493-a911-41c35ec42c15@gmail.com>

On Wed, May 20, 2026 at 04:16:23PM +0800, Wandun wrote:
> 
> 
> On 5/20/26 15:44, Krzysztof Kozlowski wrote:
> > On Tue, May 19, 2026 at 04:24:25PM +0800, Wandun Chen wrote:
> > > total_reserved_mem_cnt will keep the init value (MAX_RESERVED_REGIONS)
> > > in fdt_scan_reserved_mem() if __reserved_mem_check_root() fails.
> > > 
> > > fdt_scan_reserved_mem_late() calls alloc_reserved_mem_array() to
> > > allocate memory according to total_reserved_mem_cnt before
> > > __reserved_mem_check_root(), so if __reserved_mem_check_root() fails,
> > > the allocated array has nowhere to be used, so no need to allocate
> > > memory.
> > > 
> > > Move alloc_reserved_mem_array() after __reserved_mem_check_root() to
> > > avoid potential memory waste.
> > > 
> > > Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> > Authorship/DCO mismatch.
> Hi Krzysztof,
> 
> Thanks for your review.
> Sorry for the mismatch. Dueto my company email server's issues with
> community mailing lists, I sent the patch via my personal email.
> I will add the correct 'From:' header and send a v3 patch shortly.

There is also the 'b4 relay' that can be used for this kind of issue.

Rob
