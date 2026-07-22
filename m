Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843B6470E9B;
	Wed, 22 Jul 2026 19:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784749196; cv=none; b=APH/bSrHt81jk9Ox8gj29UCrYvBgC3SSzS9ywLU46oV9SMKc/QGBhW6lCFoFQ8ZqginNgSnVTI9UP2qp9IOSBw6fiC9RItpXCtgqayRaEqIMsZUJ+plN2Qj93hD/ptK72aRDoUw9bqYT9+1enqMX+6HNXzePvTCWJy2DENKyuu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784749196; c=relaxed/simple;
	bh=1llwSVVL3KaVYff+Z1zaskQyCs78z/EE7zvW1FJt+XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aljNovaVU7u+9LdL4DrFmjgFyw2PceLtfCtjsjy4l90CyUSBifLwbXape5hcHnClGtVYOk2iSxh39ZOuyNSCUzdpvjihZ2zlnHEpxibpOPSOLvlrxLvO6TpnO7sCsgIn+hAtk6VNh4C0n04EUSEl0HrLS1SHSvrb++MJRC2qOYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6CWYkHe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6CWYkHe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA8E1F000E9;
	Wed, 22 Jul 2026 19:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784749195;
	bh=ZUyuIQ9nqah6EK1D0NOzJjYyGgjr5WnKeB3TFi1F4Es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R6CWYkHej0TzzO3ANb+dlL3TJDL3lajBzdS7ovs2HnGR3VdE6hO8OmjYjtU5Q3ihV
	 32qRgwxReQThPm6my97JY7+60yWrfpNW8oeww//RcBSMlDPhke2TKYzh10GK11eSFA
	 UtxlzQ8mkezj74OtVQqlYyLcWZaTJss2ohbsf8WSbNkQPY5tyih3A9ksZhbsEWuD+i
	 1hKiMHK9mBog2OGwfIsWBto97LQQHYz9bvF33U4xmvY4SB3sZSI5A03zUlAvMJsqtE
	 DJLlQkpjN71PUJN2D6QVYbHuWPHPpsY2nGExOQxV4p9qq2etYLE2R5GRjNgXx8NFcU
	 vWRQaMdWksDiQ==
Date: Wed, 22 Jul 2026 14:39:54 -0500
From: Rob Herring <robh@kernel.org>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com
Subject: Re: [PATCH] dt-bindings: display: panel-lvds: Add boe,dv215fhm-r01
 compatible
Message-ID: <20260722193954.GA1559082-robh@kernel.org>
References: <20260719-b4-lvds-panel-doc-v1-1-6a18c213c2f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719-b4-lvds-panel-doc-v1-1-6a18c213c2f6@oss.qualcomm.com>

On Sun, Jul 19, 2026 at 09:38:36PM +0530, Vishnu Saini wrote:
> Add BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel LVDS panel
> compatible string to the panel-lvds binding.
> 
> Also remove the 'port' requirement from the required list to allow
> dual-channel LVDS panels to use the 'ports' graph topology with
> separate port@0 (odd pixels) and port@1 (even pixels) nodes, as
> required by the dual-LVDS binding.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/panel/panel-lvds.yaml          | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> index b89f86bc0683..584818b2df6e 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> @@ -58,6 +58,8 @@ properties:
>            - hydis,hv070wx2-1e0
>            # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
>            - jenson,bl-jt60050-01a
> +          # BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel LVDS panel
> +          - boe,dv215fhm-r01

This belongs in panel-simple-lvds-dual-ports.yaml.

Rob
