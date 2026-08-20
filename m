Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E64D44065B
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 22:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787264239; cv=none; b=asviWCNspMWGMqnz3orDlE1HRjyhSO5xn7hlUKBhIlRSIvLSkzLxna8G9z1Vo8idqml/jIAyIjb53RFTcXojDwmQfm6pmH05F3gZITvhSI/ETG1qxfObr5VuetTxrdjdBMA4vIrkCFhKeN/xJWoCECLUAjOtXa09M+bo2vH3Ez8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787264239; c=relaxed/simple;
	bh=ooT6pj5inunUpfF1OTI9mDZDPIfQdU5JpPMIDtOqd6Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dZmUqLF0OXY20sHxkhxSv3wocXP+CYW4q6ZbU+Ah2/dNzMyfUO31+6d36c8Or9S762zDhWeyuxYPwLb9AZwy6q2wTnNI/wWKAJIb15FPGpohWULe/HVROvmlmy59Ktn+1tKt2elLg4qdPEW3rQ6sgVcxYkhB+J80aV9BWZZK/3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZN7be6T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZN7be6T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E2F1F000E9;
	Thu, 20 Aug 2026 22:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787264238;
	bh=Ad6jGsYrchRJ+PHKcuL63LYret7S+E1IkOaWLgdHaLU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DZN7be6TS4Nfk0ylM6gCfmpMjoo1O8WJFIZULBKJgaMxhkk411GFA8wRBU7hmuqV9
	 A24H76+eoWTolwaxQ8f5eUjWiMXODfaIwiiAWJkxTLL0BthmA3z6jOOjO6w9sKQ6rX
	 XgrJ60pGV3ExWfw8KrbxUdYaA38BvWQzz88pJnoJ6wzEsxaSzob34fkhuMf7q+38HS
	 FCBsJqhpPoeaY/awobHpSYw8+OPrGxmS4KDKyzkZ+jlKsWvtdfFCUK+PRnA5XRTkuT
	 AEwP2KUEIa7tEoKpofG569bQZO1xSf/XYGjnwI0n+W6cw3nMlzss7Ztl7uwPplyv6S
	 e4MgoLTVUWM3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-am62a7-sk: add out-band-wakeup
 property to m_can devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kendall Willis" <k-willis@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260820-smth-v1-2-e1738a38d58e@ti.com>
References: <20260820-smth-v1-0-e1738a38d58e@ti.com>
 <20260820-smth-v1-2-e1738a38d58e@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 22:17:17 +0000
Message-Id: <20260820221718.00E2F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added `out-band-wakeup` device tree property is not de=
fined in any bindings and is not parsed by any kernel driver or core code.
--

--- Patch [2]: [PATCH 2/4] arm64: dts: ti: k3-am62a7-sk: add out-band-wakeu=
p property to m_can devices ---
commit 19d8465485a156bad59ccde394dc04242bee6cd4
Author: Kendall Willis <k-willis@ti.com>

arm64: dts: ti: k3-am62a7-sk: add out-band-wakeup property to m_can devices

The m_can pins can be a wakeup source in the deepest low power states,
despite being in the MCU domain which is OFF during deeper low power
states. Add the out-band-wakeup property to allow the out_band_wakeup flag
to be enabled during suspend for m_can devices.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dt=
s/ti/k3-am62a7-sk.dts
> index 821a9705bb7d4..27ab51a6f261b 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -906,6 +906,7 @@ AM62AX_IOPAD(0x008, PIN_INPUT, 0) /* (J24) OSPI0_DQS =
*/
>  };
> =20
>  &mcu_mcan0 {
> +	out-band-wakeup;

[Severity: Medium]
Is this new property being parsed by any kernel driver or core code?

Looking through the kernel, there doesn't appear to be any code that reads =
the
"out-band-wakeup" string from the device tree or calls
device_set_out_band_wakeup() based on it. Without corresponding C code to p=
arse
this property, does this addition have any functional effect on the
out_band_wakeup flag during suspend?

>  	pinctrl-names =3D "default", "wakeup";
>  	pinctrl-0 =3D <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default=
>;
>  	pinctrl-1 =3D <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
> @@ -917,6 +918,7 @@ &mcu_mcan0 {
>  };
> =20
>  &mcu_mcan1 {
> +	out-band-wakeup;

[Severity: Medium]
Same question here, does the kernel currently consume this property for
mcu_mcan1 to enable the wakeup functionality described in the commit messag=
e?

>  	pinctrl-names =3D "default", "wakeup";
>  	pinctrl-0 =3D <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_default=
>;
>  	pinctrl-1 =3D <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-smth-v1-0-=
e1738a38d58e@ti.com?part=3D2
