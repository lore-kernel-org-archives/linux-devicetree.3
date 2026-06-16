Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A6628B7DA
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615740; cv=none; b=LK68nGbyZA3lFsjViPxXYdSvuTcZJyyOT+7Fiw7MOk6KXhdoYsYtdZDbKL+p0PbB3nonmEnOhApbakUBWRZWOZiv+lG9O0LUzj248HaeS5DBWfG6378HoRd1BvXQUcuWx7LmvpDuqXnleXrSyABMcv9Ov4RwFq6Hi1W+eZoHJbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615740; c=relaxed/simple;
	bh=colF1KqWdLV08QTlLvUPBqYh6h1WSBYR2HiW0v4Ilws=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OAypmqmgU7Umc09//1nvZtTmXfxP/g/B58uy7f4QKolQpnsktLx/9ZT/kZDyJMivgRj2e8L+TzLtTQoOb/iH9nWh+YtxY496DsL9uUj8Zq+nYuZvIvSsrOXEAJEs91eBNkE0qWVv9vn+4nCLTL17m2uZLa/PhTdzaCuVQD+nORs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8wzP6GZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8wzP6GZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8471F00A3A;
	Tue, 16 Jun 2026 13:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781615739;
	bh=/jKMctY9kM5WpZsMdP3yYDOJLVabSpR5omZq/S7cjbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H8wzP6GZ6LdmlfZHoZeyy5oVAbX+B1OLP5Dz7qvXR3Js3VMnfk42oamqOhS43rdaO
	 R/1t5MPykoXbuQIwufL36A7vJYB8ycFiSjT6VKMHUadwXBN8zkUoXwqyFsOZJlHWJS
	 OAlFpcnQPWGW5Iv4HM8bK1tWqBUf2b7JuYU3RKIoPTcqQWd/pb9F3JTIC+p16qFjRE
	 io70jgzTf+I79bYG47QDRcN0LV+ohKSBkF4WmeoXRENz9Fi00pLua1Tmldk+5AXhwq
	 j1qCZg6QUcpomLmO9LtTi/FeQfoAESonw+xT1U16NNqzwRlPci/PrGSR8T2Svph3Cy
	 X5EWdWJ1kNddw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for
 SD Card via overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Monish Chunara" <monish.chunara@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260616130347.3096034-3-monish.chunara@oss.qualcomm.com>
References: <20260616130347.3096034-3-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 13:15:38 +0000
Message-Id: <20260616131539.0C8471F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The device tree overlay fails to clear the inherited eMMC configur=
ation (`no-sd`, `non-removable`) from the base DT, resulting in completely =
broken SD card support.
- [Medium] The overlay configures a 1.8V-capable regulator and UHS-I OPPs, =
but explicitly disables 1.8V signaling, rendering the UHS-I configuration u=
nreachable dead code.
--

commit 5cd7b1bc67719c7d2577b7397199af1024203df8
Author: Monish Chunara <monish.chunara@oss.qualcomm.com>

arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
   =20
The monaco EVK board supports either eMMC or SD-card, but only one can be
active at a time. This commit enables the SDHCI on the monaco EVK board to
support SD Card storage via a device tree overlay, allowing eMMC to be
enabled via a separate overlay.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm6=
4/boot/dts/qcom/monaco-evk-sd-card.dtso
> new file mode 100644
> index 0000000000000..bc4ea12587a2e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
[ ... ]
> +&sdhc_1 {
> +	vmmc-supply =3D <&vmmc_sdc>;
> +	vqmmc-supply =3D <&vreg_sdc>;
> +
> +	pinctrl-0 =3D <&sdc1_state_on>, <&sd_cd>;
> +	pinctrl-1 =3D <&sdc1_state_off>, <&sd_cd>;
> +	pinctrl-names =3D "default", "sleep";
> +
> +	cap-sd-highspeed;
> +	no-1-8-v;

[Severity: Medium]
Will the no-1-8-v property prevent the UHS-I configuration from working?

The overlay configures a 1.8V-capable regulator (vreg_sdc) and adds
high-frequency OPPs (100MHz, 202MHz) to sdhc1_opp_table below, but explicit=
ly
disabling 1.8V signaling forbids the MMC core from initiating the 1.8V
voltage switch.=20

This appears to limit the host to standard High Speed and makes the 1.8V
regulator state and UHS-I OPPs unreachable.

> +
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&tlmm 11 GPIO_ACTIVE_LOW>;
> +	no-mmc;
> +	no-sdio;

[Severity: High]
Does this overlay properly clear the inherited eMMC configuration from the
base device tree?=20

The base device tree (monaco-evk.dts) configures &sdhc_1 with no-sd and
non-removable for default eMMC support. Since device tree overlays merge
properties, and this overlay doesn't use /delete-property/ for no-sd and
non-removable, the resulting node will have both no-sd and no-mmc
simultaneously.

Could this cause the MMC core to refuse to probe both SD and MMC cards?

> +
> +	status =3D "okay";
> +};
> +
> +&sdhc1_opp_table {
> +	opp-100000000 {
> +		opp-hz =3D /bits/ 64 <100000000>;
> +		required-opps =3D <&rpmhpd_opp_low_svs>;
> +	};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616130347.3096=
034-1-monish.chunara@oss.qualcomm.com?part=3D2
