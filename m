Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39C93BB131;
	Mon, 10 Aug 2026 11:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360444; cv=none; b=lR47oEB1MWGoeurStqZbySWfuWR42vwiTq8khc/cmO4eNlH1G7VFFyU4rdhpuspjiOuFjoxE/ieaWCiyjEnGAHThBlkuEUpn7oRlwV7TJ6Vfi23w2Pn/XXFjvx8/LEKSaoaB6W7/Gei5v90sAlnye84oBCzF15rSLRHrlaU1WbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360444; c=relaxed/simple;
	bh=1ZrzMuQRISGllF9tMSiLOx8gPeEquDAjhXpQu6hiauA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMAjEhK5fs3svssrjEKieF5A4MKZKYFqI0T9fx4AX2DB+4hblxK/vDSqm/KhIa7Tc5275rNCP1B0niRR57UfIrRT43yYyUXOImogNGMr2i+TFvdThHLxVFqZ+o43kHyMn8GuhirTpOjmOna9OANrOv2pldoqexOoF0J+feY+WUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sBoJIbFH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8M9UZhHJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sBoJIbFH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8M9UZhHJ"
Date: Mon, 10 Aug 2026 13:13:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786360440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r4nGvXPsWJuwyBMIlf3XtK/H52w5DG4jgy1kwvSaw5g=;
	b=sBoJIbFHEDak6cyv8L6XEGtm5J6FbBrRbDYLM71gW0uy8R4+lHAe2NZN3TAB+Jme/1k045
	3nNVfPqOcg6JHLmx9gEqUoWlIpJ8499kozHpf13rjGiZVjqYF4neK0oDvsLWnuAXJlF7q0
	ic9YNDle9sWL5iVn8kWe74nMTXyKJAJNPVf1zHj9r+gTrqPE/agiTi0GdAVkpIl8NXos5l
	wU2dqEXFN5NB8Sw25dJEU4qaPiJeaIgJlcwiS9CZ4IH8kiRoXrWJH5qLzD8xjf48BeL1Gu
	KZg4GLuPCyCzbmrfF+69to9yRJ2Ns3bvbh0fHr5kPy6iuRuZ33rrpZA1YwdZzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786360440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r4nGvXPsWJuwyBMIlf3XtK/H52w5DG4jgy1kwvSaw5g=;
	b=8M9UZhHJ8PpbLcPxMvofNRwhipNdROgHHMFzMv5I+mwIh++jg1nLW0g/b7h7WTT0wQlfaJ
	Aj9xL8mQ6okS+WDQ==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Message-ID: <urrsc6dippljgmlochdnetolkhqqj25bbyosgcrw5hy6jpbpao@cgf332hhgdjv>
References: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
 <20260804-bcm2712-d-stepping-compatible-v3-2-1860094486eb@linutronix.de>
 <6ed9b2e5-b700-477a-8f6f-cb48c597a111@gmx.net>
 <vv6ufnanks27moditlav2ebaub6m5te5tag3m6qv5l65cm25iw@i7m54od3wz4k>
 <ddcb0d9a-2dd4-4808-84db-caf6ea64b48e@gmx.net>
 <pwdgjsfwdnkce4lkkda2hlopajuwuit6jkx2wztoeu4jzzv5ay@yoo4ofvwgrnu>
 <20260810-mustard-sloth-of-enterprise-84b68d@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-mustard-sloth-of-enterprise-84b68d@quoll>

On Mon, Aug 10, 2026 at 09:19:35AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Aug 05, 2026 at 02:52:44PM +0200, Gregor Herburger wrote:
> > Hi Stefan,
> > On Wed, Aug 05, 2026 at 01:55:50PM +0200, Stefan Wahren wrote:
> > > Hi Gregor,
> > > 
> > > drop Eric and add Peter.
> > > 
> > > Am 05.08.26 um 09:27 schrieb Gregor Herburger:
> > > > On Tue, Aug 04, 2026 at 04:57:09PM +0200, Stefan Wahren wrote:
> > > > > Hi Gregor,
> > > > > 
> > > > > sorry for my late reply.
> > > > > 
> > > > > Am 04.08.26 um 15:13 schrieb Gregor Herburger:
> > > > > > The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
> > > > > > and in a c Stepping. There are two separate dts files. The
> > > > > > bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
> > > > > > the d Stepping. The d stepping does not set its own compatible/model
> > > > > > string but uses "raspberrypi,5-model-b".
> > > > > In case the SoC and not the board has a D stepping, why do just change the
> > > > > board compatible without the SoC compatible like "brcm,bcm2712-d0"?
> > > > You mean changing both compatible strings? Like this:
> > > > 	compatible = "raspberrypi,5-model-b-d0", "brcm,bcm2712-d0";
> > > I just want to mention that your explanation doesn't match to your changes.
> > > The first compatible represent the whole board (RPi 5) and the second one
> > > represent only the SoC (BCM2712). Since the SoC is different according your
> > > explanation, i would expect the SoC compatible needs to be changed. And in
> > > case the SoC changes, also the board won't be compatible anymore, correct?
> > Yes the SoC differs in these two versions and the board is maybe the same (but
> 
> Different SoC means different SoC-compatible. If the soc is soldered to
> the board, then it also means board is different. Otherwise how can it
> be the same board if it comes with different elements?
That makes perfect sense. Thanks for the explanation. I will add a board
compatible and a SoC compatible.
> 
> Of course boards can share schematics and everything except some
> component so you could have common compatible.
> 
> 1. Rpi 5b d0
> 2. Rpi 5b
> 3. bcm2712-d0
> 

But I don't think that should be done here. As you explained in the previous
iteration [0] we shouldn't add a non-compatible fallback.

> > not compatible). Compatible strings should go from most specific to most general
> > [0]. If we would have the same first string for both steppings it wouldn't be
> > distinguishable. So at least the first string must be unique.
> > 
> > E.g systemd-boot only matches the first compatible string [1].
> 
> 
> If systemd-boot is not following established for 10 years DT practices
> that systemd-boot's fault, not something to be fixed in DT.

I don't think systemd-boot isn't following these practices. I just wanted to
explain what was the problem for me, and why I wanted to solve it.
> 
> But anyway I did not hear anyone adding/using wrong or fake compatibles
> to satisfy systemd-boot for other hardware.
> 
> Best regards,
> Krzysztof
> 
Best regards,
Gregor

[0] https://lore.kernel.org/all/20260804-unbeatable-fluffy-galago-bfe282@quoll/
