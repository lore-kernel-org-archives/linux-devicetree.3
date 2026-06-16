Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0004534A3
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781626100; cv=none; b=PJtxRI3K72A3HP3DQxPMSJWszSW8BVThrTW11wnrlhZOHCC3morxIkgjsFsk5yNueIipORJS3zHhb7qMtZUQQ9gb1cCPTh2x7i/QjVAHHIRBGZKjpJWqES+Dtz31ewlWIEc7mdVzcPaHlvwKqVwuFWWAlJkl5lQXOtUQEynTVO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781626100; c=relaxed/simple;
	bh=4kbyXjo0MYHNLP0mXGqG5ji/U2VHpZygixWgtPLFdUo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hxeXqXXkTXOHAEqPgBrqblRGx6VTHFpSL2Z7qf4k9EvbDLRA9NSGGnEq6iA03YzwErqs60BaSqGk9Ed5BapAr9LrBN0Hgmvye5t8rGtnT1JbVoVanx+BsUvGEb5n3jLkZtXNLlWQObmaxom5+thQmlauSFm3JPl1C25Vn7bi+18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKXK1P5r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKXK1P5r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC521F00A3A;
	Tue, 16 Jun 2026 16:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781626099;
	bh=w3fCoJu+zeboKPjxgT5TexS1mah/lC3iwBcAV4gbOZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fKXK1P5r1iJNMAPJkS8hJuWM3xd76wSL62dJz4fuA5Hmgx5nc1FK639czx7pgErdJ
	 gSxmlGVbt8Kfw154Iz0dUq7FeDktDFVigGN1u8Nl44Mdxm968ULnyrzxoDrXg8cdVG
	 qI+WX8tu/mSP5871OaYly0L+7xxRUHZ+9lWVkGMSc3mynph4JECDuWoDPKNFrMJ0vN
	 8eB7ERCKoRXuAFZhoKi3UHBjA9cHPd0/y96lC34NOMtRdF9ku35iomrdJMuzgJW+nZ
	 B7+Knww94W+q5t1inaJ2YZv7+6uyl93G9rtFyjq+zi6I8oRiYpl1alOfGXgfW/cJEJ
	 ueyL8NP6emD5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/3] dt-bindings: timer: mips,p8700-gcru
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksa Paunovic via B4 Relay" <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260616-riscv-time-mmio-v9-1-03af7bc8f2d8@htecgroup.com>
References: <20260616-riscv-time-mmio-v9-1-03af7bc8f2d8@htecgroup.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 16:08:18 +0000
Message-Id: <20260616160818.CEC521F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Usage of deprecated vendor prefix 'mips,' for a new compatible stri=
ng.
--

commit 26c5e0f809bd1633d85e1be068047d23439d144d
Author: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

dt-bindings: timer: mips,p8700-gcru

Add dt-bindings for the GCR.U memory mapped timer device for RISC-V platfor=
ms.
The GCR.U memory region contains shadow copies of the RISC-V mtime register
and the hrtime Global Configuration Register.

> diff --git a/Documentation/devicetree/bindings/timer/mips,p8700-gcru.yaml=
 b/Documentation/devicetree/bindings/timer/mips,p8700-gcru.yaml
> new file mode 100644
> index 0000000000000..e6f25e769f461
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/mips,p8700-gcru.yaml
> @@ -0,0 +1,38 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: mips,p8700-gcru

[Severity: Low]
Is the mips, vendor prefix deprecated for new device tree bindings?

Looking at Documentation/devicetree/bindings/vendor-prefixes.yaml, the mips
prefix is explicitly marked as deprecated, with recommendations to use mti
or img instead. If this prefix is intended to be reclaimed for new hardware,
does it first need to be formally undeprecated in the vendor prefixes list?

[ ... ]

> +examples:
> +  - |
> +    timer@1617f050 {
> +        compatible =3D "mips,p8700-gcru";

[Severity: Low]
This example similarly reinforces the use of the potentially deprecated mip=
s,
vendor prefix. Should this be updated to use mti,img, or another approved
vendor prefix to align with subsystem conventions?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-riscv-time=
-mmio-v9-0-03af7bc8f2d8@htecgroup.com?part=3D1
