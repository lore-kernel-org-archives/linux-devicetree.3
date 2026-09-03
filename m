Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD85136DA1D
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 10:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430926; cv=none; b=s7YdpMqmDYc/IfO/xYvdXxK5/csn7+yAaA4LxvCA3KDv1e/qyIoijzZ5koSKEsjFAavG5X/KirnmGG8yxrcAPRuZu+4PUBzIXmjptB/4cwl3JcMB/TZ9089naD6eIuY82dxDuDIQfRhg7IBhyvoEt8JftsAXWOKqgw8x5RUKkQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430926; c=relaxed/simple;
	bh=dQcOtkFCtZ2FGlgecV8DgpxwWJJ/gCifjkBKdKeKoPs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tX3qw73DyasFTJ1GN3uvgKH8QfTIlQZXwcZO7wTcVabEovH/mdBCqiWUDYdqyn5OAbS66Hi7/WzLnI94WB6glN74PFGe1rSIqNOB2cVR4yX/AP0mWia3pi0Fjn1XjIVdIw3uJbsTU6M/0qUNDEvNW8QtVGhAGkR+hb08oRDhWsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TGOPsTUd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TGOPsTUd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4B21F000E9;
	Thu,  3 Sep 2026 10:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788430924;
	bh=9PAa0Q7pLxw9MbtNirwJeehxI9Ihegolpn9wXP7PtRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TGOPsTUd9pIjnQ3izPKjkIOoK7GA7V4qjefgaCygYAvq+zNarpDAM4/4WxSwFVMcy
	 8JJ9+6OgPXj55MEOWlYNgTTh+oUOdYE5o029mYoDrZgj8KSwTZcca4Q3E/SPDwA8NW
	 eA/TcZhxQDv6Hx9AfdHnhYoctuI25UDYj7Wp9D0RLqimZuOHNn8ozrZTIwiEYtVCni
	 gkQZR0Axy+FSWTjrXftHR70P4v54gKsnJwSV8oaiVDE0X7wqHXCB/vOZvQyjsYgeqj
	 8SmfnjKKCID6VXAMQ0WXF3wotXr0mZn5Lcnv6oJC6LYaf7UoOSF/VivBTw3+fL+T1M
	 VRdU5xunK5THg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: usb: Add ITE IT5271/IT5272/IT5273/IT5274
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amber Kao" <ite_pd@ite.com.tw>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260903-it5271-binding-v1-1-1abd2c8cea85@ite.com.tw>
References: <20260903-it5271-binding-v1-1-1abd2c8cea85@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 10:22:03 +0000
Message-Id: <20260903102204.3D4B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The schema fails to require `#address-cells` and `#size-cells` for =
the parent node, despite mandating child nodes with unit addresses.
- [Low] Misplaced entry in the MAINTAINERS file disrupting alphabetical ord=
er.
--

commit 837acb02e0d2d80f62a7b268e076746b70c411ef
Author: Amber Kao <ite_pd@ite.com.tw>

dt-bindings: usb: Add ITE IT5271/IT5272/IT5273/IT5274 support
   =20
Add device tree binding documentation for the ITE IT527x series
(IT5271, IT5272, IT5273, and IT5274) I2C-based USB Type-C Power
Delivery (PD) controllers.

> diff --git a/Documentation/devicetree/bindings/usb/ite,it5271.yaml b/Docu=
mentation/devicetree/bindings/usb/ite,it5271.yaml
> index 0000000000000..29cd7add9bde2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ite,it5271.yaml

[ ... ]

> +patternProperties:
> +  '^connector@[01]$':
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    properties:
> +      reg:
> +        maxItems: 1
> +    required:
> +      - reg
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

[Severity: Low]
Should `#address-cells` and `#size-cells` be added to this required list?

Since the schema mandates child connector nodes with unit addresses (`reg`),
device trees missing `#address-cells` and `#size-cells` in the parent node =
will
pass schema validation silently, even though they are structurally invalid =
and
will trigger `dtc` warnings (e.g., node has a unit name, but no reg or
#address-cells).

> +
> +anyOf:
> +  - required:
> +      - connector@0

[ ... ]

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4dfc1fb14ef72..1a35242257fc8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13940,6 +13940,14 @@ T:	git https://gitlab.freedesktop.org/drm/misc/k=
ernel.git
>  F:	Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
>  F:	drivers/gpu/drm/bridge/ite-it66121.c
> =20
> +ITE IT5271 TYPE-C PD CONTROLLER DRIVER

[Severity: Low]
Does this new entry disrupt the alphabetical ordering of the MAINTAINERS fi=
le?

"ITE IT5271 TYPE-C PD CONTROLLER DRIVER" is currently placed after "ITE
IT66121 HDMI BRIDGE", which violates the expected alphabetical sorting.

> +M:	Amber Kao <amber.kao@ite.com.tw>
> +M:	ITE PD TEAM <ite_pd@ite.com.tw>
> +R:	Yaode Fang <Yaode.Fang@ite.com.tw>
> +L:	linux-usb@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/usb/ite,it5271.yaml
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-it5271-bin=
ding-v1-1-1abd2c8cea85@ite.com.tw?part=3D1
