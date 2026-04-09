Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EED1A304A;
	Thu,  9 Apr 2026 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775739812; cv=none; b=nlyCRcKCbcv/4VFDMGKXJRnBYOsyGFvdNQtzeIpdjTlLPB6vjL5pnCqvOtGaLLJIUpAaeDVxsebXmGhfu207YyXmB03FjDaqelWfQJLYXnbGY14GIjycFwvcvZ7Z37bSyDgNsV6gIk/UXaQgfHkRR5JZd/PL3ng/qsrsdT2gRfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775739812; c=relaxed/simple;
	bh=57Hzbn7VgxB8wp+hdPFHE2NKlKzrlyinmgCnM1LOJgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8ttFBHKsJY94QL+t3R2kbnLOq3UZTH/OTLIy5yd2tuJTqH/x0UFGClfdll/7T3cmO2NDjtx85vZ3ebSi2iOeoRwQUOyCnqeK4KSEF5H0/MGuL5zB7Z8hgAnCYFglIL8WzABgwoXGiK4lA3Or6Do57+3Fq2ylyAwc+SeX20ISVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ctNLCvH2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WHNeEGyM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ctNLCvH2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WHNeEGyM"
Date: Thu, 9 Apr 2026 15:03:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775739809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DwJlkFrhXzK7YdnSXVZfyWJS5imgv2KYNIEwcWCOQ/8=;
	b=ctNLCvH2k8O94oUP1N7f/9X/D3DXIaElsVGQKpzKYxDPzKEfCNlIoa8UP3a5EOods5vqWP
	jPg0NVwPnkvnA2UwBLabCE+8oK2fwU6qsqnXlacF21uIHMVRsP9c3/5c9nnURQQ2p/wMfL
	sVCFT2Ryzyny3mgvZwNjR5c/AQECODDGus7vEJKD0vmPQTs2Jcc9YiK6mzoxgIzaAjp4T1
	kOFPuQ8ub5hfZ7xFog/I0l2/X2/S5JrilXJ9mlegVjMQH1CYCOd5jP1qOCHfy6R/QlR4+M
	8yVTjO9/p+MSN/3qnsoqtl8akpWnBiDCh1omh/3iqKaUVhP4abK+cBHTfeqy/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775739809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DwJlkFrhXzK7YdnSXVZfyWJS5imgv2KYNIEwcWCOQ/8=;
	b=WHNeEGyM4IcIbFjVS5M7g8lLx9V0wq7twewtNqp/19K/t/+Kdxn/LMSS2J9ISiUIPRTfW/
	reD7dStCliSNcKAg==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>,
	Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: broadcom: bcm2712: Add the otp nodes to
 firmware
Message-ID: <adejoCVSpOW5wygD@gregor-framework>
References: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
 <20260408-rpi-otp-driver-v1-3-e02d1dbe6008@linutronix.de>
 <20260409-imposing-strict-snail-5d2a6f@quoll>
 <adeVWKcQyfkKKY5J@gregor-framework>
 <2aa66897-12ce-47c5-993d-e9e1d01a0cdd@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2aa66897-12ce-47c5-993d-e9e1d01a0cdd@kernel.org>

On Thu, Apr 09, 2026 at 02:15:32PM +0200, Krzysztof Kozlowski wrote:
> On 09/04/2026 14:02, Gregor Herburger wrote:
> > Hi Krzysztof,
> > 
> > thanks for reviewing.
> > 
> > On Thu, Apr 09, 2026 at 10:15:12AM +0200, Krzysztof Kozlowski wrote:
> >> On Wed, Apr 08, 2026 at 10:00:17AM +0200, Gregor Herburger wrote:
> >>> The Raspberry Pi 5 has two OTP registers (private and customer), add these
> >>> to the devicetree.
> >>
> >> So this sentence confirms my question on bindings - your device
> >> raspberrypi,bcm2835-firmware has these, thus you do not need these child
> >> nodes at all. Neither compatibles.
> > 
> > I dont't think so. In my understanding the bcm2835-firmware does not
> > provide the otp registers but only provides the interface to the
> > registers. Though I don't know the details how this is done but [1] says
> > that only BCM2712 has 512bits and the others (like bcm2711) have
> 
> Still the same. s/otp/interface/ so your device provides interface.
> 
Ok understood.

> > 256bits. So both devicetrees have the raspberrypi,bcm2835-firmware node
> > but only the bcm2712 has the raspberrypi,firmware-otp-private node while the 
> 
> Why does bcm2712 use bcm2835 compatible?

I have no idea. But it is like this.
> 
> Nodes and properties are not a solution. See DTS101 question - "...
> because my new device, which is compatible with an older one, does not
> support ..." and answer: No.
> 
> 
> 
> > raspberrypi,firmware-otp-customer is available in all raspberrys.
> > 
> >> Drop entire DTS and binding patches.
> > 
> > If I drop the binding patch how to distinguish the variants? Should I
> > add a SoC specific compatible? e.g. `raspberrypi,bcm2712-firmware` and
> > use it in the firmware/raspberrypi driver to add the second otp region?
> 
> So you have different devices/variants? What is the "variant" here?

Seems so. I suppose there is at least a bcm2712 variant and a non-bcm2712
variant (which is currently confusingly named 'raspberrypi,bcm2835-firmware').
> 
> Writing-bindings asks you to have per device compatible. Why standard
> rules do not apply here? (see also DTS101)

I am not arguing that the rules do not apply here. I want to find out
what is the correct way to do it. 

Should there then be a 'raspberrypi,bcm2712-firmware' compatible with
'raspberrypi,bcm2835-firmware' fallback?

> 
> > 
> > Also what I don't understand why we have all the bindings for
> 
> Neither do I.
Ok good. That is what confused me.

Best regards,
Gregor
