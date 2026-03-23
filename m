Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1323AF649;
	Mon, 23 Mar 2026 16:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282514; cv=none; b=ECVtoX6jNbsTPbFVzcWNzCzDnGWkz53Tpc62siWd5BxRrw5Z9hp5xWopidDE5Atlm6+bz80pD7qi5vyJWb6YJ5AY/40zcga9iXa2HG6GGUdZPcoojHuo5xHbnJiOeNdsszdzZ3tYEsqiEsKm09hl/8/lG5tq9PqSWp89oUA7+mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282514; c=relaxed/simple;
	bh=K6obHe83BAwmzQr/bTjTPtRZKHUknQfMZAa88iZ63Kw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=tFXm+TizH+ho0O1SEvY3qtYfzlSfXWwbOU6af/ygfLjl4shtx/wY2hl43OVeRoo4zfwmfFy8mD/i3axh9HgIbix2c8qPESvPvSSKy1mGUJIlWe1O/FtM6c2qfOmxpugo6drjW8iJN79e8sJPNS+6+/wU/UV2SgtnKSPhC113g/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gZNQO9t1; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gZNQO9t1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 158FEC58081;
	Mon, 23 Mar 2026 16:15:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 297505FEF6;
	Mon, 23 Mar 2026 16:15:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 290B210451097;
	Mon, 23 Mar 2026 17:14:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774282505; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K6obHe83BAwmzQr/bTjTPtRZKHUknQfMZAa88iZ63Kw=;
	b=gZNQO9t18okNaQnCJgK7AKFN1ayJZ25Qu2grAZkSWH+meBwEgO7CYqMhvUJtDfkJR9zNLX
	tGqnLFBrLSfkHP+VwDq95ZuNIqDPpirhxj0bxO9gK6fMJUJjnkZzetUhBsdRqsIzWcb6Bn
	Jf5uGXZpdLJklu6d251BycDsDJeBqGjtDLlctYHnez3K8HitbTJ4BWLghBFUcl8QvyV+4i
	xqZXiVd474eHdHttYTF9u6SmKMfXkbeizy6+R75x6p5CwZrP253w0ee9tH3HdqKKWj3i7n
	T8XAoObLuid6VqMe4CHkq30vE1krtSaImN4BJ/R+feuefkotqWvX+wDMdRkLRQ==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 17:14:53 +0100
Message-Id: <DHAANH2HFRIK.26SLTPXGLHOS2@bootlin.com>
To: "Damon Ding" <damon.ding@rock-chips.com>, <hjc@rock-chips.com>,
 <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 8/9] drm/bridge: analogix_dp: Add support for RK3576
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
X-Mailer: aerc 0.20.1
References: <20260319104031.1986946-1-damon.ding@rock-chips.com>
 <20260319104031.1986946-9-damon.ding@rock-chips.com>
In-Reply-To: <20260319104031.1986946-9-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Mar 19, 2026 at 11:40 AM CET, Damon Ding wrote:
> Expand enum analogix_dp_devtype with RK3576_EDP, and add max_link_rate
> and max_lane_count configs for it.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
