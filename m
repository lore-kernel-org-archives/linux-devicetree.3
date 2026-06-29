Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972D23016F1
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716300; cv=none; b=Bzy4Qy1gbgREx4BHG1o5gJ4EORMaMrJULOSAyWYm79N8WAExvP00hMDuY+IIC18GurreSb5jlVUdGNjGYtFyYyCtxU2RQV6dAsSWCi4nvZkRmI0uNv3UHzvuE1W4BqZgM9fV9GH7ZqRDIgYdLjFCXyb58VimKInt01JYSSoZT5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716300; c=relaxed/simple;
	bh=nkzehvwJ+NIz/uBVxsYpan5wp9T3KkgjoESOqTJk0w4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kSb2pk4zIqvDE7YSeOONaJCJRWg17UrThhoJ20yRdLU6XjU1eIak+22T7kykDsw9ScG2meyPHHCBXB0aH6viZYeRLbq4UhrudEOs3NNe3eifVKVUKWqKKHKgP2m3ga8p7twNx1RbYqOMauimdv0NuWtbjuRaSool35zUKY86moc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gotRbX/u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gotRbX/u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3281F000E9;
	Mon, 29 Jun 2026 06:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782716299;
	bh=nkzehvwJ+NIz/uBVxsYpan5wp9T3KkgjoESOqTJk0w4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gotRbX/udm8KGEffDUidRTPjEg2atk2uTBdaS15Pzy3WtHvxAUJtzyEaptRdjMG4v
	 MtNuny5Ws9x3BxYa5YEYqtGySfhtzrY7OGs2G8rtQ3GU9xWZ81cwx8rvyKRD570uX/
	 WKulPbUk20YP5AMF4QNfaBX7ENZQuhdqpb+QKGt35YpBGsAjJRdCjnPn5uT/ZEhnPA
	 QS4z8VNrAP4ft9+HIIBjnfwoDlei0z+vwc6RdtRHYhqqlgnLPZ7mrFnKBnZLQo4A/F
	 8ezwdU7Rm2G5P/fh4xg3fwMf7+vGafxz2PwxZrldkST6sDtZbFNSod7TapjDTw3m81
	 QMyUvUOlVyTjg==
From: sashiko-bot@kernel.org
Subject: Re: [RESEND PATCH 1/2] dt-bindings: memory: Add TI FSS_FSAS binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260629065517.868418-2-s-k6@ti.com>
References: <20260629065517.868418-1-s-k6@ti.com>
 <20260629065517.868418-2-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 06:58:18 +0000
Message-Id: <20260629065819.3B3281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `$id` field in the YAML binding does not match the file's path =
relative to `Documentation/devicetree/bindings/`.
--

commit e6d297ef6febec50bca3376d0c0b57a9ece18a98
Author: Santhosh Kumar K <s-k6@ti.com>

dt-bindings: memory: Add TI FSS_FSAS binding

Add DT binding for the TI Flash Subsystem Application Subsystem
(FSS_FSAS_GENREGS) wrapper present in TI K3 SoCs. This block controls
XIP read prefetch for the OSPI controller.

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

[Severity: Low]
Does this $id field path match the actual file location?=20

The schema specifies the path as soc/ti/ti,am62a-fsas.yaml, but the patch
places the new file in memory-controllers/. Mismatched paths can break the
schema cross-reference system and cause dt_binding_check to report
misleading errors or silently skip validation.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629065517.8684=
18-1-s-k6@ti.com?part=3D1
