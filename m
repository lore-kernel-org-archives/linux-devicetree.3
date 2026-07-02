Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E353D25BC;
	Thu,  2 Jul 2026 07:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978789; cv=none; b=U9z1TcwUR0xwA2dtLRqylGhURim1CLEPQmNQ9sGXX8JPIf9FTd5YzcF0Irz8qCpSVNnfh8XG2iWLZzo/N0YJq4x42JRESnRf7T7zhJ40GaJC4pE0Kj0EnUEha6MZjio2gFg3Cy2Tp1fR8z6jS31jw16mi9I/ytK+o7DPCbcPIdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978789; c=relaxed/simple;
	bh=kPiLD/aUU2ibwDq1nGygpZK++jH7zoJ5h5OMxXyHE3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxsWjGi1fVjn8ZG6sQ7gDz2AQs3Lq+Slggt8kYp/f0d7d281/9SNgb+/QGQZzsoLY+AMkIStTKWfVusTIe2DBUq9k99vJJMC+w6z2rQ+ZtBxpV/5AVylrnlRNQf2Gul9uTQSB6Am78mc3//1EU1c1J+heBZccXL+ivqrUGN7cWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=env7wj8w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="env7wj8w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A267B1F000E9;
	Thu,  2 Jul 2026 07:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782978779;
	bh=RggIXQChyrd9PGRMbf+vMro4+L7wE747ABQYOAEiDL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=env7wj8wcJfIuCtiqo2vta7nC186527y80FragjdAc/RxQ5ScaDRP4J4T3DllIWsE
	 y/oCXXrMyyA10nC8qPxYSwd9jLj272kw1s9l2jnzrnuCSuw9xezvcyfbUTosfMLlrt
	 S0RLngLUyu20SuO6o4/xwJ1cmZzVnqkogmrOauVjic58rC30njyzut0demB8x2BXFK
	 J1t65ElN9x8747Pzzi0vsBEeTaC/dP3bearigkZWFXVZ/G1n9vct3IIDoW5etiX7B6
	 sS1h3pACCRoAzYaNqxDHEiq5ouMcX7h+rD6WjrFR+K2TVYP+60La/bQVogr1LPx8bX
	 uucpi7VH4ZLIw==
Date: Thu, 2 Jul 2026 09:52:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, matthias.bgg@gmail.com, 
	andi.shyti@kernel.org, djakov@kernel.org, broonie@kernel.org, jitao.shi@mediatek.com, 
	ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com, 
	jason-jh.lin@mediatek.com, kernel@collabora.com
Subject: Re: [PATCH 1/6] dt-bindings: soc: mediatek: mutex: Improve title and
 description
Message-ID: <20260702-congenial-honest-platypus-39d90a@quoll>
References: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
 <20260701122043.19612-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701122043.19612-2-angelogioacchino.delregno@collabora.com>

On Wed, Jul 01, 2026 at 02:20:38PM +0200, AngeloGioacchino Del Regno wrote:
> Improve both the title and the description of this hardware to
> disambiguate its functionality from a hardware mutex and/or from
> a hwspinlock.
> 
> Though in datasheets this is called "DISP_MUTEX", the meaning is
> is "Mute-X" (where "X" means "any hardware trigger signal") really
> as this is what this piece of hardware does: muting or unmuting of
> signals in each sub-IP of the display or other multimedia related
> controllers.
> 
> Based on that, also clarify the description text, as to make sure
> that the information is actually accurate.
> 
> While at it, also avoid forcing literal blocks in the description
> as there is nothing in there needing that (no ascii graph or other
> stuff that needs a literal block anyway), and add myself in the
> list of maintainers.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/soc/mediatek/mediatek,mutex.yaml   | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

