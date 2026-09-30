Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC83739E6CD
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 08:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756001; cv=none; b=OoWdtPb73VdOWKamtmlVA/ZEOIyTC+rxpCr4hGLJfCnfaqBqnTEFWsKX+JmwLwEjxm1qjCiKRvEGGwrAAzXqTDvtwFI+vgoE7V4XW6dGZRo3xizuNVbTd1H8zTERKQb2f21osgEBS/w8YYBfN8Xds/Yc1/fWjGIfeR/979AVg0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756001; c=relaxed/simple;
	bh=bqNqVJmequWBp2MQp+CAuar8XWbfHfvrrZy2KDV5hSk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PNqxwONQ0dsQwAoBJKSWajMe6Ub3cr4b95alqXzeTyHWDybnuEPu49MjMZDIeXhCBqSb760Uv4IKQT4usNCe8BWyONiMLykoO/tVY8RfAQ+v/2LCKAIIc/W2IRVFSZVINgOeiEVrRJDZfPfPcYNnXAS4Wk8ETN/p4cWPy/Dbn+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYEZhYYU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYEZhYYU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C231F000FF;
	Wed, 30 Sep 2026 08:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790756000;
	bh=FGrgapIcc2Cg+pwFSw99X097qS/bOtkFy09+pLBS+/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cYEZhYYUKYpapHNXTbg8Imz7Jw5tEd98mlIonbBgF565j3WcLBVRAoxYpoouea7D4
	 FZDMrFh/0JTxNdflqUpyCs983YfIoe/ZO6Y5u8Cry9/jI8HfdDCGwJx1hPdX2pvrwd
	 jvr2QqB0k+EUw/nTNs09tK7qL0ZFCtyNar0HtShzJALaNgNDtBmaQ7CCADArXz+LAa
	 t+Rc1T/VIErkUfqg9fiFCea1GfuSLQeJVU+f0PBEl22W24LoVTZyF4ZU9K9EB5vAUH
	 pxKsUTPYw+oZ+9ejEmBbTBb/PHZBmtZVIQ9OhYHlaKfYArKWBudAWLh8wN2GpTauUf
	 7Dok7W29Moa6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: media: i2c: Add Samsung S5KJN5
 image sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260930-sk5jn5-v6-1-517c9b34008a@oss.qualcomm.com>
References: <20260930-sk5jn5-v6-0-517c9b34008a@oss.qualcomm.com>
 <20260930-sk5jn5-v6-1-517c9b34008a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 08:13:19 +0000
Message-Id: <20260930081320.02C231F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing vddio-supply in required array
--

commit da52fd45ecb4a0907c160f92eb2fa19fe81352bd
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

dt-bindings: media: i2c: Add Samsung S5KJN5 image sensor

This commit adds device tree bindings for the Samsung S5KJN5, a 50 MP 10-bit
RAW MIPI CSI-2 image sensor controlled over CCI.

> diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.y=
aml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
> new file mode 100644
> index 0000000000000..fedb274679cd1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
[ ... ]
> +properties:
[ ... ]
> +  vddio-supply:
> +    description:
> +      1.8 volt I/O voltage supply (VDD18). Required for both 1.8 and 1.2=
 volt
> +      I/O operation.
> +
> +  vddd-supply:
> +    description: Digital core voltage supply, 1.0 volts.
[ ... ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port

[Severity: Low]
Should vddio-supply be included in this required list?

The property description for vddio-supply explicitly states it is required
for both 1.8 and 1.2 volt I/O operation, but omitting it from the required
array allows incomplete device trees to silently pass schema validation.

Are other core voltages like vdda-supply and vddd-supply also strictly
required for operation and missing from this list?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-sk5jn5-v6-=
0-517c9b34008a@oss.qualcomm.com?part=3D1
