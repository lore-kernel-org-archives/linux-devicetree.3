Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7C1322C73
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528562; cv=none; b=D6F2by6/1H3/CpQrzpZyryTbxQ2loneckZwHN6sJYA+aWwPCTOEavtBzTZy97PKPAA++Le4KLFBsTwSbSFqPLqFEN3VnsLg7JEFRwiwfTtVEkOZIU7pwdcNVa+aDSlBLiQfd8EwzHQTx2RDAB4ylrwPlwlKAghtCnvfLStrzz6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528562; c=relaxed/simple;
	bh=zDNmGcwcfE+ZSblX632wtErxuUWTjQOgyAEh/ZLvnR0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JoCYAsRV6oiJD6bSSBse/q5EEhDUSTHNMaFUFLSE1jrzTyaJ28GmSA6G/6s9PJZFC3DfavGWpz74BaHubvKH7IvRApe7ZvsdKSmXmWSv2v8K4iFUnm+WR13xWR4/BvDqEDxMUyP+BQHLumuevqfQ6vGBlnk69T9u455XF8UEdlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJ92oCeD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJ92oCeD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377721F000E9;
	Wed, 12 Aug 2026 09:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786528560;
	bh=wKOJNjrcbU5EqYgfLGFlgE1LxUhcZuyOEQvYklfU3M0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OJ92oCeDnEpVA5Q7ltS6WoCEZX7Kr99s8RSsMP/BlHgtUsK3a+jG3rV64sKa0imnN
	 Cu8Dud/kAwo84Mvn55WVNqG40xLe5CS3i+4YqS3fp0e2EqPP/gzXgBJlmbEFtzpLRN
	 FtIG92MS27Brvu50MYNwABig4ekUvUiC0Ngc/QaDK9j2j8UkQx+EPUDY2RzD+uUi9M
	 IPH0C/uW2ZXsA3q65ycjklp9tesVqfOeqxJwy2BisKYSdNJePaBSPlrxDu6EjOxoJS
	 7CK5CmOsnGNcWmA1/LdhgdKW1bLJoUT/HppFLRxEJmhKPnOaLAWTotHSJliSFoaQwq
	 oNRaJvQdoGxKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/14] arm64: dts: qcom: ipq5332: Add Super-Speed
 UNIPHY to USB node
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260812-ipq5018-usb3-v2-10-8f355d7ff0ef@outlook.com>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-10-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 09:55:59 +0000
Message-Id: <20260812095600.377721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces a reference to an undefined phandle `<&usbphy1=
>`, which will break devicetree compilation.
--

--- Patch [10]: [PATCH v2 10/14] arm64: dts: qcom: ipq5332: Add Super-Speed=
 UNIPHY to USB node ---
commit 27afe7df7dfd63bf61a327eb2425e1692b59003b
Author: Praveenkumar I <quic_ipkumar@quicinc.com>

arm64: dts: qcom: ipq5332: Add Super-Speed UNIPHY to USB node

This patch adds the USB3 UNIPHY node to the USB controller node.
It also switches to the pipe clock supplied by the USB3 UNIPHY
instead of the UTMI clock.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5332.dtsi
> index 4c1016f5059e9..c2d384fa9df18 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -486,10 +486,8 @@ usb: usb@8a00000 {
>  					<&gcc MASTER_SNOC_USB &gcc SLAVE_SNOC_USB>;
>  			interconnect-names =3D "usb-ddr", "apps-usb";
> =20
> -			phys =3D <&usbphy0>;
> -			phy-names =3D "usb2-phy";
> -
> -			qcom,select-utmi-as-pipe-clk;
> +			phys =3D <&usbphy0>, <&usbphy1>;

[Severity: Low]
Does this introduce a reference to an undefined phandle <&usbphy1>? It
appears this might break devicetree compilation with a "Reference to
non-existent node or label" error when building a board that includes
this SoC .dtsi.

> +			phy-names =3D "usb2-phy", "usb3-phy";
> =20
>  			tx-fifo-resize;
>  			snps,is-utmi-l1-suspend;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-ipq5018-us=
b3-v2-0-8f355d7ff0ef@outlook.com?part=3D10
