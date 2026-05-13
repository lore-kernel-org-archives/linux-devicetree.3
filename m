Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA30D35E956
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 01:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778635360; cv=none; b=jd4PzspAdxKJ2uZWgeKXaDqy76VpeNZLhI3qKBtTj4hcoDTLVBk9oVKpRZJJ8fDzrr3PQ99J8Tub5rp3ekkuaYLGH4UOBFpQI94KsTAUxONmsgQTPD99hGzvgQ2HjD+Bzanl5RJwZeGWGMHxUUqjbLaYueTX9H5+CH7+zTJvSu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778635360; c=relaxed/simple;
	bh=Jf/VuIEvGavQDLGR9eTS2Bt/SmIU5irL2YCNX5BJWEg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a+EL0IwRY7NKq4CXxbrS3CIiOzaEUGiQfPHdJSU1U9L1htPOSaZFpcKu9feK3ZP6ZaFc+qXwcQIkMv+m8WrV2kby/ZbPUtWt4WtGwnneUixmvW2mdlq88bYvInXf7bSgfh7eytkDzJwVLvgOGiyd4KKcjmqUqI2m13qIBoHR1H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALlt1Nmc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALlt1Nmc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB2AC2BCB0;
	Wed, 13 May 2026 01:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778635360;
	bh=Jf/VuIEvGavQDLGR9eTS2Bt/SmIU5irL2YCNX5BJWEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ALlt1Nmceq3X7VXWtjsMzpHEA5wsr2SpSrCmLZ75uqflGP1+oV8lB5k9cmtkM8vkO
	 SAZ55F3wySBtT4+/wfeiudPZPOi3M+4AxyPyLpqslwW+9C9ZZb6rqG8GvyPr0ZJBk8
	 mV5R8WMRYUWW85KFhTkX+DE6PEkWo5UDxlJiLgToeV+0FJ4OMHPbbm2/3a3s4iAJNd
	 wEHs5Bl5rBMdzai4aSK++mQ6zBzz0U0frVVTbryZYS7YmoyKpfuD2Nk/SwDlCzlsxk
	 RrZxj6EHGWeeZfg8+Zkxfis9DkXdW+Cq6+TE7/Ywj6FDV9FVkHQy8EzkaH/ANScb0i
	 eLl4Dh/QA1YxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 5/9] arm64: dts: agilex5: add SOCDK eMMC daughter
 board support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Kathpalia" <tanmay.kathpalia@altera.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260511202132.5597-6-tanmay.kathpalia@altera.com>
References: <20260511202132.5597-6-tanmay.kathpalia@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 01:22:39 +0000
Message-Id: <20260513012239.8FB2AC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `no-1-8-v` property in the `&emmc` node explicitly disables th=
e 1.8V HS200 and HS400 modes, contradicting the commit intent.
- [Medium] A board-specific fixed regulator (`emmc_io_1v8_reg`) is improper=
ly defined in the shared SoC-level `.dtsi` file and placed under a memory-m=
apped bus.
--

commit 832d2f01748902348b5ee8ddc2a87d8dfab30896
Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>

arm64: dts: agilex5: add SOCDK eMMC daughter board support

This commit adds device tree support for the Agilex5 SOCDK eMMC daughter
board. It introduces the new board dts file and adds a fixed 1.8V regulator
for the eMMC I/O voltage to the common SoC dtsi.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/=
boot/dts/intel/socfpga_agilex5.dtsi
> index 7e080f13166f2..feb4ccb317a71 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
[ ... ]
> @@ -317,6 +317,14 @@ sd_io_1v8_reg: regulator-1p8v {
>  					<3300000 0x0>;
>  		};
> =20
> +		emmc_io_1v8_reg: regulator-fixed-1p8v {
> +			compatible =3D "regulator-fixed";
> +			regulator-name =3D "emmc-io-power";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +			regulator-always-on;
> +		};
> +

Will this cause every Agilex 5 board to inadvertently instantiate and enable
this regulator, even if they do not have the eMMC daughter card attached?
Since this appears to be a board-specific regulator, would it be better
placed at the root level of the board-specific socfpga_agilex5_socdk_emmc.d=
ts
file?

Additionally, does placing this node inside a memory-mapped bus without a r=
eg
property trigger device tree compiler warnings?

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dts b/a=
rch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dts
> new file mode 100644
> index 0000000000000..87bde9fa69c6c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dts
[ ... ]
> +&emmc {
> +	status =3D "okay";
> +
> +	no-sd;
> +	no-sdio;
> +	no-1-8-v;

The commit message states the eMMC controller is configured for HS200 and
HS400 modes at 1.8V. Does the no-1-8-v property prevent these high-speed
modes from functioning?

In the SDHCI core, parsing no-1-8-v sets the SDHCI_QUIRK2_NO_1_8_V flag,
which strips out the MMC_CAP2_HSX00_1_8V and MMC_CAP2_HS400_ES capabilities
during host setup. Since the eMMC IO is explicitly supplied by a 1.8V
regulator, shouldn't this property be removed to allow HS200 and HS400
negotiation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511202132.5597=
-1-tanmay.kathpalia@altera.com?part=3D5
