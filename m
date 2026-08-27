Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5101940B6DF
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 08:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821016; cv=none; b=d0mgl4tc6yUyRsjos+4mHtSyhjEcVcb65YCWBvLtok35mOg2vKk48pF+mqOFQYmOY5kOE6a99iX5BiU14B2fzwfV6vywwLA9zp5UyuEU1bGV8y0P3OBLsAGGiz1HPeO055oJUu/frPqRuZFl/5yNuMZ2ybzAJrPeq+KESXubX44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821016; c=relaxed/simple;
	bh=agVt9u5auVW/rGrjfz9BIea5qwFk+9eBDj75bT1gfLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QznaHMh57urhvupfl/Bdgq7EiAtdy56xDRoxBIUFP8DrmX8Mu4/AraOx3MkEV3MIwFW0RdKtukqYEyWiLFj2R0Ao37kzutT6fEDdxZ9jiNNMdLlAzD+Zx9BKPt0mz51rhx5+1LH16ojQIDZF3xkwv+Om3ZSZMRABgcJA2ZJArcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vq284FHM; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vq284FHM"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d715f4a587so19607495ad.2
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 01:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821012; x=1788425812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zaEqDrC5jYAKebMDLgOTjAUIE2F2Prlvaylcbrjmns0=;
        b=Vq284FHMSAssFtJhISDoaAQJyqtV4XRYd4nuIRxr+XdZf9iTPAarPc9rV9dCtB1yZX
         8khYu81BA4Wy3hguL0MrQ3fwgJzlZvHZvIh1PIFUN8+NR//0gxHNZEypaSjuUX0KXOCs
         JTbugL+uZgBlL5/zCAhBYk2o5x85MkwXQEazmcIjr4ci4G7ybzmQ0mIMoZcrlGk6YrSJ
         ef+e17LJcImzPDWUvIe7D9y5C2x8cAUwqaT7/Gqmhkno2ddJvExvc1x8Pof9mA2Z9LmG
         /d+IZRVqodjxn7QXgOO0nhdh84wMuNqgDhQZz4BcoDMwaiLNBKkj0CNFkoROwFzQo7Vs
         wNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821012; x=1788425812;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaEqDrC5jYAKebMDLgOTjAUIE2F2Prlvaylcbrjmns0=;
        b=bz4EOouJIGDSRSfyhsWFqsptnKiOXNce6TZ9bmzPz7hYh9EwilJ+x0hDr+mo/fJmmT
         G3HCKdvDIlp4WKvTaRU5eDsR3P+MCPAdPGcEyQmkMPO1edeAjz5LElJjETZMszPTT48/
         NxJmzYZA2oIGxqqicKF/cbCY39YZixM3X8ZUzYlrYEBVx4f9aI8RhWo8KyDiPqbs1OAK
         ImdXm+fWmJHxKSHnYq3EsU52PjMZ/erGL4W3P24S7zjXkMvF3Cx7J880XCwGo8Wx0Lvr
         7/hHM5SZVZxwe2N+yevm+ZgDZ4sF8dCXAPtH48EYs9MFGM9pP4VV5GxbPO79jMTCFJYZ
         B8hA==
X-Gm-Message-State: AFuF++m7kfzA8YYd7Tu/8BsctF8idQPOMOJQKipLE93hk02Tnhh6C8Ht
	SU0BjE/cnp3swWgiHiXuFMpoNL1mRjZsGIrgH1qWZKvD5NVZfz5QSYjZ
X-Gm-Gg: AR+sD11w7apeGZBE85YRyT0TnF1ieTd2dGAi6VFFiMPudk0yKlljx88UqEF7AnuB8jW
	GYx+Gmytp2qvJr3ypjenyxix0QKRPodYPhzgrgk9NTzRSoTHOcxf7Lykhu637i+oTXejP4LVgM8
	2ZEHdJfjDEut6DL4B7nTIHTSgTsJRi2yTXm/TBkXVdOVTrlSQcJYpU2I1PLAsLjIX8hZcZ558gv
	PXOQe34cncJqQ3UbMNBRUNwsOQMlN3sVZpHoDPyF63K3x7+0mw/taquuFKbn0wrfq9L3rhpNZ/a
	bjG0BFtiHORl2UxHoOjFmEV6lYzyG3JfKi9g4Aig7c5Ftw8LYi8j1gjc++Zx2bqJbbYgBjxyU8I
	82Z7bkiyYM2fFXSnO4GPySfBQxrs2cawknQc7haGz/jVZuvAepWgEkWunQNxt8GT7qQMV9f/bma
	m36dqViY70ijUbuuns3UjPHoNNQagKpLVmZ0Vqoj8UcIOx9Oy5r4loaSHi/yf+WlSzyAMsK/mR/
	UaC
X-Received: by 2002:a17:90b:520f:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-3966d5f8f84mr28728747a91.9.1787821011778;
        Thu, 27 Aug 2026 01:56:51 -0700 (PDT)
Received: from [10.25.160.98] ([165.85.1.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3967582e855sm2085902a91.2.2026.08.27.01.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:56:51 -0700 (PDT)
Message-ID: <0ee330e3-8c6b-4162-81fe-d769982df5de@gmail.com>
Date: Thu, 27 Aug 2026 16:56:40 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI
 master assignment
To: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Yannic Moog <y.moog@phytec.de>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
References: <20260827065556.2326079-1-primoz.fiser@norik.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260827065556.2326079-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> The dailink_master label was incorrectly placed on the codec sub-node,
> causing simple-audio-card to configure TLV320AIC3007 as the I2S bitclock
> and frame master with SAI2 in consumer mode. This contradicts the SAI2
> node configuration (assigned-clock-parents, assigned-clock-rates,
> fsl,sai-mclk-direction-output) which requires provider/master mode.

Just a small question about the commit message. As far as I understand,
these SAI2 node configurations only describe SAI2 providing MCLK to the
codec. A topology where the SAI provides MCLK while the codec is the
bclk/fs provider is common. So the original configuration seems
self-consistent, not contradictory.

Regards,
Chancel Liu

> Restore dailink_master to the CPU sub-node so SAI2 drives BCLK and LRCLK
> with the codec operating as I2S slave. Also remove the spurious clocks
> property from the codec sub-node which had no effect in this topology.
> 
> This fixes the broken audio on PHYTEC phyBOARD-Pollux-i.MX8MP board with
> PEB-AV-10 Audio/Video expansion board.
> 
> Fixes: 7012f551081f ("arm64: dts: imx8mp pollux: add expansion board overlay")
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  .../boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
> index bb740f845855..8957b24a7ad2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
> @@ -77,13 +77,12 @@ sound {
>  			"MIC3R", "Microphone Jack",
>  			"Microphone Jack", "Mic Bias";
>  
> -		simple-audio-card,cpu {
> +		dailink_master: simple-audio-card,cpu {
>  			sound-dai = <&sai2>;
>  		};
>  
> -		dailink_master: simple-audio-card,codec {
> +		simple-audio-card,codec {
>  			sound-dai = <&codec>;
> -			clocks = <&clk IMX8MP_CLK_SAI2>;
>  		};
>  	};
>  };

