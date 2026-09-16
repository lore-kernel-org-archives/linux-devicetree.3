Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB463A5440
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 02:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789524314; cv=none; b=L4InMHCCgfejqi428nTs1HIJbdMYfpw5iNm/zToW14smEJK6EUSGjfXnaQrqD6IqjFAeDjjsvU+e21tQKCdYSpX2XF9ox5pg6TSTb7Sfrv4EF05gR81xdv13gL9J7fzHBhNH2qC8PGZLPna7P7PAMMVrSW9OHaS0BgYB7SBOusw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789524314; c=relaxed/simple;
	bh=iMPtRMOLVM/DPir/+ui47qttNQUckPyPNo/s/VRSEsU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qQ121VkoFxiJS8zAbUrtMcKIoFfTiKHurx42uYnqT/RqMUwFmV/GiG3Cbgsbpcl1nCPe4DUWXumOaxFwYQ97wef27+hovLaDLnCxk37Qib1Ykom9y9zGeHt17zXghtx8uBbmzNXbNH4HOlK4Lf6rJAK1zKtU5lEijSpdGp86l/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIeAntsK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIeAntsK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060861F000FF;
	Wed, 16 Sep 2026 02:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789524304;
	bh=GcVjLlmz5LZsK8LgtK2EAmBn8mosMDq5pnMMvxQJohM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PIeAntsKYc8yhW0LW4sHL7fmv2j6p+DnvOLQfHYUvjhK0UGTUzoVlxN9Z1SkTwY2/
	 ZW/bicA0qTasmnm9UEXVDkz+KRSWUQ1uU/eIit3MmmSZ3TIEOk/eOqq5Llj/Q3WKd9
	 1NoUaB96dOT0IgYCH59YUyoVyeMBx12u3OLoJ21ELplxIeo0F0iypnzrsYZX10ffjx
	 UQSsm0H/FoBLFbvBXAFy3NtH42n/uewyUnL6GrU6sPWGkXc8lCsDks6lhdWQ0XwoCZ
	 BUQ/W3/oClZeFdNsJvZ/2i8taZc+QboKqEbcGgvjhricwpwCiD0+G3l2C0EO02D2ZD
	 1hZPjxk6Io1Yg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A14
 (UX3407NA)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bjorn Andersson" <bjorn.andersson@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260915-zenbook-dts-v2-2-41de8669a7a8@oss.qualcomm.com>
References: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
 <20260915-zenbook-dts-v2-2-41de8669a7a8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 02:05:03 +0000
Message-Id: <20260916020504.060861F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: copy-paste error leaves second USB MP PHY and redriver enab=
led
--

commit 0d6d4b3a24e525ee48e9f58d17b7e42d0de45fa5
Author: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

arm64: dts: qcom: glymur: Add Asus Zenbook A14 (UX3407NA)

This commit adds device tree support for the Asus Zenbook A14 (UX3407NA)
variant built on the Qualcomm Glymur platform. It introduces the base
hardware description, including the X2 Elite SoC, storage, display,
and USB connectivity.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dt=
s b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
> new file mode 100644
> index 0000000000000..e96e65a0c5b49
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
[ ... ]
> +&i2c5 {
> +	clock-frequency =3D <400000>;
> +
> +	status =3D "okay";
> +
> +	ptn3222_1: redriver@43 {
> +		compatible =3D "nxp,ptn3222";
> +		reg =3D <0x43>;
> +
> +		reset-gpios =3D <&tlmm 184 GPIO_ACTIVE_LOW>;
> +
> +		vdd3v3-supply =3D <&vreg_l8b0>;
> +		vdd1v8-supply =3D <&vreg_l15b0>;
> +
> +		#phy-cells =3D <0>;
> +	};

[Severity: Medium]
The commit message explicitly states the device has "one USB Type-A" and
makes no mention of an SD card reader. Does this hardware actually have a
second redriver, or is ptn3222_1 a leftover from another model's configurat=
ion?

If this hardware does not exist on the board, the kernel will attempt to pr=
obe
a non-existent I2C redriver which can cause boot probe errors.

[ ... ]
> +&usb_mp_hsphy1 {
> +	vdd-supply =3D <&vreg_l2h0>;
> +	vdda12-supply =3D <&vreg_l4h0>;
> +
> +	phys =3D <&ptn3222_1>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
The second Multi-Port PHY is fully enabled here, which directly contradicts
the commit message's claim of a single Type-A port.=20

Could enabling this second PHY waste power and cause initialization errors =
by
attempting to bring up non-existent hardware on the boot path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-zenbook-dt=
s-v2-0-41de8669a7a8@oss.qualcomm.com?part=3D2
