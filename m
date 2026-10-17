Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7190841228D
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 06:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792219922; cv=none; b=sGToAfSCK9oVwPclIiXBu8rOFv+lgfXTGq9nGcEfABb2N9jDKUu+1irDqFgojiSs315GMqnFF7NKJ0KB6UtkDeZEuUPEtbxcOrodBz5y1nN7Ruy+XDHhEPitb3NsqFv+8GCha0SEnhB/uZnVf720dJZtKk8+peNC1jyWcGAKc0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792219922; c=relaxed/simple;
	bh=7H6YYwjgD8M+K5VD3kZY1sSHhNwzJ4uRr7OMJZHVHbQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FcWB6eYdpbpoIa7/OYECu1H8+uI1eJu4EB9U72tg/1AN4BSOI2MTcdtOokP9gspw4TFZ0iknDLfbXJ9stb3KrHuTz6TbRlh7q3BDzohLKX3cXGM5pWsZoAy/MZ2gGgSPsQVAMaZMTQlpKaAEL3MW4jarm3ilSzQcq6nYeJWMgLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuKYsNzT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuKYsNzT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06AC21F000C4;
	Sat, 17 Oct 2026 06:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792219921;
	bh=t/k+e7Iv3g1WzaeukLAI5PC6rGrxbxmWutlOSqnYzPg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VuKYsNzTRM29rWaBxFRp10+mVjFESHMMJhVhFq7CE47beCyhsyJUq23mp8ts/csNY
	 dHD/vfRxHmQSdN1lagFzdedQQvzCeR5j1iocCOHBBkXSQn06P1M7+quN0TVDqy2US8
	 8saka40y+qjx6nTuEDuSXBtcxUK2tRExC9X0nxbzRFTWnaPldVpv5/bWNhGg4G8vMr
	 IMN6eDFwbknQbI+fDspzK8oYz1mLDXF1/xWiUEgOFb6iBCjipOf/cLZw8we3PxMsy/
	 wRZ+IIXw0Gaz4et2GtaWFkiFfEeEXga7DuU45ZnpjLysJG0ZhVLmKGFH8qMZkDmJgE
	 mCNGdkUwY/QcA==
Message-ID: <sashiko-outbox-175352@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add support for Xiaomi 17
 Ultra phones
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261017-nezha-v2-2-44c95e1a9d6a@mentallysanemainliners.org>
References: <20261017-nezha-v2-0-44c95e1a9d6a@mentallysanemainliners.org>
 <20261017-nezha-v2-2-44c95e1a9d6a@mentallysanemainliners.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 06:52:00 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: nezha: swapped unit addresses in pdp_mem reser=
ved-memory
- [Medium] arm64: dts: qcom: nezha: inconsistent vendor casing in firmware-=
name paths
--

commit 78a525e62bca89477d8de3ba74ccb271e603f04a
Author: Igor Belwon <igor.belwon@mentallysanemainliners.org>

arm64: dts: qcom: Add support for Xiaomi 17 Ultra phones

This patch adds initial Device Tree support for the Xiaomi 17 Ultra
(nezha) China and EEA variants based on the Qualcomm Kaanapali SoC.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-xiaomi-nezha-common.dtsi =
b/arch/arm64/boot/dts/qcom/kaanapali-xiaomi-nezha-common.dtsi
> new file mode 100644
> index 0000000000000..f4125d32dc05f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-xiaomi-nezha-common.dtsi
> @@ -0,0 +1,883 @@

[ ... ]

> +	reserved-memory {
> +		/*
> +		 * If we do not have this exact region with this exact name
> +		 * present, the bootloader disables the display panel and
> +		 * for some reason it cannot be re-enabled.
> +		 */
> +		splashmem: splash_region {
> +			reg =3D <0x0 0xfc800000 0x0 0x2b00000>;
> +			no-map;
> +		};
> +
> +		/delete-node/ pdp@81200000;
> +		pdp_mem: pdp@81300000 {
> +			reg =3D <0x0 0x81200000 0x0 0x200000>;
> +			no-map;
> +		};

[Severity: Medium]
Are the unit addresses in /delete-node/ pdp@81200000 and pdp@81300000
swapped here?

In arch/arm64/boot/dts/qcom/kaanapali.dtsi, pdp_mem is defined at
0x81300000:

	pdp_mem: pdp@81300000 {
		reg =3D <0x0 0x81300000 0x0 0x100000>;
		no-map;
	};

Because pdp@81200000 does not exist in kaanapali.dtsi, deleting
pdp@81200000 is a no-op, and pdp_mem: pdp@81300000 ends up with a unit
address that does not match its reg base of 0x81200000, triggering DTC
unit_address_vs_reg warnings when building the DTBs. Should this delete
pdp@81300000 and define pdp_mem: pdp@81200000 instead?

[ ... ]

> +&gpu {
> +	status =3D "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name =3D "qcom/kaanapali/xiaomi/nezha/gen80200_zap.mbn";
> +};

[ ... ]

> +&remoteproc_adsp {
> +	firmware-name =3D "qcom/kaanapali/Xiaomi/nezha/adsp.mbn",
> +			"qcom/kaanapali/Xiaomi/nezha/adsp_dtb.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name =3D "qcom/kaanapali/Xiaomi/nezha/cdsp.mbn",
> +			"qcom/kaanapali/Xiaomi/nezha/cdsp_dtb.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&remoteproc_soccp {
> +	firmware-name =3D "qcom/kaanapali/Xiaomi/nezha/soccp.mbn",
> +			"qcom/kaanapali/Xiaomi/nezha/soccp_dtb.mbn";
> +};

[Severity: Medium]
Will firmware loading fail on case-sensitive filesystems due to the
inconsistent casing of the vendor directory between gpu_zap_shader
("qcom/kaanapali/xiaomi/nezha/...") and the remoteproc nodes
remoteproc_adsp, remoteproc_cdsp, and remoteproc_soccp
("qcom/kaanapali/Xiaomi/nezha/...")?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017-nezha-v2-0=
-44c95e1a9d6a@mentallysanemainliners.org?part=3D2
