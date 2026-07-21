Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A174D8D9D
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646295; cv=none; b=au1nM079VhM5whexRCSixv3CAun+s/l+232eYHvngogFDWHVbOxn+OcbiDtL29FPTjZoEcds6OBk1cPCO/+OB2mHLf/MSwydpvJa7HbvnEbMxYCfm8RQqN5qkaD1EMQhjeXK8WA4C5ZjY6avKjErniuFFDAijh01TYQQyiZV9tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646295; c=relaxed/simple;
	bh=RSNaUch5bL7CrNxBhkVv0f8ux1hXDHuD8ptvzX4wv00=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rlh2a1jWE9niz+/Kj+eMSbf6eSw5ultn4GtsQF6Hn9PkxedtFmI5eQ/D8pJN9kXBFpJF6tqFevwDYggOf0iSG8oxxrKMETIjl3ZOG4PauMADS7ViU6Wc2kAtWVui6YvgXo0DPJiAreFoJB9QQVpa9mE2/sao5BjLQpQX4xCnJlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ia1ztu+Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ia1ztu+Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1091F00A3A;
	Tue, 21 Jul 2026 15:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784646293;
	bh=quI0foouyl0vdiX0UqE59kXhzOpfZaAJxBVn2+/rsa4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ia1ztu+YbL151SI/npRlU+N4PhCCwQOqxHt9WrYD4nPngYJ7qiT7ihgqypRqsmxl1
	 7d2PHM+ZdI6CvnH4ewjGi3cVvhQ3noHlBbh2eWipJqY7JKZdrl6qtCEKtrUT2P2HHs
	 21MqGAObPEhEbA6wqC4zOienTYwQsMYrERArqqExsa8i0DEh+osk++UPPRZvbYiha7
	 FkoxCTOzH4TRLfrmeKZ8wSmUwn4tJ+u2WcTG9S1gJkowdklBaSmeLOy6bttMrUw5u7
	 ZpRIyxm0QimxS+Uh0vzT4N08YvCgOSeoanClMOPr8Tjr0PGMXbZOO2OEUjRpZriuNP
	 1paiCNCHvZ9Fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro
 (sheng)
Reply-To: sashiko-reviews@lists.linux.dev
To: code_0002@163.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721145452.1996-1-code_0002@163.com>
References: =?utf-8?b?PHYz55qEbWVzc2FnZS1pZD4=?=
 <20260721145452.1996-1-code_0002@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 15:04:52 +0000
Message-Id: <20260721150453.2D1091F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Sharing the same reset GPIO across multiple cs35l43 codec nodes us=
ing `GPIO_OPEN_DRAIN` does not prevent `-EBUSY` probe failures.
- [Medium] The commit message claims to 'Remove output-low/output-high from=
 TLMM pinctrl', but `output-high` is still present in the `i2s1_default` pi=
n configuration.
--

--- Patch [1]: [PATCH v4] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro (=
sheng) ---
commit 409a566ed91cfcb1ea5b448084073b5d36eb09ec
Author: map220v <map220v300@gmail.com>

arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro (sheng)
   =20
Add device tree for Xiaomi Pad 6S Pro (sheng) based on SM8550.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts b/arch/arm6=
4/boot/dts/qcom/sm8550-xiaomi-sheng.dts
> new file mode 100644
> index 0000000000000..a5aa49a01dde9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts

[ ... ]

> +&i2c5 {
> +	clock-frequency =3D <1000000>;
> +	status =3D "okay";
> +
> +	cs35l43_trl: cs35l43@40 {
> +		compatible =3D "cirrus,cs35l43";
> +		reg =3D <0x40>;
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <98 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios =3D <&tlmm 90 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

[Severity: High]
The commit message mentions adding GPIO_OPEN_DRAIN to avoid -EBUSY on
shared reset-gpios. Does this actually prevent the probe failures?

When devm_gpiod_get_optional() is called by the codec driver without
GPIOD_FLAGS_BIT_NONEXCLUSIVE in the driver's C code, gpiolib enforces=20
exclusive access.

Since GPIO_OPEN_DRAIN only configures the hardware output behavior, it looks
like the first cs35l43 codec instance will succeed but the subsequent
instances will still fail to probe with -EBUSY.

[ ... ]

> +	i2s1_default: i2s1-default-state {
> +		sck-pins {
> +			pins =3D "gpio121";
> +			function =3D "i2s1_sck";
> +			drive-strength =3D <8>;
> +			bias-disable;
> +			output-high;
> +		};

[Severity: Medium]
The commit message states "Remove output-low/output-high from TLMM pinctrl",
but output-high is still present in this i2s1_default pin configuration. Did
this get missed during the cleanup?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721145452.1996=
-1-code_0002@163.com?part=3D1
