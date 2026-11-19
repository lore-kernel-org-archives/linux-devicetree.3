Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077149;
	b=dJzuFn4CWHQLF7VLTO0ohq3pGR3nDbaadBnwqADCcDpGIvL0wt/J39QG7BZhK+g79GU/
	 exRzL4EuqQ2MUz/7LzuWLhxHFT3fYo9zOMPtIFyfxN07FOanLL0X+VUCouyb722gHb13e
	 9XVDUG4BLKfZ/3+cA6sWW3Bn6Ry2O0DdKyysfyKaOlRzTBgaDnSagdWZyChnm0oijc4WM
	 YjxpPOUgjxtpR3I6K1eWz+JnDE6hzoXXPXv+ECqRuIzGgOcrMEBynldsDMcwlP/BlnQbL
	 nwBc2NxNuPv9Q+kDZlNrkJCEgPA1MxFGtGnUka8UJEfl5CE5d9JHk01huHS5oU6XaPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077149;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=d+pbzDtS/JQiA7b4wrmuxjkA2iPIz7YvM7ymaKga0rs=;
	b=th84/LBrbgUZIGlW3e/+aj3KFVasdvsK5R44uOTgjQxJ/QaJjgwZon+Bdrk7hK3UPEMo
	 36JE4q3XFQOaZ3yi/77sCCOkr8XsmZhHCarH19emRFQjdLSf5PHjM3R0Pv1Y36dDkAC6C
	 15sHrhKw0iWxPL6hGgOqlZ5Sg0sm9reHywUnvO/CuawlV3JPM1raZTj/spF1vE3M7o/kd
	 Fm8Cx9pkRvMwtWljTQBPjhqpIQTILoviMuUlqJchTaCQ3pKAfrjNi8w7Ho3R04B8wnkHA
	 1Spx8rzsSJZZGKBZJO7PvnNndob6Ro7dGAG6ckVwccXrf4tQ8dZ7IFKlWQwOmaN7fCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=J65EdjmP;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB156606A326
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB156606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=J65EdjmP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1AB1F4E41662;
	Thu, 19 Nov 2026 08:32:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC49C60237;
	Thu, 19 Nov 2026 08:32:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AD7F11BC31D3;
	Thu, 19 Nov 2026 09:32:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795077145; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d+pbzDtS/JQiA7b4wrmuxjkA2iPIz7YvM7ymaKga0rs=;
	b=J65EdjmPAxHMYXVljGZhHi9UwDX8egcSnd8PSZFe9AhLAwFS3tqyv9DBuO5bhFFxpMJp66
	oopgmeIVRLQW3xYvB1CCVUqdbZkcjJuIdrKbSXyoDC9SO7LezCP6JNI0Cv3AQn/zqHrLWp
	2tP/nMASKt4MayFXPa8xTaI8naoQzTDfsNHgB4L6MSwcTXBXy6LFRdTlKI9d3BLbK6CdML
	9MiKssAk9n1AnS3bTMcPpD67AoixRvHFjticPSCwyGaQQRsfxaf7f97V1T+gRL94x5gcRs
	g/lMUbG99dFuADw9mxJxAs37zWUyTX2yV9lufMvIgPKYNEQ6TJwTLgFGLFWJww==
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
Subject: Re: [PATCH v12 2/5] drm/imx: Add support for i.MX94 DCIF
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20261118-dcif-upstreaming-v12-2-29b35e27a1cc@oss.nxp.com>
References: <20261118-dcif-upstreaming-v12-0-29b35e27a1cc@oss.nxp.com>
 <20261118-dcif-upstreaming-v12-2-29b35e27a1cc@oss.nxp.com>
Date: Thu, 19 Nov 2026 09:32:16 +0100
Message-Id: <179507713631.198693.2786295335112670846.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

> The i.MX94 Display Control Interface features:
>  * Up to maximum 3 layers of alpha blending:
>     - 1 background layer(Layer 0);
>     - 1 foreground layer(Layer 1);
>     - A programmable constant color behind the background layer;
>  * Each layer supports:
>     - programmable plane size;
>     - programmable background color;
>     - embedded alpha and global alpha;
>  * Data output with CRC checksum for 4 programmable regions;
>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # bridge refcounting
> Signed-off-by: Sandor Yu <sandor.yu@nxp.com>
> Co-developed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Looks good, but there are some issues reported by sashiko. Can you either
fix them or explain why the code is OK?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

