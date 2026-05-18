Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9F63DA7CA
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779087983; cv=none; b=uTAwo65tjkTmENjH16Gi+LjSdD6f9+QmhZ103fffda2HU9vGjZb6RZVmGA9vuUDYpMOmxyV/4Q/vnZ7XEAB8bytKNXsg7IY1qDVdnRUuscXP17JYVJ+qpdudttfL6Wv4hyOhYOvTKkuci754Vd6bzBjQn+LLF6jseK/J2A3uwBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779087983; c=relaxed/simple;
	bh=Ze9sujFqZQof+cSLdpAMr4jOM79ZkrmErllLeveRkbQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oFbWBf3YrfXNe0aM5vhCoj17zj0JLi1hRYbqEALLC/OeP11Fxt++SHCQDCRBwreB5i/7D94ITTeBE/0zociaWmQ+TxTLsbVlmhK+13TLEMRgF6J3pG+20937EH2Yvojler4tzWbT2LfU3KjXyHCfKzIXCsjvrsbPPzuA/bIcDU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOT+DYOu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOT+DYOu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446D9C2BCB7;
	Mon, 18 May 2026 07:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779087982;
	bh=Ze9sujFqZQof+cSLdpAMr4jOM79ZkrmErllLeveRkbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YOT+DYOuuqtlN7ABOvHmaWUqtLZB0FIxPAarZB5o2j9s8BX0vVq4tblKPVfk2fTec
	 APG/LR5p6mhGXulqF0trYutL3rGLy3hGILE5r1rtcgFu4+/ZaosmzIH2ror76U045V
	 LFupZuBEJXRD8FmnsphjnqfWycVPqgE8yn2M8cxNN1YFpgW5Kl654h+LUxcsggLtM6
	 jTfFu7maVU4b4KRWtjCGmmi2j5oDa3zWPrk2vpAiZ9N5AOciU4L+aeDXnS5H+FZ0c1
	 daUkuG8fwCanqpnseZEpm229xi+9LlN5nWjgk3myfv2RaFLuUG6l5hWMkDsAZOVOlM
	 CFBz+c+gkgf6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: Add bindings for StarFive JHB100
 SoC trng controller
Reply-To: sashiko-reviews@lists.linux.dev
To: lianfeng.ouyang <lianfeng.ouyang@starfivetech.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260518065243.20865-2-lianfeng.ouyang@starfivetech.com>
References: <20260518065243.20865-2-lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 07:06:21 +0000
Message-Id: <20260518070622.446D9C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removing the existing 'starfive,jh8100-trng' compatible string b=
reaks backwards compatibility.
--

commit 847e83dc6a2024f6cb7a70fd0453035b2808bedb
Author: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>

dt-bindings: Add bindings for StarFive JHB100 SoC trng controller

This commit adds device tree bindings for the StarFive JHB100 SoC TRNG
controller, updates the maintainer, and removes the JH8100 compatible
string.

> diff --git a/Documentation/devicetree/bindings/rng/starfive,jh7110-trng.y=
aml b/Documentation/devicetree/bindings/rng/starfive,jh7110-trng.yaml
> index 4639247e9e510..d21769b7d54e6 100644
> --- a/Documentation/devicetree/bindings/rng/starfive,jh7110-trng.yaml
> +++ b/Documentation/devicetree/bindings/rng/starfive,jh7110-trng.yaml

[ ... ]

>  properties:
>    compatible:
> -    oneOf:
> -      - items:
> -          - const: starfive,jh8100-trng
> -          - const: starfive,jh7110-trng
> -      - const: starfive,jh7110-trng
> +    enum:
> +      - starfive,jh7110-trng
> +      - starfive,jhb100-trng

Does removing the existing "starfive,jh8100-trng" compatible string break
backwards compatibility?

Device tree bindings represent a stable ABI, and removing the previously
merged "starfive,jh8100-trng" string breaks dt-schema validation for any
existing or downstream device trees that used it. Even if the hardware is
no longer supported, the standard practice is to retain such strings,
perhaps optionally adding "deprecated: true", rather than deleting them
outright.

> =20
>    reg:
>      maxItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518065243.2086=
5-1-lianfeng.ouyang@starfivetech.com?part=3D1
