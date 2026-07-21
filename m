Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ABF3B47CD
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784626373; cv=none; b=tLo679F00SvMLidmDRmGMLZCy2AqZ5qWcpVi5FqSz72+cLyQc5BXCLpVqsER4d8jIFNGVuGA7L+fOMrigFCIruxodXvPSKqvQpUiSSb0bMKRGL5jVn+KfZwOcbeGVw4pVcAD3wkwdxq5p/ieDelG+WMH9a/kWoJs/ZggQ0P7uPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784626373; c=relaxed/simple;
	bh=z3fEFjQfy/SiWoExGGmgYIFwkaEQEksKjDUu3iQnjRc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nv9o2k4C37gjnwu4DvLVoxDkye2B+I4EswcbRE6pSnRfQuwDu3qhyoSJtA04+ExkaaY4IJHyyOXCs1t1l9YtQzuqwvXq6KItnFbwgvmkY0tUQEuRQvq0WMCQk3MjKTpsuC0+d0z9iOLjuMb1RE+CL7o2/S2XJfVqSvceIN1m0R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCQxO4bM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCQxO4bM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4CC1F000E9;
	Tue, 21 Jul 2026 09:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784626372;
	bh=5Ed3SRoxiexCfxuOWUv29kH7d7Q+JlFc+fzG+kRdnzg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dCQxO4bM5rcGQntAzrg/SHKWKcE97YjTJHr/FWkt1xjLQMfl2IS6/jNtAibThNPB7
	 C6ZgS+s8YJHQfzM6+MNCD9gITnXbawMnZEVgK91VTjNoyINWwfbqGVMGg5PHYU/bWs
	 2f0fXh2682t+ar4UBUOt6Tv+zJgm8GetVhFXFGtLUSbKLGEU7cp/+uSSUS1Kzq+N/7
	 +G4qSQoc1476EBtkBCRNsO+ewFl5kiMYnSH77sD8k6EaoZX6Prg05LfD/9kSBcZlJB
	 +w94P0+2c3MpjCXXCb4ggZQSQECgg6pGPJIV7yIZfkxx0n04O8lTnvmgow0PmIWdyg
	 7zhRjx9xZ/6aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 x1e80100 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenjia Zhang" <wenjia.zhang@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260721-devtool-v1-1-ade633accb41@oss.qualcomm.com>
References: <20260721-devtool-v1-0-ade633accb41@oss.qualcomm.com>
 <20260721-devtool-v1-1-ade633accb41@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 09:32:51 +0000
Message-Id: <20260721093251.AB4CC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `qcom,x1e80100-inline-crypto-engine` compatible string was o=
mitted from the `allOf` conditional block that enforces required properties=
 (`power-domains` and `clock-names`).
--

--- Patch [1]: [PATCH 1/2] dt-bindings: crypto: qcom,inline-crypto-engine: =
Add x1e80100 support ---
commit cfe29b614f97bbb01610fe15e88b3fd50c7177bb
Author: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>

dt-bindings: crypto: qcom,inline-crypto-engine: Add x1e80100 support
   =20
Add the compatible string for the Qualcomm X1E80100 SoC,
which is used on the Hamoa IoT EVK board.

> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-=
engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-e=
ngine.yaml
> index db895c50e2d25..29c9a1ff638c5 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.=
yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.=
yaml
> @@ -25,6 +25,7 @@ properties:
>            - qcom,sm8550-inline-crypto-engine
>            - qcom,sm8650-inline-crypto-engine
>            - qcom,sm8750-inline-crypto-engine
> +          - qcom,x1e80100-inline-crypto-engine

[Severity: Medium]
Does this cause a regression in schema validation by omitting the new
compatible string from the conditional block?

Looking further down in qcom,inline-crypto-engine.yaml, there is an allOf
block that enforces power-domains and clock-names:

Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml:all=
Of:
  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,eliza-inline-crypto-engine
              - qcom,milos-inline-crypto-engine

    then:
      required:
        - power-domains
        - clock-names

Omitting the new qcom,x1e80100-inline-crypto-engine compatible string from
this block allows incomplete device tree nodes missing power domains or
interface clocks to pass schema validation.

Could we add the new compatible string to this enum if it shares the same
hardware constraints?

>        - const: qcom,inline-crypto-engine
> =20
>    reg:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-devtool-v1=
-0-ade633accb41@oss.qualcomm.com?part=3D1
