Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510571;
	b=5QTqtRjzQs88c7IqdDhYXtCnAcxkvEV0A3DhFUt6rj8EsFqZyI/5SQAWbLX0gvl3LVqm
	 qd7ultvp+p6/EDf3Pm+9YNIOEKCWYU4rgLHzav3SL4MQ27wOyw7zFQl+Ch25H28ENloRh
	 EDkJYgv/04YiNG2PHNu1GcXq2AxKL269G3kJBnnYd4UICh0cwnrJc2sSLb2kne4aMZzdk
	 dfSYlVn6o0LGvQBM5UE1RiQ/H5zJAh3P6FiUqae3y9Yi/uCrQeZO+UxsGR8WLYu0Xmjp/
	 Vkr5UiIbEDSswt5FNpdVSBlvY81saOT2cUh4BtQkTk7tmiftMzPR7iqLbq+ti1VRI/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510571;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=LFohBOrLJxnGJCYd3p6qNGOqsmehV4Rsw5Zp+Kdij5U=;
	b=GOyb9sZuxXh6nRKs9DXBNzd8xGAwSiLECR7qa/VNRjUZUFMsTLk+b81P+1usemyf5bI6
	 cz3v1TgsY64cwWAEl+fKGIMI+nEbfnn+9EpZ6Zp7niq8oyQHuTJ1KehaAmXgf5tbTPJab
	 sdoEuQ2qBRM7oh11Z2+jYHlBIUno8yL0poSlwX9JTn8pt2r5WCFTZCawpI7jPvhIAKDLC
	 8Z6qiseuNrxLhQfgdRj6PdINzwAJl8Pxhvy0VhytaDU+cF+YsoZzEcvc6xX3qP9hllfKU
	 4hRe6yEYSibXpFPngKMY9nE4zCzuu1oo3J7fl0uKJ7p9KUMR/oA0dk/cqNX+AY/B1+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VpRGFpTL;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485FD60A263E
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 485FD60A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VpRGFpTL
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 618C14E41251;
	Tue, 20 Oct 2026 15:36:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D68B60393;
	Tue, 20 Oct 2026 15:36:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10558103289A8;
	Tue, 20 Oct 2026 17:35:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792510560; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LFohBOrLJxnGJCYd3p6qNGOqsmehV4Rsw5Zp+Kdij5U=;
	b=VpRGFpTLBDDiMTl6/NGSODWak25JpEcpjqfB+DUqvNA+YksPPTvVDqqw0N+dtA9sB08vcb
	vMW/GCyrPOP5GCgump/RzvYP7lSGI1qdKf430eAAza0RqQec7tFf695VDwP/z/4Ush3g3N
	VFWUOodkVNDN4b5YYkpmr1TY1Qt5w7Zpoksi2WAN1/7gPYcFVyex/MRgTBgeX6PNN1m7vZ
	DewqcpC1vXJzZmoq216k93sPY1F0Z08KPLex+bn1YlAtgEJvFdM9EOMr8+Bqjev++eTIYA
	JV7PsaDyBd2RiZiNn5cuNC0CgxVeYU44PC3ljOqQngNQqy36QokCKtQ5PhO+6Q==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/3] Add support for BeagleBone Black RevD
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Robert Nelson <robertcnelson@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jason Kridner <jkridner@beagleboard.org>, 
 Deepak Khatri <lorforlinux@beagleboard.org>, 
 Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
References: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
Date: Tue, 20 Oct 2026 17:35:52 +0200
Message-Id: <179251055253.74160.3565168560141526355.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Hello Robert,

> The BeagleBoard.org BeagleBone Black RevD and Industrial (00D0/EID0) are
> redesigns of the BeagleBone Black Rev C3. They feature an IT66122 HDMI
> PHY to replace the EOL NXP TDA19988.
>
> Signed-off-by: Robert Nelson <robertcnelson@gmail.com>

Tested on a BBB rev.D, with HDMI output working.

Full series:
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

