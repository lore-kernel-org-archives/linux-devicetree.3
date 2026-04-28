Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C08329E49
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 20:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407667; cv=none; b=XPjsV2nXNQiowaonKT/jFScjM5kJujeHyZIcRUxbvmksbq+mUY1hrD9/gB1IB07Y2RMwT8VXJMBfLX9p5NjhMarEI+zXghNnm8gEt5Q+BA0NbF+OkVrI5fUyO5XfBMJJzpyIqTZGcvi37pZJn2QFaXgJEfY4coMqMGYJUtwBVTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407667; c=relaxed/simple;
	bh=b3y0XwETp/+cTkGRrG43RAGkVJDpjROsO7uB28sz0+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IW4gH2bwpEc4XNPRl5RrJiLR+u31nNzEPgdNEfoMykaLZDgHwDTbbYmuCDMykzGE+js7SFU77yafdR91GViuTmoxh/4lCE7IVbpHYRkfMtl54VYF1rJeDqT6x0QN5cMTaalUrJ6nPZR/MFabCN6BvWrgY7jkWCU2kApOtAN9/ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Qk/a/gpH; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qk/a/gpH"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c45281a06so16339115c88.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777407663; x=1778012463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wAYKdy6rZGHPp+6vTJbxhAN2mtySYtF/dy0uwVb4Go4=;
        b=Qk/a/gpHCT0jyi5R99OTiHzfbiqefiQgbfbvncmGW/v8RZYEpHTyzAmlJdoZOF9RXx
         ApO2HfxAoSXrA/y0FwW+q7Aex1MlSu287gmjdLKOcamUmrm9pnpwSPets4bP8W0/Hw49
         1m1lu1Ab1ISF0Je3WzJGHKMLKAXFy0Er17E34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777407663; x=1778012463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAYKdy6rZGHPp+6vTJbxhAN2mtySYtF/dy0uwVb4Go4=;
        b=QDfX93q2PTTXH1efSU9SEMVqMzWGdRcxBENH4vwSHWO7oUsSbinCBufrQ3sr1O+jXR
         7RhR3QBE+UFHgxa1+6Nzl5BYaFKOkfhVHl5dZnYWbJH1gpzDO8xzq6A04SCjU4e5yZVu
         jm9Uvp0AKd2wkP3RXawRSXu4BpQHonCnY7B3Y8TUiqja7GJmGy/4WZDdMzMi0QY9c4mh
         QjX7RRROGABxTxcEup7ln+ki7huT9q+p1TiM+vOjyj6uEP6xtfTDccGls/odTAKcGSpZ
         mke4u5g/pp92ObZjY4kqv5bfxiV3qnX/AN/KVRkeQUAT9M9ldf5aPOzHFvrLwVL86YLw
         96vg==
X-Forwarded-Encrypted: i=1; AFNElJ+M0k4aSdIoq5syOJgib9nEwof1pZfw6r0qXETYKkFoTgYA1QwadpRG2i7wOh2vWeHTgGKpBadcUI31@vger.kernel.org
X-Gm-Message-State: AOJu0YwDra92FpbfcdsUgGyjxbCEVq9ADlNzIrAohplIVixRg+nTez5r
	4RunhE0Xu4m1S8BQnDeUGpyGdZl++ePEedUvTsZteOJ1JaXuB0EDnTVL8QO8ImLZ0A==
X-Gm-Gg: AeBDieuf5caHHIjiFwtWcvqI65nG5zrEhHRoE3IkQnVMJRDL63XH1QE0wdSfguIUKzU
	WfBraS+p+D1TTYHonG+G8V6YMrlQsJfsNNyqO+TV6I0lnvkPlB5kL0gHTRspDMKSyBCGvcKPdry
	1HrbPtP6UOYjQRuY0nba4jmvLBVkbh4tqPUv4Pm3C/RWv8hWt7UTUpG6PUvvg9BBvNEhJPOdpmr
	p15LFWGfWRd2oNFPQQpCwwCXl15t+rcCgwNxtsLnlQiohY81H9JkLGv/pklkPhMae/FRbNjtxSH
	hH1XcMpj2JAwUopC/Y3O2i31/WkDShHEFel0U5vOpZ+LZJMFA8bqfTx2Ti5JFFDWXZQbDYN/gvC
	NNVKdjOXlZEtIAcjNQ2jr++Dn/gTWqBQWLI9+35760GucigrmOL/lndzSuBgTsw2OBrWkP6H9zi
	TtusDRxPk4vB2SdF+1dgJ0veoR5sWwmRKZMqJKIiGN7YtA7AxGainlQPUi3sD8W8TRrH2tLRVWj
	ws7L5ZlY0w=
