Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFE929B764;
	Mon, 15 Jun 2026 13:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781530827; cv=none; b=c9a6Jie4vI8d+38hahpXh7Sff6K6AWgBwg5LE6xg1HFODXP/sZfvXbGoO4zDV2vpn/WDVipsbSAbU4cjYQrTN0ZFFWODOclnwsV6ZtCwPbkjlRSTlJYg5DP/L1KPS7CL7NblmZGB/oLGxmbV5uQu6tBp0xkXbovhKq2KMI5bCP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781530827; c=relaxed/simple;
	bh=6RpRTXDVHn3B/8pAZEesAMePZFseP4h+ni4I/YCWBfk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=kdcnbUY8KIfni3xpymWp9HuTB201Gk5m4dH0P0ydZPBd4Z+8P1qUrmneQbSk0ZgvtgDNm+tSReqLmtES58zQV3jcur3zUzxAx/9tuy1vYnvt+Aj/VV/A2M1LUbK1k0CJHpdbB2JGR7SARgPKhsrwV1BY+eP01Dh/Qa92Jh56UiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbDNoefC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbDNoefC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F531F000E9;
	Mon, 15 Jun 2026 13:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781530826;
	bh=rMB2+OBOhHvjtcjOVbhC4Uj4jiqIRbaW+a/Lb9TNIDs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=hbDNoefCWx2DjqI4528QInxoQ4xq4D7gRMX3Ae2g9Gec3MUp7O/HNgEQhGE6adQAn
	 mFD1eVf6PsxEp6UMlscpQ8hM9+gS7uGo+lqQcKDopeAivrN7RAjB9RHucJO/B5I5zT
	 Km4+71BmvuGQv7BtgfhQeb3oN2CH9E0zOsx30E1ekB88P9oNs5LgAPaKUYuYs6r55Y
	 kqT/35e+Oy+rpi4pJ6gA+c5xQxH9fuPvn+LS5FxG8vFgbVWSo35nJ5ZJqGX7xzMJAK
	 7ORgb99ZzxljwFqe61veexQ8MGNUaQ10yYV/4vFEH0tGJSGJSSj7nwyav10wlBFJaY
	 H9Mewsp4NPu4g==
Date: Mon, 15 Jun 2026 08:40:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Hui-Ping Chen <hpchen0nvt@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Joey Lu <yclu4@nuvoton.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Arnd Bergmann <arnd@arndb.de>, linux-phy@lists.infradead.org, 
 Shan-Chun Hung <schung@nuvoton.com>
To: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260615054911.48821-2-a0987203069@gmail.com>
References: <20260615054911.48821-1-a0987203069@gmail.com>
 <20260615054911.48821-2-a0987203069@gmail.com>
Message-Id: <178153082322.1456470.14205688450934768854.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend
 for dual-port OTG support


On Mon, 15 Jun 2026 13:49:09 +0800, Joey Lu wrote:
> The MA35D1 has two USB PHY ports managed by the same hardware block:
> 
>   - PHY0 (index 0): OTG port shared between the DWC2 gadget controller
>     and EHCI0/OHCI0 host controllers.  A hardware mux follows the USB
>     ID pin automatically.
> 
>   - PHY1 (index 1): dedicated host-only port for EHCI1/OHCI1.
> 
> Extend the existing binding to cover both ports:
> 
>   - The PHY node is now a child of the system-management syscon node
>     with a reg property.  The nuvoton,sys phandle and clocks
>     properties are removed; the driver derives the regmap from its
>     parent, and clock gating is owned by each individual USB controller.
> 
>   - #phy-cells changes from 0 to 1: the cell selects the PHY port.
> 
>   - Two optional board-tuning properties are added: nuvoton,rcalcode
>     for per-port resistor trim and nuvoton,oc-active-high for
>     over-current polarity.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml | 62 ++++++++++++++-----
>  1 file changed, 48 insertions(+), 14 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.example.dtb: system-management@40460000 (nuvoton,ma35d1-reset): '#address-cells', '#size-cells', 'usb-phy@60' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/reset/nuvoton,ma35d1-reset.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.example.dtb: system-management@40460000 (nuvoton,ma35d1-reset): compatible: ['nuvoton,ma35d1-reset', 'syscon', 'simple-mfd'] is too long
	from schema $id: http://devicetree.org/schemas/reset/nuvoton,ma35d1-reset.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.example.dtb: system-management@40460000 (nuvoton,ma35d1-reset): reg: [[0, 1078329344], [0, 512]] is too long
	from schema $id: http://devicetree.org/schemas/reset/nuvoton,ma35d1-reset.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260615054911.48821-2-a0987203069@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

