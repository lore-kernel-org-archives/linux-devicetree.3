Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09946360EE4
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 09:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489576; cv=none; b=cCgnENljUWmKaOlEuZnFH8MWzF/6Y7/fNGofFzm6FIiv+Uxolx85UmjhQxVtKNOHw9tYWZMQVZ+tZ4kfG3TbDuZpoDjmsM9IiCppVea51Jue9UQVN6w5MfQ0eHTAkaVpMZFYl6euoghJ5dkmbSGIopfrx675fsnUI4AQhhm4JUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489576; c=relaxed/simple;
	bh=KOJOwWMtbdpAQvYQxrdr1lTEZO//myUeqvr1kzuO2zs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TfJagS3zz7NpaBNAHtNJjvMRpTwOY/fgfstemCdwJJ5pnyM5JEAjmub3WMybwQ+2GhApP83UwWDqQBGtefQmgDPKWSAa68oQA+aD2E0DWjYvVQ6ml/SptlBVczXeaXjQ2qg/FXxSjUjUW0WTYCdob+Xzbp7JUWcI3KHvUTxdhcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmj5KKFd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmj5KKFd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061EA1F000E9;
	Fri, 31 Jul 2026 09:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489574;
	bh=s0LgA4ZggyyRiIGyTRqtWpzT50vbTO1Z5/UaIUJdhXo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gmj5KKFdniNE1iPe7RsV9DSU50VD7QG7UiVw+44io9awS1cehGRrGHEtd1VMZFRSF
	 Ks4b1OufMPMtaaUtjGGjlkIvY0th7jk1in+sl0wKv/oq34N8S53+lG8tHVeb3Yfl1f
	 J3Wlh3TDxOYFNLHGTqXZzkCPe6bws0onzOFeQxxW401ROGD9arH07LW8FArQM1v2IN
	 5VC9F0/Mez/ipOeCHQ+pzw01uNAK/0f03dt+itN/PVD4rGiMFWyycZMGvqDRs9CsxN
	 cqxBgItmz7kkBt2TXFyCBqJ7bZohcaEPiAVg/LuF5L8kP+xrxonJ5LTZi9LpM2OVN+
	 jHEHuMmWliSHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] spi: amlogic: spisg: Add support for A9
 controller features
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260731-a9-spisg-v3-4-a15da3f70029@amlogic.com>
References: <20260731-a9-spisg-v3-0-a15da3f70029@amlogic.com>
 <20260731-a9-spisg-v3-4-a15da3f70029@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 09:19:33 +0000
Message-Id: <20260731091934.061EA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Ignored transfer-specific word_delay causes hardware gap to be mis=
configured by reading msg->spi->word_delay instead of xfer->word_delay.
--

--- Patch [4]: [PATCH v3 4/4] spi: amlogic: spisg: Add support for A9 contr=
oller features ---
commit ecee00fa5a6dbd8a553a6c4d9ef9bf2089d1bdd9
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

spi: amlogic: spisg: Add support for A9 controller features

This commit extends the Amlogic A9 SPISG controller with additional
configuration options. It adds support for extended CS setup/hold
timing, MOSI idle output configuration, and configurable word delays.

> diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-sp=
isg.c
> index 2d66f00dccd45..729da11bc539e 100644
> --- a/drivers/spi/spi-amlogic-spisg.c
> +++ b/drivers/spi/spi-amlogic-spisg.c

[ ... ]

> @@ -524,10 +548,20 @@ static int aml_spisg_transfer_one_message(struct sp=
i_controller *ctlr,
>  			goto end;
>  		}
> =20
> -		/* calculate cs-setup delay with the first xfer speed */
> -		if (list_is_first(&xfer->transfer_list, &msg->transfers))
> -			desc->cfg_bus |=3D FIELD_PREP(CFG_CS_SETUP,
> -				spi_delay_to_sclk(xfer->effective_speed_hz, &msg->spi->cs_setup));
> +		/* calculate cs-setup delay with the first xfer speed  and word dealy*/
> +		if (list_is_first(&xfer->transfer_list, &msg->transfers)) {
> +			val =3D spi_delay_to_sclk(xfer->effective_speed_hz, &msg->spi->cs_set=
up);
> +			if (data && data->cs_setup_extend_ctrl) {
> +				val =3D min_t(u32, 0xFF, val);
> +				desc->cfg_bus |=3D FIELD_PREP(CFG_CS_SETUP, val & 0xF);
> +				FIELD_MODIFY(CFG_CS_SETUP_EXTEND, &spisg->cfg_spi, val >> 4);
> +			} else {
> +				val =3D min_t(u32, 0xF, val);
> +				desc->cfg_bus |=3D FIELD_PREP(CFG_CS_SETUP, val);
> +			}
> +
> +			delay =3D spi_delay_to_sclk(xfer->effective_speed_hz, &msg->spi->word=
_delay);

[Severity: High]
Should this be reading xfer->word_delay instead of msg->spi->word_delay?

When an SPI client driver submits a transfer with a specific word_delay set,
the SPI core evaluates and populates xfer->word_delay. By reading the
device-level default delay from msg->spi->word_delay here in
aml_spisg_transfer_one_message(), it appears any transfer-specific delay
overrides requested by the client will be ignored.

> +		}
> =20
>  		/* calculate cs-hold delay with the last xfer speed */
>  		if (list_is_last(&xfer->transfer_list, &msg->transfers)) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-a9-spisg-v=
3-0-a15da3f70029@amlogic.com?part=3D4
