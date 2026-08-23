Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E092931FF
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 11:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787484496; cv=none; b=LaRK6czYVhtaG1T1IkPM9cKGOqczMtY8ClLcGn42YW/XPtdsGMZf4EkL7jQxJg2ixzauirGQGm3wlM6Vf40Q+ptmZ2PoX0oTbB7XAfEc79IsdJ16nu/9C+jxkX8zDv+hOsLWAonMXdNYeJRKB6CZ92Gqhond+/jVXmAEzF2Efcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787484496; c=relaxed/simple;
	bh=iRZBG1UZ60buEmIuQfDEnX2IytnsJWwXE2YTByhRT7k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bXcuh6vbBYF4UJOLu5TCwIebpadp/ghvOPusjVa1ZdLRxjtvvMgiVl29CwzwOQ0qzD+ukXVmCBScA6V2BXfm/z3uboJe9X3ox0GtwTUwo2AGA/pyiu+mx9Fi5P9WE57a6FM79dnII30KaFQXZ2vM2CDZaD9pLM5KgLp1ECu9QeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKk2OoGT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKk2OoGT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896AE1F000E9;
	Sun, 23 Aug 2026 11:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787484494;
	bh=sVA2nTFwdB9AbrUROrsDttAGxu4oSLrIWqtGBp1hayE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OKk2OoGTrrPN7kHGYt5ZX+1YzMm7FjQ38XkFWlrsuZtCFQjNJBBxUfY672ERRGR0s
	 ayJzD2VgONWsr9XWVawU1gA/hllVNRwpDZ399aioGuO64btFjl9OSjAy1hleIEU/Da
	 tMuCa26RMfGhtnfLJ1OmNLKUWj6GSUC1ZVBrPCHFiuxayWzsIl/EUlKtsGKMqInTUo
	 AXxNGJw6ZvRScKWhVbqQr1v0snQ4/6Te2DeNVAx1HCx733rB8I33vLbW+M0YioNk7G
	 q09b10no3hswUomAPfituYjuhdWoi52aNFU7WFZ7caf5PGEve7XJk+NcxN6jfWCOHP
	 9vk+/g1lAyR7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: display: Add Solomon SSD1351 OLED
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amit Barzilai" <amit.barzilai22@gmail.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260823111959.17029-2-amit.barzilai22@gmail.com>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-2-amit.barzilai22@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 11:28:14 +0000
Message-Id: <20260823112814.896AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The binding is missing controller-specific default values for `solo=
mon,width` and `solomon,height`.
--

--- Patch [1]: [PATCH v5 1/6] dt-bindings: display: Add Solomon SSD1351 OLE=
D controller ---
commit c53d1459d9817dd8adf46b673b2d950a10a1775b
Author: Amit Barzilai <amit.barzilai22@gmail.com>

dt-bindings: display: Add Solomon SSD1351 OLED controller

This commit adds a device tree binding for the Solomon SSD1351 128x128
65k-color RGB OLED display controller. It leverages the shared
solomon,ssd-common.yaml properties used by other Solomon display controller=
s.

> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1351.ya=
ml b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
> new file mode 100644
> index 0000000000000..80850c2ab5b3e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
[ ... ]
> +allOf:
> +  - $ref: solomon,ssd-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - solomon,ssd1351

[Severity: Low]
Should this properties block also declare default values for solomon,width
and solomon,height?

Other bindings that include solomon,ssd-common.yaml, such as
solomon,ssd133x.yaml, establish default geometry values for their specific
compatible strings in this block. Without these default values, device trees
that omit the width and height properties will lack a schema-defined default
geometry.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823111959.1702=
9-1-amit.barzilai22@gmail.com?part=3D1
