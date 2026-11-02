Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793652080;
	b=qpvrHqCTzc1EeLZbk6j9I69uxurHNTH+23wy3nrzQIW+tG740w+D78dmC+lnqFvUrgBF
	 ccgHI5U00weZQsLOZe4yaKLN+8tMBu1X6c7lqJwKzcw+te5qXSZfssLXxNgYlJSGtrLYg
	 wfC6E0dcvdpgXegVcFHiMGVCXEk2Tvy/J2DYRtjZgqZAzB5erIP0gj7d/MfJ5NFtZXmbQ
	 opYjjJYda52JDuyVJB4+NEU+Rx9sB+wFvfOCa+tbjud/n9vN3KVbR0toaUJGOGXwGZEF5
	 isFfGsO9X/AMjDe1UeGOefGVcSb7YXXxgJilipI1Zhk5Dpj1T7XrP+a2kjrgFW6nZhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652080;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=c6JB3EiKpXfXqeyk95vUrlrIwNyB1Sk/axDCby+ufZE=;
	b=BI50BzDL0z9IEMxm3u4TynC7t3acl+C8+ik2LHjIoocYekVoeK1teqVdSrsUnj4m82vZ
	 0Iik/9fkFYWCIRQ9GYTdQrCsg/wvvBqJgan9WqOt3LE1qG1KTqkaKUyTR4qBgvoqayCWR
	 eLSjCFDh8pht2iM3dLduZjSWo/m0lLT6pk7i/4hCiXuOwPi0cCtOadNP8X3JZgUdC0U/w
	 cxEHgczaDybK9H5eI5/16JKrqFdSkPA0ouD27LUAYMcMJ16s3w3rvWld37ttT8UmyFh8G
	 63iRI9ugphRFXWoR4rvZoVuJS+A4D8hx6rrKrdTLNzieWgyiqbZu7wHqq7VqdE9QPaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jpNjYp5u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D5D606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 20:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jpNjYp5u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2D11F00A16;
	Mon,  2 Nov 2026 20:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793652079;
	bh=c6JB3EiKpXfXqeyk95vUrlrIwNyB1Sk/axDCby+ufZE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jpNjYp5u13lU6D+ESeL36nck12lGnUtCsfoaccLmEE1gcFMvzopR0jQ5YWJH23oWZ
	 PN7mbhuots/j4DHDnEwJYiIFH6MRq5B0tAXq4GSq78+b50q0QpN2kTI8FxiQtjIXd5
	 osyCYcRIYMYA3xfCyxBsdeC8X0xRWHI/DugoVOBE/lkcIXp810xCviCS5V4clUj/P4
	 QYAy6XGa6qfSk6OT4qa/ooPbHj5qhhmpdkBj3MXGvIpGyNMKCOyLciF4sN25eEIoaW
	 /juQ1pnqjtAAPcyPbR5QbB9hy3X5vkOejEW10vZldTkx4SskndjUOyNPWGOzcli0XR
	 EkvHEyXR1x+mw==
Message-ID: <sashiko-outbox-194142@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: enable OV9281 CAM0 P14 on
 RK3588 Jaguar
Reply-To: sashiko-reviews@lists.linux.dev
To: "Quentin Schulz" <foss+kernel@0leil.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-jaguar-cam0-cam1-v1-1-c3aafcdab5dd@cherry.de>
References: <20261102-jaguar-cam0-cam1-v1-0-c3aafcdab5dd@cherry.de>
 <20261102-jaguar-cam0-cam1-v1-1-c3aafcdab5dd@cherry.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 20:41:18 +0000
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
- [Low] arm64: dts: rockchip: underscore in cam0_p14 pinctrl node name
--

commit d626daefe6323fd02925a1f931694d66c7b92c2d
Author: Quentin Schulz <quentin.schulz@cherry.de>

arm64: dts: rockchip: enable OV9281 CAM0 P14 on RK3588 Jaguar

This commit adds a device tree overlay for the P14 camera module on the
RK3588 Jaguar board, supporting an OV9281 camera sensor, an IMU, a
magnetometer, and an EEPROM.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar-p14-ov9281.dtso b=
/arch/arm64/boot/dts/rockchip/rk3588-jaguar-p14-ov9281.dtso
> new file mode 100644
> index 0000000000000..155101c8497de
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-p14-ov9281.dtso
> @@ -0,0 +1,113 @@

[ ... ]

> +&pinctrl {
> +	cam0_p14 {
> +		cam0_imu_int3: cam0-imu-int3 {
> +			rockchip,pins =3D <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};

[Severity: Low]
Should the cam0_p14 node under &pinctrl in
arch/arm64/boot/dts/rockchip/rk3588-jaguar-p14-ov9281.dtso be named cam0-p14
using a hyphen instead of an underscore?

Device tree coding style reserves underscores for labels and uses hyphens in
node names, and building with W=3D2 enables -Wnode_name_chars_strict in dtc,
which warns about the underscore in cam0_p14.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-jaguar-cam=
0-cam1-v1-0-c3aafcdab5dd@cherry.de?part=3D1
