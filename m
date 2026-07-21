Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663513F58F0
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630693; cv=none; b=lyRfMUHn25lPfRvJgrgNi7jegJK7vcj/EuVmxq8/fcgPFe83WiV0rocx7TzDNBCXMVZ0tSmi0hFGkfGim73pmA2l43cJv+27DqNbXZykQTBv9s6mHZQsvbDPIYvVhsluHcN2UmFjsTyZlOzziiJI5xOhYFbwp1Ii/zEom6eYX74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630693; c=relaxed/simple;
	bh=YFlFx7cCns8nHzB+DaSjPLHDLj13LGHWrtT1GsQilFo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SOlgpIc3xCrL+PqDH5ejGTVzuN/zEAEwuezhPitPKA6z4q62PUNvcNNzUcVpVhRxD+nCmqx7rEwdy9UGfS6LZCROLUWWpSLYp8Ualp8YuK8FWyF2HL1nUEqQpmBQ7EpAhNlAsG7/JHzZwZoJfzJlBKaLxAwgBnywUYvqRDLQ9sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kajFEqox; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kajFEqox"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38FB1F00ADE;
	Tue, 21 Jul 2026 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784630674;
	bh=9hBthjgr7E/aXrQsIBWIqYG5hUCrpIPPsqW9lH28S4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kajFEqoxRzJ5H2hSH5Sw5TWUaf5P+SOw2K/nFn6W9wsLrTqGxbM21110en+Noo7ur
	 2+W6hK3BkPGPKSWoeiuq2a2jaOoqH1cV6p3UoLmcJAT41Hg8Kf+wuF64h4QZ/aa5JQ
	 KZGPxA45o65GiG7vztfPxEpryZRosBkA8r68cPb3tQGYzWkgpkVQ4dmTwuMjnRK2np
	 QyubuYSI4nki+iTjmKgPjeK+P38Sj9ws/GItsxLjpxtHPd6w7qQ0ojWhPvBcTHxttu
	 /Tn4cF9mx5tEw88I5Lm6qEFyjpBPG+kAVAvj7IAJQzTWRfO9JPaao4TUFW+jKYVjtD
	 07duebjn/FUHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 support per-direction phys
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Yang" <jason98166@gmail.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org, olteanv@gmail.com
In-Reply-To: <20260721-dcphy-rx-v1-v1-1-4fc83c0ccac9@gmail.com>
References: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
 <20260721-dcphy-rx-v1-v1-1-4fc83c0ccac9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:44:33 +0000
Message-Id: <20260721104433.F38FB1F00ADE@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `#phy-cells` property uses `enum: [1, 2]` instead of a `const`=
 constraint, which violates subsystem guidelines and creates a fundamentall=
y broken device tree parsing design.
- [High] The commit introduces a 2-cell format for `#phy-cells` to support =
independent TX/RX consumers, but the PHY driver actively rejects anything o=
ther than 1 cell, resulting in probe failures.
--

--- Patch [1]: [PATCH 1/4] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: su=
pport per-direction phys ---
commit 0077b5ec50ff5c6cc10afd337f193a9f090d6946
Author: Jason Yang <jason98166@gmail.com>

dt-bindings: phy: rockchip,rk3588-mipi-dcphy: support per-direction phys

The Samsung MIPI D-/C-PHY block on RK3588 drives a MIPI DSI transmitter
and, on the same PHY, can receive a MIPI CSI camera. Describing both as
independent consumers of one PHY requires the direction to be expressed
in the devicetree.

> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-d=
cphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcph=
y.yaml
> index c8ff5ba22a86b..53d6951375667 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.ya=
ml
> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.ya=
ml
> @@ -20,12 +20,22 @@ properties:
>      maxItems: 1
> =20
>    "#phy-cells":
> -    const: 1
> +    enum: [1, 2]

[Severity: High]
Does this violate the subsystem requirement that cell-count properties must
use a const constraint?

If a board developer updates the PHY provider node to #phy-cells =3D <2> to=
 use
the new CSI consumer, will any existing DSI consumer relying on 1-cell pars=
ing
fail to probe?

The function of_parse_phandle_with_args() strictly enforces that the consum=
er's
argument count exactly matches the provider's #phy-cells count.

Additionally, it looks like the driver hasn't been updated to support this =
yet.

In drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c, the translation callb=
ack
samsung_mipi_dcphy_xlate() still explicitly checks for exactly 1 cell:

	if (args->args_count !=3D 1) {
		dev_err(dev, "invalid number of arguments\n");
		return ERR_PTR(-EINVAL);
	}

Will this cause any device tree attempting to use the newly documented 2-ce=
ll
format to fail to initialize at runtime?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-dcphy-rx-v=
1-v1-0-4fc83c0ccac9@gmail.com?part=3D1
