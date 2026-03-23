Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2BE3AF662
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282515; cv=none; b=iS2ZixcS82co4AfB44PgW9M9dx8jYdJhxQ1UhoD8HVthWgMCXgIi14sf9VQo3rWqjTdrP9pKtUQD6qTRuROMfsjqp1jbxXLwUEJJp+7EkonkLSw2lg79u5inj5C/Cq+Dd0prwyVrC2vYigGRAo1JjHcc7WXUZonG6bHeuWXphtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282515; c=relaxed/simple;
	bh=wz/qy3mOqhyoOYrk4BYNUG4XnoW1wVBR5GPWBTYta+k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Q/DnlTtLBLc05USdMhgWYl0Bfn06Zr/SRm5Gr0W6OvFPMYH3xcFgnWhK2Gua4MooXx+0zQoGxaj0OL6CbPjz5AefyMmeXx77EowDKlMywoElS2JnpLCF0X8bwSrDKG25DuzrkVwT9F+AHTZdBMZdika2G/eQWRKw/xBdsH2YI/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X8I0za+0; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X8I0za+0"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 53191C58082;
	Mon, 23 Mar 2026 16:15:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6D9685FEF6;
	Mon, 23 Mar 2026 16:15:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8EEEA10450FE0;
	Mon, 23 Mar 2026 17:14:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774282506; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wz/qy3mOqhyoOYrk4BYNUG4XnoW1wVBR5GPWBTYta+k=;
	b=X8I0za+0DuH7Uricdi22M/uTCib/0T6dlZjRnidNjg5yq5jTJSBptkLD5BFMEGHu1c1Urv
	P/GlNk2/IOpNJyvIR6JFZdujnZRu/xEZn0nCpRkF313SELDqqdkb5FCR3SVckFMYEY90M9
	18vd1rwE2UFRQ3oazskYokOSUhwBLGeV0mwfPDVnZ72AuXrT6Z658yNUKugz058xy3LsuP
	ea5Ak61T2Qprayj5sy69Bh9wCks/IfLxiWrh1wKR4kT4++lr6BqaeOG7H5EFZVVsLCdGEP
	UY1R8QPgy+z09dqXUxNhPNfwhGA/TNJ7W8AAQmmc/tUg5TwCV91sJYyb5djeiQ==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 17:14:56 +0100
Message-Id: <DHAANIKVU6BV.20W1GS0MWT55E@bootlin.com>
Subject: Re: [PATCH v2 9/9] drm/rockchip: analogix_dp: Add support for
 RK3576
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
X-Mailer: aerc 0.20.1
References: <20260319104031.1986946-1-damon.ding@rock-chips.com>
 <20260320004554.2006299-1-damon.ding@rock-chips.com>
In-Reply-To: <20260320004554.2006299-1-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Mar 20, 2026 at 1:45 AM CET, Damon Ding wrote:
> RK3576 integrates the Analogix eDP 1.3 TX controller IP and the HDMI/eDP
> TX Combo PHY based on a Samsung IP block - both of which are the same as
> those on RK3588.
>
> The patch currently adds only the basic support, specifically RGB output
> up to 4K@60Hz, without the tests for audio, PSR and other eDP 1.3 specifi=
c
> features.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
