Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7E03B19AF
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 14:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785680745; cv=none; b=QCOnlQOUznN9udEMVugm00zN9QflG7c4NSNG2bHa4V4ygjhE1xuINvYXRQ78lV9gASgT0eRGuIXOlIJTtsidnF7hqCm6uzj6Pb8qoDjo7z+R+KSa114pRnmkzw61+24gDSe8f9/amVM7F72OAyxz1lxXyjNQ/zIAEJ+m9WtyFh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785680745; c=relaxed/simple;
	bh=TATG5OB500C4xYEJSWcC1r1occnACIYVnUyC1YniIOc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lIWqmWH3kWTr6RIhz6RvjIfU3Bss7P7JzvBjCyzxS/EH75xc9Kv2zlqi2XkKxngiNsvTSuoBVKKi+dE1W8GHFX0BYXchGeO6KtzgDH+W5K+Olr2smaKRUt5fhRs3/JZ+frIJQRGekrccPD6cHvVNuu2UsMHl0DV1mlpoOAiRQfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJnwVJF+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJnwVJF+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B61F1F000E9;
	Sun,  2 Aug 2026 14:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785680744;
	bh=cl53CQ7ODMQtZ2fnkPnRVoAG6vvhuGOqM5Qi0fvSgec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DJnwVJF+4yIVAChXeWaic97jZAF/u7hjs7GhlTFROgdPwMqQVYzMyjtD/HXUZfUJk
	 estbUiJZ0XzLUOg1rW/Ak4UMzxqBcuRBd7XM+92CRlT8FvD5BQD0OE/DcCO19k4JYJ
	 uoB9iOv0EN+9OuLWK8Zyyc6qyalBtCgkMS3ndAIkKi7/gpOiceURLBTaV10TYxStfg
	 44/djKEfT89b19tFDinTn/cTNkLfu/u7/eEr2yxE44zvpiA2Ce04Z3b+tEwOdLAAo2
	 lzClh/kQFxa/3SSFMhV51nHikLXMDTZPpxWB38XIzsrbRNEGJL35/WeL7UQykZ4+ua
	 VIoPPorU+yDxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/10] arm64: dts: rockchip: rk3568-photonicat:
 enable SGMII LAN port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260801142244.679437-11-coiaprant@gmail.com>
References: <20260801142244.679437-2-coiaprant@gmail.com>
 <20260801142244.679437-11-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 14:25:43 +0000
Message-Id: <20260802142544.1B61F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The YT8521SC PHY node specifies 10G Energy Efficient Ethernet (EEE)=
 errata properties (`eee-broken-10gt`, `eee-broken-10gkx4`, `eee-broken-10g=
kr`) despite being a Gigabit PHY.
--

--- Patch [9]: [PATCH v2 09/10] arm64: dts: rockchip: rk3568-photonicat: en=
able SGMII LAN port ---
commit 08ee4bf87f62aaa593b62ffb0a37f8f8618a6a2a
Author: Coia Prant <coiaprant@gmail.com>

arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port

This commit enables the SGMII LAN port on the Ariaboard Photonicat,
adding the necessary XPCS, GMAC0, and MDIO0 nodes to make the Motorcomm
YT8521SC Gigabit Ethernet PHY functional.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/ar=
m64/boot/dts/rockchip/rk3568-photonicat.dts
> --- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
[ ... ]
> @@ -341,6 +352,39 @@ &i2s0_8ch {
>  	status =3D "okay";
>  };
> =20
> +&mdio0 {
> +	sgmii_phy: ethernet-phy@3 {
> +		compatible =3D "ethernet-phy-id0000.011a";
> +		reg =3D <0x3>;
> +		max-speed =3D <1000>;
> +		eee-broken-10gt;
> +		eee-broken-10gkx4;
> +		eee-broken-10gkr;

[Severity: Low]
Are these 10G Energy Efficient Ethernet (EEE) errata properties intended for
this Gigabit PHY? Since max-speed is limited to 1000, these 10G-specific
properties appear to be inapplicable to this device.

> +		reset-assert-us =3D <20000>;
> +		reset-deassert-us =3D <100000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801142244.6794=
37-2-coiaprant@gmail.com?part=3D9
