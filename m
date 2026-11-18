Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023828;
	b=Z++ww2Mw9nO9TT2I/x2wuvOfdTTK/xMSU1WRSH0p2l2zSABuK8wglnP3eQ1zdFuKTTKq
	 M/TC6aX2l+rpLKyRf2A92ZK2C6h2nQkozPrtMMjGS+jQ1F1HPRLKdt+wflztwM1KsZtus
	 A++AXSiMCFc14Ln1HpSNw6y5nhyy/5VLHW7rFmq/vwabEvVh5RZrmJua/uTd+TSemy5Rx
	 AR+Rc1nJaASkOVG9wcYMYfrlQdSw98dWuzeUOHODOhoTFYdkbyVl0TrY5+xLpUhQNCQM8
	 OMxmttudeQ02rSu2UHysxiTzttUbpmDYTw78h5on+p9zg0EC2w5Uq5bICkbMLXHufeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023828;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=COurVYN7VwQB9vUgl9HBc7zsOV81YbLQ0D1bLT2S93Y=;
	b=kRARhk9e70mFOUBKwYLEjbMH+nN//8kvauknFqOPyvIMEf9aO2KTDydOMR9EjJaYGMvh
	 gR6Cpcr3wivV/Cx6ra0YTUKgCCF1aavxenYio6jWGthXuAOui8mOXnvDLYRRlp93SwnKS
	 rMhRbtI78VdAHb/2Q0BiPC9piV79ZzSPCU9fBIUDqPazgr9P0DoU++KHb6FGQ42iI7j51
	 A4UZylbQMFr6Tr45npJU9Mhp+DXxvSD/l4WkGD/VDAEeDEaoMW4Pg3N/qW4z3KieljCcF
	 U/1HNWferlfF0vzU9WNrLGVWQiol58YV6194irtpn7J4m7TGYLkl7qtjTzjvAGBRKog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="k/z4Ggrk";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4850E606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k/z4Ggrk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5E01F000C7;
	Wed, 18 Nov 2026 17:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795023828;
	bh=COurVYN7VwQB9vUgl9HBc7zsOV81YbLQ0D1bLT2S93Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k/z4Ggrkh9xBOcaBNw5v1iIWKhSFpADTVyWSJjnpMZoWlKlkxujzXStiIU8IzMW+v
	 yopXXn3TbjwgBdCNopWsUsSOu5nG0m7Wbl3SbHwcoOugm81OK50Yzh8orjOydBactR
	 vQZ4lAXvV27NRlMQW0mYJYU7pEvd/4ZlQKelHZA8ttv++e8P6LpYv2oiRf41yditkU
	 5/ql8UJDZuntbbOaIunK9dRrFv2K3tPlu/Z14rdJ07z1uFi/c7zx8HKJwa8jLV7X2C
	 9ZbDVYxqGEP0uehgKh6COnztX2WLdksXuwqRRX67gd/fr+4kSCQ+2WfE3J2W7+xb+D
	 SwyXbJym6dIbQ==
Message-ID: <sashiko-outbox-221681@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/12] regulator: qcom_usb_vbus: Add support for
 pmi8998
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-pmi8998-vbus-v2-2-3c77a72b280a@ixit.cz>
References: <20261118-pmi8998-vbus-v2-0-3c77a72b280a@ixit.cz>
 <20261118-pmi8998-vbus-v2-2-3c77a72b280a@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 17:43:47 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] regulator: qcom_usb_vbus: pmi8998_data duplicates pm8150b_data
  verbatim
--

commit 236079d01ccf3acd0da063e72d90d4189d163862
Author: David Heidelberg <david@ixit.cz>

regulator: qcom_usb_vbus: Add support for pmi8998

This commit adds compatible string and register configuration data for
the PMI8998 USB VBUS regulator.

> diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regula=
tor/qcom_usb_vbus-regulator.c
> index 88f5a6ba79e6e..0617106a82cda 100644
> --- a/drivers/regulator/qcom_usb_vbus-regulator.c
> +++ b/drivers/regulator/qcom_usb_vbus-regulator.c
> @@ -68,6 +68,17 @@ static const struct qcom_usb_vbus_reg_data pm8150b_dat=
a =3D {
>  	.ops =3D &qcom_usb_vbus_reg_ops,
>  };
> =20
> +static const struct qcom_usb_vbus_reg_data pmi8998_data =3D {
> +	.cmd_otg =3D CMD_OTG,
> +	.otg_cfg =3D OTG_CFG,
> +	.otg_en_src_cfg =3D OTG_EN_SRC_CFG,
> +	.csel_reg =3D OTG_CURRENT_LIMIT_CFG,
> +	.csel_mask =3D OTG_CURRENT_LIMIT_MASK,
> +	.curr_table =3D curr_table,
> +	.n_current_limits =3D ARRAY_SIZE(curr_table),
> +	.ops =3D &qcom_usb_vbus_reg_ops,
> +};
> +
>  static const struct regulator_ops qcom_usb_vbus_pm4125_reg_ops =3D {
>  	.enable =3D regulator_enable_regmap,
>  	.disable =3D regulator_disable_regmap,
> @@ -166,6 +177,7 @@ static int qcom_usb_vbus_regulator_probe(struct platf=
orm_device *pdev)
>  static const struct of_device_id qcom_usb_vbus_regulator_match[] =3D {
>  	{ .compatible =3D "qcom,pm8150b-vbus-reg", .data =3D &pm8150b_data },
>  	{ .compatible =3D "qcom,pm4125-vbus-reg",  .data =3D &pm4125_data },
> +	{ .compatible =3D "qcom,pmi8998-vbus-reg", .data =3D &pmi8998_data },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, qcom_usb_vbus_regulator_match);

[Severity: Low]
Since pmi8998_data is identical to pm8150b_data defined right above it,
could the qcom,pmi8998-vbus-reg entry in qcom_usb_vbus_regulator_match
point directly to &pm8150b_data instead of duplicating the descriptor?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-pmi8998-vb=
us-v2-0-3c77a72b280a@ixit.cz?part=3D2
