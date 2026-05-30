Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93932C026C
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101921; cv=none; b=CZKamev8N+qt3GppbC2ygc96ijTgzXgEQpQ4x2QsEmsglw843VSqioQhf2EKgjGCJaC+529FKL4wMY+SXvx0gHj9923W7ZnZ0Rp+XjrQgSvCO77LHjl+ZlSxt/SXmuf4HYNAq7EIyabBXo1cujc/J9EEi58ShGHFtSgDQhwCNDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101921; c=relaxed/simple;
	bh=7kTCqEDF5+PNTxOgRGL+CmaoXPCmfmpR3xJ8zo/o8sA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iWmROHgxX8nVG1Qnsx3rKvmKMtQ78dcpYY7wrl0KPs+xr9ksI3wm/9r+v0zEgm0WscLy2bqN5G9GYAS23PclXeuxzQEx/g+56+AtM4p5LIpZTN4altCe3eTg7vdXxsVu1g4y99wnFDDczFJgEau8LmAFcEXJdSlK/rfxVcknsfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iG98Z/Hi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iG98Z/Hi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370561F00899;
	Sat, 30 May 2026 00:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101920;
	bh=xdoEm/oEOvxn0WvryCh13MqsWnqds/6YS8WCJA5lUt8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iG98Z/HixfPMN4ajPWfXGDDHzogf9VK7iEkJgHGLvbEvBMTZPzSFvRjFFyDRjJnFe
	 ibCxyb6wktWQFwaHreOC5rjxpQPduNbpGwAg+X+ZKdGZA1Uw+o0RQFY6wb/sMRIphW
	 A0IwLsYGeu234LKavqROT8OYfg5dsiZuJ0/bstfdBy4QrFG8P3bNGnZwPlwXXGPVji
	 fTQxy/waWmBaDV1qPpGlPkWlUyFlRLkvlTeOGZmOyMpwRuU2BgJZR2Gb3tzDemQcob
	 YO2k9M38tmjOIwsZqRf8VhVZhjlURiN3tXH7nUFhzSeX1KbKluiDMT+Mwenq+2TVNc
	 bwKe9vXva+boA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 2/3] dt-bindings: dpll: add SiTime SiT9531x
 clock generator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <rouhi.ali@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520191943.73938-3-arouhi@sitime.com>
References: <20260520191943.73938-3-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:45:19 +0000
Message-Id: <20260530004520.370561F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The YAML binding fails to enforce the hardware limits (number of in=
put/output pins and PLLs) between variants claimed in the commit message.
--

commit de5c539cf5b5d391a13e0203a532efbfc0d6f0d4
Author: Ali Rouhi <rouhi.ali@gmail.com>

dt-bindings: dpll: add SiTime SiT9531x clock generator

Add device tree binding documentation for the SiTime SiT95316
and SiT95317 DPLL clock generators.

> diff --git a/Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml =
b/Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml
> new file mode 100644
> index 0000000000000..ac88f2f0b2ae7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml
[ ... ]
> +description: |
> +  SiTime SiT95316 and SiT95317 are I2C-controlled programmable clock
> +  generators with integrated DPLL for synchronization applications.  Both
> +  variants contain four PLLs with automatic/manual reference selection,
> +  DCO frequency adjustment, and phase offset measurement via an on-chip
> +  TDC (Time-to-Digital Converter).
> +
> +  SiT95317 provides 4 inputs and 8 outputs; SiT95316 provides
> +  4 inputs and 12 outputs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sitime,sit95316
> +      - sitime,sit95317

[Severity: Low]
Does this binding need to enforce the hardware limits between variants that
are claimed in the description?

The description explicitly states that the SiT95317 provides 8 outputs, the
SiT95316 provides 12 outputs, and both have 4 PLLs. However, the YAML schema
does not constrain the dpll-types array to maxItems: 4, nor does it include
conditional if-then blocks to limit the logical reg property under
output-pins/pin@X based on the specific compatible string (e.g., maximum: 7
for sitime,sit95317).

Consequently, the schema will silently pass validation for device trees that
declare structurally impossible configurations (e.g., 5 PLLs or 12 outputs
for the 95317 variant). While the driver might handle these edge cases
internally, the missing constraints represent a gap in the schema validatio=
n.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520191943.7393=
8-1-arouhi@sitime.com?part=3D2
