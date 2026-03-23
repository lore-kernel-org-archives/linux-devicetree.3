Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CA33BADA3
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282515; cv=none; b=rm/Cdj1bul+VOuKa02eA+CgxqYlLV+VIM6z8cYnZA0XXRpXaIBVQsx30QWUGWDch2SQb7d5AZxDRyx6b7joOFQwMFpdw5Z2lkloQaDf9xa9AVoGNrwiN5wyXqyUpy2edXtI1R6+GIoxTfZd8JUaCRoi9kxX7n5FYbgHCqS0z8fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282515; c=relaxed/simple;
	bh=L93GLqLus5B8kLAj3bNWOHqwo3TpCpr9wsx8jieRi1E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Wz1dhU8Hdc/tsGvjMVcomH2YN9toiIVyHhQzrNrYFZiwiYlG4b/Yn5VI+Pf3TvbKVCCcepurAHgL7sx79bv2vtGRZpzu3+sPKoxRer4ErUhLwfr4t3xEWmP7NXjIs7s/WIF58lwFVkZtPlio5PKD/x08tCJPaV25F+Ah4eMkulQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Y9Q5yK4w; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Y9Q5yK4w"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 78FFAC58083;
	Mon, 23 Mar 2026 16:15:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 821D7601A0;
	Mon, 23 Mar 2026 16:15:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC02710450FE5;
	Mon, 23 Mar 2026 17:14:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774282506; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=L93GLqLus5B8kLAj3bNWOHqwo3TpCpr9wsx8jieRi1E=;
	b=Y9Q5yK4wSxbiIxPpWmJBuauTLMPubXYCTglW000y3lpGh25SszpOYvUrxJuQECba/o2q1l
	TjuoLvy2B7i+go4faD59gCap17AtHWUaqSeq5NMW/ms6zrQ5Tz4kcdXIWZbIB2lMNrDhzj
	35dSPmVEiJTV/JXx2gXhAxV3IitA7Dn1L9CRdCTrkwrJ8Z9K/pOtEJVAKDl74Wpf4CS9nW
	P7VoidWaZhEsqS0s3HmOvrCuxYGgp0bACrvOjA7DyCOoXBkpv153f9Q3RuRa1eUhtR7AiM
	4iUu6RfXa4LN9MLMyH9RmxXQCWhrLZpVaHWh8Iq3HEktUyhE41vVtz58WeRNMQ==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 17:14:50 +0100
Message-Id: <DHAANFJ6QZKU.5NN7RD47T8TI@bootlin.com>
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <nicolas.frattaroli@collabora.com>,
 <alchark@gmail.com>, <cristian.ciocaltea@collabora.com>,
 <sebastian.reichel@collabora.com>, <kever.yang@rock-chips.com>,
 <heiko.stuebner@cherry.de>, <tomeu@tomeuvizoso.net>, <amadeus@jmu.edu.cn>,
 <michael.riesch@collabora.com>, <didi.debian@cknow.org>,
 <dmitry.baryshkov@oss.qualcomm.com>, <dianders@chromium.org>,
 <m.szyprowski@samsung.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Damon Ding" <damon.ding@rock-chips.com>, <hjc@rock-chips.com>,
 <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 7/9] drm/bridge: analogix_dp: Rename and simplify
 is_rockchip()
X-Mailer: aerc 0.20.1
References: <20260319104031.1986946-1-damon.ding@rock-chips.com>
 <20260319104031.1986946-8-damon.ding@rock-chips.com>
In-Reply-To: <20260319104031.1986946-8-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Mar 19, 2026 at 11:40 AM CET, Damon Ding wrote:
> Rename is_rockchip() to analogix_dp_is_rockchip() for naming consistency
> and readability, and simplify the code with switch.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The patch content is OK:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

However this won't apply without [0], correct?

So, worth mentioning in the cover letter that this series depends on the
[0] series.

[0] https://lore.kernel.org/all/20260319071452.1961274-8-damon.ding@rock-ch=
ips.com/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
