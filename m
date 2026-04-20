Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4713B7B68;
	Mon, 20 Apr 2026 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776692341; cv=none; b=oNTETrtn8FGf7j6RZKa3MepnweBkjKAc6AUG7hhLKv4Dsw1X5lEXVC1ymMXnv/4Z7/mEsZBCMprOHLaKmiNdS3RLMMI4666BbORZ+pWNTaSGKQgMEyjZxj+VRH5nOcc2LA4FvhBph7l2eX8LpddsJkIxhen4ng3mm/dZPYPCR/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776692341; c=relaxed/simple;
	bh=5mpwfZ7VItgM2yDj3SO4obOLgSGpgHLLJIOm0hxkpWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9t0KiaCXoiHa+nMBfl+JSjT2d8EAcc15BnZhX3IgWxZl49nO1BZw1PNz4q3NhTQAy9WDjOatG1bWLH/AAxpamwUCs8Ub1DnmSf1mVTFWIPrQUVGZ0Xk0tUlS9+8zwFvpqXkYGTZ0zOHsbPmSqfnDI6X/sGZ6JN6EizY/cvspOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oGOpkKXx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oGOpkKXx"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 23E0A265D;
	Mon, 20 Apr 2026 15:37:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776692241;
	bh=5mpwfZ7VItgM2yDj3SO4obOLgSGpgHLLJIOm0hxkpWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oGOpkKXxt1Ib62bGhycNsppZ51AZIc44RmmLWuEr1Qt5y1f8kse8gNyOPgsSd4Fqo
	 jBuOCRY9PA3+VRmS+/gpN6VHpS9PEfz110y7h6brQP/5kPEMcnXRPTaZ+0kMhxWDK7
	 X2R/eBOWLHN0+R2oGBXbULr36BI1U0OpIURIburQ=
Date: Mon, 20 Apr 2026 16:38:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110: Drop CAMSS node
Message-ID: <20260420133856.GA2305989@killaraus.ideasonboard.com>
References: <20260420-starfive_camss_use-v1-1-ec326af71ca7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420-starfive_camss_use-v1-1-ec326af71ca7@ideasonboard.com>

Hi Jai,

Thank you for the patch.

On Mon, Apr 20, 2026 at 06:48:07PM +0530, Jai Luthra wrote:
> The starfive-camss driver and bindings were dropped, as they were no
> longer being worked upon for destaging.
> 
> Drop the relevant node as well to avoid the following build warning:
> "failed to match any schema with compatible: ['starfive,jh7110-camss']"
> 
> Fixes: 644673fc8fb04 ("media: dt-bindings: Drop starfive,jh7110-camss from staging")
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes: https://lore.kernel.org/all/20260420-very-cartel-645595ffd1c7@spud/
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Assuming you've run the DT checks,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Ideally this patch should have gone in the original series, before the
> one that dropped the bindings which is now merged in mainline.
> 
> I've added a Fixes tag so it gets picked in the RC cycles for 7.1.
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 27 +-----------------------
>  arch/riscv/boot/dts/starfive/jh7110.dtsi        | 28 -------------------------
>  2 files changed, 1 insertion(+), 54 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 8cfe8033305d80cbe6179ed26601ca057ee00f16..a7a1c09a2c9075711f3a214a49618911fdc7b421 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -135,29 +135,6 @@ &tdm_ext {
>  	clock-frequency = <49152000>;
>  };
>  
> -&camss {
> -	assigned-clocks = <&ispcrg JH7110_ISPCLK_DOM4_APB_FUNC>,
> -			  <&ispcrg JH7110_ISPCLK_MIPI_RX0_PXL>;
> -	assigned-clock-rates = <49500000>, <198000000>;
> -
> -	ports {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		port@0 {
> -			reg = <0>;
> -		};
> -
> -		port@1 {
> -			reg = <1>;
> -
> -			camss_from_csi2rx: endpoint {
> -				remote-endpoint = <&csi2rx_to_camss>;
> -			};
> -		};
> -	};
> -};
> -
>  &csi2rx {
>  	assigned-clocks = <&ispcrg JH7110_ISPCLK_VIN_SYS>;
>  	assigned-clock-rates = <297000000>;
> @@ -175,9 +152,7 @@ port@0 {
>  		port@1 {
>  			reg = <1>;
>  
> -			csi2rx_to_camss: endpoint {
> -				remote-endpoint = <&camss_from_csi2rx>;
> -			};
> +			/* remote CAMSS endpoint */
>  		};
>  	};
>  };
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 6e56e9d20bb064e86b57a92d4cb05be330cca01a..9c3e4598747eb5541effe697044484715569a285 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -1199,34 +1199,6 @@ csi_phy: phy@19820000 {
>  			#phy-cells = <0>;
>  		};
>  
> -		camss: isp@19840000 {
> -			compatible = "starfive,jh7110-camss";
> -			reg = <0x0 0x19840000 0x0 0x10000>,
> -			      <0x0 0x19870000 0x0 0x30000>;
> -			reg-names = "syscon", "isp";
> -			clocks = <&ispcrg JH7110_ISPCLK_DOM4_APB_FUNC>,
> -				 <&ispcrg JH7110_ISPCLK_ISPV2_TOP_WRAPPER_C>,
> -				 <&ispcrg JH7110_ISPCLK_DVP_INV>,
> -				 <&ispcrg JH7110_ISPCLK_VIN_P_AXI_WR>,
> -				 <&ispcrg JH7110_ISPCLK_MIPI_RX0_PXL>,
> -				 <&syscrg JH7110_SYSCLK_ISP_TOP_CORE>,
> -				 <&syscrg JH7110_SYSCLK_ISP_TOP_AXI>;
> -			clock-names = "apb_func", "wrapper_clk_c", "dvp_inv",
> -				      "axiwr", "mipi_rx0_pxl", "ispcore_2x",
> -				      "isp_axi";
> -			resets = <&ispcrg JH7110_ISPRST_ISPV2_TOP_WRAPPER_P>,
> -				 <&ispcrg JH7110_ISPRST_ISPV2_TOP_WRAPPER_C>,
> -				 <&ispcrg JH7110_ISPRST_VIN_P_AXI_RD>,
> -				 <&ispcrg JH7110_ISPRST_VIN_P_AXI_WR>,
> -				 <&syscrg JH7110_SYSRST_ISP_TOP>,
> -				 <&syscrg JH7110_SYSRST_ISP_TOP_AXI>;
> -			reset-names = "wrapper_p", "wrapper_c", "axird",
> -				      "axiwr", "isp_top_n", "isp_top_axi";
> -			power-domains = <&pwrc JH7110_PD_ISP>;
> -			interrupts = <92>, <87>, <90>, <88>;
> -			status = "disabled";
> -		};
> -
>  		voutcrg: clock-controller@295c0000 {
>  			compatible = "starfive,jh7110-voutcrg";
>  			reg = <0x0 0x295c0000 0x0 0x10000>;
> 
> ---
> base-commit: c1f49dea2b8f335813d3b348fd39117fb8efb428
> change-id: 20260420-starfive_camss_use-7a229c330e71

-- 
Regards,

Laurent Pinchart
