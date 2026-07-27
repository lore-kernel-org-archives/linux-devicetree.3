Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68683EC6B3
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144405; cv=none; b=U9ZT4OYkpOu5rM7k/9oZfH2NJ8sgPDX0W2gxwGg16xtsnU0BnorL3MrZF/bWqse6wu2YMCTiEVYxd7fKXlNgBJrZaUY9XN6kzI1GMqUo+pXnnbPlurDCqvmQiJe+ZXdijuHiv8UWHzTJG7qQAAfDV5nGOulFMFqtQFO0kuSji84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144405; c=relaxed/simple;
	bh=NVboAeBfYYNH2HYC66pmYsyC/WtiPTA68tMG5rpkGVE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WOh0lyhEd4blNVYMmu1oQ0/bx8ZT1ZiDXBvYUSX3defz7GExOKAH3a7VVIG/hGRV9AzeqKY7DhOXequvDvvEx/9cibja7/kryy1RdjM2no/jbkhPgdf3rFrKNCqpkUo0uOLtHLEgFi3LwLjummHGAICBCUUpEfeaKCeqqjLM9a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnF9ZH1/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnF9ZH1/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC90B1F000E9;
	Mon, 27 Jul 2026 09:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785144404;
	bh=iy5A7YySgMBBsj/og8FMmgL/5FD+Npq2Pa2Qsf/zEPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FnF9ZH1/GgM4Si8s6T1K3jfPWRp+ccZtgL9TKA5YOgaa6EXxxOhumqof2yjBpAHjx
	 DwalA11rNgNLxtoOZ2qnDpjbeWo+F2naJ+cb6AA8tU7lmAGbAsHZGG2v1NS2gPGaIx
	 YyeiuLlp21etaCCbld/Qpdb+6b/U6zkqnuVEIfT8EI4b5izp9GCiiSccKFvMBPani/
	 yu2eVUga6YlIR/BOiKFHSX0bYesvyE6zexiQJewtRiDQ5Xxetq9+IswbDD9hwa/jjB
	 8dP8z8rE3SBoiWDywzQJRklz/YkPveGzntrkP1qNatJZtvMw/LR/FjIpIlm8xzsD2/
	 MFmkYAZcSEf4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: gpu: powervr-rogue: Add MediaTek
 MT8173 GPU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260727091555.1023910-4-wenst@chromium.org>
References: <20260727091555.1023910-1-wenst@chromium.org>
 <20260727091555.1023910-4-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 09:26:43 +0000
Message-Id: <20260727092643.DC90B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Schema validation failure for MT8173 GPU due to inherited power-=
domain constraints
--

--- Patch [3]: [PATCH v3 3/5] dt-bindings: gpu: powervr-rogue: Add MediaTek=
 MT8173 GPU ---
commit 560e4cee0c5fbc6b0c5d09c24c260e205ca79e47
Author: Chen-Yu Tsai <wenst@chromium.org>

dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
of the Series6XT GPUs, another sub-family of the Rogue family.

[1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a43c79=
c2a.camel@imgtec.com/

> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml=
 b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index a1f54dbae3f31..53131cd4cc2a3 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -15,6 +15,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - mediatek,mt8173-gpu

[Severity: Medium]
Will this cause schema validation failures for the MT8173 GPU node?

By using img,img-gx6250 as the fallback compatible string here, it seems th=
is
will trigger the allOf conditional block lower in the file:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - img,img-bxs-4-64
              - img,img-ge7800
              - img,img-gx6250
    then:
      properties:
        power-domains:
          minItems: 2
        power-domain-names:
          minItems: 2

Since mediatek,mt8173-mfgtop only provides a single power domain, wouldn't
forcing minItems: 2 cause valid device trees to fail dt_binding_check? Shou=
ld
the conditional block be updated to exclude mediatek,mt8173-gpu?

>                - renesas,r8a7796-gpu
>                - renesas,r8a77961-gpu
>            - const: img,img-gx6250

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727091555.1023=
910-1-wenst@chromium.org?part=3D3
