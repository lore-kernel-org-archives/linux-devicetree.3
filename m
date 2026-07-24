Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FEF3ACEE0
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880946; cv=none; b=n8+r0QhYGOo0g5XRVNG6DteOG9x/5xe7KlthVt3n81yN5Xg4MaHe93FzjvG7unGN9Z91sQ++r+VqFLojrfCE4PlCONdlZC4bOlw7yBuLU7AnjVX9lkTCgRPfgChbwNhqp5sQLTMoVbtOxsv744ahInUqpPhlIGK8X+t4p5Z3wEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880946; c=relaxed/simple;
	bh=1Z1QT2/A+0r7VoEL/05EXD8buIxe8+5hVhNtwZ+nYAo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VsJ40895Gohx1VM625XQ7nIkyyRZbKVDYKERw5Qw50B985XGnOLIwWgYZl7widWgrWVNkTndiZUiBQY8RoNxD5bQGARkuvjqNnk0CSKJ28qSQgAo6lLjXohCGj2EAhJgTChikzeyzTW7gSMTK6JwWO1ZpqUVow4CMmc2QP/9BSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lGvzYXZV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lGvzYXZV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C0A1F00ADE;
	Fri, 24 Jul 2026 08:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784880936;
	bh=B79XrBFxr4epxtiKU6rMvmYMaPXmHZdbVcvKxCtaFQ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lGvzYXZVzOmmM8+e7XzhOXZYrchGj+/8sZqeygOFcTN30JzegNDCReZ0bWalZTM8W
	 qeUtRn86yCdTZvZ7wqiNisWWCcBxOZnS6SD3MYu2vLGRrM4SXeqSBLSM4hEeIdeMPO
	 7yMU1BMAfOQHR2x6RUTE/XKOEb1fiOR1qsF4aXpqPUt/+GSDMsWl7urcmHMSek5v+o
	 8ImtjzL4/hJCVqc/bw2jywTFOlKh0e+bSBMpo0GMUD9csquLXFdQmX74K9Rx2wHF13
	 VMX7d4Ck8IMmMzNYHFiEFlgTBHgGSj+IVyu0rmpgOTCXtzpM/ZOpvTOXsA4eautWc2
	 hemn9++f8QnAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] arm64: tegra: Add Tegra264 SDMMC1 device tree node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prathamesh Shete" <pshete@nvidia.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724075700.714261-6-pshete@nvidia.com>
References: <20260724075700.714261-1-pshete@nvidia.com>
 <20260724075700.714261-6-pshete@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 08:15:35 +0000
Message-Id: <20260724081536.39C0A1F00ADE@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing pinctrl configuration for SDMMC1 pad voltage switching.
--

--- Patch [5]: [PATCH 5/5] arm64: tegra: Add Tegra264 SDMMC1 device tree no=
de ---
commit 9ce1cc837d5e304cb5792016306e46a502dddf18
Author: Prathamesh Shete <pshete@nvidia.com>

arm64: tegra: Add Tegra264 SDMMC1 device tree node

Add device tree node for the Tegra264 SDMMC1 instance.

> diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra264.dtsi
> index 2d8e7e37830ff..8b1f45b5c4cb9 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> @@ -3631,6 +3631,40 @@ i2c16: i2c@c430000 {
>  			status =3D "disabled";
>  		};
> =20
> +		mmc@c570000 {
> +			compatible =3D "nvidia,tegra264-sdhci", "nvidia,tegra194-sdhci";
> +			reg =3D <0x00 0x0c570000 0x0 0x10000>;

[Severity: High]
Does this node need pinctrl configurations to support the declared UHS mode=
s?

This node defines UHS modes (e.g., sd-uhs-sdr104) later in the block but la=
cks
the corresponding pinctrl-names and pinctrl-x properties required by the
sdhci-tegra driver to safely switch pad voltages.

Because the Tegra264 SDHCI host driver declares NVQUIRK_NEEDS_PAD_CONTROL,
missing these properties causes tegra_sdhci_init_pinctrl_info() to fail dur=
ing
probe. This skips assigning the sdhci_tegra_start_signal_voltage_switch
callback.

When the MMC core later attempts to switch to 1.8V for the declared UHS mod=
es,
it will fall back to the default sdhci_start_signal_voltage_switch()
implementation. This modifies the controller registers but fails to adjust =
the
actual Tegra SoC pad driver voltages.

Could this leave the physical pads stuck at 3.3V while negotiating 1.8V,
potentially causing signal integrity issues, data corruption, or hardware
damage when an SD card capable of UHS modes is inserted?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724075700.7142=
61-1-pshete@nvidia.com?part=3D5
