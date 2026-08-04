Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248C61C2324
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846615; cv=none; b=BY0vPcm6XjeUuLmmuyKVNk1+NR8CGViheAPRdf8ACC1cX92M50B2DCvZFmjscy6obbc17qu4MHis9BjE4Re9gCBBr1ie+pgTPgDGNveOR8TPBueVUDw2wkIzwPRnT7w8toWVRdVtbSB9C7JdmQdk6JQg8FTmf9ssgemxefSwJ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846615; c=relaxed/simple;
	bh=yO9KmHv7eYNvKRyxqmNP3Fll7cdVGT3PQAQySc5lxVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RvE0oQ5Rt98tXpCEcKJGAlaGCkv2XAzTCbfTSJWJ/LB8tz+VZ2/ob8fqzGeEbwxQSqNj7NJHFAXzDWEQDXztwBlUKbUA/D+kUiN6ufzLz2n7tHzlmi3/N8aRnePOeBdVd7PjVpSJaqwFZRZr0oPXEQ8ndwfOuvSQGZOlVWMUQ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3InYoRB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3InYoRB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3CFB1F00A3A;
	Tue,  4 Aug 2026 12:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785846613;
	bh=YZyYMwAilSfRsoeRrSre9NzMRcJElUCmK32uucO4mRw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l3InYoRBXv4DxNdDigLXpXTYr6gNIop20ge2jfuXy7O2nhNtgi5gQ6B3lngjk2xvW
	 NH46QT0PpXUnDuBkLtUI4iiySqIfMb8+lBucmxmzDtTnut6K+mbnn4vUqJmLySuMQv
	 lUnTNInT6lyBmIiB7o912K3lsopGkmDK8Jm2jE+HTHcC5QQGXAY/tlb6WEWt8rMeDB
	 Z6LDmDRXHCfMinD+c2fFVPHb+39nhN8WjzqOqRV+oA3wdMzJLwScOnT/GD2ASVp4/k
	 BL9ZUqbF8vnuo5ZEEEpjJLZcc98bvTQBJ82VlHAFIaho3qjItW9cdrWss8BZx8C9Ip
	 V8PkyiM+v3OMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 2/2] arm64: dts: qcom: Enable SD card for Shikra EVK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Monish Chunara" <monish.chunara@oss.qualcomm.com>
Cc: vkoul@kernel.org, robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org
In-Reply-To: <20260804122054.3462145-3-monish.chunara@oss.qualcomm.com>
References: <20260804122054.3462145-1-monish.chunara@oss.qualcomm.com>
 <20260804122054.3462145-3-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 12:30:11 +0000
Message-Id: <20260804123012.D3CFB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Redundant and incorrectly ordered `#include <dt-bindings/gpio/gpio.=
h>` in board .dts files.
--

--- Patch [2]: [PATCH V4 2/2] arm64: dts: qcom: Enable SD card for Shikra E=
VK ---
commit 7a9a37a5e1e99fa00a175a6837969ca251cbb0d3
Author: Monish Chunara <monish.chunara@oss.qualcomm.com>

arm64: dts: qcom: Enable SD card for Shikra EVK

Enable SD card for Shikra CQS, CQM and IQS EVK variants. Configure the
vmmc/vqmmc regulators and gpio-based card detection for each board
variant.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-cqm-evk.dts
> index 0a52ab9b7a4c3..8e4656a51371f 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -7,6 +7,7 @@
> =20
>  #include "shikra-cqm-som.dtsi"
>  #include "shikra-evk.dtsi"
> +#include <dt-bindings/gpio/gpio.h>

[Severity: Low]
Would it be better to move this include directive into shikra-evk.dtsi?

Since shikra-evk.dtsi is the file that actually uses GPIO_ACTIVE_LOW, placi=
ng
the include here after shikra-evk.dtsi is processed means it cannot satisfy
the macro dependency directly. The build only succeeds because the preceding
SOM include already happens to include gpio.h.

[ ... ]
> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/d=
ts/qcom/shikra-evk.dtsi
> index 6eb4184f76422..177a599cd2c24 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> @@ -9,6 +9,17 @@ &qupv3_0 {
>  	status =3D "okay";
>  };
> =20
> +&sdhc_2 {
> +	pinctrl-0 =3D <&sdc2_default &sdc2_card_det_n>;
> +	pinctrl-1 =3D <&sdc2_sleep &sdc2_card_det_n>;
> +	pinctrl-names =3D "default", "sleep";
> +
> +	no-sdio;
> +	no-mmc;
> +
> +	cd-gpios =3D <&tlmm 89 GPIO_ACTIVE_LOW>;

[Severity: Low]
Should shikra-evk.dtsi include <dt-bindings/gpio/gpio.h> directly to
provide the definition for GPIO_ACTIVE_LOW used here?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804122054.3462=
145-1-monish.chunara@oss.qualcomm.com?part=3D2
