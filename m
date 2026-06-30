Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B7A283FD9
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827636; cv=none; b=OgohjxMfSq+rx7+cQSu8b3r/aPrgBEe7ikOf7npNvqS8rvrCwPfmx0QIsS8TIEe2aAjmRnlBZf9+eMw73mmoqWBaLP4M/F93tPZv0uWPAvOIkWrQkUCYM+/pBLySZuEzImQ0d4ubZUG/B7wwcw7cswhJXpaBmQ7/6kw7YTOm5Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827636; c=relaxed/simple;
	bh=C/ENO/XakhAZC18KRnk+dUGOIYwdEJyxgwKgPN7DkiY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sDNsvKOgYbEtwzb0zoCW8/BQnufQslcW33uSgxVXc9gPbxOeWRcCaryJlzNlMH/SyfMqwkKNhH1aL87fAugX2aL2R29EIsab0jSm3gZha0/CBrtcnF/dVHRJcSWH/Ez8ic4aPCtbDGSv+6HG6nQ2qH5pkOunYH1Hpn6M5q1zrJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vs5eWDcC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vs5eWDcC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7F01F000E9;
	Tue, 30 Jun 2026 13:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782827634;
	bh=qw77gMUEuKKUp+Ik7BNUZvNOL0g9M8dreep+u2XUUmY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vs5eWDcC+XIOxMUsBorvgUG4xVcjksy4y8asJJVq9B5NCxbR0QrY0NTrhpT0xJuOq
	 se9KUtVtigVRZA21Df6TzB+pANwWO+wTWlHr8/pgAWktpPGYYo3/LADBQD3IukeN7e
	 a9hBmGklAWF9hdFpFd7rMyydYhBlQ9XIN8DLDvbe6qsfudqMqVDXvjWen2hgVKnYkE
	 7xHcv0c6oAA3psmmeoz0oZy5eyvUXqHz484to4+ReONAFKGDq26p7YSAwYT2ijZiVF
	 qRxJR2QdpYSsepi2FiQ4TcuHbulcxXtPVSq9VByrXtOQoJVs4Rq4C1l2koowCsIa7Q
	 p2NN8lou6Im+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net-next 1/2] arm64: dts: ti: Add PLL1 refclk to
 J784S4 SoC SERDES node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gokul Praveen" <g-praveen@ti.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, olteanv@gmail.com, vkoul@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260630134324.61085-2-g-praveen@ti.com>
References: <20260630134324.61085-1-g-praveen@ti.com>
 <20260630134324.61085-2-g-praveen@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 13:53:53 +0000
Message-Id: <20260630135354.4D7F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] Adding a third clock to the 'serdes2' node violates the 'phy-cadenc=
e-torrent.yaml' DT binding. The subsequent binding update in the series is =
logically incomplete and fails to resolve the validation error.
- [Low] Missing whitespace after the comma in the 'clock-names' list.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the commit fails=
 to comprehensively fix the issue. It adds 'pll1_refclk' to fix multilink c=
onfiguration for 'serdes2', but ignores identical SERDES nodes ('serdes0', =
'serdes1', 'serdes4') that share the exact same bug.
--

commit c37d528887d49433e9d33970e77ad622c557ad5e
Author: Gokul Praveen <g-praveen@ti.com>

arm64: dts: ti: Add PLL1 refclk to J784S4 SoC SERDES node

This commit adds the PLL1 refclk to the clocks and clock-names parameters
for the SERDES2 node. It addresses a multilink configuration failure that
occurs without PLL1 being present in the clocks list.

> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot=
/dts/ti/k3-j784s4-main.dtsi
> index 78fcd0c40abcf..da8d582574d03 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> @@ -122,8 +122,9 @@ serdes2: serdes@5020000 {
>  			resets =3D <&serdes_wiz2 0>;
>  			reset-names =3D "torrent_reset";
>  			clocks =3D <&serdes_wiz2 TI_WIZ_PLL0_REFCLK>,
> +				 <&serdes_wiz2 TI_WIZ_PLL1_REFCLK>,
>  				 <&serdes_wiz2 TI_WIZ_PHY_EN_REFCLK>;

[Severity: High]
This is a pre-existing issue, but does the same fix need to be applied to
the other identical serdes nodes?

Other nodes like serdes0, serdes1, and serdes4 in
arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi share the exact sa=
me
configuration issue where TI_WIZ_PLL1_REFCLK is in assigned-clocks but abse=
nt
from clocks:

			clocks =3D <&serdes_wiz0 TI_WIZ_PLL0_REFCLK>,
				 <&serdes_wiz0 TI_WIZ_PHY_EN_REFCLK>;
			clock-names =3D "refclk", "phy_en_refclk";
			assigned-clocks =3D <&serdes_wiz0 TI_WIZ_PLL0_REFCLK>,
					  <&serdes_wiz0 TI_WIZ_PLL1_REFCLK>,
					  <&serdes_wiz0 TI_WIZ_REFCLK_DIG>;

Since serdes0 is also configured for multilink (PCIe + USB), will its
configuration fail without a similar update?

> -			clock-names =3D "refclk", "phy_en_refclk";
> +			clock-names =3D "refclk","pll1_refclk", "phy_en_refclk";

[Severity: Low]
Will this addition cause make dtbs_check to fail?

Adding a third item to clock-names exceeds the currently defined items in t=
he
phy-cadence-torrent.yaml binding.

Even if a subsequent patch in the series updates the schema by modifying
maxItems and the enum for the second item, dt-schema enforces
additionalItems: false for arrays.

Unless a third item definition is explicitly added to the items array in the
schema, won't validation fail for this node?

[Severity: Low]
this isn't a bug, but there is a missing space after the first comma.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630134324.6108=
5-1-g-praveen@ti.com?part=3D1
