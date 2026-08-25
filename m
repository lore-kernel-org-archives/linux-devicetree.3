Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D5E38DC60
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787652444; cv=none; b=lk5bI/5yHa0jFJgfLGocMzqrwtp3qfSLv1O6gLgdQNFxnpz2J61Ygj+vwy2T60EPeJZhJErrxp/qLIPyhgL+Zf+dEi1qygCRhqct+WINM4PdG3B6+CxAyGvcVboSabru4LvhY5K0pWrgYRt5VWTciqOHVzHCDBC4RuxnkAeI84c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787652444; c=relaxed/simple;
	bh=+DkQiq6S29hSrQfiI6sx2Ou2lktEWcfzU8TxRZsMPZI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m8zvAdfZpHl7SgPTrHPj11ZiVEHeoWLshs/QSyNalT2PYpGHL6DnSGJJmIFjzBSgmQKWRRjoTXU7Y7pLOwEYe82hmVD1k3jkHeDiKBRc3hpTHFq0YlWJTOCkvTvCYLSSzlYyyROSMXa89Z2Z8zQGhDxXyPxTfHjMJboVTWEk+38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UiTh88DS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UiTh88DS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEA41F000E9;
	Tue, 25 Aug 2026 10:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787652442;
	bh=tZqqmyGFEsBgV2Lyznf9dxbQQTKZUtvCmFkeoYQKNPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UiTh88DS1XirkJqcpL4l8GBVXkVc15FcSaru71XWsH0TOs/fkBoCfbA/fHx+99Ths
	 aJh5CQoiqziR9WCtew8lPDqOmjw9IZUycLG0Ts5kLptPX2FTaYFLYojO/9+QTfx9aY
	 IEi7tfZPO+LwxZy7njnwajDVKx6BIz6pSkroim58csJgrd0ZohqJYjrknBVLY12GMj
	 6zv0qw+UhM668oSAzn69DgOGUcWu51DPTmWvSo24jA7Ge24MEjmEnDz56GIc/Z/kVa
	 gdCHUsQ77CfITWhO30Knb0C959wfB4iH/TWI0KjN1sVgfm2HfnnQLPh8JRXyeU9pVQ
	 QX3cwMGXr8uvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock to
 GCC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v1-1-f0d3719f798c@oss.qualcomm.com>
References: <20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v1-1-f0d3719f798c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 10:07:22 +0000
Message-Id: <20260825100722.9CEA41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect macro used for a clock specifier in devicetree (PHY ID us=
ed instead of clock ID).
--

--- Patch [1]: [PATCH] arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock=
 to GCC ---
commit d454bba6f2028b4ff89f276f88a76156819977d9
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock to GCC

This commit connects the QMP PHY USB3 output to the GCC clock controller
so the USB3 PHY pipe clock can propagate to the USB controller.

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qc=
om/eliza.dtsi
> index 66ea4aaafd73a..2e0fbbfcc47d3 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> @@ -655,7 +655,7 @@ gcc: clock-controller@100000 {
>  				 <&ufs_mem_phy 0>,
>  				 <&ufs_mem_phy 1>,
>  				 <&ufs_mem_phy 2>,
> -				 <0>;
> +				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;

[Severity: Low]
Does this use the correct macro for a clock specifier?

It looks like the PHY ID macro QMP_USB43DP_USB3_PHY is being used here
instead of the clock ID macro QMP_USB43DP_USB3_PIPE_CLK. While both macros
currently evaluate to 0 and might not cause functional issues right now,
using a PHY ID for a clock reference makes the device tree fragile to
future macro changes and violates the expected bindings.

> =20
>  			power-domains =3D <&rpmhpd RPMHPD_CX>;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-dts-qcom-e=
liza-add-missing-usb-dp-phy-clk-to-gcc-v1-1-f0d3719f798c@oss.qualcomm.com?p=
art=3D1
