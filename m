Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083DE478E42;
	Thu,  2 Jul 2026 09:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984134; cv=none; b=BcHF0+7QDW+p1DMl0rrikvcG+6JayHPnvPDuGxUeGXiYEyKz//C2xr9uTwhNnke9c51eLTAOS6pFv28QZFJ/2wsAQqMhBOyTPVX1NDjIAlQCO5YPlA1gHmq6Sf6E9CD3aYZkm4OQvnsFrq3POgMmH2n2gT2rrWfoaWsh+m/PKh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984134; c=relaxed/simple;
	bh=XGlT1jN6iisVzEuux46Z6HtG1CBC/tpAdAu/EfHF0jg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mVOe/wG2eg4+9T+sg8yFiJi4V4/gEixMou+N8aQEfaUGPDU7yuBSNhX2li5VA2fnayXEeyIJlVPjZUJIqQxBGSwXUlvM8i3XyDpVXGLlxCRr8cW1XfVFU4ZFpUT/UzjbMl8o6IzgNc79F7/vGYPbBHItO6jgL0VvoTMXi5kvP7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DaKKuw85; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DaKKuw85"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782984131;
	bh=XGlT1jN6iisVzEuux46Z6HtG1CBC/tpAdAu/EfHF0jg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DaKKuw85Hjs+C8RjHJwl5F5HAy/yXdJ1/go76l64bs7S+VaDQKNEtfAJO/09CC+rU
	 RjMy9V4PezUoYVmHtwA+Ej4cq6c3OIZy3yQ/jcwBf7CiB8LpshGQz14VGV8cvxlLNz
	 dm1Det0iNUKtZzDduzUkA4GI5/8+uNpQMdikwRlE9vYZ6ENXRMRNk7O8WCknnGY33w
	 /ZxSBHKVw3clKA4yzckeyaNzBXzhHxoPUGtuxMB6xh5gCG/KW+aPUCqwSw54Yo1CQu
	 3JkQkChne59Zo+qmyFe86/Bpy7NN/fWmYb3asa9dFVWYjxND1a8pX7v037FMc4OkWU
	 9lbQ8btTf+Q4Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDC9B17E0CF4;
	Thu,  2 Jul 2026 11:22:10 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Tseng <chun-jen.tseng@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20260529100514.52082-2-chun-jen.tseng@mediatek.com>
References: <20260529100514.52082-2-chun-jen.tseng@mediatek.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: mediatek: mt8186: change CCI OPP
 scaling mapping
Message-Id: <178298413090.12161.3103328089271135521.b4-ty@b4>
Date: Thu, 02 Jul 2026 11:22:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 29 May 2026 18:05:08 +0800, Mark Tseng wrote:
> The original CCI OPP table minimum frequency 500Mhz is too low to cause
> system stall, So it need update to new version, 1.4G ~ 0.8G.

Applied to v7.2-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8186: change CCI OPP scaling mapping
      commit: c41cd028e8fb138aa6243d224d637db15354ea95

Cheers,
Angelo


