Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.126.93.94
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143224;
	b=ES/3bkWTVfrB/EV1cKJaNILVFuOW8qV6tfhlaUR2VPcnlHfw1xtIK9bRyGfxMCIBE4g7
	 adbrxjnalF06okoQr09/55oEH/FySCsJDf6JWD52tZyHm9B5vJw7kUmAj+s4ww2mgC/Cl
	 WtBFXL2IiywG93klC7X7eMPPGtg3FjaZI3o9dBaexA9h3Nyq0jah6ozjrROR3Xm8iPfNR
	 jxH8Hd6Tabz8n9Qbk+C0+JBgrys+BzfftthP7LXPdlsLkhOCJpTYDNT8DYJIShTh6dLRP
	 4RWs0jCQsFWTNGl+MwD5ZQVaeGi9VZrNYAhlwb/UgHPIyKyXKF8ubjAo7lRz637haNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143224;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=aCvUb7UtGNSzVb6BdtJGVlutl707NOIlxUqbdWEblTo=;
	b=pPEcXJSWEFrxsxMMGyZUl/GG5CKg39KoDBGcVE1sLyq7H9HQX9TkTqx+qK4cIkfaJ/uE
	 fscP1FLmjLA5F5yBKb/R+gk25TUsDbJZu3pBVeXgZzWDSe9FLMoZMqiFZZBHVn3nh5RWk
	 a3pzlXqot+4HDNxCQrFoMfN0zmGFmoKukzYsGdu5kl3vDGGm0OFV6L/Klj/LYQxuhaTDs
	 C6R7/99lgZpoelrQLBqScO9N5/szUBSGmrCXAzAE1Rv0MgPTHRGzZLzs7/Sv7crHlyiNy
	 5e2MhRJfSfQ0pj8jMtS3bYTjGWYWcxANZbE28Hk8nv2p9QbeyugJTClJJlL6tL4bR0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=F5Z5xuru;
	arc=none smtp.remote-ip=103.126.93.94
Received: from mail-m9394.xmail.ntesmail.com (mail-m9394.xmail.ntesmail.com [103.126.93.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F5F606A325;
	Fri, 20 Nov 2026 02:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F5F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=F5Z5xuru
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 555b66815;
	Fri, 20 Nov 2026 10:53:31 +0800 (GMT+08:00)
Message-ID: <f3746e7d-2c56-4e95-bed5-b2e993cf35e0@rock-chips.com>
Date: Fri, 20 Nov 2026 10:53:29 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] ARM: dts: rockchip: Add Luckfox Lyra boards
To: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Ye Zhang <ye.zhang@rock-chips.com>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261119152055.556266-1-jonas@kwiboo.se>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261119152055.556266-1-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1f6df9b2803a7kunm6104eb818583c9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCShoZVk1NTEkaHk1OSU1CHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=F5Z5xuruCazoaM4nZqRIoo2ASiIy5//s09rRWUsZaEavrYVosw7/BMchHNSKrMaz2x5f7Fi27GZd7g+aUCbhPiT8mXx095UWd3Yk8A1ZTVmBbxH3af2WdjEcpkyLOu36NS4ESVhil2j7PpGZyueV+6bGlbLDCMX+FcdTsbnLWl8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=aCvUb7UtGNSzVb6BdtJGVlutl707NOIlxUqbdWEblTo=;
	h=date:mime-version:subject:message-id:from;

Hi Jonas, 

On 11/19/2026 11:20 PM, Jonas Karlman wrote:
> This series adds initial devicetree for Rockchip RK3506 SoC and initial
> support for Luckfox Lyra board family [1].
> 
> The Luckfox Lyra board family use different RK3506 SoC variants, i.e. Lyra
> and Lyra Plus both use RK3506G2 and Lyra Ultra and Lyra Zero W both use the
> RK3506B varaiant.
> 
> All board compatibles use rockchip,rk3506 in this revision of the series,
> maybe we should use rockchip,rk3506b for the RK3506B (and RK3506J) variants?
> 
> The pinctrl driver for RK3506 will not work as-is using the SoC DT from this
> series. The already merged driver depends on a rockchip,ioc1 phandle prop
> that never was described in dt-bindings. The SoC DT in this series instead
> uses rockchip,grf in GPIO controller node to reference correct IOC for GPIO0
> and GPIO1.
> 
> The branch at [2] contains follow-up patches that e.g. fixes pinctrl driver
> and adds USB support.

Perhaps these pinctrl patches should be included before the dts patch?

Cc: Ye Zhang <ye.zhang@rock-chips.com>

> 
> Mainline U-Boot support can be tested using a branch at [3], it contains
> board support using same devicetree files extended with USB support.
> 
> [1] https://wiki.luckfox.com/Luckfox-Lyra
> [2] https://github.com/Kwiboo/linux-rockchip/commits/next-20261116-rk3506
> [3] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/commits/rk3506
> 
> Jonas Karlman (8):
>   dt-bindings: soc: rockchip: grf: Add RK3506 compatibles
>   ARM: dts: rockchip: Add support for RK3506
>   dt-bindings: arm: rockchip: Add Luckfox Lyra and Lyra Plus
>   ARM: dts: rockchip: Add Luckfox Lyra and Lyra Plus boards
>   dt-bindings: arm: rockchip: Add Luckfox Lyra Ultra
>   ARM: dts: rockchip: Add Luckfox Lyra Ultra board
>   dt-bindings: arm: rockchip: Add Luckfox Lyra Zero W
>   ARM: dts: rockchip: Add Luckfox Lyra Zero W board
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   9 +
>  .../devicetree/bindings/soc/rockchip/grf.yaml |   6 +
>  arch/arm/boot/dts/rockchip/Makefile           |   6 +-
>  .../dts/rockchip/rk3506-luckfox-lyra-plus.dts |  31 +
>  .../boot/dts/rockchip/rk3506-luckfox-lyra.dts |   9 +
>  .../dts/rockchip/rk3506-luckfox-lyra.dtsi     | 124 ++++
>  .../arm/boot/dts/rockchip/rk3506-pinctrl.dtsi | 576 ++++++++++++++++++
>  arch/arm/boot/dts/rockchip/rk3506.dtsi        | 540 ++++++++++++++++
>  .../rockchip/rk3506b-luckfox-lyra-ultra.dts   |  31 +
>  .../rockchip/rk3506b-luckfox-lyra-zero-w.dts  |  23 +
>  .../dts/rockchip/rk3506b-luckfox-lyra.dtsi    | 100 +++
>  11 files changed, 1454 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra-plus.dts
>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dts
>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi
>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506-pinctrl.dtsi
>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506.dtsi
>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-ultra.dts
>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts
>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra.dtsi
> 

-- 
Best, 
Chaoyi

