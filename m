Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3707739BFE1
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 06:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739887; cv=none; b=ukk41ESJDXpiwUxOhhzK+lnUGu84wXo/DHMPNIBZ6i6nyN2T1yXoDiCwzRHH0+InywcTkO2sJC3JniA++RS31o/OcVsiN1xpM2NhEhcb2CCUS0sirYRbF3h0op/uxZrMpvKBQ3ze7I0bFkUlMlCD5QmlcwJqsknAl1jXTArSxoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739887; c=relaxed/simple;
	bh=n29cXHjyGVurmzIyiizjia229RnVU81KLbirtSV+cEc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V1oA94lBv6O5T/eYln3Ma1mva+RXTmc0MafNNhaNXG04Zz7lGZoA9HlXsuBwWOcAmE0q0nK/e+9Ykf/ZEU9yovABVx7BVQZfhY5IxuE78Iog2miZLVZLQPVvqccoQVen+hLZY4IEocEcHY94LT7XnRAo4xA3iWQLff1J8BBkYqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OeucLtPt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OeucLtPt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78C81F000E9;
	Mon,  3 Aug 2026 06:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785739884;
	bh=aKB0iMZs3PXItlfb/YuVwNUh3jajcsBRYOb8F8ulKoU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OeucLtPth8FHv31kSfHZ0/sVltirpcAWfddq+5Yjvfu7a57flX/nrXNH2WAprYRn2
	 GNfvTUu/UQ/NAkedeqRrwMX4JFaQ65COc9YBe4d/LXUWhCJTfC83kYclaDx2nZrqqD
	 zfl40+VYbwDv9IzlCYvRstHa+Y7nttOgAA/Kck4TYzJbSh/Lj3LsJMgXsywgP8QZrp
	 eqeaMuPnrZ/wwp4kAIO+AnB7byJKXYY3+/WdQZG/6FmckofZ6Z99YlDitGw7itBiUq
	 pSvu6TQcIb6hpn6kuzjphHo50ZMmrQQ/cWo7O/uqlMx/FNiRF8eMu3gIo/E3sY+Brw
	 1TBRjCdh28BSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/28] arm64: dts: qcom: sm8350: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803-phy-supply-fix-v1-8-5880630cde3e@oss.qualcomm.com>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-8-5880630cde3e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 06:51:24 +0000
Message-Id: <20260803065124.B78C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] Incomplete fix for swapped USB QMP PHY vdda-phy/vdda-pll supplie=
s across the QCOM devicetrees. The same reversed regulator configuration re=
mains unfixed in several other SoCs, notably SM8450, SM8550, and SM8650.
--

--- Patch [8]: [PATCH 08/28] arm64: dts: qcom: sm8350: Fix swapped USB QMP =
PHY vdda-phy/vdda-pll supplies ---
commit 2073beeb341c58218ee83d7e126de860cc972a2f
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: sm8350: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies

The commit fixes a hardware configuration issue where the vdda-phy and
vdda-pll power supplies for the USB QMP PHY were swapped in SM8350
device trees. It corrects the assignments for the HDK, Surface Duo 2,
MTP, and Sagami boards so they receive the expected ~0.88V and 1.2V
respectively.

> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8350-hdk.dts
> index 5f975d0094658..b43dbb5921b18 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -860,8 +860,8 @@ &usb_1_hsphy {
>  &usb_1_qmpphy {
>  	status =3D "okay";
> =20
> -	vdda-phy-supply =3D <&vreg_l6b_1p2>;
> -	vdda-pll-supply =3D <&vreg_l1b_0p88>;
> +	vdda-phy-supply =3D <&vreg_l1b_0p88>;
> +	vdda-pll-supply =3D <&vreg_l6b_1p2>;
>  };

[Severity: Medium]
This is a pre-existing issue, but it looks like the swapped regulator
assignments remain unfixed in several other device trees.

For example, in sm8450-hdk.dts, usb_1_qmpphy still has a 1.2V supply assign=
ed
to vdda-phy-supply and a 0.91V supply to vdda-pll-supply:

arch/arm64/boot/dts/qcom/sm8450-hdk.dts:usb_1_qmpphy {
	status =3D "okay";

	vdda-phy-supply =3D <&vreg_l6b_1p2>;
	vdda-pll-supply =3D <&vreg_l1b_0p91>;
};

The same uncorrected pattern appears in sm8550-hdk.dts and sm8650-hdk.dts=20
for usb_dp_qmpphy, as well as in sm8450-sony-xperia-nagara.dtsi.

Should these other device trees be updated in a follow-up patch to ensure=20
their PHYs receive the correct voltages?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-phy-supply=
-fix-v1-0-5880630cde3e@oss.qualcomm.com?part=3D8
