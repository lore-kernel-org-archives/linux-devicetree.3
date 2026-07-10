Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6703CD8C9;
	Fri, 10 Jul 2026 21:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783720782; cv=none; b=oMIwD4jTpg82jTQX6jmPhhhuS/yZW5DteI8Tw+EyBRMBK0mXG7x66C1fmaZSCU4WrMs+hYjxi0a9/DTAik1X4RzIwN9Cuneq6IEE+E2CrppFEZNWNSE5EnZqs/hYcVgkWvW2Is6bR+xe+7JdWwU8WfWIZtBdIAxHoysalKuo/Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783720782; c=relaxed/simple;
	bh=6ujVF5te4dCh1T4C+32iOUf/i/tceGag1rb3IxcopC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4K6QBpvZKFrCjgUmMN1gH8KVeaQEFPb7xYM76dpDNcD3cTRW60clpFzJS8Me4XVyuYGRQzUJT2daR4r8mJfIE11vmT8kKMkVCWYiXcJY54frxHmNMtxvhLhQcgugnSIAkG4RivkwT2k0LeI+0KNkRehCGm3oqFqjhhKxt9bsbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHyLjZuX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHyLjZuX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155F61F000E9;
	Fri, 10 Jul 2026 21:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783720781;
	bh=M5cI+rouNpvS1ba2pRKwEZ+ui+wpl9yHzfFSTu9Pa7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BHyLjZuXOZqkwMBBdp5YFp9sMKVU7KZsn4VVIeZw1Scj2P5UIBAnF4nTMVAazqPWb
	 Kpme0uM+Bt6LubHBvykt4TvyhuvrrJzm8TseUXEKUZpjqXXf11ET8h/rArDIxjiyeM
	 T/d7d6a2pGD0mfmPd2wBp2C40MTaIxHvp97HaLV0ttKBrNlzp5l06WJkSx/Ji7hkuD
	 hqPiw7AaXl3i9aJSZp+N9ki52oJftxlqyoCZOQLdlp4Hhj393X0IbjiaR/S7NIbrRk
	 dBrU/5bYNngT+wq9GJclXn8YyCRFQhA6qdkOU2u8AOtu+ChvUzgSrscLiPvOGWsOTf
	 HcR/Zu0jBxm0A==
Date: Fri, 10 Jul 2026 16:59:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, chunkuang.hu@kernel.org, kernel@collabora.com,
	dri-devel@lists.freedesktop.org, mripard@kernel.org,
	p.zabel@pengutronix.de, justin.yeh@mediatek.com,
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	jitao.shi@mediatek.com, maarten.lankhorst@linux.intel.com,
	jason-jh.lin@mediatek.com, simona@ffwll.ch, matthias.bgg@gmail.com,
	airlied@gmail.com, linux-mediatek@lists.infradead.org,
	tzimmermann@suse.de
Subject: Re: [PATCH 01/10] dt-bindings: display: mediatek: dsc: Add MT8196
 compatible
Message-ID: <178372078005.1413006.12439017339220224450.robh@kernel.org>
References: <20260701121950.19454-1-angelogioacchino.delregno@collabora.com>
 <20260701121950.19454-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701121950.19454-2-angelogioacchino.delregno@collabora.com>


On Wed, 01 Jul 2026 14:19:41 +0200, AngeloGioacchino Del Regno wrote:
> Add compatible for the Display Stream Compression (DSC) IP found
> in the display controller of the MT8196 SoC.
> 
> This IP is compatible with the one found in MT8195.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsc.yaml    | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

