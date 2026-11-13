Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581543;
	b=HYm5Q9eulOaBKTyNk/mKyk+i7d+WGohCKVwZ/4CGVIeuwEEQqOGBkgv3E0mkky0n5wNq
	 QX6Q28FgqOz9LgcPy5dyVeHUytwCjtOJTXh0CWjAq8dVgJHmoST43ygy3MbbTJ7DzULD5
	 Gu+Gc1zmA+Fp6Y09FUPFu2YfAscqUW5FFXYm5GNY3PZcXDjtm/hzoIdLG/9SvBW+Ibf5M
	 +M4fm9l9RseJ2sFtUSt+TEAT8AU0XuLfw1amOVVpKAa0aydSEB4SWWkrmWXZaNpxHmtmy
	 JzE8e0UQxfx3+PnVwJFoK2tcCayOHtbFHTJNsJeFRacJBEoLOvErrIy0Jk8efyRGAuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581543;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Mloo9c65TPaT899neAwv4Dbl5pKL/M2HtN+Esc7k2yc=;
	b=WY8LhrBVhkdcOmP8EZFBGEau780RgJ3oWRPaSmBKWhEU3CPJ539CGQjYgluf7rhJl7ls
	 BkOVemvc+O3ZqEvCW+e5NQfc4SmUTTyi6pPR/lX5a1mvDpCBX0715d3VciiaHJ2wyzPIx
	 BlFqjHmCDXmIJH5+HLDqytwEQJ/SFwpYKkC4GXvSVjplu73k0SASdSMsIzNAfAnzmYg7A
	 qywgE0Tmn+Aq5ikh403yRm5lQ1ASrlEa/oEbutwteww7t2uZqRsuIT6XyNes2n4MF0wIR
	 iRNCOLAHYCu8+vZBotMDKjBBLiHJFdj+qWJ5YdWOnf6A9oZ6MHBfj7U7UiUp1qcoF2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fqQQpJAK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09C1606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fqQQpJAK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB041F000C4;
	Fri, 13 Nov 2026 14:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794581542;
	bh=Mloo9c65TPaT899neAwv4Dbl5pKL/M2HtN+Esc7k2yc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fqQQpJAKVEbMR3ykoO+kJe2mfzpxPHLKXmVAhnNve+3Nv0TuevDb2sASJzS3/MfmR
	 5YCndHPSZi6Z8XXbxybRh9rpfBBETSx/GPseUyPWt125/NK9zlTQ9nhJ5+nfswOrzd
	 g4pBqLC0l804nni6KwpMGNgexqFuWAEFkv/f58kCyk2V+zRaMrFioCBMPoS1jt3icO
	 9lpT95YuXPaSjN/Sh/gyzMvWFBp2F+V4yiQTucIx4n0HUDTQMOht5/z2jH/6/VQePi
	 z7ulu2edg2O8D3kItKDQRX7IBD9YbqOHlMzdNnJZ5zO4WImt5WpYAg2i2x2mAXzGpI
	 ogDVk7uf2jCCw==
Message-ID: <sashiko-outbox-213017@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: remoteproc: Move iommus constraint
 to SoC-specific bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-shikra-el2-v5-1-8aca743de97f@oss.qualcomm.com>
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
 <20261113-shikra-el2-v5-1-8aca743de97f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 14:52:21 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: remoteproc: iommus defined only in allOf if/then
  blocks
--

commit 1ded47577cc7fa6ba7648da8e6df9b5ccd0a3022
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings

This commit removes the iommus property from the common PAS remoteproc
binding and adds it to the SoC-specific PAS bindings that use it.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common=
.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> index f75cab6b4ed95..4662fe4cff62f 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> @@ -32,9 +32,6 @@ properties:
>      minItems: 5
>      maxItems: 6
> =20
> -  iommus:
> -    maxItems: 1
> -
>    power-domains:
>      minItems: 1
>      maxItems: 3

[ ... ]

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas=
.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
> index b20780e5e26bd..8aebc785f2126 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
> @@ -169,6 +169,18 @@ allOf:
>              - const: cx
>              - const: mx
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,sc7280-adsp-pas
> +            - qcom,sc7280-cdsp-pas
> +    then:
> +      properties:
> +        iommus:
> +          maxItems: 1
> +          description: Firmware Stream
> +
>  unevaluatedProperties: false
> =20
>  examples:
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas=
.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
> index 5a7c5f8c92d17..5c41c89369605 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
> @@ -178,6 +178,19 @@ allOf:
>              - const: lcx
>              - const: lmx
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,qcs615-adsp-pas
> +              - qcom,qcs615-cdsp-pas
> +    then:
> +      properties:
> +        iommus:
> +          maxItems: 1
> +          description: Firmware Stream
> +
>  unevaluatedProperties: false
> =20
>  examples:
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas=
.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index 99e9aeeb4f62c..f838b98c43f40 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -317,6 +317,21 @@ allOf:
>              - const: mx
>              - const: nsp
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,glymur-adsp-pas
> +              - qcom,glymur-cdsp-pas
> +              - qcom,x1e80100-adsp-pas
> +              - qcom,x1e80100-cdsp-pas
> +    then:
> +      properties:
> +        iommus:
> +          maxItems: 1
> +          description: Firmware Stream
> +
>  unevaluatedProperties: false
> =20
>  examples:

[Severity: Low]
As reported by Krzysztof Kozlowski on v4 [1], should iommus also be
declared in the top-level properties section of qcom,sc7180-pas.yaml,
qcom,sm8150-pas.yaml, and qcom,sm8550-pas.yaml (or kept with broad bounds
in qcom,pas-common.yaml)?

With iommus removed from qcom,pas-common.yaml, these three schemas define
iommus and its description only inside allOf if/then blocks, whereas
Documentation/devicetree/bindings/writing-schema.rst requires properties to
be defined in top-level properties with the broadest constraints and then
narrowed or disallowed in if/then/else blocks.

[1] https://lore.kernel.org/r/20261105-cunning-whippet-of-success-e4fd3d@qu=
oll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-shikra-el2=
-v5-0-8aca743de97f@oss.qualcomm.com?part=3D1
