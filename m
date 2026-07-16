Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E21834403A
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 22:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784240647; cv=none; b=CUIjIxjQzCTjSNThH7BrU4QA4qpDCWMVKGW8h1uhRPixawqkGi06e0sMHAPaUO/unv4WwEdIy+fZ2C4BwCZ6iOkudr8IOaNVCk573xIvtNcybAZ9ebASW0Ul+Ut/L47pBikMxEZ/K/EW3MZPS4OCJ98Ca00Xxwp7sf9X3AO+idA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784240647; c=relaxed/simple;
	bh=dwbUUGau/FBRMYP45tsb39aoeYWDIMQCiWrA64zKhfU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=akpo0Zux8FWOcJiCunlqT4p5E3AuYU+JIMzIwdk4VUAF4wU343OonmrnkaFpW1v5/Cb5hA4OmVVXIUOuWfc7fcHHtVxRkYMg/l7/+uayiXwIgqdscgaUYz8EF5gvzd/jFpOmw6T8wBG3x16nYAdTm+dYYe5jO9o7ynvhPDqG3eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAeJmuuf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAeJmuuf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585931F000E9;
	Thu, 16 Jul 2026 22:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784240645;
	bh=JXY7lxiDGoWfZKZC0zMpII1Kxrjnph5++CDvXGZo4Sw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZAeJmuuf5ZI99S04ZDPP9WwL/BU8WFEtJ79WhXwl6hCgQyqiig3KrA2+5605vvYjG
	 W99pesyPrzgs2i6NLcK5Ck8L8bdmu7qgBlcptUcJ+93k9gmLe1homXlygjdXY4wfNu
	 C3s/+p3t5R8nBA2vD6hqPQuponVh8hJvxoDjP1LktnPoJAaWkRpSTRtpphFS0v05ZI
	 MqUg5CCTU7u/Kto9J4Ez/GnVL7JslOXqwdCrV0WS/dD0i1TJJfQr4y3Spekce0S7TT
	 7BMHyT04HjfxENPeQ9vsZw4OVk/3o11wUZ0Jx2Bigh+qtaxKALv6+N/zC2geOor7co
	 E0E4wZG9nPtsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/13] dt-bindings: phy: Add zx297520v3 USB phy
 documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: linux-phy@lists.infradead.org, conor+dt@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org
In-Reply-To: <20260717-zx29clk-v7-1-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
 <20260717-zx29clk-v7-1-408411cfcf36@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 22:24:04 +0000
Message-Id: <20260716222405.585931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The example uses an undocumented compatible string 'zte,zx297520v3-=
topcrm', which will break `make dt_binding_check` for this commit.
--

--- Patch [1]: [PATCH v7 01/13] dt-bindings: phy: Add zx297520v3 USB phy do=
cumentation ---
commit 4c69b2717ebf9691d299b4744633e7788d392913
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

dt-bindings: phy: Add zx297520v3 USB phy documentation

This commit adds device tree binding documentation for the ZTE zx297520v3 U=
SB
and HSIC PHY. It defines the required properties for the PHY, which acts as
a child node to the topcrm controller.

> diff --git a/Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy=
.yaml b/Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
> new file mode 100644
> index 0000000000000..8bad9365d5cc0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/phy/phy-zte-zx297520v3-usb.h>
> +
> +    topcrm: clock-controller {
> +        compatible =3D "zte,zx297520v3-topcrm", "syscon";

[Severity: Low]
Will this undocumented compatible string cause a regression in
`make dt_binding_check` during bisection?

Since the "zte,zx297520v3-topcrm" binding is added in the next patch, evalu=
ating
this commit on its own will result in validation failures because the strin=
g is
not documented in any schema and is not an allowed fallback in syscon.yaml.

Additionally, does the example node need a "reg" property since it includes
"syscon" in the compatible string? syscon.yaml requires it, which may lead =
to
further validation errors.

> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        #reset-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-zx29clk-v7=
-0-408411cfcf36@gmail.com?part=3D1
