Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8D4471D04
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249808; cv=none; b=nT3DCL6ivsYCx9HUgtjkpYRPfi3MYve70aJ1IJO6le6Vm8ObbMSBGWwoN1VTRCG1wgsnStNJTx+3cRTpoXuVDBAgQzVQHm+W3NC2iKu6NU6jJCVaTLYamYeiRzOKSdAJxmPOuM1Pqt7rYXBv3M+G6IfkWRqiywlNArwMOHhTKi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249808; c=relaxed/simple;
	bh=prhW1xlCzcFF0QgII5uxoF0RRTvi8Tzz6G26Y5joqDU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NzOGGSKJ5tC6YaURONSHTEpnML1qAqhFMrSXt5edcuZ8t7hjnaSNMtJKq6IuwiKNqfjkxnBU9bRAV2XI+EsuLoYdPbWYpfY5l1t5xauowcd8TJo2XgNzpgS8zhq4jpP6oMVdCwRQL1RxRLkIAJw2YsDO9zACUjca2s6dgXaBa3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ck3KZCGb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ck3KZCGb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A22A1F000E9;
	Tue,  1 Sep 2026 08:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788249805;
	bh=QzXruV8CaxdOV7nV77ZI3qbQe+pjX5mA9UgaH8eoiEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ck3KZCGbUWkJxHu3xX3rnwSPXp2kpNLHYC1D138JKAenwTpCztTKNfpbB1xiB7qDx
	 rzd+Vk86nMhzuqLAaTsDOLp+oUxrL/Ja/Kg6/ZyOq+wuJSZ+VIMmANrn78A/8MXfIN
	 XRk8rtXmcTqO2ZMReFlX3v8q8X3uk2TJtKZU+OLtJ+gD25gTIzUhv4mniDQuaFO4fw
	 Z+cgFp9OXtOiBwHuKeHuwTErNqbePDyflomVUj0498+bJ7NuykgtVtEjZgrmKQBm7p
	 bsu25XBLuot4rX/GL4nvI4jD3dDtvbo3k2yRj7ZRWa1UKnDhO67V5qCVhlyUA+FW9o
	 LSUZYq10TxJMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v3 1/2] dt-bindings: media: i2c: Add Samsung
 S5KJN5 image sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260901-sk5jn5-v3-1-17e728917bd4@oss.qualcomm.com>
References: <20260901-sk5jn5-v3-0-17e728917bd4@oss.qualcomm.com>
 <20260901-sk5jn5-v3-1-17e728917bd4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 08:03:25 +0000
Message-Id: <20260901080325.7A22A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Mandatory power supplies are omitted from the 'required' list.
--

commit b2a07d6873604e9daaa63bfab639ae1468786baf
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

dt-bindings: media: i2c: Add Samsung S5KJN5 image sensor

This commit adds the device tree binding schema for the Samsung S5KJN5, a
50MP 10-bit RAW MIPI CSI-2 image sensor controlled via I2C.

> diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.y=
aml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
> new file mode 100644
> index 0000000000000..fedb274679cd1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
[ ... ]
> +        required:
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port

[Severity: Medium]
Should the mandatory power supplies be explicitly included in this required=
=20
list?=20

The properties block earlier in the schema defines vddio-supply, vdda-suppl=
y,
vddm-supply, and vddd-supply. By omitting them from the required list,=20
dt_binding_check will incorrectly pass device tree nodes that miss these=20
physically required hardware power supplies. This allows incomplete hardwar=
e=20
descriptions to be accepted, which can cause the driver to fail during prob=
e=20
or rely on dummy regulators, thereby breaking proper power management.

> +
> +unevaluatedProperties: false
> +
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-sk5jn5-v3-=
0-17e728917bd4@oss.qualcomm.com?part=3D1
