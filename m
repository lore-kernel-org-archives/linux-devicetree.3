Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DCE528428
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 20:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789764528; cv=none; b=rETr2X1N4QEexvOoYdfW09dFw5A5VDUl0GVKJSmL5y6t3YNXuDuGQIUQVjstOBDJFxEdo/01rJC8lvAk2MRaMmntUV/R+U2voB7RwrbnzKnXob+esq0qV1jhylzSbahksRAzg+BKU/BUKhQ76QfQiBURuea9X17K/jcnt3RdPKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789764528; c=relaxed/simple;
	bh=sqvTwy6n56Tcs/mz6+1tFW6WVLQbGZasaOwYxeRZC/Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hkxPjtv5+XCQk0NCjuTWoziKSakTRCgrr9iD8DdD0EKvoT1a/NdVvQa/aA0h/foUy24hc+8eD+i1CwLNE0zUluU1KY9rKwWlNW/tmZUemR5IpdoqcGbzkT4PqUS1imoyNuTQPMZyf7dY3ooWdq2TMwYw13Tg/Wmd41VHi7QLfUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OwJNN4tX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwJNN4tX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301F81F000FF;
	Fri, 18 Sep 2026 20:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789764526;
	bh=Q46hlk/ht4Qwq3PLuLMgIqIWKf6gxNefPEvWDDgXsII=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OwJNN4tXcpurURfx5Ao194w2ideTpdulHFU0B3fH9+iNEirHn9Il7kQA+VY9FoMPH
	 QzCD9UjVWcLbqYAvF7xSIagPA3SGpGQWfWrNgKa/OR351UVrXKXI4UfiZ6Tz6Pl9gl
	 +rxn9NF3MBcdHX08VyePnMn7t1hwoRBKLj9/kpaj+I6rer+8l0sBEV5f9lshBG02ap
	 COITqrqrWY6ZkbeuRGymFjYxvMCarQnP+cPkhG2ziTeYOaOhIK+orX5R6/ZmywUV3O
	 RbF72ErOL8AMOneqDRjCaOqO5w2RCjzSTSmb+Ss0AogM2MSm82LBZl8whg3oH4vXYl
	 5ErDYCPblygVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 05/11] arm64: dts: rockchip: rk3568: add
 XPCS and fixed-clock nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, robh@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, neil.armstrong@linaro.org, conor+dt@kernel.org
In-Reply-To: <20260917204624.2427486-6-coiaprant@gmail.com>
References: <20260917204624.2427486-1-coiaprant@gmail.com>
 <20260917204624.2427486-6-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 20:48:45 +0000
Message-Id: <20260918204846.301F81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: dts: missing required properties in disabled xpcs node
--

commit 645b03337d217aa5103d2a837ab8fed754652108
Author: Coia Prant <coiaprant@gmail.com>

arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes

This commit adds the XPCS device node, its pcs-mii sub-nodes, and two
fixed-clock reference nodes to the RK3568 SoC device tree. The XPCS node is
disabled by default and intentionally omits the phys and phy-names
properties in the dtsi.

> The XPCS node requires a reference to the appropriate Naneng Combo PHY
> via the phys property.  dtbs_check only validates required properties
> for enabled nodes, so the SoC dtsi does not provide phys/phy-names:

[Severity: Low]
Is this assumption about dtbs_check accurate? dt-validate enforces
unconditional required property lists against all nodes matching the
compatible string, regardless of their status.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3568.dtsi
> index 3bc653f027f1f..227d03e336043 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> @@ -110,6 +110,51 @@ sata0: sata@fc000000 {

[ ... ]

> +	xpcs: ethernet-pcs@fda00000 {
> +		compatible =3D "rockchip,rk3568-xpcs";
> +		#address-cells =3D <1>;

[Severity: Low]
Will this omission result in missing-property validation warnings during
make dtbs_check for any board including rk3568.dtsi?=20

Because the rockchip,rk3568-xpcs schema unconditionally requires phys and
phy-names, dtbs_check will likely flag this disabled node for lacking them
when validating the compiled dtb.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917204624.2427=
486-1-coiaprant@gmail.com?part=3D5
