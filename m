Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520723FD96B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156627; cv=none; b=dn5L6mYbeAGlO8uqzbc7Gdwu1WoOcuBhY/FEyF4lnZzHmuBWtr+0YdZrj/xxXlNl4Nr5rqVWSLqMKnSLqA6n5SyGz74CEXJy3mQETrwKXIVTGx319y/d6wfc+yZrDLcOrx+UToouBeUCzcgDAlubjzx0o8BD9zKw+5lNr2Z89SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156627; c=relaxed/simple;
	bh=RDO1FCCwmlVLytVcq7YsqWXJsVAyZcs2vM7oLfLPUIc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kQq+LTTVo8BXNEJNeS+ypSKS7RlfXkL5ziobxWJTGv8u/uSkSvxbdt/RAHnvV9INT24gwBLweLWB4zrHvDnmbSTpFGjvQEqbxzeY96TcgiFbZ6kgK35Ycf/AE5on6AiK9yay7CtwZQnNBFA+P0W7i88pyekSzVBg4bgccXyrilU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQ7iwKhr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQ7iwKhr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727461F000E9;
	Mon, 27 Jul 2026 12:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785156625;
	bh=PwceWUodWzTm9MOBrhslIJ/nE1uAtTlcdViN45wfAk4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BQ7iwKhrFz5a2C8oURBvBvRTHwYgkTSJch2S5jOq6mTFCwUAoDD9zpJLTfp1EnvoG
	 1PhX7PJe8uT7fvb6Nya4oZMZhydpfiNeT8ESYY+ALlmkQf8tpC3rCXUJUboY9Q3eel
	 uZx7T5OLdyK7OwUaHHV0H2Jatno9n2Z3jxkq4XX5iuVGxEmOPqVtIx6yCKkzi9qAOX
	 LY+b8Ljg48SH1u+YHINu4LaKV1ev9rYV6CLCQlvqUnjDlhDCWgCEik7ExZRjY6hyJI
	 SZU87B+AGwGurKGo2KlK1ntSBki/An7RC8LPdvXSu8seXoxgGp1rjWICpmHjhZ/TaH
	 nEjMepixrmxAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 14/16] ARM: dts: microchip: sama7d65: add cells for
 temperature calibration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260727122633.117435-15-varshini.rajendran@microchip.com>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
 <20260727122633.117435-15-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 12:50:24 +0000
Message-Id: <20260727125025.727461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The newly introduced DEFINE_FREE macro for nvmem_cell_put does not=
 check for error pointers, causing a kernel panic when nvmem_cell_get fails.
- [Low] Adding `nvmem-cells` and `nvmem-cell-names` to the `microchip,sama7=
d65-adc` node without defining them in the corresponding YAML binding cause=
s a schema validation failure.
--

--- Patch [14]: [PATCH v4 14/16] ARM: dts: microchip: sama7d65: add cells f=
or temperature calibration ---
commit 696a7115c167bb7e7a6b827c0f8e5dd2a34541d5
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

ARM: dts: microchip: sama7d65: add cells for temperature calibration

Add nvmem-cells for temperature calibration data to the ADC node.
The calibration data is read from the OTPC.

> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dt=
s/microchip/sama7d65.dtsi
> index aac2e22d96cb3..a8b18ad0ef7f7 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -318,6 +318,8 @@ adc: adc@e1000000 {
>  			dmas =3D <&dma0 AT91_XDMAC_DT_PERID(0)>;
>  			dma-names =3D "rx";
>  			#io-channel-cells =3D <1>;
> +			nvmem-cells =3D <&temperature_calib>;
> +			nvmem-cell-names =3D "temperature_calib";

[Severity: Low]
Will this cause a device tree schema validation failure?

The atmel,sama5d2-adc.yaml binding schema restricts properties via
additionalProperties: false and does not define or reference these nvmem
properties.

[Severity: High]
Does the driver correctly handle a missing temperature_calib nvmem cell?

If this cell is missing, nvmem_cell_get() returns -ENOENT, which is returned
by at91_adc_temp_sensor_init() in drivers/iio/adc/at91-sama5d2_adc.c.

The __free(nvmem_cell_put) macro executes on the ERR_PTR:

drivers/iio/adc/at91-sama5d2_adc.c:
DEFINE_FREE(nvmem_cell_put, struct nvmem_cell *, if (_T) nvmem_cell_put(_T))

Because this macro only checks if (_T) and not if (!IS_ERR_OR_NULL(_T)), it
passes the error pointer to nvmem_cell_put(), which unconditionally
dereferences it (cell->entry->nvmem) and causes a kernel panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727122633.1174=
35-1-varshini.rajendran@microchip.com?part=3D14
