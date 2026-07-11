Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB802C21E6;
	Sat, 11 Jul 2026 15:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783782494; cv=none; b=l2LZuy43AppSYi89sMhCs84nMbpy9mdnEhgWhjy1c0D+UWb9yWnaicJ7s17P/vD+3c/gSJq32/LuPC/lhFgqyBnbeUVIIUO3Kb98PwmaI899hQwMeCAniXLY3GuctbD1kDMfWpo9OZOLGIBLI6/S0b+9+FrSiYwRFdkuSyPOqy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783782494; c=relaxed/simple;
	bh=0DAdH9oE5CxXlxBmaHovta+nRXgrFK7chSkYOE4L3ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JqkEWZT81YkxlHjCW6SHkyD7Hx3LAE8GxLuumXajnHmk2T3LqfByDXxLsMXDwSpJdaQVe83sPv93Ecgvn6rWz6dv//BZqaxY91RcUSGYezlXQCA7eUxCFeqNpi/MiD8abtb8xFFp8NRI0FhcPyXttJn7LnNdID829O6Nb8DCxtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RogktxIt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RogktxIt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C2F1F000E9;
	Sat, 11 Jul 2026 15:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783782492;
	bh=m35O9uD/U+TaQ848Y04SAAFcQbtyJ5oGcy3AMnA+LCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RogktxIt1oUimSNaB2eJ/JBshJZ6HswdELFaAY6mRo5VtRBA/1zIn0NHfYbFlvIYU
	 M4WsYVO+2jR8QPbpk8703X4cr8YImO3/UUWKPfjiPcd6rtyZDjlvcFxEg6hgJJVUlu
	 vDJweMWJC007cT5r06hSgpIfYJpxhRk03UePx02tzusX9ZYcE0qCSS+CMtOCUYpDDA
	 Bx27+bhosBrBkShgSzHTZiGwUaoljoN8R98iifTzUVpFVEJNyqQZa7QaNKIYKxgoCG
	 TMD2sic22TDce/JT0kHNLi7Ni0XzQ+LyPGpfH/EwHn/R4xMW/kjDBJBsk1hEpzvhJP
	 WuKkKlUTj5bIQ==
Date: Sat, 11 Jul 2026 17:08:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, jitao.shi@mediatek.com, granquet@baylibre.com, 
	rex-bc.chen@mediatek.com, dmitry.osipenko@collabora.com, ck.hu@mediatek.com, 
	amergnat@baylibre.com, justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 01/12] dt-bindings: display: mediatek: dp: Deprecate
 nvmem efuse data
Message-ID: <20260711-heavy-neat-armadillo-c0f493@quoll>
References: <20260709113148.49090-1-angelogioacchino.delregno@collabora.com>
 <20260709113148.49090-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709113148.49090-2-angelogioacchino.delregno@collabora.com>

On Thu, Jul 09, 2026 at 01:31:37PM +0200, AngeloGioacchino Del Regno wrote:
> Deprecate nvmem-cells and nvmem-cell-names and clarify their
> purpose, as those are for PHY calibration data, not for the DP
> IP itself, and that data shall go in the PHY binding instead.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dp.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

That phy binding should be posted somewhere and maybe even squashed
here, so we do not end up with deprecated property alone.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

