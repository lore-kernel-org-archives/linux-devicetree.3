Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340456;
	b=f8kcIh+yQ+1KqX7GLt9DADvPd015BvSMvHHRXUCcpY/h47pg8WRjEawEoCIuOLLahYrF
	 e7FgX09F9CVN06mVjZWd3VoZNvaRPTJgn1H5QzXzn1utTyBpYfmRr4V8urowotqoPdJ4q
	 6AJMRhQ16u+0GWr9P0zN9eXSEKxA/zvSOsZtfZELFdAN52/Yb8rXtlDEWZJgpE1jV6obR
	 yniacehyS4/cSZpvW8rBHeiDWsby3oRW7jxpI7SDHwkk0YgG722oKTcLSYA7G0hxKYQEt
	 3+JEP4u6c1vOy3hpPCUrxgrJfY5B3RY2GqhKbYbe1wKlrQE/+WHKAdDug8pwj8KHPsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340456;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=IkIbePbwpiJw2XaAzSr+/25S6QYyRwR70kd3c2KH4wM=;
	b=TjEDffaKzM708LbC1yLoPain1GHo5+ZdjhsuvCZMPcqrdPlQLFGG3OAS8Pr7eBSOkOV+
	 tvLzY0e8UrI5hhTCrAP0eyFcm3IeqrsYTXTo9KE2nKNfjsP9CPaj02jv4FCzC66tTGDw7
	 nbOU1lfUdYAtybHBDXT7DWThBITsp9NVadNp+pQjX/CX0MRfPgWNEgknNsopBKya24TiZ
	 QlRgVFvuWwNhP8ygM5fvmSO8m7dHHJ+ss7qFfueWD7n/WBSg7gNFKP8LGMIXcomx3XiZP
	 oIICzPm08/dpgbD5GLSXObJyAAtkIDXeKLkAxwZ634/dWMGuL/0axpw3Edd4mJQLoCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=GL0q54Lr;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3497A606A320;
	Sun, 22 Nov 2026 09:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3497A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=GL0q54Lr
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDD82ABF;
	Sun, 22 Nov 2026 10:38:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795340301;
	bh=yTMMp7PT3K2LyuvelR0MmDh6s2VsGr4kgwTbxEVPAwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GL0q54LrHkSn2pAjjFMO58LLdrGwbsOPFXG57oU5XxCd+1cPoP2nCvPVBSf7C9dxv
	 TwU3KgbXpSkLaiHRp58caVX9suZEC3zznR0xZJI3ZJmN/2t9/W96BG8p9UYKDAh5Bh
	 89KCH1L23XRTnHsOCB1YCLTR2uu+yfQ3WGQNisZ0=
Date: Sun, 22 Nov 2026 11:40:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andy Yan <andyshrk@163.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Damon Ding <damon.ding@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	Igor Paunovic <royalnet026@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v12 06/23] drm/bridge: synopsys: dw-dp: Fix AUX transfer
 timeout race condition
Message-ID: <20261122094050.GB2739410@killaraus.ideasonboard.com>
References: <20261114-synopsys-dw-dp-improvements-v12-6-d42d3dc5bdd4@collabora.com>
 <179533990370.107225.5765165679182115805@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179533990370.107225.5765165679182115805@gmail.com>

On Sun, Nov 22, 2026 at 09:31:43AM -0000, Arun Iyengar wrote:
> On Sat, Nov 14, 2026 at 06:00:39AM +0100, Sebastian Reichel wrote:
> > @@ -1491,6 +1493,12 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
> >  	status = wait_for_completion_timeout(&dp->complete, timeout);
> >  	if (!status) {
> >  		dev_err(dp->dev, "timeout waiting for AUX reply\n");
> 
> This still drops a reply the sink did send when the IRQ thread runs
> more than 10 ms late. On RK3588 (7.3, KASAN on, v11 of this series:
> same 06/23), with a SCHED_FIFO hog at the IRQ thread's priority on its
> CPU (busy 40 ms of every 200 ms), 1410 DPCD reads gave 183 timeouts.
> Checking for the reply once more before giving up gave 0 timeouts,
> with 127 late replies taken:
> 
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -1493,2 +1493,6 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
>  	status = wait_for_completion_timeout(&dp->complete, timeout);
> +	if (!status) {
> +		synchronize_irq(dp->irq);
> +		status = try_wait_for_completion(&dp->complete);
> +	}
>  	if (!status) {
> 
> Feel free to fold it in.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> 
> Claude (Anthropic) wrote this change; I reviewed and tested it.

There's something missing here. You may have reviewed (whatever that
means) and tested it (probably), it doesn't seem you've understood it.
All of this screams of a big hack.

-- 
Regards,

Laurent Pinchart
