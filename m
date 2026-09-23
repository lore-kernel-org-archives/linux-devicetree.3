Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31F12F39C2
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152255; cv=none; b=NF8agfCvyM4SfUMyFesFywBqKubSWZReLCgTz5z+Qi9LFawwscO7dVleKXfKHJuDq3MWD8ZpdiwgkdnEQo8viWfX+GhOumwlAyqWkpjGIPCGlYE5SJsZcKkC9JmyhzNsDKURfWFFoTL9uYUnYCv8fqeRGp1Ql32cSNkuQ7MUMFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152255; c=relaxed/simple;
	bh=xOz3pzPT1jDOiiohZw/0zzfI884rg1qSFvIGXLZNXl4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wazc+Jkq9/6jR/BJzAFfoGfaSEkcMVRrF0xTwtyWIZP6qh5j1CHvHQXsnz4WSDgcrQVOgEuWdGIu3Y92kJU4XRSgxaipKPpTDag2wOULmW1rNgx64tv8fB8fwLaQIqxqwmSxKg5CzF3LLYvGmHLxkLHvxUusF1utbux29lQrDJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIahY5n2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIahY5n2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A861F000FF;
	Wed, 23 Sep 2026 08:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790152253;
	bh=MvWlgaRRf1hB8Mc9il9c2O/zxKP3mkIH8Bd9x16szd0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KIahY5n2xng8XH+n5DYsPRWHewYy4YwlqL+RY2oDQoSW0aFUrk/Wzew/K6UUa0R9f
	 Sm02maNBRC1R1vaf4bfQDLHZ+qtSdw4SuD7JvuFt+ILwIJ9pkCFOP1Le76jcPe0Ve5
	 AiBxF5bJOL4uuL1+iq9McdubvASrMr8o+f07dZ1Zxav4qXlaKCu6JTO4P8PVTE2n9e
	 tjSf5oeZQ1XywpDprIEX6TDNSWK0Xf1EWGas7Q6gZPxgB1IPylHOgJ90ORGg4/em/P
	 RubkUOohRFnTPnkrR6JXDvRiRr8FudbM1Us5vJzwCR4V/l4DQW56yJOnJUfd75ubdz
	 MO2cpQhsB7P3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: socfpga: agilex5: enable SD card on
 SoCDK modular
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <8a7cb87c7afbe8e1d6d0801658bfa6615c030c66.1790151203.git.tze.yee.ng@altera.com>
References: <cover.1790151203.git.tze.yee.ng@altera.com>
 <8a7cb87c7afbe8e1d6d0801658bfa6615c030c66.1790151203.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 08:30:52 +0000
Message-Id: <20260923083053.27A861F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dtbs_check failure: unparsed cdns,ddr50-phony-dqs-timing property
--

commit 856f28d1f721f596d93f5b3cac3f410afa5e6dc8
Author: Tze Yee Ng <tze.yee.ng@altera.com>

arm64: dts: socfpga: agilex5: enable SD card on SoCDK modular

This commit enables the micro-SD slot on the Agilex5 SoCDK modular board
by adding regulators, the PCA9535 expander, and configuring the sdmmc node.

>   - Enable the sdmmc node in 4-bit mode with SDR104 and DDR50 UHS-I
>     support, wire up the vmmc/vqmmc supplies, and set the board's
>     DDR50 phony DQS timing.

Is the claim about setting the DDR50 phony DQS timing accurate?

The added devicetree property doesn't appear to be parsed by the host drive=
r,
meaning this might not actually set the board's timing as intended.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts =
b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
> index a2b707ae6e9e4..7b44c24412c24 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
[ ... ]
> @@ -61,6 +79,32 @@ emac2_phy0: ethernet-phy@0 {
[ ... ]
> +&sdmmc {
> +	bus-width =3D <4>;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	max-frequency =3D <200000000>;
> +	no-mmc;
> +	sd-uhs-ddr50;
> +	sd-uhs-sdr104;
> +	vmmc-supply =3D <&vmmc_reg>;
> +	vqmmc-supply =3D <&vqmmc_io_reg>;
> +	cdns,ddr50-phony-dqs-timing =3D <0>;

[Severity: Low]
Does this property actually configure the hardware?

It appears cdns,ddr50-phony-dqs-timing does not exist in any Cadence SDHCI
bindings and is completely unparsed by the driver in
drivers/mmc/host/sdhci-cadence-phy-v6.c.=20

Since Cadence devicetree schemas strictly prohibit unevaluated properties, =
will
this trigger dtbs_check validation errors when building the devicetree? It
looks like the driver manages phony DQS logic internally, making this prope=
rty
dead code with no functional runtime impact.

> +
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790151203.gi=
t.tze.yee.ng@altera.com?part=3D4
