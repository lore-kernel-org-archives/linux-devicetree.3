Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559771;
	b=cswnLS5eQQ+NjYYdDe2qRPXXu2Sp64HRwTt20UGRNs417dPvU9emWvdEO1tAQae0rDIj
	 5oQw+BfhNIUKpYA+zAIjuYjiBmSqU6tHnrfvcZiWCvtYSQFhfMGmrKI6SaWiOQKitbK0R
	 s+/cYonK+Cuqgft4TA4yzc+XHU69FzOOEJLQAIyHqOMlSmky9VlxjbOf8vSJoKdkdO70A
	 kdtCEjRSUirubtYQMOleVcGGPmp1rItQiS03KX8yEGATCMRB3HyArhmGU+wrgWBWZGZWI
	 wtCwL+vobbLwnR1IZAdBtosuWHvM17fpFrRMDhMXpuiJv3uhJYLYVk+/bblo+KOa4uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559771;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IZoxCrYpElCsNZYzT8Lq1KqTn6gefb/fToqqseyThZM=;
	b=IhAvnrY4tsqN8AvmuHgjIFpB9aF+Jx59jCNiTSj4XPGGkkSY+2ybrT0fO4snjreyfPkL
	 88nYvh6nQcaJne6TJXjqH8hG27RHskpInOnkuws01mOW/Kj56TcAIRfSSZuc6t7jl2Cox
	 2qsEPTUADKqlWGPmX0XVlVdHoiY9IsWO+B3wtnNaS0bhLxoNZjY8AxQf6LkfLUtbT7XQg
	 v5Bzbne9QojlJzo/NaeVPoOPPK4RcgYQobLwvWHAHtsb+AMbSpLNEuwvtDFpqDOnPt/wu
	 Yz7nUxrGx6/AP9yRgH71ziJV5ZSmYIx6D1mapI+K2cx/perCAy2do3Qdu6hDVhSAeFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l6aVJLR7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DFE606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 22:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l6aVJLR7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3721F000C4;
	Tue, 24 Nov 2026 22:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795559771;
	bh=IZoxCrYpElCsNZYzT8Lq1KqTn6gefb/fToqqseyThZM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l6aVJLR7mssCbfTPomMM5w+D5WadhfRxNGpjjLG4Ob/vxgtG2TJrnJUs/7n/lZMkh
	 NEvhczN2UARd9eAxBiNdDKb3yRQzomFZWMV5DcR7tq+SOxQs0fUwMgFd7OwvO+E3oy
	 +oeVFZUkfVcCUTtIlF04tyaUjRWGay9UVZkw1HL9dyLTqCw5BuiRevKD23KiL49bz2
	 UkMXbtyot1IZ8x5HdXNyddu3+HnuFEu70MzBwJfKHZrap7POzZX6yjipGIjMiZl2Xe
	 +uQxL1JOtwxrwzNDoj2r51utxk61EdI1BJ2BnFBqPyW14XC+AkpFdw2LoFiT+mVgYb
	 Af3jbNaD5zX1g==
Message-ID: <sashiko-outbox-232140@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: airoha: Document support for
 AN7583 USB PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261124222452.219832-2-ansuelsmth@gmail.com>
References: <20261124222452.219832-1-ansuelsmth@gmail.com>
 <20261124222452.219832-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 22:36:10 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] dt-bindings: phy: airoha: mixed addressed and unaddressed PHY
  subnodes
- [Low] dt-bindings: phy: airoha: copy-pasted #phy-cells in AN7583 USB
  subnodes
- [Low] dt-bindings: phy: airoha: AN7583 commit msg describes AN7581
  layout
- [Low] dt-bindings: phy: airoha: singular register in reg item
  descriptions
--

commit 28d6de48d44444f428cdf1e96b4b62c78a9e6bbb
Author: Christian Marangi <ansuelsmth@gmail.com>

