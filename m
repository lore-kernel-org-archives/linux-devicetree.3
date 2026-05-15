Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EA93BB68B
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778862797; cv=none; b=dP5qjnLThf/aJYBMZSleAVB7ywMUD6fcW+luT8x3nJ8HEqpIxaIBaW4x8XdW1sWGRKN7E43cPKvzQU9bGgS8vo8bMhePHq63Jj7xrHqiWmWSQMQed9HiDUB7F2oTbzLg6QMOCVrRzJpN6/jeQVHL8uM9J+iHo8t73P6mIhKVTrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778862797; c=relaxed/simple;
	bh=Q1lUuiRW1MPdTBbvhuiPIvM0mxjnJsf8ZrTvZqpUWm8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HbNkzxiM7iyGKmiBK7rQe9WWEOCKn340WAL3U8cDteJGizjMBmxrJrj93aS0j1LlI8D3o21M6bzSRpc4GC4Ls4foQJZEzWtjTDbwQJWTFJhElXUwXJMbumAnoRKesMK0tI/Vqlkpcx94sdSXMaHfyQaPHz7W5sf+OyasiQUSu1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mjtia5wq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mjtia5wq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E814C2BCF6;
	Fri, 15 May 2026 16:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778862797;
	bh=Q1lUuiRW1MPdTBbvhuiPIvM0mxjnJsf8ZrTvZqpUWm8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Mjtia5wqHamS/L7Hr7lev7iLVc5ayjATTp76DQDkPVs9yzMFXCb2W9iYGlyPfbOkr
	 NXZoqtbTwxO1yDqWGwGbB9QY9aUfhDyVCCEkXODTReM9m6lggU6jmb1JaFADLnLORy
	 MwWw3HEmRkxyDQkNDMJ/yYtbMoQAZ1JokFatRQgOj060Vq+Oa19M2dsxkbMAXPYEwL
	 S9s7otyabn0h6MFMiNT0j5wF316eqfj+bFPVSaymRZ3w8dJaSdupTe/BayMx4azl5b
	 fF/HWwXmHvLAwcO2zHIyGUXdEkxGbz/ud689taUZ/VxOMZkEmoKGHjUYozJB6MRN37
	 E2HYPnkkN9Gzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add Eliza CQS EVK board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-eliza-dts-qcs-evk-v1-2-7169d78a33e1@oss.qualcomm.com>
References: <20260515-eliza-dts-qcs-evk-v1-2-7169d78a33e1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 16:33:16 +0000
Message-Id: <20260515163317.2E814C2BCF6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The device tree will fail to compile due to an unresolved node refe=
rence to `&uart13` in `eliza-evk.dtsi`.
- [Low] The new board compatible string `qcom,eliza-cqs-evk` is not documen=
ted in the dt-bindings.
--

commit 1762700c0c5b81f76d24db53170888e499078dd4
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
arm64: dts: qcom: Add Eliza CQS EVK board

This commit adds the common Eliza EVK dtsi and the final Eliza CQS EVK dts
files. It provides the device tree configuration for combining the Eliza SoM
with the common EVK base board.

> diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot=
/dts/qcom/eliza-cqs-evk.dts
> new file mode 100644
> index 0000000000000..fcf7d9232805c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
[ ... ]
> @@ -0,0 +1,20 @@
[ ... ]
> +/ {
> +	model =3D "Qualcomm Technologies, Inc. Eliza CQS EVK";
> +	compatible =3D "qcom,eliza-cqs-evk", "qcom,eliza";

Is this new compatible string documented in the dt-bindings?

A search of the Documentation directory suggests qcom,eliza-cqs-evk is
missing from the binding files, which could cause dt_binding_check to fail.

[ ... ]
> diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dt=
s/qcom/eliza-evk.dtsi
> new file mode 100644
> index 0000000000000..e47b24f8b8277
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
> @@ -0,0 +1,20 @@
[ ... ]
> +&uart13 {
> +	compatible =3D "qcom,geni-debug-uart";
> +
> +	status =3D "okay";
> +};

Will the device tree compiler fail with an unresolved node reference here?

It appears the base SoC file defines the UART as uart14, while this code tr=
ies
to reference and modify uart13 which is not defined in the inclusion chain.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-eliza-dts-=
qcs-evk-v1-0-7169d78a33e1@oss.qualcomm.com?part=3D2
