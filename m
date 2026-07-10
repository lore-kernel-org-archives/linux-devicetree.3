Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC193F4102;
	Fri, 10 Jul 2026 09:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675825; cv=pass; b=pA0JSV6I09jsQlnFs78oJarAFriqQ24KNlcUUlW44PZvyWSM+Nl0StQR1rVKY21/a/9EpqBu7oSLi9QTPDcpdDMlwlEXz1J573QaLd9iFTpp1pB4UksYD+cbIp0ow0AtTnoxqS886v5FsaX2h26gvNV/W5AXiOr/v9telCkjaeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675825; c=relaxed/simple;
	bh=KV7ADoG0N1DuKBuL0WR6kvd1SfYGRzVqPaftphwMfIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QPjlHWbc6beyS6iwm1ww0s17rFnuByvrYQ3E/7C4MXO8w/E0QNPrg8ZbhyUSO7yZKtwj9x4YWlNN9tBrympkQLp3suiW8Bqu3rVBnDf3cYf6mnGObHjmfIWazLX08HRgKqWEAW8kYKilIG6cJiOHIDUDj39tEICTumTfICNtvR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=T5Q6KMbp; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="T5Q6KMbp"
ARC-Seal: i=1; a=rsa-sha256; t=1783675811; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D9kUGQ255xhzZeQWelttSRUJxIH/MpLmXjGqKcC6Ovl5oHOIB2geAYmrjpj9UODZLafz4XVfbUeRE1Oypw5yU9N+nYLT56+FZfmaeOzags7Di/XoaJM0L/hm/W/ubEK5cBgbDB9zI5CZ7YstNJ8sBc4k2LqZJizEYptjkzSNv+A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783675811; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6hb5I4/2IdOfdGyllTI2W7LkWVdlsgKxVqV5mnOeQwE=; 
	b=SipXuD268ETrbmfsS5UXTmwpCTtgiwtUMgd+N5QdDCyhiYrxDBvGBdNJ2ZWLyz3jcoFlmmvcOMltXsGSicK6O+6BzHUtiZDaYlL4olwEopIYO+QvWHuBRx+qZl1vrqNWG4G18hmEsLAdsJyx8utWvgHCfQH7A2fJtfgkX1j4T0I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783675811;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6hb5I4/2IdOfdGyllTI2W7LkWVdlsgKxVqV5mnOeQwE=;
	b=T5Q6KMbp3jUFiOxL9g1l69BSL9Db9tKLBcOrZtqzbd4ZnRJNwGMuaaipJirsB4Ih
	zxU0w3wJS8vGnNlSW1La9QlxUU70ihBJwwGfOdmnAh+HG/srEQ4u6/gBZbxxDcU/tZ3
	Mw+TY97hFcHSK778cbqEaK1AL8z7goCZD22kuaOQ=
Received: by mx.zohomail.com with SMTPS id 1783675810094635.854368220136;
	Fri, 10 Jul 2026 02:30:10 -0700 (PDT)
Message-ID: <04e9a542-a05d-4608-ac00-d40da4763f45@collabora.com>
Date: Fri, 10 Jul 2026 11:30:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rockchip,clk-lane-phase property
To: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260630-feature-mipi-csi-dphy-4k60-v3-0-176792ab71fa@wolfvision.net>
 <20260630-feature-mipi-csi-dphy-4k60-v3-2-176792ab71fa@wolfvision.net>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260630-feature-mipi-csi-dphy-4k60-v3-2-176792ab71fa@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Gerald,

On 6/30/26 09:48, Gerald Loacker wrote:
> Add support for the optional rockchip,clk-lane-phase device tree property
> to allow board-specific tuning of the clock lane sampling phase for
> improved signal integrity across supported data rates.
> 
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>

Acked-by: Michael Riesch <michael.riesch@collabora.com>

Thanks and best regards,
Michael

> ---
>  .../devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml        | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> index 03950b3cad08c..913aa688c0ae9 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> @@ -56,6 +56,16 @@ properties:
>      description:
>        Some additional phy settings are access through GRF regs.
>  
> +  rockchip,clk-lane-phase:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 7
> +    default: 3
> +    description:
> +      Clock lane sampling phase selection (hardware tap index 0–7). Each step
> +      corresponds to an approximately 40 ps delay as described in the hardware
> +      specification.
> +
>  required:
>    - compatible
>    - reg
> 

