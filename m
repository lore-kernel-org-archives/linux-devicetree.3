Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA843998A6
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 20:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785442367; cv=none; b=k58exmaKDAb6Zp+aLToUY6/7hsTXZOnDZ4E1gDQblzHa9pj8+u46ndhR1FcMv7TcV0VlhI7yxUCiV03HYJvuYSKeEuajTiQRXhexYmjEQ/2TZspHlzFj9KvgdEott2UveNMpemcf0+AzMqvtDogLbG759bzIz5GYSRMqFKPmuYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785442367; c=relaxed/simple;
	bh=hDq2xAUAvxBKl/+oAZ/NB8jOcbUppStci2h71DvFiFc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CA+mmGoWmW6HRCSkTEapygtRwzwPL9va5pfXe+bW2blZCxQDv8ncwPEwhN5IJM0NDdqMs3sbIS6OZ5wFII0OZGBA4PBYIQt2DV85Vc38AzgEE7HD2zkXfmu9MKDjyJ86gVNI2sN/zNVxAPdnhpLiBMu0My14k6H0Y9oyGCvUgLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEKZT/3f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEKZT/3f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F13D1F000E9;
	Thu, 30 Jul 2026 20:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785442362;
	bh=zqxGpbvsFMbz911YWos+/Ys+qYAXwX1Lb1iyA+kxu9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mEKZT/3fMAn6wo48FnNAWAE3WsZOceUiyKgiZIn1I1rHNZ1B+vEGGyIieBoijS3ag
	 IeuLJ955XbuDAKuwNHD109Ioo27Rw0P/OlBJtg7bUqMW1eo33RFtWNXApRM5lB0X9j
	 eIMmK8yguMN2AL10ReCzZAOtYC8I0Vyw/MSMRkpIOdoQx8YvCeiVqELft1eLMFF9Gk
	 9abGo4RfvkMRD8acLc0M+7K8ghErd/aMft+aUwOtwllsb61WAuwYSZPjfozKO2kY37
	 JcHimeyFTYAd+lZvl8khozCkOdhGU/dQk+mGZliqLCoYlHj4Buf+YcZI5hMVTml0Gl
	 RZUdBMj4Jjigw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: proximity: add Sharp GP2AP070S
 proximity sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731-gp2ap070s-v3-1-d1f5cecf9fe7@disroot.org>
References: <20260731-gp2ap070s-v3-0-d1f5cecf9fe7@disroot.org>
 <20260731-gp2ap070s-v3-1-d1f5cecf9fe7@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 20:12:41 +0000
Message-Id: <20260730201242.0F13D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `vled-supply` property is missing from the `required` list, =
despite the hardware requiring it for core functionality.
--

--- Patch [1]: [PATCH v3 1/3] dt-bindings: iio: proximity: add Sharp GP2AP0=
70S proximity sensor ---
commit a5f76b868834c635a43cd3859fdfeb8667e96336
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

dt-bindings: iio: proximity: add Sharp GP2AP070S proximity sensor

This commit introduces the device tree binding for the Sharp GP2AP070S
proximity sensor. The sensor expects two voltage supplies, one for the
core and one for the infrared LED.

> diff --git a/Documentation/devicetree/bindings/iio/proximity/sharp,gp2ap0=
70s.yaml b/Documentation/devicetree/bindings/iio/proximity/sharp,gp2ap070s.=
yaml
> new file mode 100644
> index 0000000000000..73f0abc1f09cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/proximity/sharp,gp2ap070s.yaml

[ ... ]

> +  vdd-supply:
> +    description: Voltage supply for the internal circuitry
> +
> +  vled-supply:
> +    description: Voltage supply for the IR LED
> +
> +  proximity-near-level: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - vdd-supply

[Severity: Medium]
Since the commit message indicates the hardware expects two voltage supplie=
s,
should vled-supply also be included in this required list?

Without it, device trees missing the vled-supply property will silently pass
schema validation, which could lead to incomplete configurations.

> +
> +additionalProperties: false

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-gp2ap070s-=
v3-0-d1f5cecf9fe7@disroot.org?part=3D1
