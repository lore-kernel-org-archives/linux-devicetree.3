Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=154.81.10.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143775;
	b=zCU+ALUGpu2DHB8F1YZFDJD5RLuhlrlk1iObx1PfwekGCzoyZn4lmCxUQ6DtTqAjNBIp
	 EWWnDDom1Q2cCtHyLYEBzw6o0QN92i0ZzXHIeN8Z9Nd6UwEPF/d0cBJ/PWh5IdAO/5qTv
	 AI4pKp7Gc6oqAKqH80FPcYL85/uXua7/EWCAdwgtemHdM0RZyed8QKCte+YN/YlZh13Mn
	 pXfkQCejrVAmL++plSwwVeY3hPY9PA9P3tS0a4+eBbC/POz4zvUi9r16w2ZLpwkWNK/CN
	 ce40yOUMoYa1/oDIGORe94sLydegm659D7T7bS9796cW1Ek02SrP3r94IHmr5A74DyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143775;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=wC0wUU2m3HtIPmY9jvAO8PsD5hDAxn7Ex23eU3jgxZQ=;
	b=kkDQG2MfSqMlj0jOyfBIrzEfbrUDKBMkyZ6yZIgMljav4/XJ1yYB5rNsLRc29l9Sx0DJ
	 XqdcKRjaBTKGMTckYXU6en7Zv92eZOJNaWU6k6DqmZndSHlCWHGRvevv1vLRlEp6cxch1
	 gvHzx8WfVrSUCQ2Zb6MjNaErOon8cRp4VE6JPxt9z000X1Q6E9aAFRruIWuC9S1/A2pS9
	 0BDNjD9AfVgLDTDD2iWmjwoZcfkmU3FboyMgraijXS4kdxE1u4i2xeEV50RhpPfxfA7DE
	 R2eixJGxG4rS6pVJ9UxqZbolB3xH8vARx+RdKvevi47woSCg+450YxGpMYsvBhffmlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=BlAtMAnU;
	arc=none smtp.remote-ip=154.81.10.38
Received: from mail-m1038.netease.com (mail-m1038.netease.com [154.81.10.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E044606A320;
	Fri, 20 Nov 2026 03:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E044606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=BlAtMAnU
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 555bbefdb;
	Fri, 20 Nov 2026 11:02:42 +0800 (GMT+08:00)
Message-ID: <bc2695a5-5b20-4658-a95c-e67731086e9a@rock-chips.com>
Date: Fri, 20 Nov 2026 11:02:40 +0800
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
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
To: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Ye Zhang <ye.zhang@rock-chips.com>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261119152055.556266-1-jonas@kwiboo.se>
 <f3746e7d-2c56-4e95-bed5-b2e993cf35e0@rock-chips.com>
Content-Language: en-US
In-Reply-To: <f3746e7d-2c56-4e95-bed5-b2e993cf35e0@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1f6e8035203a7kunm3c3a335e85aa24
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQk0fVh9MGkJLQkhLSkMeTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=BlAtMAnUjFxtbegHN4OgFdA/VS6Ly1e3JiRAZwktlvpMQ0vYr762qEMzVP36mIGArANDSPdD+JU8tdEaVdacuzo2MOq446jfShqKXpX3hKh+0mqCYQxaJzwbYLkAySUcMV1krAuUWBd/SqNgMhd7hKrwRs/+3YmcNDWdBc9WMMk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=wC0wUU2m3HtIPmY9jvAO8PsD5hDAxn7Ex23eU3jgxZQ=;
	h=date:mime-version:subject:message-id:from;

On 11/20/2026 10:53 AM, Chaoyi Chen wrote:
> Hi Jonas, 
> 
> On 11/19/2026 11:20 PM, Jonas Karlman wrote:
>> This series adds initial devicetree for Rockchip RK3506 SoC and initial
>> support for Luckfox Lyra board family [1].
>>
>> The Luckfox Lyra board family use different RK3506 SoC variants, i.e. Lyra
>> and Lyra Plus both use RK3506G2 and Lyra Ultra and Lyra Zero W both use the
>> RK3506B varaiant.
>>
>> All board compatibles use rockchip,rk3506 in this revision of the series,
>> maybe we should use rockchip,rk3506b for the RK3506B (and RK3506J) variants?
>>
>> The pinctrl driver for RK3506 will not work as-is using the SoC DT from this
>> series. The already merged driver depends on a rockchip,ioc1 phandle prop
>> that never was described in dt-bindings. The SoC DT in this series instead
>> uses rockchip,grf in GPIO controller node to reference correct IOC for GPIO0
>> and GPIO1.
>>
>> The branch at [2] contains follow-up patches that e.g. fixes pinctrl driver
>> and adds USB support.
> 
> Perhaps these pinctrl patches should be included before the dts patch?
> 
> Cc: Ye Zhang <ye.zhang@rock-chips.com>

Oh, I just saw your pinctrl patches. Sorry for the noise.

> 
>>
>> Mainline U-Boot support can be tested using a branch at [3], it contains
>> board support using same devicetree files extended with USB support.
>>
>> [1] https://wiki.luckfox.com/Luckfox-Lyra
>> [2] https://github.com/Kwiboo/linux-rockchip/commits/next-20261116-rk3506
>> [3] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/commits/rk3506
>>
>> Jonas Karlman (8):
>>   dt-bindings: soc: rockchip: grf: Add RK3506 compatibles
>>   ARM: dts: rockchip: Add support for RK3506
>>   dt-bindings: arm: rockchip: Add Luckfox Lyra and Lyra Plus
>>   ARM: dts: rockchip: Add Luckfox Lyra and Lyra Plus boards
>>   dt-bindings: arm: rockchip: Add Luckfox Lyra Ultra
>>   ARM: dts: rockchip: Add Luckfox Lyra Ultra board
>>   dt-bindings: arm: rockchip: Add Luckfox Lyra Zero W
>>   ARM: dts: rockchip: Add Luckfox Lyra Zero W board
>>
>>  .../devicetree/bindings/arm/rockchip.yaml     |   9 +
>>  .../devicetree/bindings/soc/rockchip/grf.yaml |   6 +
>>  arch/arm/boot/dts/rockchip/Makefile           |   6 +-
>>  .../dts/rockchip/rk3506-luckfox-lyra-plus.dts |  31 +
>>  .../boot/dts/rockchip/rk3506-luckfox-lyra.dts |   9 +
>>  .../dts/rockchip/rk3506-luckfox-lyra.dtsi     | 124 ++++
>>  .../arm/boot/dts/rockchip/rk3506-pinctrl.dtsi | 576 ++++++++++++++++++
>>  arch/arm/boot/dts/rockchip/rk3506.dtsi        | 540 ++++++++++++++++
>>  .../rockchip/rk3506b-luckfox-lyra-ultra.dts   |  31 +
>>  .../rockchip/rk3506b-luckfox-lyra-zero-w.dts  |  23 +
>>  .../dts/rockchip/rk3506b-luckfox-lyra.dtsi    | 100 +++
>>  11 files changed, 1454 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra-plus.dts
>>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dts
>>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi
>>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506-pinctrl.dtsi
>>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506.dtsi
>>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-ultra.dts
>>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts
>>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra.dtsi
>>
> 

-- 
Best, 
Chaoyi

