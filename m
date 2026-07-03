Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9608D233134
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 05:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055448; cv=none; b=slm9njuetRubn/h8KaklBzoE4WULQyWh3paMVdneOub6A3Vbti4a7hoCkgP7tYWWem7rwPNCsDtgUCaMtHW51KkFfqsmKIKuYpd/Z5GjaHwXCM6vSX0hD6hcpl7Fmy36b8RFZt8cYtbYr8isPIh38KtHBZvXQNcvHx7IoYhUbT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055448; c=relaxed/simple;
	bh=S8OrYcn614sp/cWgjmVymd1l4nxBKw+kN8XfEg13vkY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Km6YCaJJypW5hD6WxGvO504PA3FSQLwARtrhfU150mCt5lwD8bvaD5rVMJHb92z13MDfxpEqYeHwkdbttN5HKsDcCGkUCZkxGq8YAus/ZjN8ecIGyfd/Sdxufs5zvgVbQVj8nGCFjkW28FSlj+KWsa7GQIwnuuTxlUMyBUAVXhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZ9/vb5V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZ9/vb5V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28241F000E9;
	Fri,  3 Jul 2026 05:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783055434;
	bh=QZ2CO3jLVy9ZaRH74FxPea8ve1av0ZDaH6dxrvYn27k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HZ9/vb5VRKYaoEXd92qkzwvWgn9szJ3xwEqCi7EkSBw0vnHjavJqu92jKBs8m7vt9
	 Eu06ToTbUN209MYqZK0B3HmlQBXdfaxWH7mvRbumoQ9xG1kJi5PVHL6EZZOrP8B5kc
	 XbumAcwZDPMgrirNuEZu6FTtnm1XhW56LicQ5e5TEHLgJ6xsDS+woI/fBvonxAmB96
	 Jc2KwnVFmYDNqt9w9P7zR2+jea0dGEHNSN4xi2rbHg50l9iCk65/WKjQIUiDGAn3bi
	 6jCKHrh4xyQYu/kHV3wKd995OqNrOK/kFrj9TaeCp57/loKKcXn7ZK0DncF9VdUi7S
	 s1GfVlwYt6PjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: ipq5018: add nodes required
 for Bluetooth support
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260703-ipq5018-bluetooth-v3-5-62da72818ab3@outlook.com>
References: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com>
 <20260703-ipq5018-bluetooth-v3-5-62da72818ab3@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 05:10:33 +0000
Message-Id: <20260703051033.F28241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Adding the 'syscon' compatible string to the 'apcs_glb' node withou=
t updating the device tree binding schema violates the schema and causes dt=
bs_check failures.
--

commit 8f9212782ff3d8470d83aca03720126dc8c3c25b
Author: George Moussalem <george.moussalem@outlook.com>

arm64: dts: qcom: ipq5018: add nodes required for Bluetooth support

This commit adds device tree nodes for the reserved memory carveout and
Bluetooth on the ipq5018 platform. It also modifies the apcs_glb
mailbox node to include "syscon" in its compatible list.

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
                     ^^^^^^^^

[Severity: Low]
Will adding "syscon" here without updating the device tree binding schema
cause a make dtbs_check validation failure?

Looking at Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.=
yaml,
the schema currently restricts the compatible list for this hardware to exa=
ctly
two items:

      - items:
          - enum:
              - qcom,ipq5018-apcs-apps-global
              - qcom,ipq5332-apcs-apps-global
              - qcom,ipq5424-apcs-apps-global
              - qcom,ipq8074-apcs-apps-global
              - qcom,ipq9574-apcs-apps-global
          - const: qcom,ipq6018-apcs-apps-global

Does the yaml binding need to be updated alongside this patch to permit
"syscon" as a third compatible string for this device?

>  			reg =3D <0x0b111000 0x1000>;
>  			#clock-cells =3D <1>;
>  			clocks =3D <&a53pll>, <&xo_board_clk>, <&gcc GPLL0>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-ipq5018-bl=
uetooth-v3-0-62da72818ab3@outlook.com?part=3D5
