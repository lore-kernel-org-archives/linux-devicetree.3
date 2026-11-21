Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278031;
	b=SsLr+cRCkJ3ZbzO9fJymGtJwwOQiLnExsThXoDArsrp3b4RGtr6UKkjrRIeZMfBZju49
	 BvHdegIL+0UqSJW5HJWY8+UKMMHeIHt7F0/ny4oVQSQxSCcaYKn3PFv2rgC35+qupDlPI
	 xVcQePO2R2IrAGJXj9csBmyRdq+UBOxNXuWfau3+DgfjTS2kYXllEt8mbMdfidAS9gp8G
	 PbGeGbFXWdRCVHfTlox6p6ryYGCWKKNJU/w8FjSNZrqHlMbx/bh1wRCdIiUvEY/8s4zQ9
	 W1Uno36/oHcsaFCgQcmuVlxYMcn6F8TqQxROMtZOi7ddponK2p1U0y9v5hRg64GgrfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278031;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3l4SFbuOj5dk76CH8WLlUS1oJhbjHRne3f5AmVhjTLY=;
	b=sAOT4C0xBBlN4b+fpK5psy8L5FuZsFet/jLGHS7ORd8U9fbZWqEgxkrdm8ZOrj6vxs0+
	 mDua+vxD4WcBbU5zc7vWRh02RmeGfpqimNV2N1oY94ihmQIavr8CQ3fMUEO/kDDQVrwF2
	 VKxvBIgn8VwYVykNU4kJ6GrrRzqWwO1S+JuGMOdOku0ID8zjpoQ2g6ZnGMqqdwdjfxnIf
	 WTMFfMz0RXqeNTsTmMFRpAgdiYGWLEDPpzFMCttWfvmL0cO7OGxtx8MFolShF+gWIWKaP
	 3MU4rvY6YJKT6444ZFxyAfMEM9J4hb5r3HtqQ2kyUm8ibZ2v4IFQ05hcj3W2s5D1fRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DbVSWC7V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013C0606A32C;
	Sat, 21 Nov 2026 16:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DbVSWC7V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C4B1F000C0;
	Sat, 21 Nov 2026 16:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795278030;
	bh=3l4SFbuOj5dk76CH8WLlUS1oJhbjHRne3f5AmVhjTLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DbVSWC7VKgufodPLITMDB7xUvKLbF3dKmi6jxzzF+KquLsBbu4vAbHWbQ7f8PneDK
	 jv/sGtfqJQuSj6RpB+9bE29OzEsVcs9J/Z6E8U09vqSUEnqQQ+jkYsVAVylh2B1Wqs
	 7N5eLpK+raKU+qUHpz6HFNTiq6vu/wNjakwBVo2o9eZcqGK6FKz4/iLVjzWB80JE+D
	 QO1hlzAROBWstC/lHeUbnDEzah8khFCkx8rHrz1UDGu1TQme47gbkTCdiW/zGEs0+n
	 DLmYoKjUZQANTtI+BIoMl1KOCj4U4OxbSOQ/YjU0WV8dKCVP91f9aLx1nr9DVUrqTD
	 6G5U4BQHmJ3qw==
Date: Sat, 21 Nov 2026 17:20:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yuti Amonkar <yamonkar@cadence.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Andrew Davis <afd@ti.com>, 
	Vinod Koul <vkoul@kernel.org>, Chintan Vankar <c-vankar@ti.com>, 
	Abhash Kumar Jha <a-kumar2@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	Swapnil Jakhade <sjakhade@cadence.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 3/4] dt-bindings: phy: cadence-torrent: add phy-mode
 constants
Message-ID: <20261121-wine-nautilus-of-courage-94af4f@quoll>
References: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
 <20261120-phy-cadence-torrent-ng-v1-3-da2db7125cd7@bootlin.com>
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
In-Reply-To: <20261120-phy-cadence-torrent-ng-v1-3-da2db7125cd7@bootlin.com>

On Fri, Nov 20, 2026 at 01:55:51PM +0100, Benjamin Robin wrote:
> Add the `CDNS_TORRENT_MODE_*` constants to
> include/dt-bindings/phy/phy-cadence.h such as SATA-LP and 2500BASE-X.

But why? Why do we need more of these properties?

> 
> These constants are used by the new Cadence Torrent PHY driver and
> are referenced by the `cdns,phy-mode` property of the Cadence Torrent
> PHY binding to select the PHY mode.

That's obvious, explain why you are duplicating phy type instead.

Best regards,
Krzysztof

