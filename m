Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5DF20459A
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042918; cv=none; b=bNNbtwpx3CQzPk+5EAsOh1VC7MNBpFaXFjDSm4QtqSfDcw1hz28tQk3eUQ41JLI5IMJD1U4a3LwhAjk4TL89i7gsLjbzZFbcLR3H4g5PfhlOtcZtxXVvxxaHVLa6IPrHkXaFxtYW5RRgoO5BYrKWZTDeHLCJG2dvdSqvDY5cKOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042918; c=relaxed/simple;
	bh=EvgzLbARmRBUJYGJra+HMOdP7XGgemECzSgP+9p0JzU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aVEEhde/J+ynf5vERK2DLmklI2NG0TtY8upyoPG1HQgCEHuGfJ2y1ntuuGWGVBM6mDLI33vs0PFL4oCeaaJimDv3jKQKk+YhxXVv7q+lCWUPKzIf7FhRVFbpFGSQv96vdDXaiLvCj5N5ZlDS06Xp1siZSXIA9B4xMpPsh1dx+Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2/E3QvC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2/E3QvC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0BE41F000FF;
	Tue, 22 Sep 2026 02:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790042917;
	bh=2MUV5IgtX0hOmFPxqN762P+ekbaFZRorYqG0DUGXlGg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c2/E3QvCfomyGOKtq/GIZHB0pDa8veVs7ma0ugzgSRBwlsbkOi4IthQUxh7fLU7EQ
	 Lsk1SIu6YsDCNEcwA3ZZN9M7KO+0259GllUW/gQiielmgWsJu2fkpy2O6St5AqhCp1
	 t57veK7tVpPtq/RnqlWFCyBKd9OpEgS6j8HiYsrDwTP/aFeIt/zdYe9SOL4nA9MOo1
	 zMa0EyShysYBFL7wNCTbQo+h5vP3liDlgOuAFOe0E+stH4dALhl8I2aVSqZV9MIjp7
	 Y+nBd5sQz5+NNaar+CihjVMMJ6FQx7k2iktRlpNZm9dz4Wr5W4QAIVPAGFxORVtDc4
	 xlGk1/g5KLC1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/11] arm64: dts: qcom: sdm670: add adsp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260922015801.32373-7-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-7-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 02:08:36 +0000
Message-Id: <20260922020836.B0BE41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: qcom: sdm670: missing qcom,non-secure-domain in ADSP fastrpc
--

commit 9ab90abda949e62df6000bf0659ede91a3c191bb
Author: Richard Acayan <mailingradian@gmail.com>

arm64: dts: qcom: sdm670: add adsp

This commit adds the Audio DSP (ADSP) node and SMP2P nodes for SDM670 to
handle audio and sensors. It includes the sleep state to prevent crashes
and configures the GLINK edge with APR and FastRPC subnodes.

> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/q=
com/sdm670.dtsi
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi

[ ... ]

> +		adsp_pas: remoteproc@62400000 {
> +			compatible =3D "qcom,sdm670-adsp-pas";
> +			reg =3D <0 0x62400000 0 0x100>;

[ ... ]

> +			glink-edge {
> +				interrupts =3D <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
> +				label =3D "lpass";
> +				qcom,remote-pid =3D <2>;
> +				mboxes =3D <&apss_shared 24>;

[ ... ]

> +				fastrpc {
> +					compatible =3D "qcom,fastrpc";
> +					qcom,glink-channels =3D "fastrpcglink-apps-dsp";
> +					label =3D "adsp";
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;

[Severity: Medium]
Does this fastrpc node need the qcom,non-secure-domain property?

Without this property, the secure_dsp flag evaluates to true during driver
probe in drivers/misc/fastrpc.c. For the ADSP domain,
fastrpc_device_register() will then create only the fastrpc-adsp-secure
device node instead of fastrpc-adsp.

Will this cause standard userspace libraries to fail to open the DSP device
if they expect the non-secure node?

> +
> +					compute-cb@3 {
> +						compatible =3D "qcom,fastrpc-compute-cb";
> +						reg =3D <3>;
> +						iommus =3D <&apps_smmu 0x1803 0x0>;
> +					};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922015801.3237=
3-1-mailingradian@gmail.com?part=3D6
