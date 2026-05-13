Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C773A5E69
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706735; cv=none; b=kr9b0aWUhtkof7GzrvPeSuToSLycdfUJ4mDsh8LTJFU3P6LDrxjNa+HmirXYOd3ygLvCDyCVPvfDT3wHvDTusl/yaCuAo40sZJut40XoGYCQm6uJkL0PyC4kjgmynyu33PERT30s9hyfTMBLT4ialQNQ1Y5nyeLGQ9fUHI/dwTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706735; c=relaxed/simple;
	bh=QoYcwhZ/7PU9C5SA/BSzuhaMoZg1RV7QS2522SJRsFA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JA7eL1k/9A29IBAbL4WLUqvof/s1LvrF1P6YXQTObrLxOD9xrOFd9DZ+TVARzAsTuWjVmZIULE75ql2agiQNCmiLvUn6Yg6HV68GT0PpTS5BNE3ypNPRYb/QFa+pHXKoWRpKjERhfvYGVHFK8s2OnguIUfLI5sWxY+CRS0Lf5hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CU11uW0E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CU11uW0E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40DC3C19425;
	Wed, 13 May 2026 21:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778706735;
	bh=QoYcwhZ/7PU9C5SA/BSzuhaMoZg1RV7QS2522SJRsFA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CU11uW0EV2LY0R7CFrhGOyyRVGPGxQnX3DTUoQYP5qjxVdSTIz30nXdhO5f277ixm
	 mHZTf6gEDYiL9ExitcjvE8YJMbQvFnwVlStcp3Qe+YnMcL67ePiTHEtoeNBjNBHZQg
	 xA4TYxuuZCrgU1ZSf7/6m4ZGkqJNNJdpIvDLxn3WL6uS/9EvxY4wxvGQkkclcDM/1D
	 w5xql/kWPCBsPaDPsyEXezWVYG1Yl3DWjfnKJ68vuWyM+THxRJDsB3A7DqoZ4zmQYO
	 MVY2mfGNZDod3RQNyYxhRRxgC2pds/Ofq96bTNPeq+TWTYEydmJbkzyx/m09B0x4CB
	 /E3tiWupwRoRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: eliza: Describe the ADSP and
 USB related nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260512-eliza-adsp-usb-v3-1-6420282841c2@oss.qualcomm.com>
References: <20260512-eliza-adsp-usb-v3-1-6420282841c2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 21:12:14 +0000
Message-Id: <20260513211215.40DC3C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Redundant 'interrupt-parent' property in the 'aoss_qmp' node.
- [Low] Newly introduced compatible strings violate existing DT binding sch=
emas, causing dtbs_check validation failures.
--

commit 56225b8dd9e95631f7a6297b203c68d9c7cdee8d
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes

This commit describes the ADSP remoteproc node along with its dependencies=
=20
including the IPCC mailbox, AOSS QMP, and SMP2P links. It also describes=20
the Eliza SoC's USB 3.1 Gen 2 controller, QMP combo PHY, and SNPS eUSB2 PHY.

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qc=
om/eliza.dtsi
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
[ ... ]
> +		usb_hsphy: phy@88e3000 {
> +			compatible =3D "qcom,eliza-snps-eusb2-phy",
> +				     "qcom,sm8550-snps-eusb2-phy";

Are these compatible strings fully documented in the binding schemas?

It appears qcom,eliza-snps-eusb2-phy is missing from the allowed enum list =
in=20
Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml, which will=
=20
cause dtbs_check to fail validation.

[ ... ]
> +		usb_dp_qmpphy: phy@88e8000 {
> +			compatible =3D "qcom,eliza-qmp-usb3-dp-phy",
> +				     "qcom,sm8650-qmp-usb3-dp-phy";

Does this fallback compatible chain match the current schema constraints?=20

The schema Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-=
phy.yaml=20
expects qcom,sm8650-qmp-usb3-dp-phy to be used alone without a fallback, wh=
ich=20
will also result in dtbs_check validation failures.

[ ... ]
> +		aoss_qmp: power-management@c300000 {
> +			compatible =3D "qcom,eliza-aoss-qmp", "qcom,aoss-qmp";

Similar to the PHY nodes, is qcom,eliza-aoss-qmp documented in the binding=
=20
schema? It seems to be missing from the enum list in=20
Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml.

> +			reg =3D <0x0 0x0c300000 0x0 0x400>;
> +
> +			interrupt-parent =3D <&ipcc>;
> +			interrupts-extended =3D <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLIN=
K_QMP
> +						     IRQ_TYPE_EDGE_RISING>;

Is the interrupt-parent property needed here?=20

Since the node uses interrupts-extended which explicitly includes the inter=
rupt=20
controller phandle for each specifier, and there are no child nodes to inhe=
rit=20
the interrupt parent, this property seems to be redundant.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-eliza-adsp=
-usb-v3-0-6420282841c2@oss.qualcomm.com?part=3D1
