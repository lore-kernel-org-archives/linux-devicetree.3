Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF20446069
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513688; cv=none; b=EcO84s8IzLTUS+YDkk55E2PSdGqqgV2/sNRLWVtLThTsqAJGqHv3Cgv0hsdOq0mTNl9GSbdR5dvjrqAikmkTNEmzA2jeREF7JNNrDMZNPHafqN+2HZEJTvRoAtNlq1X6pi3xUTV1xu4Zt6Y4blPvfinMNI2AFH2Alzb+RBjYT8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513688; c=relaxed/simple;
	bh=IdG/5pyTD8OuG+skgUwZ4HBw48EWhcBZwWiubXfXNzY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PE1G3MNs0ODP4QbsqqnkD+wGB0jR0uXyBbp+ku1AqNgs92t6dxQKgdNa6KPrMWZ4Fu07s3CmtebKgnBmEi4Db1o3JKt4e4wZuQHqrAAtQLewMoBOIWdSnGV00xNNIbMRNJyiW1QpehfHfulA7AWu5wnWUgPGVK3Io/2Vb2gW4zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsR4LtRm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsR4LtRm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF881F00AC4;
	Fri, 31 Jul 2026 16:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785513687;
	bh=MpnL50Rwd6c2bll3AaZPhCUxoqvSoTtzLjkhKot90j4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TsR4LtRmlcIbcynil0ocNXJNMgutBJwmHd5lYRmaFxWFlpRtoSv6u/jG6paqJqbgX
	 65WJa0Uc/TsfkzF2X94ResgshR+bLvd3NRpcrtekPl1yo7JFuY5Fwiz5iTFhcJ3DWf
	 V5zKTt2E/QPVVSc6V2P4z+QIClX30pGRxCcQz3pDK6EmNDZvYsZGUAI7M5/bhm0D/A
	 tRwJ861Z6y29/YXlE5zKmE6iFtucvW9XuD0M6qQV/3De68YoflBDv96GaJcbkqzhlB
	 6f/ez7GjI00DV0k3pAS+NjqtBg0YjiN3kiV8Qv0SQqJebK+elVt0L+OsA8X6H0k6mb
	 BmI7DqDXrjlFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 10/10] arm64: dts: qcom: arduino-imola: Describe
 NVMEM layout for WiFi/BT addresses
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-block-as-nvmem-v9-10-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
 <20260730-block-as-nvmem-v9-10-f72935817dbf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 16:01:26 +0000
Message-Id: <20260731160126.BEF881F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unhandled -EPROBE_DEFER during async NVMEM lookup causes fallback =
to random MAC/BD addresses
--

--- Patch [10]: [PATCH v9 10/10] arm64: dts: qcom: arduino-imola: Describe =
NVMEM layout for WiFi/BT addresses ---
commit a5efed902165c2b53cfd4d1ec5c5c615cc4e9ffa
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date:   Thu Jul 30 16:00:40 2026 +0000

    arm64: dts: qcom: arduino-imola: Describe NVMEM layout for WiFi/BT addr=
esses

This commit configures the Arduino Uno-Q device tree to expose factory-prov=
isioned
WiFi and Bluetooth addresses from the eMMC boot1 partition. It updates the
bluetooth and wifi nodes to retrieve their addresses from these newly mapped
NVMEM cells.

> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/ar=
m64/boot/dts/qcom/qrb2210-arduino-imola.dts
> index bf088fa9807f0..38839b8a361e7 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts

[ ... ]

> @@ -512,6 +538,9 @@ bluetooth {
>  		vddch0-supply =3D <&pm4125_l22>;
>  		enable-gpios =3D <&tlmm 87 GPIO_ACTIVE_HIGH>;
>  		max-speed =3D <3000000>;
> +
> +		nvmem-cells =3D <&bd_addr 0>;
> +		nvmem-cell-names =3D "local-bd-address";

[Severity: High]
This is a pre-existing issue, but could this cause the Bluetooth
controller to fall back to a random BD address?

The NVMEM provider here is an eMMC block device, which registers
asynchronously during mmc_rescan. This means the NVMEM provider might
not be ready when the Bluetooth driver looks it up, causing the lookup
to return -EPROBE_DEFER.

Because the Bluetooth HCI core performs this lookup asynchronously
during firmware initialization:

net/bluetooth/hci_sync.c:hci_dev_setup_sync() {
        ...
        hci_dev_get_bd_addr_from_nvmem(hdev);
        ...
}

the return value is ignored. Since the async context cannot bubble up
-EPROBE_DEFER to the driver core, will this silently fail and use
a default or random address instead of waiting for the eMMC provider?

>  	};
>  };
> =20
> @@ -557,6 +586,9 @@ &wifi {
>  	qcom,ath10k-calibration-variant =3D "ArduinoImola";
>  	firmware-name =3D "qcm2290";
> =20
> +	nvmem-cells =3D <&wifi_mac_addr 0>;
> +	nvmem-cell-names =3D "mac-address";

[Severity: High]
This isn't a bug introduced by this patch, but similar to the Bluetooth
node, will this cause ath10k to fall back to a random MAC address?

ath10k also performs the NVMEM lookup asynchronously during firmware
initialization:

drivers/net/wireless/ath/ath10k/core.c:ath10k_core_probe_fw() {
        ...
        device_get_mac_address(ar->dev, ar->mac_addr);
        ...
}

If the eMMC provider is not ready, this returns -EPROBE_DEFER which
is ignored in the async workqueue, preventing proper deferral.

> +
>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-block-as-n=
vmem-v9-0-f72935817dbf@oss.qualcomm.com?part=3D10
