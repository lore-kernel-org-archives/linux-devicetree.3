Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499F03E2751;
	Wed,  5 Aug 2026 07:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785914866; cv=none; b=n6il86O/jui8hl+WqnsovGUo2xZwL4diOfTJ2Pt0yC9my4+E/Pc6jG8lVeadQ+BVeSQhF3L5mt1DG4GC4Mo5KgrUO6dwBZVqhjPSTBeH+8y2GYtFvLHffzgTRs6E9Qz16GR1f2MMhDRnqr33YrwwvjcM0SVtt0rjWX1NgFlVrKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785914866; c=relaxed/simple;
	bh=/THlU54KUko1Cw/ErGgDQYX/dRBeRks7OihaDRRj1Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6zyPjDEuibcrvtV6UgWGWoPgmxGGqOcunQRUOUesQ2KGZpG0WZ1+X9v79nNg7Ps1lrijVS1d4J/efliVGt+aJ5A+9xJtJvzo81N7HWyLeF+a/Ta+yqhE++plSSXqm9bcWwWuFSyzgSC1lPlho7CNiKORt+UajSpKUuRIbceURY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yEayGdda; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fkzURMFP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yEayGdda";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fkzURMFP"
Date: Wed, 5 Aug 2026 09:27:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785914863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRnmSwfePuxjzp3S3366V2iKuGTS0E5jGJbo3/yzTqY=;
	b=yEayGddaDKi2zac0rvSRmjjvtr1lIAegfo0pQUMXWYmEfWWGeLMLxxSFzkYq9+QyNN+bsJ
	ACYgn6vC4qdJK/LQHJHd6qgOmecgYZg3tuKadXmFaLntp+3bntqmrmWp3YHcYPrSx4MkYq
	KUIYmTBkyo5ODeoHXPokddunWa0qXSjgT5JBWhTxv12cVAdxZOUihsTaAj1YxR9MRLE7Sh
	faQJ6rGQMqHwvXpZ/QWtLsV6XYMMVKk+JAXVv6Ig6Wvd3xOHvEcI7mkK87PfCPzhGRD1Nx
	KaFz5ndvZ0fGWBSe76bLcx8V+d/Wkg1OcXDfH3BCp7czsobPSD4Rs2ATRXvTRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785914863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRnmSwfePuxjzp3S3366V2iKuGTS0E5jGJbo3/yzTqY=;
	b=fkzURMFPZeNTOuzVlxu4KF2sqGwU73Oo0MmvEOCYJNKxGa44uyEPBf59FbH1Kc4MBchImb
	bL2YR40YTXln9pAA==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Message-ID: <vv6ufnanks27moditlav2ebaub6m5te5tag3m6qv5l65cm25iw@i7m54od3wz4k>
References: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
 <20260804-bcm2712-d-stepping-compatible-v3-2-1860094486eb@linutronix.de>
 <6ed9b2e5-b700-477a-8f6f-cb48c597a111@gmx.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ed9b2e5-b700-477a-8f6f-cb48c597a111@gmx.net>

On Tue, Aug 04, 2026 at 04:57:09PM +0200, Stefan Wahren wrote:
> Hi Gregor,
> 
> sorry for my late reply.
> 
> Am 04.08.26 um 15:13 schrieb Gregor Herburger:
> > The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
> > and in a c Stepping. There are two separate dts files. The
> > bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
> > the d Stepping. The d stepping does not set its own compatible/model
> > string but uses "raspberrypi,5-model-b".
> In case the SoC and not the board has a D stepping, why do just change the
> board compatible without the SoC compatible like "brcm,bcm2712-d0"?
> > 
You mean changing both compatible strings? Like this:
	compatible = "raspberrypi,5-model-b-d0", "brcm,bcm2712-d0";

Don't know actually. Have not found an example for something like this in the
tree. I prefer it actually like it is. Would like to hear the opinion of an
devicetree maintainer about this.

> > These two steppings are not compatible. Booting with the wrong dtb file
> > causes a crash at boot.
> This sounds like the patch should have a fixes tag?
Yes can add one.
> > 
> > Add a compatibles string "raspberrypi,5-model-b-d0" to allow us to
> > distinguish between those two steppings.
> > 
> > Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> > ---
> >   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> > index 127be0fc27c22..5a86ad69645c3 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> > @@ -3,6 +3,11 @@
> >   #include "bcm2712-rpi-5-b.dts"
> > +/ {
> > +	compatible = "raspberrypi,5-model-b-d0", "brcm,bcm2712";
> > +	model = "Raspberry Pi 5 d0 Stepping";
> > +};
> > +
> >   &gio_aon {
> >   	brcm,gpio-bank-widths = <15 6>;
> > 
> 

-- 
Gregor Herburger
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-Mühlhofen
Phone: +49 7556 25 999 35; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy 
can be found here): https://linutronix.de/legal/data-protection.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-Mühlhofen | 
Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700 
806 | Geschäftsführer (Managing Directors): Dr. Wilfried Wessner, 
Katharina Kopp, Alexander Gieringer
