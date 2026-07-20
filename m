Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDF61DA23
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784510989; cv=none; b=cJ/a5N/MVpwT4GKhv+KOQVP51Jgzh1mmkAU/gxlglNM6WeOPWLGutUP2qKA5Ushywy2YjyQoHDDuBl4GXJ0PdDAp11xJg56raRbhu47uXnLpFdZCFkJCBL1/7Z+zYfKGzJ9XZDVE8DFmzCWEdNMxlxSr7KkcDeiG+a9/k94zL4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784510989; c=relaxed/simple;
	bh=SdLDIrAD/pgGtVkZpcHNT5ytSYwYy2RDOrRTnHrMPDo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SDBgU0KEllBn946IUBRq/5v8X5EEa2FxI8NzHXhItYKP+iqUK7nMHKlFZyMvWhgeFNkuBCM7cwG+tFsMJRo9C61sDuQrgGR/gqDZdXTjwf+hj3TK7Im5LUGLv4k4MqWPz2JuLnAPZdRE431Sf3l4VjH9fqyXENdDuc7sEgm3MPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAV5mMr3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAV5mMr3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9991F000E9;
	Mon, 20 Jul 2026 01:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784510987;
	bh=Uin/1pUNr1aGQTfAcJNOSx0beCzOjbofrFMY6XqzMzk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nAV5mMr33Oc3KV37WNvMpotRLWKiPSJAkXlhbCb4zwpN1Wk+RvKUOC/t8qT5MohtK
	 wxtq0h9z2xXKjIfAIU2odIpO5T8YIibMGy/5yDtXG7RcgcY4e9syYNj0XMAL9xZ35A
	 UvSZHznc0rvD0Q0DTKLCYm8Br9QK6zN595obw+FIPmCoyfGdJA8eQ2QM/dnrWNGxZS
	 zqoxpeoR7p8IRUWM127ADy0USt1J+35jknIIUBZhfitJkmk+JBPhBDhhMfGBGDJCFW
	 6++PFBrNw6p5HLGKSxQHQS6pJYN1DYihd0EDBeLc7WJvMZ9hkGuB7L1fIuAKowk1Hh
	 wUnieD18ZaVUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720012056.1026551-9-kyrie.wu@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
 <20260720012056.1026551-9-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 01:29:46 +0000
Message-Id: <20260720012946.CB9991F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The description block documenting the decoding pipeline architectur=
e was not updated to include the newly added MT8196 SoC.
--

--- Patch [8]: [PATCH v6 08/14] dt-bindings: media: mediatek: vcodec: add d=
ecoder dt-bindings for mt8196 ---
commit e70e1026361bf104bca63d4eac75dcb632c4dc87
Author: Kyrie Wu <kyrie.wu@mediatek.com>

dt-bindings: media: mediatek: vcodec: add decoder dt-bindings for mt8196

This commit adds the MT8196 compatible string to the MediaTek vcodec subdev
decoder binding. It documents that the MT8196 supports 10-bit decoding,
4K@120fps, a 36-bit DRAM IOVA address, and Video Power Control.

> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subd=
ev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-s=
ubdev-decoder.yaml
> index d1d209cbbd43a..4e11d4aade2ef 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> @@ -76,6 +76,7 @@ properties:
>        - mediatek,mt8186-vcodec-dec
>        - mediatek,mt8188-vcodec-dec
>        - mediatek,mt8195-vcodec-dec
> +      - mediatek,mt8196-vcodec-dec

[Severity: Low]
Does the description block documenting the decoding pipeline architecture a=
lso
need to be updated for this new SoC?

Looking at the description section higher up in this file, there is an expl=
icit
enumeration of the pipelines:

  The used video decoding pipeline architecture across various Mediatek SoC:
    MT8195: LAT-SoC + LAT + Core
    MT8192: LAT + Core
    MT8188: LAT + Core
    MT8186: Core

Since the MT8196 architecture also uses LAT and Core, should it be appended
to this description list to keep the binding documentation complete?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720012056.1026=
551-1-kyrie.wu@mediatek.com?part=3D8
