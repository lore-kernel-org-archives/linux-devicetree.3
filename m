Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A26B3F9A1E
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 15:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983281; cv=none; b=TJLJqxD19nosLuiSnumphMCZDHEBo73GpQjXBetoJs2nvydwp/mkxe8Tkj5fosvNu3kMHYUWdgWGLfkXIptawpH8hlLj44EVEPNeOhc/G351ozbCaet+EWc14cdLnV6DA6Vx6KPlQVy9c9z2eNdMRfKoTLnRAXFETmKYcfoKFhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983281; c=relaxed/simple;
	bh=de0bry3cXGJVOruuWc3dTMfb4lYvAjTe8+QJ30AQI3s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y6Yh1HedvD88BH0y25SZEFSoG/Qa/K71obXcm2Gw0/K4bFtrP2SqiSHQ539L5o/Wl50rdRySJNSDA5MBc4NPu+0WFggX/s8pUCX5xGLhrq1lEI9xjh/MwLmbnflgqnR4Ut8ZaYUSFC6nK/guCoGViA2en3c8kqp3tqpT4L926TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCAL3hNq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCAL3hNq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7B41F000E9;
	Thu, 28 May 2026 15:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779983280;
	bh=/JD9m/MyrWCB/NwXNyEHVX73S1HmYsH+4yW1CuJm9bw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZCAL3hNqBwW58cakKA0mEjldnw645C+ExELxQI1Kf5NX12VHzFaPiHo0hmtiWGiVx
	 Tjde1XMXjGZ7o1MLFfQuzcSz6e6PAHSc5ORRj/pceeVOcESX6iyBOaBn5wlJVzbkjD
	 iZD4LUfc9HqeAVzUxY1DKhrEeYEMQqMpKs5ESEl0siUhfnlW0XM+Y3VoATFxlRH7Nq
	 Capr56MgA8PYfokyqlVmUtpI2czsYoRXQO2+bFBwUHwdVu8IJWXpI4Vshy2201lA9W
	 KVPYgl69gN/DaGQGt0telGrv/mDFxgUSWxIdn0tD6Nnotq+OMF3+i0nD/JpEpmu36J
	 yNHR2Ov7zCwHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Zaikin" <zstaseg@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260528152011.376711-3-zstaseg@gmail.com>
References: <20260528152011.376711-3-zstaseg@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 15:47:59 +0000
Message-Id: <20260528154759.CC7B41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The Type-C SBU endpoint in the `pmic-glink` connector node is incor=
rectly assigned to `port@1` instead of `port@2`.
--

commit 9a9b64540450daa489edb83d1eb2b8d095f07b3b
Author: Stanislav Zaikin <zstaseg@gmail.com>

arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao) DTS

This commit adds device tree support for the Xiaomi 12 Lite 5G (taoyao),
a handset released in 2022. It enables features like display, touchscreen,
UFS, pinctrl, regulators, remoteprocs, and USB device mode.

> diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm=
64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> new file mode 100644
> index 0000000000000..ae38484cdaa0e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts

[ ... ]

> +	pmic-glink {
> +		compatible =3D "qcom,sm7325-pmic-glink",
> +			     "qcom,qcm6490-pmic-glink",
> +			     "qcom,pmic-glink";
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		orientation-gpios =3D <&tlmm 140 GPIO_ACTIVE_HIGH>;
> +
> +		connector@0 {
> +			compatible =3D "usb-c-connector";
> +			reg =3D <0>;
> +			power-role =3D "dual";
> +			data-role =3D "dual";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint =3D <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +
> +					pmic_glink_sbu: endpoint {
> +						remote-endpoint =3D <&fsa4480_sbu_mux>;
> +					};
> +				};

[Severity: Low]
Does this incorrectly assign the Type-C SBU endpoint to port@1 instead of
port@2?

According to the standard usb-connector.yaml device tree bindings, port@0
is reserved for High Speed (HS) data lines, port@1 for Super Speed (SS) data
lines, and port@2 for Sideband Use (SBU) lines.

Assigning the SBU endpoint to port@1 violates the device tree schema, even =
if
Super Speed lines are not implemented on the device, and could potentially
confuse USB Type-C drivers that rely on standard port indices for SBU routi=
ng
and Alternate Modes.

> +			};
> +		};
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528152011.3767=
11-1-zstaseg@gmail.com?part=3D2
