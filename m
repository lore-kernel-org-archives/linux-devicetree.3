Received: from mail-m49229.qiye.163.com (mail-m49229.qiye.163.com [45.254.49.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2338D2D6E58
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032587; cv=none; b=llBbGb3N21xtFAuFvRfxxISBkVZ6C7MUBVuQ2NOtiXrWRAwc/Gih3di0CqnUjkkaQTsZxpMyX33Mw30jlwAv5spaNnJ4EcRr6ldH0w9uuT+M1wtIXVstvK7L6u7qhRFvbuoetjisRdVZ+M6UHOa250/brxxAWHCeNu2yQG4Dmn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032587; c=relaxed/simple;
	bh=m37k+lh5NwSWoeBBcaphhvGQ0pBg+5VhdFUJXKFxpO8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KbtIZRnc4wpygD3s66Jz+N1EeYVQI1FegzfTHs6ck9e/aieYCR9Ou7/ZvWnHdmw9005/36qD/s1tEakm3TbMsaVDz85+4Gt5NXY1oDHF7c9X6EFiRc+yZ4gno+QCgs2/Vyqi+cfbI4RHI82FtkkR9sLdfqQAHhViHsA2xk4s+Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=PABh/Z8N; arc=none smtp.client-ip=45.254.49.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="PABh/Z8N"
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 51193076c;
	Thu, 15 Oct 2026 10:34:17 +0800 (GMT+08:00)
Message-ID: <9ceed0bd-8804-4804-bbce-bb7eb7963fc2@rock-chips.com>
Date: Thu, 15 Oct 2026 10:34:17 +0800
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
Subject: Re: [PATCH 9/9] arm64: dts: rockchip: rk3588s-nanopi-m6: rename pcie2
 power rail
To: joachim.eastwood@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
 <20261014-nanopi-m6-improvements-v1-9-e713f71eb4d3@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-9-e713f71eb4d3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa13d690def03a4kunm6ed793153a31a9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHx4eVhpNTEwYGR5IGR5DS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PABh/Z8NoX637jTmXGRO/Fgdh9rKIMLPAoJmGbAtAa9fPS0KUWrqDgnmnQSKZbIYZQr0qajDAkUQcNTnCPl2wcf/yxzef7/0DwW0NUXH1m9kFjvQHo4FSoue9vC3expHqTH0JAG9SswjNTXg+YG8ftw6f6MWnWxWbvr0X7z+ZUo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=1YqASTwYL9cHxC7rY2PdHzRjS6kBVzdXj54JZkAOZIw=;
	h=date:mime-version:subject:message-id:from;



在 2026/10/15 星期四 0:33, Joachim Eastwood via B4 Relay 写道:
> From: Joachim Eastwood <joachim.eastwood@gmail.com>
> 
> vcc3v3_pcie matches the signal name in the schematics, which simplifies
> cross-referencing.
> 

Reviewed-by: Shawn Lin <Shawn.lin@rock-chips.com>


> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
>   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
> index ca115d8e108a..dd61c61fe7d7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
> @@ -36,13 +36,13 @@ user_led: led-1 {
>   		};
>   	};
>   
> -	vcc_3v3_pcie: regulator-vcc-3v3-pcie {
> +	vcc3v3_pcie: regulator-vcc3v3-pcie {
>   		compatible = "regulator-fixed";
>   		enable-active-high;
>   		gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&pcie20x1_2_con_pwren>;
> -		regulator-name = "vcc_3v3_pcie";
> +		regulator-name = "vcc3v3_pcie";
>   		regulator-min-microvolt = <3300000>;
>   		regulator-max-microvolt = <3300000>;
>   		vin-supply = <&vcc5v0_sys>;
> @@ -95,7 +95,7 @@ &pcie2x1l1 { /* M.2 E-key 2230 */
>   
>   &pcie2x1l2 { /* M.2 M-key 2280 */
>   	pinctrl-0 = <&pcie20x1_2_perstn_m0>, <&pcie20x1m0_clkreqn>, <&pcie20x1m0_waken>;
> -	vpcie3v3-supply = <&vcc_3v3_pcie>;
> +	vpcie3v3-supply = <&vcc3v3_pcie>;
>   };
>   
>   &pinctrl {
> 

