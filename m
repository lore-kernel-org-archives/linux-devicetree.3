Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16BB372B2B
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 10:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781865136; cv=none; b=aXhwX3J5d85JZ3B+J38iCRtZsITu86IS0inKieNRB2zW8DzOG8n9bUHNpxbV4AzKLI8+trfVvZLfah+tjr2v2oPGxUutGQuxGWdEjaZ+Qb1t7jLPV2UOviZo0Bh6ihKmC1g12mjKpiaVww0FetvDbZuQt7Oj9tmpp+LQkKXI8p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781865136; c=relaxed/simple;
	bh=d66S3c/ubA31aPZAw669bukf4TsrNsPeB1UZ05NPRx4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o89SPtkVRVXtbty2mrmMmsrv2gPuGuHoqBEqO5ag/KrrQXfynaOCT2fI4QuQGZGkV0ybqrKddf6h1xsRamdYio3Luao9xE/P7ST5/yHfCVzXgds0pepnD/aYdQuCd+68hJyipG7RK4B15uMraB5JkvtcqiObweqUrcFNaE0AqCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTsKlHtq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTsKlHtq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63331F000E9;
	Fri, 19 Jun 2026 10:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781865134;
	bh=dtiY2EiYjV+/LBXO2HBVTR6K42NNumUdJYZS4iqpFHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hTsKlHtqJMdj0RoX/D1hlWzrnhBg5pYkv+1LUbzHIHM0r5QZcLvR7W3mA7iqqOH1Y
	 Zo5JV/R80QR014pR3x1sazaWnPhPxit67md6JxHxK+s789REgNtGcNtbzbR8qphlyL
	 CB4zjI0ZCDhU7skCsUB9rNo9n2maiQevf8qfnv0eRt8NLKKBo+da/DMKle7yYpl0td
	 9tJR7OBnjojJX7jdrmBR0LHGdlovFlPNYwpxEu/dDWIl1S2cYCiQRk5W6GpynknxV4
	 g+8i+BZNNoPXv5KcURymk3DUtB1bRA2duM9/0I5u2Hg6EZ3hIMpAE0lg8/k7BUa1H8
	 lj+TZOC1Vnq8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm: dts: xilinx: Add support for MYIR MYS-7Z020-V2
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Yu" <f78fk@live.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <SY3PPF19552C607A65588339A2CED9E2AFDC7E22@SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM>
References: <20260619102214.223121-1-f78fk@live.com>
 <SY3PPF19552C607A65588339A2CED9E2AFDC7E22@SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 10:32:12 +0000
Message-Id: <20260619103214.A63331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing function multiplexing for SD card detect (CD) pin, causing=
 SD card detection to fail.
--

commit d502783eb06999075d769495567d3ef9a776e3f7
Author: Liu Yu <f78fk@live.com>

arm: dts: xilinx: Add support for MYIR MYS-7Z020-V2 board

Add device tree support for the MYIR MYS-7Z020-V2 board based on
the Xilinx Zynq-7000 XC7Z020 SoC.

Link: https://www.myirtech.com/list.asp?id=3D708

> diff --git a/arch/arm/boot/dts/xilinx/zynq-mys-7z020-v2.dts b/arch/arm/bo=
ot/dts/xilinx/zynq-mys-7z020-v2.dts
> new file mode 100644
> index 0000000000000..39bd864ca358d
> --- /dev/null
> +++ b/arch/arm/boot/dts/xilinx/zynq-mys-7z020-v2.dts

[ ... ]

> +&pinctrl0 {

[ ... ]

> +	pinctrl_sdhci0_default: sdhci0-default {
> +		mux {
> +			groups =3D "sdio0_2_grp";
> +			function =3D "sdio0";
> +		};
> +		conf {
> +			groups =3D "sdio0_2_grp";
> +			slew-rate =3D <0>;
> +			io-standard =3D <1>;
> +			bias-disable;
> +		};
> +		conf-cd {
> +			pins =3D "MIO46";
> +			bias-pull-up;
> +			slew-rate =3D <0>;
> +			io-standard =3D <1>;
> +		};

[Severity: High]
Does this pin configuration properly route the SD card detect signal to the
SDHCI controller?

The conf-cd block sets the electrical properties for MIO46, but it appears
to lack the required multiplexing configuration. In the Zynq pinctrl driver,
routing the SD card detect signal requires explicitly requesting the
sdio0_cd function.

Without defining a mux node (such as adding a mux-cd block with
groups =3D "gpio0_46_grp" and function =3D "sdio0_cd"), the Linux pinctrl
driver will not route the internal SDHCI controller's CD line to MIO46.
Unless the bootloader pre-configures this mux and the configuration
survives suspend and resume cycles, the SD controller will likely fail
to detect card insertion or removal.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619102214.2231=
21-1-f78fk@live.com?part=3D2
