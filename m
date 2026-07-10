Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724EC3A5E77
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783663335; cv=none; b=mI7mlBABroD6SoT/GpzgI2QkrXr/Lo1P4IckkU9UZ1kS57G9eEBswMRty9+Qav8aX3m09+gWwnvRke63kUhgZusu0Ft4iuqrTBls43f13LP2Jxz/qaUi4CyOJ0MRE+4RbZN7DogZDIkCi2HVlM1sqqIkqyODyO6Vwv5/E0l9lVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783663335; c=relaxed/simple;
	bh=MravrVZuHJtwdsCCpKVK/Zhqu1l8Mf0etmWstFmpK6o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uldEBQatoR6hHqvJPV3cHukdFrwsykBxurEadyQ91yM+rasGN3J6ErGIAs/DLR/H52bFxTe2/NUBgTqS587nEoVwMUCEfZLpNNnhkxRuJ0VkBKU2k1hQjr8VB3srwOlQf/XXfLHYoAmQFTRX8434Hc9MmRpa5QDW13IGH2isQLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsANe+nw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsANe+nw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB8A1F000E9;
	Fri, 10 Jul 2026 06:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783663334;
	bh=1PaE1u69Je8XxidDQcLBcUT4tIi3JiLesqL6ZHPzPRc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PsANe+nw6/F3k4RNuQW9wdRtsFcx4DgApzQlE2CtiXhuoEo9W8NYvYSq1BOTgEGmG
	 u5VDwPFy0GbfJpwly8YdCTYAMDWxqizPrw84Xg/+rJdSAgZ4/e3hooo78bbiU+6RPF
	 zteV1M0EKKxrliYxO7HmXaXc28/TNXCZyuJHcUz7QoYzNcytwEm0kdcFrjFti7bDpy
	 BGHOj6DUTpsVANDNERkKrLMCPW7lZ6sHKYVt6DoNUsx9KBw8U8CHiHOJbhhXzeEHKX
	 4Y+IH9DTZiAHNgmzuUhrnLi7ob9Bwmj1UforEgNg251J+tlgmiVMi3Ke7ZLJFhO6+E
	 t40g0nHfVSM9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Huang" <jackyhuang@nvidia.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260710054849.3178747-3-jackyhuang@nvidia.com>
References: <20260710054849.3178747-1-jackyhuang@nvidia.com>
 <20260710054849.3178747-3-jackyhuang@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 06:02:13 +0000
Message-Id: <20260710060213.ECB8A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] USB device OF properties placed inside `interface@1` subnodes fo=
r standalone CP2112 devices (`cp2112a`, `cp2112b`), rendering their GPIO an=
d interrupt controller properties unreachable.
--

--- Patch [2]: [PATCH v3 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC ---
commit a3630d8ce64970cdc226cd47ccf45d81782d9cf0
Author: Jacky Huang <jackyhuang@nvidia.com>

ARM: dts: aspeed: Add NVIDIA VR-NVL BMC

Add the device tree for the Aspeed AST2600 BMC for NVIDIA's Vera
Rubin NVL compute platform.

Link: https://lore.kernel.org/all/20260629105202.1417679-1-jackyhuang@nvidi=
a.com/

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts b/=
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts
> new file mode 100644
> index 0000000000000..197f6c5a95fe0
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts
> @@ -0,0 +1,901 @@

[ ... ]

> +				device@1 {
> +					reg =3D <1>;
> +					#address-cells =3D <2>;
> +					#size-cells =3D <0>;
> +
> +					cp2112a: interface@1 {
> +						reg =3D <1 1>;
> +						gpio-controller;
> +						#gpio-cells =3D <2>;
> +						interrupt-controller;
> +						#interrupt-cells =3D <2>;
> +					};
> +				};

[Severity: Medium]
Will these OF properties be ignored by the kernel?

Since the CP2112 is a single-interface USB device, the USB OF core
uses a combined node and assigns the parent device@1 node as the of_node for
the interface device. This means child interface nodes are ignored.

Additionally, the DT specifies reg =3D <1 1> (interface 1), but the CP2112
only has interface 0.

Should these properties be placed directly in the device node instead?

[ ... ]

> +				device@1 {
> +					reg =3D <1>;
> +					#address-cells =3D <2>;
> +					#size-cells =3D <0>;
> +
> +					cp2112b: interface@1 {
> +						reg =3D <1 1>;
> +						gpio-controller;
> +						#gpio-cells =3D <2>;
> +						interrupt-controller;
> +						#interrupt-cells =3D <2>;
> +					};
> +				};

[Severity: Medium]
Will these properties also be ignored for the same reason as cp2112a?

Should these properties be placed directly in the device node instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710054849.3178=
747-1-jackyhuang@nvidia.com?part=3D2
