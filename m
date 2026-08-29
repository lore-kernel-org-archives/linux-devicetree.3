Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ED72D1F7B
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 18:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788029478; cv=none; b=XDQDPIEQRvnsQs93o81IVulh8sMjr/YmzEgMlyeU+/jqigsuB+EDS1G4qC4WvY/KB/xLaG9ixOhp2UPHkT+Z0boX4aCGiNDwepxiTim+HeXswu5m9YmqorNXTUVw79b9NJzr0yG4pEOitTOjFR/CBtYXqpZ3BuaXW9e4QfYCllk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788029478; c=relaxed/simple;
	bh=N/qGYPXVqRVXxX1LMHJkZQiOZAgvMGUOlt1hkkI06RQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c/Qpi2gxLkJqOH2Ty9mQKmWsR5WSkWjid4hya+bXRl5bwnFbgdhenKQ9ey972pF+AiFxJs86OYCOXFYsGDMortJd0X6Q0dfJem1jvwuj/kiUJx7WoSPiszlcJedJUxhME8XRaeg0iFYiNgMl5MRiJqRP1cT3nTy6mEJwR2+ytDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/Rl8CFz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/Rl8CFz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32AA91F000E9;
	Sat, 29 Aug 2026 18:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788029477;
	bh=naFbYkEMZnuhf7VHkOgh/mfTIIs2p3KwSbPJaksHIHw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M/Rl8CFz7Eq/XaekU4d/BG7p2VnPy9a1X4hC/tMYWmHF37mPiMWhwSWBLzvGXHbLi
	 wcbBzjNaQfctuHXYyIDnsRFYQLlqI5UZAyHiytDxNkUHcDfYL5PPy3kEreWgUaLUM5
	 lte0fAgiC6aRCfi2iL9/jYpC1fh/LqDq95XDBHfhgH2xbs7/qWTGgO/jBlv3b8PaWd
	 fZA3o3HjWCuYm5z7Do4fLKv6jQ76uHGCzOnoDIG4GPHPOEZuzjYYm3rPh11Yinc9V4
	 GsaG2l2kd5AdkybSbyYiCJAh1398ceB8Ed32A8hbkjGj7HqzwFPxYqIEpSxzAIDXNj
	 g2Oo/v9PVDjTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/8] arm64: dts: agilex5: add SD/eMMC host controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Kathpalia" <tanmay.kathpalia@altera.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260829184252.27644-3-tanmay.kathpalia@altera.com>
References: <20260829184252.27644-1-tanmay.kathpalia@altera.com>
 <20260829184252.27644-3-tanmay.kathpalia@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 18:51:16 +0000
Message-Id: <20260829185117.32AA91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The macro COMBOPHY_RESET is used in the device tree but is not defi=
ned anywhere, causing a device tree compilation failure.
--

commit 1fb3de019d554e3e24230c8b530b9bf6aad8b8dd
Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>

arm64: dts: agilex5: add SD/eMMC host controller

The Agilex5 HPS includes a Cadence SD6HC that drives either an SD card
or eMMC, depending on the SOCDK daughter card. This commit adds the
controller configuration and sets up the SOCDK slot as SD-only.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/=
boot/dts/intel/socfpga_agilex5.dtsi
> index b06c6d5d60eed..5ccbd7bf20340 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
[ ... ]
> @@ -300,6 +300,31 @@ portb: gpio-controller@0 {
[ ... ]
> +		emmc: mmc@10808000 {
> +			compatible =3D "altr,agilex5-sd6hc", "cdns,sd6hc";
> +			reg =3D <0x10808000 0x1000>;
[ ... ]
> +			resets =3D <&rst SDMMC_RESET>, <&rst COMBOPHY_RESET>,
> +				 <&rst SDMMC_OCP_RESET>;

[Severity: Low]
Is COMBOPHY_RESET missing a definition in this patch?

When compiling the device trees, this identifier appears to be left unexpan=
ded
by the C preprocessor. This causes a syntax error in the device tree compil=
er
(dtc) since it expects a valid cell value here.

Should the macro definition be included in this commit or a prerequisite
patch?

> +			reset-names =3D "sdhc-reset", "combophy", "sdmmc-ocp";
> +
> +			status =3D "disabled";
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829184252.2764=
4-1-tanmay.kathpalia@altera.com?part=3D2
