Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970120;
	b=EGvbSxCj3xMNKh+b5Y1vHpM8f/vJoDzzCRLGEmHcKYRUACmv3ygVEMvzn7rtYydbDX+t
	 JlY4voKZZTnVLR0rey/ysED/L1gV/ljhbSNuQQ5BEMk6DSwjqQW8MsXFTYXbUGQJTyyOM
	 Ac6Ih3cwoNtNSnrnCwQRLLHFPaxQw4pen0woQOGW5gJmdJBtYqMWep7IcSPwt3sc9HaT1
	 H2XjkpAU7ouJlXe+mv1VLHL3wdssEq+k0RuqnvYhikiopYb0cFyaon8qAcbAYtkRVcsFq
	 XXYwymPJS7sVFxSg9wQ+2yUfSaEIix2ibZsMh78FwUn9nqtzSF1icQuIDWurOetYftA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970120;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=leXmcbdZ9WqQPeyv5PRFWeuDNtIX7q3FwOsUnSiE4fY=;
	b=Zv09ymx9ZIjWj3lhBcaUJ4w1HbN4CfJEZeoHqv8xZ3Ic9Ma9Qg7WM331oq/I8xfl+fwt
	 uFBQI0LHXclghvmWDmO4T9CiC/cSfL2YhbmlEsJZ/d6ro/cu2DmnuD612K+bBmAWSwfW4
	 oqlOsqoteETGd+RThZ+5lSdwqHTwtfYiogw2t12jGz/fbAs99kc3Yiks2PgLLq+k8ES6J
	 apMYkb+W5tweN97bNqFqCXJ59z4pPemEllWB9S5qKci3XgClUpc3et36Y7R3kA0wp5ptt
	 VoabEN/7WMnp7YxvIcn4jatbCaMoyqsVkwoReYWrrOwEjab9ckabRueX+Y8P5MA8QOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="X8BP/Uej";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB335606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 02:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X8BP/Uej
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42ED11F000C4;
	Wed, 18 Nov 2026 02:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794970120;
	bh=leXmcbdZ9WqQPeyv5PRFWeuDNtIX7q3FwOsUnSiE4fY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X8BP/UejMyTz+0z4H3Lhhc6nQ9wwI6bUinNXMwta2LtjoZJd1lIyBuBn5KGXj52p3
	 cvJnIrl+e/i36KZhrUaVlyIxDf060A2ogxmqbR6XabesMt6c0+a244v74j8V6DArYL
	 JqbNafGvYnElkDMM9/e10tfUSKfgIBOMEX+80woGZUSXGBfQFVtriwNCGWGBoqRKoK
	 5H5o8zIs2otGfMSKEMIBzSAZZZy26szS9rKIFjdn5ZQ6oCsUUq+upaFPt/1eJ0z0AP
	 F2sRv1WMlI1PT8SdemvbVy0PTfM4cX+zTAh4ax1T9weoqGtnH+YaqndoUQrlcbzB7M
	 yF6r2GuVoGVmA==
Message-ID: <sashiko-outbox-219983@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: add Monaco Draco AC SoM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Faruque Ansari" <faruque.ansari@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117-monaco-draco-v1-2-e42d1673148d@oss.qualcomm.com>
References: <20261117-monaco-draco-v1-0-e42d1673148d@oss.qualcomm.com>
 <20261117-monaco-draco-v1-2-e42d1673148d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 02:48:39 +0000
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
- [Medium] arm64: dts: qcom: monaco-draco-ac-som: invalid PCIe PHY
  supply properties
--

commit c00686d30929a8eca1aceca9e9e89e0a90a7e47e
Author: Faruque Ansari <faruque.ansari@oss.qualcomm.com>

arm64: dts: qcom: add Monaco Draco AC SoM

This commit adds the initial device tree include for the QCS8300-based
Monaco Draco AC SoM, configuring PMM8654AU RPMH regulators, remoteprocs,
storage, USB, GPU, and PCIe/DisplayPort PHYs.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-ac-som.dtsi b/arch/arm=
64/boot/dts/qcom/monaco-draco-ac-som.dtsi
> new file mode 100644
> index 0000000000000..294ed0b6f8987
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-draco-ac-som.dtsi

[ ... ]

> +&pcie0_phy {
> +	vdda-phy-supply =3D <&vreg_l6a>;
> +	vdda-pll-supply =3D <&vreg_l5a>;
> +	vdda-qref-supply =3D <&vreg_l4a>;
> +	vdda-refgen-supply =3D <&vreg_l7a>;
> +
> +	status =3D "okay";
> +};
> +
> +&pcie1_phy {
> +	vdda-phy-supply =3D <&vreg_l6a>;
> +	vdda-pll-supply =3D <&vreg_l5a>;
> +	vdda-qref-supply =3D <&vreg_l4a>;
> +	vdda-refgen-supply =3D <&vreg_l7a>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Should vdda-refgen-supply and vdda-qref-supply be dropped from pcie0_phy
and pcie1_phy?

In monaco.dtsi, pcie0_phy uses compatible qcom,qcs8300-qmp-gen4x2-pcie-phy
and pcie1_phy uses qcom,sa8775p-qmp-gen4x4-pcie-phy.  The binding
Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml sets
additionalProperties: false and does not define vdda-refgen-supply, which
causes dtbs_check validation to fail for boards including this SoM dtsi.

In addition, qcs8300_qmp_gen4x2_pciephy_cfg and
sa8775p_qmp_gen4x4_pciephy_cfg in drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
both use qmp_phy_vreg_l, which only requests vdda-phy and vdda-pll, so
neither vdda-qref-supply nor vdda-refgen-supply is enabled by the driver.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-monaco-dra=
co-v1-0-e42d1673148d@oss.qualcomm.com?part=3D2
