Received: from mail-m15580.qiye.163.com (mail-m15580.qiye.163.com [101.71.155.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF353B71A0
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 20:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781555414; cv=none; b=XEuJCn4So0MNEAh5iFPSj9jb+4DzK8iM91jBYEuf5sPAkrl9FbA7ufeUsQFLfUNlZgCl/wSYXTAoafp5O56y9u7MpH0fByq0oBMcOijyx44aq6arqpOuCji42gQcHmBRJfH2QcRydGSblv0D72xZAhT71EiomNfIb4IE0z9eeVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781555414; c=relaxed/simple;
	bh=dBfWj4G6P+0tfbU5hkEWUNc+JFLZW3OySyvS9WujEKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X9oKZ65i/0ylL4WNqAoKywDznsaEaYQ3PpvhsmJeCywmSrZAW+2wf+1COotkU4jDFeBMroKKQ2Ln+SkDd0AuapyfV70EjfenJS3TFQGGrsXE3FyMzL7uulFuv5Lo5z2QcfrjVqpRhNiAH4xeyum6cUoetwb9PHKbikPxXdjdhig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=AjT6pfqX; arc=none smtp.client-ip=101.71.155.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="AjT6pfqX"
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 427046ead;
	Mon, 15 Jun 2026 20:33:03 +0800 (GMT+08:00)
Message-ID: <cd1f968a-2e1b-434f-a331-a60cd8740032@rock-chips.com>
Date: Mon, 15 Jun 2026 20:33:03 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/3] Add eDP support for RK3576
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de
Cc: sebastian.reichel@collabora.com, nicolas.frattaroli@collabora.com,
 alchark@gmail.com, detlev.casanova@collabora.com,
 cristian.ciocaltea@collabora.com, michael.riesch@collabora.com,
 andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260605022305.3058853-1-damon.ding@rock-chips.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260605022305.3058853-1-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ecb4565ac03a8kunm225b4a5540a1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHhlLVhhKSktNSE9LSxlMQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=AjT6pfqXKo4dJ+Iqrf0DbrK5jj/BtJhdqusaYMYOcwjxILsmplQ94LrZgAz6X+O+XgEuR8cxlrBI+0Mgm6XPZRWMTI3niqyeojNt8SNlEaIjXzJJZIeBpzEtiHXRrqqc2x7g8KWQBaCko68no61dpRfoa2kFWJ7dGXS95m9QA5k=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=hInNVk/luH61RX3DtR9xZzGpkr2Jo/fkYMCB64seK2g=;
	h=date:mime-version:subject:message-id:from;

Hi all,

Gentle ping on this patch series.

Best regards,
Damon

On 6/5/2026 10:23 AM, Damon Ding wrote:
> Picked from:
> https://lore.kernel.org/all/20260601065100.1103873-1-damon.ding@rock-chips.com/
> 
> Patch 1-2 are to add missing clock "hclk" for RK3588 eDP nodes.
> Patch 3 is to add the RK3576 eDP node.
> 
> Damon Ding (3):
>    arm64: dts: rockchip: Add missing hclk for RK3588 eDP0
>    arm64: dts: rockchip: Add missing hclk for RK3588 eDP1
>    arm64: dts: rockchip: Add eDP node for RK3576
> 
>   arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 28 +++++++++++++++++++
>   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  4 +--
>   .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |  4 +--
>   3 files changed, 32 insertions(+), 4 deletions(-)
> 
> ---
> 
> Changes in v2:
> - Split out separate patches to add the "hclk" clock reference.
> - Split out separate patches to enable the "hclk" clock.
> - Add Reviewed-by tag.
> 
> Changes in v3:
> - Add a patch to expand descriptions for clocks of the eDP node.
> - Add Reviewed-by tag.
> 
> Changes in v4:
> - Modify commit msg.
> 
> Changes in v5:
> - Enforce the correct third clock name on a per-compatible basis.
> - Modify the commit msg simultaneously.
> - Add Acked-by tag.
> 
> Changes in v6:
> - Expand more detail commit msg about using hclk instead of grf clock.
> 
> Changes in v7:
> - List all valid clock names at the top level, and constrain the clock
>    count for each platform with minItems/maxItems in allOf.
> 
> Changes in v8:
> - Fix indentation to 10 for enum in clock-names property.
> 
> Changes in v9:
> - Restore the explicit clock-names for RK3399 and RK3588 eDP dt-bindings.
> 
> Changes in v10:
> - Use automatic cleanup to fix OF node reference leak reported by
>    Sashiko.
> 
> Changes in v11:
> - Pick and rebase DT related patches.
> 

