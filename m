Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CE33D3002;
	Wed, 22 Jul 2026 15:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784735105; cv=none; b=EWA31xUC2yETZbK1KlPqdsx9Fm0cMkAc3AoDQkH9qQrEDK5QtGbIkP/VaxhYtcyKAJ0z+UXATnH/KivmNdAvmIsPhuUdCZws7HDoKm6/k/Ag/7Eg3wfLY+jrqCn4CmtkPtELLGdyqqhgP3moaW6i82sfbbGBYxGHUTJ43e3MuYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784735105; c=relaxed/simple;
	bh=LeAXc0E7FchQBTjMLzzbgUsHp7JlI/rF8EXhRPAS7bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYBQFWK8iq+jpgU83RFBETjAfrFq9xbYSpWFkMXtH72gEmvfkfX8YQdXLQ0Xaw/zz39bT50tBgfa9Xjl1m9jyB5p+R7lB6JuM+Vm1ORlXNnCWStODXvAXUCBlpfxeLGpVwxVR3+CNJ1drviIW9JLoO9kTOsUVJurAE+qT7kYdFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsjF49+n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsjF49+n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0DB1F000E9;
	Wed, 22 Jul 2026 15:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784735103;
	bh=/OsIhPpVYT3n9diLVUiR7498vs3ZnyRvw7xjAByzCgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bsjF49+nysB5MqTTiGuxAQwzjtDFeEXvEIeCB6m6+CUqR0A4ru9FDJnUOaO+B2oWX
	 CXKTsoDKJpLBZqdvHYPZKXFivbA9Evrf0q16oC30RCW2bWRo3xgJ+o/sgzpeqJxFC6
	 zeA6A8HTmsLYWxeTsgohoG59Jyh0Zzfhcvlq5eTYrGNktN2q2HnZXiY1RqqTbo4rOz
	 pGGrI/YEV2oPbWC3at+oO0C/RmKf99VgeV4n6lhbl7wvASpXOmx/N8pIs24iVVDifV
	 pbmV4IyCdHwB2eCKbaUF3kM0fdzeWs7JX3SAGiBkMiyV5z9PBSCTdpp6JsflIU2QJC
	 z/Qee/jv9Ki+w==
Date: Wed, 22 Jul 2026 10:45:00 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com, kernel@collabora.com
Subject: Re: [PATCH v2 12/46] dt-bindings: soc: mediatek: mutex: Allow
 #trigger-source-cells
Message-ID: <20260722154500.GA988735-robh@kernel.org>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-13-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714114414.184512-13-angelogioacchino.delregno@collabora.com>

On Tue, Jul 14, 2026 at 01:43:40PM +0200, AngeloGioacchino Del Regno wrote:
> This hardware controls trigger sources, and there's even a generic
> binding just for that: allow #trigger-source-cells in MuteX, so
> that this is allowed to provide triggers to external HW.
> 
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

You ack-ed your own patch?

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> index 5267cfe92572..886e6f904b78 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> @@ -54,6 +54,9 @@ properties:
>      items:
>        - description: MUTEX Clock
>  
> +  '#trigger-source-cells':
> +    const: 1
> +
>    mediatek,gce-events:
>      description:
>        The event id which is mapping to the specific hardware event signal
> @@ -116,6 +119,7 @@ examples:
>              interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
>              power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>              clocks = <&mmsys CLK_MM_MUTEX_32K>;
> +            #trigger-source-cells = <1>;
>              mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
>                                    <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
>          };
> -- 
> 2.54.0
> 
