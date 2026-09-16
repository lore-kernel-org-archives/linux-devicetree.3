Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AF3371CE9
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570218; cv=none; b=lsHvbUC0fVooT99aNm79pKsS+9j8LjGTO1GZjq7DXt+IWGEHE2UyI1KAVG/lHx1EgcQLp2D0wuacJCasWxsSjqAtdI+6KeEQe2mNTrpIbpuxX4yUT5aH6bjog5JAKBsbJfr1KtID/hsC6g9mV0l4Bp72TOShg2k+WPh4vo/85yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570218; c=relaxed/simple;
	bh=1d5qJAFJms9n60xTYNB9Yc7AcNrP+tW3zFLLYoRRebU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s8Npi8e8xAGQeZWEJBma7d1gUV56il9T7NQDQnOxbrCm/7S/KM3XrAHCRVVgwIY0IQm8xrOiyGBPV/TkFNIbtpUCLj2sX2GL+XNgCCmWd9z81iuE8QkYhafhgPEDRdFE2OkAKA7qpXqZCdnTkwVs1ZlPWVjLOrFetdHWfEFG+0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRzbbqYs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRzbbqYs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DBA1F000FF;
	Wed, 16 Sep 2026 14:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789570217;
	bh=Gg/SypJTu4ALF9JeRgpvVI3eZRvGFTB62ryl3J9wUYw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bRzbbqYsfdCneqYs1DGHlCPrmfSrGFcoNNH4nHW6iMcKsYp+j6rAjb5EGCm6UVczi
	 qPq5hL0TrU2Ui6CRdpMazeAUvxZfXCPdmEvD5XAsY0JXORFIXa1NhQq/skxLELCzpf
	 LiDbD/5t3AzL0RT+JTNVIdeOKVudYPALhmEMk5oPY/1cGw07ldtmFNiQciQV/Ghf/w
	 4UxV7UM5+4zxlv1LT88PNbKwZLM7+n7Y7JnbQ2sVF18tyBK6FcU/7ZoJ/D+DrKwi0B
	 jhA23wgslS+gbpBKFdcnZ1cRUt+hgGkOt+nEO/chHAkxUBFc8ltWHaWe6BS1XYL//0
	 g4WDCxE/nieiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 05/11] arm64: dts: rockchip: rk3568: add
 XPCS and fixed-clock nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, wsa+renesas@sang-engineering.com, olteanv@gmail.com, devicetree@vger.kernel.org, robh@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260915123802.1561724-6-coiaprant@gmail.com>
References: <20260915123802.1561724-1-coiaprant@gmail.com>
 <20260915123802.1561724-6-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 14:50:16 +0000
Message-Id: <20260916145017.00DBA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: incorrect fixed-clock modeling for XPCS generated clock
--

commit 18edca8a678c045ba2fe3270b1f3ca0505b94baa
Author: Coia Prant <coiaprant@gmail.com>

arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes

This commit adds the DesignWare XPCS node and its sub-nodes for the RK3568
SoC, mapping it to the APB3 bus. It also adds two fixed-clock nodes to
provide reference clocks for the GMACs when operating with XPCS.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3568.dtsi
> index 3bc653f027f1f..227d03e336043 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
[ ... ]
> +	clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <125000000>;
> +		clock-output-names =3D "clk_gmac0_xpcs_mii";
> +		#clock-cells =3D <0>;
> +	};

[Severity: Medium]
Does modeling the XPCS-generated clock as an independent fixed-clock bypass
power management and dependency tracking?=20

Because the clock framework has no dependency link to the XPCS power domain
(RK3568_PD_PIPE), it seems it will switch the GMAC to this clock even if the
XPCS block has not yet probed and is still power-gated.

When the GMAC device uses this via assigned-clocks, the driver core switches
the parent clock before the GMAC probe function is executed. If XPCS is
absent or uninitialized, could switching to this unpowered clock hang the
system at boot time?

Would it be safer to have the XPCS or SerDes node itself act as the clock
provider so the clock framework properly tracks power domain lifecycles?

> +
> +	clk_gmac1_xpcs_mii: clock-xpcs-gmac1 {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <125000000>;
> +		clock-output-names =3D "clk_gmac1_xpcs_mii";
> +		#clock-cells =3D <0>;
> +	};

[Severity: Medium]
Is this second XPCS-generated MAC clock subject to the same decoupling from
the XPCS power domain as the first clock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915123802.1561=
724-1-coiaprant@gmail.com?part=3D5
