Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE26357D00
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 07:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384899; cv=none; b=BVIhsUVt1/iNbOhMqaPomR1fya4TfPCewn1WdDJFYwpsQSKj4Z4I1iPvl01AyG5w3GaS57B/gixJmVIBqtGE56f72DmscYwwcVIjmcjoVYsFSEjDwMIeAxxpBRxD8bIURBE2v4KflLmwMKvll/+EqVS8i1im+Cb0pp5WS4rWooI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384899; c=relaxed/simple;
	bh=cjrLxYchXQcPaQHM+Lhvu4F3VSXGLC1m0zZkgygJxJc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ht+hS8KicquLXJXfncC2lwe9hCfXCV4ee9WBvYXEFRhVEtyCFUwd2DvVByVcS+2M+VenT9voDtv+qgi8C+iuJQb8PR/uYFXORmJlw0R3hZ4G4zRGmrHozyE/iDvCKN4FLp6wMTzCRlHlLtKAXDTaZ0TLTgHFCXqRchxjaE8SQGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DTyASTVJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DTyASTVJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794E61F00893;
	Tue,  2 Jun 2026 07:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780384897;
	bh=7alHm+0pNGEnvuuOF36yE/uoKtsAm/tnoACStuqp38k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DTyASTVJ1KDsnuIWvUxXrhR467RmOqPb4uXOzPUTw1oSejHX2KoNruklxEZlh+0Tc
	 cQodU9dd3Rwmx2J+yoAlv0Bh7Ts1qwBZhqr16xc3QKC8mSOQ7Sqsf6oOCH7oz72cTK
	 SQZKE8gDv4rmuHR5JbeXLRiD4sr8YzZUKe3FlF2Q/DEOLJ4y4K7Fki4HJCP26xwgyr
	 7Ek1YvmpU8qfeV4fDsv99ZuLKHsVWWJR+xKMV97TQJU7uDoHDXj6INYomS2icrASk0
	 5/qB8uvRmdFyD91iXehCC7FYQgOErtvyEVY1ePrFTz7zfptC+R6Czms6GR0l2P6qjC
	 MGSowxt5EHnzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add
 QCNFA725B support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qian Zhang" <qian.zhang@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260602070530.4194262-1-qian.zhang@oss.qualcomm.com>
References: <20260602070530.4194262-1-qian.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 07:21:37 +0000
Message-Id: <20260602072137.794E61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `shutdown-gpios` polarity in the `wlan-rfkill` node is logical=
ly inverted, permanently disabling the WLAN radio during normal operation.
--

commit c96c608f286f34bcc2c474aeeb078a7d4cf17161
Author: Qian Zhang <qian.zhang@oss.qualcomm.com>

arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support

This commit adds support for the QCNFA725B M.2 module on the Arduino VENTUN=
O Q
board. It models the W_DISABLE# line using rfkill-gpio and handles the modu=
le
power supply routing through the PMCA6850 PMIC.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm=
64/boot/dts/qcom/monaco-arduino-monza.dts
> index ca14f0ea4dae6..b90397c7000e3 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -153,6 +153,78 @@ vreg_nvme: regulator-3p3-m2 {
>  		enable-active-high;
>  		startup-delay-us =3D <20000>;
>  	};
> +
> +	wlan-rfkill {
> +		compatible =3D "rfkill-gpio";
> +		label =3D "wlan";
> +		radio-type =3D "wlan";
> +		shutdown-gpios =3D <&tlmm 54 GPIO_ACTIVE_LOW>;

[Severity: High]
The commit message states that pulling GPIO54 low disables the transmitter
at the hardware level.

Since the rfkill-gpio driver treats shutdown-gpios as an active enable
signal, won't setting this to GPIO_ACTIVE_LOW cause the driver to physically
drive the pin low when the radio is supposed to be unblocked?

When the radio is unblocked, the driver asserts the GPIO logically. Because
the device tree defines the pin as active low, a logical 1 translates to a
physical 0. This would disable the radio during normal operation and enable
it during airplane mode.

Should this polarity be specified as GPIO_ACTIVE_HIGH instead?

> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&wlrfkill_default_state>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602070530.4194=
262-1-qian.zhang@oss.qualcomm.com?part=3D1
