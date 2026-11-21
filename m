Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795277951;
	b=KLyzYdgpwiO6G0GU+RSI3qoLuS7/Ev6/enzrHx88xDV909eteBZe2iM7zCcpLrC+6R0Z
	 P2TuvedeHZMAhKTSdMdahUC0V7z34tXxbI0sj1e/19fbd7BYmREE6Nt2Mh4tLdXhad9Fn
	 SiyCV7dwqnaQX9P0vnMdaSSkN2RBI8V+06VBDDGbkXil0dK6grt2orvcqW4drej0uh9WR
	 uh1xMtqVfwCXg8jnQBNPbo/sEcwVFvJrCfxtcyTue5WurSEH3L9a1sI7OMPKQL8KBII96
	 MVXv9G35Pyt6UrDaAu15VQZLgNK9+lSLdk444ODInqfW+ABFWxe/06AfP+AE4vLVajA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795277951;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6sRevr2xT+LuyoIF335Qd8qzVJOfC1tRYDG7VWVmjQ8=;
	b=eOZYKwW28WCn6hKRyOgamTrzLaoadb1LTstEwyPoqM079Ktr7O6wRrbjU42qlpDRpLSH
	 Z/juLpOEtQZOIvxbjgQ12YLWnN1u87ivM4fS2u/hHa79lTK30jDLRNmATViXxw05q6x5x
	 JHIuJD3dp3bac0noOjeoL0GJNVi8vtpisD//x9hZBamb3a9jVcvMkUA149dloU4sUk5pz
	 gIRYO5x65zF2DNedhX9U58ZdcI5l1e0auKm5EcR0TtIJqkBPusu/ZClO7uc1EX+v3of/r
	 NzNMI2yzr5ZNkduiWQPx64D3vQYJKgpYyYXCuiO3XBi1JTtNF66gc+QCnin/ENerD2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bS64h1/A";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106C7606A320;
	Sat, 21 Nov 2026 16:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bS64h1/A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811131F000C0;
	Sat, 21 Nov 2026 16:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795277950;
	bh=6sRevr2xT+LuyoIF335Qd8qzVJOfC1tRYDG7VWVmjQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bS64h1/AfN9Y13uTYNtXYdH9QsSq9BtdwLzIa2UgMNjsrlnxmdVRtvyjEYUT6jZFI
	 bJygeLsCIu6f7RLKdr8bMJHbR2k5qMb17lJnUuvTjsvixUiMVZdDHwydbYralGYqp6
	 lTDdgW+Xg69sywWrDd7itszC1P4LhYF0Im/UBf8U3tfUPjw9GFkBmp0OfeY6qEutwr
	 5HWWHSX6XiS0uj/sdJ88xh4eaJw0I66AL0iSyme2ANbHUJFWMC5+s5qhx1pdCOGB8Y
	 c2PeTg2XUmsOxCN3N7i2OVWFrcf3V/6FIj1G2cZIeAVyMSKEdYA8Jrpo8PJfpTjE5h
	 EBNSVu7RgYmYQ==
Date: Sat, 21 Nov 2026 17:19:05 +0100
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
Subject: Re: [PATCH 2/4] dt-bindings: phy: cadence-torrent: drop
 cdns,num-lanes default value
Message-ID: <20261121-favorite-turtle-of-penetration-c3157f@quoll>
References: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
 <20261120-phy-cadence-torrent-ng-v1-2-da2db7125cd7@bootlin.com>
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
In-Reply-To: <20261120-phy-cadence-torrent-ng-v1-2-da2db7125cd7@bootlin.com>

On Fri, Nov 20, 2026 at 01:55:50PM +0100, Benjamin Robin wrote:
> The driver treats cdns,num-lanes as mandatory and refuses to probe a PHY
> sub-node that does not provide it, logging:
> 
>   No "cdns,num-lanes"-property.
> 
> A default value in the schema wrongly suggests that the property is
> optional, which it is not since it is listed as required. Remove the
> "default: 4" so the binding reflects the actual driver behavior and the
> mandatory nature of the property.

No, that's a bug in the driver introduced in 2020. You ignored the
background and history of this driver and DT bindings.

Best regards,
Krzysztof

