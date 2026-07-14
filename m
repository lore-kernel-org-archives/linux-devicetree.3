Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E180478E47
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036998; cv=none; b=JXWxB3SRgXRM4lcYl/XDSJyK+aiGdYazJI41oTMGz1VkGFdpfayow62rksGRgwg+Rr5+3kI6RyyvckVmlzY04LUgD1dJm3MuCNwolV7qAbD+o0q300BdDFzcMZ3ty/fcAVJ5+coqIjsX1087R5e5t7RXRQ33G/vM/DLLM3obEUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036998; c=relaxed/simple;
	bh=sKNMuAxl7SJIF9pSgX3xKgcQuhCjWQph+hioCD4drtk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qfk4okam8IhHCM5sLxkK3xmqF6s/JPp0DoLhD61l/NTGMz5AUk4QECL+K1gsFD9f2Q+OYwKXVOziECyqJfjWGy0aqrSTe+r4iY0O+dIlTaxz5S7af5RJY/fZiT6CSPGrU/m9XoAYNEtOABAcRCGyOxGZ3ZP10+zYvy4Xs9zOvSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPMUxWvY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPMUxWvY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFC51F00A3A;
	Tue, 14 Jul 2026 13:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784036996;
	bh=Uf26LgGkYl8lPUaTGG5xoejmm0tcfddqijZuBZBMVMw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CPMUxWvYI1HEoSmBPBUDh8XTjFVNn5z85xQPFVrAnNvMY18NSfmhboFwPQzDt8Hkh
	 oqcKW25/2wVSNCm8OezFIue5uYoXhtYS7H6qG4TgFTZfzvn7ylNXTCv71qs12yoAul
	 UCzemhiUzPxN/e/Fbod4W7sIt0zHKr2vrnxNlKrnLdcS4LMJYABUeyuk2pngGmgd7D
	 6Sh5rbEkuAeYPLod9AGyUgp/jRc1MQQg1izrY2QbBwPFcD3r5Ykll7zQUMmHw2PD0a
	 XttTHiYLXM/pVviyPunKA5/FG0ApzviSO5Nr4aqccmVMhufic7XaQbfa7We+poHWtC
	 AX9EhiX8RlEqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260714-dts-qcom-eliza-add-cdsp-v1-2-525e757a23b0@oss.qualcomm.com>
References: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
 <20260714-dts-qcom-eliza-add-cdsp-v1-2-525e757a23b0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 13:49:55 +0000
Message-Id: <20260714134955.CFFC51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `remoteproc_cdsp` node is missing the `glink-edge` subnode r=
equired for IPC.
--

--- Patch [2]: [PATCH 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remotep=
roc ---
commit 5af49a73d9e2d56636adad16779d928f64bfc0a3
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc

This commit enables the CDSP remoteproc node on the Eliza MTP. It provides=
=20
the required firmware names and sets the status to okay to bring the DSP ou=
t=20
of reset.

> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts=
/qcom/eliza-mtp.dts
> index a7d6f9d52ef31..7de4ee3935e63 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> @@ -484,6 +484,13 @@ &remoteproc_adsp {
>  	status =3D "okay";
>  };
> =20
> +&remoteproc_cdsp {
> +	firmware-name =3D "qcom/eliza/cdsp.mbn",
> +			"qcom/eliza/cdsp_dtb.mbn";
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Is this missing the glink-edge subnode required for IPC?

Looking at the base device tree definition in=20
arch/arm64/boot/dts/qcom/eliza.dtsi, the remoteproc_cdsp node is defined=20
without a glink-edge child node:

	remoteproc_cdsp: remoteproc@32300000 {
		compatible =3D "qcom,eliza-cdsp-pas";
...
		qcom,smem-states =3D <&smp2p_cdsp_out 0>;
		qcom,smem-state-names =3D "stop";

		status =3D "disabled";
	};

Without this subnode, qcom_glink_smem won't be instantiated for the CDSP.=20
Will this leave the DSP functionally isolated since the host cannot establi=
sh=20
RPMSG IPC channels (like fastrpcglink-apps-dsp) to perform compute offloadi=
ng?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-dts-qcom-e=
liza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com?part=3D2
