Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE30C2609FD
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827325; cv=none; b=GRdsaGo9DRORBoR6RWEL1c1gLpSLfOo02LZeFmoZJpuFVwQbkv6iv8/0Z6r2ukyItpm7U93SAmcZw8xRxR52+3N+0TSBOxJV95kIM6aPGoMWlTBkEplDtZgfU+0+VIuPYUxaMtC0EkDRZm/MvFB/C/UCTojrlVSTNhUvb+cbeTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827325; c=relaxed/simple;
	bh=HZK1rC+TXdSH56mJ48tJAX4Ydk33f0VmdJChNGHQu2E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fFM1oWWNRGJWJMVHP8Ria2wI8iGzxiWD4u1A1VCB/kY0NBY5NlP0XGrMOklkO4wrj3pPt1oALQ2u7YY/1dDcZd+Qsdn4SeGjAHYrq2JjrxJF8SHgVFZsdfReuv4oJi6mGnr857waXT1eHKQWTitEPnH+St2N8pQVeTBGZOiJzI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4TW4eew; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4TW4eew"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113081F000E9;
	Tue, 30 Jun 2026 13:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782827324;
	bh=BOW9nhuhwQ2QWtjxhXj58gSDnVPAgMk8FWORBbZz3Ks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B4TW4eewik/WUo7jG0TaZuS5i9ee9wqnGTxEYxapryYzOvBDNV2JdsGXOEKpX12ZM
	 LsIwGe327XuieX2p2IceY0r9QaT5ZBI5Y3QHXF9BX4LBM8sBEKy2UvMVRDqQ2f3rFP
	 wi2ST6bM+hT1N2UmFhwSQW/vvlwxn+eacBq3Aj9+3LdM0upNBndLOzHTmg2l26VDI3
	 YbGOLC50iUvYI1GDGbpNHw+nPFw4S5hPiqkTw1gGDBh7xZKA+KimzU1V2cUs13Zkv6
	 GNWgjv3+In1Ll42Po9cs8WvL7Z3W8TxuNvRizb2aMsmfl0fcqah7px5mbhPFWOF4Ld
	 abJn4U954HRjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net-next 2/2] dt-bindings: phy: cadence-torrent:
 Update property values to support 3 clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gokul Praveen" <g-praveen@ti.com>
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260630134324.61085-3-g-praveen@ti.com>
References: <20260630134324.61085-1-g-praveen@ti.com>
 <20260630134324.61085-3-g-praveen@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 13:48:43 +0000
Message-Id: <20260630134844.113081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `clock-names` schema definition incorrectly restricts the ar=
ray to a maximum of 2 items and allows duplicate clock names. While the com=
mit correctly updates `clocks` to allow `maxItems: 3`, it only modifies the=
 second element of the `items` array for `clock-names`. In `dt-schema` (bas=
ed on JSON Schema), defining `items` as an array of schemas implicitly limi=
ts the maximum number of items to the length of that array (because `additi=
onalItems` is implicitly false). As a result, a device tree specifying 3 cl=
ocks will fail `dt_binding_check` validation. Additionally, adding `refclk`=
 to the second element's `enum` creates a logic error, permitting redundant=
 sequences such as `clock-names =3D "refclk", "refclk";`.
--

commit d737f6b2f91949e839e21f62c39ca9db8f322775
Author: Gokul Praveen <g-praveen@ti.com>

dt-bindings: phy: cadence-torrent: Update property values to support 3 cloc=
ks

This commit updates the Cadence Torrent PHY device tree binding to support =
up
to 3 clocks. It increases the maxItems of the clocks property and updates t=
he
clock-names property.

> diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.ya=
ml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> index 9af39b33646ac..54fe78da297a2 100644
> --- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> @@ -34,7 +34,7 @@ properties:
> =20
>    clocks:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
>      description:
>        PHY input reference clocks - refclk (for PLL0) & pll1_refclk (for =
PLL1).

[ ... ]

> @@ -47,7 +47,7 @@ properties:
>      minItems: 1
>      items:
>        - const: refclk
> -      - enum: [ pll1_refclk, phy_en_refclk ]
> +      - enum: [refclk, pll1_refclk, phy_en_refclk ]

[Severity: Medium]
Will this fail schema validation when a device tree specifies 3 clocks?=20

Because the items sequence for clock-names only defines two elements, it
implicitly restricts the array to a maximum of 2 items. Even though the clo=
cks
property was updated to maxItems: 3 above, the clock-names array is now
mismatched and will reject 3 items during dt_binding_check.

Also, does this unintentionally allow duplicate clock names? Adding refclk =
to
the second element's enum makes it possible to define a redundant sequence
like clock-names =3D "refclk", "refclk".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630134324.6108=
5-1-g-praveen@ti.com?part=3D2
