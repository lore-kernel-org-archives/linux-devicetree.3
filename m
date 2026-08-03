Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9353043DC
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 06:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739480; cv=none; b=c3H/wc7evwpke0AiJPOtKfzjImxxrCxyYfmjYPU4cFMzLvq2UXyQNNLjn5pHQSsJjIrD7jwj8rIuqEdhmL8z5KCJUO8gmD0U7xGMNGKXLpa1FJmHe3Dis8hZyWn9lvqU7WtZLbI8SAeMN7iSzkl34lmL5af4X7j56SnTOxPmNJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739480; c=relaxed/simple;
	bh=xhZB53F9rV7D4Q7MkT19TH7ddnFtsvXCNzmkMESE74Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sN/oPi76Byx3B4muSNEnd5X2XCPm3fTF+lRvf7/E8M+rTJ4n2gEKAGsW0iIhfaftQxEPL78pf917PuHtcTnDprU5QG7UgEUBok5VYcpLo5K9qSoVlf9zzuNaq/qnUHvJC7i2nE1x/n6QeDSVDVMYAvyibeBi1n5LzGUVAAlHWqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RuGTupHP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RuGTupHP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0871F000E9;
	Mon,  3 Aug 2026 06:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785739479;
	bh=wx20YfLPnAk+fm9tsFvnM1v/zEznAFiAiPJvt3aHHJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RuGTupHPIF2n6KCZ73zIJventI6lgSAtRDARM9+SFT/54Eu2It1E3yG6nueY7v9dP
	 gztO0MOnGPdFIl8cBD1uFhAVcwalddhSI2qqnYeW7jsa8Vk8W19GpiO21R65CYREy6
	 +A8C2XgTOdJayVGZd8CFwJCvgDtiuFflivyzAr1NcAwxBBNW/qdoNUOVlle0UvQUT/
	 VCx0HNoSDCrVhQQ/M2BAj95w7FHDpYS6hWZ5aYGpsLLkqyunpeFqKD39BqRXRAe+HM
	 Eof8ClFu6MGyBJohqfUwnbv5eqh/DKQZwEU8Fjx4DR5KiHcFAdW6Ir1x+083grLYzG
	 1yPtlnBHPS/UA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/28] arm64: dts: qcom: sdm850: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803-phy-supply-fix-v1-5-5880630cde3e@oss.qualcomm.com>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-5-5880630cde3e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 06:44:38 +0000
Message-Id: <20260803064439.0D0871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix: QMP USB PHY vdda-phy and vdda-pll supplies remain =
swapped on SC7180 and SC7280 boards.
--

--- Patch [5]: [PATCH 05/28] arm64: dts: qcom: sdm850: Fix swapped USB QMP =
PHY vdda-phy/vdda-pll supplies ---
commit 65f1a14faee30f3ce9d68212652a11c2bcb4b004
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: sdm850: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies

This commit resolves swapped vdda-phy and vdda-pll supplies for USB QMP PHYs
on several sdm850 boards. It ensures the vdda-phy receives the expected 0.8=
8V
instead of 1.2V, and the vdda-pll receives 1.2V instead of 0.88V.

> The QMP PHY expects the vdda-phy supply to be around 0.88V and the
> vdda-pll supply to be 1.2V. But these two supplies are swapped for the
> USB QMP PHYs on these boards, feeding 1.2V to vdda-phy and 0.88V to
> vdda-pll.
>=20
> Fix it by swapping the two supplies back.

[Severity: High]
This isn't a bug introduced by this patch, but it appears the identical
configuration remains swapped on other boards, such as SC7180 and SC7280.
For example, in arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:

    vdda-phy-supply =3D <&vdda_usb_ss_dp_1p2>;
    vdda-pll-supply =3D <&vdda_usb_ss_dp_core>;

And similarly in arch/arm64/boot/dts/qcom/sc7280-idp.dtsi:

    vdda-phy-supply =3D <&vreg_l6b_1p2>;
    vdda-pll-supply =3D <&vreg_l1b_0p8>;

Since vdda-phy receives 1.2V and vdda-pll receives 0.88V/0.9V on these pins,
could this cause hardware damage over time or prevent the USB PHY from lock=
ing
on these systems as well? Should these other boards be included in this fix?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-phy-supply=
-fix-v1-0-5880630cde3e@oss.qualcomm.com?part=3D5
