Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3723FB7DA
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774967532; cv=none; b=dRiKjKLKGoF3NWIzWalo5dEl3KlgspBiC58IQIQJb00jykjDv911sQlDaXc/jSNj2YAi0E1rI64GbNnXV2UBXwiomeFB9jwjof0jDeZ6GNoLcihKSUYa2LtsIeoogkS9T6Dg1GGoR+nVbGwSqIXyxY7exq/HtopssdFzSRCmle0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774967532; c=relaxed/simple;
	bh=iNxOjW15bAhGECqyOpje5IdokDrygM3OjbtlLkrF2ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXlIrVgwmMzwHErzyvnp2xxbcjt9MWOHLyLEmkyrrPLlc3osaeAXRS8Bhkuo/GQQAU6R6AglJ27CSqSfoUYpI7vmeMdMMm/BgqH4I9RkLYl+ObL+1gerzRopjFkUVUWdX7vRK0CnFpTCZ/426NvP/yPWnlPHee6XL5n69yf4L0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GP9+xnAv; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GP9+xnAv"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81D4D497F
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 07:32:04 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 22B813F641
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 07:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774967530; bh=iNxOjW15bAhGECqyOpje5IdokDrygM3OjbtlLkrF2ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GP9+xnAvW7nrFk38SoWC6uHBt8+HZKxwqiuYKAW1tbkOjtKroRRi9pDIwE8vaEfnS
	 2vJLGsTInQoI1x+QVfPS43WXBZBeeH2ETxw3yU8/GYVNMsK0861rWtX7q9deZQAHzt
	 rapqdzbowTeIB9MwZzJDXODd+sj91Lr7X5TwE2yQ=
Date: Tue, 31 Mar 2026 15:31:49 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Guangliu Ding <guangliu.ding@nxp.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Jiyu Yang <jiyu.yang@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: mali-valhall-csf: Document i.MX952
 support
Message-ID: <acva1Xt8V4k9-uG8@e142607>
References: <20260331-master-v1-0-65c8e318d462@nxp.com>
 <20260331-master-v1-1-65c8e318d462@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260331-master-v1-1-65c8e318d462@nxp.com>

On Tue, Mar 31, 2026 at 06:12:38PM +0800, Guangliu Ding wrote:
> Add compatible string of Mali G310 GPU on i.MX952 board.
> 
> Signed-off-by: Guangliu Ding <guangliu.ding@nxp.com>
> Reviewed-by: Jiyu Yang <jiyu.yang@nxp.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> index 8eccd4338a2b..6a10843a26e2 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -20,6 +20,7 @@ properties:
>            - enum:
>                - mediatek,mt8196-mali
>                - nxp,imx95-mali            # G310
> +              - nxp,imx952-mali           # G310

Can you explain why this is needed? Can it not be covered by the existing compatible?

Best regards,
Liviu

>                - rockchip,rk3588-mali
>            - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
>  
> 
> -- 
> 2.34.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
