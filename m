Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6572D97BB
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 06:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739305; cv=none; b=gQbvVu07OtedjsP1ehY6KubZk0J5MkjA63WrH9d6vGKJtyKnXd3coEBIcHgy13k7976t8nQOqoJGu3JYctFt4yo2H/VGJrikObkuey5dKajWBb320k716H6tOQaAxaoohrA+khCIFtTWDgA1B6lMv0heeemSrtnxhC65q9Pzybk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739305; c=relaxed/simple;
	bh=quy8ExEuB2/g1r5y1Q8KfVy2A6LXm8Rw7nX+v4woARo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pGqsoJ65YxXBiy6+tbBIhpmF0TCGHv66fP3YmxGnq34D/17uy2X0BtRFaicZiA5knfRM+n/H5etdlUk6dea+hvk+e3ju0d7altSdpqXxHZeIvT8HJWZvo9B2XdR0gZkgv0O/gt/Rr6MS+qAX0Xeeg0D5YZWhxiI3pVawOtyZaes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSLBeMNW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSLBeMNW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04F61F000E9;
	Mon,  3 Aug 2026 06:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785739304;
	bh=s4px+AwciG4tIavxqnQP6G9xCQEX8bXbucWgY/1DHJ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jSLBeMNWgdrHeRD36HM/SbxhGIIx438BGt4QhKkX93ijx0zXZNoqNzsxUnT6GBtlE
	 iuHhvaRaSUV6f67L4tMgCpGwHRy26BHAWnMb9CssVY9sTtp7iTbkIqRvHgmN6J6OL4
	 ewvWiFseol7QOCQ6UsiN1nzF2WWEz/UN2noZ06QBFjEmEOb07OZT3K13vNd21uMRX/
	 QiGYWXhWEmlNHJbpk8upBTYf20FIRjEjDAmWIfb7LQJ8YvxpQ8ezFzqjVXoz99bXp6
	 KCZ4/BlZljeKv3V/Tw5lBOXGswv7YSfgzGbZRe6dYdgKkYDinefUcay8kcfBCfsUDK
	 LjB1T3WcRIh6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/28] arm64: dts: qcom: sm8550: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803-phy-supply-fix-v1-10-5880630cde3e@oss.qualcomm.com>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-10-5880630cde3e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 06:41:43 +0000
Message-Id: <20260803064143.E04F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch series fixes swapped `vdda-phy-supply` and `vdda-pll-sup=
ply` regulators for several boards (e.g., sm8550), but misses identical swa=
ps in other QMP PHY users across the tree (e.g., sm8650, sm8750, x1e80100).
--

--- Patch [10]: [PATCH 10/28] arm64: dts: qcom: sm8550: Fix swapped USB QMP=
 PHY vdda-phy/vdda-pll supplies ---
commit c8c05b6ce3c72eb6b9fb37b78a8e1a5e58bf14e9
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: sm8550: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies

This commit corrects the swapped vdda-phy and vdda-pll supplies for USB QMP
PHYs on several SM8550 boards. By swapping the regulators back, it ensures
the PHY receives the expected 0.88V instead of 1.2V, and the PLL receives
1.2V instead of 0.88V.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8550-hdk.dts
> index ee13e6136a825..25ff5e39dd346 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -1374,8 +1374,8 @@ &usb_1_hsphy {
>  };
> =20
>  &usb_dp_qmpphy {
> -	vdda-phy-supply =3D <&vreg_l3e_1p2>;
> -	vdda-pll-supply =3D <&vreg_l3f_0p88>;
> +	vdda-phy-supply =3D <&vreg_l3f_0p88>;
> +	vdda-pll-supply =3D <&vreg_l3e_1p2>;
> =20
>  	status =3D "okay";
>  };

[Severity: High]
This is a pre-existing issue, but does this same regulator swap bug affect
other boards across the tree?

Looking at other device trees, it appears the 1.2V and ~0.88V supplies
might still be swapped in several other QMP PHY configurations. For
example, in arch/arm64/boot/dts/qcom/sm8650-mtp.dts for usb_dp_qmpphy:

        vdda-phy-supply =3D <&vreg_l3i_1p2>;
        vdda-pll-supply =3D <&vreg_l3g_0p91>;

And similarly in arch/arm64/boot/dts/qcom/sm8750-mtp.dts:

        vdda-phy-supply =3D <&vreg_l3g_1p2>;
        vdda-pll-supply =3D <&vreg_l2d_0p88>;

Even the Snapdragon X Elite ecosystem seems to exhibit this pattern, such as
in arch/arm64/boot/dts/qcom/x1e80100-qcp.dts for usb_1_ss0_qmpphy:

        vdda-phy-supply =3D <&vreg_l2j_1p2>;
        vdda-pll-supply =3D <&vreg_l1j_0p8>;

Supplying 1.2V to the 0.88V PHY domain and 0.88V to the 1.2V PLL domain
might prevent the USB/DP PHY PLL from locking and risk hardware degradation
due to overvoltage on the PHY pins. Should these other boards be updated
with a similar fix?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-phy-supply=
-fix-v1-0-5880630cde3e@oss.qualcomm.com?part=3D10
