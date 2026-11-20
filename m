Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158670;
	b=ASfcY3On65Bp9TKPh11r8SBLJbdu1/s+5MlIIAywrNl/lAwTVDdt3/eDnHGw9IpTcpzJ
	 DEjcJGr8/wm+jT3qAWq614k5g8X4lhSBhrTnkxQl5tqxfTH1TVUi2LHcdadXG+oWyV1Tk
	 eZV2kK6QSDZXDcVmCF73N5RT7r700kuHj00ifl0ZJSCq3UjgX4pMoqcW83zeFzcFEr70u
	 6xJCl+wCnyKpucHbaqVDiYCUZIkSK4kHDlgQ43cpWJiSvliOs+eT7h40HolUjThIFwOyA
	 6IO2aDncMGE8s+422L5bSE/bMHDN05b7grfMqHu0Js/jkD+0gMYtW20Pzh/8I0jbqBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158670;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=C1HSMCYWdUbQSiJiioV+NPAt6tzAEVs5zXmr9b8AVuc=;
	b=ZUClM61Lj9EG/tZ10ENmttcktJTM9KGUkgFwWZ0ZCkjr+GBNXKVLs7SX8NPDuUqvLU1w
	 fa65F/cVS4Bwzh/X+uWehceuFCyFShN2EyhrpCCVQ/KS04ei9Kd+GgWeeGw0v4W//mf26
	 ULZoH7fs4/HUt9M47cPPho9kQZBtW4A+CSlh2WffwJuQlMv+rJBEyuQhLNkDo4LYpWouw
	 SSFGusEWqWKJOQwQcv69vpTJCuj5OeQqJvkWVDDX9rMstTcVdXIcEtLI35WvkGfRElVW+
	 ETyBQiLJxgxT0vkIhfhTgAi7/0hP/hsGMoqXjsS11gfppqF4eNkGcU84pDiQtV0X5MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XCdyJs9/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6449606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XCdyJs9/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607651F000C4;
	Fri, 20 Nov 2026 07:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795158669;
	bh=C1HSMCYWdUbQSiJiioV+NPAt6tzAEVs5zXmr9b8AVuc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XCdyJs9/2bVtW9NZcq7cNkZ387dz6vMs3p7nU+dPPNXtWEOAMKkfdsDlkvwzbkCKu
	 T+8E+Uj6NFDk3HX7qx05s3segi4WwUpK1rVXuReL2yxCrrjdHpuidzArVCtxzFiyjY
	 +afBdBWtkmlO5DbQyyUpXt9OWR3onoM3s/vADLLK7je2b1hdN5TxlSvXtAia6/71Kk
	 3s+YE1mjlm4AH2GCt5HFkIv/IKwsCmiIThFcJtr6+fir07xPPeZ2VqCyqJHbCxYMRh
	 vd30iuiFG3SGF3Y8dYwtYcCh8HaBRF8YKIXzRJNEdYqSma+Av2lVr6VKrHVJJYzNsD
	 o4U7s0nOnF+Gw==
Message-ID: <sashiko-outbox-224599@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 SoM platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikishan Thawre" <gopikishan.thawre@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-lemans-draco-final-changes-bringup-v3-2-db08f12f0cd5@oss.qualcomm.com>
References: <20261119-lemans-draco-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com>
 <20261119-lemans-draco-final-changes-bringup-v3-2-db08f12f0cd5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 07:11:08 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: qcom: lemans-draco-som: swapped USB QMP PHY vdda
  supplies
--

commit 53f3c4c5688995a724474882d7b554c0d74f4ff6
Author: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>

arm64: dts: qcom: lemans: Add LeMans Draco EVK SoM platform

This commit adds the initial device tree for the SA8775P/QCS9100-based
LeMans Draco EVK SoM platform.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi b/arch/arm64/=
boot/dts/qcom/lemans-draco-som.dtsi
> new file mode 100644
> index 0000000000000..1001b6b81c312
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
> @@ -0,0 +1,421 @@

[ ... ]

> +&usb_0_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l1c>;
> +	vdda-pll-supply =3D <&vreg_l7a>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1 {
> +	dr_mode =3D "host";
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1_hsphy {
> +	vdda-pll-supply =3D <&vreg_l7a>;
> +	vdda18-supply =3D <&vreg_l6c>;
> +	vdda33-supply =3D <&vreg_l9a>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l1c>;
> +	vdda-pll-supply =3D <&vreg_l7a>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Are vdda-phy-supply and vdda-pll-supply swapped on usb_0_qmpphy and
usb_1_qmpphy?

vreg_l1c is the ~1.2V rail and vreg_l7a is the ~0.88V rail, whereas the
QMP PHY expects the lower voltage on vdda-phy-supply and the 1.2V rail
on vdda-pll-supply (matching ufs_mem_phy above and commit 932113c3c778
("arm64: dts: qcom: lemans: Fix swapped USB QMP PHY vdda-phy/vdda-pll
supplies")).  Because both regulators set regulator-allow-set-load, the
QMP USB PHY driver also programs its vdda-phy and vdda-pll load votes
onto the wrong LDOs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-lemans-dra=
co-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com?part=3D2
