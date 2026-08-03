Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DAD25B0B3
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 06:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739387; cv=none; b=N/YIiw9c9osltoaL5dd4FTSM2ICU0OF4tiX8mv7nA644o8/kMm8ucvfSW5HgFwWtQzX076afMcos29JqZbeXu5OmDyOwhPijxArVWwc/38/PQfeIcDlAeLrQGLhY5ZjVIT99zkrXuyWXPh/bw1JDBk1i3rHLP0IV3TrStiQ6SHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739387; c=relaxed/simple;
	bh=HHKTvqYCVl4+R1vEPhOGUV5cB2WIvqoGAGilvJr6kSY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bEVnxC9fPs//Gn6rY0TXBa5OgmfEBx1jvTdreTrkZeXc8NqTZZJ/rHpD2zgt985u4IRYl6E0fXNCAAXpQvTVF37BhqvjwyeMUHUpJ10fgr680kTUacZFG5KL4e5O31e7mM58hjvueQPUg+fUGq5vSKt6VKFSE4HeQBgxQwci/Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8N6UjeA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8N6UjeA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03991F000E9;
	Mon,  3 Aug 2026 06:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785739386;
	bh=I1bGjbKu3QDPPgi5czBqCv6QD8EnP2WWoLsk97ewQH8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U8N6UjeAzBoFp2oXlAoQbB7KkMtgLnWS+1MPD342cj4Y4JFH2gPgDCaPT2AOuO9qr
	 ZwHZGVd1nSc5KdTqrYT13nnz81fQbxpDKrj2NO49jQJjTuskhM23AfZkhDGjw0R+VT
	 wHkwgIX4mwno3DFNWtzAWB6shskgTSTokFmuj/E2P2M1WogCw+lM/hv/Ut9eqgWqTG
	 ou5Beqkild0GEjTt0Im0cvFNaRuPUZaItJoDFRy7aICUZbGAP9lUnEhA0eQ1svYNxo
	 to/LvrO5oksUSgoAVnwYpSwNw13DINvq9+bri5Rqsxm1e+FNKRvaFfD+r0Q8yVJVl6
	 QoKtFgFXX6Spw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/28] arm64: dts: qcom: qcm6490: Fix swapped USB QMP
 PHY vdda-phy/vdda-pll supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260803-phy-supply-fix-v1-12-5880630cde3e@oss.qualcomm.com>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-12-5880630cde3e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 06:43:05 +0000
Message-Id: <20260803064305.C03991F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch series corrects the swapped `vdda-phy` and `vdda-pll` su=
pplies for several QCM6490 boards, but misses numerous other QCS6490, SC728=
0, and SC7180 boards that suffer from the exact same misconfiguration.
--

--- Patch [12]: [PATCH 12/28] arm64: dts: qcom: qcm6490: Fix swapped USB QM=
P PHY vdda-phy/vdda-pll supplies ---
commit 25fe3724f708ab3e601c6a304dd1dd8d5ed9eef1
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: qcm6490: Fix swapped USB QMP PHY vdda-phy/vdda-pll suppli=
es

This patch fixes the swapped vdda-phy and vdda-pll supplies for the USB QMP
PHYs on several QCM6490 boards. The QMP PHY expects 0.88V for vdda-phy and
1.2V for vdda-pll, but the device trees previously supplied 1.2V to vdda-phy
and 0.9V to vdda-pll.

> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/ar=
m64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 04cb9230d29fd..92a7d80b7fee6 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -1502,8 +1502,8 @@ &usb_1_hsphy {
>  };
> =20
>  &usb_1_qmpphy {
> -	vdda-phy-supply =3D <&vreg_l6b>;
> -	vdda-pll-supply =3D <&vreg_l1b>;
> +	vdda-phy-supply =3D <&vreg_l1b>;
> +	vdda-pll-supply =3D <&vreg_l6b>;

[Severity: High]
This is a pre-existing issue, but while you are fixing these QCM6490 boards,
it looks like several other boards in the tree suffer from the exact same
swapped regulator configuration.

Should these boards be fixed as well to avoid over-volting the phy domains?

For example, in arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts:

&usb_1_qmpphy {
	vdda-phy-supply =3D <&vreg_l6b_1p2>;
	vdda-pll-supply =3D <&vreg_l1b_0p912>;

And similarly in SC7280 and SC7180 boards, such as
arch/arm64/boot/dts/qcom/sc7180-idp.dts:

&usb_1_qmpphy {
	vdda-phy-supply =3D <&vreg_l3c_1p2>;
	vdda-pll-supply =3D <&vreg_l4a_0p8>;

Other unpatched boards with the same misconfiguration in usb_1_qmpphy inclu=
de:
- arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
- arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
- arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
- arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
- arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts

> =20
>  	status =3D "okay";
>  };

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-phy-supply=
-fix-v1-0-5880630cde3e@oss.qualcomm.com?part=3D12
