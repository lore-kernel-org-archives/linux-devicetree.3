Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536D7285C91
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785115683; cv=none; b=RjSbjBszgeGrLDrD1erhYU+cciRoiAsbNaQOi6DgQLkl1smqhIxGpKBvRFwY4RBENJ9UcGbgA3uxRFRvu4cTmruALtyvsm47OmqWHTRE26kJ5RdKFTKTcfwyxME0thQv8lNiuKnDE1i5uLAx7Yg5/GUKzaNnnyN90BkvNP+LgHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785115683; c=relaxed/simple;
	bh=YURl2vT8IZpaEDgtOJOkuQsPeoBI0DC9F/jSbagm9zg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j0zoXJoBtv004BhWHRNFu36GZetqaQqmP8AAZSyuPlYMgQ0f3RWj59dkzuVshRJQcN3oUus1FCzPUPG9YGVkLtCP24vEhuyKnKtE96RjtfIISfLPvpSnhcbX1kBd+RYcZXCMZdEHDZ6b48rIiBOwRN+iX0NcQDIP4XGGrcGrX8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIJlkyDK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIJlkyDK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70091F000E9;
	Mon, 27 Jul 2026 01:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785115682;
	bh=Aw6NwiHSgfLKA5SEzdK+lKUnIKBfJYxOhgbaKKPfo7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RIJlkyDKWmVq8W5qpc+a2lJigLpLrgC/Wxi7gLqwBfvQEHzkXiVVpHyHskgGYRYcg
	 pNmHjVybLHlktPzZwwqRqoFvrWf9ZMLrJSceQan66hbxD7J5FqxpFYaQiutcGlTcId
	 HwYcVmbrQCHaugb9SnM1wR7px2ZWUgo9CURu/ZytKJk3Ig2Kb/WStiT2S+9gqxyW8f
	 AJuoWx5Wg65BYQhvzUKc5OkUXIfmL78HAtte/wvM/XZK5pFLdxxRTQ9bpUIlGiuipi
	 PUBGQKmLuuNfLQnJcMGm36Z27mTUiHr3mH4WTGz8NJnzSK3Cqx+MwDa098vuDQr50j
	 4RLNAYJ524GNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: img,powervr-rogue: add
 spacemit,k3-gpu
Reply-To: sashiko-reviews@lists.linux.dev
To: Sterling-Ash <baihui.liang@spacemit.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260727012231.1025210-2-baihui.liang@spacemit.com>
References: <75c9382d2bda766aa459b00321153d715254d1a4.camel@imgtec.com>
 <20260727012231.1025210-1-baihui.liang@spacemit.com>
 <20260727012231.1025210-2-baihui.liang@spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 01:28:01 +0000
Message-Id: <20260727012801.D70091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete schema validation: `spacemit,k3-gpu` allows up to 3 c=
locks instead of restricting it to 1.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: gpu: img,powervr-rogue: add spac=
emit,k3-gpu ---
commit 5e58bdf2ff5533bc6aae23c68852fcbc9caf9570
Author: Sterling-Ash <baihui.liang@spacemit.com>

dt-bindings: gpu: img,powervr-rogue: add spacemit,k3-gpu

This commit adds a compatible string for the IMG BXM-4-64 GPU integrated
into the SpacemiT K3 SoC. It notes that the integration requires a single
core clock and omits power-domains, falling back to general schema
constraints.

> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml=
 b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index a1f54dbae3f31..2d58dd4076a87 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -38,6 +38,11 @@ properties:
>                - thead,th1520-gpu
>            - const: img,img-bxm-4-64
>            - const: img,img-rogue
> +      - items:
> +          - enum:
> +              - spacemit,k3-gpu
> +          - const: img,img-bxm-4-64
> +          - const: img,img-rogue

[Severity: Medium]
Will omitting spacemit,k3-gpu from a conditional block allow invalid
device trees to silently pass schema validation?

The commit message explicitly states that the K3 GPU only needs a single
clock and relies on the general schema constraints. However, the general
schema configuration allows up to 3 clocks:

Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml:properties.clo=
cks:
  clocks:
    minItems: 1
    maxItems: 3

Because spacemit,k3-gpu does not match any specific allOf.if block
enforcing a maximum of 1 clock, it falls back to this general limit.

Should an if-then conditional block be added to enforce maxItems: 1 for
the clocks property on this platform?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727012231.1025=
210-1-baihui.liang@spacemit.com?part=3D1
