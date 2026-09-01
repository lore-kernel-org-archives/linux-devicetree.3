Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E0C470453
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249894; cv=none; b=luaV9WTUy0SDhBhP8rM8EqcrTc6+aXUi/4yknW3cfSS4Z7s3D2yXk2V7evTIhE0KBJTjyxQWfMkhOmI58HDQHo8Yd1+ESZnlLaSZ028q6Zj7Thq1XXAMpoCAOd2vtr8UMFNas5+i3B7Vvg6sSwzv9sGjEtykZ2b6i8brPT9/ZcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249894; c=relaxed/simple;
	bh=aHx/+79yWnX02W2joK5OJT5lIsQBLWMRAOeSqJe17VE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ew5xw4PNosK/c8aLbyLZkA7qB9PmPugLikESatcApINj5wRFc54QLwVurntoMfL5tYuN2I4d/zRutZuqQphK24WHtjH4Oz07YS5p1oJgMafDxpQXh7s6f0nZ3+wYimosZEP+zhVHtsf0vJ8LEeCfajJpdpdP5uQqGSJaNBDbM7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DXaO5uKR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DXaO5uKR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6ED1F000E9;
	Tue,  1 Sep 2026 08:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788249892;
	bh=rAO47ojdfHu8CHMkO0BAHIHCu1SzBG23H4LsoeOZ1rg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DXaO5uKR1ngh5Wgks/ZOv4DapbhW6fKKBxEM44UmG/0hQgwdNWJFDad29BuzqpyKJ
	 9or8jqpd9p99tlqRYjbAsx9lZ2RegQ38qUPaW5ec1IrECD8UuvO7HupDH6Wmu3Ci5I
	 QwJoXaSIs9rbx0Vh08ZIH22DhinwZ1sbfOaHpybQls4TNkC1A2tR5EjKxx/gZDG8uK
	 eGqHAFu839A2uzib5Jp1lNZiY6Fq3mYGL4Rtdcsr+SczdWX+BE/nWCkoI2FxaEDKtW
	 DG45PFdAjeNHFmihdXlT3Wfmg0FN4IfzkWPlEZ+HzxVD+t1VCaDCuwH09seR0ccK8X
	 LRJiZtq3djb2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: hamoa: Add PSCI SYSTEM_RESET2
 types
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xin Liu" <xin.liu@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260901075552.3558150-2-xin.liu@oss.qualcomm.com>
References: <20260901075552.3558150-1-xin.liu@oss.qualcomm.com>
 <20260901075552.3558150-2-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 08:04:51 +0000
Message-Id: <20260901080452.5A6ED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The addition of the `reboot-mode` subnode to the `psci` node violat=
es the PSCI device tree binding schema, causing `make dtbs_check` to fail.
--

commit 0761e0e4725677d66ad02781f96c6323f5504b5a
Author: Xin Liu <xin.liu@oss.qualcomm.com>

arm64: dts: qcom: hamoa: Add PSCI SYSTEM_RESET2 types

This commit adds support for SYSTEM_RESET2 vendor-specific resets as
reboot-modes in the psci node. It defines "bootloader" and "edl" reset
modes for the hamoa-iot-evk device.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot=
/dts/qcom/hamoa-iot-evk.dts
> index 9fa86bb6438ec..5db2f19dc86c3 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -1192,6 +1192,13 @@ &pmk8550_pwm {
>  	status =3D "okay";
>  };
> =20
> +&psci {
> +	reboot-mode {
> +		mode-bootloader =3D <0x80010001 0x2>;
> +		mode-edl =3D <0x80000000 0x1>;
> +	};
> +};

[Severity: Low]
Does adding the reboot-mode subnode to the psci node violate the PSCI device
tree binding schema?

The psci schema in Documentation/devicetree/bindings/arm/psci.yaml specifies
additionalProperties: false and does not define or reference a reboot-mode
property.

Will adding this undocumented subnode cause a dtbs_check validation failure
during the build?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901075552.3558=
150-1-xin.liu@oss.qualcomm.com?part=3D1
