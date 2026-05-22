Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DBE3A4267;
	Fri, 22 May 2026 06:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430276; cv=none; b=iMFfDFEwE+FbK3CEG7SAS0CWQNE+yceaapGfWPODkenIaANeWPQaNl2lOcCII7DkBrgkR4uRsi3vNzL+pzbEkEO5MPNiH9IxsC6OEthiXcsBAa3qJzPArqD3aXApczIrhvkR0fRUX6qCMoZu/74yET/k+471iTLtnCrVtPvFf8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430276; c=relaxed/simple;
	bh=JzudmPFl6sn5JIzo90INUggIdWhaEQxCdwB5cpte7Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=greaoGQrP5fOaPsBnar+fk/uTp8hcK2UM7I547U6OJXk0wwDyhs4Ew1snTtvBrc7w3eJ3E424Bra1K+2yUL37ptNFRYiEbHelB/cc6cL4lOWrfsgBhMq1VacsW4rXjEaHKSJ5ooxWedHidIaE4N3E4+cvuLCe7I1lldSNjo3zZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hL9xx0k4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hL9xx0k4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CFE1F00A3D;
	Fri, 22 May 2026 06:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779430275;
	bh=qxS3q8nZOcSQKq4P20XnQXRqQWcLObg3BV4uMyUPTbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hL9xx0k4Ib1m7J/yhdP/Dm6loIVX3e5ASiGOt4lfq/WoEcu6AGJQJdQTewS64i8mC
	 8rhdGvNKw4mg9LJOjdibu/cS6eYpJQnXeTShxRnYQK+jccEMZfQz62y0SMdv7h6feA
	 ryqvtsg5unSLubo5jyTdp1E6O90ayNEkPWsGEwF07DeG7NvN7dOcuP/iaf3RPA5HMV
	 6Fv3g5sNHTiHRpC6wmBTRWhHOcWqgRs3/6JUCoNp0pQWx6TJOxX9QGaDzDRipuO5UF
	 /Aihvf73Hvpur9M6kZt96bGwzNoZNPMIh4woBNmSP5k16uBr6Ky03LAAm6Bfhlch91
	 /WZbCsdpVilYw==
Date: Fri, 22 May 2026 08:11:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	nicolas.frattaroli@collabora.com, cristian.ciocaltea@collabora.com, 
	sebastian.reichel@collabora.com, dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com, 
	dianders@chromium.org, m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/10] dt-bindings: display: rockchip: analogix-dp:
 Fix hclk as third clock for RK3588
Message-ID: <20260522-demonic-shaggy-wasp-a3f261@quoll>
References: <20260521080835.1362416-1-damon.ding@rock-chips.com>
 <20260521080835.1362416-2-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521080835.1362416-2-damon.ding@rock-chips.com>

On Thu, May 21, 2026 at 04:08:26PM +0800, Damon Ding wrote:
> RK3588 eDP controller requires HCLK_VO1 to access the VO1 GRF
> registers and enable the video datapath.
> 
> Previously, the clock was enabled implicitly via the 'rockchip,vo-grf'
> phandle reference, which allowed the eDP to work without explicitly
> managing the hclk_vo1 clock. However, this is not safe or explicit.
> 
> To make the clock dependency explicit, enforce per-SoC clock-names
> requirements:
>  - RK3288: 2 clocks (dp, pclk)
>  - RK3399: 3 clocks (dp, pclk, grf)
>  - RK3588: 3 clocks (dp, pclk, hclk)
> 
> Do not reuse the 'grf' clock name for RK3588 because it represents
> a different clock with distinct control logic:
> - The 'grf' clock is only for GRF register access and is toggled
>   dynamically during register access.
> - The 'hclk' clock controls both GRF access and video datapath
>   gating, and must remain enabled during probe.
> 
> Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add support for RK3588")
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v4:
> - Modify the commit msg.
> 
> Changes in v5:
> - Enforce the correct third clock name on a per-compatible basis.
> - Modify the commit msg simultaneously.
> 
> Changes in v6:
> - Expand more detail commit msg about using hclk instead of grf clock.
> ---
>  .../rockchip/rockchip,analogix-dp.yaml        | 37 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> index d99b23b88cc5..8001c1facf98 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> @@ -23,10 +23,7 @@ properties:
>  
>    clock-names:
>      minItems: 2
> -    items:
> -      - const: dp
> -      - const: pclk
> -      - const: grf
> +    maxItems: 3
>  
>    power-domains:
>      maxItems: 1
> @@ -60,6 +57,33 @@ required:
>  allOf:
>    - $ref: /schemas/display/bridge/analogix,dp.yaml#
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3288-dp
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: dp
> +            - const: pclk

Why aren't there constraints for clocks? They always must come together.

Please open any other binding and look how it is done there.

Best regards,
Krzysztof

