Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D5E1429D
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 01:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510437; cv=none; b=QRbusYmx68IooluKE3mS9Cm9FBOk7xtaReGZRjfqFTWBn4kJN+E+qmegkAVlWkWyZa3gpNgalAx4LYEbIY3ewlNDPmFB5GRdKkizX0NNqDuEfIysZbZfwgWutsbSHYII2nxu9pLhWHjU3eaia14fmZ63SCOJcWnp4OSX6qId4Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510437; c=relaxed/simple;
	bh=wy/W3rCE08BEGOkA4MW9C4wcclBkJIOvah841ys3JAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oPOJeov2GSPKONIhMuGQvPO5cTYG0Zptc9aQ4vj0+WD3mP18Vw5a0l0KbInYOsxrbSDQ+wRv3YE2GTXRF6cXXpAJc2izNX4h4Pb99u7IWxDbb20bAcQXuRcXtGwhko6TCH244HXydf6xQgdR5KAx88vrOy9Rwjdzgnr0hyvr3hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Av3xJaO8; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Av3xJaO8"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8917c712f32so1553276b3a.2
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 18:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791510436; x=1792115236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y5hYJjC9f5xrA2SeP8FzQjM1WwMyehhp0Rue0U/eEM4=;
        b=Av3xJaO8vYEvfenhvsUyxdA9tHAY3lUzCe6V0oJjsqNYeVAy07QaGVYLMrJiBjjywq
         MMvFSqiYHwXnzx3zIJwMqmFgGLuNpVuxiGJ5KN8RkS+6YDtJY4J1e2iUyACLHMnAs5lp
         DCgdxYZvONkRKQT+gnEqtVf7a2DXPa+ZtfwYJrdR20fCtjxBFaaoKgAWMz6iMBTzLrnc
         nbW9VA4yWdvVoiiUB5okfJCZbL37wIUmZ8/QIs02p/Vqef+sWfD423g8TfjVZ0wmLQdq
         6btccWa2ddRYzyh7wjOfT/hhdnriusxNab1xMblqsPts/anC5kTvW7bhNm8oad6ItsTe
         kHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510436; x=1792115236;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5hYJjC9f5xrA2SeP8FzQjM1WwMyehhp0Rue0U/eEM4=;
        b=JDKJWZ49X8fsSd8JssAKMFQd5v+cKeZFUdRjJyVMBRENzgdXkxvYAArcM1gyWfpCdu
         BdRn+Qca4X3lrehJhHofm+6ETlcX0N4MqHgSbI/LeNHeiK01PZXToN7z3jx5de/5oVdu
         eT//oS5vJ/OX5BPsErqeSfnVct8cLrAvKFkes06Ixb8q3SJhq+QDuKqp7qFrP8xtyQMi
         aLDeskB9SBdT1Shlo+uhfKkEcdu10DNarIv3ucG4PVYWq+SVkd07THcd3RfTRvBMcLtU
         0tNCPMIntrlRHrLffyh9eGs11num7ESq9F88Z4KbiCLXbelRHl/oVuVTeGoWmMDJG+iy
         rM0g==
X-Forwarded-Encrypted: i=1; AKwUvBzFZUQWD0CbBa2wsBWpkOcXrn8nnb41VizawIj8FrTTbm7DbUIvetUGU+J96WC8y6eOjSY5PpJNuCZq@vger.kernel.org
X-Gm-Message-State: AFq9FYKWGPaR5JsNpg0Uo4TKZHv6IBpSveHnsvFvfFbvRoe9367EoZiA
	obY4s/QCXQyv7iSp1dRfQYsOrRz/TQnzR6zP07iGnOmktQn6iIXyO4J+
