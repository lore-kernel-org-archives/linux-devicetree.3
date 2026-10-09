Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5750E455608
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 11:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543968; cv=none; b=Iiw6VJgVzhep8rL81tfPULLM9xxOtOaayL71JcWwfyQVE67rWMQtkWvepCktyh0zM56jdXQ2NAAxqHJOPv2+CZ8g+iVEQBhN2/po5r2wWfC3mYHDN19fDutLRLiWHnaFMHCq6qzSMDdMTT8NhBduSQ2ajpM0Hrf6xREshJkL7uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543968; c=relaxed/simple;
	bh=Dt9E/2xrfBEYurTtJ5xIlrhDV8kXIhLjM6xN5rJzzQg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fkGFFDQMjb+lQHciJYRxMUZ+ffoT0wrG8dhuq9vd7UO46sENPSvp8RPJfvSeH05RbtIZRijWEeVi/B1rqv1C7qjoZ6cIuTRKzD4jtsmpdhUQZ5Q8K3XpiwX66swCMOvSsWtBOBEZndb8bC7X+nPVn7M01Vc9cu+aUo3zT/ibj78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTRdbFNw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTRdbFNw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BFD1F000FF;
	Fri,  9 Oct 2026 11:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791543960;
	bh=CMQ35JM0Q+9NnYh1J6EBDw8qmLwIo6CRa0k1lPCc0Mo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jTRdbFNw+q8+ERVly5+g49vgcY1xzj4Jr60sTMbRDhjbP782HHK02J82/lBAriVz1
	 HIU3DoV+5cDST2OpTBj6Tzy/Pxqh5JfWJAvCuAcxo+srruK6LSCuvjdzDgc4QPrONi
	 f0jK2a9ZIjY/sxrAJdtOZtZ/zY1fe8C/aUSSPYyGkte2/RHzHuZ3VRtoH7aabrMiHV
	 rouKqkOL12rVPWeYobA+8vHi7LbYovw9aD7Htqf4zE5RTj867ievqLbvL9jX3OjWHS
	 wndIXkVLmKN4P6Z6vWh15a9nR51TAs8t1PO6uEnH5Lnv3eAT/gWqgPBOpukTJUozfS
	 metT2WHEHmJtQ==
Message-ID: <sashiko-outbox-165313@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: ti,tpd12s015: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: Quchaosheng <quchaosheng000406@163.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261009105352.300149-2-quchaosheng000406@163.com>
References: <20261009105352.300149-1-quchaosheng000406@163.com>
 <20261009105352.300149-2-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 11:05:59 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: display: ti,tpd12s015: schema allows missing gpios =
but drivers require 3 items
--

commit b4ff2205414e2e8ba45b337bf355981c209d7395
Author: Chaosheng Qu <quchaosheng000406@163.com>

dt-bindings: display: ti,tpd12s015: Convert to DT schema

The commit converts the TPD12S015 HDMI level shifter binding from plain
text to DT schema format.

> diff --git a/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.ya=
ml b/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.yaml
> new file mode 100644
> index 0000000000000..1927da3bd7361
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.yaml

[ ... ]

> +properties:
> +  compatible:
> +    oneOf:
> +      - const: ti,tpd12s015
> +      - items:
> +          - const: ti,tpd12s016
> +          - const: ti,tpd12s015
> +
> +  gpios:
> +    description:
> +      The CT CP HPD, LS OE and HPD GPIOs, in that order. The first contr=
ols
> +      the level shifter, the second enables the level shifter outputs and
> +      the third reads the hot-plug detect line.
> +    maxItems: 3

[Severity: Medium]
Does the gpios property need a minItems: 3 constraint, or should it be made
a globally required property?

Both the DRM driver (ti-tpd12s015.c) and fbdev driver (encoder-tpd12s015.c)
unconditionally fail probe if the third GPIO is missing:

drivers/gpu/drm/bridge/ti-tpd12s015.c:tpd12s015_probe() {
    ...
	gpio =3D devm_gpiod_get_index(&pdev->dev, NULL, 2, GPIOD_IN);
	if (IS_ERR(gpio))
		return PTR_ERR(gpio);
    ...
}

If a device tree omits gpios or provides fewer than 3 items, it will pass
schema validation but the hardware will fail to probe at runtime.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009105352.3001=
49-1-quchaosheng000406@163.com?part=3D1
