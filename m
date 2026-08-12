Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0617140F72D
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 22:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786572907; cv=none; b=bIQvtx+tT6HkTzh9jtJrhlqec2dhaX9wGaAPJX20MhOaGonz/rSGM0uTVSuTAoDaMT0BcV2X5hC8CR8Jk/F27xQz3PaIbb2VB+fVJGtmVV9umdp/m1jeOF25Y0pBee2u9nqs9EPNB1aCLeICXfvPuWk0Nrj0vg4zCdaCYSQtky4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786572907; c=relaxed/simple;
	bh=AmkERV0qmgxrxwIzbusC+6ga0afCxPkt2phD04RgKyA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AUqubssv0RoqWCjAVJhQw4pa5hskKW3/rOdXsxC1qydO2s48AbnJQioNWeZmrzw5QQ3wGgkOyVWJLG53RIkvmGu2fWloLVeoLpD7i+DT58cPt8qiKtyIv0q9a5NkPXFvH7+naDMS4swkylVsB9nsYgpE42Il/RCJ94Qi+d46DTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRMY8AUn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRMY8AUn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD561F00A3A;
	Wed, 12 Aug 2026 22:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786572903;
	bh=jrrik79CeaAgZZr8J+Sqb8S/NvAPGGe1OaJwSc/M4hg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KRMY8AUn4zv8Ksv/zAMDTqLSnVZCtz0qV2EM7dQnsU6uSVzshj735jibd53F3+M98
	 4s7wiqo0Y7nn4/WyZyXpk5EIeP4cW2rEXYaaoBYl65tnP7ljq6b1OTBqte5nnSmY/a
	 PlpBUOm6UYK/QGauKeuejUlz5/TqUXZ1sEFrJXBRnX3+uz6zPhzqWmE1uBXp8c4rbj
	 25LF44EwIpht/dEnmGek6Ks5jES18ETGEmzlvXjf6pxoS+JJ0liKLFZBSzu4mL/IkN
	 eRatjCTSlKabqwBXXtZlJ/uoD91SqQPQTDjDQcjh1nPZoV6WF7hvTqWS/2DUYfQszk
	 RICU4W+OnBo2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: milos-fairphone-fp6: Add NFC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260811220135.472380-7-jorijnvdgraaf@catcrafts.net>
References: <20260811220135.472380-1-jorijnvdgraaf@catcrafts.net>
 <20260811220135.472380-7-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 22:15:02 +0000
Message-Id: <20260812221502.CBD561F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing pinctrl state for the `wake-gpios` pin (`gpio7`).
--

--- Patch [6]: [PATCH v5 6/6] arm64: dts: qcom: milos-fairphone-fp6: Add NF=
C ---
commit c9c7cf311411882808cc647f75e1e16f476acbf7
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

arm64: dts: qcom: milos-fairphone-fp6: Add NFC

This commit adds the Samsung S3NRN4V NCI NFC controller on i2c1 to the
milos-fairphone-fp6 device tree. It configures the controller's clock, power
supply, and GPIO lines.

> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm6=
4/boot/dts/qcom/milos-fairphone-fp6.dts
> index ebdca0e2d2f3a..bdba848275db4 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
[ ... ]
> @@ -601,9 +601,22 @@ &gcc {
>  };
> =20
>  &i2c1 {
>  	status =3D "okay";
> +
> +	nfc@27 {
> +		compatible =3D "samsung,s3nrn4v";
> +		reg =3D <0x27>;
> +
> +		interrupts-extended =3D <&tlmm 31 IRQ_TYPE_EDGE_RISING>;
> +		en-gpios =3D <&tlmm 56 GPIO_ACTIVE_HIGH>;
> +		wake-gpios =3D <&tlmm 7 GPIO_ACTIVE_HIGH>;
> +		clocks =3D <&rpmhcc RPMH_LN_BB_CLK2>;
> +
> +		pvdd-supply =3D <&vreg_l20b>;
> +
> +		pinctrl-0 =3D <&nfc_default>;
> +		pinctrl-names =3D "default";
> +	};
>  };
[ ... ]
> @@ -825,6 +838,22 @@ &tlmm {
>  			       <13 1>, /* NC */
>  			       <63 2>; /* WLAN UART */
> =20
> +	nfc_default: nfc-default-state {
> +		irq-pins {
> +			pins =3D "gpio31";
> +			function =3D "gpio";
> +			drive-strength =3D <2>;
> +			bias-disable;
> +		};
> +
> +		pd-pins {
> +			pins =3D "gpio56";
> +			function =3D "gpio";
> +			drive-strength =3D <2>;
> +			bias-pull-up;
> +		};
> +	};

[Severity: Low]
Should the pad configuration for gpio7 (used for wake-gpios) be included in
this pinctrl state?

The nfc@27 node defines wake-gpios on gpio7, but nfc_default only configures
the drive strength and bias for gpio31 (irq) and gpio56 (pd/en). This leaves
the wake-gpios pad configuration to hardware defaults or the bootloader sta=
te.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811220135.4723=
80-1-jorijnvdgraaf@catcrafts.net?part=3D6
