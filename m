Received: from mail-m12783.qiye.163.com (mail-m12783.qiye.163.com [115.236.127.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE3131F99C
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032111; cv=none; b=mfowu9HCKCQPzYfeolHDaNSJYaZ0PiMzJLRafKl0jZ4vhiCLvLuXvIRcGMwx0/mUs+66JxSWFgpF15uywVNuvuh1UIHoRvrre5FgTuuMumVLzmY14EAXrtqf5tE2q7DrVnz4cVaIu4NQecR3Cg3aPfYbkTKvAe4T7wAh4G4Or0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032111; c=relaxed/simple;
	bh=K+/WTzQGtSL5ofq4GGv0btHKgrj6h41yFFRoveuDBCQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WlkfqqffTSOb6VtU2gOGk2/nInVaYKqobMcLFWrAIIFB5k9vjt3g2fFtf/eBCG2QmrCvh1WTrPXP+dXjLuzEoIl3kUob6k9k8YVXfwBhQbcjBn6u2+Itc+f0HX9TzPcgBscJzbLpTlQpankNf6hwfmCNDmgrijJ0Pu4WJ9rTtJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=bPSPIGgC; arc=none smtp.client-ip=115.236.127.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="bPSPIGgC"
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5118e404e;
	Thu, 15 Oct 2026 10:26:22 +0800 (GMT+08:00)
Message-ID: <d7db7de5-4972-4dd0-85a3-e310dcabc41e@rock-chips.com>
Date: Thu, 15 Oct 2026 10:26:22 +0800
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
Subject: Re: [PATCH 1/9] arm64: dts: rockchip: rk3588s-nanopi: fix sd min/max
 voltage
To: joachim.eastwood@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
 <20261014-nanopi-m6-improvements-v1-1-e713f71eb4d3@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-1-e713f71eb4d3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa13d61ced903a4kunma3935b973a1b6b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDT0tIVh8eQkseSBkeGENLGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=bPSPIGgCYsm60FR/2OenmMqXm/1ZYlWtn9B+4FhIG6oMbhP/OT606vuKuQTk4WTYqL6CWWtX/PtaNWp8DCLWMfhhi+H2zUO7mKKs7753r00EipVTOkj1i63gwwDGKTZwDuaKvc919fok6RGynOEEnLxXa+0ZyIk+RP8ZPi5Yp2I=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=vp2SpKAypkVSfLwmsVtgSuvUILnoRWt5eBLTi3/1asg=;
	h=date:mime-version:subject:message-id:from;

Hi Joachim,

在 2026/10/15 星期四 0:33, Joachim Eastwood via B4 Relay 写道:
> From: Joachim Eastwood <joachim.eastwood@gmail.com>
> 
> This regulator is only a simple power switch and cannot change the
> output voltage.
> 

It would be better if you could put the schematicinto the cover letter
so folks could check it easily.

https://wiki.friendlyelec.com/wiki/images/8/85/NanoPi_M6_2405_SCH.PDF

Reviewed-by: Shawn Lin <Shawn.lin@rock-chips.com>

> Fixes: c08257d642ac ("arm64: dts: rockchip: refactor rk3588s-nanopi-r6 to support M6 boards")
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
>   arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> index 22b0cdee22b4..8c36268e9876 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> @@ -79,8 +79,8 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
>   		pinctrl-0 = <&sd_s0_pwr>;
>   		regulator-name = "vcc_3v3_sd_s0";
>   		regulator-boot-on;
> -		regulator-max-microvolt = <3000000>;
> -		regulator-min-microvolt = <3000000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
>   		vin-supply = <&vcc_3v3_s3>;
>   	};
>   
> 

