Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0354246784
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147092; cv=none; b=NtkaqNEak30/l2HKh+odmhipqb9c2CqoImZCspxHX0c1HcXi5cy4grcd99xFG8aZAx8dutHc/LEWqfOa1LmY6sXvvWigdNEseQdmBnjLri1YEpzqpTVF+xLicT3iEvKuKnM8805iAZIoKMZbuRQQA8+G3LKKjkRVIJOrFjGHwnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147092; c=relaxed/simple;
	bh=K9mC195kTGkDqe576lBOFyGmxBtljNyscPxIuA9C7CY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VBV1D/nsTehQ7C9DR9GTpv5K8NqhaQkcdEHAKqtjXanUcVD9FsrFfXhuJ/forgQg5wdGJPEOfrPREBvZ6Vo1o+Xl4/Sm2aJCXaYBOpEJwU0HUTlIN1e7nVKCH9Yu/abrIyHT0DjaDowElU+z63CT1N/U6oTxbEzciInk05gRV2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SQj4jr0b; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SQj4jr0b"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1d293b293so1551325e9.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147089; x=1792751889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6nGmaW43TFsY8203dyOJ+Nrc5EUvdzx8Ca6xsjCPHmQ=;
        b=SQj4jr0b+A613FC6vNIBdD0mqbr7aBlY8+Ytl512zUnY5muA/Vh8R7ppco/GQxcUbt
         ZuwJx88IbqEQlmNQ4zZrLCYjTRbj3eaQQev9OZjuyweiCdfM6MHSNg8GV3kjLKiPRLMJ
         I/EmeIgUq6IgnmGJFCKAZEnx5nsipyxSBLhx4wHr6hC+vWhi0E2rdM+ZNSC4wrZWN+g+
         mi0uzhP4WmJ0qj9h4adeWtG8VQvjGn+mHvQBcPnc4KBVW2Mf0o2SzPuzc+6h/9r4GaAc
         2bC2ewGTOpQEFTCdFU7Pz2ci12qoa0f2T5kigAp9DL2AxTDg77MsbtMAs6a1kuk0/efy
         DEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147089; x=1792751889;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6nGmaW43TFsY8203dyOJ+Nrc5EUvdzx8Ca6xsjCPHmQ=;
        b=CRoArvN+OSIgf1AN1JlWSwPZnRTf3yjCECGohoyglw75Y5/gqQP4cRZiFgJVKdLdfs
         Msy2HWQJoSQovAp7kytxdEKSgEdtG9rGd9R2GzLrUuBvGXwJPdFY1QNap4RD6kItYXtA
         de3eZlJv5be/pcBS+TkoDKP0qL4/XFKeX/GYIojVioyvGMaNh2k39rkmAVrZaUIAJcnz
         nwiMI1vPRY/F2lT9SAbHbVg5sSnbc1RW5K/KVM+nicblCkONztShmg7O7XBUr7aJsRiO
         qal18EvVugiSPUrT7t+FxGx2BaVr0HjdW5Ng1Bt9iaw8L3o11hd/Mu93rwk2FuTELxyu
         szZw==
X-Forwarded-Encrypted: i=1; AKwUvBzb4Lj+OWS03LUtyprDIyxl4sy6Ln/0+Jx/MSYRpsQwF4VIe5T34KwMWC41MLdNyA9pKOBNkxjdnEh1@vger.kernel.org
X-Gm-Message-State: AFq9FYKCoifuhjb5dQjMNbeGlvetgjhLLQsbkEWrWbRNOx3gJBqhChSu
	+S3ga2hjwZDpS6I2Ot2Z1P9KSWGojS8oEUOfEGUl7YVqqDyey5si/kyXCE+DfGgTMqs=
X-Gm-Gg: AYBFou1jBimrQAkizCxdxpVu+3N1RXEuMV3vWMTvlyUdMPCsz6io97xpnrwOw0fU9T5
	Hzs/oQ3dcjK2GR8cSfjmU5dJcxuvQgZFMdpoFIrn8QmM/pQsuUrlYKsM40ZgvqRfzthiswq9Pm6
	P8EcrNhIgAYtaX82hjlLX+oJ2CoY3jLT6Mn3bD9Da2Wgojv94qmtMIVLoXEr+/FK+THX75yUQUE
	YLayeoW1Z9yWz3ELfyVgutSPXAEumRDvbTuZdmn20+SuD79iIg4vssIPETZCbu16WFS//AXS9q8
	ZQPwBiTwXYeeGS7al71uF5k037zLL7PbwZqkahMES5zB2ia7CR75/6dBxtElr0cNcBublPoGTZ2
	QjxR5fo3z0wL0sCipLGOVQbesA1EJWobjwc5fL79iXNp2G5ARfUA4eav46wURbkmVlLlvJ33mLp
	wnu/yNFWzuESmWCtusbG9+RaRQBdaFWwbrwBY9C8Y2+/lZQCjFHRYedAvOnnrRKs+jvMZPrqeMd
	9ZiCBHGows=
X-Received: by 2002:a05:600c:1c23:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4a1cef3fd00mr28299025e9.9.1792147089174;
        Fri, 16 Oct 2026 03:38:09 -0700 (PDT)
Received: from [192.168.0.167] ([109.78.92.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce02d619sm26430935e9.3.2026.10.16.03.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:38:08 -0700 (PDT)
Message-ID: <b4a76677-0929-44bb-9c94-7ceb09952168@linaro.org>
Date: Fri, 16 Oct 2026 11:38:06 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] dt-bindings: phy: Add PHY_DIRECTION_TX/RX
 definitions
To: Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-1-e63b49eabe2d@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261016-dcphy-rx-v1-v5-1-e63b49eabe2d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 09:56, Jason Yang wrote:
> A MIPI D-PHY or C-PHY can be a transmitter or a receiver. Some PHY
> blocks have one of each and can use them at the same time, so one PHY
> node offers two PHYs. The existing cell, PHY_TYPE_DPHY or
> PHY_TYPE_CPHY, selects the mode of the whole block, not one of the two
> PHYs.
> 
> Add PHY_DIRECTION_TX and PHY_DIRECTION_RX for a cell that selects the
> transmitter or the receiver. The first user is the Rockchip RK3588 MIPI
> DC-PHY, where the transmitter serves a DSI host and the receiver a CSI-2
> host.
> 
> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> Link: https://lore.kernel.org/r/7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> ---
>   include/dt-bindings/phy/phy.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
> index 979b5dfd8353..9ead74d9a172 100644
> --- a/include/dt-bindings/phy/phy.h
> +++ b/include/dt-bindings/phy/phy.h
> @@ -29,4 +29,7 @@
>   #define PHY_POL_INVERT		1
>   #define PHY_POL_AUTO		2
>   
> +#define PHY_DIRECTION_TX	0
> +#define PHY_DIRECTION_RX	1
> +
>   #endif /* _DT_BINDINGS_PHY */
> 

This looks like a neat solution to your problem.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
