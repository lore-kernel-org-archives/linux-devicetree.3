Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66380445AE3;
	Tue, 14 Jul 2026 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047329; cv=none; b=LuA4GEd0kZNgl+2jZcaXa1CRLyF8QkSkvVFaSKxjK2sgDJQXCk0rgUZkPzQEFBt01y87CyJAH8FNmH6pkDf2QOQIibaTACDyw2QPQwjAc0DM5kuc2EEsXwIpFpiaaHg4jj0EUm/QlYeiniHIC4rMMvL9MVneB+dkFzYzf9+nyCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047329; c=relaxed/simple;
	bh=V8dKK8Kp4zYr4Pjk1yLu1gObmAWzhesd7BvCs8Y97r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdsZ0QwfOj3j/COpPKP4iVFUgDc/SGpojIaLOWV0ndFW3WkEY5vnwRVHa5mTu8mjdIMNt02M2SJgohbc/N63mRpNDT35D9eUYQlJ7ZVLUDSawmLSQKbKM9A5FZRNnx33GXb4pmZuQJBN/zoTb7J73AoyHsqrbIo9vGOKuFnxj4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jz+9Czek; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jz+9Czek"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1ED61F000E9;
	Tue, 14 Jul 2026 16:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784047327;
	bh=k61jezHC3k/RbNT9F3tzR3+tjmPaHQC3k1irVJlQASY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jz+9CzekUY1eftq3OxsUOGnOISpZqtktT0tAgq7mvu+rrHDWAkEdGbOVs0K8Gg3QC
	 b5aaXIH/ZMAaxTXSgPmRJqRvDW2TKxz1OXFgI66JwZPhI7E4nr+T0JEfJjGiT5P27W
	 nJImc7zIO3QScevDh3Bkkz17U2GppED6C15BmEe325W5AnfsRjWNhz8FlZoH8eFoH8
	 03LENgZV+8yKzGCIQtxrpu+0sH4uPslR8zAbEOOUAW1aDopUrBInyka1ERI8Z621Wk
	 Pi91ocPthGdpsrOaWaL12/IlkoTc6fJOtnfw8o0xojHG/3Jmuv8bCKbkudvZPuJf3U
	 DwGKZI6sr/25Q==
Date: Tue, 14 Jul 2026 22:12:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, neil.armstrong@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de, matthias.bgg@gmail.com,
	justin.yeh@mediatek.com, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 2/2] phy: mediatek: Add support for MT8196 MIPI DSI PHY
Message-ID: <alZm25Ro_WdKigPd@vaman>
References: <20260713103805.23030-1-angelogioacchino.delregno@collabora.com>
 <20260713103805.23030-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713103805.23030-3-angelogioacchino.delregno@collabora.com>

On 13-07-26, 12:38, AngeloGioacchino Del Regno wrote:
> Add support for the MIPI DSI PHY found in the MediaTek MT8196 SoC
> and its variants.
> This PHY has a different register layout and provides support for
> more hardware features compared to the previous generation.
> 
> This initial driver only adds support for basic functionality that
> is necessary to drive MIPI DSI displays as a D-PHY.
> 
> Feature additions like lane-swap, DPHY/CPHY switching, dual-port,
> and others, may be done in the future.

This seems to fail to build

https://patchwork.kernel.org/project/linux-phy/patch/20260713103805.23030-2-angelogioacchino.delregno@collabora.com/

-- 
~Vinod
