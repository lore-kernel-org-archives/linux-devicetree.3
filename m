Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB18396585
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337228; cv=none; b=qFIawkQvyobdNewRAZNvTVflYo88OSA9BZsn4gxIHSMObGrLcbAiMpvztKrsl8PCsvH2kMGbUYCQQMdIEA0X4UK36c/X3Rp+6EQ0Q0p2tJKgcMbPwMpZxlidenJbh3lyTtyAN2Vz/zooWyLaExR1aJjrdGRozOXvnSSwqjNlEfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337228; c=relaxed/simple;
	bh=J8dWfxEF1RGzMXVMgB/mwWhusdNmDzLztUJD+Kg4nTI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=OazuBu/cMcg9eWk+ptt82SI58Ki7YuPjPBqUTXAqM220LXlK9c86FleX3AAtOGp+NiJcTSwmLe/OH4SQXgsol81+fhbDmDZ/0mg0vOPGp7GBACv4dU9g0M+oQ4KS3HI8uYGP/99nKaMX6cBj4urLh4rw84s5jWeFKGbGYvIaGaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=obSfFDp9; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="obSfFDp9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C367C4E414D2;
	Wed,  2 Sep 2026 08:20:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 913A96053C;
	Wed,  2 Sep 2026 08:20:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB63E11C792AC;
	Wed,  2 Sep 2026 10:20:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788337218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zXwmUqR80A5WcB1By3Vqky+fSnzgUpYcAnB6V+3H0bA=;
	b=obSfFDp9c3fLXn9Jdh3sWnB3ocZrKCvN3COLHPLcaFTUvPZGThEQdQolXal845JS1KCC/I
	386jSjryrGCWCH8ll5Dt+OK2sNJXpqEUNshRlivZu2pzVTF7/PsV5NhaqEJkQl4fWUmB4q
	Xx5Tq/+o9WKnpELRu8aiqYW8ZIwcEjsG0yxOVgYQ4/+t3D/nmUf4RvR9RY7FVGTKLkoKRP
	vowcNcW/jdHAsFFxP8knpmG6pu38016t6flYv3sn7hbc7qXjRUOXRs1ogIv8Q4fF0EFpcp
	eGZEt3RS3ZNi9c2CnBEV+x3YJ27ilq1vTpywTcrY8W+iylgxqK3KQs2qYaCFEw==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 5/5] drm/bridge: analogix_dp: Add support for
 optional data-lanes mapping
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
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260828065153.590802-6-damon.ding@rock-chips.com>
References: <20260828065153.590802-1-damon.ding@rock-chips.com>
 <20260828065153.590802-6-damon.ding@rock-chips.com>
Date: Wed, 02 Sep 2026 10:19:56 +0200
Message-Id: <178833719638.506564.9767716352967670052.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 28 Aug 2026 14:51:53 +0800, Damon Ding <damon.ding@rock-chips.com> wrote:
> Parse the optional 'data-lanes' device tree property to support
> custom physical lane mapping configuration.
> 
> If no valid configuration is found, fall back to the default
> lane map (0, 1, 2, 3) automatically and keep the driver running.
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

