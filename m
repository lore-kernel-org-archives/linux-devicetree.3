Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792442515;
	b=ABphAjWoAf57CpvRZeYb1LUuRtFZiKcbH8qoMgDaAgtMy01jihs6vwP0XF3QrSvtrEuO
	 VZjHPR7lCMvyKxPxZ735Kz1Jtk4AT7wtItX4Mdo87TXI3uiBqdtEMeAVtMiKqOeFclJ8D
	 I4paEn9NNKSf9C/IVkDhjqR1v+F7G9NSXSU5KQM9uGxiKDEJmHHw8SDC27hBJTXOCiJgQ
	 bWaN9VL3zFzXyI0abxxMlBPiISQJvzlKvWcJJrokqWKeapBTOOUdse9FhHNzbt8hnpz7v
	 cHqv7c8mUnulN5FRrtsyrGjKYa0nxsUI3c/ky6lIwP+izTREd+c9Kr96lOt99AiusRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792442515;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=1OqCBZEU+Pd0NjT6IFooBVYOMysmau4mF1Iu3HMfa8Q=;
	b=p6bRHBNaD6C7Ii+czOlltTpkeycSvl6om6oUpv7nmD3jYYf+Y+4qEF7XzSmJXSQC2E5L
	 wbMt+J1bVZMQ5mDSaEP2aV5x9ztpG9Iq0T4CWYp89JhDctidouN1lMa12xuoiIos96/W9
	 k/oeb/U7pHhXVuPib3DN7Nn/EFCOWK3O0uTIRRcXedG3Js2NUkLfJtsLkVI64vk6f/uZJ
	 DcQPONzf6Sf5pzYQtLfpoCAJpI2HHWbnfuTd3fW1r6b3BU1EW1oPi8szAot57O9xFuzg+
	 ZCNB5ReE2N+2/ingo/545GX86uw0SRz2kueQqOOnTMKBCRLxjXSEtxHG41+AbRMZ/Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=125FkxPy;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207BC606A31B
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 20:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 207BC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=125FkxPy
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8FE5D1A11F2;
	Mon, 19 Oct 2026 20:41:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5666960582;
	Mon, 19 Oct 2026 20:41:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A21210328C22;
	Mon, 19 Oct 2026 22:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792442507; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=1OqCBZEU+Pd0NjT6IFooBVYOMysmau4mF1Iu3HMfa8Q=;
	b=125FkxPyq337Vh1OA3wc096MpieQslVvspAetPhiqRNcfzezjW8yUqNWb293H6KYbEBRnq
	drquXFkIIeHoGijkogfsWs79lJjio0WYQvdD6t4Ip5emGPb2FNufxi322MXRIDgAp99R4A
	Oy80AR0N78yCHFBW1lB16b/vndjauepmv15KiDJkXZkNBoUnD31ltEMksLjY9U13CUA/Yk
	wwRGtIpgn5VzrDwHtXpw1tgFgDqA2wlwVrzy/VkxMO4BcNwkgA84M0DRfHoMnV57dj99+x
	BiziaCGzUuDt73HouW/lLhFFAAouMpYXA+B4luzKS+w5/piUCkaDKK7B+V5rCA==
Date: Mon, 19 Oct 2026 22:41:43 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sander Speetjens <sander.speetjens@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, pbrobinson@gmail.com
Subject: Re: [PATCH v14 0/3] Raspberry Pi 5 RTC driver
Message-ID: <179244249433.112512.16719708376827736602.b4-ty@b4>
References: <20261018151056.1051330-1-sander.speetjens@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018151056.1051330-1-sander.speetjens@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Sun, 18 Oct 2026 17:10:53 +0200, Sander Speetjens wrote:
> The Raspberry Pi 5 has a battery-backed RTC located
> on the DA9091 PMIC accessed via the I2C bus[1].
> Access to the RTC is provided exclusively through the VideoCore firmware
> mailbox interface (not via a direct I2C register interface).
> 
> As stated by jamesh on the Rasperry Pi forum [2],
> "There are no plans to release a public datasheet for the DA9091."
> So we are stuck with the firmware interface for now.
> PhilE also states that "The firmware needs full control of the DA9091,
> sometimes with extremely low latency,
> otherwise there's a risk the supply could just cut the power."
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: rtc: Add missing type to trickle-voltage-millivolt
      https://git.kernel.org/abelloni/c/09399a7cd932
[2/3] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
      https://git.kernel.org/abelloni/c/58db0fbeef2a
[3/3] rtc: Add Raspberry Pi 5 RTC driver
      https://git.kernel.org/abelloni/c/dba67294e215

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
