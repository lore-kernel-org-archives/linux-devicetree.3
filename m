Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2F23909BF
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029246; cv=none; b=T5RHi4p3U8w4tAhtXILFtCWv2CFEjoNZrpStLdV7/8Sa2wG1sad3+mnqiztubZY7WKAsz/5gneUEhp+MttLkLtCNvy08KO/aoTv1QTb8rjXPV2fNF7h7XtANWKf1J7Bt0cLFPQZMwfW99S4Q8FExGU3Wz93StDeQSmguhd43Z+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029246; c=relaxed/simple;
	bh=D3xHvLyI6ZZMma8zt019FPn+HZbggAgPm1BkK/R3EKs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pkzpFwAT4IAFwGRknkvmYIEfikvl5nrmi0SVuHfS6RhCbgcZdzXddpjPR9M+eZJz6A+5k1ipJi6e62cteZQ+a6nIx4axmvfUpKqxay+WXwhy4vD5ZoVe9cOTSFPQdp7mWfBFCTZojrKFcTvtmdPH8kHyKc/q9MjklG0I+pqGVUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9s1ipUC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9s1ipUC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796031F000FF;
	Thu, 10 Sep 2026 08:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029244;
	bh=9cw27fkaVmFB07acOvjOiu/8R7jib31Qg3vHM/XgxEQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b9s1ipUCTutUg3na3zZBHZQc5r2mdwVOcONaKO06zkEKqTkLW+kiDNwVX1dkP2zwO
	 8c6CCO2Q96WjZAdir5ORsqg+oV/wrpQDmWVlKU6LTJ9r82SPpQThyTClZP08sMcThu
	 EK17j6hrYQpXMIlLcGCbFuMB9Q+WYwN5jfKsUfnjw9paJ5CyWiobrBkXb/fe/IMdyA
	 l2UuJhKNlnv3AFgbtnnh298AUh49QnPF4o03bjUEnxavGXL3OCMvtdjXrBk8kEEcHV
	 G4fOgSLIRc2WBHxmPbvBBmbi+9ROBDqd7F5jWb5ORexKQY32BY9m9ZXgXLZj/rKDPR
	 3/vg3L4Hm84eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH/RFC 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 R-Car V4H and V4M support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <1c2771f8882cde0fde694b9f5aae50c02a2ae4cb.1789028076.git.geert+renesas@glider.be>
References: <cover.1789028076.git.geert+renesas@glider.be>
 <1c2771f8882cde0fde694b9f5aae50c02a2ae4cb.1789028076.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 08:34:04 +0000
Message-Id: <20260910083404.796031F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added compatible string `img,img-axm-8-256` is omitted=
 from the `power-domains` conditional block, allowing incomplete device tre=
e nodes to silently pass validation.
--

commit 2124d2433f8e144a72392a5dd4a2382c06e9682a
Author: Geert Uytterhoeven <geert+renesas@glider.be>

dt-bindings: gpu: img,powervr-rogue: Document R-Car V4H and V4M support
   =20
The Renesas R-Car V4H SoC integrates an Imagination Technologies IMG
AXM-8-256 GPU, while R-Car V4M integrates an Imagination Technologies
IMG BXS-4-64 GPU.  Both variants can generate 8 interrupts.

> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml=
 b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index e9218e0f363d1..9bea037602c13 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -35,6 +35,11 @@ properties:
>            # work with newer dts.
>            - const: img,img-axe
>            - const: img,img-rogue
> +      - items:
> +          - enum:
> +              - renesas,r8a779g0-gpu
> +          - const: img,img-axm-8-256
> +          - const: img,img-rogue

[Severity: Medium]
Does the newly added img,img-axm-8-256 compatible string need to be included
in the power-domains conditional block?

Looking at the allOf/power-domains constraints further down in
Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml, the existing
block requires two power domains for similar hardware:

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
      required:
        - power-domains
        - power-domain-names

If a developer compiles a device tree using renesas,r8a779g0-gpu without
providing the required two power domains, will the dtbs_check tool process
the device tree without flagging the omission?

Should this enum list be updated to include img,img-axm-8-256 to correctly
enforce the two power domains requirement for the R-Car V4H hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789028076.gi=
t.geert+renesas@glider.be?part=3D1
