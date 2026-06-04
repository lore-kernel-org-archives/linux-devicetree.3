Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A5E3B6360
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 16:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590953; cv=none; b=lff3SoJpbsLuizyprVXwrpMWflwFZIHHNfVMkn5YBjz4YjTNNmnE3qvPaGpulUaoAGhz1otlsHldfzO7A+l6P7uGTvRSQia0Hj9Iz5vVU6hpKRtPYnKwVqSh99Mu/h0PosOfpg9JaC5xkUY8a++pWKOLc9qrpG8PT5+VL/3TmVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590953; c=relaxed/simple;
	bh=j9lJhRg+ZhFxemRZSqrdvq5qkHkHxZcFSFwRlnnDtHo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ELcgdR4zsHFLUWe5n/LLZyFKr6eYwLQCzs++4/DcPPDKUxKxHkhb98jRhtC+VjjgSlQR3Xt7LpI5u3QC3jQQvoRY35ndtFpWZ9HDjjKSSbVM0c2FOTU6cVwfX5AkS0srV/VS8CD6QgberS/pz1MnDovAmwIetUQdMtN4JdhhUSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4SXp9lw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4SXp9lw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D3D1F00893;
	Thu,  4 Jun 2026 16:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780590951;
	bh=UaG4JoD4Ag1gCc2/KIKJ8SQJbCudS0QvXwE96U7Z1+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q4SXp9lwkvlkLYjNUHCNzCv6N6RShlThfojebxaLYSu3hNcPEGFS9KO6qHoerIWBm
	 xZf4rYgCjQCopwBEMKUOiqPFPMjXDkGk6CADs0ao7AtdEHOyNCGOQ+9Uj3AI5PM4GO
	 ELvKPwnY78b/6nSWNHE4Uo1LNl6ZR/kOitvcpxexmSYgvgBuRzf6Yl0jhMfxCprV73
	 b5Wa/fsSAAoN+XAADukPAlASnK5IZzBlLYUZ716PaivfLhHB/+P1B2cOf1yLii236f
	 UGf6R92nnCIzRVXLnnhGI+up2e45sOLNVEdGb7lVABThHOWxx+2x9jL5kxhzhI8pZw
	 O7vnp+/ttzMag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/10] arm64: dts: qcom: sc8280xp-arcata: model the
 PMU of the on-board wcn6855
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SsOpcsO0bWUgZGUgQnJldGFnbmUgdmlhIEI0IFJlbGF5?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604-surface-sp9-5g-for-next-v3-8-6aa6f6612c10@gmail.com>
References: <20260604-surface-sp9-5g-for-next-v3-8-6aa6f6612c10@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 16:35:50 +0000
Message-Id: <20260604163551.20D3D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Mismatch between commit message claim and DT bindings for the bl=
uetooth node's vddrfa supply.
--

commit 62919a7033473f4fbba869d7f0a02d1322f1605a
Author: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>

arm64: dts: qcom: sc8280xp-arcata: model the PMU of the on-board wcn6855

This commit aligns the Surface Pro 9 5G model with other sc8280xp-based
models by adding a node for the PMU of the WCN6855. It reworks the inputs
for the wifi and bluetooth nodes to consume the PMU outputs. This also
removes the always-on properties for some regulators.

Link: https://lore.kernel.org/all/20241018-sc8280xp-pwrseq-v6-0-8da8310d956=
4@linaro.org/

> Use the fixed BT vddrfa1p7-supply supply name to align with bindings.

[Severity: Medium]
Does the qcom,wcn6855-bt.yaml binding actually require vddrfa1p8-supply
instead? Looking at the documentation in that file, vddrfa1p7-supply is
marked as deprecated and replaced by vddrfa1p8-supply.

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arc=
h/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> index f92c37bfe9c72..d1f72cddebf1d 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
[ ... ]
> @@ -820,20 +892,16 @@ &uart2 {
>  	bluetooth {
>  		compatible =3D "qcom,wcn6855-bt";
> =20
> -		vddio-supply =3D <&vreg_s10b>;
> -		vddbtcxmx-supply =3D <&vreg_s12b>;
> -		vddrfacmn-supply =3D <&vreg_s12b>;
> -		vddrfa0p8-supply =3D <&vreg_s12b>;
> -		vddrfa1p2-supply =3D <&vreg_s11b>;
> -		vddrfa1p7-supply =3D <&vreg_s1c>;
> +		vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn_0p8>;
> +		vddaon-supply =3D <&vreg_pmu_aon_0p8>;
> +		vddwlcx-supply =3D <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply =3D <&vreg_pmu_wlmx_0p8>;
> +		vddbtcmx-supply =3D <&vreg_pmu_btcmx_0p8>;
> +		vddrfa0p8-supply =3D <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply =3D <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p7-supply =3D <&vreg_pmu_rfa_1p7>;

[Severity: Medium]
Would it be better to update this property to vddrfa1p8-supply to match the
binding schema? The wifi@0 node updated earlier in this same patch
successfully migrated to vddrfa1p8-supply, so using the deprecated property
name here might cause dtbs_check validation failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-surface-sp=
9-5g-for-next-v3-0-6aa6f6612c10@gmail.com?part=3D8
