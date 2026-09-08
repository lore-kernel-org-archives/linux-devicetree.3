Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBDB52D2CA
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 11:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866606; cv=none; b=Aw6c3IXRarOkbRcRV5pblNEEYOr2EttO8H8GrIrTNafAyWRj+J6oBi8x1eOOV7P3H663sMf7S2eUhZmb8VKYfMEKfFAU+y1oDzC6s+8RfbX3B5Hohl6bku2o0C7GCjrculVLkGGeULM5GrDzvAtwhiLHx01FTVrJS6MQjEYdI20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866606; c=relaxed/simple;
	bh=vHrEGg0J7YixnjaVo3BJ70vYsNd2BSaGitJ3gUnIJQw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ITbufuK9/j1Zg4/y6dgcXvy/030MI61fC2oUU1Jx81yLei6s056l4UFgrOxgfDZIDhYb2vLmL453+yX/lUX/r5U6qv3/yjzCPlIPlp8sYmLcwUJgW02UpkOsuw8hWhKnMGxhZ9TW2A8PTyOx9gBAjclvD7s7/XZ0DoBETI0Ztho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GO0N0dvg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GO0N0dvg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A031F00A3D;
	Tue,  8 Sep 2026 11:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788866594;
	bh=vHrEGg0J7YixnjaVo3BJ70vYsNd2BSaGitJ3gUnIJQw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GO0N0dvggC9GzqqfRQDE78sQ/WCtRoPbywfUNT7M8gvkBnpLbKV1cBbv7WFvJOG2z
	 1DTZcyNu83Hg1lREv+G6N5tEgl4eNHJRmFGQrE6ciylA2OzMWgIVCuzgfoW3dUJdRw
	 qEqRGfOHo/KFwRM1BeRRmIWHIcPWx5xGKkvlybA2flrMHGRZTowX1pLkgyoAkdfkjd
	 C+UGtRFV/lB3GCtMEcmMtGWw8UnnNWnPSse4QikUUB0XKIuYzMOlOnxJz/p2SwEgXM
	 OOSALX6JQogfmPQf01XHmyjqRAPDRhbZYxMYx4bo2ZagOPCllKX77JTY215LZWIV3F
	 /keyPnAv+jPiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: spi: Add Realtek RTD1625 SPI
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260908111640.2032749-2-eleanor.lin@realtek.com>
References: <20260908111640.2032749-1-eleanor.lin@realtek.com>
 <20260908111640.2032749-2-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 11:23:13 +0000
Message-Id: <20260908112314.02A031F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit changelog claims that 'NOR' was added to the commit m=
essage and binding title, but this change is entirely missing from the patc=
h.
--

commit 1c453ccadad25a38f1223703bbe011ebdccd7ab7
Author: Jyan Chou <jyanchou@realtek.com>

dt-bindings: spi: Add Realtek RTD1625 SPI support

This commit adds the device tree binding schema for the Realtek RTD1625 SPI
Flash Controller.

> dt-bindings: spi: Add Realtek RTD1625 SPI support

[ ... ]

> Changes in v3:
> - Add Conor's acked-by tag.
> - Add "NOR" in commit message and binding title.

[Severity: Medium]
The changelog states that "NOR" was added to the commit message and binding
title, but the commit subject remains "dt-bindings: spi: Add Realtek RTD1625
SPI support". Could this be an oversight where the intended change to the
commit message was missed?

> diff --git a/Documentation/devicetree/bindings/spi/realtek,rtd1625-nor.ya=
ml b/Documentation/devicetree/bindings/spi/realtek,rtd1625-nor.yaml
> new file mode 100644
> index 0000000000000..b967fdac333f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/realtek,rtd1625-nor.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/realtek,rtd1625-nor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek RTD1625 SPI Flash Controller

[Severity: Medium]
Does this binding title also miss the word "NOR" that was promised in the
v3 changelog?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908111640.2032=
749-1-eleanor.lin@realtek.com?part=3D1
