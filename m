Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF659DF76
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 04:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779941166; cv=none; b=Tz5kXCu1149s6d5nkSPUOtbEtBfeohrcJlLG8wGlzTyqSZuz/606H+2xePlBTgsCGAuG4Y7CaEzEYPyFpcVwPdPs+i4bcm5Gtx3fGOpE9qzSVmgPyWR+EApxJ/+cpg74Su2i9KR4pjCnLGqIoejKhckjNDksSAGEykb6rXwHyMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779941166; c=relaxed/simple;
	bh=IVPWMXbFNZmd/QOgGgW4nNO+GRKkCi2Xa/Vttrya0r4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iDlX0TBm5v3C9+KqmEWiYWPPM5OogKLskhbdLaMZ9UvQus9ZJke5gPQ+iRplI+yWSu5UDffzChXgOaMedxIrxObzwrJ8Eeot+UmKko1Hojttj3AHKuq/NrJGpSZ+OM0Jpy7WuR34vc9TIAeacIs91Rxw6Y8fvhR/DRG8qWBVVLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EaflVVpV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EaflVVpV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420F71F000E9;
	Thu, 28 May 2026 04:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779941165;
	bh=gSa20dLu8ar9OKGwVjMN0oysv9d9RqdDjfA8q4XJj8Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EaflVVpVOr+srbfJuA+B7+1hrxp7ZplDxokycA+pWR2XmK3VwKr2nZamrkzcAqnEE
	 UY+1/DM+GgG7Xzmd/f6emGSuRPVrifsyf8DZSPhWDm06VXuosVOrV1O6JMSX16SOV0
	 PyXJaUg99G8HKiEOs6tHFfuURRghc1ZCBJtz2U5SJ2sjj9+y8YMK3/dX710Fadl6wV
	 SaOgm3nse7RwmrX3ywe8EsDXtmit2zLwa/htVZi54/cDSv6nO3g58R+ie/pAa5mNEI
	 bKAA8zzpWVGmrvE6Qn3YBdZIQw+jAGchHgcObM56AjLutIU5j8A12ZtOSbbgT+JAj5
	 r91OQrSiDdSTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/7] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260527-tcsr_qref_0527-v4-5-ded83866c9d9@oss.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-5-ded83866c9d9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 04:06:04 +0000
Message-Id: <20260528040605.420F71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `&tcsr` node override is inserted out of alphabetical order in =
`arch/arm64/boot/dts/qcom/glymur-crd.dts`.
--

commit 9720c9e91ecfbc0e51190570b621f1da39f55b1b
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

arm64: dts: qcom: glymur: Add QREF regulator supplies to TCSR

This commit wires up the LDO supplies required by the QREF and refgen blocks
on the CRD board. The TCSR clkref_en clocks gate the QREF block which provi=
des
reference clocks to the PCIe PHYs.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dt=
s/qcom/glymur-crd.dts
> index c98dfb3941fa3..be8497ef0da33 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -354,6 +354,26 @@ &usb_1 {
>  	status =3D "okay";
>  };
> =20
> +&tcsr {

[Severity: Low]
This isn't a bug, but should the &tcsr node override be placed before the
&usb_1 node to maintain alphabetical sorting? Standard devicetree styling
guidelines for Qualcomm device trees usually require root-level node
overrides to be sorted alphabetically by their label to minimize merge
conflicts and maintain readability.

> +	vdda-qrefrpt0-0p9-supply =3D <&vreg_l2f_e1_0p83>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-tcsr_qref_=
0527-v4-0-ded83866c9d9@oss.qualcomm.com?part=3D5
