Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8A6389E1A
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 11:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302317; cv=none; b=kyllGr5baMWD7zvOek2Rz0kpWLIJO5Ogu0dKnyfgMlgN/GtmOFqoHPaci1gi/C8ZCn94Mzeaj8ND8V2H0B5/YRgArw1mxStBoZswVokOJrcpr2moY7nK68IIEJ6n2oA1LDjQ3H8UDWL4bRB5QW8GdvVt+zAekmvOKrSSrup2U3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302317; c=relaxed/simple;
	bh=wlrcp5v/mceanTqMBQYRkZ1nq3sdCFn8SMQY+6pvPL8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X/yARbts+ZVA6hD3kCgOQqbxiccxdb/sTn+R1yIdIPYi4koCV8dBUBbDSvQEaArgq1GSlT2GoYRM6DKhR00/5XinM0bS/CYhR3xvmMXWFwjb3E6nBJbrwewAjJX3JuOfdUsZRN7Ae7mDH5A4KpCwsNpd2WHMyPdp7sv+YqhNGSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9cQmkPH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9cQmkPH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520C21F000E9;
	Wed, 24 Jun 2026 11:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782302315;
	bh=k44gsbPGBQzK/pXxFCr26fAvjzyKfoeUyd9hS/afi68=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W9cQmkPHmq1QMn+b9PWzYqAmzkW8eO2W6BC01xJrmQ75bt4wPyviV9+mXewsl8jHj
	 pLunIRSeFnPN9Bzkg0uaXeptcgktg8rfJq/ZEYZ2b16iDfi8MenK9c/XdgdoyQXZCJ
	 6a8dzX+V1ZncMFGCKJLrzQ4LoJ7gl0dHTBXqtklp+lGtAqvI3Of0DmOdrdEnXbPFKA
	 Vg1zf5w7gWASAALSrdZxls8kBU+yu7bWn20y+cRdPtAgerwqLfg8LB4kJQT7QLdr9v
	 sqKq84sLfPf0N2ARxEt5+cN2WNcbiRH7+Okam/q+zbOOPYJIpYbzsYjk/B69PgBTsf
	 Q0HSXoJ8RtbCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: mediatek: mt8395-radxa-nio-12l: Enable I2C3
 on 40-pin header
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ricardo Pardini via B4 Relay" <devnull+ricardo.pardini.net@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260624-nio-12l-add-i2c-40-pin-v1-1-f6c11ed2184c@pardini.net>
References: <20260624-nio-12l-add-i2c-40-pin-v1-1-f6c11ed2184c@pardini.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 11:58:34 +0000
Message-Id: <20260624115835.520C21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Contradictory and invalid multiple drive strength properties (`d=
rive-strength` and `drive-strength-microamp`) in the `i2c3_pins` pinctrl no=
de.
--

commit cc885ce9bc43909e2fea294bb5532055037c4cf5
Author: Ricardo Pardini <ricardo@pardini.net>

arm64: dts: mediatek: mt8395-radxa-nio-12l: Enable I2C3 on 40-pin header

This commit enables I2C3 on the 40-pin header for the Radxa NIO 12L board.
It adds the corresponding pin configurations to allow users to connect
external I2C devices.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch=
/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> index bf91305e8e4a5..03a2f2e746475 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts

[ ... ]

> @@ -789,6 +797,16 @@ pins-bus {
>  		};
>  	};
> =20
> +	i2c3_pins: i2c3-pins {
> +		pins-bus {
> +			pinmux =3D <PINMUX_GPIO14__FUNC_SDA3>,
> +				 <PINMUX_GPIO15__FUNC_SCL3>;
> +			bias-pull-up =3D <1000>;
> +			drive-strength =3D <6>;
> +			drive-strength-microamp =3D <1000>;

[Severity: Medium]
Is it expected to specify both drive-strength and drive-strength-microamp
for the same pins here?

The generic pinconf parser will emit a boot error log when it encounters
multiple drive strength properties, as requesting both 6mA and 1mA drive
strengths is contradictory.

Both properties will then propagate to the Mediatek pinctrl driver, which
may program both the standard and advanced driving circuits simultaneously.

Could this leave the I2C3 pins in an undefined electrical state?

> +		};
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624-nio-12l-ad=
d-i2c-40-pin-v1-1-f6c11ed2184c@pardini.net?part=3D1
