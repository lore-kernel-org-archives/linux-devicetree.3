Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF45A33438F
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 02:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785378171; cv=none; b=PoJTXdOndoanlVLyGPDzxG2/3yFqdCwAthYxUkPmRymV766v0eBlDHigrmU4mhKOMX9wto1UObVrlpZiulKqiLkXHA9FGIE5TqeFZWBWsO38P7QZUl2O/qLlQIhSVn+qemGKa7r4X0EyxHASZ3Yn2UYpXabgaCmLjXpKQKF4YBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785378171; c=relaxed/simple;
	bh=Hga2O1ThDhC2vEw5LRKHIv/BzqSSHYYaZ8Zv8UiNjAc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RbZjQtqD3GQQNUkeMKLtiiptfzhjeSE2Jiy8ER0A2IcdjqkSvDJLYv7hxBeHAH0OkEOyoeMm0MW6fea32cVWNXoBkDUPZUNGI20Cw13/KswpGzpq/TkbVmEPNAWIddehFnqsSIlb2JWQoLVTwTJTYZv88674sNaJVpNQrVhfDiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DaClreMT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DaClreMT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBA31F000E9;
	Thu, 30 Jul 2026 02:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785378170;
	bh=PkhuxXFkClyqkH7kY16cra6ae6dAyAfBNdHYRbyhu78=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DaClreMTCZbAGn2AIanhUtORfdtd4/DL+sHUA0BeiOMsz+28EYnu9k0d+AHj3Gxxy
	 C57fioL5/TwCXuwdFLcA+iPhmCN9IpvVpyS7X4tkQk3e8i93fyAolMeSpwGEpV8A5i
	 pPi/NF0AmpaOabOtwyHz69ondtCWh2rvX9MWJBaGJq7laCaRMBWZwCugTo/AEirBux
	 VgvlcDF2TcU6kkcFDk2hN3uX0LBrNQABLjr2hWTtQ/9s+5TC2p3mZfIDd0gpr4UGy5
	 xhCxg9HVJOBoWZgIwFSYCURNDoUAN2V3i0BmZlNpFrg2VSKEyaWIK4EOEjyqPz7S8/
	 YmXK0DTlvBPhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lachlan Michael" <lachlan.michael@sony.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260730021525.166811-2-lachlan.michael@sony.com>
References: <20260730021525.166811-1-lachlan.michael@sony.com>
 <20260730021525.166811-2-lachlan.michael@sony.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 02:22:49 +0000
Message-Id: <20260730022249.EFBA31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] The `endpoint` node incorrectly uses `additionalProperties: false` =
alongside a `$ref`, causing `dt_binding_check` failure.
- [Low] The schema omits a reference to `video-interface-devices.yaml`, for=
bidding standard camera properties.
- [Low] The MAINTAINERS entry references a non-existent driver file.
--

--- Patch [1]: [PATCH 1/2] media: dt-bindings: imx908: Add Sony IMX908 sens=
or bindings ---
commit b917e4497ee65daa99bbbfe30747c3a19b86a295
Author: Lachlan Michael <lachlan.michael@sony.com>

media: dt-bindings: imx908: Add Sony IMX908 sensor bindings

The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
with a MIPI CSI-2 output interface.
Add device tree bindings for the sensor.

> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> new file mode 100644
> index 0000000000000..6ab382d1cf34c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
[ ... ]
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        additionalProperties: false

[Severity: Low]
Since this endpoint node uses a $ref to video-interfaces.yaml, will using
additionalProperties: false here reject standard inherited properties?

For example, the dt_binding_check might fail because remote-endpoint is used
in the example below but is not locally listed in this properties block.
Should this be unevaluatedProperties: false instead?

> +
> +        properties:
> +          data-lanes:
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - dvdd-supply
> +  - ovdd-supply
> +  - avdd-supply
> +  - port
> +
> +additionalProperties: false

[Severity: Low]
Does this schema need a reference to video-interface-devices.yaml?

Without inheriting from /schemas/media/video-interface-devices.yaml# in an
allOf block, does this additionalProperties: false prevent users from
specifying standard camera sensor properties like orientation or rotation?

> +
> +examples:
> +  - |
[ ... ]
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2f9472c1a0907..5a0265e0676a2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25266,6 +25266,13 @@ T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
>  F:	drivers/media/i2c/imx415.c
> =20
> +SONY IMX908 SENSOR DRIVER
> +M:	Lachlan Michael <lachlan.michael@sony.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> +F:	drivers/media/i2c/imx908.c

[Severity: Low]
Is it intended to reference drivers/media/i2c/imx908.c here?

This file does not appear to be introduced in this patch, which might
trigger warnings from maintenance scripts about a missing file.

> +
>  SONY MEMORYSTICK SUBSYSTEM
>  M:	Maxim Levitsky <maximlevitsky@gmail.com>
>  M:	Alex Dubov <oakad@yahoo.com>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730021525.1668=
11-1-lachlan.michael@sony.com?part=3D1
