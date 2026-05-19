Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ECA369D57
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188945; cv=none; b=KqT4gxs+YF9BpEYrQ0bwyekewzcCHb8QyOAvqLAkmnqpWLwecwGDe5UYZ240vaEXmEuahy7WBuGGH4eXcsEPaXlpZVR/zWzGa52bZULNT4wz21/Y39aWGHWjgRXPQfAscR5Pg7t20TML8Gi0BZgKddlNlXI5L10h1+7an6yAWYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188945; c=relaxed/simple;
	bh=681A8bOyXqK28c3Ht6DftfP9GE23z2tPCwXhhgzdcHE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=erNMFzUdrZLxhjEKW6jQ8NvACkjAB7/IFj18X83gSweNVugbHD0z4eE4t7A90wZp6qLibGDiadzU0YzJVPqV0udWsrVGqNknl0/YHPI0SdZhs5/yd3XyrMtc12jGnlVsWaBb6hsoQPqK89v3EE6XML0WyPHR/4i1yp4KC1XxO9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lPPJ03+b; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lPPJ03+b"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 382FC4E42CEF;
	Tue, 19 May 2026 11:09:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D99A0606E9;
	Tue, 19 May 2026 11:09:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 115D5107E8B31;
	Tue, 19 May 2026 13:08:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779188939; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rZpvAdTidzv5frFA2Fh59VQYe4hvOqmAQpFG53pkriM=;
	b=lPPJ03+beU7EqTBcCvAJlMCYn4/SnelIvqTJz0zwMbjb08bZHBlSuK8JTIQ4+0DVnfCr46
	yvyCl6mMLegw+jVfHXVbvNa7IiW1FgaGBLE6+7zJBeOKrD8zGLYlVYy7AkT6JFsJApPs0K
	9+v70l4hOu8w7CIXxQAVLnQ5+UfxFJ1bk9goDmnsWq9qc5fPFXtpkC8eW+6ODZzAcp5ns5
	7ya1T7M3Ozz4N7mOGMzhYeQY5GBha93i11thrrL6mpl2VY23vJON/iwSxeqjperT0VmeCM
	i8QrljjzudkimZwllny+bcsjBmbZZpiea83vxwFXZHwRP4smcr6j/dExBvVBig==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 05/12] drm/bridge: synopsys: dw-dp: Add follow-up
 bridge support
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260501-synopsys-dw-dp-improvements-v2-5-d7e7f6bac77f@collabora.com>
References: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
 <20260501-synopsys-dw-dp-improvements-v2-5-d7e7f6bac77f@collabora.com>
Date: Tue, 19 May 2026 13:08:43 +0200
Message-Id: <177918892313.537125.10814687633426590148.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 01 May 2026 00:20:32 +0200, Sebastian Reichel <sebastian.reichel@collabora.com> wrote:

Hello Sebastian,

>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> index fc4ddb7792d7..ccc55e40e81c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -2064,6 +2064,20 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
>  		goto unregister_aux;
>  	}
>  
> +	next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);

devm_drm_of_get_bridge() looks for either a panel or a bridge. Is it
possible to have a panel connected here?

If it isn't, then using of_drm_get_bridge_by_endpoint() which has just been
merged [0] would be much simpler and cleaner.

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/03d1078112fddd706b2c1e4a7d98cf18700eb5df

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

