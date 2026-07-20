Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3DA39734B
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784543304; cv=none; b=I5DhsGFInLqTKW0yPB9wm1I1lTY9c8V/VnO48TdrV08yX5M3WIEwdm4YhsTkdZhmLNdU24VQHxhWKyHKoiFehu8j7diRsaCMO2jB0dVLrbtMHjUjCRWAIB/GoolkDIQnjWZgzaFJkOp/i9r53LDMlLxIxURi20fRgX7oAc0ObuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784543304; c=relaxed/simple;
	bh=azD60tDDLCUkYbyI/2jNMinqBPUsbrYtGgWSIBsg05A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=twWkR0DzdqhNwU9qUMbTp1WXop1LmSAodathESa4B7S21gUw08FbZjY+nP/EF3xm01wkntdKHCRF9XfJ9V7QUse+GztLzfT0oSZ2czuAvBun7hsAUlHB16LgSeZfQTk3J8kgVHHXpfbCzHbcAIIi6z/ckEcbGrlmLd991ZOKIJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sg2rsXc+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sg2rsXc+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057EF1F000E9;
	Mon, 20 Jul 2026 10:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784543302;
	bh=ZWFD+P/ScLaPhoYyW2AG1C8VHtfDssOAacG8huos2nM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sg2rsXc+ZFGbVyFT0YySEY7brfWJDD0N6T/Ivd8eyEJ+BTUTwyCTFpBCI1MYg/1AO
	 PahM+6QbAyksLUR5WNEkr3BW+BC4Yh3R4/TP6nfTuJZXGX/mZl3/cdAWMMYQWbvvtb
	 d7Z4yqjOdZ5otUraEy0Wwos0l9X9wRZ6OWQJOBtQ3KGvLXnC7J4wyijQToOh1D2PlK
	 A12vdLAVoZvvFXybDMHWeOwN/M30/6+26ZhHZgPu1FxAuCZx2v3KxGYtmZQBjr98rp
	 Ayax6B35Mqg8vR/xxIUr9Vp2LnWkLpF8RxSVvZ+KF4xicFjLbayS0Xj7yW+bS5iWA/
	 Sy2uUuzlT6XYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy:
 extend for dual-port and OTG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260720102222.251179-2-a0987203069@gmail.com>
References: <20260720102222.251179-1-a0987203069@gmail.com>
 <20260720102222.251179-2-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 10:28:21 +0000
Message-Id: <20260720102822.057EF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `#phy-cells` property uses an `enum` constraint instead of a `c=
onst` constraint, violating Device Tree Bindings guidelines.
--

--- Patch [1]: [PATCH v4 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: ex=
tend for dual-port and OTG ---
commit 676c30318df404b9fb25b710326b359f41a5cf10
Author: Joey Lu <a0987203069@gmail.com>

dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and OTG

This commit updates the Nuvoton MA35D1 USB2 PHY binding to support dual por=
ts
managed by the same hardware block. It modifies the #phy-cells property to
allow values of 0 or 1 for port selection, while preserving backward
compatibility. It also introduces optional properties for resistor calibrat=
ion
trim codes and over-current detect polarity.

> diff --git a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-ph=
y.yaml b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
> index fff858c909a06..1bd22dd0e5fc5 100644
> --- a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
[ ... ]
> @@ -15,7 +27,12 @@ properties:
>        - nuvoton,ma35d1-usb2-phy
> =20
>    "#phy-cells":
> -    const: 0
> +    enum: [0, 1]

[Severity: Low]
Does this violate the device tree binding subsystem rules for cell-count
properties? The guidelines specify that each cell-count property must have
a const constraint matching the hardware, rather than an enum constraint.

If the hardware requires different configurations depending on the variant
or backward compatibility, should this be enforced using conditional if-then
blocks instead of allowing either value unconditionally?

> +    description:
> +      When 0, the node exposes PHY0 only and consumers reference it
> +      with no cell argument. When 1, the single cell selects the port,
> +      with 0 for the OTG port (USB0, shared with DWC2 gadget controller)
> +      and 1 for the host-only port (USB1).
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720102222.2511=
79-1-a0987203069@gmail.com?part=3D1
