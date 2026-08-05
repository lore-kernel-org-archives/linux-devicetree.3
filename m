Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F02246A602;
	Wed,  5 Aug 2026 12:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934372; cv=none; b=nJl5L3/cRoQtvirG9we6jIQL5mSirYhdPR7M1IyJoZMPYfAQYHQ+Mu7Kxwj/EFrsl44JPBXCyhLQWaq0ZEO978aJygbK6ntFHdl1amrhZr5E8TB1l1dvzkS9d9lLGX0FgQAkUz+GJWkFMaScBYfJC1GEQ5kJUQ8u1wkH786uaZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934372; c=relaxed/simple;
	bh=mzmhF4EcfdwNWwVCRx3Tqn9b0qcnzxvbJRPucUE/yjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4AzJY9h6cVcY2AITcEMeXTl24NT7jQQ7jhn15gVKzvrnWVTiderbZu2L8fjZ7UT83q/F933hDzTPMuKZcJS9qO9+97GXdNdHuGy5N+m+C7vD8hEu3X9ne8/RxyDLrTnCE+pKnDkxwhsjkduOhzi+iePHtxr9tJdqXTZaPDWY88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LzsgJVxI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ep1GKYnU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LzsgJVxI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ep1GKYnU"
Date: Wed, 5 Aug 2026 14:52:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785934368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pofSOdMD4O1rXQg0NLtrKp9wqn2ibY86SziBn0efrc4=;
	b=LzsgJVxIG1WKomLp61/87hHQyLp3pXdbbxE/GAzQEfYhTAdW0uXUvZRK1wYfIVsH0CQX/K
	tJy4mZze8ajzW/avppNgmTDPxh3N+LPqT1Rjrcsj3B67UiQG+4KTeA2TU2x2Jk5nsRZaOm
	gQuvSBAQ5/oTFsWvYZcquHpWuBq7GE1rExIgfK/7MlXT7xBPQV/wW0z+ECtYz9iaXLvWFZ
	r4S3qGyagEMdaMv1sBnr9vhJm/tJGDd7BCb5fWE/p/ym1mp9Uhk3ljyxlgFyhjcv59tQaq
	m3Dou7bYcKyV9kDA8MKIYY8wmXc4oBGNXRXFhl40veFmBAS62g+9NZTnkBNECw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785934368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pofSOdMD4O1rXQg0NLtrKp9wqn2ibY86SziBn0efrc4=;
	b=ep1GKYnUZxx6qGmMXXGcDHXTICuF/xvIvx2ktxEfv4iswmeQ0R/XxlQi7BrfOjGfUiq7pc
	iA++UPAv5pOxGZAQ==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Message-ID: <pwdgjsfwdnkce4lkkda2hlopajuwuit6jkx2wztoeu4jzzv5ay@yoo4ofvwgrnu>
References: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
 <20260804-bcm2712-d-stepping-compatible-v3-2-1860094486eb@linutronix.de>
 <6ed9b2e5-b700-477a-8f6f-cb48c597a111@gmx.net>
 <vv6ufnanks27moditlav2ebaub6m5te5tag3m6qv5l65cm25iw@i7m54od3wz4k>
 <ddcb0d9a-2dd4-4808-84db-caf6ea64b48e@gmx.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ddcb0d9a-2dd4-4808-84db-caf6ea64b48e@gmx.net>

Hi Stefan,
On Wed, Aug 05, 2026 at 01:55:50PM +0200, Stefan Wahren wrote:
> Hi Gregor,
> 
> drop Eric and add Peter.
> 
> Am 05.08.26 um 09:27 schrieb Gregor Herburger:
> > On Tue, Aug 04, 2026 at 04:57:09PM +0200, Stefan Wahren wrote:
> > > Hi Gregor,
> > > 
> > > sorry for my late reply.
> > > 
> > > Am 04.08.26 um 15:13 schrieb Gregor Herburger:
> > > > The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
> > > > and in a c Stepping. There are two separate dts files. The
> > > > bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
> > > > the d Stepping. The d stepping does not set its own compatible/model
> > > > string but uses "raspberrypi,5-model-b".
> > > In case the SoC and not the board has a D stepping, why do just change the
> > > board compatible without the SoC compatible like "brcm,bcm2712-d0"?
> > You mean changing both compatible strings? Like this:
> > 	compatible = "raspberrypi,5-model-b-d0", "brcm,bcm2712-d0";
> I just want to mention that your explanation doesn't match to your changes.
> The first compatible represent the whole board (RPi 5) and the second one
> represent only the SoC (BCM2712). Since the SoC is different according your
> explanation, i would expect the SoC compatible needs to be changed. And in
> case the SoC changes, also the board won't be compatible anymore, correct?
Yes the SoC differs in these two versions and the board is maybe the same (but
not compatible). Compatible strings should go from most specific to most general
[0]. If we would have the same first string for both steppings it wouldn't be
distinguishable. So at least the first string must be unique.

E.g systemd-boot only matches the first compatible string [1].

The only example I found for SoC steppings in the tree is the
'marvell,rd88f6281-a' and 'marvell,rd88f6281-z0'.
Although these dts are from 2014 and I don't know if this is still the current
best practice.
> 
> Usually we try to avoid to model different SoC steppings in the device tree,
> because this introduce a lot of redundancy. But it seems that the
> differences are signifcant here.
Yes but here we are with two devicetrees which are not compatible.
> 
> In case this suggestion break something, this needs further explanation in
> the patch.
I can update the commit message if it is not clear enough.
> 
> Best regards


[0] https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter2-devicetree-basics.rst#compatible
[1] https://github.com/systemd/systemd/blob/main/src/boot/devicetree.c#L182

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
