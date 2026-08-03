Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3298C30D3E2
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 06:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739408; cv=none; b=ik79PZwVIByyokDzXr1Vx/ZePxHNcTZ/jLF9iaGeNR8X8BdQSCeAaG5ah06fi656j310NiJp5KDpjZLZrNL7dFzxgJUkw+kb4LzKEhrE55tvxY0oz/dzDEOTfRDku8Ier142eqMLOYHOpQFiFovTsNYu9DTOBnmsoNUVku901Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739408; c=relaxed/simple;
	bh=oo93RsyqZho96rNge4LCFJJdtzeBXIhoUvhTvucF+zc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=stg+88PmPcuk0K6o9w9eC1kIVec+8ig+6IRdM00hcTTAcVh0ddMa4/stU4hWE+9hkzZXDP0avd7UP9OuzwbIX/yzsuefyhtA6oRTgICktrHiIPvXiCDcslre1ikLg+sQwNx4E0mE6hDaxS3j+xIaAf1Icq03bqHZ8BqL9J5sFME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQ0TXSqR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQ0TXSqR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916CF1F000E9;
	Mon,  3 Aug 2026 06:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785739406;
	bh=1Li6MTNCfYxiexthaiuTmT54vEGeYtIUwYvbEDF5RxE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TQ0TXSqRAxDtvX7o54KfZpL10qHf/vQjGcUW5tmSuVdz++WRQB49Q9U1pj+okZLuh
	 9rRPzMXyLTc9Y6zDD57y+T2N5+CYfjp4w/kug5HlbZ6yNcq5ejcj2MvZUlB8vsh+94
	 JWJXkJ+TNjtTfzxMH7ZTDYO+x33fSivCgGCwOW6gqVZCH4XLdSf3m++xJrAGi7PR4z
	 TByKZuhf5SLloumOvzEikHTpWedcWTxBPZXos3O7Baw1AlX9lR0IMLJTE+5IyL4jCW
	 QKDVqBZ484Vc6fJW3B1D9sJMUEH3EoPeZvF63THyuurvwX0er7VHd9yhvZbGeU2CpW
	 gzew03AOHyaGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/28] arm64: dts: qcom: sm8450: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260803-phy-supply-fix-v1-9-5880630cde3e@oss.qualcomm.com>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-9-5880630cde3e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 06:43:26 +0000
Message-Id: <20260803064326.916CF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix: Swapped QMP PHY `vdda-phy` and `vdda-pll` supplies=
 are also present on many other SoC platforms.
--

--- Patch [9]: [PATCH 09/28] arm64: dts: qcom: sm8450: Fix swapped USB QMP =
PHY vdda-phy/vdda-pll supplies ---
commit b676d59f3c957659ff365b6c3e896016ef8c4405
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: sm8450: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies

This commit swaps back the vdda-phy and vdda-pll supplies for the sm8450
USB QMP PHYs. The supplies were previously swapped, feeding 1.2V to a 0.88V
line and 0.91V to a 1.2V line.

> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8450-hdk.dts
> index b37998cd9a2c3..4ade28f40cae0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -1214,8 +1214,8 @@ &usb_1_hsphy {
>  &usb_1_qmpphy {
>  	status =3D "okay";
> =20
> -	vdda-phy-supply =3D <&vreg_l6b_1p2>;
> -	vdda-pll-supply =3D <&vreg_l1b_0p91>;
> +	vdda-phy-supply =3D <&vreg_l1b_0p91>;
> +	vdda-pll-supply =3D <&vreg_l6b_1p2>;

[Severity: High]
This is a pre-existing issue, but does this same swapped regulator bug exis=
t=20
in other board files that should also be addressed?

For instance, looking at arch/arm64/boot/dts/qcom/sc7280-idp.dtsi in &usb_1=
_qmpphy:

	vdda-phy-supply =3D <&vreg_l6b_1p2>;
	vdda-pll-supply =3D <&vreg_l1b_0p8>;

And similarly in arch/arm64/boot/dts/qcom/qcm6490-idp.dts in &usb_1_qmpphy:

	vdda-phy-supply =3D <&vreg_l6b_1p2>;
	vdda-pll-supply =3D <&vreg_l1b_0p912>;

Should these other boards also be included in this fix to prevent overvolti=
ng
the PHYs on those platforms?

>  };
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-phy-supply=
-fix-v1-0-5880630cde3e@oss.qualcomm.com?part=3D9
