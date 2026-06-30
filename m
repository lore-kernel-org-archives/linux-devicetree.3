Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6256A3FBEC1
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824533; cv=none; b=rSRThPc+LKwQgKRPDoRpnO+Y1y7RLrVAzeX4OkFqXcYIFOiWHRQdT4JeIbbo7tsvF/UOtqY7PE5vgLeSDYM+ZfXm+9fJTeA+pgdtfonhpNfdn5H/fdj/hAER2xD3oZMEOxr03QRMkORLm1GWUeFealC4Dt38jeZg1apUv+d2+gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824533; c=relaxed/simple;
	bh=ZTU2I1LtO1oKdFtjgfr87ez4wPCuL2F97pFviwgJjyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UPfPQmb+kRTUABpBO5WOSu0ixEJA6c09T8hIoIPZH+nEWiVCE+fwX7VWhiVfciQqtUt9CpO5zQ1ACiFTsdQtjyR6YKI8GhioJM8N9+BmmXAp96ABGyzrH9bGfhPwH2GZi7r6EOUZjuptiIN9Jo2LGt6JEQ4MDPsFXjBWD9AWEc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=StHT6QzZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="StHT6QzZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2181F000E9;
	Tue, 30 Jun 2026 13:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782824532;
	bh=vLF5U8WDiqixOWrXx4k+Lz2r74EULc/Lq3FFKfnCWHs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=StHT6QzZBgrMwzlRwiFIEtt9I00Jasdzf/9wcTnc05pAGI4oobfHuZKSOux1yYOJd
	 13sQP2C0LFwGd9So7UqaBNbqcFCDRuNtfyDDjEQFPZLBZ6enRExFBaNJx0e9gNRY8y
	 CTK5ZjEXYLCZJV9xXMDA/1mCJn4TKwdY2ZN3ma1ByE98n5IYhBoMoV+tr3RyaqTLzN
	 FVsmvv80M5Q/OZGLDha8Bpew9jzecK9OhhAx0fgP3s6xWpv9iSwaZof0YD2ornab8v
	 cL9VGtuVPBaY6t/3QzQDfZv3lequ+GxD0C3n+ZM9RcqrlUYuaXhfcv6wZhLyshD5XB
	 mXguZWd+DjdmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: ipq5018: add nodes required
 for Bluetooth support
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem via B4 Relay" <devnull+george.moussalem.outlook.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260629-ipq5018-bluetooth-v2-5-02770f03b6bb@outlook.com>
References: <20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com>
 <20260629-ipq5018-bluetooth-v2-5-02770f03b6bb@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 13:02:11 +0000
Message-Id: <20260630130211.9D2181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Adding "syscon" to the apcs_glb compatible string violates the curr=
ent DT binding schema and will cause a dtbs_check failure.
--

commit 8d5a37566d441600f3735791890dcc06ffb70e79
Author: George Moussalem <george.moussalem@outlook.com>

arm64: dts: qcom: ipq5018: add nodes required for Bluetooth support
   =20
This commit adds device tree nodes for the reserved memory carveout and
Bluetooth on the IPQ5018 platform. It also modifies the apcs_glb mailbox
node to include the syscon compatible string.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5018.dtsi
> index 6f8004a22a1ff..65a47ba7d3a34 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi

[ ... ]

> @@ -647,7 +669,8 @@ watchdog: watchdog@b017000 {
> =20
>  		apcs_glb: mailbox@b111000 {
>  			compatible =3D "qcom,ipq5018-apcs-apps-global",
> -				     "qcom,ipq6018-apcs-apps-global";
> +				     "qcom,ipq6018-apcs-apps-global",
> +				     "syscon";

[Severity: Low]
Does adding "syscon" here without updating the device tree bindings schema
cause dtbs_check to fail?

The schema in Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-glob=
al.yaml
strictly limits the compatible array for qcom,ipq5018-apcs-apps-global to
exactly two items. Will the validation fail when parsing this new item?

Should the DT binding schema be updated in a companion patch to permit the
"syscon" compatible string for this node?

>  			reg =3D <0x0b111000 0x1000>;
>  			#clock-cells =3D <1>;
>  			clocks =3D <&a53pll>, <&xo_board_clk>, <&gcc GPLL0>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-ipq5018-bl=
uetooth-v2-0-02770f03b6bb@outlook.com?part=3D5
