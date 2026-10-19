Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440880;
	b=5EPO73YqFp/T7abubp6uu8ObkqZhc41o4vW4GqxjVLiRT35sLhy6j/++VDlH5P4tCfX3
	 2OiOi8DlYe+wC88lske/lJRCwRei86kpJRRBneGxTX9cPHkh7lO5fES320NP9byLUPfo/
	 g25VcT9yQJAyfLmhxcQaRp8bes9g+gN/xBKGSh7l3IQuYIwMkfwOkkdL+tZRFmUNTrl84
	 zYmrDbeFZXKFSBQFh+n+44IXfJbHJyfS8fYcsZ8skYa/F22WDt5hdmyziAuFxGsXvqo/+
	 Meiv0i2RxHmRZaUORp+qt75sHKmeHGKbiU94PJgtP/pUORgY4RufnZR3lcomJ9rGYkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440880;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=/5hKNHxFeOAm4qbVmRotbF0ev/GwLapj1bf9lcHGii8=;
	b=wtcwh7p4lnJXonIAPFxK/nPbEgz55P+tUxHLLYHMRS1k/6z3hRDnGxQNn6ARdR8WuAc0
	 U/RMa5JD1iEiIhK9939UIVb2CYUQCdkKSuuwPSHyVg8kATNm6hYJskdph2Mvw7/lcmu9r
	 Utkuj5y0OZHpnyAMjn7NaEesvR06mmMz81BMDJUw/X6W08qEfdzfwzWpc6fRYQLKaRbtS
	 DDrTN947Wd4dZtEnLbTebPsoYNBUcqBtneelYIUMra4cbrGgIwMs6ByiVBUCQxECPezcZ
	 6HH+wmA91EtnRl+E3VAb+uixAbTDoLuzpHlGlDYJGSnkMe1vuTmByIUXsSbjdAX2+hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2kW1CJRE;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC06606A31F
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 20:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC06606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2kW1CJRE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E1C894E4127B
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 20:14:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B5FBF60582;
	Mon, 19 Oct 2026 20:14:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F55610328D55;
	Mon, 19 Oct 2026 22:14:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792440873; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=/5hKNHxFeOAm4qbVmRotbF0ev/GwLapj1bf9lcHGii8=;
	b=2kW1CJREHzfvucOPyMIXsdTH16PE6sWlaJFwqxWxy412Pdm+6GNc8qnu3aE89P1rcswmyO
	4a9p1fwEZhab95bnMapFk8abPHjyTzkaXq6AsUBwJKNfzZP7hrw0YkYXO6Gdj+ykEA3DSz
	w9vRtBBhoZNEVkUaeyIz2pCSaf0PAdHrQWgOhF3hLCn7CC4knVkSyn2VGHqNyhBY86o9L6
	GeLy0QWWjC/xQnB5TC9CIL1sHvUlWcKjqmymeFbDqm8mg6lm4ArdSMPeR6vJHZu8lOFgeD
	zc1a6Zah9Yx1VPx+stg4tLBr0YJMFitp/N8BF34H60Y0hjQJH4ZKgIRjxaIE7w==
Date: Mon, 19 Oct 2026 22:14:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: rzn1: add resets property
Message-ID: <179244056628.104236.2147410035571083724.b4-ty@b4>
References: <20261008201953.34307-2-wsa+renesas@sang-engineering.com>
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
In-Reply-To: <20261008201953.34307-2-wsa+renesas@sang-engineering.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 08 Oct 2026 22:16:53 +0200, Wolfram Sang wrote:
> The RTC on R-Car X5H does have a reset unlike the other versions.

Applied, thanks!

[1/1] dt-bindings: rtc: rzn1: add resets property
      https://git.kernel.org/abelloni/c/9e25de5490fb

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