X-Gm-Gg: AYBFou3ypmDQY0EekXjqRYlvzQEuD4LkzLlRZC/7/V/lrmV/ISJNdRPlNcc7xOpV7Hq
	Oc4G5WwRx2GexFCFERrwp6TlVAYa56TrZdSZQvKg4D5iwLCssLm1nXnt+D9uK2owq+MTgYg2FvT
	4OuQJx3z8UF27jLz97gIXta78mgf4TJedo0jscuU169mlg6ynVep0tW/dZpxzYXyecZpJhrKlQy
	0nu1WNQrSt1sZFc00Uoj+PUotjq6IAsvRa0mTad2+GaSa4bb/GsB4b1OQndl6UIJgfd1pnrp//O
	dWnIM+s2pbLghXm1A3S01gSq0zSBk6EbkM2au3UKl4ZNxzd/xdO2pRtf8vLWE1DwK2n/F8Kh1N4
	8PPEgndJ6uX1hTP6nxPy+IyrxWleUxa1SauAQ5Q0bR6X1X94jB/BGwJbQaFjL/nHR+2GVP+faDK
	zpsVxOvV1on0jLFGe8hn31f193Db9Rur5bxtK0w+G0fRy3heF+6vXiBcjOLkP+6qiBGQuOQPkJj
	K86jSI=
X-Received: by 2002:a05:6a00:1f06:b0:881:d48e:7138 with SMTP id d2e1a72fcca58-897c43df755mr329124b3a.4.1791510435663;
        Thu, 08 Oct 2026 18:47:15 -0700 (PDT)
Received: from arch.localdomain ([161.33.202.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6bf8sm260611b3a.34.2026.10.08.18.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:47:15 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: jerrysteve1101@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add dma-names to RK356x UART nodes
Date: Fri,  9 Oct 2026 09:47:08 +0800
Message-ID: <20261009014709.362001-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008153620.238580-1-jerrysteve1101@gmail.com>
References: <20261008153620.238580-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> The RK356x UART nodes define a dmas property but omit the matching
> dma-names property, so the 8250 driver fails to request a DMA channel
> and falls back to PIO, logging:
> 
>   of_dma_request_slave_channel: dma-names property of node
>   '/serial@fe650000' missing or empty
> 
> Add the missing dma-names = "tx", "rx" to uart0 through uart9,
> matching other Rockchip SoCs such as the RK3308.
> 

I realize that Fixes: tags should have been added for the dtsi-related fixes. 
Apologies for the omission — I will include them in a v2.

> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> index a5832895bd39..098493c04ecc 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -443,6 +443,7 @@ uart0: serial@fdd50000 {
>  		clocks = <&pmucru SCLK_UART0>, <&pmucru PCLK_UART0>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 0>, <&dmac0 1>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> @@ -1449,6 +1450,7 @@ uart1: serial@fe650000 {
>  		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 2>, <&dmac0 3>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart1m0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> @@ -1463,6 +1465,7 @@ uart2: serial@fe660000 {
>  		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 4>, <&dmac0 5>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart2m0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> @@ -1477,6 +1480,7 @@ uart3: serial@fe670000 {
>  		clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 6>, <&dmac0 7>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart3m0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> @@ -1491,6 +1495,7 @@ uart4: serial@fe680000 {
>  		clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 8>, <&dmac0 9>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart4m0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> @@ -1505,6 +1510,7 @@ uart5: serial@fe690000 {
>  		clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 10>, <&dmac0 11>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart5m0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> @@ -1519,6 +1525,7 @@ uart6: serial@fe6a0000 {
>  		clocks = <&cru SCLK_UART6>, <&cru PCLK_UART6>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 12>, <&dmac0 13>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart6m0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> @@ -1533,6 +1540,7 @@ uart7: serial@fe6b0000 {
>  		clocks = <&cru SCLK_UART7>, <&cru PCLK_UART7>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 14>, <&dmac0 15>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart7m0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> @@ -1547,6 +1555,7 @@ uart8: serial@fe6c0000 {
>  		clocks = <&cru SCLK_UART8>, <&cru PCLK_UART8>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 16>, <&dmac0 17>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart8m0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> @@ -1561,6 +1570,7 @@ uart9: serial@fe6d0000 {
>  		clocks = <&cru SCLK_UART9>, <&cru PCLK_UART9>;
>  		clock-names = "baudclk", "apb_pclk";
>  		dmas = <&dmac0 18>, <&dmac0 19>;
> +		dma-names = "tx", "rx";
>  		pinctrl-0 = <&uart9m0_xfer>;
>  		pinctrl-names = "default";
>  		reg-io-width = <4>;
> -- 
> 2.56.0

