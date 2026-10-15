Received: from mail-m15590.qiye.163.com (mail-m15590.qiye.163.com [101.71.155.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D99C1E9919
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031878; cv=none; b=uhNJtpY1HCV6ho0r4Ll/JvB9VXv8Yp4ByZ7qYcQDh0+lp5NItYAPs0XD6CBpipZEbcEr6qwGNlBZs/e3yEYUYoCwkuLr8NXq0BhI2eEp9wFsget2llZbxGJ1u9b/ASXpW1izF/ZQpAdI9eMjTEJesHBSczC/6urPSptS5z0pi7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031878; c=relaxed/simple;
	bh=sXR6BXH/FDXlVoNyHZM1WZ+VdtsykbzcWjyxXoQP+G0=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kxLEyhsv4CHr8XiSYqke5plYfPNtadJvWjXLqISYc2CVk5TxKextAw5lJM//JlVjmfjd8uIHOVnBWkRpXGJL4UY2/IYKNkNewELbdEOHs3B1366hceSR2xhXykrLc8o275R0eXt2npSSGhGHBczlvGNITioT5rq9TpbVCu49W2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Kc+EvEOd; arc=none smtp.client-ip=101.71.155.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Kc+EvEOd"
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5119304ec;
	Thu, 15 Oct 2026 10:32:35 +0800 (GMT+08:00)
Message-ID: <d18f064d-ea3f-45f5-bc86-9318b01f2c92@rock-chips.com>
Date: Thu, 15 Oct 2026 10:32:35 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Diederik de Haas <diederik@cknow-tech.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 5/9] arm64: dts: rockchip: rk3588s-nanopi: rename sd power
 pin
To: joachim.eastwood@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
 <20261014-nanopi-m6-improvements-v1-5-e713f71eb4d3@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-5-e713f71eb4d3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa13d67807003a4kunme8fbb20b3a2d11
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSkMfVhlLQ0IdSkNLS0xKQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Kc+EvEOdkG3sp/Iyjk30XHZnUqUXMQ2l8FGE01zFv08pi04kby72Zsf9lhf0w5gQc5lL6ESz7unzSqAsfC+rYC2Aho9VQF6+p5zgKR6zpz5kiwm1gNVUR3dSolVnQ/exu7p/y1rTSm+flZ21jxPA98QG/SwnOyJd+HCBM+zhU1w=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=4Q9/yr+TPrZ6trPCN3xo/GTUlhJ2HoDaO0szPFT8tS0=;
	h=date:mime-version:subject:message-id:from;

在 2026/10/15 星期四 0:33, Joachim Eastwood via B4 Relay 写道:
> From: Joachim Eastwood <joachim.eastwood@gmail.com>
> 
> sdmmc_pwren matches the signal name in the schematics, which simplifies
> cross-referencing.
> 

Reviewed-by: Shawn Lin <Shawn.lin@rock-chips.com>

> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
>   arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> index a99e2e60c5f7..1d37862edb5b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> @@ -66,7 +66,7 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
>   		enable-active-high;
>   		gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
> -		pinctrl-0 = <&sd_s0_pwr>;
> +		pinctrl-0 = <&sdmmc_pwren>;
>   		regulator-name = "vcc_3v3_sd_s0";
>   		regulator-boot-on;
>   		regulator-max-microvolt = <3300000>;
> @@ -334,7 +334,7 @@ sdmmc_det_pin: sdmmc-det-pin {
>   			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
>   		};
>   
> -		sd_s0_pwr: sd-s0-pwr {
> +		sdmmc_pwren: sdmmc-pwren {
>   			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
>   		};
>   	};
> 

