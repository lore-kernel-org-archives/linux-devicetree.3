Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600003;
	b=ifDSVTo9Ci9aF1Su2rVdjfvpLAKrI8Lwjf7OMnFIF7altBkBGpnFlpo4lXqSdxJ/tEHE
	 lhm4JcSE0PlDuj6oDYbOwxIT0KeyY63RxVGuX5vLzgxk6zdfXI9AmOOVYFoENf75E+Olf
	 kXHInrkAmMWl2Pwg4lI6bBnYOlJZThGaetPEyTPVGM/6anJkKax1WIJ82raTZ2pIp8AbL
	 heoTCbrU4p0G41CGz1CdryaG4aasYYj0NEXA5R7d9Rs29L6K3BZuQOptSi6vlO+RCAYbq
	 ioVjpuTlJqxMC3LAwa6CDVRvuQVXZ65LK424EXK6sD/AF207czuAY8yq4rK0PlctVDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600003;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vZPKi4tqqIWP41Na97Vj6IWRQkVGLgfG6JaL++XHBP4=;
	b=C5AaQiGc2dBrsiidLhKeXoKHep3HBa/4Uy0JXXGwVCn66dP/PvI0zWFWBvDC42R22hgs
	 h18EBQTYG3WZtKHzfyshQmf9/PsgkrbZe77e3hVl9at5TwsKwY6lsAW7qxOUPHYfW/R6N
	 7Sie/Bgj03v019x6jxRxzFShX27OzaDiy0h63fFATuRD2NevrwlQc5RAMj39UYwbbYzNu
	 90hDmjkEy+49VRZgRu1yV+EzWY2ZsgD6j86Nl5A7ziZP4PZwcAw9o4z/R8xCVOITLHRSG
	 TcZJ6N0SgaCY7tjL9vHGShRVY/AHIUwyfA1z8/ItX+Egqnmo8F66bso6eH7HZq6OnZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8uz+A4d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FAC606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 06:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8uz+A4d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D6C1F00919;
	Mon,  2 Nov 2026 06:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793600002;
	bh=vZPKi4tqqIWP41Na97Vj6IWRQkVGLgfG6JaL++XHBP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k8uz+A4duFT0sZ/9M1f3f7azr6KtLKX8CheOxUQ/05KvLLjEvdE9L6PWxny7dkKbz
	 JXDQVvUhPfKb4NcjhVEK7tj9RWNy4S3wL+nfnTiIUNIEnypGS/VeGfS6yMv4WlH4Dv
	 U2x+MSayxDdMruYItqGSFSwO8UxCkUAzvhFF+Ht6Ok7XYSPrePNTPVs01riX8CVlDB
	 VX0ynTVwvJPHdX/iM3OrMPJEj6Q2Vb7dV3DrV3/bR+9UyWgh6ESUHqXcUmw0YVUNLB
	 drVFgH2QnrDRHNM/501ik0RGAfy5XERijmLqOEUCk7Ym8cjmOhKB7eORAD8JFH3HWT
	 hTRU1iUG++TmQ==
Message-ID: <sashiko-outbox-192941@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] regulator: willsemi,wl2868c: add the WL2868C
 camera PMIC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102060458.461372-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261102060458.461372-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261102060458.461372-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 06:13:21 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] regulator: wl2868c: wl2868c_enable() activates other LDOs with p=
reset bits
--

commit 90fe2a3492ce0c2ca1434cba3d7a67c4de55955e
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver

This commit adds a regulator driver for the Will Semiconductor WL2868C
I2C camera PMIC supporting its seven LDO outputs, shared SYS_EN master
enable bit, and optional reset GPIO.

> diff --git a/drivers/regulator/wl2868c-regulator.c b/drivers/regulator/wl=
2868c-regulator.c
> new file mode 100644
> index 0000000000000..9c4f4240b1de1
> --- /dev/null
> +++ b/drivers/regulator/wl2868c-regulator.c
> @@ -0,0 +1,155 @@

[ ... ]

> +#define WL2868C_DEVICE_ID		0x00
> +#define WL2868C_DEVICE_ID_VALUE		0x82
> +#define WL2868C_LDO_ENABLE		0x0e
> +#define WL2868C_SYS_ENABLE		BIT(7)
> +
> +static int wl2868c_enable(struct regulator_dev *rdev)
> +{
> +	/*
> +	 * SYS_EN is the master enable of the chip: no output comes up unless
> +	 * it is set together with the per-LDO bit.
> +	 */
> +	return regmap_update_bits(rdev->regmap, WL2868C_LDO_ENABLE,
> +				  WL2868C_SYS_ENABLE | rdev->desc->enable_mask,
> +				  WL2868C_SYS_ENABLE | rdev->desc->enable_mask);
> +}
> +
> +static int wl2868c_is_enabled(struct regulator_dev *rdev)
> +{
> +	unsigned int mask =3D WL2868C_SYS_ENABLE | rdev->desc->enable_mask;
> +	unsigned int value;
> +	int ret;
> +
> +	ret =3D regmap_read(rdev->regmap, WL2868C_LDO_ENABLE, &value);
> +	if (ret)
> +		return ret;
> +
> +	return (value & mask) =3D=3D mask;
> +}

[Severity: Medium]
If WL2868C_SYS_ENABLE is initially clear while one or more per-LDO bits in
WL2868C_LDO_ENABLE are set (for example, from pre-probe state when the
optional reset GPIO is absent), won't enabling a single LDO in
wl2868c_enable() unintentionally turn on those other LDOs as well?

While WL2868C_SYS_ENABLE is 0, wl2868c_is_enabled() returns 0 for every LDO
regardless of its per-LDO bit, so regulator_late_cleanup() sees those LDOs
as already disabled and does not call ops->disable() to clear their bits in
WL2868C_LDO_ENABLE.

When a consumer later enables one regulator via
_regulator_enable() -> _regulator_do_enable() -> wl2868c_enable(),
regmap_update_bits() sets WL2868C_SYS_ENABLE | rdev->desc->enable_mask while
preserving the other bits in WL2868C_LDO_ENABLE. Any other LDO with its bit
already set then becomes active in hardware and starts reporting enabled via
wl2868c_is_enabled() despite having rdev->use_count =3D=3D 0, which also ca=
uses
a later _regulator_enable() on that LDO to see _regulator_is_enabled(rdev) =
> 0
and skip _regulator_do_enable() along with its 150 us enable_time delay.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102060458.4613=
72-1-xiaqinghuan@mail.ustc.edu.cn?part=3D2
