Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B7AC8EB
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 06:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739562; cv=none; b=Q721uBJMK6XaFn+INepuTT3e4Lo1RzSVLSoLXTIt5G9mAxCv1JQSk23HenzdTHVn6PqLzTShe4ypzVXGK1yHy2q31XJjTwiOHzD9uHvDOETiGMBh1JMIR1dZ1aq7Lg1cnCZdN8X22AtYekjI6hsTcqfQUHrYpIEKAHBJUvA2g1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739562; c=relaxed/simple;
	bh=xTlgY5JpYaC+AjTWEIKzSzgc/r1YVyEDADg1d89tDIY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c9mjdvbUEMOv9pIPR21jjBqwHSrMEnH01mGeV+r976aIJesEI8+7KQ+bbbbdJeNjcImakQplQjTNzUuh0xOrAQFDHXpCLzLHfd1Upe0diScV+lVAHQoAsW/kkiQ/E1izv6TFFYKTIfkkq80s2gMi7oTJMA7V3KL8wJ69uNo5rpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rh+BhStr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rh+BhStr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB091F000E9;
	Mon,  3 Aug 2026 06:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785739560;
	bh=vaMF5i5UNNi6HlVCvDY1nNgPy2BUnKHTRBRR3VWQg+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rh+BhStrh8j9b7vi717AO5yINNOE6ggliJvLAlJztmNeZ+a4146qBbxjaOqnGGu5J
	 LRWREUtFstCiC304qmlN8kr1+uVveFyZscjGSm3PrNo7jne5pEFCWiUP4aoSBF32iq
	 WLSLBAiwcSJ8ANyazuX9OUVpBFbxRbzD7o1pKz7RY0JwZs5CgS22nZ4j6Jmrl0S5TC
	 KzqnhF5LJ0Qx3V8DeJAW00XfQis0a8ChyQwDPaOueRk2ZSLE1TyVx8hYv/11BNeLm3
	 FLug7+24r7WaXlndKxw3cCA2nTiz+iLST8WeoacQq0os8jC8HXypV9faCBfX/gLDOX
	 Fh3tee/imv3Aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/28] arm64: dts: qcom: qcs6490: Fix swapped USB QMP
 PHY vdda-phy/vdda-pll supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-phy-supply-fix-v1-13-5880630cde3e@oss.qualcomm.com>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-13-5880630cde3e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 06:46:00 +0000
Message-Id: <20260803064600.9EB091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch series fixes swapped `vdda-phy` and `vdda-pll` supplies =
for the QMP USB PHY on various boards, but misses identical misconfiguratio=
ns on other closely related boards such as SC7280, SC7180, and SM7225.
--

--- Patch [13]: [PATCH 13/28] arm64: dts: qcom: qcs6490: Fix swapped USB QM=
P PHY vdda-phy/vdda-pll supplies ---
commit 0c6d97f5f784273baeb5afe41418c7609191becd
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: qcs6490: Fix swapped USB QMP PHY vdda-phy/vdda-pll suppli=
es

This patch corrects the swapped vdda-phy and vdda-pll supplies for the USB =
QMP
PHY on QCS6490 boards.

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/bo=
ot/dts/qcom/qcs6490-rb3gen2.dts
> index 37a3b51323ce5..8e200ba3711ae 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -1419,8 +1419,8 @@ &usb_1_hsphy {
>  };
> =20
>  &usb_1_qmpphy {
> -	vdda-phy-supply =3D <&vreg_l6b_1p2>;
> -	vdda-pll-supply =3D <&vreg_l1b_0p912>;
> +	vdda-phy-supply =3D <&vreg_l1b_0p912>;
> +	vdda-pll-supply =3D <&vreg_l6b_1p2>;

[Severity: High]
This isn't a bug introduced by this patch, but since you are fixing the
swapped supplies here, should this fix also be applied to other closely
related boards that appear to have the exact same misconfiguration?

For example, in arch/arm64/boot/dts/qcom/sc7280-idp.dtsi:

&usb_1_qmpphy {
	vdda-phy-supply =3D <&vreg_l6b_1p2>;
	vdda-pll-supply =3D <&vreg_l1b_0p8>;
}

And in arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi:

&usb_1_qmpphy {
	vdda-phy-supply =3D <&vdd_a_usbssdp_0_1p2>;
	vdda-pll-supply =3D <&vdd_a_usbssdp_0_core>;
}

Similarly in arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts:

&usb_1_qmpphy {
	vdda-phy-supply =3D <&vreg_l3c_1p2>;
	vdda-pll-supply =3D <&vreg_l4a_0p8>;
}

> =20
>  	orientation-switch;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-phy-supply=
-fix-v1-0-5880630cde3e@oss.qualcomm.com?part=3D13
