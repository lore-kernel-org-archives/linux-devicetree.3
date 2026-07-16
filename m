Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE60236920C
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784185704; cv=none; b=iQh+X5eXgGkdBkAm2kKrXPF8HBgOiHCm2RjNLGfHdyHKYJMnt6wxAg9RRW0/y3eVTJNsFN1+3R98yVq14iomLx3CipxwNVjLJyyR0uuXFOaoNAoEBcAVxTAbke+rV77a5+wHwVPHIrxRFjUQUUXuAhBBjJlFL0sRrNOp73Iz/mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784185704; c=relaxed/simple;
	bh=jNE7Pfxq6Ot2rxt01zXbuENQnChsz7YX5d3wV/anx2U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k1TxI/SskHkrSgJkdrmAiRtjMygVlN/VlU+TFo2T/Jrmn/38sa/KpB3TlaZXQaSKfNqq08fA3fE2fvrXDJaGnq35ZEHaheHuBhMX3DkVNS8dBP7mQN7V/CgtxJlsjT+XGfSMUght8iQFN3HEWjafFbZD/b+E+eLIllRT8H/7EU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ylh+Jw6I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ylh+Jw6I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F011F000E9;
	Thu, 16 Jul 2026 07:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784185703;
	bh=u0siAjTNfVdcKJJoX2xCtn12B+qDp33BRtTApKjSK7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ylh+Jw6IZnDOQb8SbnJFCuKBgB8wFsbB3Xi4XQVaYRa8LmyYnzaQjZ9oekWn1gdvJ
	 cAkpTlcZgVqOiFESK0KppbayG6dOPj3up/QznXvdrt8AEtJiWCXq8nv5T5LkdAPtTv
	 dA+MKxUj9nmXrFlGdKND+RsSx747qEt0T8VK+nxMHNF9qCWJSee1xP2ZQwII+vIPHr
	 YJVAGs3MA4FR/KXZTNMxDpOb0a6b5X4DGflUfp+u7fuwbiH2ppFTMcxHKm4Os1/w2l
	 EJcoXlhsfUE+r08NvTdf4/OjMS8m6xtbBxixIIAfZyZL5Vl2fHINpadTS2jJ0Xc/2o
	 h2KN+L4k1Htzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <0b2212fb-8149-453c-bdef-dacbf2263f1a@smtp-relay.sendinblue.com>
References: <20260716065548.2466198-1-gahing@gahingwoo.com>
 <0b2212fb-8149-453c-bdef-dacbf2263f1a@smtp-relay.sendinblue.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 07:08:22 +0000
Message-Id: <20260716070823.09F011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The ES8388 audio codec is documented in the file comments but it=
s device tree nodes are missing.
--

--- Patch [2]: [PATCH v2 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-=
IO ---
commit e190cae752b4a73c5373d9576341bafa7b3f0b4f
Author: Jiaxing Hu <gahing@gahingwoo.com>

arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO

Add the ArmSoM CM5, an RK3576 compute module (rk3576-armsom-cm5.dtsi),
and its CM5-IO carrier (rk3576-armsom-cm5-io.dts). The carrier adds HDMI, a
GbE RJ45, two USB-A ports behind a USB3 hub, USB-C with FUSB302 and DP
alt-mode, a PCIe 2.0 x1 M.2 slot, microSD, status LEDs and a 40-pin
header.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch=
/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
> new file mode 100644
> index 0000000000000..79a903585197c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts

[ ... ]

> +/*
> + * I2C0: ES8388 audio codec @ 0x10, FUSB302 USB-C PD controller @ 0x22.
> + * Pinctrl i2c0m1 (GPIO0 PC4 SCL / GPIO0 PC5 SDA).
> + */
> +&i2c0 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c0m1_xfer>;
> +
> +	usbc0: usb-typec@22 {

[Severity: Medium]
Is the ES8388 audio codec node missing from this bus? Both the file header
and the comment above indicate it should be on i2c0 at address 0x10, but
only the FUSB302 USB-C PD controller node is present.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716065548.2466=
198-1-gahing@gahingwoo.com?part=3D2
