Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C082B37CD3E
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847790; cv=none; b=fUjgM4Ai0UPxUK3vNX5dYDLjAAJ7GIitcty06gaDVkdpsuhfaRhrb9S80CWU8tJLKpDAsPSOdTRDQJuUfsM/AyUcTuYadJ8+dpFydggKSpBdPCTQ9uc4ccRjj8RX9Zk4bDhifiSMdsi8KcAHEK5Ml+ewa7m/JzIq2tDohvbBoy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847790; c=relaxed/simple;
	bh=Qihl/bAoByXwAVGWP4H8pVRj8H9PrDq3P/LqmJzS7Sc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p59Nsfh5Jfe8wtQCr4KV7jrC2psT77qcPbqbYpkzgqnQVAFuD6KF9JDiSJIztb9plw+88twEfZe++mNM0S7r4vFKDjHaQmhH2YAYmbsmvAjMH/K6oa5r9npijqFlxi3lDs+d3kZbvvd4UlDgM1ibzwQLb2hPWKMOIvNBduGOR64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPUFsW+3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPUFsW+3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4112E1F00A3A;
	Tue,  4 Aug 2026 12:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785847788;
	bh=zhMEPJDk7c7Z3P1psCyDEb1poe1c2dgn1Dy50S2i8IQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gPUFsW+30xh9t1LtnVbBBIj/Wezltnw90oLbhLnkXpSCop3aBCuKb5rSmwjoOHCPs
	 w+Hz/TPv8XqAPLqpaaHG3f3ZxmxVlbQYXHN4DbRgkf8/X2YQTFRG3p8fm8UEv9GBDG
	 RRPjOYCl1uMNnldPXAAN2oQ9b2YJyi8mx3kCn5hCsIPew2+tkCoNz68fP6Fabq3l1c
	 Of4PG1v5337pbFlKTaXCvPXhQPU6tHdsIFAPd8s+AsaIxInmfYLFJ8c7erOdrZecE0
	 qrD2SmoETjr++W5FQUaXIvrFYx3Gk+XtCTvnWgyx5PLKC63WljtIdT5zhZb9Rv1eXl
	 n3/sWxvHdSdhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: purwa-iot-evk: Describe the
 PCIe M.2 Key E connector
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Deng" <wei.deng@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804-hamoa-m2-dts-v2-v4-4-1b5ceac74538@oss.qualcomm.com>
References: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
 <20260804-hamoa-m2-dts-v2-v4-4-1b5ceac74538@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 12:49:47 +0000
Message-Id: <20260804124948.4112E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Migrating to the generic `pcie-m2-e-connector` will break Bluetoot=
h hardware initialization because the `hci_qca` driver cannot match or acqu=
ire the power sequencer. The `hci_qca` driver requests the target name "blu=
etooth" (`devm_pwrseq_get(&serdev->dev, "bluetooth")`), but `pwrseq-pcie-m2=
` exposes its target as "uart". Furthermore, `pwrseq_pcie_m2_match()` check=
s whether the serdev consumer's OF node (`bluetooth`) exactly matches the p=
arent of the M.2 remote endpoint (`uart14`), which evaluates to false. Thes=
e mismatches cause `devm_pwrseq_get` to return `-ENOENT`. The `hci_qca` dri=
ver then falls back to its legacy DT-regulator fetching code path, which fa=
ils entirely because the explicit regulators (`vreg_wcn_0p95`, `vreg_wcn_1p=
9`) were removed in this patch. Consequently, the WCN7850 is held in reset.
- [Medium] The migration to the dynamic `pwrseq-pcie-m2` Bluetooth SerDev c=
reation omits the UART `max-speed` property. Prior to this patch, the Bluet=
ooth node under `uart14` explicitly defined `max-speed =3D <3200000>;`. The=
 new `pwrseq-pcie-m2` driver's dynamic node instantiation logic only inject=
s the `compatible` string into the changeset and does not carry over the `m=
ax-speed` property. As a result, the `hci_qca` driver falls back to its def=
ault operational speed of 3,000,000 baud instead of 3,200,000 baud.
--

--- Patch [4]: [PATCH v4 4/4] arm64: dts: qcom: purwa-iot-evk: Describe the=
 PCIe M.2 Key E connector ---
commit 5f376efc44b229061a79b4f8f53cbc23e717ff9f
Author: Wei Deng <wei.deng@oss.qualcomm.com>

arm64: dts: qcom: purwa-iot-evk: Describe the PCIe M.2 Key E connector

The Purwa IoT EVK has a PCIe M.2 Mechanical Key E connector for wireless
connectivity cards. This patch describes the connector node to allow the
pwrseq-pcie-m2 driver to manage card power and dynamically create the UART
serdev. It also removes the chip-specific wcn7850-pmu node and the static
bluetooth serdev under uart14.

> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot=
/dts/qcom/purwa-iot-evk.dts
> index ad503beec1d3d..6fc6fe7c08995 100644
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts

[ ... ]

> @@ -618,61 +592,40 @@ platform {
>  		};
>  	};
> =20
> -	wcn7850-pmu {
> -		compatible =3D "qcom,wcn7850-pmu";

[ ... ]

> -			vreg_pmu_pcie_1p8: ldo9 {
> -				regulator-name =3D "vreg_pmu_pcie_1p8";
> -			};
>  		};
>  	};
> +
> +	wifi-bt-connector {
> +		compatible =3D "pcie-m2-e-connector";

[Severity: High]
Will this change break Bluetooth hardware initialization?

The hci_qca driver requests the target name "bluetooth" via devm_pwrseq_get=
(),
but pwrseq-pcie-m2 exposes its target as "uart".

Additionally, pwrseq_pcie_m2_match() checks whether the serdev consumer's
device tree node exactly matches the parent of the M.2 remote endpoint, whi=
ch
evaluates to false here.

This mismatch causes devm_pwrseq_get() to return -ENOENT. The hci_qca driver
then falls back to its legacy device tree regulator fetching code path, whi=
ch
fails entirely because the explicit regulators are removed in this patch.

Could this cause the WCN7850 to be held in reset?

> +		vpcie3v3-supply =3D <&vreg_wcn_3p3>;
> =20
> -		bt-enable-gpios =3D <&tlmm 116 GPIO_ACTIVE_HIGH>;
> -		wlan-enable-gpios =3D <&tlmm 117 GPIO_ACTIVE_HIGH>;

[ ... ]

> @@ -1499,19 +1441,10 @@ wcn_usb_sw_n: wcn-usb-sw-n-state {
> =20
>  &uart14 {
>  	status =3D "okay";
> +};
> =20
> -	bluetooth {
> -		compatible =3D "qcom,wcn7850-bt";
> -		max-speed =3D <3200000>;

[Severity: Medium]
Does migrating to the dynamic serdev creation omit the UART max-speed
property?

The removed bluetooth node explicitly defined max-speed =3D <3200000>. The =
new
pwrseq-pcie-m2 driver's dynamic node instantiation logic only injects the
compatible string and does not carry over the max-speed property.

Because device_property_read_u32() will fail to find the property on the
dynamically created node, the hci_qca driver falls back to its default
operational speed of 3,000,000 baud instead of 3,200,000 baud.

Is there a way to preserve this performance configuration?

> -
> -		vddaon-supply =3D <&vreg_pmu_aon_0p59>;
> -		vddwlcx-supply =3D <&vreg_pmu_wlcx_0p8>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-hamoa-m2-d=
ts-v2-v4-0-1b5ceac74538@oss.qualcomm.com?part=3D4
