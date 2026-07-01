Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAFA2C0260
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894516; cv=none; b=trYGzDri9sFNnl2T9FyGhBg3NU/wawWDn6U6wGRep23ISS8XFtp6LLddIiSU6alRhMEWSBPcd0GickPlYqrJqpvl/sGNacX/2XSyvgwvARwM225Q9yqQVuMfZ5KpofpHJPSqtOrpwtDEt5RlyV+KpH5eIlBCmPmLK6obOchetCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894516; c=relaxed/simple;
	bh=qrd5fL13vfYXOMpYcE29Inuv3Zfd6lsKB77Veqsn3s0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c2X81BRCXVgicQYHC9XaFSlLp54RR6BW+6WoyQIX/8drdRiQBcV9vryIAZo17SyU+rqe43YJtjo18pekGSYWhSq5LibBPDhKSzkXw0VuXdAp1u5LWess1fIUvOsXR/ceEwVYRtTBgNEDziBcc5HQH5KJWiW08H4z6UN/dV/3ZDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCpFoqG9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCpFoqG9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA3E11F000E9;
	Wed,  1 Jul 2026 08:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782894515;
	bh=CH3kPNwvvTxlKd1UE8fyARkuTweCRm20f7lmcRtxaGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DCpFoqG95o5+aCPlf5lAq+yb7S3wYGo6sDtVMoPnH+eJEgAsdJAjHZjxJmAknjLQ2
	 4OUwlIPKmARg8W/juTiJLNKshtFVUe7PMDJSS9b311VcWf0TwZi1G+rKM96FHnVe7r
	 Id0ZeQvZWhGt3xyrWT054k6vVq/4bUBFjLh0rQSDCoRI2QqfonESXbjTpXdcqbpasA
	 16FCjPTKjN8YFGKcDp+/n4Xh+3QKbJ8OFsg1W+hb+lso0balJsTYxVP7FdF1Sc9ygW
	 S1DUKkB3eNbKse0q8UVKzeyZnRVTcBIqHMX2nJwhJtEtyOm89z/5FH3hEWZUQlJ5c0
	 ukEkbIYKnMq6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support
 from SoC to board DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Monish Chunara" <monish.chunara@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260701081715.2580329-2-monish.chunara@oss.qualcomm.com>
References: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
 <20260701081715.2580329-2-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 08:28:34 +0000
Message-Id: <20260701082834.EA3E11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `supports-cqe` property for eMMC in `monaco-evk.dts`.
--

commit 5c91ec5c205c89bd965c17fc6805d964575e0468
Author: Monish Chunara <monish.chunara@oss.qualcomm.com>

arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT

This commit removes the 'supports-cqe' property from the Monaco SoC device
tree to allow SD card compatibility, and moves it into the board-specific
device trees that use eMMC.

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index 7b1d57460f1e6..e5f316897706b 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -4828,7 +4828,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			qcom,dll-config =3D <0x000f64ee>;
>  			qcom,ddr-config =3D <0x80040868>;
>  			bus-width =3D <8>;
> -			supports-cqe;
>  			dma-coherent;
> =20
>  			mmc-ddr-1_8v;

[Severity: High]
Does this unintentionally drop CQE support for the monaco-evk board?

The &sdhc_1 node in arch/arm64/boot/dts/qcom/monaco-evk.dts configures the
controller for eMMC:

&sdhc_1 {
	vmmc-supply =3D <&vreg_l8a>;
	vqmmc-supply =3D <&vreg_s2s>;

	no-sd;
	no-sdio;
	non-removable;

	status =3D "okay";
};

Since supports-cqe is removed from the base monaco.dtsi here, but is not
explicitly added to monaco-evk.dts in this patch, booting the standalone
monaco-evk.dtb will now bring up eMMC without Command Queue Engine support.

Should monaco-evk.dts be updated alongside the other boards in this patch
to prevent a performance regression?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701081715.2580=
329-1-monish.chunara@oss.qualcomm.com?part=3D1
