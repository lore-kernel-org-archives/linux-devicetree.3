Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D4034B669
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847480; cv=none; b=fFPZex2DhgS4nJSURYkIM8X/GED5mn7mAZ5uKsc22mVwHP2ddIIaxS+AVCtbdN9y0Je6SF7CvItr7Es0LKx0AdIzrrTrVN6u4ehR1UCu2RcZNIS6SkgK6iHKRMtr1eQ7odSqAXh4KJ3FZv2tm8PgNNdMlDb8tg1YwjRIwVblZ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847480; c=relaxed/simple;
	bh=VbgUD8OiTZgCbCH126kOEFhNLipA4kG3bD4L52b+Euw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hHvdF1zNDlk9X75Pjorql8VongfDRo240exb83F1j644v3lt9ZUT9nPCAdpzcFXhcwYnamd6QbG+Pj0yQrAVmeMwbpz+Om4WdO78qT6uQCECpCPeupOFgaHnwvJNSJSuHGL3mxe0j1YmxSS3Y/pI7OPzuwx6MukeXK04ihh+a4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KEzfFOWm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEzfFOWm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23191F000E9;
	Tue,  4 Aug 2026 12:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785847479;
	bh=rv92E52hagASJlAJK/VgXsQp3hAjEP4jB8cQX7AUXrE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KEzfFOWmIALOPmoaazjQ7PXK+cIh6oBfypdhARlaLWhANn+bIekZWeeOkEHHRMthY
	 CYdXixtc60MnFG6iKz99oH+davc+YZ7DHabeIQqlRfbXsIcJM/hD87g4y7UyWhX39V
	 HJNXw6CvJypUxEgOMqHTOiAxTIEhAUCkxRNtiWW3NICjKHQWY8HUu37PCeN+xtOCBV
	 Mr4FGmZumVgzjBnOMvOnBM42ER2YvaUHAmlst+hRB/dcdnisLUWvhBtMSN4UAuG+R4
	 UWP2S0X+hpn1ndXtOXLYqTZANwzOzxR9Prisz0HX3KRkDqZeAtngHHk0USf8IMmF+W
	 4HGHS/SqWEXeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: hamoa-iot-evk: Describe the
 PCIe M.2 Key E connector
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Deng" <wei.deng@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260804-hamoa-m2-dts-v2-v4-3-1b5ceac74538@oss.qualcomm.com>
References: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
 <20260804-hamoa-m2-dts-v2-v4-3-1b5ceac74538@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 12:44:37 +0000
Message-Id: <20260804124438.E23191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Replacing the static `bluetooth` node with dynamic serdev instan=
tiation drops the `max-speed =3D <3200000>` property, causing the Bluetooth=
 UART to silently downgrade to 3.0 Mbps.
--

--- Patch [3]: [PATCH v4 3/4] arm64: dts: qcom: hamoa-iot-evk: Describe the=
 PCIe M.2 Key E connector ---
commit 26e9e455cf8a7ecff96e1f53323ed9575366864d
Author: Wei Deng <wei.deng@oss.qualcomm.com>

arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E connector

This commit describes the PCIe M.2 Key E connector for the Hamoa IoT EVK to
manage the Wi-Fi/Bluetooth module dynamically. It removes the static
chip-specific nodes in favor of a hardware-agnostic connector representatio=
n.

[ ... ]
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
[ ... ]
> @@ -1514,19 +1457,10 @@ wcn_usb_sw_n: wcn-usb-sw-n-state {
> =20
>  &uart14 {
>  	status =3D "okay";
> +};
> =20
> -	bluetooth {
> -		compatible =3D "qcom,wcn7850-bt";
> -		max-speed =3D <3200000>;

[Severity: Medium]
Will this removal of the max-speed property cause a performance regression =
for
the Bluetooth UART?

Looking at drivers/power/sequencing/pwrseq-pcie-m2.c, the dynamic serdev no=
de
is constructed using an OF changeset:

pwrseq_pcie_m2_create_bt_node() {
    ...
    ret =3D of_changeset_add_prop_string(pci_dev->ocs, np, "compatible",
                                       compatible);
    ...
}

Because the pwrseq-pcie-m2 driver only adds the compatible string during
dynamic creation, it lacks a mechanism to propagate the board-specific
max-speed property. When the hci_qca driver probes, it will fail to read
max-speed from the dynamically generated node and fall back to its protocol
default of 3.0 Mbps instead of the expected 3.2 Mbps.

Could we retain the max-speed configuration for this board, perhaps by pass=
ing
it through the new M.2 connector node?

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
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-hamoa-m2-d=
ts-v2-v4-0-1b5ceac74538@oss.qualcomm.com?part=3D3
