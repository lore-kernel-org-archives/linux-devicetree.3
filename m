Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58615399889
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 06:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740369; cv=none; b=Cnsuwv7GWzOCFC2Xoykbuan7o500r9XtTZUYulfgYV8zEWVm23BA9C41zPsE6HZ2fTU0nwlQotywiBoM11NeZBz0MNh8DcRZ2+KMuISbxNFaCV5XDS/sxdICMcFmKBKqqTKnucljEDaIC70Fn+yS8lL1I/36WpksfJDiWaWpfzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740369; c=relaxed/simple;
	bh=zOULU+P/DfoClBw3sh++8jYHeMydusG5LJUppqhwPvU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GYt28dBUQ7ER8h06J05y8QWFbbqapN3lyKPV/mDKxgp4ePBdEoR4DLf1ahSI+/G3IOZKCAACNgcXS3pTNwFtaoNJVnTQvKayTfM+PH++0N9BQIwkjNNlU0gBkjQ3hdabsRK8ACXkvl+feahERep7ksPqBMFvEiJZ6PpuqGIW+HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKPSAAuk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKPSAAuk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9446B1F000E9;
	Mon,  3 Aug 2026 06:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785740367;
	bh=ZSV+gD9AHWkJ86NdJgfEE9NsQ0jrVRDalTuEj0vxNmM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lKPSAAukwPOtxijv/omk+/qxe+YMi/LvZoeS2Br+THxXT3PKT01Awj/hUsdppSO+o
	 aCjvV8cB+hDDsIqskrX5JLVHe2hEc3GH+WRtI8o3eauKK8jZeJi465w9j0Imp7wUNA
	 Gg/n176E/UXyRyYfxT+2WT2Yba4Tbw2FglO9wQ7T+w/J5yyOY/y2yk5Ynsm4DH6GJI
	 /C4C8NwLURrVqAzTzzn8MP0PvF0EJ8sTz9j08D3e7RTPd066LBdywJ+D2XUkP4K581
	 O5BE7CBmZGAy0ZAccbGE029Rxh9MM1yJQwXuAiJupRxR27DUzKXsvD+20bxy6F0EZN
	 i/LhQANTTVWEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 25/28] arm64: dts: qcom: lemans: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-phy-supply-fix-v1-25-5880630cde3e@oss.qualcomm.com>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-25-5880630cde3e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 06:59:27 +0000
Message-Id: <20260803065927.9446B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The commit incorrectly swaps the `vdda-phy` and `vdda-pll` supplie=
s for the USB QMP PHYs, violating the driver's load current expectations an=
d risking PHY instability due to incorrect PMIC configuration.
--

--- Patch [25]: [PATCH 25/28] arm64: dts: qcom: lemans: Fix swapped USB QMP=
 PHY vdda-phy/vdda-pll supplies ---
commit b0df92fb00420a27d33768ecf9f99505036be942
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: lemans: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies

This commit swaps the vdda-phy and vdda-pll supplies for the USB QMP PHYs
on the Le Mans boards. The change ensures the lower voltage is mapped to
vdda-phy and the higher voltage to vdda-pll.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dt=
s/qcom/lemans-evk.dts
> index 34dfc8d22b6a5..b835fce8b336f 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -1008,8 +1008,8 @@ &usb_0_hsphy {
>  };
> =20
>  &usb_0_qmpphy {
> -	vdda-phy-supply =3D <&vreg_l1c>;
> -	vdda-pll-supply =3D <&vreg_l7a>;
> +	vdda-phy-supply =3D <&vreg_l7a>;
> +	vdda-pll-supply =3D <&vreg_l1c>;

[Severity: High]
Does swapping these supplies in the DT without updating the phy-qcom-qmp-usb
driver violate the driver's load current expectations?

The phy-qcom-qmp-usb driver fetches the regulators by name (vdda-phy and
vdda-pll) and applies hardcoded init_load_uA values (21.8mA and 36.0mA,
respectively).

Because the DT names are swapped by this change, the 0.8V regulator is
incorrectly provisioned with the 1.2V rail's load request (21.8mA) instead
of its required 36.0mA.

Could this under-provisioning cause the RPMh PMIC to place the LDO in Low
Power Mode (LPM), leading to voltage droop and USB link failures when the
hardware draws its required current?

> =20
>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-phy-supply=
-fix-v1-0-5880630cde3e@oss.qualcomm.com?part=3D25
