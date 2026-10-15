Received: from mail-m11877.qiye.163.com (mail-m11877.qiye.163.com [115.236.118.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EF33A8FE9
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.118.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031595; cv=none; b=acYuTlxGWu6f9/tAQ40ly6ZkGiTQ1tvtixsxcKH7SbrR1ijNWXNo37kqv2zY/AgFxrrd2MBunj6Xk9CIuOsEMF7JB3c2JFCvbpnWVAze53NuRxJUh1Aml80qYxHZWSPq6F+LYbK6ZUItQ/cx9MwSxroQGZLILocu299s9toetG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031595; c=relaxed/simple;
	bh=wYg5ZG5tqe8Y76irMWUu4cmz3KaLS9lN3csMy6iblZc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=je5WAkEXuZYK3gs9IARC2swoYZBs9VY3dU+qM9GGLkpRA7NE5Mwy+Knh2KX2QtgMhq0tLsxpVgdCuKBToibpp/EcwnLs9LFkv0pnQIzlBSl9rH5OQjAeNganvBaGajDzCUBZf79aYgM8TH0PAUvU4xZJCMzaWYVP0RgrAu+5w5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=gCg1VFET; arc=none smtp.client-ip=115.236.118.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="gCg1VFET"
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 511900f41;
	Thu, 15 Oct 2026 10:27:53 +0800 (GMT+08:00)
Message-ID: <5b62d754-aedc-407f-b36b-7c4fe54908a9@rock-chips.com>
Date: Thu, 15 Oct 2026 10:27:53 +0800
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
Subject: Re: [PATCH 2/9] arm64: dts: rockchip: rk3588s-nanopi: enable
 mmc-hs400 and add supplies
To: joachim.eastwood@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
 <20261014-nanopi-m6-improvements-v1-2-e713f71eb4d3@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-2-e713f71eb4d3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa13d6333c703a4kunmb59026b23a1f60
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQxkeVkIdTRoYGENLHU9MT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=gCg1VFET44YTPOVLCAxAgb8ExIvPx7MJBBFRca7F3+ygjpZogrF0wXL3eL34B2LopI7lcrDcemdf7LHtnTuBvIqduRVud0Dcrbdqvpmi2dS5nM8CxzkSwZSEVocUPnyrr2lDGc17uRQC17SwftQKYOSNepen9jbboiWTenInAZc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=R3XsxM7Raaf9zxJmtajP5sjAF5HH4qDLmz+vLnVBR2Q=;
	h=date:mime-version:subject:message-id:from;

在 2026/10/15 星期四 0:33, Joachim Eastwood via B4 Relay 写道:
> From: Joachim Eastwood <joachim.eastwood@gmail.com>
> 
> The NanoPi 6 series all support eMMC 5.1 HS400 mode. This also matches
> the vendor device tree. Also add power supplies while at it.
> 
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>

Reviewed-by: Shawn Lin <Shawn.lin@rock-chips.com>

> ---
>   arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> index 8c36268e9876..8c77ee71ebf8 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> @@ -390,7 +390,10 @@ &sdhci {
>   	no-sdio;
>   	no-sd;
>   	non-removable;
> -	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	vmmc-supply = <&vcc_3v3_s3>;
> +	vqmmc-supply = <&vcc_1v8_s3>;
>   	status = "okay";
>   };
>   
> 

