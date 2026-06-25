Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC2F28506F
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782356125; cv=none; b=Bn2ua386aGCuyhdilEXKQl2DwujWsRk+UuHh4oA+bgvKjEakusZvKUr1kWkJD6W1HnkgesX9ExaIs9/xvnaTHuvYjzIda8LII+2R4Ep1WohL1g/YghH6ttaFhmEkcuRR3I8on05WRFvZut47Eb2w9FpZ7CoHZDq2lZCeZWqAxF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782356125; c=relaxed/simple;
	bh=lrS5FPcPiadpg+181pgM7ZIQlhhBc32Ff8IGhnYGrvE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RHa51r2fTMwJrfE97zxMbS3CKz13LTVzpzAZ/AB4BjlfSkfp8CqqMdcb4a2ZIvI2VJ8zW/djZIbyaDLxHkvYA4E81QN+0tGrInCjBze3//eZj27mk/NZMerU08Dev4NeAINvop1lnpxlp9c3UMsflPc8cd/fN5HZSwZS5Yog5ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMzR4ccT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMzR4ccT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FF21F00A3E;
	Thu, 25 Jun 2026 02:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782356124;
	bh=aQq9VR65/epH02J8BfCOw5J09bG5DEG5dWWp3ygl79g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kMzR4ccT3ahuNBqjHn0JxGG5Z/xZDC0wyrLhBVdHtPpVjFI9C+SzteJuWynRu5LSe
	 UGDxAHd0k9NYCQJBl3wgv0MB0y3nMzJHtghHcfENUx4Wd4VpkQov0/b+vgB46BoD6M
	 mI8wr/DkezIRMKm+1Q7tyx832rO5/5VCX6VY6ZLoLg62nDNHENI4FqOx3lmgNYz+iA
	 gErO4ly7Lvc+5H+sH/oQQ1NXmJzV9lJbOdnxsL3TtqJFmiIXiMyGpE/ndCOK+WU8Hs
	 oESB7sCvl74LKXMQfer0extmaTU4vmDN1ckk1n5eI7Syl2S7xtS5cKweJKalEE4zLQ
	 jxNCfETFuOKMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: reset: nuvoton,ma35d1-reset: add
 simple-mfd and child node support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260625023958.569299-2-a0987203069@gmail.com>
References: <20260625023958.569299-1-a0987203069@gmail.com>
 <20260625023958.569299-2-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 02:55:23 +0000
Message-Id: <20260625025523.B0FF21F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The child node pattern forces a unit address and `reg` property,=
 but the intended child device's binding strictly prohibits `reg`, creating=
 a validation Catch-22.
--

commit 64487b3a088a3cb8b25dc58df4266bfb284945b3
Author: Joey Lu <a0987203069@gmail.com>

dt-bindings: reset: nuvoton,ma35d1-reset: add simple-mfd and child node sup=
port

This commit updates the MA35D1 reset binding to allow simple-mfd and child
nodes. It adds #address-cells, #size-cells, and a pattern property to suppo=
rt
instantiating children like the USB PHY.

> diff --git a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset=
.yaml b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
> index 3ce7dcecd87ae..1fda7e8f4b5d1 100644
> --- a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
[ ... ]
> @@ -26,6 +28,16 @@ properties:
>    '#reset-cells':
>      const: 1
> =20
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    type: object

[Severity: Medium]
This pattern property forces child nodes to have a unit address, which
inherently requires a reg property to avoid a dtc warning ("node has a unit=
=20
name, but no reg or ranges property").

However, looking at the child PHY binding=20
(Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml), it=20
strictly prohibits reg via additionalProperties: false.

If we provide the reg property required by the parent's unit address, it wi=
ll
fail the PHY schema validation.

Additionally, the PHY driver doesn't seem to act as a true MFD child. Looki=
ng
at drivers/phy/nuvoton/phy-ma35d1-usb2.c:ma35_usb_phy_probe():

    p_phy->sysreg =3D syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "n=
uvoton,sys");

The driver hardcodes its offset and uses a phandle instead of expecting a r=
eg=20
property.

Could this create a validation failure for the child PHY node, and are the
bindings and the driver structurally out of sync here?

> +
>  required:
>    - compatible
>    - reg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625023958.5692=
99-1-a0987203069@gmail.com?part=3D1
