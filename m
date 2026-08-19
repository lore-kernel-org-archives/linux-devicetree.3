Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994BE30274D;
	Wed, 19 Aug 2026 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144118; cv=none; b=HaxErhenp5Ju+qLG0Hswv1G4SEtwCeST6v1adcx292IIxQ8Hxi3Rn30bi0wb1lw9v3p5yL2z9s6KqYua0cise2HOJmU2OsYY6q8PTxa15YVpFVm4+l8yOCDJyl/oD+3B+LB0eXGHCgLTIYoo17k0Q6CE66Kldo30ynBjwX+goZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144118; c=relaxed/simple;
	bh=N/zaJiAhXP00lx6PAts8LK4/jdyaDVLbc608Js2Oa18=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ZR8uP+TB9CCkW6WrY/mZ/qqAio+PFJDM6r6OYpNUeWurWLLMnQ15WnW4kQSjoB5DN+CMTmux7wEwt5UKhuRhRuG8bfSwO2z+ZPES8/feTwxbRaxC3jhuDDBp3+IPE0xtepezl7+E8fVxSZbp8hRi/q9vvnO7fH0vDM5RvB3Px0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JDdNeju4; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JDdNeju4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AFDC84E412D3;
	Wed, 19 Aug 2026 12:55:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78BB05FF42;
	Wed, 19 Aug 2026 12:55:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A6F611C7107F;
	Wed, 19 Aug 2026 14:54:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787144110; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gdGAuHjlixpYdkT9xhMb3UwdzW0vQ2uOjAXrNRRpfaU=;
	b=JDdNeju4PQ27vda3IH4TfbO/cyA11k9vzuM6jNfKZtTKw9a57ymiayvZlfyH1MFXFPUW6a
	YD3hCki30a3zBu/KNLDzTjQI0/UtC8qSPcFREwpWmwkU/p5omn4Z/XelrCA/Ax+Q/ru90C
	8P4380Ujv1MNiQP2Ru9Ko59omZ5RpYanV9sdfPAwB4uMA7MTZSnLxoj6M0iakmcHolx1Fc
	jSHwkfVRvI5bXwuOEuhYMx5PFAT/zUykNlUkQO+ec55wlA4Ln0lpO/zKqHWRBmNsrWp8WH
	h6ipFBfmRmUeycWv+PhIj1cEMZIJniOzgMTDDX8MbpAVBIW8fAeYIUA+rQjc0w==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 1/5] dt-bindings: display: bridge: analogix-dp: Add
 data-lanes support for endpoint
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260819075238.3007087-2-damon.ding@rock-chips.com>
References: <20260819075238.3007087-1-damon.ding@rock-chips.com>
 <20260819075238.3007087-2-damon.ding@rock-chips.com>
Date: Wed, 19 Aug 2026 14:54:46 +0200
Message-Id: <178714408665.358642.12561443857141730089.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 19 Aug 2026 15:52:34 +0800, Damon Ding <damon.ding@rock-chips.com> wrote:
> Add data-lanes property support to the port@1 endpoint for physical
> lane mapping configuration.
> 
> Lane mapping is mainly used for below scenarios:
> 1. Correct PCB lane swap and differential line routing crossover
>    without hardware changes;
> 2. Adapt mismatched lane pin definitions between SoC and eDP panel;
> 3. Support multiple panel hardware variants on the same board
>    by configuring data-lanes in device tree only.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

