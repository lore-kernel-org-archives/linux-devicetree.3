Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B116A245020
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 22:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785191193; cv=none; b=m4zY9yYocI3m4ptA9YqtqoBsxq7xX9PDU4OSRYNrAC+qh9gWYSiNRm65g8zKaB6syDpSWoqZX8BzVyx/za0IdcAYyDxdDD2q7XkakyNoE6UPJ2UuQB7ljnn5EzWswXu/mkUb9fBXILPKoLay3i463uhWLlKQRiAjNzO0Nd1dIQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785191193; c=relaxed/simple;
	bh=Aeq/QejWSP0b0XJBVn2q1Aov1tSV3yNnPStPMQ2BeYc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ag8rQ8GchOybFAkLs/d0TPXDYdBYhKB144khXYNjmfqKoz9oFLYTK8uHLjy/ewpFsZfws1tdD7qJvpBibFLBsUkEl6anBh+Q2ZH7FUfnn9WOaQPYCQzMVxGN/5peYT9a++aHniGsgZ1epq2qcAA8IZP7XLRRBchucHatC3eYdF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYslBs5J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYslBs5J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010DD1F00A3A;
	Mon, 27 Jul 2026 22:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785191192;
	bh=p1PXSLPuGs8IaERTsalXBWewQR4+xcnzVTeQI4sX4/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gYslBs5JGu5c5krEFjeoDUHpRSOmLFEFnPWxfdKz//CDJGdiozbWirRVhrEe2IKW/
	 jYgrljV4iuP8CakT+T2RjU4OTL6cAuTmlE3teo0Zre5DO/1RQ78JOt2OMdn7kYo3PL
	 utK238KROIfA22E51Dwx+s0VSbJvwEt+AWTS5cz259m4IAKnp2avLopBolNRoELqOR
	 KIkunqJ06V4IUtcUr3eNB6Zg3S4acxbxkV6sKXxvUWRxM1KN2oQsSwBqiRwGzSRrbO
	 kiJd0QAowroEI0n94PVjKb3YWBNzTdv1hHTnU4yoXkJQr+0iykzrQUugvzVWGSfYCU
	 AxhPUiUrO5+Gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: milos-fairphone-fp6: Add NFC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260726222405.153008-6-jorijnvdgraaf@catcrafts.net>
References: <20260726222405.153008-1-jorijnvdgraaf@catcrafts.net>
 <20260726222405.153008-6-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 22:26:31 +0000
Message-Id: <20260727222632.010DD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The NFC controller will remain unpowered because the `s3fwrn5` dri=
ver lacks regulator support, so the `pvdd-supply` specified in the device t=
ree will never be enabled.
--

--- Patch [5]: [PATCH v3 5/5] arm64: dts: qcom: milos-fairphone-fp6: Add NF=
C ---
commit a37bde53492f31e7077b36b4e030e872e07827b0
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

arm64: dts: qcom: milos-fairphone-fp6: Add NFC

This commit adds the Samsung S3NRN4V NCI NFC controller on i2c1 to the
device tree. It configures the necessary clocks, interrupts, and assigns
the PVDD supply to the PM7550 LDO20 regulator.

> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm6=
4/boot/dts/qcom/milos-fairphone-fp6.dts
> index ebdca0e2d2f3a..a1b86e4092fe2 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -601,9 +601,29 @@ &gcc {
[ ... ]
> +	nfc@27 {
> +		compatible =3D "samsung,s3nrn4v";
> +		reg =3D <0x27>;
> +
> +		clk-req-gpios =3D <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +		clocks =3D <&rpmhcc RPMH_RF_CLK2>;
> +		en-gpios =3D <&tlmm 56 GPIO_ACTIVE_HIGH>;
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <31 IRQ_TYPE_EDGE_RISING>;
> +		pinctrl-0 =3D <&nfc_clk_req_default>, <&nfc_irq_default>,
> +			    <&nfc_pd_default>;
> +		pinctrl-names =3D "default";
> +		pvdd-supply =3D <&vreg_l20b>;

[Severity: High]
Will the NFC controller remain unpowered here?

Looking at the upstream driver in drivers/nfc/s3fwrn5/i2c.c in
s3fwrn5_i2c_probe(), it parses and initializes GPIOs and clocks:

    phy->common.gpio_en =3D devm_gpiod_get(&client->dev, "en", GPIOD_OUT_HI=
GH);

However, it appears to omit requesting or enabling any regulators like
pvdd-supply. Since vreg_l20b is not marked as always-on, won't the regulator
core leave it disabled, preventing the chip from functioning?

> +		wake-gpios =3D <&tlmm 7 GPIO_ACTIVE_HIGH>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726222405.1530=
08-1-jorijnvdgraaf@catcrafts.net?part=3D5
