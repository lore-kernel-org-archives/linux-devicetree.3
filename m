Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794343314;
	b=i1SqK74m/TyZcelZexIxW1JjfnqFvDBVC182iFaAzuWv4Fdb2ktttKKcifypNL0rXvun
	 m+w9mU3l9XmlzMiiV706S2bI8nz9no48gAUU9NDXQfe4aFcbTU1WNEsgIudN+8Il5CwCZ
	 n+CxBzlxJEmppz9hheQeJdiNP40zTo0OhVsH1b+fs8oUJc4nLamUrEPOcah7MZ5VeOqia
	 jNme5ACY6t5daVKcjlLZsgPtQOkGXIqHhYPSF1hgkH9Ydfu9ZMPdGonmlk3VBqgWmCoZg
	 OBwViQaYRogzCFWYMuX1cM6JIGlj3D9wSkml3AgTg06CooyrCMVAKqGJQ64K0RgxY/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343314;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yIgpisyDVEObNQSocl6AqMxYC5aPYK4WOILDhMsbLjw=;
	b=qD4R/AWQZpY1mIOIZ5fz6ARNb+MgY4wcsM26sxCmOus4/v+IeeLzkKJ3UFJtUUmVwSBh
	 K8EdzadIB/F1GVtwAswNJcpHRM1EgECclLdQuNtjtfxjSNMl2TZpun/oeCd/yF3t/SCWK
	 LHKuco/095pz2XIyMwHwrgk0rq14fKfR0tQDQZ81KBJgQyg9J96lT61pKFqtheUH6yz6y
	 03AfWQ6JK3Rq8L/YgAa74Nhdc9p99gmNfB/vSele0v4xSgkihBv/IPn7/MSLkOfm1/LHp
	 KWHJs3bUfdBOgLRHP23Lzz090O6gd9W03vF9Qg2/UkCoDCvSYm3dx4yY1xyUxDAK2kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jibjL0bF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4BA606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 20:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jibjL0bF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECC31F0089F;
	Tue, 10 Nov 2026 20:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794343314;
	bh=yIgpisyDVEObNQSocl6AqMxYC5aPYK4WOILDhMsbLjw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jibjL0bF1PIJ4wZbEneGSdjxVDoFrFpbU6u75NYTmCPj1kUCwr4ViSS1qNIS8x2ye
	 D0kTIA8CjxHG0AxQWgrxSBdzO3lBlrDyhQlCmI56waSKmODNr2OIa/TJRmSgXFc+/u
	 1VwBwoqQY/CrCtFEqbi2mUY21ImOS6529ofosNCSbLNpMhoqnBpMBt6IJvk5uypRyk
	 idcQ/SsFSEOTQK0VNLKtSLUeCfkLgxdfoEl676gFh/Y/RsvEqjBDpmVrpvfXR946mH
	 gXLZS+exqK9sqnSMT+hj3UoWuGQMdz9bN8xBY29y2f5ghyRnvawXLRGadiAHfvUk5r
	 guefbzIW/109w==
Message-ID: <sashiko-outbox-207724@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jeff Roach" <jeff.roach0@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110202445.14100-3-jeff.roach0@gmail.com>
References: <20261110202445.14100-1-jeff.roach0@gmail.com>
 <20261110202445.14100-3-jeff.roach0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 20:41:53 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] arm64: dts: qcom: mahua-hp-omnibook-x16 needlessly disables
  supported GPU
- [Low] arm64: dts: qcom: mahua-hp-omnibook-x16 overrides CoB
  usb_2_qmpphy refgen
--

commit 3e113b861ffbde20b418ef1c9fd0df962bea91d4
Author: Jeff Roach <jeff.roach0@gmail.com>

arm64: dts: qcom: Add HP OmniBook X 16-cp1

This commit adds the Device Tree for the HP OmniBook X 16-cp1 laptop based
on the Qualcomm Mahua SoC.

> diff --git a/arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts b/arch/ar=
m64/boot/dts/qcom/mahua-hp-omnibook-x16.dts
> new file mode 100644
> index 0000000000000..1d30dff7d293e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts

[ ... ]

> +&gmu {
> +	status =3D "disabled";
> +};
> +
> +&gpu {
> +	status =3D "disabled";
> +};

[Severity: Medium]
Should these status =3D "disabled" overrides and the corresponding commit
message note be dropped so &gpu and &gmu remain enabled as inherited from
mahua.dtsi?

Adreno X2-85 support was added in commit dbd5d59091f2 ("arm64: dts: qcom:
mahua: Support GPU and GMU"), which configures the qcom,adreno-gmu-x285.0
and qcom,adreno-44060000 compatibles in mahua.dtsi and already carries a
Tested-by for this laptop.

[ ... ]

> +&usb_2_qmpphy {
> +	refgen-supply =3D <&vreg_l1c1>;
> +
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	status =3D "okay";

[Severity: Low]
Should refgen-supply =3D <&vreg_l1c1> be dropped here so &usb_2_qmpphy
inherits refgen-supply =3D <&vreg_l4f1> from glymur-cob.dtsi?

Commit 6fdce1f4a17b ("arm64: dts: qcom: Consolidate Glymur CoB power grid")
moved the common Chip-on-Board PMIC regulators and PHY supplies into
glymur-cob.dtsi with refgen-supply =3D <&vreg_l4f1> (1.2 V) rather than
vreg_l1c1 (0.912 V).  Also, the commit message still mentions checking
regulator voltages against ACPI power votes, even though the RPMH
regulator nodes are no longer defined in this board DT.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110202445.1410=
0-1-jeff.roach0@gmail.com?part=3D2
