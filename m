Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5563E4E1412
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607371; cv=none; b=EWf6X/HTyb1F1n2ghunRFXN+nCS74UhVItiswDc0Txsju/ulePf0aTaqF8ZsNMCaQQdvS84G3TfqDZmiCBs21xL+No+Lg9tZUe9tNV/4BqA3FtHmeG/KDveDEuWamqysX5ABhWQs6ydUPycAwsoc3Wc1pE/NT7DnxYFcVaEfwjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607371; c=relaxed/simple;
	bh=FBvFMVKlYeG7GCnf5eJpAPH8K+KIRu/jwuj2TP51/oQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P+UBp2y0xExBhz+9iUNrkYTs2/JpA501tLw+CGTPfBynt5lxUCKmq7R2cI5LRKWhet33cuYE798qk3XLPeQYtixpYeMYo9PxK/1suK9K4TkZPB2uqe6IgFiwZfZbfoGH8WfUVOuZi1+4PLfUYfWnf+woOZIERVqd2q2ALBllGcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ms21jiUc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ms21jiUc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DF71F000FF;
	Mon, 28 Sep 2026 14:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790607369;
	bh=O9c1BxG4TeNJhJrjiuyaj1z1nBeFoueLHgpf6alEUok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ms21jiUcZyI6p7TstfRyG8pxFe4W7A2+64CQbtsoO0k3fC0dEJrgakbZma+mP4QaT
	 MiflC6ymckKI7RZ11julkcGTQrPcEMrusVjpKOKVbbBgeOn8vBJky/XuhFPMtIFHnh
	 DBI+QbT0t6KGtzPJT9VdQfpdxehv2p5KnW0VmZ+4eoROl5PzEL46PH/Z5fICVHGISY
	 mVf/FOz+xrBZB0enpcZl8dggOOuWzrJYSDoEHePa3pxAwm0992KOVY7S6KJGSQRcQ+
	 LPRxvKi6P5h67D822LThko5u6pZYdg4A5r5kTsmnIT0e1sTtYzxWM36lDS0ohDp+39
	 i0Hvbud2U19pQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 06/11] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260928-rzg2-sr-boards-v9-6-5901e0fc9e44@solid-run.com>
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
 <20260928-rzg2-sr-boards-v9-6-5901e0fc9e44@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 14:56:08 +0000
Message-Id: <20260928145609.96DF71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: missing output-enable property for ET0_TXC pin
--

commit f7d1836ef2ca9d47ba42e92fcf7b8155deac999a
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: renesas: add support for solidrun rzg2lc som and hb-iiot evb

Adds device tree support for the SolidRun RZ/G2LC SoM on the HummingBoard
IIoT carrier board. The SoM features Ethernet, eMMC, DDR, and WiFi/BT,
while the carrier provides additional I/O like USB, RS232/RS485, and DSI.
Descriptions for eMMC, microSD, and RS485 are shared with the G2L variant.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-=
g2lc-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hum=
mingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

> diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi b/arch/arm64/=
boot/dts/renesas/rzg2lc-sr-som.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi

[ ... ]

> +&pinctrl {
> +	eth0_pins: eth0 {
> +		pinmux =3D <RZG2L_PORT_PINMUX(28, 1, 1)>, /* ET0_LINKSTA */
> +			 <RZG2L_PORT_PINMUX(27, 1, 1)>, /* ET0_MDC */
> +			 <RZG2L_PORT_PINMUX(28, 0, 1)>, /* ET0_MDIO */
> +			 <RZG2L_PORT_PINMUX(20, 0, 1)>, /* ET0_TXC */

[Severity: High]
Does this configuration omit the output-enable property needed to drive the
Ethernet MAC-to-PHY TX clock?

The eth0_pins node lumps all Ethernet pins into a single pinmux without
declaring output-enable. When the pinctrl driver processes this, it leaves
the PIN_CFG_OEN bit disabled, meaning the PHY will not receive a transmit
clock and Ethernet transmission could fail.

Would it be better to isolate ET0_TXC into a subnode with output-enable
declared to ensure the clock is driven out by the SoC?

> +			 <RZG2L_PORT_PINMUX(20, 1, 1)>, /* ET0_TX_CTL */
> +			 <RZG2L_PORT_PINMUX(20, 2, 1)>, /* ET0_TXD0 */

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-rzg2-sr-bo=
ards-v9-0-5901e0fc9e44@solid-run.com?part=3D6
