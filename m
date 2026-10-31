Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793446465;
	b=Oazsxm78Itg0DgUkWN4xU4Rockxg8QsXubiNm71SxNdtp3RsJv77noni4l1HregkLLsw
	 7OnwCZNakrSQdX1Wyl9YpW+UoXBNNKCTdHG3rTpr3/kOEIiXxEjNrVKpkPbrkqzYV7PJT
	 qV/TV80nT0Wi0QMI6lCIUnN1kOMjWYlRK7yScUkTGbkIlNNh2wYOMpWP0FcjZR5KN8PHp
	 pnE3pk2Q7D7lW0Kn8qHvlMNgaDFoVPul4uTiKHgvDsiKkPy437wieV5GDBoeEgrRscaoZ
	 NXxXxPEGMbt6u42/4OwiJZTvWT6kEvEAQVuT+kR39zzCeE7X4g5BGTjoBoAcWH7jsRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793446465;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZafFUrt0JDND09YDyHADqYuJ+4gABL5GNLPQgHLLeyo=;
	b=e0DuJDxUQgQNGS/gDOO6zoEdI84CcPOqqHEw4FECa1N6Cbjg+7cfLQHsZWRpYFgv0eDU
	 y63UaQv44Cey7OSuhDVNvO9uP0bePa5LworXE1Gf0CJipq2ZzIvkmgmvPn127wSbLP4lb
	 VqETjp72q4uWMc8hXYzo7nRj083LQU/vXPLWdM1IIZOVsUpUFWquCP9y8OjBxIp14mn7l
	 uH/GoqJRkIIinDPGaEg99f/yoFiFhQMVoNmOej2V68FAMwd15cq4Ysf1GfYvlUvfdC4NW
	 v+KtagdBVjWzEClXs1AjiEt1TqsIi0qwGAxMqV61edMV4ptYUqt+JQpcWCvDmQ4jyzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HevV0KJV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCE2606A31A
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 11:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HevV0KJV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE011F000C1;
	Sat, 31 Oct 2026 11:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793446465;
	bh=ZafFUrt0JDND09YDyHADqYuJ+4gABL5GNLPQgHLLeyo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HevV0KJVJJO17T140m1Kc8I75LYnIBmeDxCM9Uwqm7aBeF29SEUTS/P1vqmch68vk
	 +0jk/o/Rpk/BzZc0FcBmLiJqkpD2/gn2r4SsWfaCkcgrCm0MbFVdBmZj8BOrC6mQsM
	 sayOCDKamUiFyuBu8BeggKgZS/5hOEzXVZicn1JCk02M9tQlnUIJS27dJ30JaaoBBy
	 /3UOH69gE/jbQDIm1V8s+ZfPUGCZWYxurXJjwd7zPqbAKAdu7ZZhSwTbOTwpQebw1S
	 LQshZQxjQH5fPIP4w9g4DXh5VIKx7FdWbPobmJkSFx2pO3XgGRXbN2/2716EuvnLjZ
	 QcDlLkZhq/z+Q==
Message-ID: <sashiko-outbox-191924@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: media: qcom,sm8650-camss: Add test
 pattern generators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 11:34:24 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: media: qcom,sm8650-camss: missing minItems on reg a=
nd clocks
--

commit e38622494d300e76674ad2714e0222a5d2a3e220
Author: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

dt-bindings: media: qcom,sm8650-camss: Add test pattern generators

This commit adds the three test pattern generator (TPG) register spaces and
the non-real time CAMNOC AXI clock to the Qualcomm SM8650 CAMSS device tree
binding schema.

> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> index 9c8de722601ec..50ae30cdcb82a 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> @@ -17,7 +17,7 @@ properties:
>      const: qcom,sm8650-camss
> =20
>    reg:
> -    maxItems: 17
> +    maxItems: 20
> =20
>    reg-names:
>      items:
> @@ -38,9 +38,12 @@ properties:
>        - const: vfe2
>        - const: vfe_lite0
>        - const: vfe_lite1
> +      - const: tpg0
> +      - const: tpg1
> +      - const: tpg2
> =20
>    clocks:
> -    maxItems: 33
> +    maxItems: 34
> =20
>    clock-names:
>      items:
> @@ -77,6 +80,7 @@ properties:
>        - const: vfe_lite_ahb
>        - const: vfe_lite_cphy_rx
>        - const: vfe_lite_csid
> +      - const: camnoc_nrt_axi

[Severity: Medium]
Should reg and reg-names specify minItems: 17, and should clocks and
clock-names specify minItems: 33 in
Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml?

In dtschema, increasing maxItems on reg from 17 to 20 and on clocks from
33 to 34 (while appending tpg0, tpg1, tpg2 to reg-names and camnoc_nrt_axi
to clock-names) without specifying minItems implicitly sets minItems equal
to maxItems. This makes the newly added TPG register blocks and clock
mandatory rather than optional.

Existing qcom,sm8650-camss device tree nodes such as in
arch/arm64/boot/dts/qcom/sm8650.dtsi (introduced in commit e8560ac937d92e)
provide 17 reg/reg-names entries and 33 clocks/clock-names entries prior to
the DTS update in this series, or when the binding and driver changes merge
through the media tree independently of the Qualcomm SoC DTS tree. In
addition, commit c865d36a9474 ("media: qcom: camss: Skip TPG if its
registers are not described") in this series explicitly keeps TPG optional
in camss_probe() for backward compatibility with older device trees.

Without minItems: 17 on reg and reg-names and minItems: 33 on clocks and
clock-names, does dtbs_check fail validation on existing qcom,sm8650-camss
device trees that omit the TPG entries?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031112203.5453=
19-1-vladimir.zapolskiy@linaro.org?part=3D1
