Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1CB2FE0F
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066309; cv=none; b=Rm/beGLlZcvv30Ym6bhtkM9yyJ5YfHRoS5Em/yU87Hk4zObsW1RBRMsMRVTBKVKJTrLJ5DxGMiz66Ijg01B7X9ZgDXGpCsG1/2t6/EQqe/yePlMXVsteFD7eXUM4kuHowP/xxG/WNIBSqAl9hJGeG3aZ0VXf+7dGdgeRyR3fh7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066309; c=relaxed/simple;
	bh=nuu6iJ2y2MfZ6SxUlNN7yLlA7oY9heYRVHQf/DC38fc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DbunUvU5QVAtGmdt/8a922cBwLGyPG36etFB6aaiNhsswOMroUmaZFZ6xYw+AigGNt2iqq0eUePTi17I2cv3OAISwfZgSSIBoFbD4zEQOvGjg+UegY/Uct9ts6cYCgTY+Csd4gWH26BO+dH5sJdhVxlaQfWFUbmfDRLxzitsCwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KESRfSHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KESRfSHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97981F00A3A;
	Fri,  3 Jul 2026 08:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783066308;
	bh=ZdkeQxYvEiazxB9Ktn2YjfrLZjFRGIfNsIAYa9T1jAo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KESRfSHsc+bwnYaaZTFCtirfAf/0eDMtKV48QwCu72Avc5Fg75WbrhzAtkG2S3mhb
	 O6TV4JPFEdv6bSXGR+qbZeINaHSgRQlb+0s21em7G0ZnznT4ropY3R/a0EQR2ZvDFi
	 q0RpQXl3NcvXoym7Ebh93nkdoNoC0IBmYeDiZvOptgwm6XNDxWRKD71TVas58nm6UM
	 Zew2/wH1NmSLUbpfcAca5OW5d8pR8q5JWPfSgdDiUWm1F9wlC6ynKNhSIZzPhx03Jz
	 U1oyopqQHHPDQSTQnZ6fK+pilXDcxUgN2TzJsEnu9rShdnt5cBFABl/446wXPZu3X+
	 IoCDSbLSVPV0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial
 device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Erikas Bitovtas" <xerikasxx@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 08:11:47 +0000
Message-Id: <20260703081147.E97981F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `vibrator` node specifies `pinctrl-names =3D "default";` but la=
cks the required `pinctrl-0` property to define the pin configuration for t=
he GPIO.
- [Low] The GPIO key node `vol-up` violates the `gpio-keys.yaml` binding sc=
hema naming convention.
--

commit 4c3f46af7d91551d5cb47755e411d4869514c5fb
Author: Erikas Bitovtas <xerikasxx@gmail.com>

arm64: dts: qcom: sm7125-samsung: add initial device tree
   =20
This commit adds the initial device tree for the Samsung Galaxy A52 and A72
devices on the SM7125 platform. It introduces support for basic peripherals
including the framebuffer, GPIO keys, sensors, and regulators.

> diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi b/arch/a=
rm64/boot/dts/qcom/sm7125-samsung-common.dtsi
> new file mode 100644
> index 0000000000000..836dc9b8b1a56
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi

[ ... ]

> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&key_vol_up_default>, <&hall_sensor_default>;
> +
> +		vol-up {

[Severity: Low]
Does this node name violate the gpio-keys.yaml schema?

It looks like dtbs_check expects names following the pattern button-*,
event-*, key-*, or switch-*. Could this be named "key-vol-up" or
"button-vol-up" to avoid validation warnings?

> +			label =3D "Volume up";
> +			gpios =3D <&pm6150l_gpios 8 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <KEY_VOLUMEUP>;
> +			debounce-interval =3D <15>;
> +		};

[ ... ]

> +	vibrator {
> +		compatible =3D "gpio-vibrator";
> +		enable-gpios =3D <&tlmm 57 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names =3D "default";

[Severity: Low]
Is there a missing pinctrl-0 property here?=20

The pinctrl-names property is defined as "default", but without a
corresponding pinctrl-0, this will trigger a dtbs_check warning and leave
the pin configuration to hardware defaults.

> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-sm7125-sam=
sung-v1-0-3e5f752048c1@gmail.com?part=3D3
