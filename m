Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9465433F582;
	Mon,  3 Aug 2026 11:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755853; cv=pass; b=g+A2JxV8MkbjVIn6jIP6QKa6V1Jd8n3M/36CRkqBSEohvW6TsdnUVePK48QJZL72jMNt/YnB8FG+ZqT3l2T0fZS6yETKwgmHk5QCt8uryjZ0XUWpC1gT+c5sYvVr1lWrk++qaulu7S0ozs6EYRtqCx+eIvARI3PnSGyn5rTzCIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755853; c=relaxed/simple;
	bh=crWjgjkWDa/qpdZwLIvQKfcTwDkMmu4sbdttM1DrbMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ci6i9LnTQRIgKeRTvGs6kL/DVF3ppJ18T2egSFM0K1vm26SKHo1zpHH62K1S09RGaYrUDparz8XEtR/zVQrp/MMHh11iTHFWYgNCUj3+61YXX/BavdBXq7QTppFNPuDmpjuI0cX8qqnFX3VVpcsyKAcB7uIzRh/m+BvskQ/ECak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=fECO9WpQ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="fECO9WpQ"
ARC-Seal: i=1; a=rsa-sha256; t=1785755833; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N6ywSwxLEFb9gG8oYttpQkVhScP+WvoU/6wJZ3gWbc+DXC20neefgnMbzCQW8brUjrXkB8iNGwYfJcSm1l6NmkbPKinyFVFAiM5JDw2D6C83GBGSZ+a6yIFWNcSVIqHPoCsKd16evyYoLO1m0/V0TLewUu/xE5gI7mO/CX0Marc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785755833; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NuRyFBwN1SC24uRuk/3QyHtck+ihNVdASdTlKyM/F1U=; 
	b=oIn67671C5ZXQQdsJ3QoxBw4H1P2QyluVcIOuIDTe8485DMhxQBgt0d5y+F82eEpoxBoGuPEgYrpo1hwToBHgErN8j7yEq4S/zTLUBDtsG1dTAY9mfJBD5PDl0vEf9caTB06FYsSukNZzWnh99PfinDAX6q1YajfgyXwghJWtRA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785755833;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=NuRyFBwN1SC24uRuk/3QyHtck+ihNVdASdTlKyM/F1U=;
	b=fECO9WpQVTjWD/nDF1WL9T/MlLRiA+KHJyFV5E4f90l3hlfDNYrqkYqu4x0v3NkM
	u6AHZRTycWtHTtWJ0pt/F5wgDp27Qt/vxRMhu2eSmj/ZpZkmc+j8h/MI22i6Sd4GG6x
	IXH4QojZEtbaolLZVVwdHAcXaCgqd78daBEYnzJs=
Received: by mx.zohomail.com with SMTPS id 1785755829967932.0627661158444;
	Mon, 3 Aug 2026 04:17:09 -0700 (PDT)
Message-ID: <82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.com>
Date: Mon, 3 Aug 2026 13:17:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 support per-direction phys
To: jason98166@gmail.com, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <20260726-dcphy-rx-v1-v2-1-cf9cc34a412a@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260726-dcphy-rx-v1-v2-1-cf9cc34a412a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Jason,

Thanks for your patches!

On 7/26/26 16:55, Jason Yang via B4 Relay wrote:
> From: Jason Yang <jason98166@gmail.com>
> 
> The Samsung MIPI D-/C-PHY block on RK3588 drives a MIPI DSI transmitter
> and, on the same PHY, can receive a MIPI CSI camera. Describing both as
> independent consumers of one PHY requires the direction to be expressed
> in the devicetree.
> 
> Allow "#phy-cells" to be 1 or 2. The existing single-cell form still
> selects the PHY type and refers to the transmitter, so shipped DSI
> device trees stay valid; bumping the cell count unconditionally would
> invalidate them. A second cell adds the direction, letting a DSI (TX)
> and a CSI (RX) reference the same PHY node as separate consumers.
> 
> Add include/dt-bindings/phy/rockchip,rk3588-mipi-dcphy.h for the
> RK_DCPHY_DIR_TX and RK_DCPHY_DIR_RX direction constants.
> 
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> Assisted-by: Claude:claude-opus-4-8
> ---
>  .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml   | 22 ++++++++++++++++------
>  .../dt-bindings/phy/rockchip,rk3588-mipi-dcphy.h   | 13 +++++++++++++
>  2 files changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> index c8ff5ba22a86..68a43db9c669 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> @@ -20,12 +20,22 @@ properties:
>      maxItems: 1
>  
>    "#phy-cells":
> -    const: 1
> +    enum: [1, 2]
>      description: |
> -      Argument is mode to operate in. Supported modes are:
> -        - PHY_TYPE_DPHY
> -        - PHY_TYPE_CPHY
> -      See include/dt-bindings/phy/phy.h for constants.
> +      A single cell selects the PHY type and always refers to the
> +      transmitter (DSI) direction. It is kept for backwards compatibility
> +      with existing device trees:
> +        - <PHY_TYPE_DPHY>
> +        - <PHY_TYPE_CPHY>
> +
> +      Two cells select the PHY type and the direction, so that the
> +      transmitter (DSI) and the receiver (CSI) can be described as
> +      independent consumers of the same PHY:
> +        - <PHY_TYPE_DPHY RK_DCPHY_DIR_TX>
> +        - <PHY_TYPE_DPHY RK_DCPHY_DIR_RX>

How is that Rockchip specific? As you state above this is either MIPI
CSI or MIPI DSI, two perfectly standard protocols.

@all Would it be reasonable to introduce PHY_TYPE_CSI and PHY_TYPE_DSI?

The rest of the patch LGTM.

Best regards,
Michael

> +
> +      See include/dt-bindings/phy/phy.h and
> +      include/dt-bindings/phy/rockchip,rk3588-mipi-dcphy.h for constants.
>  
>    clocks:
>      maxItems: 2
> @@ -82,6 +92,6 @@ examples:
>                   <&cru SRST_S_MIPI_DCPHY0>;
>          reset-names = "m_phy", "apb", "grf", "s_phy";
>          rockchip,grf = <&mipidcphy0_grf>;
> -        #phy-cells = <1>;
> +        #phy-cells = <2>;
>        };
>      };
> diff --git a/include/dt-bindings/phy/rockchip,rk3588-mipi-dcphy.h b/include/dt-bindings/phy/rockchip,rk3588-mipi-dcphy.h
> new file mode 100644
> index 000000000000..5029838fa275
> --- /dev/null
> +++ b/include/dt-bindings/phy/rockchip,rk3588-mipi-dcphy.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2026 Jason Yang <jason98166@gmail.com>
> + */
> +
> +#ifndef _DT_BINDINGS_PHY_ROCKCHIP_RK3588_MIPI_DCPHY_H
> +#define _DT_BINDINGS_PHY_ROCKCHIP_RK3588_MIPI_DCPHY_H
> +
> +/* Direction of a Rockchip Samsung MIPI D-/C-PHY combo block */
> +#define RK_DCPHY_DIR_TX		0
> +#define RK_DCPHY_DIR_RX		1
> +
> +#endif /* _DT_BINDINGS_PHY_ROCKCHIP_RK3588_MIPI_DCPHY_H */
> 

