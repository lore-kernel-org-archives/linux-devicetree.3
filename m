Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1084A36920C
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321375; cv=none; b=VvZgO2Q41hRaVYyGOqRfaragEV5FHn4XGlGndG0ysNMO+1FI9OcBvPNDz77p1qV+KTW2WFM52SiNhAYeqLYKgLUsAdWlGWCt9sOsnmhnMU5EZ7UH86ClHRCHNMD8oCwAdodolZ5EWrUy1l+8YyJVwGPybTPwu3/nr0MYJ2hwxB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321375; c=relaxed/simple;
	bh=Sn9udg5t2jxP8QdTHmjGdwGAtm5JKM6D4I/GeCPcyQs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=YO8FpBJt21oO/UTx17T6DjNetbC1JJHjEedNGHcigZU7ksHZn7zFn2UCeo4HosorEPs1DW9UmSLFqcDbI5++hDiONAz74h7LOW6qEIfRn4y4DFlLVokAgLvankz5PNAserzHSL+PsHoFxTRiC9tHKGnATiVn32bIMEP33cF5hwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Y2UVeNgb; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Y2UVeNgb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 362904E40E10;
	Fri, 17 Jul 2026 20:49:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 00AE360361;
	Fri, 17 Jul 2026 20:49:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 060CC11BD013E;
	Fri, 17 Jul 2026 22:49:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784321368; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZqFKK0gfGAuMN5RMXCEGk98VaKPRW0PPjR2soTpi0yk=;
	b=Y2UVeNgbtcDu2+qPJTxKsSQKMc3Ag5wt6k9B9Rgq+ySUJ1cdS7NYlnyy0Y+9E+9E+bAA3+
	YKlj8dV5bpMUbBY70FbTTTbXk+YHvGV7XRrTdizPTsg7j1zew/SstzDmPmAJ+6Bxo/9iFw
	eptaV+z0c0+hWT9TFRmbGPA4mlZs04bYfYWKUssJLIuueX/0JoronhwNsCvp/gDZmEWs45
	6xI3J0TFUSBmjSpVHiSv8hB+r5ssmwQhQaLWtiSlwCym8uWjWGykY2pNF02xlpDHsRk8Lo
	Sp7mDnCl6WC1N5i+ZY4NTp+c0X2sgV8ORJLPhKaM+pTjnj3Cruu/0Pz5fkdAjg==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 1/3] drm/bridge: ti-sn65dsi83: Simplify error
 condition logic
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Wojciech Dubowik <wojciech.dubowik@mt.com>
Cc: linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260717115002.308035-2-wojciech.dubowik@mt.com>
References: <20260717115002.308035-1-wojciech.dubowik@mt.com>
 <20260717115002.308035-2-wojciech.dubowik@mt.com>
Date: Fri, 17 Jul 2026 22:49:19 +0200
Message-Id: <178432135988.269908.4603612259044430222.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 17 Jul 2026 13:49:59 +0200, Wojciech Dubowik <wojciech.dubowik@mt.com> wrote:
> Simplify error condition logic in lvds device tree property parsing. It
> makes it easier to add extra properties without handling complex goto
> entries.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

