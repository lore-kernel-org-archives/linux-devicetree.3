Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DC42D97BB
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 06:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739419; cv=none; b=cZ+mOmth43WsgP2INxNF68q+I7aI8ox/jHMxFDtUmgPOx+PDvKhHqQXHiGTjI6PsHszXovwfQ2U6iKYT8z9OqeuVd1reSU0EBX4BDmvyTig8VeyqHA1JBVx6z3TLAScQgaHhL3zdHygiVMPhJ4kv2lX561YoE2bEXf9AMCESjMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739419; c=relaxed/simple;
	bh=+vOBJ78JND3i4Py92vKuwzVr9S/mD0NTnyrXy0/JJ4U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FFXPsHzi3PSYSTpM+hMtRlkOLRmEboxFRiaamFnNxiUFhJV71O07P8WMDyuQ/o6be+dywfT2b9vcp9Gef9f/b7bnIjm1yncO6nSLkRS1OtM1iGDuOV0NCDK2OW48qc4WWuKwAcUqg7xZ8fOCN5zRTzXQ3Q/7DpODsVk9blo762Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAULnaRg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAULnaRg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699E41F00A3A;
	Mon,  3 Aug 2026 06:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785739417;
	bh=PpGyw3/RQtPTD/SGMMr3IkZ66+vKmL3XdU7TlL7xe1o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lAULnaRgtB2ok4jEQXvZPD42mlKG8RqxEXKafqL50cuWm6FjV064uJQ4zJd51DMlx
	 hzvgJEKM6Vumy2221AevZLJapKbygrSOTFAOMdDMDuCBIN4DZLXS23ytFZziQl/NVo
	 6YgOpo93SXfLS6xqJJpNFpkv1U4Rw5/49CxyqVK+cMZE9OSFgZ2M1opgiICJYgE1x4
	 fobUnnsCfUFBZQQIzXcm6cLAtDNsbpj10pzQOEZwn66n7m66EgNYDPriLTviwq9HpZ
	 N0mp84230iCFGfLng+KG3dQz2JbObkkWt+1V66ZXjSR/d3tPJr5hAQE89vxy5OJfuq
	 P4spsHF9rIPQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/28] arm64: dts: qcom: sdm845: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-phy-supply-fix-v1-4-5880630cde3e@oss.qualcomm.com>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-4-5880630cde3e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 06:43:36 +0000
Message-Id: <20260803064337.699E41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch fixes swapped `vdda-phy` and `vdda-pll` supplies for USB=
 QMP PHYs on SDM845 boards but overlooks SDM850 boards, which suffer from t=
he exact same hardware misconfiguration.
--

--- Patch [4]: [PATCH 04/28] arm64: dts: qcom: sdm845: Fix swapped USB QMP =
PHY vdda-phy/vdda-pll supplies ---
commit bbec7ae85a9540fb8dbd59aa76f0e1c5b71911a4
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: sdm845: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies

This commit swaps the vdda-phy and vdda-pll supplies back to their proper
voltage levels for USB QMP PHYs on various SDM845 boards. It corrects a
misconfiguration where the PHY was incorrectly fed 1.2V and the PLL was
fed 0.88V.

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot=
/dts/qcom/sdm845-db845c.dts
> index 02416812b6a7f..846138149b2cd 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1121,8 +1121,8 @@ &usb_1_hsphy {
>  &usb_1_qmpphy {
>  	status =3D "okay";
> =20
> -	vdda-phy-supply =3D <&vreg_l26a_1p2>;
> -	vdda-pll-supply =3D <&vreg_l1a_0p875>;
> +	vdda-phy-supply =3D <&vreg_l1a_0p875>;
> +	vdda-pll-supply =3D <&vreg_l26a_1p2>;

[Severity: High]
This isn't a bug introduced by this patch, but this patch appears to miss t=
he
identical sibling SDM850 platforms, leaving their PHYs operating with inver=
ted
voltage supplies. Should the SDM850 boards also be updated to prevent hardw=
are
stability issues?

For example, on the Huawei Matebook E 2019
(arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts), the primary a=
nd
secondary USB QMP PHYs still have their supplies swapped:

&usb_1_qmpphy {
	...
	vdda-phy-supply =3D <&vdda_usb1_ss_1p2>;
	vdda-pll-supply =3D <&vdda_usb1_ss_core>;
};

&usb_2_qmpphy {
	...
	vdda-phy-supply =3D <&vdda_usb2_ss_1p2>;
	vdda-pll-supply =3D <&vdda_usb2_ss_core>;
};

The same misconfiguration is present in sdm850-lenovo-yoga-c630.dts and
sdm850-samsung-w737.dts. Does this leave the vdda-phy logic on these boards
overvolted by ~36% (1.2V instead of 0.88V) and the analog PLL undervolted
(0.88V instead of 1.2V)? Could this lead to decreased hardware stability,
PLL unlock issues, or long-term degradation of the silicon?

>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-phy-supply=
-fix-v1-0-5880630cde3e@oss.qualcomm.com?part=3D4
