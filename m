Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC524A35
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715665; cv=none; b=YIPFKIbyjesYFynawnz1ENuxxbBnBY/so3E5wZ52gP9wVT8FX03rCvOkZa3kBxT6XaMEaFHr5GGbGSPf1TNaV5d76LqfOerLjLFjsAFZOP9nNfZU1JKYNq5tC/Qr0UxAQ4+gHVq4VDqnbCoam8C2vILDsJ1dauQInAOg6n4L/Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715665; c=relaxed/simple;
	bh=0BNUaTm4L8qHo/A0axwlSxbxO511LNRqvNWHv3zNvME=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LPpCytjK7sXNLVeqhEmalXZihOJ2QJYwzAjtKh75VFiJOQPExrLmFqIgPfFpOgFLFBf1dMSevIe/N05PoIlsnsaEAd3KDVRzULhQexEujK9gAzDUlfZWFO3zArjkYQr1M5UABJ5tlvEuu04ctUDgxAUvBGNLRnnKmVXY/u0hkO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A821F000E9;
	Mon, 29 Jun 2026 06:47:43 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: memory: Add TI FSS_FSAS binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260629064228.860226-2-s-k6@ti.com>
References: <20260629064228.860226-1-s-k6@ti.com>
 <20260629064228.860226-2-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 06:47:12 +0000
Message-Id: <20260629064743.F0A821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `$id` field in the YAML binding schema does not match the fi=
le's location, which breaks schema cross-referencing and can cause `dt_bind=
ing_check` to silently skip validation.
--

commit 54d35a3fdeae166603662fbdb3cac4a24e6c37c1
Author: Santhosh Kumar K <s-k6@ti.com>

dt-bindings: memory: Add TI FSS_FSAS binding

This commit adds a device tree binding for the TI Flash Subsystem
Application Subsystem (FSS_FSAS_GENREGS) wrapper. This wrapper block
is present in TI K3 SoCs and controls XIP read prefetch for the OSPI
controller.

> diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,am62=
a-fsas.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,am62a=
-fsas.yaml
> new file mode 100644
> index 0000000000000..81c71ebfb7e13
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/ti,am62a-fsas.=
yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/ti/ti,am62a-fsas.yaml#

[Severity: Medium]
Does this $id path mismatch the file's actual location?

The file is being added to the memory-controllers subdirectory, but the
$id field specifies soc/ti/. When the $id field does not exactly match
the file path relative to Documentation/devicetree/bindings/, it breaks
schema cross-referencing and can cause dt_binding_check to silently skip
validation or report misleading errors.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments K3 Flash SubSystem Application Subsystem (FSS_F=
SAS)

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629064228.8602=
26-1-s-k6@ti.com?part=3D1
