Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501633;
	b=21QpI4OzU4PW19OY3pSiW4gdP46ovl3+eZpnhm608tMF6NO34CH8llTe4JSZTwWkOVAm
	 tPw+npv0KeZEKr+rvGmGwBHT1vHZdR4iWK7nz4KFmY5l81bJfnHSZDscwfyFjdy+hH4mX
	 yt32JjWXyRexOAxHmnL+OjJfOlNXmO5BKgFoPOaauz3cJG22o86Yo6J8KK6xSTy/V5XH+
	 rjMHgIStvQKD5Gme0HOZ7YDdmqWXhOY4LRE2Yoc6sqqAIKichJx45KS4rUPFXk3qls6jX
	 wItVsWz4rv+q7mCa2eIjXFTzTWcTgOifGSZAuzXhdS+uHmm0vO6fY+JhpNIbIilUj+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501633;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=NPENMsmu3+BS94VMSAUvkedwRU3NJYclxTKT7IXQmWU=;
	b=sK5Z+SAdt6Q3mIjwTcqSTeaxRdKMameyNgQYOET6o3Pv/c7OsKW1057WMtKFJuvPUA8w
	 1v7rJHbKWUqtGnwkA06w9cp3PIlxYw47ah+hYeg2SKCfw+YgoraEswZo0IN2g71w//HsQ
	 LSAgTGqmeVQVnsTDVM5EmBYZcIV8QyiP6kAoPfUhyUu56E2kCtuc/jqjSHMYjLNUxYFyq
	 IyyHnOPS/g75lr/0qz8GBTvSw5Ac8EE9GmXoK28eKVcBfNPXrm8wuC9lBmcUkEFkEbxVE
	 b+UWktc/TtwHqrCZVZHu0ZL2euzKVxPSMjx5g2eDOpWjao7PufQBn9r3X1g/4p6fh/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=blM14kIw;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88836606A331
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88836606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=blM14kIw
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ABBE2C79A9C;
	Thu, 12 Nov 2026 16:40:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 49C59601AD;
	Thu, 12 Nov 2026 16:40:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A833611BC069D;
	Thu, 12 Nov 2026 17:40:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794501627; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NPENMsmu3+BS94VMSAUvkedwRU3NJYclxTKT7IXQmWU=;
	b=blM14kIwqeQ+LdPhURV+QXNd9dZpWq5sYV4WTJ87Eu5fTOxUa5YrWkpHu6Ev2On3EhCpYs
	a6QQSQ6U3HCTAOPcam5BeVKyeQWnOY812CEvxa9fuh/D0WKFpww623wzgt5Tehs2c/k6NW
	xyXIDhVVkuRJAva6HSB6jdYXtvgLcxnSLFOmOxy2J+TMSGw0167tKKVH5Dv6CcFd7l7hJC
	SsUw5YK+1pMes0fopVmk0rQxmX/khrgmE/tLc63Sm+CFM391EZh/0lOMDiz25cq7c9Qa1y
	jk/1HZAI7H2UWASETSrz3GCkHqo9Rl1lnxV8yZf7LxN9LviYMtjPdNwSEPEaCw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Marek Vasut <marex@denx.de>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261110-dcif-upstreaming-v11-0-9e13c85ae0d8@oss.nxp.com>
References: <20261110-dcif-upstreaming-v11-0-9e13c85ae0d8@oss.nxp.com>
Subject: Re: (subset) [PATCH v11 0/7] Add support for i.MX94 DCIF
Message-Id: <179450161929.2117501.14949541716164131629.b4-ty@b4>
Date: Thu, 12 Nov 2026 17:40:19 +0100
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
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Tue, 10 Nov 2026 14:27:40 +0000, Laurentiu Palcu wrote:
> This patch-set adds support for the i.MX94 Display Control Interface.
> 
> Also, included in the patch-set are patches that the DCIF driver depends on
> for functioning properly:
>  * 1/7 - 2/7 : add support for i.MX94 to fsl-ldb driver;
> 
> Thanks,
> Laurentiu
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: display: fsl,ldb: Add i.MX94 LDB
      commit: 35d189bdab8542d8eaecee4a39e15c1eb737f558
[2/7] drm/bridge: fsl-ldb: Add support for i.MX94
      commit: 7678b7f2d38b5575981b1a7c09139a4660b66826

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


