Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19024D90DF
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 16:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779208642; cv=none; b=afUKjlY1DAn5wflXuYuuiIYYrD6pPRqGKktVVKcLUiShdgNbvUEZ1Zkfl9McimRMXcCiZ/7tLejP89DgzhPpePemHeCXtzPHKLCeaee6vcurepOaiCzMf0Fn8DaiqV6xjvmZgHdFBX3DS9RtnU9llrUAL+6/Rc8+YTbP0DB0iBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779208642; c=relaxed/simple;
	bh=b4alJ7oYXavpOGq00ZcC7Hb3nTGtBUS/MEHzC+49o2M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kfGkRHR/8VPKC0djgJvDVDjWD9W+RWDbVUDATgtcufTW1eiso/ZXnPO3upC8SQeSUbtcnscbermMDGOLHIL7w04ylFPynXtgxE7lTNyVEecKGstxCSbX39KYAolQJQyORRBneu6mGeGTNaps4L9avi3CeVwaJiPR1YmljPBhffI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a42qx8xt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a42qx8xt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 306FDC2BCB3;
	Tue, 19 May 2026 16:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779208642;
	bh=b4alJ7oYXavpOGq00ZcC7Hb3nTGtBUS/MEHzC+49o2M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=a42qx8xtYgVSGP4msTCzuTCKZtLzLEoD0FiS2KH2N374ncEKJyfxgeMl+oNzpXHAP
	 F+UHJWaXXOd8hQup9BrDMBSNko/Ex9v+Jj+RSq/1WQWHp8sc59X4K7LOiRjlvHjotv
	 ZiAB/WsL2pyUIzb8h2nSFnerZjA9LLxjoLFwAdtJwC/HYxcJUkIm+qBfr0fvIJEQvO
	 kdBGx63LRouGHQeXSqz2uk7m9hNLSH0ZDbQAstfwCfqmGPBmkj7WxY/9FmOIR2vAXK
	 kp+6oaWWH/+Z/Siyylq8rRA3vci9Y7XV+7kHKQ3Lkp6hdncdOLX/pd2Tfej0ydmgYi
	 xjzjAIM3xoifQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add Eliza CQS SoM platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519-eliza-dts-qcs-evk-v2-2-ad7303659d24@oss.qualcomm.com>
References: <20260519-eliza-dts-qcs-evk-v2-2-ad7303659d24@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 16:37:20 +0000
Message-Id: <20260519163722.306FDC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Undefined labels referenced in the device tree (`&sdhc_1`, `&remote=
proc_adsp`, `&sdc1_default`, and `&sdc1_sleep`) will cause a Device Tree Co=
mpiler (DTC) build failure.
--

commit 7ca90443e3e2a64f1e18e601c91556491fa0f444
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: Add Eliza CQS SoM platform

This commit adds the Eliza CQS SoM DTSI so it can be included by the EVK
board DTS. It describes the regulators and board clocks, enables eMMC
support through SDHC1, specifies the ADSP firmware, and enables the ADSP
remoteproc.

> diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boo=
t/dts/qcom/eliza-cqs-som.dtsi
> new file mode 100644
> index 0000000000000..5e0f9c1698f88
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi

[ ... ]

> +&remoteproc_adsp {

[Severity: Low]
Are the labels &remoteproc_adsp, &sdhc_1, &sdc1_default, and &sdc1_sleep
defined in the base eliza.dtsi?

It appears that these labels are not defined anywhere in the SoC tree,
nor are they provided by any included .dtsi files. This will cause a
Device Tree Compiler (DTC) build failure due to undefined labels.

> +	firmware-name =3D "qcom/eliza/adsp.mbn",
> +			"qcom/eliza/adsp_dtb.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&sdhc_1 {
> +	vmmc-supply =3D <&vreg_l12b>;
> +	vqmmc-supply =3D <&vreg_l1d>;
> +	pinctrl-0 =3D <&sdc1_default>;
> +	pinctrl-1 =3D <&sdc1_sleep>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-eliza-dts-=
qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com?part=3D2
