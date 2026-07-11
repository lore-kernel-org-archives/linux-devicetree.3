Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2623225B090;
	Sat, 11 Jul 2026 15:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783784481; cv=none; b=OSpsrBdki41IuUHljASH2peEDvmrpRfDSVXFN63iiXauNqt5KPV+qjtdOOYHHBk05a46qk80lO3QGWhQw3nO2xXnEGm9MAVhb2q4exK+H9m9ueh2kZ6L6M7LZodw1MXW218Sdq+q2isCaXvBcSg09XYX+CRkt+lPs9B0F2USCQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783784481; c=relaxed/simple;
	bh=+ZNTNfMCsKyNLI3wg4wgr7kWDUvrTdjDAslsze8XDE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQSMktxr99ILBilNflliXCcX7g3cuyOzZXrHLmFrTCMX/sNLdjTos7OiMn/vlNOmHZGXVmhyWUMha6C0lfAfPIFGSQp0YAB/hyRmcc1KG+pK2QEAYfQvKlfTvl6sQIwX/duIH7lbT38IkTknjMJANuXp0YzlU+XaeJXfzVnIeFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JIIKj/4Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JIIKj/4Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05CD1F000E9;
	Sat, 11 Jul 2026 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783784479;
	bh=BScecOlitLDYz10/Pf4DyteBIAZlmTyE+E+GTseRLyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JIIKj/4Z/c0vfipK5zYFpxj1IzCMO+3hbKqyDa5e+9Ge3sh08vK5zkM1n4Xx1fFB7
	 r65JP9oAi+j6RLofHTRFShoffxbzRbQpUabAhtDsOZrm+YkECMPbSP7XRYDzehA+Si
	 SsiRc7wajwOOgq4I6SpNaWZPm0U3mjabRPsrthqPjaWnf5v0O5gumzQr6KQ3445j8c
	 jDQGKHYj3w4kwCabyRdwV4lbDUt1n3qcmIQgcpSpHQMzQ7i8vXHEa0RIEDgTMXLGga
	 355wp/6EnWrJ0odjl89DWq4cSptNQ5m6uQLf3fqtf9hNC5eBG8pTaYNgs+b3ytQQzz
	 zqDk0cNwM4xcg==
Date: Sat, 11 Jul 2026 17:41:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 01/12] dt-bindings: phy: Document MT8195 and MT8196
 DisplayPort PHYs
Message-ID: <20260711-spiritual-wildebeest-from-uranus-0fce41@quoll>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707154245.198361-2-angelogioacchino.delregno@collabora.com>

On Tue, Jul 07, 2026 at 05:42:34PM +0200, AngeloGioacchino Del Regno wrote:
> This adds bindings for the DisplayPort and Embedded DisplayPort

"Add binding"


> PHYs found in the MediaTek MT8195 SoC (and variants of) and for
> the Embedded DisplayPort found in the MT8196 SoC (and variants).
> 
> This PHY supports varying impedance calibrations for the various
> signals to reach an optimal EYE signal pattern for any specific
> board(s), especially useful for very high bitrates such as HBR3
> and higher, depending on board design.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/phy/mediatek,mt8195-dp-phy.yaml  | 77 +++++++++++++++++++

I guess this answers my question about deprecated nvmem which I sent
some minutes ago. I did not see any lore link in that cover letter,
which would be nice in that case.

Anyway,

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

