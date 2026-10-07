Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03143F12F9
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 05:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791350997; cv=none; b=UN6yFxhh0nHnpj6iFJK42NGcnCQxy3mx2T22/IUN+2p67jkKUWHbPvGhl5gXhsIYSyvsTLG/jjcLYUAUiwwL0FNvKuKCCEAspIoyinAxUWcE9RnnixpIT26hu4KzIS6q2wksYgoby+SQ387pF0ys5Wvz0Q3BcQtNxnv6wO8rItE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791350997; c=relaxed/simple;
	bh=PyqKuf3Eaq6OuyyATIWD0JTGuSoFfNtC+6Y8klcsOXk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gF9nbdbpSi+IaaVvAHkGyxIBydhB0kCRnNZsUCXplctN+//GfD4d3tifXRyDNFDWQYIKOta18D4Ju6N/C/p9RBqv9+81KF50FVyDtwi05npmP/qbN1sASc8iJNP2NTFIYs5HYTVftt5RrHkCiqDMJE47ZuqByZ78xYCV7TeZsmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NaGTseLo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NaGTseLo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F201F0089B;
	Wed,  7 Oct 2026 05:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791350996;
	bh=0ZyNh5Mz8BFsz9GxJ0jaOgf4I8KhjwJm77ZW1X1UvpE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NaGTseLocdKe0gSxMyJT+KNE6ZiGlXmJBb5dvZMWXIrKrMEfFZYSFp+BzTcN1IogC
	 IZHdyoq1Yy0Kam5gR7cq/rZ/w0Ka7d9IKY54Dd30lA3xZdCIOkn7ZIZPrGUUyBdE80
	 9MdMEh438xymVbJYfSvRTS1swvvT98AOa5xInB1WcmYbmf4GLgY5aNHasUE+ujuUoo
	 CDjFBmZ4d45SvIYcG3nahfojTF9hLyebwFPQlcXS5wdS0oLHaN8+/QRv5PxSBfq/a9
	 9J3nUqbzFedqdQ8GQOOnY2b00R/8NpcM4QmFrnR7AXsJK9TM7JRKrJZ9XO7airnBPV
	 ZrjH7DaWoR+/A==
Message-ID: <sashiko-outbox-162642@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bob Hui" <bg9oxa@163.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261007-quarkpi-ca2-v8-2-b83192bed07b@163.com>
References: <20261007-quarkpi-ca2-v8-0-b83192bed07b@163.com>
 <20261007-quarkpi-ca2-v8-2-b83192bed07b@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 05:29:55 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: commit message claims two LEDs but only one is defined
--

commit f459a1ed57a7152764a79524707ba54a9a7ff857
Author: Bob Hui <bg9oxa@163.com>

arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2

This commit adds a device tree for the ALIENTEK QuarkPi-CA2, an RK3588S
based card computer. It describes supported peripherals including Ethernet,
HDMI, USB, audio components, and basic I/O like keys and LEDs.

Closes: https://lore.kernel.org/all/sashiko-outbox-162297@kernel.org/

>     - 3.5 mm headset jack (headphones + microphone) with the ES8388
>       codec, the headphone amplifier and jack detection
>     - three function keys (volume down, volume up and PWR_ON from the
>       PMIC) and the headset hook button
>     - IR receiver, 4-pin PWM fan connector and two LEDs
>     - 3-wire debug UART (UART2)

[Severity: Low]
This isn't a bug, but the commit message claims two LEDs are supported,
while the device tree implementation only defines a single work_led in the
gpio-leds node.

Is the second LED missing from the implementation, or should the commit
message be updated to reflect the single LED?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-quarkpi-ca=
2-v8-0-b83192bed07b@163.com?part=3D2
