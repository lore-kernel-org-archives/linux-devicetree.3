Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E169E3BB694;
	Tue, 28 Jul 2026 06:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221116; cv=none; b=AtCteMU1H8M5105Ftjw5ELsxSQ/8xAfCqIqcldAYNdqLxqWfu1pr5PqICdvljPWquR6G/k9HD5yBp0NsJj/kwSw6Ue5UoD5OZw8dqQx1pzK/rSNCtCPviXgrs1hULZOFqq1vl5daVXpawOVgJ+6/Msmmr9Bx+6jPrAGQis8O69g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221116; c=relaxed/simple;
	bh=L0aEP8L353Jt+vlMwP/9OyTW0VipqjpMNopoGfX0hnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6rQTCNRkmkLszQawnD+MoVbVfRWUxkquRE9SpNIUV9efmhmuyeLbFffcUj/UmZSHP6u8yIcIpD1XZY8M3OvTWVp8BJEKksodJCnTcBFz/vImO7+dnj5OTeuSQ0f34ffPgkzT6sHmUZ1n4WckTWD19Cy5osomaDTPBWrByTgv2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mS3iWNsC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mS3iWNsC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13AC91F000E9;
	Tue, 28 Jul 2026 06:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785221115;
	bh=MvNmUb4ZS1d9lyY41zp5YX8a28fQAoF6vPrsy6o8k9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mS3iWNsCxRFptNaGej/d4kOdk/edC/2wt6OD25drgpgWUY5v64YiFZkp8kyoHiTw4
	 ogq9mBBNRWVpWcIXTLLt3mPbWXVYdpJSYUfPFulB3ZgB4ULvdd09prYNtTdclJRraj
	 jrxZp4IifxPshMBKheZqnHQLD6bJh3jr0dqrXR4s4OmH+wUCKLHfEfmN0Dkw1LBoyB
	 UzpbtZ/asPoQLvePIAltatTPjiLgaZKWOigY6YbUWfkJZbWXMkvpwUYxHRGNTCA0ew
	 zmnCXARDFvJtzDY9pCbNKG5arkQodN5lJo2JVO4SA9Ss2u3C9EwnZgyMyI3huuJKae
	 GwLCNaeeJXHtw==
Date: Tue, 28 Jul 2026 08:45:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: Document MT8196 MediaTek
 PCI-Express Gen4 S-PHY
Message-ID: <20260728-upbeat-invaluable-perch-bbb938@quoll>
References: <20260720152654.92216-1-angelogioacchino.delregno@collabora.com>
 <20260720152654.92216-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720152654.92216-2-angelogioacchino.delregno@collabora.com>

On Mon, Jul 20, 2026 at 05:26:53PM +0200, AngeloGioacchino Del Regno wrote:
> This adds bindings for the PCI-Express Gen4 S-PHY found in newer
> MediaTek SoCs, such as MT8196 and its variants.
> 
> In the current "revision 3", depending on the specific port, this
> S-PHY supports up to two lanes of PCI-Express Gen 4 and both EP
> and RC modes.
> It is not clear whether revisions/versions earlier than 3 have
> ever been shipped in any other MediaTek SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../phy/mediatek,mt8196-pcie-sphy.yaml        | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

