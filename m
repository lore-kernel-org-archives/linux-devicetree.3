Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF674D90D5
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535683; cv=none; b=jdAGAJpAMcNnDVOJJYe2p0NMm8iAZEOhrwSZFhL0U83rRPxIK3DwwYxqApuuOatHqUxby4C+zRbCzKmDYNoCyjSkQns9otAOWG1hA0dqAJ15u+ZGDvmttkvqtcu9GTdaJQ/gmOyqs8qiMpPsxHzDjCHlaYinupS3NCJrWC3oL9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535683; c=relaxed/simple;
	bh=JdACk3DL+Pjn0PTUx+BuKEX9QojfQ39b8C9uXW4SA/E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CmJDhw+vmx+VzZBqumhOMhL6oqiwLbJqirTjuMYNxIxf/Ppt7ZL792/iGRJstHXBD2ZvnYrnH3rgb9HJw3hrWUbUnLjlCJUbcGLvd0NEPJqVREb3oMKSja34dIxEDfMpIqrwQzMzjHxDcZv/dat8kY69FxwYLgAk0XQiGHfk2B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nxdds6+9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nxdds6+9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492C2C2BCB0;
	Mon, 11 May 2026 21:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778535683;
	bh=JdACk3DL+Pjn0PTUx+BuKEX9QojfQ39b8C9uXW4SA/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Nxdds6+9+GLX4ji5H9F34ZhKJFA8N+/lImfDRUha1PiDQixN8cpUis+z/KrtRBW2J
	 cFbs0YKaMYVSWBWhsiOBJSIOdlvqFdXz+shKiYIgMkOrFKHCRQpVjsw4hyDtrOD/ye
	 cWPec8z2lg5rBKbQi5gb9ejCDKCV/ZOx/BjXWleF0Z+vAV/wtOzdDlQJ9nGeHC/NKd
	 XN7vJwFw6ml8QmLr2DfA3buEa3uYR8QNRr3XPdXY1xbe1X0KtUPnX9ObDKgY/YhWdd
	 5xxVCBwijD+WBtOmR0YizvGyIxUB/Z6ZkNbdVDdgS2125KbnN4sjnmLaLEXZn0Sv5F
	 nb/lo1ka/uu9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: usb: add Rohm BM92TXX Type-C
 controller
Reply-To: sashiko@lists.linux.dev
To: "Alexandre Hamamdjian via B4 Relay" <devnull+azkali.limited.gmail.com@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260510-bm92t-v1-2-dff3c9d22426@gmail.com>
References: <20260510-bm92t-v1-2-dff3c9d22426@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 21:41:22 +0000
Message-Id: <20260511214123.492C2C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Bypassing standard `usb-c-connector` binding in favor of vendor-=
specific properties.
- [Low] DT schema naming violations and missing type definitions.
--

commit 186a26fac988413623e6d85b4dd282c2ff87f8bf
Author: Alexandre Hamamdjian <azkali.limited@gmail.com>

dt-bindings: usb: add Rohm BM92TXX Type-C controller

Add the device-tree binding documentation for the Rohm BM92TXX family
of USB Type-C and Power Delivery controllers. The device is controlled
over I2C and signals state changes through a dedicated interrupt line.

> diff --git a/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml b/Docu=
mentation/devicetree/bindings/usb/rohm,bm92t.yaml
> new file mode 100644
> index 0000000000000..007f70a8f5bb1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml
[ ... ]
> +  vbus-source-supply:
> +    description: VBUS source (provider) regulator.
> +
> +  pd_bat_chg-supply:
> +    description: Battery charger regulator gated by Power Delivery state.

Does this violate the DT property naming convention by using underscores
instead of hyphens? Should this be named pd-bat-chg-supply?

> +
> +  rohm,vconn-en-gpio:
> +    maxItems: 1
> +    description: GPIO controlling the external VCONN switch.

This property uses the deprecated -gpio suffix instead of -gpios, which mea=
ns
the dtschema core will not automatically assign it the phandle-array type.
Could this be renamed to rohm,vconn-en-gpios, or alternatively, could an
explicit type definition be provided?

[ ... ]
> +  rohm,dp-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [2, 4]
> +    default: 2
> +    description: Number of DisplayPort lanes to negotiate.

This isn't a bug, but should this binding use a connector child node with
compatible =3D "usb-c-connector" instead of defining custom vendor-specific
properties for USB Type-C and Power Delivery features like rohm,dp-lanes and
the current limits?

The standard approach is to use properties like source-pdos, sink-pdos, and
standard endpoints for data lanes.

[ ... ]
> +  rohm,dock-power-limit-disable:
> +    type: boolean
> +    description:
> +      Disable the lower power limit applied when a dock is detected.
> +
> +  rohm,pd-5v-current-limit-ma:
> +    description: Charging current limit in mA when 5V PD contract is act=
ive.

These current limit properties do not use a standard unit suffix recognized=
 by
dtschema (such as -microamp or -milliamp) with auto-typing. Should they
include an explicit type definition like
$ref: /schemas/types.yaml#/definitions/uint32?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-bm92t-v1-0=
-dff3c9d22426@gmail.com?part=3D2
