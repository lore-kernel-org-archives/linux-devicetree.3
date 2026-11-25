Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608197;
	b=rsstl4fIaXe3PdimmhI7x6k0kScQxKWt8OFSshfXL3x5pdLqH3HEb9jLOhcbaO88A2xC
	 a+2J4Cg5HyyKNPZKMoQGTgfLvBfnAzfIpqahBtlL3cUZmNypRaIEOJvMr7YPdE4yuz2uf
	 /Bigxa1XNBLy2oP4P8esu1AvXb/XIZVe0hgfWbqKcbR2TACK1CS3TQprFzy+oCrI0zeNp
	 GvzBqcShMirf3vvtf1QZJVnIzlU564gpMnopDaEoXCWnwczcFStEua1QP4+SsNvGluKhM
	 jDOe7wX1AfSrx7kUQsMbJqVar5EHy4M4tQdBZ99rwj9aa5a2hD0YVGuZAZ3BNVMxqjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608197;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=p8XKQgeHzMmIc/Z+ccYjNceoI0YvFR6hWUK/swuAXrA=;
	b=4RK33GcoNPSZpozq/Ms57hYEFOU+TeGN/3s2TmTYOHbJ6Zn0IsNc7ZDumwjrjlKGLiFr
	 PrOnkrnDykWu3P8pz3T/KDGmHAuN1OEytIzAOyYli5e76NCbw30kAtyCIRdciLcEDQf72
	 Ao9C0dtt5kM/M90P5PaCymqqrIxr2yW2PVRVcO1z8lTR9cXNqmedw4Ppovg+MSHObw2k4
	 TG/JYWmGMqNTMPT9JblQj66MlTHZlYM1StgDACXbYbjm0oymzeRzCJW1nN0GF8RpLkQCD
	 K4wPTJg/CmI3GfCUMSWkpz1CYZF9hznj2y5G8KmMkCsgNEAf4hz6fqRZfBGlHcH3e1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J5mViiQf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD32A606A33B
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J5mViiQf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E521F000E1;
	Wed, 25 Nov 2026 12:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795608197;
	bh=p8XKQgeHzMmIc/Z+ccYjNceoI0YvFR6hWUK/swuAXrA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J5mViiQfODWocyqa1kltSGH8TvaQWhoDAVorFHeG6zyxzpzojLwn3YjM90ulqLkll
	 A861zBIYCJ81XaBj67EEYyDXxaBaoukvTzvEasA32hD5cyIhn8dVDddbmQVZ2v54ux
	 ixMxw+XYUQ2KMFFw6BSj/NsVmmzlPdSDkgJG4HsXonnS7Tt9H8qsQlQ4nPQQpdPCGS
	 D9ZlQXnvRVQCdOX5DBMgT/lq7WDOMuTUYH6//CjqnDW+Gasr2s0aNddK/oJ9oaDldt
	 s6aeB7xnSDN6nH/tgDIBZd5SxNiutp5JqOcZuHsIB/quW68elvSCFBYqicSb9OSY6w
	 uwgdobGq3XJYg==
Message-ID: <sashiko-outbox-233329@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: pm8550b: add USB VBUS regulator
 and Type-C nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-topic-sm8650-deckard-tcpm-v1-1-4af33e89ea9e@linaro.org>
References: <20261125-topic-sm8650-deckard-tcpm-v1-0-4af33e89ea9e@linaro.org>
 <20261125-topic-sm8650-deckard-tcpm-v1-1-4af33e89ea9e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 12:03:16 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] arm64: dts: qcom: pm8550b: unmatched and undocumented
  compatible on pm8550b_vbus
- [Low] arm64: dts: qcom: pm8550b: undocumented compatible
  qcom,pm8550b-typec
--

commit cf2d4fe502182acd6818991415b674bdb540bbb6
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: pm8550b: add USB VBUS regulator and Type-C nodes

This commit adds the USB OTG VBUS boost regulator and Type-C port
controller nodes to pm8550b.dtsi, disabled by default.

> diff --git a/arch/arm64/boot/dts/qcom/pm8550b.dtsi b/arch/arm64/boot/dts/=
qcom/pm8550b.dtsi
> index 74d23b8970f4c..feb2395e920a9 100644
> --- a/arch/arm64/boot/dts/qcom/pm8550b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
> @@ -45,6 +45,53 @@ pm8550b_temp_alarm: temp-alarm@a00 {
>  			#thermal-sensor-cells =3D <0>;
>  		};
> =20
> +		pm8550b_vbus: usb-vbus-regulator@2700 {
> +			compatible =3D "qcom,pm8550b-vbus-reg";
> +			reg =3D <0x2700>;
> +			regulator-min-microamp =3D <1000000>;
> +			regulator-max-microamp =3D <3000000>;
> +			status =3D "disabled";
> +		};

[Severity: High]
Can any driver bind to pm8550b_vbus without a fallback compatible or a
matching entry in qcom_usb_vbus_regulator_match[]?

drivers/regulator/qcom_usb_vbus-regulator.c only matches
"qcom,pm8150b-vbus-reg" and "qcom,pm4125-vbus-reg", and
"qcom,pm8550b-vbus-reg" is not documented in
Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml.
When a board enables pm8550b_vbus and references it as vbus-supply on the
Type-C connector, no regulator is registered and
qcom_pmic_typec_port_probe() fails indefinitely with -EPROBE_DEFER.

> +
> +		pm8550b_typec: typec@2b00 {
> +			compatible =3D "qcom,pm8550b-typec", "qcom,pm8150b-typec";

[Severity: Low]
Should "qcom,pm8550b-typec" be added to
Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml?  That schema
currently only permits "qcom,pm6150-typec" and "qcom,pm7250b-typec" with
the "qcom,pm8150b-typec" fallback, so dtbs_check will report a validation
warning on boards that include pm8550b.dtsi.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-topic-sm86=
50-deckard-tcpm-v1-0-4af33e89ea9e@linaro.org?part=3D1
