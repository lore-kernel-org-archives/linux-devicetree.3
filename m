Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F198003D
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 17:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778349153; cv=none; b=aRusncHGE0546F2B+M7aVcsc1ZAvEiWzjjfQIGVaSwQA78fMBBgMWEjLgA1hlyYzb/snhWjMZZDsS9lX5DvsZ4l0KhkF/rHmCLKw5fmTMQG5tIni94ax+TzF4yrNtYjdfnNdmLpl/YBF/QSmpoDQeOp/Nr2rk82CM6PtCOc1IDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778349153; c=relaxed/simple;
	bh=AZyDvBuieCUAg9ZV7RUGRR/29k1YyhI66Zsuo7vNF9k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EGRPBLANJ2Z1uJWRyzPBZsJ2lNpEpl0LyY5bqrmD5TO9XwYcxE0+mwCdzh25DQS5Sqp+3Sf/W9ZrGkecybi8k07Z70t1MF5EhEj26qZHN0+iKDUpxz65feb9ZWg+deesNE8lsaCaAAw4X8xIOmKXJ/0gmAtEyXDJvnNN0ijzD/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJkUInu3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJkUInu3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E78BC2BCB2;
	Sat,  9 May 2026 17:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778349152;
	bh=AZyDvBuieCUAg9ZV7RUGRR/29k1YyhI66Zsuo7vNF9k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=eJkUInu3NCqYtBDN8jswnXWXaIAs2MClsKz8UZ6Y8yRmMDyWbxYOY3poX9F8YWZmR
	 EoVnGR5g1vrg50X8qOHr2YoPGgLVSdAPb7JNgKHqPyX1+n0gUV8juI3o/JSmowo+iP
	 T71kCJ10BXpHDBxronUt6qyjijs7J+tCtjq0BU2cdB4QV3guC0+PbDZb3qPcnkRxxB
	 QuWsrjr2XrLZ+O1Z2pszq4S6Z6fHtp/8MpjGoFH6ySTLS6XbjoxZFl+CrjlI3dJr2s
	 9QTZY/18fimDTp2Bo/C3+Mz2ZKdAT79s8k8KcQA7iTFuGLUDU7Z3t9fzeyT4QxhgfK
	 lBagUufXUK6aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: Convert xilinx-xadc bindings to
 YAML schema
Reply-To: sashiko@lists.linux.dev
To: "Pramod Maurya" <pramod.nexgen@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260509171453.45844-1-pramod.nexgen@gmail.com>
References: <20260509171453.45844-1-pramod.nexgen@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 17:52:31 +0000
Message-Id: <20260509175232.4E78BC2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incorrect regex for `patternProperties` matching channel unit ad=
dresses (expects decimal instead of hex).
- [Medium] Missing conditional schema validation for `xlnx,external-mux-cha=
nnel`.
--

commit 9cb917c448e17a8e4cd03c2b0f448fe1debfc5c0
Author: Pramod Maurya <pramod.nexgen@gmail.com>

dt-bindings: iio: adc: Convert xilinx-xadc bindings to YAML schema

This commit converts the Xilinx XADC and UltraScale System Monitor device
tree binding from the legacy plain-text format to a YAML schema, enabling
automated validation with dt-schema.

> diff --git a/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml b/D=
ocumentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
> new file mode 100644
> index 0000000000000..86bdc4920cdbf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
> @@ -0,0 +1,191 @@
[ ... ]
> +  xlnx,external-mux:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: |
> +      Selects the external multiplexer mode.
> +    enum:
> +      - none
> +      - single
> +      - dual
> +
> +  xlnx,external-mux-channel:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Configures which pair of pins is used to sample data in external
> +      multiplexer mode. This property is required when the device is
> +      configured for external multiplexer mode.

The description mentions this property is required when the device is
configured for external multiplexer mode (e.g., when xlnx,external-mux is
set to "single" or "dual").

Should the schema enforce this dynamically using an allOf -> if/then block?

Without conditional enforcement, device trees that enable the external
multiplexer but omit the required channel configuration might silently pass
automated dt-schema validation.

[ ... ]
> +  xlnx,channels:
> +    type: object
> +    description:
> +      List of external channels connected to the ADC. If this property is
> +      absent, no external channels are assumed to be connected.
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      "^channel@([0-9]|1[0-6])$":
> +        type: object
> +        description:

Device tree unit addresses must be formatted as lowercase hexadecimal.
A reg value of 10-15 corresponds to the unit addresses @a through @f.

Does this regex expect decimal numbers instead? If so, it might incorrectly
reject valid hexadecimal unit addresses like channel@a through channel@f,
and erroneously allow channel@16 (which corresponds to a reg of 22).

Should this regex be updated to match hex values instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509171453.4584=
4-1-pramod.nexgen@gmail.com?part=3D1
