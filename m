Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508669;
	b=ScJ9YE4x6GtI2Tsg6DA0ntpS37LpmGhbfIPrvSCZ1fHege3XxCFxqDFja5L6TDXcdG5h
	 XkQCmmDwV1A/Ljt5/TbNp/xiLBhB5c+1U41SdYU8wD2WD1iMzw15yMpm2lnZX2ioXrKse
	 rpxZ2/DepNyipja/JP4e8q4nf0ODkkwC6lQdT1IQbd0WZeaVQb+i23DTXPVySzB0Wwqac
	 7L/oiVDE/Jd2YaNcKk3krHTrHtlTrx/ZxmVVgdnid95n3TEFhpcCHUodmwqXCQP7blx7e
	 Erijct+uZ9h+1g1qMVzQvMSK9+zgZ1Ht/iDzaFE+DXabv0UGFjHh7sLpuDA+WNexJDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508669;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=CIIxCHmaf4fxrIyFS/BRlR2dhrRZVanUxs4tziQTo54=;
	b=FNmHfojS1BgPxw6cpTNvqTY8pTAKVRz7h5//0e4xkct0gWf1vffFNqJXBfWRbLy7nlZk
	 vNkLyjAIbwuKReXyZCImr8Rdt88LYJjbBuZ3yImHHitPoTKk9q2nrSNmoDHElYLAKIYRS
	 5iBFfwtxezOFOoimddyh9j8BFifVYT7JDcQ/0hx5zRAuJlpFYhpBnGFBWtAaYReDdrR3L
	 M87OJiVuYy9KJuLcI0qU9ZDBgM7zF6++B37d8pJheB/ChRZfQQhjH8oBhvNg33NqsI52C
	 E77hIDiF34eQk7AjehnhUStgM+OHOF0YI204F68ZG7WrLcNiboJ8NpiyuhUc0jMqcCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=UURWRjVw;
	arc=none smtp.remote-ip=103.209.128.202
Received: from mail-m128202.netease.com (mail-m128202.netease.com [103.209.128.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4780606A31E;
	Tue, 24 Nov 2026 08:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4780606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=UURWRjVw
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55cb96efc;
	Tue, 24 Nov 2026 16:24:16 +0800 (GMT+08:00)
Message-ID: <c89271be-85f9-41ba-9c19-c78743d212c8@rock-chips.com>
Date: Tue, 24 Nov 2026 16:24:12 +0800
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
Subject: Re: [PATCH v3 0/2] drm/bridge: add glue driver for T-Head TH1520 DW
 MIPI DSI
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Andy Yan
 <andyshrk@163.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, Icneowy Zheng <uwu@icenowy.me>,
 Han Gao <gaohan@iscas.ac.cn>
References: <20261124-th1520-dw-mipi-dsi-v3-0-ffcf2d87971b@iscas.ac.cn>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261124-th1520-dw-mipi-dsi-v3-0-ffcf2d87971b@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa20ca7d7d303a7kunmc11de194cd4c3b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSkpOVkgdHx1PSkseQkpJTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=UURWRjVwdo+3l2AULyocD6fSNflb4NLvemODSt3E0BkJ4SDNYTRbIrvF97HUU4K2rtd/SDBnXtHZ+9biRxmmr2VYZUHyx1vjJo4sQNiVBRKlCiF1JgNn+It/uQ2dEKWkUHaT+/LN1vLB/a+9UefWRH0gS3pOe07esi2EjWKgg4A=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=CIIxCHmaf4fxrIyFS/BRlR2dhrRZVanUxs4tziQTo54=;
	h=date:mime-version:subject:message-id:from;

Hi Icenowy,

On 11/24/2026 3:56 PM, Icenowy Zheng wrote:
> T-Head TH1520 contains a DesignWare MIPI DSI host controller paired with
> an internal DesignWare PHY, as a similar design (but with a different
> PHY) with the Rockchip DW MIPI DSI.
> 
> The functionality to write to the PHY is shared between these two
> implementations of DW MIPI DSI, so it's extracted from the Rockchip
> driver to the common code. (The same sequence could be seen in the
> HiSilicon Kirin DRM driver, but that one hasn't been converted to common
> DW MIPI DSI.)
> 
> Tested on a Lichee Console 4A (with a Mingjun MJ070BI30IA2 panel) with
> further pending DT patches.
> 
> One question remains: I have to copy the extra lane bandwidth headroom
> from the Rockchip driver, otherwise the Mingjun panel cannot keep sync
> to the display signal; from my testing, changing the hardcoded
> PHY_STOP_WAIT_TIME from 0x20 to 0x2 (which is written by the vendor
> driver) can also make this panel to work w/o the extra headroom. I want
> some advice on whether to keep the extra headroom or changing the common
> code to make the PHY_STOP_WAIT_TIME parameter adjustable.
> 

Does the DesignWare PHY databook describe about PHY_STOP_WAIT_TIME?
  
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> Changes in v3:
> - Fixed a remaining `syscon` in the DT binding.
> - Link to v2: https://patch.msgid.link/20261119-th1520-dw-mipi-dsi-v2-0-9ab5f9808f87@iscas.ac.cn
> 
> Changes in v2:
> - Changed `syscon` to `thead,vo-syscon` in the DT binding.
> - Dropped the patch moving common PHY write routine to dw-mipi-dsi
>   common code.
> - Fixed a few problems pointed out by Sashiko in v1.
> - Link to v1: https://patch.msgid.link/20261030-th1520-dw-mipi-dsi-v1-0-753f34fd304f@iscas.ac.cn
> 
> ---
> Icenowy Zheng (2):
>       dt-bindings: display: bridge: document TH1520 MIPI DSI controller
>       drm/bridge: add TH1520 DesignWare MIPI DSI host controller
> 
>  .../display/bridge/thead,th1520-dw-mipi-dsi.yaml   | 103 ++++
>  drivers/gpu/drm/bridge/Kconfig                     |  12 +
>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>  drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c        | 570 +++++++++++++++++++++
>  4 files changed, 686 insertions(+)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261030-th1520-dw-mipi-dsi-580d5b2792f9
> 
> Best regards,
> --  
> Icenowy Zheng <zhengxingda@iscas.ac.cn>

-- 
Best, 
Chaoyi
