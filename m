Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4441319D074;
	Thu,  9 Apr 2026 12:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775736156; cv=none; b=RKkvaUQl6uV0yOKt/cCTFg9/9OLw1wb5JmkOG5d1Fn1xiIGbZHNaiXZWTxQjH3+eG5QoaNEBJG2WjP3Iup+omDfRCW5g+pZevXASMckLwmAaMK3ubXQ9TkQ7+jYd3Gi6k6IZnzBQDey52ukIDggK4mbV4GU0kSc3iQzmCg+vsvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775736156; c=relaxed/simple;
	bh=J4jSzE+cM6ymR4NxawGjiGjIs6sR7tcxwDHODL0Vhuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+Krtzw8DsELv9gOKgqN+Ea1DB6Yv+f8Klp9XKTUuYwAz67sa376fh/c1ilRrLCJdeMFat8YfiMWnh8zNF3G7eaTWYkTov4SJApdLf6FvCvTmmBUOPIFYjgh3CW4fRo7FvqnyymT098Y6MKmR4ErxyPCyV8vzIqxwRgWsiyj9lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HWMb02X9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PR47/d+6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HWMb02X9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PR47/d+6"
Date: Thu, 9 Apr 2026 14:02:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775736153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IA+0hrqXQEzwG3UxcQ6zFvAN49iycuH2/ZvwolQRu7w=;
	b=HWMb02X9hZnmwbsmCWmyfkn+yQxedtDdNFPT0nA9Schn1cYcVfN1OkaUy8vta68DsXkX66
	f2mrA5MUgn/QDaiVjZ2xTJVrk8WIbRsrBJktrJDq94Au5u/tsS9aI9h0zEHG4GISxR8kpF
	uHKJDG0EvbwLBDwEhOY8+J7lVDJNOSJWgBaQfAg4kVZhU8RtjfB9ksuoqhKpGU0kguJ12P
	Ndyl/mTySp3JOuKAOL0gYNs4R7irDWlpJ4BphM8tEFjrgTShGfhnSz1rHCr+JUbWxOAoCV
	k89MMO+ha/hIhwF8B6MpvjKhSfu8eLmW8uawojAf66kB6uBI6ibpJ/cORtx0xw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775736153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IA+0hrqXQEzwG3UxcQ6zFvAN49iycuH2/ZvwolQRu7w=;
	b=PR47/d+6755hTGWZuXpTUXkL0Gh4OmUTAOMPUZBTaY9D5m0+TtCgUIt5QDe+z5oAe+RFI9
	iNR1qqC8GC/A7GDg==
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
Message-ID: <adeVWKcQyfkKKY5J@gregor-framework>
References: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
 <20260408-rpi-otp-driver-v1-3-e02d1dbe6008@linutronix.de>
 <20260409-imposing-strict-snail-5d2a6f@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-imposing-strict-snail-5d2a6f@quoll>

Hi Krzysztof,

thanks for reviewing.

On Thu, Apr 09, 2026 at 10:15:12AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Apr 08, 2026 at 10:00:17AM +0200, Gregor Herburger wrote:
> > The Raspberry Pi 5 has two OTP registers (private and customer), add these
> > to the devicetree.
> 
> So this sentence confirms my question on bindings - your device
> raspberrypi,bcm2835-firmware has these, thus you do not need these child
> nodes at all. Neither compatibles.

I dont't think so. In my understanding the bcm2835-firmware does not
provide the otp registers but only provides the interface to the
registers. Though I don't know the details how this is done but [1] says
that only BCM2712 has 512bits and the others (like bcm2711) have
256bits. So both devicetrees have the raspberrypi,bcm2835-firmware node
but only the bcm2712 has the raspberrypi,firmware-otp-private node while the 
raspberrypi,firmware-otp-customer is available in all raspberrys.

> Drop entire DTS and binding patches.

If I drop the binding patch how to distinguish the variants? Should I
add a SoC specific compatible? e.g. `raspberrypi,bcm2712-firmware` and
use it in the firmware/raspberrypi driver to add the second otp region?

Also what I don't understand why we have all the bindings for
'raspberrypi,firmware-clocks', 'raspberrypi,firmware-gpio',
'raspberrypi,firmware-reset', 'raspberrypi,firmware-poe-pwm' and
'raspberrypi,firmware-ts'. What is the difference between these devices
and the otp registers. They are all accessed through the firmware.

[1] https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#device-specific-private-key

Best regards
Gregor
