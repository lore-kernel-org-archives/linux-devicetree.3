Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48CA316197
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415758; cv=none; b=iS6vdQbxd4JD76867mxrGNrrPQuDGwdY2GaoLAxSFdp/0Joenv3HEoJxcteockB8QB/JKHFeVdzFAVIlx12iZGTNsnNGcwH7uRRktBmCpY9ucuZZjmdsIh4vsn2R0kPPnNdgEjFldHj0hMqlAzjUT1/dALFGQOpSYh9J2P82QDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415758; c=relaxed/simple;
	bh=e0cxOHSu8N0s1W0igZJsw5gX4zsufcmu377hiFCrtMc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=irXWECpjCo5gjMT3F8Q+60g/itOEtr4iq7fHwU/c5CIP20jeOz3B9Wfg9P2yN1KpO9yDB/rSmASR2iNS5lH442Sw6N0QZ+fN99YYZnBLDrqPqr4VRWs0tQGW/+9HfV97h7EWEWDBwvGy+6qK0Ti0hZ84vnvim+WsdbElHoeJie8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZl4oIuk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZl4oIuk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8461F00A3A;
	Tue,  7 Jul 2026 09:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783415757;
	bh=wa1cCOZLEZuO+c+UwDvgs+pkd9cE3kpzf4BUB9RCb2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TZl4oIukPySRG4HeG5EJXvAFhPOXNY0z97VSe6A3l0H7iDvv5SeLOnIbD7/jhzBjD
	 Qy8QHq8GjngR/2mg+M+FWCxAxn+UiOGNNzZ7sNVUBSLex6cibnfHvw98mYrmYa3UU1
	 bA3WoxtS0G6CuuatgVNuSgswnBRgXGbInK16RTHa+8VlsA/mRJfasSBiZPMoaQmYa3
	 IOCwJl6TehZpl8YV8bk0EmK8xFHxH+YmjZSR5om/kB++L5YTCOdrxeYZ10Q8l2k7Gs
	 Okc6t+wxoVTdEv7LPz3sI38Sk9YQNr058EtqX/dXtcpUC2RqxZecedqvus75cCSv0g
	 12rI7EZHMcZvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] ARM: dts: rockchip: Add RV1126 I2C5
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yanan He" <grumpycat921013@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260706-rv1126-alientek-dlrv1126-v2-4-ff3176ca362b@gmail.com>
References: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
 <20260706-rv1126-alientek-dlrv1126-v2-4-ff3176ca362b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 09:15:56 +0000
Message-Id: <20260707091557.2B8461F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Adding I2C5 triggers an out-of-bounds bit shift and register field=
 overflow in the `i2c-rk3x.c` driver, causing invalid GRF writes and potent=
ial memory/register corruption.
--

commit c9c38fbbccd8ad672b3147ed331a45ba6a025c0c
Author: Yanan He <grumpycat921013@gmail.com>

ARM: dts: rockchip: Add RV1126 I2C5

This commit adds the device tree node for the I2C5 controller on the
Rockchip RV1126 SoC, including its pinctrl definitions and aliases.
The controller can be used for external peripherals.

> diff --git a/arch/arm/boot/dts/rockchip/rv1126.dtsi b/arch/arm/boot/dts/r=
ockchip/rv1126.dtsi
> index d6e8b63daa420..d0cdc5f742120 100644
> --- a/arch/arm/boot/dts/rockchip/rv1126.dtsi
> +++ b/arch/arm/boot/dts/rockchip/rv1126.dtsi
> @@ -23,6 +23,7 @@ aliases {
>  		i2c0 =3D &i2c0;
>  		i2c2 =3D &i2c2;
>  		i2c3 =3D &i2c3;
> +		i2c5 =3D &i2c5;

[Severity: High]
This is a pre-existing issue, but adding this I2C5 alias causes a regression
by exposing an out-of-bounds bit shift in the i2c-rk3x.c driver during boot.

When the system boots and probes the i2c5 device, the new i2c5 alias
forces bus_nr to 5. This causes the driver to calculate an invalid GRF
value in drivers/i2c/busses/i2c-rk3x.c:rk3x_i2c_probe():

    value =3D BIT(27 + bus_nr) | BIT(11 + bus_nr);

For bus_nr =3D 5, this evaluates to BIT(32) | BIT(16). Since the RV1126
is a 32-bit ARM Cortex-A7 platform, BIT(32) results in undefined behavior.

Furthermore, BIT(16) acts as the write mask for bit 0 of the 32-bit PMUGRF
register, which means this will spuriously overwrite bit 0 instead of
setting the correct configuration for I2C5, potentially corrupting an
unrelated SoC hardware state.

Should the i2c-rk3x.c driver be fixed to handle bus_nr =3D 5 before exposing
this I2C5 node in the device tree?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-rv1126-ali=
entek-dlrv1126-v2-0-ff3176ca362b@gmail.com?part=3D4
