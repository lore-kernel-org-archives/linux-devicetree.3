Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717DE382F26
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 18:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941711; cv=none; b=sQpd5frxO4pwzW8zPU5jgXB+flMyC1CT7K7y50R0OCfpLRdvt3t9eDP9WDGZJtXhJZgEvVucuOZSWvK9DEBzYU/yOb6RCO2P1DVtBon5Efnx5TQiyAVFXwC6NkbZ2wupXpX2a/lTHjwHMxRUTxTp7E4TKo/XVyeve6ubJAYWbYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941711; c=relaxed/simple;
	bh=WqAeGDhbNPUO3fAO9A8wZzlTV70wUxa+W3WaPbqrQo0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s9badrbJf/9z2hySxFY3trPx7mbKa7/hQkXic1+BjtQLKJKQd8YQboNL8Ht7N1lUZKi+AtC+8mnqcIIWoE3Z1m5OWUqMn4ottZsExuu//Fwf+V0YVf/h1IY2m6e9oEdKQUAP/t0wH7TMVt46Q015VZ5m4loqMJxP8EuOaRzkQ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XsDJkNhK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XsDJkNhK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F211F00898;
	Mon,  8 Jun 2026 18:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780941710;
	bh=uYBSA22+LPbfxfLtWkAIkjmgm+FuAmxxrjESY8JVKw4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XsDJkNhK9GhoA8EsdoDcA+3tHff4v0x64v/fLCzOJ0zVp6kiRGQqJvEmC4W0Dl+51
	 TndefWP7AwhCn8oxCPoLGvmAOf6PqmEsb7v8sqvNEyCtV3pkCWdhUZmpGlNAcI9EMr
	 7N5Gb031inVgoLgNk3LpqW0qPNqj+m8Kx/vmz2WrBCayMSbj3pcjzDQT3V3ccK43q+
	 VmPB4gfSWoyo6a0Jcg2PpHVjUKlCTM0PPv5fkeYCoJ369KFyjVGqCkumP82miSm9jN
	 wxZ0YdSO8KgHl85Kj2ybKWP+zkqMoS79pvKvLLdySZ7+boSlrfeDZ0uUjKUeUtRkSV
	 J8dMTzFCvxixw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: soundwire: qcom: add
 qcom,swr-master-ee-val property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260608175345.3118060-2-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608175345.3118060-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 18:01:48 +0000
Message-Id: <20260608180149.54F211F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Type mismatch for `qcom,swr-master-ee-val` between DT schema and=
 driver implementation.
--

commit 7965a5220d8aca5065e58f8f961b8e06d1246a70
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

dt-bindings: soundwire: qcom: add qcom,swr-master-ee-val property

This commit adds documentation for the qcom,swr-master-ee-val Device Tree
property used by Qualcomm SoundWire masters to describe the execution
environment value for interrupt routing.

> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.y=
aml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> index 9447a2f371b56..5b06cc1a5f781 100644
> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> @@ -215,6 +215,12 @@ properties:
>            maximum: 4
>          - const: 0xff
> =20
> +  qcom,swr-master-ee-val:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array

[Severity: Medium]
Should this property be defined as a uint32 type rather than a uint8-array?

In the qcom SoundWire driver, this property is read using
of_property_read_u32():

drivers/soundwire/qcom.c:qcom_swrm_probe() {
    ...
    ret =3D of_property_read_u32(dev->of_node, "qcom,swr-master-ee-val", &c=
trl->ee);
    ...
}

If a device tree strictly follows the schema and specifies a byte array
such as /bits/ 8 <1>;, will the driver fail to parse it with
of_property_read_u32() due to the length being less than 4 bytes?

This might cause the driver to silently ignore the property and fall back to
incorrect execution environment defaults, potentially breaking SoundWire
functionality.=20

Conversely, if a device tree specifies a 32-bit integer like <1> to work at
runtime, won't it fail dtbs_check validation?

> +    description:
> +      Execution-environment value used to route SoundWire master
> +      interrupts to CPU0 or CPU1.
> +
>    label:
>      maxItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608175345.3118=
060-1-mohammad.rafi.shaik@oss.qualcomm.com?part=3D1
