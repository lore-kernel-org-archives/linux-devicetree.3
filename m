Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C492F4D7D47
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604438; cv=none; b=ZrGdLW60skBO5GnYFJC3Iv/CPilkM+qGRWacNpqTcdjdTM75b9RDiuuUtV0ZZpY/+1FKcmvN0ua5QBBhEskvog4LR1OiYqZb3QFJSFrc/CoQyH8AP77h3iqUfW4RJ5tPzxO6edBMy+d1nY5gXBZQjWeqwTPASs4q3IkPsU38Gek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604438; c=relaxed/simple;
	bh=cVKwIHRXRhovTR24d6r8s0yIX68yurKTvnYo/+feLPc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D+QDsSAD+AWb/z+mNuvBxkNbb9M8IXiLILyI8iUY3176hQ1L+HmyyUhkUD+anGHpGxAIB/e4YVtZRpX3tix167jaXD+VhBbJeUWkUQ8aSC+Tlx3I+wUtCpFGx0SZYdSf3+dmcfy9nMZsEyY/QWfZIr2iQMmZYorXYRAhmidPVyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnBHvOwT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnBHvOwT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365B81F000FF;
	Mon, 28 Sep 2026 14:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790604437;
	bh=Dtwvpp8Jk9IcxJRQw0OkaG04fzQjQSewlBNreZrr8h4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jnBHvOwT0vE4y+uWavcOBjABdKQTeMDB11Qmli4oWvtVDkS5NXk4eddMyX5R45H5B
	 XdJSXkppmWn1CzlfFAUZpOV15KdgENndp0BKX9uE63w7lRmUWmmUCWYJkdha8qW3hr
	 K5W19kENtvW6dVhHEg9jt3JuogVt3QvpPPmloKFcaga8VEQyC2FNSr5l34bQiT9zyt
	 8jrftp2W5N4hHbmT0Km0XQFkvBbPMtMWI2sowEB/rPGA9z23GuAXzMRuAKTs2/7BMX
	 4e+8wOFGQhxB9Vv9vSLzxgHTH2SJnCPvNG+zx8PVRSKUpqugeFI8nlOw4x+0EclvcS
	 zrnyifQ8OVcfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: crypto: fsl,sec-v4.0: add
 fsl,qi2-crypto-priority
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928-for-upstream-caam-qi2-priority-v1-2-e4a8e5f01dbc@free.fr>
References: <20260928-for-upstream-caam-qi2-priority-v1-0-e4a8e5f01dbc@free.fr>
 <20260928-for-upstream-caam-qi2-priority-v1-2-e4a8e5f01dbc@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 14:07:16 +0000
Message-Id: <20260928140717.365B81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: crypto: OS-specific software policy encoded in devi=
ce tree
--

commit 16c27ce3ed51863cb681908accfda1674f3516d1
Author: Vincent Jardin <vjardin@free.fr>

dt-bindings: crypto: fsl,sec-v4.0: add fsl,qi2-crypto-priority

This commit adds a new property, fsl,qi2-crypto-priority, to the
fsl,sec-v4.0 device tree binding. The property is intended to allow boards
to specify the default in-kernel crypto API priority for the SEC device
relative to CPU implementations.

> diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml b=
/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
> --- a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
> +++ b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
> @@ -86,6 +86,15 @@ properties:
>      description: Defines the 'ERA' of the SEC device.
>      $ref: /schemas/types.yaml#/definitions/uint32
> =20
> +  fsl,qi2-crypto-priority:
> +    description:
> +      Crypto API priority of the algorithms the DPAA2 (QI2) front end
> +      registers. Below the CPU's own implementations, the SEC is used on=
ly
> +      when asked for by driver name. The dpaa2_caam.priority module
> +      parameter overrides it.

[Severity: Medium]
Does this property encode an OS-specific software policy directly into the=
=20
device tree?

The device tree is intended to describe hardware topology rather than Linux=
=20
internal software routing policies like Crypto API priority or module=20
parameters. Because device tree properties become long-term ABI, exposing=20
Linux-specific module parameter equivalents via DT pollutes the OS-agnostic=
=20
design.

Would it be better to handle this fallback algorithm ordering exclusively=20
within the driver or module configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-for-upstre=
am-caam-qi2-priority-v1-0-e4a8e5f01dbc@free.fr?part=3D2
