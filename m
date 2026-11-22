Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795360199;
	b=yuxqgxI61Pin12Pjat0ZGx2fiCM2Uy7S0Q6ys2X6azmKf/ISOq2GF8xBaUOBfdY+vMW7
	 btT6arkHnF4TKuUOoCaK0DCqPsOFdk2DIfIRa5harbz+HATNXOc2885sfkg5C+NZMI6jO
	 XgONN4QlSJlrTcAfdjfO6YlGrbZtLS3mrwzu85ajGPcLzI/l1K79OnyqHr4koSZ2h2JDX
	 hrV0p4mON1Sm5EVj/z/ZLf80CaE2e/mojNI3t8mBoFF3EaboXVWe0mISnBrCazeDMAt3M
	 tB8ppFs3oN8DDPC8m1MzPMhZMBX2AaQg11IjRm3R7DH8uPbO937o3JfTQ+lEQzIJ2+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360199;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=vZeJ151erQY6V166IfiHzHXqBCEL5A2S1Gcx7AJ03+s=;
	b=qqEMh7pspxk/D3hHYoKSvdlcnDd9oFFdooj5Iz2slkLdNixk/9+9si1Wz5AP1QCdBSAT
	 8CBC7IB5IC9oq4niOp6ZgjeNFmyNsIHhacIfvz4ByFOhTEezdxN4YmSfnVfJL6SgHQ/jG
	 ITsebUghMQNQB3gjoU5R2PkpKlNn38tNY8qAcJ89WNEZB64TV4wAiirBNUKfxflK+JmzE
	 XM0pNVxh3Csc/aLc80g2HLNC6XsWEwnrNqDu1PeQGjpH2/rBLaD/UhT8IRuXkP6RyWVGc
	 iRadX+feqjUqMtyi4VDxPl19KSo2iDWE7c5+/WAAIWrnw78BX73g73lD4XfCax0+9Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=dWk5wVF+;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4983D606A320;
	Sun, 22 Nov 2026 15:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4983D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=dWk5wVF+
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F6BF177;
	Sun, 22 Nov 2026 16:07:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795360038;
	bh=IMRAy5bUasbpD/Tw7zcQxXeVbhBdEkFoZeMY9+96wKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dWk5wVF+6fLHQBBzxh8b2SS8ij5qaN6OUs6mMgqr5B56aWY/s8wpt4WGX6K5RokYX
	 YetOQSn/qU3V41NW6+zsFVBBquu+Wf2EV61tExw2fhKOBFkLcWcAUeoPycSmgCVhy7
	 dM165WjS6P2F6oQMPZOEbbMXDZ5ydXwQnm5mmVkQ=
Date: Sun, 22 Nov 2026 17:09:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Alexey Charkov <alchark@flipper.net>,
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
	Sashiko <sashiko-bot@kernel.org>,
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v12 06/23] drm/bridge: synopsys: dw-dp: Fix AUX transfer
 timeout race condition
Message-ID: <20261122150948.GA2881876@killaraus.ideasonboard.com>
References: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
 <20261114-synopsys-dw-dp-improvements-v12-6-d42d3dc5bdd4@collabora.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261114-synopsys-dw-dp-improvements-v12-6-d42d3dc5bdd4@collabora.com>

On Sat, Nov 14, 2026 at 06:00:39AM +0100, Sebastian Reichel wrote:
> The DP AUX transfer method uses a completion triggered by an interrupt,
> which can timeout. If the function runs into the timeout and the
> interrupt fires afterwards, the following DP aux transfer completion
> would trigger immediately without waiting for the interrupt. This in
> turn means the next one would also be broken and so on.
> 
> Fix this potential issue by re-initializing the completion directly
> before sending the AUX command.
> 
> As this is racy (the interrupt might arrive between the completion
> re-init and the new command being programmed), also reset the AUX
> controller on timeouts and synchronize pending interrupts to guarantee
> that there are no pending AUX transfers when the dw_dp_aux_transfer()
> returns.
> 
> Due to lack of a sink, which generates AUX timeouts, this change is
> effectively untested.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5+
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-dp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> index 7351b70bdac9..df0b98cbbaab 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -1465,6 +1465,8 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
>  	if (WARN_ON(msg->size > 16))
>  		return -E2BIG;
>  
> +	reinit_completion(&dp->complete);
> +
>  	switch (msg->request & ~DP_AUX_I2C_MOT) {
>  	case DP_AUX_NATIVE_WRITE:
>  	case DP_AUX_I2C_WRITE:
> @@ -1491,6 +1493,12 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
>  	status = wait_for_completion_timeout(&dp->complete, timeout);
>  	if (!status) {
>  		dev_err(dp->dev, "timeout waiting for AUX reply\n");
> +		regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL,
> +				   AUX_RESET, FIELD_PREP(AUX_RESET, 1));

As this is just one bit, I'd find

		regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL,
				   AUX_RESET, AUX_RESET);

more readable. Same below with s/AUX_RESET);/);0/. Up to you.

> +		usleep_range(10, 20);

fsleep() uses udelay() for delays up to 10µs included. Is there a
particular reason to sleep ?

Please also document somewhere (the commit message is fine) where the
value of the delay comes from.

> +		regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL,
> +				   AUX_RESET, FIELD_PREP(AUX_RESET, 0));
> +		synchronize_irq(dp->irq);
>  		return -ETIMEDOUT;
>  	}
>  

-- 
Regards,

Laurent Pinchart
