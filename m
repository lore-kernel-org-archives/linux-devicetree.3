Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201A23CEBBD
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 18:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781633130; cv=none; b=ojRMj1yXkqtOmykw9ToDeVQuFeNbgkfUkJpGHu9dO/ywBIBRrfAJprtnTcIAK9RAHqJRGKpEtXrxzXyZ+zcj7ZlmKob26kguJy/dKDis9CnYDcRY4x4jWdW14c7916xtJ9MvyVjXmBqSOwYCXLfpqOSdYJFB8SUZx3zrJ5CX0uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781633130; c=relaxed/simple;
	bh=vC275wkz7A3TtrxSk/vbSinC4faZOUe4reQSkpi1P+E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FLKZmL4Utlrqhx6M/5CzJl7GWQwxsDKgdFfnjAytSqMTYgfeWPvbHrkAruT1a4ak2HtAnWBYdHFm19SgJInaRVJqlTVQ8rMRWDhmpHOmdV1CeKqf6erVEPPOaqdBvb2wUbNw2RU9JoEi2f51dRYUqYkTAzvMN4PY2IYbQ4M2kxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FzyQdPv3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzyQdPv3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54B21F00A3A;
	Tue, 16 Jun 2026 18:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781633128;
	bh=MmlrOJIvPBzMHeS2Du1IJ56VJHSY/6nqteZkRL7SEo4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FzyQdPv3REDJHiZoTbVHWzcfJ4KyXxBfvvzreCj+r0DsRXVCHa/h4G7atw++RkFVs
	 wYUw+ok5qEfI/K2QtTOGOxd4WsJH4MdWMBf++b3VA844SYqY4fO/MmXTE+BkWu4oIf
	 3GsOl9Y4zw/oMU3LQi8FNdviTEM5p0etVb/Vl+r2WhkitgbhuvIhyQLj7PWq3H4vIg
	 N2oH/WNTTIq3T4hWZ6PBee7YBQp0mFTI2fOUCb9KxVMSq81ec3hMoMFyVICTEjI/gQ
	 jSXDgGr/Lw4/N/nL0PC+ueWe163nIc1TcZcyjp2So+Bly6eX6Y+cd29OMysQIkJdA3
	 0F6MHNhNPyRmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: img,powervr-rogue: Document
 GE8300 GPU in Renesas R-Car D3
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260616175835.2109336-2-niklas.soderlund+renesas@ragnatech.se>
References: <20260616175835.2109336-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 18:05:27 +0000
Message-Id: <20260616180527.C54B21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect use of `enum:` instead of `contains: enum:` in an `if`=
 block breaks schema matching for `compatible` arrays, bypassing power doma=
in validation.
--

commit 911441282d51eed161459bbab16231d9b1fcbca8
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

dt-bindings: gpu: img, powervr-rogue: Document GE8300 GPU in Renesas R-Car =
D3

This commit documents the GE8300 GPU present in the Renesas R-Car R8A77995 =
D3
SoCs. It also updates the power domain constraints to account for the D3
having only one power domain that is always on.

> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml=
 b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index a1f54dbae3f31..b93f49f1fa0a6 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml

[ ... ]

> @@ -159,14 +165,14 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          contains:
> -            const: thead,th1520-gpu
> +          enum:
> +            - renesas,r8a77995-gpu
> +            - thead,th1520-gpu

[Severity: Medium]
Does this change break the schema matching for these compatible strings?

In Device Tree bindings, the compatible property evaluates as an array of
strings. Using "enum:" directly on the compatible array checks if the entire
array itself equals one of the scalar string values, which will always
evaluate to false.

Should this use "contains:" along with "enum:"? By dropping the "contains:"
keyword during the transition from a single const to an enum, this condition
might silently fail to match both the newly added renesas,r8a77995-gpu and
the preexisting thead,th1520-gpu strings. This would bypass the power domain
validation constraints intended by the block.

>      then:
>        properties:
>          power-domains:
>            items:
> -            - description: The single, unified power domain for the GPU =
on the
> -                TH1520 SoC, integrating all internal IP power domains.
> +            - description: The single, unified power domain for the GPU.
>          power-domain-names: false
>        required:
>          - power-domains

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616175835.2109=
336-1-niklas.soderlund+renesas@ragnatech.se?part=3D1
