Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E085F18050;
	Mon, 13 Apr 2026 22:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776117625; cv=none; b=f1HhpTCaawhXipQG1BlN1Dg+WOgnedCIBT62m8189wNab8UG3YxF91BTqBh/HZehYqSs3CFKeZMFz5uTPi6vRwS39Xe7xra0XKRJshZDvBVWcCiiUF77559a3rZuyLZHPJgIT60NsS8VW6OrD34P/0R3w5qIGPrucyB/fSfNJIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776117625; c=relaxed/simple;
	bh=7g+5c9vcuApSGNZprvYGig/poefbVAxDeup1rcPLlkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1GYEqgC3U0hHeh6k+TyTqH9mHw5fxhBOgO+S0LJPvsuXoaO0EkZByc3lan0zSwvSfOG5fMAw0wxwOzabauUHiPEtluJLoEMQJfLazW5mIWEovkDIiBtsCUPVRmBgX6WMzRjGVDJDq+BCWUIQuse1H3bf/a0zyfv1mgvEhqngVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/wgcxf+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/wgcxf+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FE1C2BCAF;
	Mon, 13 Apr 2026 22:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776117624;
	bh=7g+5c9vcuApSGNZprvYGig/poefbVAxDeup1rcPLlkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e/wgcxf+442ZD5eNnSUScwmxPUwXNNl9r9XGstnSjn1KFnD8HaJp6ab5lYxjN5FDS
	 OSgD0vro538ZolIeXSKfCVdlE1IlGfZiCwOMdpGwnfyUVmeRPelUz3y0lN9L4Y+fjP
	 qcQb8bK4UbwQtiIMBH5j1AkwgS1NbX/VFSHSX9PgaXZUufgsLavA9J913kUxC/tGuC
	 GeILQTSBMqqnZU+/MemD3dRUY8JpRxuQfOLsQtlB8yYo2xqPY3pXM8S5hOZAFy/IzT
	 mF4ASlB1rhYH1S31ZdajJrtkmO5ylu7LxhNLx2glpcenw0f94GyUOUDh/Ctd5hWnBM
	 MyTnVNxNGtpvw==
Date: Mon, 13 Apr 2026 17:00:22 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Palmer <daniel@thingy.jp>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, saravanak@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] of/platform: Don't include reserved memory compatibles
 that aren't needed
Message-ID: <20260413220022.GA3412134-robh@kernel.org>
References: <20260331215735.2783770-1-daniel@thingy.jp>
 <20260401-rousing-stylish-toucan-44bddf@quoll>
 <CAFr9PX=F3Qvyo25HwB139Jk4_+5Rw50GBg=3BJb6bcsk58tL=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFr9PX=F3Qvyo25HwB139Jk4_+5Rw50GBg=3BJb6bcsk58tL=Q@mail.gmail.com>

On Sat, Apr 04, 2026 at 11:22:32AM +0900, Daniel Palmer wrote:
> Hi Krzysztof,
> 
> On Wed, 1 Apr 2026 at 19:54, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Wed, Apr 01, 2026 at 06:57:35AM +0900, Daniel Palmer wrote:
> > > There are a number of very platform specific compatibles for reserved
> > > memory that the vast majority of people don't need and they waste
> > > 196/200 bytes each.
> >
> > We don't want #ifdefs in the code because they are more difficult to
> > maintain and review. Following your approach we would need to add such
> > ifdefs in multiple other places, so I am not convinced it is worth.
> 
> I sort of disagree here. At the moment these compatibles are not
> coupled to the code that uses them at all.
> If that code gets deleted or moved for some reason, the Kconfig symbol
> they belong to will disappear but since these compatibles aren't
> coupled to them and are in a file on the other side of the kernel
> it'll be easy to miss them.
> If they are wrapped in something that links them back to where they
> are used grep or whatever indexer can spot them.
> 
> > And this file should not be having different rules than rest of drivers.
> 
> There are other places with #ifdefs in match tables. It would be nice
> if there was a nicer way to do it in C but there doesn't seem to be.
> It would be nice if vendor specific stuff wasn't in the core code but
> I don't see a nice way of fixing that either.
> And if you want to see some of the more crazy examples of match tables
> take a look here:
> https://elixir.bootlin.com/linux/v7.0-rc6/source/drivers/cpufreq/cpufreq-dt-platdev.c
> 
> Since these matches are not the size of the compatible string but
> actually 200 bytes on 64 bit machines the two megatables in that
> driver will consume about 40K. It doesn't seem like much but DT is
> being used by systems that have megabytes of RAM like a RISC-V
> softcore on an FPGA. I think they might prefer to have a 40K of usable
> memory over 40K of tables that don't contain any values that are
> actually used on their machine ever... and it could be cleaned up
> easily by wrapping each of the vendor specific chunks in the Kconfig
> symbol for their platform.

40K is more convincing, but the case here isn't 40K.

Maybe we would be better off just creating a device for every reserved 
memory node with a compatible which is what we do for the rest of the 
DT. Then there's never any of these strings. It would only cost memory 
if you have nodes with compatibles and you don't want a device created. 
Looks like the only ones we have are the 2 NVIDIA ones.

Rob
