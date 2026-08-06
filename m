Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575D534E766
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 22:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054843; cv=none; b=TF/e6mlEqeuLitPnFYPXhBmS1c8QxqmHcgiqERsoey7KTXPA8k8qKA8snPcpHPWQmHhKfF2MqEsF7GNQT79WkFK/DpyZEHbcpLYuBpiM1yPBSfHNDh0XMc+UZfO5TCCvL1UmHlJfHbYLmHQI9xOMvwpmUIPvgsVNSvf6uiNjaUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054843; c=relaxed/simple;
	bh=M4vWcFD4YQct4QFN67CFc/Or3orjqJwgZJwvC/E48gM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S6mh/4GwEl/M8pN/pnBdFD2cLMKQZaxzWxwYKqVU4wnQc0M7bpFgbY8XFxtmJehFp3KvDRnnLXCMOkwg9socUvWC1EzEEumCfPM/L2dXnA9Vv7a+JX7mdQzaA0c6Ez4dxfLHSL8uGUI2j2vSOVQyY9AwOdzXKleriILexqFYhjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ek/InbIs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ek/InbIs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A621F000E9;
	Thu,  6 Aug 2026 22:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786054842;
	bh=WQqCX6YAJJc1wN4XmKGxlqL9HK0fPJ0rAl9ITmIFBZ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ek/InbIsRPiL1/1XnQF8DKYV+xNSQ9RxF6U6Wz5KSunigEzLu9euO2acq6vbGQRqy
	 +Q2A1Dcv0xZusv0GtKo5CffDn7VZJxof20uJezYMh7EVLMEp3yZTNTgpc/2RuIrDYl
	 2WS03g3JYNVJV5hoOZhWBMVvVAxAKrhALO79PHgwKS8g4G+6R/isrRpKRTG5GHExi3
	 6g/bMbnYa1G0Leavq5bnmn8Hmqj7+JZuTw8oTilq+s2EXxdGKdwkYeNTwEGoFPn8TZ
	 K3pbqY0dQw4DuKJR7kJsKmonZ/G6yo5p51767AY6X4CGzIVsAEiR3uOQ11xKlAUAaD
	 WU8rimzgIBHAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 11/37] dt-bindings: pinctrl: airoha: an7583: add
 i2c0 group for i2c function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806220615.4078303-12-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <20260806220615.4078303-12-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:20:41 +0000
Message-Id: <20260806222041.B2A621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch adds the 'i2c0' group to the 'i2c' function in the dt-=
binding, and the commit message claims to 'add mux to force enable i2c0 bus=
', but the corresponding pinctrl driver changes are missing. As a result, i=
f a device tree uses `groups =3D "i2c0"` with `function =3D "i2c"`, the pin=
ctrl framework will reject it because the driver lacks the mapping to accep=
t 'i2c0' as a valid group for the 'i2c' function.
--

--- Patch [11]: [PATCH v11 11/37] dt-bindings: pinctrl: airoha: an7583: add=
 i2c0 group for i2c function ---
commit d3e9c23e02c56f531e4cd4f03dc53d38958eaaea
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

dt-bindings: pinctrl: airoha: an7583: add i2c0 group for i2c function

This commit updates the device tree binding for the Airoha AN7583 pinctrl
controller to allow the i2c0 group under the i2c function.

> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.=
yaml
> index 3e680c997fe26..24f1ac60eea84 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> @@ -124,7 +124,7 @@ patternProperties:
>              then:
>                properties:
>                  groups:
> -                  enum: [i2c1]
> +                  enum: [i2c0, i2c1]
                  ^^^^

[Severity: Medium]
Is there a missing accompanying driver update to support this newly added
group?

If a device tree is updated to use groups =3D "i2c0" with function =3D "i2c=
", won't
the pinctrl framework reject it because the driver only maps i2c1?

Looking at drivers/pinctrl/airoha/pinctrl-airoha.c, the i2c function appears
to hardcode only the i2c1 group:

drivers/pinctrl/airoha/pinctrl-airoha.c:i2c_groups
static const char *const i2c_groups[] =3D { "i2c1" };

The register mapping for i2c0 also appears to be missing from the
associated function group array:

drivers/pinctrl/airoha/pinctrl-airoha.c:i2c_func_group
static const struct airoha_pinctrl_func_group i2c_func_group[] =3D {
	{
		.name =3D "i2c1",
        ...

Will the driver also be patched so that i2c_func_group and i2c_groups know
how to handle i2c0?

>            - if:
>                properties:
>                  function:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806220615.4078=
303-1-mikhail.kshevetskiy@iopsys.eu?part=3D11
