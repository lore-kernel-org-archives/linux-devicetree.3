Received: from mail-m205210164250.xmail.ntesmail.com (mail-m205210164250.xmail.ntesmail.com [205.210.164.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC671FECBA
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.210.164.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031624; cv=none; b=DD7Y19o1YSlbOQ+V7NC9j+o4OsBUL4eYFH/20Wu394k6WvaR12ozKx0DI5HMx9k1m6LmTZNHFtbtzOBdsYExwv7JjwANfXp2DNbKp8mZXG8rilb8dPYOQGcXjsH6J/v5C2+jEnWmFjYvvTA+KJYC2zF510dqkAIvWWPnZiBgXrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031624; c=relaxed/simple;
	bh=TGXwmtE/oz9XIJIpQK/KwgaRb5eCxPIhriRwrXJhAZI=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pjX/oxjpatvCBRL3Rz7wFSsEPH5ua6DuXsN47E1P3K8v/gF62IFBBSK4jEEX4i8WjVcWAQTqbdMZSliji4Up+IyNepctZ3qdffYLKltQkUReOkJxrq2HYsz4SUVDES8q7PjBtFOA8rMxg1DZFNuMvMpXk3NC07PAwZfejKVXys0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=SaqgKGYD; arc=none smtp.client-ip=205.210.164.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="SaqgKGYD"
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 511930650;
	Thu, 15 Oct 2026 10:33:31 +0800 (GMT+08:00)
Message-ID: <b7cf5fc5-e833-4406-a136-21836e79301d@rock-chips.com>
Date: Thu, 15 Oct 2026 10:33:31 +0800
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
Subject: Re: [PATCH 8/9] arm64: dts: rockchip: rk3588s-nanopi-m6: rename pcie2
 power pin
To: joachim.eastwood@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
 <20261014-nanopi-m6-improvements-v1-8-e713f71eb4d3@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-8-e713f71eb4d3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa13d685b2d03a4kunm431f7c103a2f98
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTUxDVh4dTUoaGkNKGEkZQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=SaqgKGYDVN50o1hg8KF/ko+9spE20AMp7Rt6WxJh96wvnb1LYTm1SaPdxrvqDrKG4q9OjFQUR1NulSUdv2BOnVI/DMhiY37Df/DKhp8lMCbMn8MVNVw+XcEXAuHnaMeHxDAnIivE7eabEAbf7XNRSf8TG6eobEKSAhHrC0Wrys8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=nHAMUEDGItR7vD8mHcnvtF5InhaMhwN9oMDqx6Yu23Q=;
	h=date:mime-version:subject:message-id:from;

在 2026/10/15 星期四 0:33, Joachim Eastwood via B4 Relay 写道:
> From: Joachim Eastwood <joachim.eastwood@gmail.com>
> 
> pcie20x1_2_con_pwren matches the signal name in the schematics, which
> simplifies cross-referencing.
> 

Reviewed-by: Shawn Lin <Shawn.lin@rock-chips.com>

> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
>   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
> index 6205a542cd1a..ca115d8e108a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
> @@ -41,7 +41,7 @@ vcc_3v3_pcie: regulator-vcc-3v3-pcie {
>   		enable-active-high;
>   		gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
> -		pinctrl-0 = <&pcie2_2_pwren>;
> +		pinctrl-0 = <&pcie20x1_2_con_pwren>;
>   		regulator-name = "vcc_3v3_pcie";
>   		regulator-min-microvolt = <3300000>;
>   		regulator-max-microvolt = <3300000>;
> @@ -116,7 +116,7 @@ hp_det: hp-det {
>   	};
>   
>   	pcie {
> -		pcie2_2_pwren: pcie2-2-pwren {
> +		pcie20x1_2_con_pwren: pcie20x1-2-con-pwren {
>   			rockchip,pins = <3 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
>   		};
>   	};
> 

