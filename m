Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795251577;
	b=pwDj46aPwG28laIYwAso4HH87d7UbfKNqGIuWWi+4c8JtUnA0B3yJ2eKdu9NVUAnyhEf
	 hjl9aXG9LK0rGeGCxhVLt4g6xdAdTZ2bOH2iBL9FiehYpwA2aedqz8djv1bCldaeJOwzs
	 Xow55nsFZTz+igvCBor3YUlRnKMrFdtrqHdNMR+fSGfAUUuhLqJ0VsjpND/ntXkT6LpLQ
	 jQAtyzPBJzSxmuCpGqx8vpYIO7vCDIQnheBVqrhbiOFEPItx44P1o3Jo8ufNe07Lp6b+E
	 MuwkzKdOLodIMiwMSU33RUNguMuiczbsqxE42yuR1dR7WZL9ZeDayZeMP8VXdELpXYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795251577;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NCTFB5JRRg8EpNoDbg3P7LW5zydeMcq3Z/Cv9CKpzbs=;
	b=NItVSWqhOSbdGeKCaO/u4UDRZv5OZwbj4NxYVvJj12SQ/1ObQ0yRilQ6arVOrQwahNXx
	 4JPFqRVvLQl5udTJfjL8JgRBKRkwasfGMOnBKTVT3EMUVumy2Sjb9jrfKqHkqS1fgA1Gw
	 Z8HqpfXjrr/PfR8aVMu3ftFLWswPGYza2O/CJdAIzyj2YmD2wZ6FAoyl9VU+JkB3ZQZT3
	 CleE5RAOjSF8zqRoQSpyRHnnXKJeKze9TofrQwcLuXe7VOQJf5JoOPga+9dAwpT7QXE/Z
	 nwsqblw04f6pp6081JKLMYJSAoOHeMiSBc+XHv8+Z8eD37WzwQKv3QYYBmdBqjQAAlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bnNYHsO6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBAD606A32C;
	Sat, 21 Nov 2026 08:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bnNYHsO6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5441F000CA;
	Sat, 21 Nov 2026 08:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795251576;
	bh=NCTFB5JRRg8EpNoDbg3P7LW5zydeMcq3Z/Cv9CKpzbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bnNYHsO6BstHjlpOWSG1Wi1ZWC7yG+PzG2yWh2EyZY6jyhofF/sGA8f7GhbXJuJh8
	 7oSoU0C3jfMuZJtw40NCbMUrlQuPDSi1bdnMlGXKewyhu+gxNLUVCfUAkWkPGRxfb3
	 wpm0edZCt4xbudCwbeAW5t6zpsPHhuGwYezoZZyrbB4BcGX0QvLylS66WYP0uaYu4P
	 UzgtkoWC2DKv7RCBbvs/bwHESZEVkKgNt1T+SWF39g0QF5gUAN1XJa/D1W9RODUseb
	 9a3L8owqfmFHDUiALLvO3NcU3xtitpYmcP+oC5Cvl93Ahkgc3KDA7nIMZfPbxc6qGa
	 dnaTxyg21qLXw==
Date: Sat, 21 Nov 2026 09:59:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, Icneowy Zheng <uwu@icenowy.me>, 
	Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: document TH1520
 MIPI DSI controller
Message-ID: <20261121-rampant-golden-urchin-ceb26c@quoll>
References: <20261119-th1520-dw-mipi-dsi-v2-0-9ab5f9808f87@iscas.ac.cn>
 <20261119-th1520-dw-mipi-dsi-v2-1-9ab5f9808f87@iscas.ac.cn>
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
In-Reply-To: <20261119-th1520-dw-mipi-dsi-v2-1-9ab5f9808f87@iscas.ac.cn>

On Thu, Nov 19, 2026 at 11:50:44PM +0800, Icenowy Zheng wrote:
> T-Head TH1520 SoC contains two DesignWare MIPI DSI host controllers.
> 
> Add a binding document for them, referencing the common dw-mipi-dsi
> binding file.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  .../display/bridge/thead,th1520-dw-mipi-dsi.yaml   | 102 +++++++++++++++++++++
>  1 file changed, 102 insertions(+)
> 

I don't think this was tested. You use properties which do not exist.

Best regards,
Krzysztof