X-Received: by 2002:a05:7022:6607:b0:128:d967:4678 with SMTP id a92af1059eb24-12ddd99c410mr1729142c88.23.1777407663085;
        Tue, 28 Apr 2026 13:21:03 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12ddd933044sm2821511c88.5.2026.04.28.13.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:21:02 -0700 (PDT)
Date: Tue, 28 Apr 2026 13:21:00 -0700
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Sasha Levin <sashal@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Doug Anderson <dianders@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [regression] of: mis-parsing Depthcharge's /firmware
Message-ID: <afEWrApcO-SRP5Th@google.com>
References: <e77669ea-9edd-4321-8d17-4da40161b59d@linaro.org>
 <Z0R6myuCR4Jpmc_y@sashalap>
 <CAL_Jsq+QBweDZ+1=FXq7Hez=+mhiOxOvurr3rP0+3y_FCd49Ew@mail.gmail.com>
 <20241209092809.GA3246424@google.com>
 <aeKlYzTiL0OB1y3g@google.com>
 <CAL_Jsq+UCYbKMXG5m8BRNVRA_03Ki8aGF0uoaDs8HHvOSCZ2Mg@mail.gmail.com>
 <aeaTSYyaqQjuP29U@google.com>
 <CAL_Jsq+qmHV8VJ1J61nUupNBZSQrqzwCV3oOjkeqc0VFBt2aDQ@mail.gmail.com>
 <aeaussSE6_TN7xk4@google.com>
 <20260421193038.GA1502234-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421193038.GA1502234-robh@kernel.org>

Hi Rob,

Thanks for your thoughts. I delayed a bit since I wasn't really sure
what the right conclusion was and wanted to give it some thought.

On Tue, Apr 21, 2026 at 02:30:38PM -0500, Rob Herring wrote:
> On Mon, Apr 20, 2026 at 03:54:42PM -0700, Brian Norris wrote:
> > You say it's not novel, but then you say the only existing code is
> > either:
> > 
> > 1) completely different, and only applicable to powerpc or
> > 2) only on your local tree.
> > 
> > That sounds novel to me :)
> > 
> > Anyway, I'm more inclined to lean on my #1 and/or #2 than to write a
> > whole new fixup layer. But maybe #1 can be replaced in the future if we
> > come to really want/need a generic fixup layer in the future.
> 
> The problem with #1 is a) new platforms can then repeat the same mistake 
> and b) we'll forget what platforms needed some work-around and whether 
> we still need to maintain such a work-around. Well, I might not forget, 
> but the next DT maintainer (applications welcome!) even won't know. For 
> example, I have know clue if we still need to carry some of the 
> work-arounds embedded into the interrupt parsing code. That all 
> predates me. The only way I find out is breaking them (I'll never 
> understand why people still run PowerMacs from the 1990s).

Ack to most of this. I'll note that it's possible to write unit tests
for this, if we go for the in-kernel route though, so hopefully that'd
give maintainers a bit more visibility.

> Calling the fixup code a layer is an exageration. It's on my kernel.org 
> tree in the dt/fixup-infrastruct branch. And look, guess what issue it 
> was that it has a fixup for.

OK! I spoke in ignorance then. I really haven't explored the device tree
construction / unflattening logic, so it was new to me.

If it really comes to patching the kernel itself, I'll consider pulling
in your patch. On first glance, it looks good, and not that complex even
to an outsider like me.

> > (Frankly, if we do #2, #1 and #3 will probably both be redundant and
> > unnecessary. I don't know of any case here where we're relying on strict
> > DTB ABI compatibility with no opportunity to update some of the DTS
> > sources.)
> 
> Shrug. I thought the ABI was a concern here. It's ultimately up to the 
> maintainers and users of a given platform whether or not they care about 
> the ABI.

I'm usually on the receiving end of people complaining about ABI. It
seems like we bend over backwards in a lot of places (drivers, driver
frameworks) to maintain some idea of DTB ABI, while in practice, the ABI
is almost never a strict concern for anything I've dealt with -- 98% of
the DTB is generated from in-kernel DTS sources that match the kernel.

($subject case is actually the closest we get to DTB ABI concerns,
because it involves the small part of the DTB that is generated by a
program that is independent from the kernel tree. But even there, it's
possible to fix the issue in the kernel-provided source.)

So it seems to me like maybe it's best to just ignore the ABI concern,
patch the DTS and call it a day. I've done that here:

  https://lore.kernel.org/all/20260428200712.2660635-1-briannorris@chromium.org/
  [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to Chromium-based DTs

If someone finds reason we should still go back to fix the kernel
itself, I can resurrect the fixup logic in addition.

Thanks,
Brian
