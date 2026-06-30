Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A29394797
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804368; cv=none; b=Q5i4du7I/fpok4W4EFIwQvohKMt8abAhEmvMvR0HFpvawJkyUueR9apG9h3PvbEWte3VGQ96gCfL3Ye4d8lUjqB5EV609b1RFXWJBdQGLDQcj+2kjgFGzOlPJ6t2+uUkpU7ex1KEBGT9gFX+0YFmxnr8kh2sgZQedjijIErKFYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804368; c=relaxed/simple;
	bh=JAU8WYo2jvQB0r4tpRgeZf8Uud1UZHOFqYjSWTWspcY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gYKlHzE94Wi664xBOjJGx8wORvODkf33QKtbDcaE3WjBz+/Kq3coU6qqJZz6k7ruWluMRqlnzpiLNYayvXxSxqj3j/VX+q+QJE+Lza3G65QI0RuwL94V/q5IX8RCLiUyKIrBW1Mli/9G7HYhJ4XIX7eh3DdlB7LIorgSxNrAc68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMQOvOJV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMQOvOJV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55491F000E9;
	Tue, 30 Jun 2026 07:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782804367;
	bh=Vlag3NU1ktobCDAUjHCqLQHYe2cp5mMFXZrEDkXmjhc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kMQOvOJVokJCF9d4xALk2YqSgVyd22csplo6TTxjMESGroiq1gLRxIuKdXV/BKcZg
	 Z54GT8Jgf9Yw+bQVJT/AXEuKZ2REKLSrFoMz2i2F1ZAEK8QirtcTc60hIaUyeEQhLk
	 ZtMWjhfKgSS27yU7osw2LO5VpP0v0B9QHIVas2zAsPqS+UQmMznAMMf+tm5bxox77d
	 32xPpjj+NFsvjjFvfLYofOOaG4tMhQyP2WKvhyWz3VOHm4q9p9gxgT1MmBIpxKlbwM
	 yrXQoMbVUFrDIlLxhpXc6EWD2DpRzWserbewKVhdgGTvMBWg6S6by8m+1tVxRJFwDW
	 7BqICj9FtU6Cg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add base HAMOA-IOT-COME board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuanjie Yang" <yuanjie.yang@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260630071022.3256-3-yuanjie.yang@oss.qualcomm.com>
References: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
 <20260630071022.3256-3-yuanjie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 07:26:06 +0000
Message-Id: <20260630072606.E55491F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unused PCIe controllers (pcie4, pcie5, pcie6a) are left enabled =
in the ComE carrier board, causing boot delays and power waste.
--

commit 5654913fbfd858b8d2bf4684318b0d7145c8a5b6
Author: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

arm64: dts: qcom: Add base HAMOA-IOT-COME board

This commit adds the device tree for the HAMOA-IOT-COME platform, which
consists of a SoM mounted on a carrier board. It includes initial support
for components like UART, Regulators, USB, PCIe, Pinctrl, and UFS.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-come.dts b/arch/arm64/boo=
t/dts/qcom/hamoa-iot-come.dts
> new file mode 100644
> index 0000000000000..99c47cd953b83
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-come.dts
[ ... ]
> +&pcie3_port0 {
> +	vpcie12v-supply =3D <&vreg_pcie_12v>;
> +	vpcie3v3-supply =3D <&vreg_pcie_3v3>;
> +	vpcie3v3aux-supply =3D <&vreg_pcie_3v3_aux>;
> +
> +	reset-gpios =3D <&tlmm 143 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 145 GPIO_ACTIVE_LOW>;
> +};

[Severity: Medium]
The included hamoa-iot-som.dtsi enables pcie4, pcie5, and pcie6a with
status =3D "okay", but this carrier board does not disable them or provide
the required reset-gpios routing.

Will this result in the pcie-qcom driver powering on their PHYs and timing
out during link training?

It appears dw_pcie_wait_for_link() will loop and time out after 900ms per
controller without a connected device or toggled reset signal. This causes
boot delays of nearly 2.7 seconds and leaves unused PHYs powered on.

Should these unused controllers be explicitly disabled here with
status =3D "disabled"?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630071022.3256=
-1-yuanjie.yang@oss.qualcomm.com?part=3D2
