Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01744611C2
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322346; cv=none; b=k1HNwt/8N3i0FxoJ0BZarGoaGW/oHruSPRtVi0SYpNNdG5ok3h9JVKZwDkAPyEtGEKu/YhR+eSPYvKpHJPbMyC5T5B4XzWjTpfWyW08i9UtTYUfcArbK0t9mEbdnKo/Lu+WKvUH2wxM3TeSri0RBNTqBxQdVIt+MQG40TaNSIVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322346; c=relaxed/simple;
	bh=dkn99kzl89UH+0qwq+1682GCiFy38KgRMzlk5Rr9Kcg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GLFVQM48j50IxmrzN03SAM4CVZVqvc7SJLIP2zzqdD14L0R06nL7kTOO04fhU+QuNVNsfTTAhVfF/M1K722rVtWGYkbfqaiqINPKSwYW1gGxoJ/7YvnxnjUxaC2NTOnQPXkukXZT2yW15uY7A9DEfuK4PEW+3vjNqFPnnYRj0c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mBag6JT7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mBag6JT7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0E81F00A3A;
	Wed, 29 Jul 2026 10:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785322334;
	bh=photie4QCGE7ubYTZ3oU7o56noCY1Ic4qjJ/ozKqHvQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mBag6JT7z+ppGlX966+rNcpEv5LX44nkPy+3Bu/tYGx+chtwqLNpbJ3tudp+d/Yww
	 JTS9aOoXCa1ujTzfCC5zz6rRt9v2tX7L4hdsT5EDR7XJRltTqVpuMto3a77MCOrwJz
	 wi7tOmHHhPvRBeTZgAsu/k0CzU0Ku74L+DHRfUZEan7TZdWlIzGPUQUhFwpEYc8zHS
	 a3pWw6eUO4bbWmMXzMoHvK2Rij/l66+7G/VAAqRV3H0vrogMIcCeNgG8VkK5Fdi3Eb
	 tv5kDXYoYkLJPBbSbHFpeHF3YS7W9EoBnZfUnottIfQBp85cuJy+mIaDQn4zzb5MSS
	 mrJ9EKumXMUrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: hamoa-iot-evk: Describe the
 PCIe M.2 Key E connector
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Deng" <wei.deng@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729-hamoa-m2-dts-v2-v3-3-4d7ef9274575@oss.qualcomm.com>
References: <20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com>
 <20260729-hamoa-m2-dts-v2-v3-3-4d7ef9274575@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 10:52:14 +0000
Message-Id: <20260729105214.AB0E81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Switching to the M.2 power sequencer framework breaks Bluetooth in=
itialization because the `hci_qca` driver and the `pwrseq-pcie-m2` driver u=
se mismatched power sequencer target names, causing probe failure.
- [High] The `wifi-bt-connector` node omits the 1.8V IO supply (`vpcie1v8-s=
upply`), breaking strict dependency tracking for the M.2 VIO.
- [Medium] The removal of the explicit `bluetooth` serdev node drops the `m=
ax-speed =3D <3200000>` property without an equivalent replacement mechanis=
m, leading to a Bluetooth throughput regression.
--

--- Patch [3]: [PATCH v3 3/3] arm64: dts: qcom: hamoa-iot-evk: Describe the=
 PCIe M.2 Key E connector ---
commit 519be148d37d417828c1284c945a2103a6f63bb5
Author: Wei Deng <wei.deng@oss.qualcomm.com>

arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E connector

This patch replaces the static WCN7850-specific Wi-Fi and Bluetooth nodes
with a dynamic pcie-m2-e-connector node. It delegates card power and dynamic
node creation to the pwrseq-pcie-m2 driver. The older dummy regulators and=
=20
chip-specific wcn7850-pmu nodes are removed.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot=
/dts/qcom/hamoa-iot-evk.dts
> index c7ba4b353ddd2..a2632554aa83a 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts

[ ... ]

> @@ -538,6 +512,55 @@ vreg_wwan: regulator-wwan {
>  		regulator-boot-on;
>  	};
> =20
> +	wifi-bt-connector {
> +		compatible =3D "pcie-m2-e-connector";
> +		vpcie3v3-supply =3D <&vreg_wcn_3p3>;

[Severity: High]
This node appears to omit the 1.8V IO supply (vpcie1v8-supply) that was
previously supplied to the PMU as vddio-supply.

Since the pwrseq-pcie-m2 driver uses of_regulator_bulk_get_all() to acquire
all supplies, and vreg_l15b_1p8 is not marked as regulator-always-on in this
tree, could the IO domain lose power during runtime if all other consumers
release the 1.8V regulator?

> +
> +		w-disable1-gpios =3D <&tlmm 117 GPIO_ACTIVE_LOW>;
> +		w-disable2-gpios =3D <&tlmm 116 GPIO_ACTIVE_LOW>;

[Severity: High]
Could the w-disable2-gpios reset remain permanently asserted during Bluetoo=
th
initialization?

When hci_qca probes the dynamic Bluetooth node, it attempts to acquire the
power sequencer using devm_pwrseq_get(&serdev->dev, "bluetooth"). However, =
the
pwrseq-pcie-m2 driver appears to register the target as "uart".=20

Will this name mismatch cause devm_pwrseq_get() to fail with -ENOENT,=20
prompting hci_qca to fall back to parsing direct regulators and GPIOs that =
are
no longer present, ultimately failing the probe?

> +
> +		pinctrl-0 =3D <&wcn_wlan_en>, <&wcn_bt_en>;
> +		pinctrl-names =3D "default";

[ ... ]

> @@ -1514,19 +1469,10 @@ wcn_usb_sw_n: wcn-usb-sw-n-state {
> =20
>  &uart14 {
>  	status =3D "okay";
> +};
> =20
> -	bluetooth {
> -		compatible =3D "qcom,wcn7850-bt";
> -		max-speed =3D <3200000>;

[Severity: Medium]
By removing this static bluetooth node, we lose the explicit max-speed
property.=20

Does the new dynamic node generation framework in the pwrseq-pcie-m2 driver
have a mechanism to inject the max-speed property into the dynamically crea=
ted
UART serdev?=20

If not, will the hci_qca driver fall back to a lower default baud rate and
reduce Bluetooth throughput?

> -
> -		vddaon-supply =3D <&vreg_pmu_aon_0p59>;
> -		vddwlcx-supply =3D <&vreg_pmu_wlcx_0p8>;
> -		vddwlmx-supply =3D <&vreg_pmu_wlmx_0p85>;
> -		vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn>;
> -		vddrfa0p8-supply =3D <&vreg_pmu_rfa_0p8>;
> -		vddrfa1p2-supply =3D <&vreg_pmu_rfa_1p2>;
> -		vddrfa1p8-supply =3D <&vreg_pmu_rfa_1p8>;
> -	};
> +&uart14_ep {
> +	remote-endpoint =3D <&m2_e_uart_ep>;
>  };
> =20
>  &uart21 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-hamoa-m2-d=
ts-v2-v3-0-4d7ef9274575@oss.qualcomm.com?part=3D3
