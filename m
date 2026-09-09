Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03EA53FD2B
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961986; cv=none; b=FsfA1v3EiedJYby92HIlQdT+s38dEpHNMxx0or8xhvGYeFlSdUOruo+5gpRd8LP5PZbFhEwHmNnW/dtccTWHw9iGnUVifFfrvHionVmF4Sv6Hdx1GVJgP9HxwJ0HfCilVFF9dPgZKafsObZsIkI8ypoqf8DVPw+9E52ZIeVHKzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961986; c=relaxed/simple;
	bh=kGskmSpjTvB1C3VTKlENlT/OvhGiFXTDYZuO1oCByjg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H7oq+aIcOuVCxbtt5cLFTv9f9JqnRy5CZTLlMy+naCqBxVn6Yh6m4GMOaGzNyA2QGJmiIZjpiDbfdtFoqngf+mPk+15ByOCp4eJ8NXETNRhwpklk+A754JmRcoI2tpvLJdI+gmiFjGDlGzhWlpOsB0qQxIg5x2R4aPWS8g97yAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=E/hdhf1U; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E/hdhf1U"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 680BE1A1A75;
	Wed,  9 Sep 2026 13:53:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3776960448;
	Wed,  9 Sep 2026 13:53:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0854711C7AF7E;
	Wed,  9 Sep 2026 15:52:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788961977; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LARMi1G5vACDqaigY0BsBdggnGiivAk4mChXML/OD+c=;
	b=E/hdhf1UAf6+awCCGLMt4GqsieDb9sx1GlubU0wQbEP/cGP/9TCKn3ur/zCRNU+xIB6TL9
	O66Exidu2gRdvXmFyZnl4ek4P5RPtsEUrdBaz81RVPJZsRJUKNalpVLjAB+2pSgWuCEwE1
	EtwWTV3ZjMnCoq9EphEll2qS9zAxncWRYyRSGaMNT1Y05pDCKkssAUa1sc48avM4C/P5YP
	Irto4HpWyTkPk7Lm1t9g8SxfYgL+HGMkG+T2wAXEJpxwNimJBkQ4ZOgbZ5V+TFkagG/aRg
	U8klrqF77Otz1nRkZ9/9HQrNyNZ1sgTM41SlsoKU8OKm7oCezyWR4++gTwRqMg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260828065153.590802-1-damon.ding@rock-chips.com>
References: <20260828065153.590802-1-damon.ding@rock-chips.com>
Subject: Re: [PATCH v8 0/5] Add eDP lane mapping support
Message-Id: <178896196279.1382015.17901090259379845522.b4-ty@b4>
Date: Wed, 09 Sep 2026 15:52:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Fri, 28 Aug 2026 14:51:48 +0800, Damon Ding wrote:
> This series adds configurable eDP physical lane mapping support via
> device tree data-lanes property.
> 
> Lane mapping is mainly used for below scenarios:
> 1. Correct PCB lane swap and differential line routing crossover
>    without hardware changes;
> 2. Adapt mismatched lane pin definitions between SoC and eDP panel;
> 3. Support multiple panel hardware variants on the same board
>    by configuring data-lanes in device tree only.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: display: bridge: analogix-dp: Add data-lanes support for endpoint
      commit: af9b0fc07000db17656580fd38e5ff27c36c2ab9
[2/5] drm/dp: Add helper to validate DP lane counts
      commit: 6eac4c8bb10302abc0ea0bd1d506c46ec789ce2b
[3/5] drm/bridge: analogix_dp: Restore mandatory samsung DP DT properties
      commit: 02f569dd66c94dd67b2586f776235cf4177409ed
[4/5] drm/bridge: analogix_dp: Add validation for samsung,lane-count property
      commit: 4ff2f941b7828042feb2971c7039c8f790a105a4
[5/5] drm/bridge: analogix_dp: Add support for optional data-lanes mapping
      commit: bf63a72ea005d5e1cc12a9ad5e228c4b44246b0f

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


