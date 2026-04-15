Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5521B224B05;
	Wed, 15 Apr 2026 22:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776290683; cv=none; b=gKVOEBEsoi6wxzcV7D4P8hvXReqSyKPotWC+kseqkb5yVAOUoMU3tZigxpDyDEFqlCeV6S1N4zc3/BQezJsC/kb2EbtikDbTkvrP2PYgoO1eX3WvO+PZ/coX89U08xGAsdwEYptFAVTOKYqRDC2FxfKlzWKGhPtuVMlRQ7/Usgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776290683; c=relaxed/simple;
	bh=G8WHssE25KQ6tcDWOQojWxZnoS+qLkfpgZ3Cu4Pcp60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWxYcBPPf4Ge+WTpoZFbAZKg9majfSeKzyM6W742z5a/oxEpatmf++hNqH2VPK7eV+NPy5XQOLgVUTAApFjBjYjcIDclKzCTZVbJ+nq2bXO1p9ka4pzRJdurysejPgkLVPM8OH75vtWOOSlU46upt19sKtjee9QYB1jCu4SnEY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/qcc5h4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/qcc5h4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D43C19424;
	Wed, 15 Apr 2026 22:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776290683;
	bh=G8WHssE25KQ6tcDWOQojWxZnoS+qLkfpgZ3Cu4Pcp60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N/qcc5h4qraB38xx6wKUQzmmnOlQ37RoMzApdWToa84syPrNXCRxo8BegPmq5DlHS
	 c5K5J4ypKfrVQ5pG4cim/rZN2+nb/E/GAAIh2Ml3y4chtj0/BtabVlKNgjMP+gc2gX
	 xrzrcxj6+gl5F6vSdVE2dzbnY80auQbUJ25t6usO85rxQ4tP9iBrQlJ5Y+y72MjYrf
	 gACc1NMwjt4ptPgN3EaLWfvvi0Bd4MyQkSbibeAPrBI7dKf7uP7ykTPJrA+cMQ0CE9
	 v/Cxc8tVSsBBNC0Wm+AFb7oBbs0ceSvW+NSXB+u6lGmID1HXDuIW7dMcPl6xUvv2lq
	 NY0MKifhfWLlg==
Date: Wed, 15 Apr 2026 17:04:41 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, andy.yan@rock-chips.com,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: rockchip: dw-hdmi: Allow resets
 for Rockchip HDMI
Message-ID: <20260415220441.GA724186-robh@kernel.org>
References: <20260404200434.1954651-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404200434.1954651-1-festevam@gmail.com>

On Sat, Apr 04, 2026 at 05:04:34PM -0300, Fabio Estevam wrote:
> The Rockchip DW HDMI binding sets unevaluatedProperties: false while
> also inheriting from synopsys,dw-hdmi.yaml via allOf.
> 
> The Synopsys binding defines the optional properties resets and
> reset-names, but due to dt-schema rules these are not considered
> allowed once unevaluatedProperties: false is set in the Rockchip
> schema unless they are re-declared locally.

That's not how unevaluatedProperties works. There is no resets nor 
reset-names in synopsys,dw-hdmi.yaml.

> 
> This went unnoticed because most Rockchip SoCs do not wire a reset line
> to the HDMI controller in their DTS. The rk3228, however, does use a
> reset, which causes dtbs_check to emit:
> 
> Unevaluated properties are not allowed ('resets', 'reset-names')
> 
> Re-declare these properties in the Rockchip schema so they are accepted
> when present, matching the capabilities of the underlying Synopsys IP
> and fixing the dtbs_check warning for rk3228.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  .../bindings/display/rockchip/rockchip,dw-hdmi.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> index 29716764413a..59fb084bb4fb 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> @@ -113,6 +113,12 @@ properties:
>        - port@0
>        - port@1
>  
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: hdmi
> +
>    rockchip,grf:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> -- 
> 2.43.0
> 
