Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874681;
	b=rxEKgMnktUVuuz9AvVlqyii6pWxdncclF2AZLdiFqikAbX19JcBUUzch6nbI/9JZcAyP
	 brKVjB0padDI2Zc+F4wcJHd+VyQWYDtvU0fcJK8s3zyLvcCJ54GNrHvTyXOxNf2yifndl
	 vFpfxSRMfTXPygY1KoEa3N+a5tOLTL5IdFXmgbvsDSk1fDEvsJOrTSTFJlVj7GC4LJqvW
	 xB0/BGaFflffpsEhLCpXic9C1Vm0/OFih/45HXzcyTlHtH4YIwM7jqHmSRi8Gp+9hjlk/
	 X+ErKIVlNLY3SQnz1dteVx35Afl0A1SetSYjnVXtvEYkPr5fuCDexg/POq7VBmWKa8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874681;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RJvtrfsGjqnb0T1xxZM0dlRQvRM9/2T5cWCEnKAaM5s=;
	b=163wnAoRtA28bdmZvUIkT9AB1QBRywB5df6GHHbebJjorbLjjktTax9muroN66iV3o0r
	 skZxbhaeSNN2qEw0jm2Uh8BcrdKjk3PK8mrlyGXNQVJPPSXbtDow/oEjIYDIBZI5BGU6F
	 EBLWHAmBP67JkFuSi3RyUaKj7rQX5f1SvBDHcv/sQuf+joU2Js47DK3qLqVj7bkVhgFM/
	 3LFPnDm7Z5tDmLcu47WvwJ6UxOcY1lhTqsui1YZor0DPCRpcH4OtBRrmfpCeYtIhYNJwH
	 Xl3C7UVSsE41UveXqvVpkEA/4NPHjGBNoKNvCqFvWHzX3QAivoGFPkdylws0SAM1ozQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lOx/8pVf";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E230C606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lOx/8pVf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4448B1F00A02;
	Thu,  5 Nov 2026 10:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793874680;
	bh=RJvtrfsGjqnb0T1xxZM0dlRQvRM9/2T5cWCEnKAaM5s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lOx/8pVfD7zrgOj1Yt6D3mu+iZCZR76H22hTg2hGdI3sMwk2iSfJY0mahzuZguLyS
	 NziMDVnqrsHuGseH2+Eb1z7Y1OSMUssAp9LDYhQqWeFyW/PillnUUKe2xyJdaHolvw
	 lhUFWq2k9h1PRmJgXTWemstZS/GskGJpwWbOMNgEFJ28V4PxEm0puy1TwmBWPKUtvH
	 r2/KjAPiz8beIB4xsWaDVNaAAwJps95eMonlDmzB0gMMn8IoY6Bk+d2odzEGJ5c70B
	 nlU/SwG+k+DBYIYokmb0aMWBNb0tea0ANm2SLJF71taDIruHIuPIoAtfM+DcqV+OAs
	 XYudLTcZz8Qfw==
Message-ID: <sashiko-outbox-198857@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V6 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support
 from SoC to board DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Monish Chunara" <monish.chunara@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105101955.3732723-2-monish.chunara@oss.qualcomm.com>
References: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
 <20261105101955.3732723-2-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 10:31:19 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: monaco: missing supports-cqe on sdhc_1 in mona=
co-ac-evk.dts
--

commit 5c417a101ec7d48bcf62abc40a54fc7490862bc8
Author: Monish Chunara <monish.chunara@oss.qualcomm.com>

arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT

This commit removes the supports-cqe property from the shared SoC sdhc_1 no=
de
in monaco.dtsi to avoid conflicts with SD card operation, and adds it
explicitly to the qcs8300-ride.dts and monaco-monza-som.dtsi board device
trees.

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index 35fbee63d4c65..591ad233f90eb 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -4843,7 +4843,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			qcom,dll-config =3D <0x000f64ee>;
>  			qcom,ddr-config =3D <0x80040868>;
>  			bus-width =3D <8>;
> -			supports-cqe;

[Severity: Medium]
Should supports-cqe also be added to &sdhc_1 in
arch/arm64/boot/dts/qcom/monaco-ac-evk.dts?

While the follow-up patches in this series ("arm64: dts: qcom: monaco-evk:
Enable SDHCI for SD Card via overlay" and "arm64: dts: qcom: monaco-evk: Add
SDHCI support for eMMC via overlay") move &sdhc_1 out of monaco-evk.dts into
monaco-evk-emmc.dtso with supports-cqe, monaco-ac-evk.dts is not updated in
the series.

monaco-ac-evk.dts includes monaco.dtsi and enables &sdhc_1 directly in fixed
1.8V eMMC mode:

arch/arm64/boot/dts/qcom/monaco-ac-evk.dts:
&sdhc_1 {
	vmmc-supply =3D <&vreg_l8a>;
	vqmmc-supply =3D <&vreg_s2s>;

	no-sd;
	no-sdio;
	non-removable;

	status =3D "okay";
};

Without supports-cqe on &sdhc_1 in monaco-ac-evk.dts, sdhci_msm_probe() in
drivers/mmc/host/sdhci-msm.c takes the non-CQE path:

	if (of_property_read_bool(node, "supports-cqe"))
		ret =3D sdhci_msm_cqe_add_host(host, pdev);
	else
		ret =3D sdhci_add_host(host);

Wouldn't removing supports-cqe from monaco.dtsi without adding it to
monaco-ac-evk.dts cause sdhci_msm_probe() to skip sdhci_msm_cqe_add_host()
and sdhci_msm_ice_init(), disabling both CQE and inline encryption (qcom,ic=
e)
on the Monaco-AC EVK board?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105101955.3732=
723-1-monish.chunara@oss.qualcomm.com?part=3D1
