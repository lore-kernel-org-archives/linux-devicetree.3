Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803A73BB12D
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582589; cv=none; b=FKknCyI7qtOC3KZ+NANe9lqZhmuMfe1Kk0Ized4k2U6Zm0YawqI8cLaLT9Y5vDDqI3hzONPygg5qkxQupFVyosZAzcys/DSTgHAqevbuf8h+luRKzS/tO85v0LA5XB6fGB2luE2zZNFR5X1M7JmRB7sfVMYolNwiFcjwia+iouQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582589; c=relaxed/simple;
	bh=fRKi15HRETkEEHoiKSyHzxvySseZX5zy1Ts6Fc6IzjQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i1S0BWBcMdyAdJd8uITZ/+utD/K76e6SR+MtJ1C2vsJ6mSmVmUmyBfAUORKPS9GCIKF7p5GaeuYurZkrpTvdlzAWLuLn5NuQHJlSPwHQGBKle0p19an8x5mnMKNJ8VY624P+7FSzveSy0oIhU+J3R1Jg41vYSzE9gjQR3gT9Dbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSryHTgC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSryHTgC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4841F000FF;
	Mon, 28 Sep 2026 08:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790582586;
	bh=7Bl0ZR239Y0uvOe6TFm3SnlLTVB/9d7ffL3GmZu1hNs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dSryHTgCKxCM2T5tRbatMsq5hrqIkQzW6XZnXj2VxKPs4hdaUVDpUIB4Xs2pDnO4J
	 ZaDmasGZc5Pdo1A5jGZC2wmt0njXkyBb702d4vKnqGdALvIEi7YDrhaSEcnEl2+qLt
	 +z9F2pFir/WlVqKMecqr6Jv2vEZ/4Drg9nfpLhm+POcZvILPEocrd1IssAuopVMav4
	 6s4e0to2avu+NgAsHrX7siHok7tZptnDgKlaK2Z6RzC5oGW6WViC8QQTEflogTtA0U
	 yjLPn36ch81Qmlmuc76DCktCycD9IObepOqLK1beZ2upHBhVGlxvLSW1KLzF0z+M/O
	 oSyNorEmuloYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: media: i2c: Add Samsung S5KJN5
 image sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260928-sk5jn5-v5-1-19aa0a0a68eb@oss.qualcomm.com>
References: <20260928-sk5jn5-v5-0-19aa0a0a68eb@oss.qualcomm.com>
 <20260928-sk5jn5-v5-1-19aa0a0a68eb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 08:03:05 +0000
Message-Id: <20260928080305.AF4841F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing mandatory power supplies in required list
--

commit 63cf73956886cfb3305c7baa8bae6357815e024b
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

dt-bindings: media: i2c: Add Samsung S5KJN5 image sensor

Add device tree bindings for the Samsung S5KJN5, a 50 MP 10-bit RAW
MIPI CSI-2 image sensor controlled over CCI.

> diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.y=
aml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
> new file mode 100644
> index 0000000000000..fedb274679cd1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
[ ... ]
> +  vddio-supply:
> +    description:
> +      1.8 volt I/O voltage supply (VDD18). Required for both 1.8 and 1.2=
 volt
> +      I/O operation.
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port

[Severity: Low]
Should vddio-supply and the other core power supplies be included in this
required list?

The property definition for vddio-supply explicitly notes that it is requir=
ed
for I/O operation. Omitting these mandatory hardware supplies from the requ=
ired
list causes schema validation to be overly permissive.

If a device tree node is written without specifying vddio-supply, vddd-supp=
ly,
vddm-supply, or vdda-supply, it will silently pass validation. This can cau=
se
initialization failures at runtime when the driver attempts to request them.

> +
> +unevaluatedProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-sk5jn5-v5-=
0-19aa0a0a68eb@oss.qualcomm.com?part=3D1
