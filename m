Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0752C47D948
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847915; cv=none; b=EcsBINyMrZOfxsSmwwdClz0vnyYMZNa9mc+B7k1BateegeXFixvoLNR6V4ZcR3bfu8rds6pswkYUbJwjNTXOpUwlI3ttCskbdOvuECQoIN2vp0qq0qRiRZctYGaV2DjXVPBGtqKhjme3doRkuhfN4cLgXdkdOWPKLuvQYBUX0Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847915; c=relaxed/simple;
	bh=PZPMn/djKWImejyDhj4EKz7YCUnzlPSj2yuLgRXqT4A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CbuiW9cB/en96Tmt2IloHKfRsOw5MmBTSZkngYJHX/m9VIxSJMvhrfVxmYjpv/AOU8cOgf2h/2zEphtwitz27CcyMPU53c4Vp8S1k9yERYdtxGj2kxte2+eCWI/skYzOd/Rm4TZcWGG7kJQfxaGtFzCaSaixjI+LiCK2G3sBQOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjs/fQ6S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjs/fQ6S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67724C2BCB0;
	Fri, 15 May 2026 12:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778847914;
	bh=PZPMn/djKWImejyDhj4EKz7YCUnzlPSj2yuLgRXqT4A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=tjs/fQ6Se+hILMX6+O1F3lOHTfHkU3yU1Y+f7YALVH/SD3Kn69LeshITnEFEPtbAk
	 Rt/qrPQ4R2uwYtq8j3+sDJOE3o2fHerzV2BEr5R8RuRTDTCPYE0IgO62d0vafP/+g5
	 sQxpsxorWLB0EnNjfI3A7vBfbzShQDWouLq19vez/5pGUrpcm3J5OP+VWvTg59qnaC
	 ozbbVJYbBylsnvx4Mzh96GRsHWiS9kw0VR2L1PUcbp9HkuFrS7hF11NiX3kn8rp5WW
	 1BM4ZTSJLERylhtPuPktXjveGFX24VTbfsAYIx3fBUpaanO6OP4XDM6WG6Aus377tk
	 Lu3+RcROQu4bA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] media: dt-bindings: qcom,qcm2290-venus: add
 Venus on SM6115
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-iris-sm6115-v2-2-2ab75229de61@oss.qualcomm.com>
References: <20260515-iris-sm6115-v2-2-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 12:25:13 +0000
Message-Id: <20260515122514.67724C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The sequence under `items:` is incorrectly indented, which will cau=
se a `dt_binding_check` failure due to `yamllint` strict indentation rules.
--

commit 43193b8fcb4051c6ff00308477a91cbef91be80b
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

media: dt-bindings: qcom,qcm2290-venus: add Venus on SM6115

This commit adds a new compatible string for the Venus core on the Qualcomm
SM6115 platform, using QCM2290 as a fallback.

> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.y=
aml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> @@ -18,7 +18,11 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: qcom,qcm2290-venus
> +    oneOf:
> +      - items:
> +        - const: qcom,sm6115-venus
> +        - const: qcom,qcm2290-venus

Will this pass the yamllint checks during make dt_binding_check?

The sequence under the items: key appears to be incorrectly indented.
The file Documentation/devicetree/bindings/.yamllint configures yamllint wi=
th
indent-sequences: true. This configuration requires the sequence indicators=
 (-)
to be indented further than the parent items: key.

> +      - const: qcom,qcm2290-venus
> =20
>    power-domains:
>      maxItems: 3

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-iris-sm611=
5-v2-0-2ab75229de61@oss.qualcomm.com?part=3D2
