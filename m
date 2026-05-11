Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29B9339B3D;
	Mon, 11 May 2026 09:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492967; cv=none; b=ijav1w2N+3no57yygnEXNuvh9wZPfa4qqzrRRz4zoN5TQ7yxI5H4IrkRXUua0Cm1Hlk2RrpY8ce2bEt4AdPSCDwYuxSV1JHK/xP6QiI2MlJM9JD4peUHnVBUyejifXJ7V5/mJVdMgPos9iqy9qpMk4IzFGgGhlALYWlxRNgnnVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492967; c=relaxed/simple;
	bh=BUrmAszX4f30Kd8CC1UJmd+M9ix2JkT81pIXUO3eEmU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ty6ra9KmrAOrlyiqIyR3dpQOLjxlR8PFniyVjUBTDFqJd43mogc2CO8PdAz1VeA+zUuB1nXj7LJsQU8oiq5UPiyE1ZosjlJ66gd3WLZnGUS36yzSRBCKXL0kSOf5rgWq44A3oCLPaI6EIsxiVF0Tl92JE5RZZv8WEngJNTTUsx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SKesj2Pu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SKesj2Pu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778492964;
	bh=BUrmAszX4f30Kd8CC1UJmd+M9ix2JkT81pIXUO3eEmU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SKesj2PuPZIib4SrM8agWVh5hV5mkTxdS1CGEDvpYiN7pOpjc8WE9TeJdOa8OX/7v
	 vhTpNDuEumpt03nxHTRi48elU67pKWLvlhuG+M1yY4onoQvKqSDne6EOU0siwh1Zsz
	 hjIqNqoThP7xHwY1pQ5t7ywhUvKML+g5AOdSp8lcPt2FsVLhqXxJorjC8KNWyN41wE
	 CdIvAD+O74fqL2e5WuuhYlzLTe15DGhKGomn0Eg3llxMHAx0CE9yWGh+mxgeXb1/3s
	 LgbMAhQgXjcIpWDnOcRbgjtbbNBarE7S4TR18UoP56T1N3tfuIIQcuKAQlQz7mFygt
	 AxtdYqlCdvjuA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E712A17E040C;
	Mon, 11 May 2026 11:49:23 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Gary Bisson <bisson.gary@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260310-mtkhdmi-v1-1-841e834c8abc@gmail.com>
References: <20260310-mtkhdmi-v1-1-841e834c8abc@gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-tungsten-smarc: add HDMI
 support
Message-Id: <177849296389.118420.4761248447204610595.b4-ty@collabora.com>
Date: Mon, 11 May 2026 11:49:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Tue, 10 Mar 2026 16:20:13 +0100, Gary Bisson wrote:
> Add HDMI display out support to both Tungsten510 & Tungsten700
> platforms. HDMI audio is not covered by this patch, audio (HDMI & I2S)
> will be added as a follow-up patch.
> 
> 

Applied to v7.1-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8390-tungsten-smarc: add HDMI support
      commit: a74ceec38c76901baa2fc09a1a744689b696a01a

Cheers,
Angelo


