Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453296;
	b=BeOPv+Li4Z+5yW1SQoJyHr7e2t+eexM77nBjTZs3pnn9RWojTJvCUOZDg4nXjpMEjtng
	 2UdxxiErntuMDsgObXiXE3rtt8JM3lupDwxCu077GjrQN6piwDpnOoYeJNdnSX5e7WnlJ
	 moJ3HFXDVacnJzTcvoE781N3e2rH4lAY3B6VaZXN6JDBQhC967hAZXvz7mTa4whgvlYFT
	 xq9yrqXzMB2GGwEyWmg6gqznxBleAF6Hhpy0/BPoiUI6xAam8ksEmmzcr/Rpp+0jP3Hvv
	 iAmK8QcUDP8WZD3TPvGPv1RD/eTukDt98fGCLQRYWxxgIkA9hveZTSB31DhcHoOvbcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453296;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Lz2PwH/uR7B+/hJ9O5TIA3BLE7YKOyoPUO09NIOMQs4=;
	b=DtaYuX42OohLqMboVNZKoVNPZOc0wVKTk6M2zyBBgKihF/UASJ9sXfOcRnIdB4kljU9/
	 /zsJbdbSzwNvCqYSckJR33w3dNL93jTwdFl1P4BxMJeO7Y1F4m8AdBa+ILiefTasttq2r
	 LWnQ3kaDu0Jb9kGKCb4b5NMizUkeZ6FrAUdaDDAk+aRMaJ2Ou69VF1uiE0wgC+Fn/DVsp
	 MtNa8OAvum+nDwLC/vJXZJZF77IWbkzIxAUO2OYUHDD3qMYacSDuEMmCGNDQi4ZH+H0Yg
	 IuMKf1Vz87DEfy8gKU6oY0bpFC69M/rbRqSUrRRwsPlOGypkCfpcq0sAB06sFBzwB1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EXO13AQX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C63606A31A
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EXO13AQX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1327A1F00919;
	Sat, 31 Oct 2026 13:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793453296;
	bh=Lz2PwH/uR7B+/hJ9O5TIA3BLE7YKOyoPUO09NIOMQs4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EXO13AQXU7znYmmei3RtOzxuhXOuhJU0U1g9KESsUWxlI2w+f+rGOqc/jOX4kqW12
	 wjti8Hur9ewHOGQ/EAZT/dPlxhyIIb+QbY8aMY3zTfikuYIXMRumEeSlAxSAbnotV9
	 X9wWNshxXAwjl7O5ZGIyhKRjqRxedebFb2ZA3nm9Yfgomb2ugV1/UIAKiOtFwypukj
	 Ma8zCUD1bDEgBzJVgLqqdqcNYaog4rTJ1IRBBIDzR+hYRUPSpANKVpdvGh6hS42Jj3
	 42VoSfd41BehN60OsrRIzmmvQ2zIMgxTMurzrpph59/25kWvWX6wGo4w5Me+yRNY3T
	 1gQvzZJFQ6QqQ==
Message-ID: <sashiko-outbox-191972@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: lemans: Enable
 lemans-sa8255p-ride board support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261031131042.1200862-7-shengchao.guo@oss.qualcomm.com>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
 <20261031131042.1200862-7-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 13:28:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: lemans-sa8255p-ride: pcie0_ep and pcie1_ep lef=
t disabled
- [Medium] arm64: dts: qcom: lemans-sa8255p-ride: wrong PCIe EP wake-gpios =
polarity
--

commit bff6574db44d1ddfd9eaf91078652c4652934614
Author: Nikunj Kela <quic_nkela@quicinc.com>

arm64: dts: qcom: lemans: Enable lemans-sa8255p-ride board support

This commit adds initial device tree support for the Lemans SA8255P Ride
board, configuring UFS storage, UART consoles, PCIe endpoint interfaces,
PMM8654AU thermal zones, and SCMI protocol nodes.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts b/arch/arm6=
4/boot/dts/qcom/lemans-sa8255p-ride.dts
> new file mode 100644
> index 0000000000000..6f19064997a4b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
[ ... ]
> +&pcie0_ep {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie0_ep_clkreq_default &pcie0_ep_perst_default
> +		    &pcie0_ep_wake_default>;
> +	reset-gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 0 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&pcie1_ep {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie1_ep_clkreq_default &pcie1_ep_perst_default
> +		    &pcie1_ep_wake_default>;
> +	reset-gpios =3D <&tlmm 4 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 5 GPIO_ACTIVE_HIGH>;
> +};

[Severity: Medium]
As reported by Sashiko on v2 [1], should pcie0_ep and pcie1_ep also set
status =3D "okay" here?

In arch/arm64/boot/dts/qcom/lemans.dtsi, pcie0, pcie0_ep, pcie1, and pcie1_=
ep
all default to status =3D "disabled". In
arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi, pcie0_ep and pcie1_ep are
configured with the sa8255p compatible and power domains:

&pcie0_ep {
	compatible =3D "qcom,sa8255p-pcie-ep";
	power-domains =3D <&scmi5_pd 1>;
};

&pcie1_ep {
	compatible =3D "qcom,sa8255p-pcie-ep";
	power-domains =3D <&scmi6_pd 1>;
};

This board file enables scmi5 and scmi6 and configures the pinctrl and GPIOs
for pcie0_ep and pcie1_ep, and the commit message states that it enables the
PCIe EP interfaces. Although an earlier discussion on v2 noted that PCIe0 RC
is enabled so PCIe EP cannot be enabled simultaneously, lemans-sa8255p-ride=
.dts
only includes lemans-gearvm.dtsi (not lemans-ride-common.dtsi), so neither
pcie0 nor pcie1 is enabled in this device tree. Without status =3D "okay",
won't both pcie0_ep and pcie1_ep remain disabled at runtime?

[Severity: Medium]
As reported by Sashiko on v2 [2], is GPIO_ACTIVE_HIGH the intended polarity
for wake-gpios in pcie0_ep and pcie1_ep?

When qcom_pcie_ep_probe() in drivers/pci/controller/dwc/pcie-qcom-ep.c prob=
es
a qcom,sa8255p-pcie-ep node, qcom_pcie_ep_get_resources() requests the wake
GPIO with GPIOD_OUT_LOW, and qcom_pcie_perst_deassert() toggles the logical
state to pulse the active-low wake signal to the root complex:

	gpiod_set_value_cansleep(pcie_ep->wake, 1);
	usleep_range(WAKE_DELAY_US, WAKE_DELAY_US + 500);
	gpiod_set_value_cansleep(pcie_ep->wake, 0);

Both Documentation/devicetree/bindings/pci/qcom,sa8255p-pcie-ep.yaml and
arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi specify GPIO_ACTIVE_LOW for
wake-gpios on these same tlmm pins (&tlmm 0 and &tlmm 5). With
GPIO_ACTIVE_HIGH, won't the physical wake line be held low when idle and
driven high during the wakeup pulse?

[1] https://lore.kernel.org/r/sashiko-outbox-172176@kernel.org
[2] https://lore.kernel.org/r/sashiko-outbox-172176@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031131042.1200=
862-1-shengchao.guo@oss.qualcomm.com?part=3D6
