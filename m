Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F54F35DA40
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 18:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784831556; cv=none; b=I7uIXPUhRV6oWNWZl1Ci9vUDRRpolsppMHC/G8F2WLvdQ5Kx358tV8iDDJoOMbpUay8DOoGk6T2XhjMNMj6TZn9xSbnVR9t8A7XAxELxnxvd0aTAH0aX+mE3ABSdbMRYz7sSfdzajQp6dprxzDt+H1i3+/3pXuB50DLUBDbO8Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784831556; c=relaxed/simple;
	bh=MrM4X1RABfNNo3LVV0ZPD+PNc52giMXj5WmjzKHeTSw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V6AV5iemETexyhEb3rtLH5yFkqwgEkVipK3qiwrqw1vRSK/bKQRnReNkHeDI1F17ftQKbQBrMSMj52zHuwoSV/b58yzJ25NJgLLDEy+Ld5lJwS7WryJe3+IUeoR64lEUh0jZ19JaFaHnIqBlrGFyFeZyyhq9OmECLd65NYNw7aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=irP6okhS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irP6okhS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479EB1F00A3A;
	Thu, 23 Jul 2026 18:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784831550;
	bh=SBZXGy1BRO5jfLDnFLZft7RbrNhL2w3e1jcJQ07e798=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=irP6okhS04gq+TaYAN5ennPvi/x0wBTKauYSA0RywALuUoxg8oeLL/ztwJKxojGHV
	 y/s3og4kqVYkZyqmM0JUMuluojuTVvP90VwC2hD3ZVVz5H4/mViRLUZd4DgzsG712E
	 u36a0G9ShdwG0HkwLi3WUmFbR7O455HmPQ/hllyKB4Hc8pEPy8VswL4/08zk9QcGIW
	 VpGwsQHgzKilxv/kXssfYIqplxl07VotdXmNfEkVHTZQMxFDEjoLG92DKQKCXidB2T
	 fNOlrJN1uC1VLH+asmNAC+wtAmN0ccKSac05vKt4RjgjGncpxtvvccujuKaVw7ZeIm
	 7R9nUnOVU+2zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "William Bright" <william.bright@imd-tec.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723-imdt-qcs8550-sbc-rfc-v5-4-2fb988854623@imd-tec.com>
References: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
 <20260723-imdt-qcs8550-sbc-rfc-v5-4-2fb988854623@imd-tec.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 18:32:29 +0000
Message-Id: <20260723183230.479EB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The SDHC controller uses the 'default' pinctrl state for the 'sl=
eep' state, preventing optimal power savings during suspend.
--

--- Patch [4]: [PATCH v5 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC ---
commit bac8e4df652ca68e96ed20f6144b630482c91f9a
Author: William Bright <william.bright@imd-tec.com>

arm64: dts: qcom: Add IMDT QCS8550 SBC

This commit adds the Device Tree for the IMDT QCS8550 SBC board built around
the Qualcomm QCS8550 SoC. It enables on-board regulators, uSD, UART, UFS,
PCIe0, USB, and ADSP/CDSP features.

> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts b/arch/arm64/b=
oot/dts/qcom/qcs8550-imdt-sbc.dts
> new file mode 100644
> index 0000000000000..fa8794868cf8e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts

[ ... ]

> +&sdhc_2 {
> +	cd-gpios =3D <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 =3D <&sdc2_default>, <&sd_card_detect_default>;
> +	pinctrl-1 =3D <&sdc2_default>, <&sd_card_detect_default>;
> +	pinctrl-names =3D "default", "sleep";

[Severity: Medium]
Is it intended to reuse the active default pinctrl configuration for the sl=
eep
state here?

Using &sdc2_default for pinctrl-1 keeps the pin drive strengths at 16mA
during system suspend. Could this cause increased current leakage and
suboptimal power savings compared to switching to a lower-power sleep state?

> +
> +	vqmmc-supply =3D <&sdhci_2_vqmmc>;
> +
> +	bus-width =3D <4>;
> +	no-sdio;
> +	no-mmc;
> +
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-imdt-qcs85=
50-sbc-rfc-v5-0-2fb988854623@imd-tec.com?part=3D4
