Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763E6408624;
	Mon, 10 Aug 2026 15:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375264; cv=none; b=NdoCqN51ILGfSFVl8nieL4MsQ3NB0ubbGfnNY2LD9Jj1FMgWAL4erJ82Hn8gOCD2C+32imm7+Mu1JDFJcERINxcumRVsu2W/4xlAaemkwxX5dwNYffXHjm9ApjL/lHMDolRzGo3Njj8oijXbSsEb7UsiHgq/c0ZQA2aGHxfJWTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375264; c=relaxed/simple;
	bh=V+GqNE7yeE3KTWaYB4L+6XBPhQ0Hp5GVdPnA6vcmdzQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=W/LT7JnkRCquPRquccRRjei/+19wzuqMMQ2iZGo40Jyv3ul+ALqiKDnYtnY0aueOvLXv1Yc1VwLoF8UaSHEamq8GfCGRCnQZndq1cGLLqYd15uIAWfWE/c8e+Ka6l1UQ5iMajoq0XseMAjnL9FM++aWtNAt+coP4Il0oBWDsdTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bqet2n2e; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bqet2n2e"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B93E91A1533;
	Mon, 10 Aug 2026 15:21:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7AC1E6033B;
	Mon, 10 Aug 2026 15:21:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4959311C4AA3F;
	Mon, 10 Aug 2026 17:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786375255; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WC6fCeHzO2YFdlPk15Xu0GzHqS0QytKrnHjk+4uw7Os=;
	b=bqet2n2eP01Bmi288gkUVzylwxbpg3ZQrw9Kq0FnLM7kTlLh+c2GNi9QYK6sN8b/A2VwPs
	x+xyJBOhN3RRqw8kJO9SlYlu8pnvdEGDWbsazcVNG1AwUqm9iqOAdrGsgsAcySocVEaOdX
	aSktSJweJ0ag281Q5sMXmAMxWhbdrq26pVL96m+VonY1iNSIEARdhlMdvvY7yCMEViXZ4w
	Vy474LqWOjj6OPv5it9IyLI7tWIu0qtvfmiscXVWrOVbNJxUE21AB2cFcvgeJj9L0DY1Xz
	SA8vTV3K5Pfn0Zn3phovy+e2J76TxVbKpHwlGqqDj1bNrnFRS00tR8iO8IPbDA==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 4/5] drm/bridge: analogix_dp: Add validation for
 samsung,lane-count property
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260707040613.1992841-5-damon.ding@rock-chips.com>
References: <20260707040613.1992841-1-damon.ding@rock-chips.com>
 <20260707040613.1992841-5-damon.ding@rock-chips.com>
Date: Mon, 10 Aug 2026 17:20:31 +0200
Message-Id: <178637523124.64950.4597468269792391025.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 07 Jul 2026 12:06:12 +0800, Damon Ding <damon.ding@rock-chips.com> wrote:
> Add validity check for samsung,lane-count to ensure DT-provided
> lane count values are specification-compliant.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

