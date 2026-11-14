Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655774;
	b=5AZ72Zmt0aoq6LaBNn05OHqFyI8U5NdlZRTssHxdXgtZgW3FKEJlybUgApegwLgYB1zu
	 AcARYVRriKtdqJWe3g6so+9r5DyGZbVuxZ2eTU77o5mZBrwdIvMTYcOvK19c7WCuSV3C6
	 1dlc14AjOWclIg5fjihKT7SbU04OYUHlTgOzJaUZKnx2i49gG00ZSLdM3ywXTFWt4y9RZ
	 G2fR6OzTxr/1tc5EZLPY29tCxZcNNeaj8kfo4sYVaI+7lV3t00XJLrltHvv77JLrv3nnc
	 RdnXuReJszqFDlU7TThJQmLdyiUWmPR60VE3QmJvh23EokwmdvvaGA+dJ4e772sir0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655774;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sIh5SKBXyU47sOimXoDS9MChllo/ahz8e4YQolU1+rA=;
	b=HfsnE8IdR8RfC+AZLX+HoEPZoZwARAnSNfv0T5EbIpO6iZIHEnfd0+5wDzzBDxdUmIiz
	 WdleZVoR2uAnxodAxhrItOhucfeg+55WrYeg7S4v1KVQILnLlZKMv7H8FLN+Dl3s8f7gw
	 4EBqIL8K3ODdg5HGN1SpR08yutXECIDD4nxLEYLGcfJ/WKgu/1IeDxwZiriyED7M0p/P7
	 RsBTuVkRKsOwyjWNSaVDosIdPlOeZ+BrK62i/IIclZzZO1BFTKwVJY0H9FIlXtkLhaq27
	 Hv/Kziu7FvTqctIU414aMjLtI78pOzHRSyM7zz/eMj4o8cCvd7cCsMO7Qv2xVifamUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1UCSpsr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17559606A333
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1UCSpsr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618F81F000C4;
	Sat, 14 Nov 2026 11:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794655773;
	bh=sIh5SKBXyU47sOimXoDS9MChllo/ahz8e4YQolU1+rA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n1UCSpsrurH/S318mEUc87IHfSyI2jTPRq2B5WpZYSFBv8U/5JjKGShMS/oWjnzvQ
	 nPLkKSfcfwNao2Jle5lBPRrsnNIgGW0cp+bKJgaOHfTlvrbw2o6jlwftocBhEphO9o
	 0Mu8NyVfBaDMMroglKktSC/KTqBEij7BGtgPQqhw7jL75dhRJHM4QIc2DX6Iy8ufWI
	 zIwVioifPgzL4C/fuuV42NtEuf1mwEIO5A5EUbKHJqOa6WMD8+N5CZc+UzZUdN3syf
	 rv7PCwjSqlwYW75Bm36jcM3nSlF7XqoY1EcjP5X/RmLzTZ4PTzzrH1mUgypkBAGkBN
	 5l9+XHTS39grg==
Message-ID: <sashiko-outbox-214404@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 SoM platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikishan Thawre" <gopikishan.thawre@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-lemans-draco-final-changes-bringup-v2-2-3ae8cd1c9932@oss.qualcomm.com>
References: <20261113-lemans-draco-final-changes-bringup-v2-0-3ae8cd1c9932@oss.qualcomm.com>
 <20261113-lemans-draco-final-changes-bringup-v2-2-3ae8cd1c9932@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 11:29:32 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: qcom: lemans-draco-som: swapped USB QMP PHY vdda
  supplies
--

commit 7b19f1db69f746d48a10a9095746a5c2e0b70d80
Author: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>

arm64: dts: qcom: lemans: Add LeMans Draco EVK SoM platform

This commit introduces the device tree for the SA8775P/QCS9100-based LeMans
Draco EVK SoM, including RPMH regulators, QUP, remoteproc, UART, UFS, USB,
GPU, and VPU nodes.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi b/arch/arm64/=
boot/dts/qcom/lemans-draco-som.dtsi
> new file mode 100644
> index 0000000000000..6b7971bcdc934
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi

[ ... ]

> +&usb_0_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l1c>;
> +	vdda-pll-supply =3D <&vreg_l7a>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1 {
> +	dr_mode =3D "host";
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1_hsphy {
> +	vdda-pll-supply =3D <&vreg_l7a>;
> +	vdda18-supply =3D <&vreg_l6c>;
> +	vdda33-supply =3D <&vreg_l9a>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l1c>;
> +	vdda-pll-supply =3D <&vreg_l7a>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Are vdda-phy-supply and vdda-pll-supply swapped on usb_0_qmpphy and
usb_1_qmpphy?

vreg_l7a is the ~0.8V rail and vreg_l1c is the ~1.2V rail.  On SA8775P QMP
PHYs, vdda-phy-supply expects the ~0.8V rail and vdda-pll-supply expects the
~1.2V rail, as fixed on the other LeMans boards in 932113c3c778 ("arm64: dt=
s:
qcom: lemans: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies").  Swappi=
ng
them programs the 21800 uA vdda-phy load on vreg_l1c and the 36000 uA
vdda-pll load on vreg_l7a.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-lemans-dra=
co-final-changes-bringup-v2-0-3ae8cd1c9932@oss.qualcomm.com?part=3D2
