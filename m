Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B8342F700
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 22:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786055198; cv=none; b=JTIGgF20/LhlOMjt71sgXkSMG6Pn7iFZ+QYL5KfyoGipCYsgl3KeKw6cNVNL5dm1hkDQoDSSB5l6ZpQVM4rBSCSqDiuHIIWqeHUnShzrJC1mLUewTUcpu852c8j4LABwmXnQBae8t5gyKvV+8sIUIB42zqD9WeeWdO9VENnDPmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786055198; c=relaxed/simple;
	bh=hUyfI3u4jwllhVTj7wrNQr+er3ei9sRJ1lw/Qfj3tqY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M2Q42xteJV+3xOk9Ebb9iBUduPQ/hlOScBsNG2R4F7Tc7NP79CZjVLy8hd/jwLtc93Ln2NFJ1HL25mI0itSOO8XiFEIbABNY9PLmaIqb4FzO20oSc9q3NsNHbI8OqMv2gSFZNnoKJndih2mhW/HDZSUdkw41cfA2n0eHSdnIEa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byVXkuE0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byVXkuE0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3981C1F000E9;
	Thu,  6 Aug 2026 22:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786055192;
	bh=ZyTdoq9UcHimKBUjJtUhpxOY79/WHiYPNh5v59TqvcY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=byVXkuE0RgdCbMQoJLtR3E3kPInP8R9Tb/LM9/hxhEI9OyZsjH+M4wKfO0G5WP+hW
	 5HkbBy5fwRhQEuD450raCiHj+bs+u9FcUeRFvJsA3Z4EhvIZTq3HiljDiZ8LnmWCtC
	 k8sZ4CJbfuPAYxV57R8Syh3KLeYI97PVbpTT9VIQ1G0U+xDqK0NbE3Cjr8GB/30AQG
	 EMizfofHAO+WmoP9olHOZ6XQ3QHxJDQXBYiRfmgOcxuCYt8+xgHcQx5dYKdDC1dzDf
	 +8J+1jZ5Mritt8jWMtCGyuvbBo3c/4HI2TvGGamD6hwhuI7db1CK9FFeCHgNNIJzvK
	 0nQViEHmFQbTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 29/37] dt-bindings: pinctrl: airoha: an7583: add
 missed features
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806220615.4078303-30-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <20260806220615.4078303-30-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:26:31 +0000
Message-Id: <20260806222632.3981C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing driver implementation for newly bound pinctrl groups and=
 functions (olt, pon_alt, npu_uart).
--

--- Patch [29]: [PATCH v11 29/37] dt-bindings: pinctrl: airoha: an7583: add=
 missed features ---
commit 0673f3e27d073f9daecb09cc39535f93b1b052ef
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

dt-bindings: pinctrl: airoha: an7583: add missed features

This commit adds missing pin-group and pin-function features to the
airoha,an7583-pinctrl device tree binding. Specifically, it adds support
for npu_uart, pon_alt, and olt pin muxing.

> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.=
yaml
> index 24f1ac60eea84..aad2e9880ec6c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml

[ ... ]

> @@ -81,7 +81,15 @@ patternProperties:
>              then:
>                properties:
>                  groups:
> -                  enum: [pon]
> +                  enum: [pon, pon_alt]
> +          - if:
> +              properties:
> +                function:
> +                  const: olt
> +            then:
> +              properties:
> +                groups:
> +                  enum: [olt]

[Severity: Medium]
Will this require a corresponding update to the driver? The driver at
drivers/pinctrl/airoha/pinctrl-an7583.c does not appear to implement the
olt and pon_alt pin definitions, group definitions, or function mappings.

If a device tree node configures these new mux settings, could this cause a
regression where the pinctrl core fails to find the mapping in the driver's
function array and returns -EINVAL during mux setup?

>            - if:
>                properties:
>                  function:
> @@ -115,7 +123,7 @@ patternProperties:
>                  groups:
>                    items:
>                      enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
> -                           uart4, uart5]
> +                           uart4, uart5, npu_uart]

[Severity: Medium]
Is npu_uart fully implemented in the driver? Looking at pinctrl-an7583.c,
the npu_uart group is defined in the driver's pin array but appears to be
omitted from uart_groups and uart_func_group:

drivers/pinctrl/airoha/pinctrl-an7583.c:uart_func_group[] {
        .name =3D "uart2",
        ...
}

Without this mapping, could this cause a regression where the driver fails =
to
configure the uart function for the npu_uart group when
airoha_pinmux_set_mux() is called?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806220615.4078=
303-1-mikhail.kshevetskiy@iopsys.eu?part=3D29
