Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E3F24A06A;
	Tue, 30 Jun 2026 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827799; cv=none; b=c76PnCQYfUcJaSVMGYQI6Xu9yaOM0WSv+DvBZteuJ10QnJoI45RwwY6M4Xm0abzw4CAQHZlwg1GEjZqWzoISTq0I85TumB74Se4PdFG9R9gDg1DaWtYEIe9g/YUJkbmB14L6XcDD3VYj+i4eFgi/vlhbC5R49GIGz4zXs3yzsoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827799; c=relaxed/simple;
	bh=xvX5VkZXF5nHtH6VZ/k9sZR+flStkYwN5UI4SzNwvdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PI02/JLj0XZRagVJRiLk1dmpID+vLbHIoUhpore9jbEy71lZ/DG8lMvK4crgsoH9I7um3TNdIlkhVqkg1c67WGGVwABJLgefRQiCCtkkdU86AZ3pBf7qWCxmGwqVAJuEI+vCqG8+ewKGGzeqY7ykMrL6Y4QaXO0f96McQH83d0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0rb3Nqkg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AHHvtVMR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0rb3Nqkg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AHHvtVMR"
Date: Tue, 30 Jun 2026 15:56:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782827796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=weGolSbdA7OP6EvHvm4+CdGLpzTlp7bfL85xlugRMfE=;
	b=0rb3NqkgCzFv6dbBuCuwXzrZKSBa9njLgZ96iT/WN43BeeKU3gr7MEpntPp3hzITKwsmuY
	VRnpSAkMk4n25hUGcfgk5hEB8A5vlKZJxXYw2qZ2ZDH2nL4vILUyUYbjcbOk7i1WaPCrFG
	YqegR+OEwAsQh+3ZtZbOvmUbYG6PrSShi2JKYJf/to8ygpc7GO1vniz6Ce3+/YhTI5Ox9w
	Axm575H+QFTgVpiSceVMLzAd4Xdlxztidtq6oDovgYQB6BbDet1bss/O4obc1jQKxnaNWU
	65+gwQggwkCl4iqgWoj1Em/YqCKfnsFIySkurNFaJMtpLBvrpA7SpUsTTfV/MQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782827796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=weGolSbdA7OP6EvHvm4+CdGLpzTlp7bfL85xlugRMfE=;
	b=AHHvtVMRcbJ8NFESLjJ5OP0fWjOj4UyyFmEdYuob9ujo1w8bqGZtuNYhkwxgkZVUVoIh4Z
	ZqP9vst7URTmScDw==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: raspberrypi,bcm2835-firmware: Include
 'reboot-mode.yaml'
Message-ID: <qgoblikagfbcmbqoryw4ajfa6qyx3wpj4qfeuuntima542qlkq@evebdvjaxern>
References: <20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de>
 <20260626-rpi-tryboot-v1-2-490b1c4c4970@linutronix.de>
 <20260626-quaking-shove-fcc9d8057ae0@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260626-quaking-shove-fcc9d8057ae0@spud>

Hi Conor,

On Fri, Jun 26, 2026 at 04:57:35PM +0100, Conor Dooley wrote:
> On Fri, Jun 26, 2026 at 09:35:05AM +0200, Gregor Herburger wrote:
> > The Raspberry Pi firmware allows to set a reboot mode called tryboot
> > that allows to try booting from a different partition to allow updating
> > of the boot partition. Allow reboot mode properties by referencing the
> > reboot-mode schema.
> > 
> > Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> > ---
> >  .../devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml    | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> > index 983ea80eaec97..30b490e0d9fb3 100644
> > --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> > +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> > @@ -133,11 +133,14 @@ properties:
> >      required:
> >        - compatible
> >  
> > +allOf:
> > +  - $ref: /schemas/power/reset/reboot-mode.yaml#
> > +
> >  required:
> >    - compatible
> >    - mboxes
> >  
> > -additionalProperties: false
> > +unevaluatedProperties: false
> 
> I think you should keep additionalProperties: false and add
> mode-normal: true
> mode-tryboot: true
> 
> (I don't know if the latter works though, you may need to have a $ref to
> uint32-array).
> 
> What you've done permits freeform reboot modes, but I think only normal
> and tryboot are valid?

Ah yes good point. I do think it should be restricted to
'mode-{normal,tryboot}'. 

Sashiko also suggested to set maxItems to 1 and I think that is a good idea as
well, because afaik the firmware only accepts a 32bit value for the reboot flag.
The $ref to uin32 is not needed that is already enforced by the
patternProperties "^mode-.*$": in reboot-mode.yaml.

Therefore I will add the following (and keep additionalProperties: false):

properties:
...

  mode-normal:
    maxItems: 1

  mode-tryboot:
    maxItems: 1

allOf:
  - $ref: /schemas/power/reset/reboot-mode.yaml#


I will do some more testing and send a v2 later.

Regards
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
