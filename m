Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EC443CE48;
	Tue,  4 Aug 2026 08:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832718; cv=none; b=VvKFx35rUMrlRYx2G+tO4f+234iofOKT7Zf65Oku++0yeZBEjOS1cYklWj55hhNa9Fz2bxZZl4NP7lL83C8gbyp/+qyax+amMW+OscfHBHIOJMJQXCQDVAT4KTFRP0svURHE4EC4SqQMI5GLyoq/rCD4v3N8RlDpmq2AbwKTz8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832718; c=relaxed/simple;
	bh=uCAR0p7vm5F/wsJJIW7PYRFyldGRRSwYbc2ko0lpazs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lM4saSYwHvaHQugFH4psEC8wicJWdun1lb4GPr3DV66HUDdzz3xLJ114W3ddAvJ7qYSH/IHfP4f6eOaovKQySItqo2x7PB8UZ1AVTwlOOZ/t/4TZY6qlsczL7fPPXyORbxXrj8mUhQaxLN4rMuJ2b2Zg6remZ78Sjssa20CyAsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1q/hFnrA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zT4d68oF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1q/hFnrA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zT4d68oF"
Date: Tue, 4 Aug 2026 10:38:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785832708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+1e25DepZeRbvIwYwRbIXVPUAS5ZIcSEjcncQ0Lz1j0=;
	b=1q/hFnrAZKARngwsSSFG1fn+ERHWPeK/Q2PYhSEUIw+JBjXJMalKpB/IRpkA/FczwznZA5
	00JnC7IybC+zT01et5FF52tsoxpr23aMm0GdTAN8XV0m6OCofsJg9jMKEh4gpf8jGmkv7a
	MCN6eq5bqP17thiA2c32LsqI2ecbeBxMWvW6BRfRm/095xSGYHP9osD37v6ytY0T32WUQi
	H9jJ/mARccK3HM2cerNjma2b6w67wRWE5DnhlroKxHoz73fjdXEg+IFFkKnYG7L/nqI2xG
	/4c36vjIJs1ocrTb//ggW+xOv9+/QtR2uc43+/+qAk2WwoIi3f+AIEMHoScceg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785832708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+1e25DepZeRbvIwYwRbIXVPUAS5ZIcSEjcncQ0Lz1j0=;
	b=zT4d68oFcXnLYbELnfcG/wL8TM4UP8eCkJ/ZXKy/ykvMWk/pP+KjIs77W+zu3gJH0O8IEA
	ChFCSfBtI1FyVgDQ==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Message-ID: <zl5z6owx4v5kg2ian7twpggekaosrenbhvgjq7fimm5j2ptz4i@ygvudatdkems>
References: <20260803-bcm2712-d-stepping-compatible-v2-0-803017e4ba7a@linutronix.de>
 <20260803-bcm2712-d-stepping-compatible-v2-2-803017e4ba7a@linutronix.de>
 <20260804-unbeatable-fluffy-galago-bfe282@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260804-unbeatable-fluffy-galago-bfe282@quoll>

On Tue, Aug 04, 2026 at 09:48:19AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Aug 03, 2026 at 02:09:25PM +0200, Gregor Herburger wrote:
> > The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
> > and in a c Stepping. There are two separate dts files. The
> > bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
> > the d Stepping. The d stepping does not set its own compatible/model
> > string but uses "raspberrypi,5-model-b".
> > 
> > These two steppings are not compatible. Booting with the wrong dtb file
> 
> Not compatible but...
> 
> > causes a crash at boot.
> > 
> > Add a compatibles string "raspberrypi,5-model-b-d0" to allow us to
> > distinguish between those two steppings.
> > 
> > Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> > ---
> >  arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> > index 127be0fc27c2..11a38cd53401 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> > @@ -3,6 +3,11 @@
> >  
> >  #include "bcm2712-rpi-5-b.dts"
> >  
> > +/ {
> > +	compatible = "raspberrypi,5-model-b-d0", "raspberrypi,5-model-b", "brcm,bcm2712";
> 
> this tells they are compatible. If compatibility was wrong since the
> beginning, you do not have to preserve the ABI.
Ok understood. Will drop the fallback and make it either
	compatible = "raspberrypi,5-model-b-d0", "brcm,bcm2712";
or
	compatible = "raspberrypi,5-model-b", "brcm,bcm2712";
> 
> Best regards,
> Krzysztof
> 
Best regards,
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
