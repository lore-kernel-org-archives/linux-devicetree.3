Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103847;
	b=fYbs0RdIQWIPkPzgQmI/oSy/vOlGnylsb2mJF3Yz/BcPVX+iu0plfYdNjUbH+zGMlzRn
	 5e48tJRj3qceJYWVFxppo7ZB3xasCfZg3lSt/Nfx5Y2VA+jF/dYYPsCC4WCfyQWuBmcST
	 00TuacOunmmEiSa4p98iE2bSI9XhPcYc+ds95/3ni9SEzy0FBPcAGyGEyErofoE0OjdBq
	 insuBiPILvV6bHUVD2GCdy0M0kDtvptLiIfH0yIrk3w6EKleO2Jg3GOwhURupnjgoQ7M2
	 0SsC8ME+jTagViAOOHG5YOGiCAGQGcdMUZRpgxwgsZ11xlgTj1VY75zeUhfQ1EKiu7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103847;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=XcT1N1GHVwvDHW2mbdRCciKMMNvmId8fjYSiGhDgysg=;
	b=GNp8/aTVakdNSf4EzMxKq9hqf9WBvj8HPv50TH24TBuKERthUMeQ4Q/hPZ19u09Xs9W1
	 mmyk9OKSgPizSvJH72qKZIWemWKVWJRymboUUTQeKE3OFlEkB9NQfVIrpaSmPWbuwAbIy
	 ZQoY6Z5nlydIGUSxXyLr1l2MTBDUKGQh/Rsoa4dCE7kobPWaqF9azcX3iZ+4kk8lYINkS
	 rc7CYP1etme/7qjSzXlxSwBnmFNRWQMZfqISjP0xbevz6GNyFxDJLweetuhBVcTaXUzJJ
	 t35nkw1ewL0NUYj749R1TXduHGyyOJRRf3ObjZarZBbItpbJuzAQOMEyB2dJ/dDuOVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b="snfT/r7J";
	arc=none smtp.remote-ip=212.27.42.6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893E760A2611;
	Thu, 19 Nov 2026 15:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 893E760A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=snfT/r7J
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3D7B578034D;
	Thu, 19 Nov 2026 16:57:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1795103839;
	bh=ICdMlhTFeha21pZvvVAfhDVEl7HZL+KT6ohipt9rgNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=snfT/r7JO2xh+gI9mOw4Szjy2GLjGvpT6IOEkq/RPDm//ttWXZodRrbfKwk6HFD0J
	 RziB6M1wXt/DCwRCyNTc+rKmorB2sHc3NOUc/DnZsKCilZcSle4TxxNQNf+dveXDdU
	 KpuQQJKqvCbTebh/7Tsx4dliYP1nWvtn3sUewrfvjs5FF2pxi32Nfr9Q21PnDxd1Wz
	 f5+BXK4he4KOyGWEeM4QxIbIx1J0zzSu4xVu361n7qRmYOoj5OIWmnRgexrmbTKjw7
	 gMvPynUZqcuaYmu8QOYi1SL1DbmxCsIumWfWjW9hApXHg6jXUU+Fq7UaaYI+NDDqq1
	 KZayY9nMtFtrQ==
Date: Thu, 19 Nov 2026 16:57:05 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH 0/3] phy: lynx: add support for downstream retimer PHYs
Message-ID: <av8cUZ2F4_iw2fQV@L30177.local>
References: <20261118163134.2149894-1-ioana.ciornei@nxp.com>
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
In-Reply-To: <20261118163134.2149894-1-ioana.ciornei@nxp.com>

Hi Ioana,

> This patch set adds support in the Lynx SerDes PHY drivers for
> retimer PHYs which can be found on the board downstream of the SerDes
> lane towards any connector such as an SFP cage.

It is a good idea, it can be used then to leverage other retimers
on those serdes too (like a ds250).

So, two questions:
 - in patch 3, a downstream PHY without .validate fails every mode of
the lane. Could it be stated in the binding or in a kernel doc ? A
minimal retimer driver would take the port down.

 - for 100G and 40G ports that are 4 lanes under one MAC, and the
Lynx 28G driver has no lane mode for them, so set_mode would never reach
their retimers. What's the plan ?

One more point: we need to be able to tune the equalization and run PRBS
on these chips from userspace. A driver that selects a channel and then
writes would race with such tools. The retimer driver
would have to deal with it. What could the proper design be ?

thank you,
  Vincent
