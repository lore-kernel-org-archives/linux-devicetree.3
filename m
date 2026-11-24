Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486444;
	b=IRS+xA4x4h3S+ZhsEnU8IO+LHwncyTDru2HPVF/KE8/fuFYaWJtxvwGeRJzEoqNC48XS
	 gG504GWClaCg9ZeAMQlT8ngOIh964dlXaTMiwQ/BWJh86WaGKIvicFTM+m/BgL4pdKCtp
	 NTvugM1G4rnJjXcQCLcf9bCm90vBmsywqzTObqyWQ0HLl3engl7EYCRCYA3V1Dr6GNJ6l
	 eyu8L0MexEf+3/7cMZe6uajlhAdiA002AD/S6xS5hLc2KBmBC3vN57lICcfY4slX8JvR+
	 n8o5Enf+z+xTP8lrPdjG2O6szFgyn9ic1kMlSGg0QnouKbpZMWRAf3LWwLUQv5MfEbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486444;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oNgz+gm0vjcO5YTdRzGBsGxmm4yWk2MbeWGvLQZNp74=;
	b=t+GcVLRVn2WHCQG/Vwy9CT3hcClodmtgWRCnkdBAGVyNfKBnk4GhQ9bnpVELOu6qCBrv
	 4RpGJx+lZzgUPV75OQ/MR2RB8W93m3LOT+uufbxCKdGZd1L59rV10RSYzzM4fAAf6x0gf
	 QCn/I5NIkvQltRf7kvPEh9/zJrQ6qRp4LjLsYLynDYROZh+NhYaoMM2SS6iPkZmPS4iPI
	 DV9bOOS6revau8XQ0JInZrSRzzzMQElecWRW8uBve4fuv354F8GW22KT2rR3vXHY943pq
	 9YFT3Jro2jNFi86HzOQ6hwoPpJrI62neG3arV9o+pTE9qSrKoGTJcdHKejJCjNcCL1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQs2+sWV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBA7606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQs2+sWV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7ABE1F000C6;
	Tue, 24 Nov 2026 02:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795486443;
	bh=oNgz+gm0vjcO5YTdRzGBsGxmm4yWk2MbeWGvLQZNp74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EQs2+sWVugkWAXMHX1VLzc6EdH2veutVR0G7VuEKuk/nJM0VbEiOSgidaYXhnRmu3
	 Cvgexg9Mz1+4FXI4yWNl3rdt3384WDEvz2U4i93ROUN6ZU2av6DjqR89xgM98iwXgm
	 VyzkinSrPrtp4isCxHjvnkcDLLrTKX+AMTZ8TcdR2UeU6X2lDe9u6ljoaQag2CqCo+
	 ZfEYohSq72QJG2AyqvFOyYoaaMCnHcDgYd5xwzlTA0vcg5GxDstYk7TyOxKxcf9S+D
	 el4sNQDNbzPWAskE7zP78MdNRZFRiYG/qD/Tv9IckOtFRVFxdX+f33SEfSRZcjxm5r
	 QMYJsuyuHDj+A==
Message-ID: <sashiko-outbox-230389@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] arm64: dts: qcom: sdm670: add adsp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124015611.187024-2-mailingradian@gmail.com>
References: <20261124015611.187024-1-mailingradian@gmail.com>
 <20261124015611.187024-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 02:14:03 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] arm64: dts: qcom: sdm670: missing qcom,non-secure-domain in
  adsp fastrpc node
- [Low] arm64: dts: qcom: sdm670: overallocated reg size on aoss_qmp
  node
--

commit a3147f2e5fca42f59281e14e591b45fec6c8593f
Author: Richard Acayan <mailingradian@gmail.com>

arm64: dts: qcom: sdm670: add adsp

This commit adds the Audio DSP remoteproc node and its associated SMP2P,
AOSS QMP, and APSS shared mailbox nodes to the SDM670 device tree.

> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/q=
com/sdm670.dtsi
> index 084d22479ca94..8de8f3f7ea0fb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi

[ ... ]

> @@ -2392,6 +2421,19 @@ dispcc: clock-controller@af00000 {
>  			#power-domain-cells =3D <1>;
>  		};
> =20
> +		aoss_qmp: power-management@c300000 {
> +			compatible =3D "qcom,sdm670-aoss-qmp", "qcom,aoss-qmp";
> +			reg =3D <0 0x0c300000 0 0x100000>;

[Severity: Low]
Should the reg size on aoss_qmp be 0x400 instead of 0x100000, matching
sdm845.dtsi and sibling SoCs?

qmp_probe() calls devm_platform_ioremap_resource(), which requests
exclusive ownership of the full reg range.  Reserving the entire 1 MiB
AOSS message RAM aperture rather than the 1 KiB APSS client slice will
prevent other drivers (such as qcom_stats for RPMh sleep stats at
0x0c3f0000) from claiming their memory regions inside that range.

[ ... ]

> @@ -2582,6 +2630,135 @@ cpufreq_hw: cpufreq@17d43000 {
>  			#freq-domain-cells =3D <1>;
>  		};
> =20
> +		adsp_pas: remoteproc@62400000 {

[ ... ]

> +				fastrpc {
> +					compatible =3D "qcom,fastrpc";
> +					qcom,glink-channels =3D "fastrpcglink-apps-dsp";
> +					label =3D "adsp";
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;

[Severity: Medium]
Should the adsp fastrpc node include the qcom,non-secure-domain boolean
property?

Without qcom,non-secure-domain, fastrpc_rpmsg_probe() defaults to
secure_dsp =3D true and registers /dev/fastrpc-adsp-secure instead of
/dev/fastrpc-adsp, breaking non-secure userspace audio and sensor
FastRPC clients:

drivers/misc/fastrpc.c:fastrpc_rpmsg_probe() {
	...
	secure_dsp =3D !(of_property_read_bool(rdev->of_node, "qcom,non-secure-dom=
ain"));
	data->secure =3D secure_dsp;
	...
	switch (domain_id) {
	case ADSP_DOMAIN_ID:
	case MDSP_DOMAIN_ID:
	case SDSP_DOMAIN_ID:
		/* Unsigned PD offloading is only supported on CDSP and GDSP */
		data->unsigned_support =3D false;
		err =3D fastrpc_device_register(rdev, data, secure_dsp, domain);
		if (err)
			goto fdev_error;
		break;
	...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124015611.1870=
24-1-mailingradian@gmail.com?part=3D1
