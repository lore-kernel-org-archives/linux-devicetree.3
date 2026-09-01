Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E6B37C906
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250236; cv=none; b=QSyGEVWvQm1MRMDra+CpY/0ylPVtwi6uPYGxlnsI1YqtnxSzCnn1FXEDZZ+lIy02ZxOTMiK7NnptF94jqNhvg9iby3pSNWxb49i3oSqZ6ObMZaNVVRpbHKh5hiCPO1eOLgY2HmgJS5r0uUQkuxx/LeOZQf9iB7SxOwwwG6bvT10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250236; c=relaxed/simple;
	bh=uaNkgoOiYdQlqz+5tEXfpHu7sXLs2HJHIgrmbjDkAHM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cmct+OfLYAMKS/hU7T1FJBswZNqnVSBpOCoQtnMmUwi0xWUqJBQ/19hm9h7B3cXk6gSVMfRgtqkVyZMiw55fuGRhupmBGzBDZYle+WGzJIBsdJr6Oo4GxCTr1zDh49VV0AgX+yk/96CXAr5S/0P1fM/PyVlm6TnXREY0vO96Kk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMtzi1vA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMtzi1vA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC631F000E9;
	Tue,  1 Sep 2026 08:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788250234;
	bh=LUkE8f9/MCDv3k9r7aJvBL4RzzIlLIL48GDU99Yj230=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OMtzi1vAfHDNHl3B/E7hxlRoJQMIIPZp1DHwnsGvlFjgCL3tORHvxIWhqE93S5+rC
	 +zbVnyMz5Odhz3UBswLNjlypHl3eLlCz3HxbMRioy99a37PHmIdnOIVUkymqS9/3Fq
	 Kbqi7MOuzZPrx9HW5Ak8+TnJIR2XnUU8o1RtQnIUD6Gh3Pk9e0OEev9uf9kd4HAHNf
	 nbqi/9FsQi7JcY8KVxukFWtOEcV3r/7/E21Ml6RrVmfDUk/6Q0u224Wzb5OAya11ue
	 WiZvlwUQTk11YzpLp1RW9vcY8aPZa4B9+oAs980bKZpznEdf7o0HxPdPgpBizwrj0V
	 bfTIGMV7Im5Ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: purwa: Add PSCI SYSTEM_RESET2
 types
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xin Liu" <xin.liu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901075552.3558150-3-xin.liu@oss.qualcomm.com>
References: <20260901075552.3558150-1-xin.liu@oss.qualcomm.com>
 <20260901075552.3558150-3-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 08:10:33 +0000
Message-Id: <20260901081034.6DC631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `reboot-mode` child node in the `psci` node violates the DT =
binding schema and is completely unhandled by the kernel, resulting in vali=
dation failures and a non-functional feature.
--

commit 6aadf5c7e368cd8a19850d3a52be3816bc1f1974
Author: Xin Liu <xin.liu@oss.qualcomm.com>

arm64: dts: qcom: purwa: Add PSCI SYSTEM_RESET2 types

This commit adds vendor-specific reset types to the psci device tree node
as reboot-modes for the purwa-iot-evk. The new modes are intended to allow
the device to reboot into fastboot or emergency download mode.

> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot=
/dts/qcom/purwa-iot-evk.dts
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
[ ... ]
> @@ -1180,6 +1180,13 @@ &pmk8550_pwm {
>  	status =3D "okay";
>  };
> =20
> +&psci {
> +	reboot-mode {
> +		mode-bootloader =3D <0x80010001 0x2>;
> +		mode-edl =3D <0x80000000 0x1>;
> +	};
> +};

[Severity: Medium]
Will this reboot-mode node cause a dtbs_check validation error?

The psci device tree binding schema in=20
Documentation/devicetree/bindings/arm/psci.yaml specifies
"additionalProperties: false" and does not define a reboot-mode child node.
Furthermore, this node lacks a compatible string, which means standard
reboot-mode drivers will not bind to it.

Additionally, are these vendor-specific reset modes actually supported by t=
he
psci driver?

Looking at psci_sys_reset() in drivers/firmware/psci/psci.c, the kernel
hardcodes the arguments for SYSTEM_RESET2 to 0 instead of parsing them
from the device tree:

psci_sys_reset() {
		/*
		 * reset_type[31] =3D 0 (architectural)
		 * reset_type[30:0] =3D 0 (SYSTEM_WARM_RESET)
		 * cookie =3D 0 (ignored by the implementation)
		 */
		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), 0, 0, 0);
}

This means that executing a command like "reboot edl" might just perform
a standard warm reset rather than the requested vendor reset, leaving the
feature non-functional.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901075552.3558=
150-1-xin.liu@oss.qualcomm.com?part=3D2
