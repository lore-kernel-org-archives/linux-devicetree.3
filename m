Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C212F6560
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782483047; cv=none; b=fJO/+FCPBbxPekEFoTRPhVux2VVNiJirYYO0yzIc4NUT0BUGPFc3IoRYrMCwNEvDpwvIA/hULDz0WaLG5OrErwx7Fw5r1MVgyI6GbY3VvCRxX1Q3a2xngF614F6RwJLBGgahCQLKF/HI/5Jp8O+gQbO+NvSEUIwIFxQY5g9fvYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782483047; c=relaxed/simple;
	bh=SIMn3wV+nVRuHr+S2/3SCNKUIBeh2wuzynd1XwEealg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q/1HWVnCCDG/WH1hUdMQlWiNV4ZkB8uhm9I8goL2+PhaZVWQ4InASztBJiLuoLYFEyfhkf1TP3qH29UiM9TNmejLHkwoXQ84olIMgoCnvXE+z/zgnd8zWbKo8MIqzOQgWGgW6ghGEXZ0xT6bl7rnAfU2s79LxLV3pccSg6M7sUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aw6/7A4R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aw6/7A4R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F4E1F000E9;
	Fri, 26 Jun 2026 14:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782483046;
	bh=cpDSMon+bmw4Q4hVU/1CRXgzCUOkAtebgLlTodIxu9Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Aw6/7A4R9B5TwZI9/j1LoSWI/IWcCsPwqd2Y3XmPg0UmrpTx10lwZBLBQyGq9MYgz
	 30kFpe5gLzZAjVTBTosSkPxkK1qWZjLBfdx1fhDo+RFNXZLYpON1byyKPqQAR2V16A
	 8ebUua0d4v3MxZff20HyL6eRqvdKFc7h8jIcpDXcQ8bcsMS5+Y1g08Gm+DgwouW8us
	 pk68suEKm4K7kMJg6caX9kObZePcqL8P8GnRi49ITdrVjsvO8wsMUErXdt0jpVurgi
	 cY2q2SX2OWOXy54GUkzBE2u1PbGo71o7rAgxam5akzal9B4iuzA079J/kCaOrr410J
	 Z+tjZpPqO4TKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: ipq5018: add nodes required for
 Bluetooth support
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem via B4 Relay" <devnull+george.moussalem.outlook.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260625-ipq5018-bluetooth-v1-6-d999be0e04f7@outlook.com>
References: <20260625-ipq5018-bluetooth-v1-0-d999be0e04f7@outlook.com>
 <20260625-ipq5018-bluetooth-v1-6-d999be0e04f7@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 14:10:44 +0000
Message-Id: <20260626141045.C7F4E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Adding 'syscon' to the 'apcs_glb' compatible string list without up=
dating the devicetree bindings causes a schema validation failure.
--

commit d7e5dd126ba08d18fdb72c0c8149b7aba5e36e82
Author: George Moussalem <george.moussalem@outlook.com>

arm64: dts: qcom: ipq5018: add nodes required for Bluetooth support

Add nodes for the M0 remoteproc, reserved memory carveout, and Bluetooth
to bring up the M0 core and enable the Bluetooth Subsystem.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5018.dtsi
> index 6f8004a22a1ff..4fdf20c87b0a9 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi

[ ... ]

> @@ -647,7 +678,8 @@ watchdog: watchdog@b017000 {
> =20
>  		apcs_glb: mailbox@b111000 {
>  			compatible =3D "qcom,ipq5018-apcs-apps-global",
> -				     "qcom,ipq6018-apcs-apps-global";
> +				     "qcom,ipq6018-apcs-apps-global",
> +				     "syscon";

[Severity: Low]
Will appending "syscon" to the apcs_glb compatible string list cause a
devicetree schema validation failure?

It looks like the qcom,apcs-kpss-global.yaml bindings enforce that the
qcom,ipq5018-apcs-apps-global compatible list must contain exactly two stri=
ngs.
Running make dtbs_check might fail here without a corresponding update to t=
he
YAML binding to permit this third item.

>  			reg =3D <0x0b111000 0x1000>;
>  			#clock-cells =3D <1>;
>  			clocks =3D <&a53pll>, <&xo_board_clk>, <&gcc GPLL0>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-ipq5018-bl=
uetooth-v1-0-d999be0e04f7@outlook.com?part=3D6