> dt-bindings: phy: airoha: Document support for AN7583 USB PHY
>
> Add documentation for Airoha AN7583 USB PHY that describe the USB PHY
> for the USB controller.
>
> Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> always supported. The USB 3.0 mode is optional and depends on the Serdes
> mode currently configured on the system for the relevant USB port.
>
> To correctly calibrate, the USB 2.0 port require correct value in
> "airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
> selecting one of the 4 monitor clock for calibration (internal clock not
> exposed to the system) but each port have only one of the 4 actually
> connected in HW hence the correct value needs to be specified in DT
> based on board and the physical port. Normally it's monitor clock 1 for
> USB1 and monitor clock 2 for USB2.
>
> To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
> property is required with the phandle pointing to the correct Serdes port
> provided by the SCU node. Providing the phys property is optional if USB
> 3.0 is not used.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

[Severity: Low]
This commit message appears to be copied from commit b5e699a21adf
("dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY") and still
describes the AN7581 single-node layout rather than this binding.  In
particular, it states that the phys property is optional if USB 3.0 is not
used (whereas here phys is required inside the optional usb3-phy subnode),
says monitor clocks 1 and 2 are normally used (while the example uses 0 and
1), and does not mention the unified PHY layout with child nodes.

> diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.=
yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> new file mode 100644
> index 0000000000000..f1a5d83e89682
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> @@ -0,0 +1,133 @@
[ ... ]
> +properties:
> +  compatible:
> +    const: airoha,an7583-usb-phy
> +
> +  reg:
> +    items:
> +      - description: phy register
> +      - description: ana register
> +      - description: pma register
> +      - description: dig register

[Severity: Low]
As reported by Krzysztof Kozlowski on v4 [1], each entry in reg describes a
register range rather than a single register, so these descriptions should
use the plural "registers".

> +
> +  reg-names:
> +    items:
> +      - const: phy
> +      - const: ana
> +      - const: pma
> +      - const: dig
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  usb3-phy:
> +    type: object
> +
> +    properties:
> +      phys:
> +        items:
> +          - description: phandle to Serdes PHY
> +
> +      '#phy-cells':
> +        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TY=
PE_USB3,
> +          as defined in dt-bindings/phy/phy.h.
> +        const: 1
> +
> +    required:
> +      - phys
> +      - '#phy-cells'
> +
> +    additionalProperties: false
> +
> +patternProperties:
> +  '^usb2-phy@[0-9a-f]+$':
> +    type: object
> +
> +    properties:
> +      reg:
> +        enum: [0x0, 0x1000]

[Severity: Medium]
As reported by Krzysztof Kozlowski on v2 [2], this binding mixes addressed
MMIO child nodes (usb2-phy@0 and usb2-phy@1000) with an unaddressed child
node (usb3-phy) under a parent with #address-cells =3D <1> and
#size-cells =3D <0>.  The 0x0 and 0x1000 offsets are already covered by the
parent phy register region (0x1fac0000 0x1200) and the child nodes have no
independent resources, so should the child nodes be dropped and folded into
the parent node?

> +
> +      airoha,usb2-monitor-clk-sel:
> +        description: Describe what oscillator across the available 4
> +          should be selected for USB 2.0 Slew Rate calibration.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3]
> +
> +      '#phy-cells':
> +        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TY=
PE_USB3,
> +          as defined in dt-bindings/phy/phy.h.
> +        const: 1

[Severity: Low]
Why do both usb3-phy and usb2-phy@[0-9a-f]+ require #phy-cells =3D <1> to
select between PHY_TYPE_USB2 and PHY_TYPE_USB3?

Unlike airoha,an7581-usb-phy.yaml where a single node provides both USB 2.0
and USB 3.0 PHYs, each subnode here represents a single PHY of a fixed type
(USB 3.0 for usb3-phy and USB 2.0 for usb2-phy), and the driver's
an7583_usb_phy_parse_ports() and an7583_usb_phy_xlate() already determine
the PHY type from the subnode itself rather than the phandle cell.

[1] https://lore.kernel.org/r/20260907-auspicious-liberal-raccoon-bd7a81@qu=
oll
[2] https://lore.kernel.org/r/20260813-xanthic-sawfly-of-greatness-47e9bc@q=
uoll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124222452.2198=
32-1-ansuelsmth@gmail.com?part=3D1
