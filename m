Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3719387588;
	Tue, 30 Jun 2026 16:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782838087; cv=none; b=U4Y8x7ngKp51L0Y3BdUaukVr/73MzaW4qoZDmlPhAe+zR7MknCUCyCy+Qov5FtusQ6Q85ybDICVrO9oJXefmKAfPv8RZo7CTaCtq40ljHhgssZvXnIYkIIQhY3dsQvy82Z/9/n013amTm+8a3FGnTL2eGOcuiGhChxbw8gZiNg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782838087; c=relaxed/simple;
	bh=pjBPF2DGIK1jzhKqPI/vUBhcxsMj5K5QCHSwZ3gNkO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJKU31utjFX+djyDrObgqjf6ShmhBWiGSRZiK7LtYLgUaZRWTvmWcgYxc4nhNxWN5IJQg+TUiDXO8nzVXzU73Ba9N7x173g+EvJLqLVr13nGA+P+ncjAulybk95cmMXPpVuEgM+j9KY8iC1Ths0u20O/x6a20Es2mjmpwPEGRis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z54EhXZ5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z54EhXZ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662971F000E9;
	Tue, 30 Jun 2026 16:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782838085;
	bh=aQME56hxrnfMv8y1HuSYOXEeBCbRKzTFUcscWXVXKE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z54EhXZ5X2YgK7JbcAbTLsK/UJhjf475ABh03MFW5BJ4o2CiOCeRW71iitG7DPpql
	 0roMyl2c0aHBngl7wl3TfGKzz55Oa6quU3Hk8ekE2iyOk0SQ5h2+0W9ChAt7vNHraU
	 Y5RR7Tp3IABI2RUG6mNk0P5/m+KH7494xQF93vNtgI4DoIMb1+kt2jiLsLCwEnjMnY
	 XQ2jP7+B3rdWTUjHBbaxVJ46gWhywnSQDUgs3wHIkCeexgcg0mWsVqXPe0z7X/hJOX
	 s0N6Cyg4QD6fmrw/y/nKI7n0j8YxgBIQjh3DbffPOra36Sx7J0AXPSa6fwKclzoH+Z
	 OyI3awpgu0PSw==
Date: Tue, 30 Jun 2026 11:48:04 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Palmer <daniel@thingy.jp>
Cc: saravanak@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] of/address: Drop ISA parts when !CONFIG_ISA
Message-ID: <20260630164804.GA3920230-robh@kernel.org>
References: <20260626171906.476688-1-daniel@thingy.jp>
 <CAFr9PXmAtnLSzA3GLb4qKvrs1X6aD+DNPSoEBXhSzkL7oPHBig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFr9PXmAtnLSzA3GLb4qKvrs1X6aD+DNPSoEBXhSzkL7oPHBig@mail.gmail.com>

On Sun, Jun 28, 2026 at 02:44:51PM +0900, Daniel Palmer wrote:
> Hi Daniel, (Replying to myself..)
> 
> On Sat, 27 Jun 2026 at 02:19, Daniel Palmer <daniel@thingy.jp> wrote:
> >
> > The PCI parts are already wrapped in #ifdef CONFIG_PCI
> > so it seems sensible to add #ifdef CONFIG_ISA around the ISA
> > parts.
> >
> > This reduces the code/data size a bit on configs with !CONFIG_ISA.
> >
> > Signed-off-by: Daniel Palmer <daniel@thingy.jp>
> > ---
> >
> > Sorry for the spam, somehow I botched sending a patch..
> >
> > I thought about making this RFC as I'm a bit unsure if machines
> > that need this ISA stuff actually select CONFIG_ISA or not.
> 
> So sashiko worked out what is going on here. A few machines have
> things connected via an LPC bus that is derived from ISA and needs the
> code to parse those nodes but those machines don't select CONFIG_ISA.
> There seem to be ~15 devicetrees in total that actually need it (1 in
> x86, 1 in arm64, a few in mips/loongson for loongson machines, and
> then a few in ppc).
> 
> I made a series that adds CONFIG_OF_ISA to enable this code, selects
> it in the places that needs it, and then does the original part of
> disabling the code if not needed. I will wait a bit before sending.
> The reason to do this is I am using devicetree to boot a machine with
> 4MB of RAM and a 7MHz CPU. Removing dead code/data like this helps.

I tend to not want more CONFIG_OF_foo options, but okay I guess.

Alternatively, maybe CONFIG_ISA should just be enabled with these 
drivers. Doesn't really look like there's actually much or any code for 
CONFIG_ISA. The biggest issue might be the option doesn't exist on 
arm64.

Rob
