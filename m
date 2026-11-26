Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684841;
	b=0wG5BS8wgBk/UrSJx3mzqvyJbdWYjfEv9iFl6Yj6SRZ7NGDPGtRfAHF5OEDZ5ytOLnSV
	 mxMMM1oUXuyIDe9nprlznMHM/0iNETPcLgbgBwXxy1jQSd4I0x/jPkqXfkqCNVxYfmuCH
	 TOPY8UN+D2w6t9WAzEXn2yvBhXBR1RcNHcjHAIvEHXC6+ni7g90fTxbTz0lmjGH1yBS5f
	 xnAovOAOIa0TYvCCvaBudyJFqC5EW9zEiBAvmytlfkbA/+9eJbUdjTLBc1B52ps001USV
	 1JQdeoO5IVXCQ+WwMxYu3Qqbx7xFAqsiCC2DQVSbKnMzcP/AzG7iBAByN1PqP/H1DDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684841;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cf4FRqya/4qOQQQJ42WWRSBKQgos6nH+h+T6m0Rgxrk=;
	b=MJ8Tzrg037hhMRJhacruZn+91Pe/m5sQs5QJLWP7UyI6UZ2lNyq94NyS7xFVwMzNd1r9
	 mb01LEb0dg9kcCRKfF+c+593vMoZeR9INJwoS1FMKeKTt8SAJPgNVuU5Zt3mO+cIU4Vtd
	 VQJWpq9yy+q1kKNQsPrWv41M9cE5fB2QYH9r32KJ7W3Birvdcbfe1fjypKbqIs4H3NSTs
	 t9buZLRxKEnCcATJZETA+57KGWyMYE8K7XUMAIZMWYexu2AUNBuJ5w4RXLIdx9IzxYlQz
	 z8bEbhvvh+xY3DSNEUHjFunk8LMG38PaftlnnfIFNQnTHPDkysmYd4XZeyh32qypmVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AU+oxcCM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38946606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AU+oxcCM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7B51F000C6;
	Thu, 26 Nov 2026 09:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795684840;
	bh=cf4FRqya/4qOQQQJ42WWRSBKQgos6nH+h+T6m0Rgxrk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AU+oxcCMvg+c10pu97SRUDeaGV4Knec2wwawUAy4zWqEHMSYD1XdKvdaSwDu88CTV
	 gkFnZosuytveIfjP8140s7NsMs1mlCSfiX6xPuLQCswUvOEsOgAeocVins22yk++6d
	 QvlK9nPawUYVqnju8fW7EVlr5zhkT2HeVCHj0nLFcY71s7ozd7Qdlq8Y7CQC6E0Wsf
	 jplJs7wY13YOAwPUqYSWMa1xPiWKq3MkMOIVE/U63H8g3THvbsP5WOI8kU0iR1EZ+c
	 oxNPydJm2nm8EvpTR9qQ6k+LJVUraCR3LPFjh4iW2b9LMFu01PpemKEOWX9a0/r2Bn
	 ekKN6eP1p9WBQ==
Message-ID: <sashiko-outbox-235115@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: lemans: Add Vicharak Axon Pro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ajit Singh" <blfizzyy@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126090928.73637-2-blfizzyy@gmail.com>
References: <20261126090928.73637-1-blfizzyy@gmail.com>
 <20261126090928.73637-2-blfizzyy@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 09:20:40 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: qcom: lemans: misplaced pcie1 GPIOs and wrong
  WAKE# polarity
--

commit b99c8adc648ceea0d68c162149cad6f93cd36e09
Author: Ajit Singh <blfizzyy@gmail.com>

arm64: dts: qcom: lemans: Add Vicharak Axon Pro

This commit adds initial device tree support for the Vicharak Axon Pro
SBC based on the Qualcomm QCS9075 SoC.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts b/arch=
/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts
> new file mode 100644
> index 0000000000000..f81aa2ebbdcca
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts

[ ... ]

> +&pcie1 {
> +	perst-gpios =3D <&tlmm 4 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 5 GPIO_ACTIVE_HIGH>;
> +	vddpe-3v3-supply =3D <&vcc_pcie1_en>;
> +
> +	pinctrl-0 =3D <&pcie1_default_state>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Should perst-gpios and wake-gpios be defined as reset-gpios and
wake-gpios on the &pcie1_port0 root port node instead, with wake-gpios
set to GPIO_ACTIVE_LOW?

Because lemans.dtsi defines the child root port node pcie1_port0 under
&pcie1, placing perst-gpios on the host bridge node triggers a runtime
warning in qcom_pcie_parse_perst() ("Reusing PERST# from Root Complex
node. DT needs to be fixed!"), and pci_configure_of_wake_gpio() only
looks up wake-gpios on the root port node, so PCIe wakeup is never
configured.  In addition, PCIe WAKE# is an open-drain active-low signal
(matching the bias-pull-up on gpio5 in pcie1_default_state), whereas
GPIO_ACTIVE_HIGH causes pci_configure_wake_irq() to select
IRQ_TYPE_LEVEL_HIGH.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126090928.7363=
7-1-blfizzyy@gmail.com?part=3D1
