Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213137;
	b=if//WzU0qd+GwrrNA3NG6N/a9uCmDAUfnhAEhWRnG1iUGRYE+sx5BaRisxsjbYn85nnG
	 P9FH5yqLOgstN9dHqt1+RKtzysIQ/yWbkwO/G09bDGouqrtj/UIC2pqnX5olZbSrG8Hu8
	 dL8Xgub/fhd7tW/6c87UvMUr4q16kU9SlJvwjrm+S8ARzHSu9/95etsDlRNJWiXekEgZ8
	 AlTaXTG/Hg+UWuUsGG4jph1ehrQOHq/wlvGfPA3NjLg5EnI76Y+wDHAoNWubYdAOMJiHd
	 Ur8rZD0yTYeggmaJTKU2GR3InVLpT16RV4SbMsokqGpI/bc6og4DwT+4e6MpUnA2rvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213137;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pC9L0ygXYZS7C23y/4zCtr72mdv0XIeuEcsbFFHGDy8=;
	b=zt7whAIZaygJ+JtBmB8PULM7LDrv3V31Hp2anxymZ99U2S/t1wSV/7R6fcwkoUWgg59D
	 YQs2MY9uwDdB3xYCVgR7ef//ArxNSBDsi1Cjq4MoLzRz7H31wSH37KEOABHIuApyZ4Mi5
	 /FuhWaoEhnwgI2fP2HtWi5xRdxX2/LAMZUJoB+oo+vkcC0xoaULpHkqXnySAKovYoIHhT
	 tTJKi8uMKAvVFql4mTdjXbXb9BdF7RCoMkPxhE7epGaw6nZDFHSIKE8qj8VX6fDCXfSs+
	 pfxS8g2IBLvkFInM8fOKLS6gMcvB6DGqIgRXaJEqx3LP+uVCu7KwagVrEcO9/3Jkuig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TFp0urI+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A84606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TFp0urI+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE1BC1F008A1;
	Mon,  9 Nov 2026 08:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794213137;
	bh=pC9L0ygXYZS7C23y/4zCtr72mdv0XIeuEcsbFFHGDy8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TFp0urI+1rThA2Odwq2Vzq0JbMotlzUotzY8Uxi1decQUasRs+ZKgwZhtHokbZYlE
	 OB+ZnLHftuEU+KUsi4oX3qDgHZH8s2RxV1t2xo5+5XRaHxkbPdSbX5Gjgq0NCVWPAU
	 JMW2uhI6sSL6gXhVAjd6fsC0zbbIt2409U601mMDgDZRm/5C8Z7AxhRH08Jb12Nrvg
	 Ovw9bx/mcx7WKMpwB26DHf2iZzHoBETYWpgh7IB1ngnwFHAHhBAduk/hXIkl8+zm7s
	 bnb55yhXBWSurk2yChodr4/9xGmJ/1uhHui0EFmX8I0IWy6L6bsGTVrBkn5c394tdp
	 fuE2SOjttMw0Q==
Message-ID: <sashiko-outbox-204590@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 7/7] thermal/drivers/loongson2: Add Loongson-2K0300
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <038de1cc102684e0abad6c25cac0138f065a0311.1794211535.git.zhoubinbin@loongson.cn>
References: <cover.1794211535.git.zhoubinbin@loongson.cn>
 <038de1cc102684e0abad6c25cac0138f065a0311.1794211535.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 08:32:16 +0000
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
- [Medium] thermal/drivers/loongson2: unmasked trip IRQ in
  ls2k0300_thermal_hw_init()
--

commit 024ebeb46fbe6ba2893fe68297ad030cb9ce5fe2
Author: Binbin Zhou <zhoubinbin@loongson.cn>

thermal/drivers/loongson2: Add Loongson-2K0300 support

This commit adds thermal sensor support for the Loongson-2K0300 SoC,
reading calibration data from the CHIP ID syscon registers and falling
back to an uncalibrated slope if the initial reading is out of range.

> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongs=
on2_thermal.c
> index 4ce162dfb1229..68e6105051c60 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c
[ ... ]
> @@ -87,6 +122,107 @@ static int loongson2_thermal_set_trips(struct therma=
l_zone_device *tz, int low,
[ ... ]
> +static int ls2k0300_thermal_hw_init(struct platform_device *pdev,
> +				    struct loongson2_thermal_data *data)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	int ret;
> +
> +	data->regmap_cfg =3D syscon_regmap_lookup_by_phandle(dev->of_node, "loo=
ngson,chipid");
> +	if (IS_ERR(data->regmap_cfg))
> +		return PTR_ERR(data->regmap_cfg);
> +
> +	ret =3D ls2k0300_thermal_read_calib(data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to read calibration data");
> +
> +	writel(LS2K0300_THSENS_INIT_MASK, data->ctrl_reg + LS2K0300_THSENS_CFG_=
REG);
> +
> +	/*
> +	 * Wait for the ADC to produce the first valid conversion before
> +	 * using OUT_REG for the old-fuse sanity check.
> +	 */
> +	usleep_range(1000, 2000);
> +
> +	ls2k0300_thermal_detect_old_fuse(dev, data);
> +
> +	return 0;
> +}
[ ... ]
> @@ -178,6 +314,10 @@ static int ls2k2000_thermal_hw_init(struct platform_=
device *pdev,
>  	return 0;
>  }
> =20
> +static const struct thermal_zone_device_ops ls2k0300_thermal_zone_ops =
=3D {
> +	.get_temp =3D ls2k0300_thermal_get_temp,
> +};

[Severity: Medium]
Can this cause a thermal interrupt storm on Loongson-2K0300 if trip
interrupts were left enabled by firmware or a previous kernel across
kexec?

Unlike ls2k1000_thermal_hw_init() and ls2k2000_thermal_hw_init(),
ls2k0300_thermal_hw_init() does not clear LOONGSON2_THSENS_STATUS_REG or
disable trip-point interrupts, while loongson2_thermal_probe() still
unconditionally registers loongson2_thermal_irq_thread().  Because
ls2k0300_thermal_zone_ops omits .set_trips, thermal_zone_device_update()
in the IRQ handler cannot update the hardware trip window or mask the
interrupt enable bit, so the comparator will keep re-asserting the
level-triggered interrupt on subsequent ADC conversions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794211535.gi=
t.zhoubinbin@loongson.cn?part=3D7
