Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF220389E18;
	Thu, 16 Apr 2026 08:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776329886; cv=none; b=tIpSqA1cfgquBHb1zdwpgxMOs7+UOY6EG1cRz1Vj5LlVmILnkPTMSwHe7n57kPKhZPazhZ6Rysdgo1uLUMhzcivb774JxNK198PZ3Fcq/jvjuw9BX5sVjiKP8p67r1qEyWbK0qbF9F71x+kv6vfKpFAKfXgxpG7v9IaLmyj14Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776329886; c=relaxed/simple;
	bh=wIVmSPEWi58JQM7nvjRlxWGWBS3n11NN6UIk/ySZXFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTpfnLwpDeE5ZTQCdQAIoygMq6DfZLWUTqVh9sIXQ0Q0rapBseCz1sQO0iR6HbG1tyDL5nHY4TYTDFv/H81hwZ9qbujRQdYfkM3pVpX5XW1sIHpSYc+qE8rsovpaIL1zBCu1ZPlnTi5h8DS7cM5HByVTI961Upvw4OL1IXNVyMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2pui/sN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2pui/sN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5761C2BCAF;
	Thu, 16 Apr 2026 08:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776329886;
	bh=wIVmSPEWi58JQM7nvjRlxWGWBS3n11NN6UIk/ySZXFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X2pui/sNYh+IOj8b2MtTogNe0yeCNU6qS1lupk0CscO+IXwOqSHNplQYjwwvcw72E
	 JBaEDta9t4o0wjgh3osrO7pM0PzANOcgyUy66x1n/t32MEjiWsxqneBk4o73GGFMQY
	 Z6HYMognzwkUavvDvBf4RGc6Jj7+XtfmwlhW0fI+dGMRPvckg6+Q+NSksxo72SZqqz
	 lWjvAwQNH+QTJEAx7DpHHHDi8QdOIKnyG+MoNmrLi7aSWcXKX3RmC5aHQfTbSAS7fB
	 WMpEo7zx0utCqlB3U6OLd/hnL9XfXswNr192UqREFWshgIhPoOYArakTsMS7ogtJgh
	 RgezysU48045Q==
Date: Thu, 16 Apr 2026 10:58:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Sirius Wang <sirius.wang@mediatek.com>, Vince-wl Liu <vince-wl.liu@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 6/6] dt-bindings: soc: mediatek: devapc: Add bindings
 for MT8196
Message-ID: <20260416-gabby-porcupine-of-snow-bc10c0@quoll>
References: <20260416031231.2932493-1-xiaoshun.xu@mediatek.com>
 <20260416031231.2932493-7-xiaoshun.xu@mediatek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260416031231.2932493-7-xiaoshun.xu@mediatek.com>

On Thu, Apr 16, 2026 at 11:12:09AM +0800, Xiaoshun Xu wrote:
> Extend the devapc device tree bindings to support the MediaTek MT8196
> SoC. This includes:
> 
> - Adding "mediatek,mt8196-devapc" to the list of compatible strings.
> 
> These changes enable proper configuration and integration of devapc on
> MT8196 platforms, ensuring accurate device matching and resource
> allocation in the device tree.

Same comments. It's really poor commit msg.

Also, subject wrong. Drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Best regards,
Krzysztof

