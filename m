Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD29B346ACE
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 06:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739454; cv=none; b=UZ4P9wog/iCAqphjlU0bPNJ09sV/Idb+ILFxktlWSAFiFX0Rz7IBqFVXTQ64z0URzBzOnLiy/KAWHUCePkNeUlMzh0UAzWmmVV7tfxuwwJoz8Fm9ZYk8FD7Q9i9XF1EC66+ffYlhHkyP7sNv6c59ADamiZsB3Q1x3Xnz+jaiPMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739454; c=relaxed/simple;
	bh=nurApI05n6iuTDMDQ15ohrIqAH0NFbVe+9iY96xyi28=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=McmbFpBEWeDF6/iW3gGhaslwEbnkE7doo/3pKtDMAkiAn/f2tPIxPSTFv57uvFh4W3LazYd0iWpzewiwbKx50ntkAt1kOVniGF3kNrz8y1IjtYkpkfDU3lHiP0BzPXZJWJACttQI8OJmO6Cz9K3ngxNU+Un6gSvC9xSnwNEw5ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XuJOPrDc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XuJOPrDc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2201F000E9;
	Mon,  3 Aug 2026 06:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785739453;
	bh=TiBAMU42MoBrHrKTWd5F0iB6qS7UZaEndqEkWYy35EE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XuJOPrDcamIo1CHQNZE9uXhJkzo7BAcUPoSvd8BoZgsAVbBAdfqL5XUDEC6oeJs7K
	 IM0ox9yeMFdMtbdobCqENHBrr/N2wQcBMPsbUbzFQM7wQJMpWJ7P2okHUEXajrtL5O
	 irMSRmUlhrN3ZbUYvmLBMAv/S+DCaddRMHJt8YKUH9gM9WDhNaettpGROBSxzWrPsk
	 dHiqxg+df4o+bQCnropgD9wqqFVWGVfJhBfvIBpJnY61ge/ZC9gLcJoXjTc5FmGvIo
	 RDBTCqyrkFgzVF3GgD0nH0t1H2U5Dryd/9ybvATBZLEpD0kf1lLSWtXgx64xsEOUQh
	 mH8qKS4fU7mKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/28] arm64: dts: qcom: sc8280xp-blackrock: Fix swapped
 USB QMP PHY vdda-phy/vdda-pll supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-phy-supply-fix-v1-2-5880630cde3e@oss.qualcomm.com>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-2-5880630cde3e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 06:44:12 +0000
Message-Id: <20260803064413.4F2201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The DP and PCIe QMP PHYs in the blackrock device tree suffer from =
the same swapped voltage supply bug that the commit fixes for the USB PHYs.
--

--- Patch [2]: [PATCH 02/28] arm64: dts: qcom: sc8280xp-blackrock: Fix swap=
ped USB QMP PHY vdda-phy/vdda-pll supplies ---
commit 2ff4552e01c34fa2dc6f9a24da3173abd76e8b38
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: sc8280xp-blackrock: Fix swapped USB QMP PHY vdda-phy/vdda=
-pll supplies

The QMP PHY expects the vdda-phy supply to be around 0.88V and the
vdda-pll supply to be 1.2V. But these two supplies are swapped for the
USB QMP PHYs on this board, feeding 1.2V to vdda-phy and 0.9V to
vdda-pll. This commit fixes the issue by swapping the two supplies back.

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/=
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> index 125af356e24b9..4e74eda7405f3 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
[ ... ]
> @@ -1040,8 +1040,8 @@ &usb_1_hsphy {
>  };
> =20
>  &usb_1_qmpphy {
> -	vdda-phy-supply =3D <&vreg_l3b>;
> -	vdda-pll-supply =3D <&vreg_l4b>;
> +	vdda-phy-supply =3D <&vreg_l4b>;
> +	vdda-pll-supply =3D <&vreg_l3b>;
> =20
>  	orientation-switch;
> =20

[Severity: High]
This is a pre-existing issue, but it looks like the DP and PCIe QMP PHYs in
this file suffer from the same swapped voltage supply bug.

For example, in the mdss0_dp2_phy node, vreg_l3b (1.2V) is used for vdda-phy
and vreg_l6b (0.88V) is used for vdda-pll:

	vdda-phy-supply =3D <&vreg_l3b>;
	vdda-pll-supply =3D <&vreg_l6b>;

Similarly, the pcie2a_phy and pcie4_phy nodes both incorrectly use vreg_l4d
(1.2V) for vdda-phy and vreg_l6d (0.88V) for vdda-pll:

	vdda-phy-supply =3D <&vreg_l4d>;
	vdda-pll-supply =3D <&vreg_l6d>;

Operating these PHYs with the swapped voltages might cause hardware
instability or functional failures. Should these nodes also be updated to
fix the swapped supplies?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-phy-supply=
-fix-v1-0-5880630cde3e@oss.qualcomm.com?part=3D2
