Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699C1432BC9;
	Thu, 13 Aug 2026 08:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609415; cv=none; b=LPX9cKKdG4WDftSx4W+HoXcJdr6ZeewqyOJCQuzTnbG1yVIyqAyVxOT5QZOXV7TYl/5T0r7F+0Lz/qDaT54CDkjpkFOwZl/btokFIY77+tGdJt8XKTG6B2urc9lz4KB7bAnhRtgNAzC5rlGDlHoMQeAI/tqb+SmQcy34RZZr9zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609415; c=relaxed/simple;
	bh=ngotu1IatQlbYGcjt9xIX1EdtrDzS2cu+4gFyN2SIvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LaP12vRuSWXpQfDJph9m/v/Tdg3JRL/IW8bsWmfjNBXbGWMIHM29krvoXiSYoDEOZepWPtVlaT4DQgayfPNDJim7NBGJituh5RjZr3eH03HHsnQAADedD6MeBWUHT1pU2+0AFtr8a6TpDptZGWfIodWXvz3Z1CAwH1JkuZEK5SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lhlD24SM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lhlD24SM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9BE1F000E9;
	Thu, 13 Aug 2026 08:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786609414;
	bh=kAJG2tMi3j77KOOlXo8NWPoO25sEP3JIjzOASqatMTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lhlD24SMJQRjQd+kbLE5uRRv7WuA2GamB/Pus/CabE9F3MPHi5ZVhBai6uUrftIlg
	 Jjbph9PP0aJkYmx8YLfqc0NhPrUG4bCJuNjNvGZmufEx3dkQOp09HY3xK2anCGSaM3
	 8sHCpUVvvKv2mw3CG0h/y4a5TLNcy6D5ZYFiCZulgyNQeCeVEbE8TdSExN1GEdVFRy
	 ET59kIWqX3+VixTe8+OO4GgG7Cf0NuFFKW4UwCmwuxRbTsueIDU3TOWClSFxkVX2To
	 yc7g3KKcIZjGQXhaarBzfQ4CgZR+53pJ9rDCdpvKPEaw8Z+obieDL0zXec9Myq7hk1
	 ZqoGoTIvrWQTQ==
Date: Thu, 13 Aug 2026 10:23:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Liu Ying <victor.liu@nxp.com>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com
Subject: Re: [PATCH v2 2/2] dt-bindings: display: simple: Add
 boe,dv215fhm-r01 compatible
Message-ID: <20260813-eager-international-limpet-743d6a@quoll>
References: <20260810-b4-lvds-panel-doc-v2-0-f2c2fe309989@oss.qualcomm.com>
 <20260810-b4-lvds-panel-doc-v2-2-f2c2fe309989@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-b4-lvds-panel-doc-v2-2-f2c2fe309989@oss.qualcomm.com>

On Mon, Aug 10, 2026 at 08:27:30PM +0530, Vishnu Saini wrote:
> Add BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel LVDS panel
> compatible string to the panel-simple-lvds-dual-ports binding.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Best regards,
Krzysztof

