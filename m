Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800277;
	b=25uvtQGq/Prj7m/N4H9u7Dq82GHmviEJllk7e4wM+NegCIrxgGlFaVCn9JVHgUZl6yX8
	 E+A/xxogAIsWs9zvIGe3CV18sAdLfn1r4KOKXrlI8UGkTV0fqJT2vg9jwbqTDWVEKKvL6
	 bfERd6XAz+uq9O1vOqWJnRZiPvxuRwCIltor28jSLpOuTyHvjwkgA3O/rXPHaeEs3IAV0
	 /XJDMDOLIJpp7Fbh+HK50m0Z6jScCe1M2xV0D7KF7Lv6bEk8k2C0/8Q7wbpDbCKlB6TRT
	 /N4dYwu7eK/mpLfM4toKSnjC0FuNcgyODzy/qpPL/Ybjw7QjmXR/Dwx8wnhE3i/FQWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800277;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=kFFbZKkKUFjl9tVqzC+oYl95ClW2/a5f1vqAFZ408qc=;
	b=Un8M9dr3x43heY4eBRvDQUZnOzQz/fhAL/aOfpL048v23Y9rafRCbn9+aoXEHdRqf6LP
	 pfhFASXBHBJ/BDnoKQh0Sd1J/Yg2fZdnMcLYSozc6UqKSC++yBRKahz4q6Y+5jmgpEVlf
	 uL/z4yTkN6Ue76K3isjR8Zgmjm8GNfjAZk56zF6lAF4RMF5HRgSZLM/Ew1uk/GpWxp32a
	 VVXK28FPfRCkPrJKwVvJO6sgJVYWYwrj688x9/oj3lQieSQCQPYPUpCsY8znLmEINRDOK
	 n/Q7haMmQY2d1wHASvGS6oWmIVgfL/PoBU9WatnXliPVqFwD7T2TdeNhtlHcpxiai0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=awUl84Kg;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F107E606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 17:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F107E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=awUl84Kg
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 73331C2AC4C;
	Fri, 27 Nov 2026 17:24:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98D4A6049C;
	Fri, 27 Nov 2026 17:24:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD05311E90D6D;
	Fri, 27 Nov 2026 18:24:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795800268; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kFFbZKkKUFjl9tVqzC+oYl95ClW2/a5f1vqAFZ408qc=;
	b=awUl84KgO2Tm8Ca8KlUgbZ0m1USDz/UO8HsjwvOEeg7c7/7bsXmrNQgyMg+nQdLi4uO2ch
	64mKLCWE9YANSnZUTY4Uy6ZSnUiTbf1HhU6gILRF8gAddrfVlaYi+z/s3lwv128HIBscq2
	0LS777YEpIi0ksZtBY8cf8fIkJ19NUOnpnZ2zv5k2rwTHAkqia+lozqXhq3PSJIrIjASas
	IxoPz3F36wGf4Zd8+ZvwUdOkOipwcURIzMJLqUxBVwPPwjCl5GB90Y9CrHNolx/b8nLGXD
	cGW7KXrEBwCZh76xkoWfizA9Hh1ymE6X8ESqtXNnXnqq0H88O0seFMepZpEpmA==
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
Subject: Re: [PATCH 2/2] drm/panel: raydium-rm68200: Set prepare_prev_first
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Robert Foss <rfoss@kernel.org>, 
 Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Yannick Fertre <yannick.fertre@foss.st.com>
In-Reply-To: <20261125075455.772826-3-stefan.ghetu@nxp.com>
References: <20261125075455.772826-1-stefan.ghetu@nxp.com>
 <20261125075455.772826-3-stefan.ghetu@nxp.com>
Date: Fri, 27 Nov 2026 18:23:58 +0100
Message-Id: <179580023805.1981164.14144325145950560136.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

> rm68200_unprepare() sends MIPI_DCS_SET_DISPLAY_OFF and
> MIPI_DCS_ENTER_SLEEP_MODE, and rm68200_prepare() sends the init
> sequence followed by MIPI_DCS_EXIT_SLEEP_MODE and
> MIPI_DCS_SET_DISPLAY_ON. All of these need a working DSI link.
>
> By default, the panel bridge is prepared before the upstream DSI host
> bridge's ->atomic_pre_enable() and unprepared after the DSI host
> bridge's ->atomic_post_disable(). A DSI host that tears down the link
> in ->atomic_post_disable() therefore does so before the panel has sent
> its shutdown commands.
>
> Set prepare_prev_first so the panel is prepared after, and unprepared
> before, the DSI host bridge, which is what a panel driven by DCS
> commands from its prepare/unprepare callbacks requires.
>
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
>
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> index c535dc931903..cc87f587ca78 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> @@ -360,6 +360,8 @@ static int rm68200_probe(struct mipi_dsi_device *dsi)
>  	if (ret)
>  		return ret;
>
> +	ctx->panel.prepare_prev_first = true;
> +
>  	drm_panel_add(&ctx->panel);
>
>  	ret = mipi_dsi_attach(dsi);

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

