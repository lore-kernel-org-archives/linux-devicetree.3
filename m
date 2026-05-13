Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614E639DBE0
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668162; cv=none; b=ZbQFrgFJNaZFK4rCaO0TOxz5BTUjB2U+lb8koABZc9n4CPuNkzPD7D29NBApM2jBC7ystnchRbPHz72areggwp7sZ3dm8CaiO335l1Bnl7Zw4hRZSftJdVr16w9AmcnlyYK88mn/BGSgeDb54DNh3zgYT0EOSwbgTJ9Zw9UaTp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668162; c=relaxed/simple;
	bh=LYgxS0TnzTTnUeFk/iCJr1qdv/ce0xj9FviH5w16JIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meSkXr/TAfNV7dC8DEYJ6UmxunPUaylJihInXTC4+R+YR0V8VVgThr/67VAx++EnShkH7bBnAz0MKG4alBIVz82kvvzHJg3St2cci1Jne6DkxJGfeWcAYR40oqUIMwPSbcVQLuBL77E4Qk6YHHHWTIlfA2NqSlh02DFRrkgeUiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=fail smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1wN6q0-0003LM-VQ; Wed, 13 May 2026 12:29:12 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1wN6q0-000aCm-2B;
	Wed, 13 May 2026 12:29:12 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1wN6q0-00000002oGI-2KJN;
	Wed, 13 May 2026 12:29:12 +0200
Date: Wed, 13 May 2026 12:29:12 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/3] dt-bindings: soc: imx: fsl,imx93-media-blk-ctrl:
 Allow LVDS Display Bridge child node
Message-ID: <ymhkemd7ojr4aa5ak2ang4774ks2hpg4b7cpx27n7mk2cuvhj5@wn7h6j2eiu4f>
References: <20260513-imx93-ldb-v1-0-d11c5c3cc197@nxp.com>
 <20260513-imx93-ldb-v1-1-d11c5c3cc197@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-imx93-ldb-v1-1-d11c5c3cc197@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

Hi Liu,

can we please wait for the outcome of this dicussion:

https://lore.kernel.org/all/uyh5s6g7bvuufnhfjrmungp5dbyllxfrgfzaxno22knpxxojmj@qqvh75ezblpp/

before we're going further?

Regards,
  Marco

On 26-05-13, Liu Ying wrote:
> i.MX93 SoC mediamix blk-ctrl contains one LDB_CTRL register and one LVDS
> register which control video output through a LVDS interface.  Allow the
> LVDS Display Bridge(LDB) child node and add the child node to example.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> index d828c2e82965..ab563b457e07 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> @@ -26,6 +26,12 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
>    '#power-domain-cells':
>      const: 1
>  
> @@ -92,6 +98,11 @@ properties:
>        - compatible
>        - ports
>  
> +  bridge@20:
> +    type: object
> +    $ref: /schemas/display/bridge/fsl,ldb.yaml#
> +    unevaluatedProperties: false
> +
>  allOf:
>    - if:
>        properties:
> @@ -163,6 +174,8 @@ examples:
>                 <&clk IMX93_CLK_MIPI_DSI_GATE>;
>                 clock-names = "apb", "axi", "nic", "disp", "cam",
>                               "pxp", "lcdif", "isi", "csi", "dsi";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
>        #power-domain-cells = <1>;
>  
>        dpi-bridge {
> @@ -190,4 +203,29 @@ examples:
>            };
>          };
>        };
> +
> +      bridge@20 {
> +        compatible = "fsl,imx93-ldb";
> +        reg = <0x20 0x4>, <0x24 0x4>;
> +        reg-names = "ldb", "lvds";
> +        clocks = <&clk IMX93_CLK_LVDS_GATE>;
> +        clock-names = "ldb";
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            endpoint {
> +              remote-endpoint = <&lcdif_to_ldb>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +          };
> +        };
> +      };
>      };
> 
> -- 
> 2.43.0
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
