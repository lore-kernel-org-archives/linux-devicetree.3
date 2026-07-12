Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAACC318B96;
	Sun, 12 Jul 2026 14:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868319; cv=none; b=BHBGZUl7JHfVL8A76Jt+ruvim97Pc2qrcI7yboNhOfzRWdJsk+2g6vp2GF776lfa2/OR5AAjkYJlxjlUi2scLZEhqLC9WcyqipFL1Z0yJm4nyQ6z2UyIVjHj4lvbMVFz3/Nk/hGbqOrZT4JrKuJMnRdkrSUJDKqSzt7ITpBgIug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868319; c=relaxed/simple;
	bh=Qd8ZbvV3t4VS5U7ss1gzNOT7F11WgAwrxuafLAo34YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZB/4SocExS8wCWqnrgvxeSiImFbVOtuqjiANX3nXHBr7NRfk8JqCA2BhhZ7qzkEShz1K3FYHZpY38fLb/71kHZE+PPuLVmnJpULWgruAc/zFSl5J2PpZ+ojszgVyNrfiI+OWqpyS5nYKKkQwp4tmIn4LPKAaiNE++L5fZwA+Yoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuzKfWnK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuzKfWnK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670B11F000E9;
	Sun, 12 Jul 2026 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783868317;
	bh=9trnwHXFljnlbXmvCavvXySgGPUlwMTdfQV4Sx3JwFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fuzKfWnKArXWqfKU/m0sahnW9IZ3PzNKwQb745Y+T8JyjkBzq9ddSbPm1S6EdOlIW
	 +v6RS8iq8otPP7tL439h+uMO073tcFnAZUQ2+9CfqEXhllk9Gz+gDdl/+L36a3WJC+
	 obNEfalnZD6hKrWgFR9a/XXO+rkNwEFjVKqcKH7ZxG8xbq2gupA4+wXfq4g8arSwtr
	 4lQ02aFoIDcJpeQums0owh9JY1uBNoWUxOWxIAvjOnIbMWu+FkTpMXDDySVDz6ufan
	 Qgidcodq4B3gyx8t4uUERGix3gP84fHW3uSsjix+ja5y3+SG4E4WCBI6W1tCuEKj3y
	 W5zXMdBc02e0w==
Date: Sun, 12 Jul 2026 16:58:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, justin.yeh@mediatek.com, 
	jason-jh.lin@mediatek.com
Subject: Re: [PATCH 09/10] dt-bindings: display: mediatek: wdma: Add
 compatibles for more SoCs
Message-ID: <20260712-mottled-prodigious-hummingbird-a7b72e@quoll>
References: <20260701121950.19454-1-angelogioacchino.delregno@collabora.com>
 <20260701121950.19454-10-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701121950.19454-10-angelogioacchino.delregno@collabora.com>

On Wed, Jul 01, 2026 at 02:19:49PM +0200, AngeloGioacchino Del Regno wrote:
> Multiple MediaTek SoCs have the Write DMA hardware in their Display
> Controller: add the missing compatibles for Dimensity 1200 (MT6893)
> and for Kompanio 500/520/820/1200 (MT8183/MT8186/MT8192/MT8195).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml  | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

