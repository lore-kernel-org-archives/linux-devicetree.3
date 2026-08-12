Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FAE35C6B1
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527993; cv=none; b=ADXsG502oNY0I4XZPRlSRucJr38GgQU+v4qblhYr3TIMU0yUqUfjTKXvzoBz21qLjySzqLrKvKni+Sg5y3dwv+lY5LiitulOVl76EizejWGtalouRdcChJvbEP2FLyjd5tPmswJ75UXgejO/9+KggYWyQXJaX7RiwLduipxTltQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527993; c=relaxed/simple;
	bh=0gid0MOfEPCFQwAXmgzDj//myGtpYnOt+gYV/Qz2PwA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uAywNqLU6MtsV7KkUhdetgId2BCpBhcK05TW8X+0P6/8/N49w1H6z5wtUzjioRSPOZA2N6BdZJqD1QjMeocot17oimBW6TkTCVgVKJDRdZ/K8rr1eMUkG4qNwoipN2XiEwA1U7aUKTMznGG2HfxcYEJIUuxl8mIR/egJPV9zZYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mE1PkWFB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mE1PkWFB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2111F000E9;
	Wed, 12 Aug 2026 09:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786527992;
	bh=19ENSLLz/deARqUVUUEfG1oLKS7Y0QDi2HjA1WQf6dM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mE1PkWFBUux66i0neAkt2rZw2IFB/8YzHoh16DslU+QDmuHtAHZWVSi1uSOmsG2r1
	 +7VhR8w3JZ8eOrMMMWCm+dMt40UnYWEsGHcL0aymN7EVRz1Sg+DeaVXSm/xNEEP1a0
	 QdO97Ul79f+dIGWtU+lF3qde+R74WLpMkDu1CBJ3kuo/IdzGGs+u5Dj9Ps3QpjDMML
	 gcvn9KaJbdWJR9HO3MDH0LBQe0ezt5oqXnQ8xdNUMXwRrQua1zCJVWXt94BspG2OFT
	 Z+gz2mGVXD3FW2l+dpqM6ZryCR/M8LR5yAkveA/ElbhLFSV0H9HuwxNg5BpanqR9nt
	 XgXwyiN8mfyqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/14] dt-bindings: usb: qcom,snps-dwc3: Add clocks
 for USB3 on Qualcomm IPQ5332
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org, vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260812-ipq5018-usb3-v2-6-8f355d7ff0ef@outlook.com>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-6-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 09:46:31 +0000
Message-Id: <20260812094631.DF2111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The schema modification unconditionally mandates 5 clocks for `qco=
m,ipq5332-dwc3`, breaking validation for existing valid device trees that p=
rovide only 3 clocks for High-Speed-only configurations.
--

--- Patch [6]: [PATCH v2 06/14] dt-bindings: usb: qcom,snps-dwc3: Add clock=
s for USB3 on Qualcomm IPQ5332 ---
commit 76251f6cda12ef34d26acca7a91c897245bd05c0
Author: Praveenkumar I <quic_ipkumar@quicinc.com>

dt-bindings: usb: qcom,snps-dwc3: Add clocks for USB3 on Qualcomm IPQ5332

This commit adds aux and lfps clocks for the Qualcomm IPQ5332 platform in t=
he
qcom,snps-dwc3 bindings, splitting it from the qcom,ipq4019-dwc3 block.

> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/=
Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index 8201656b41ed7..e59fbfc1af71b 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
[ ... ]
> @@ -182,6 +181,25 @@ allOf:
>              - const: sleep
>              - const: mock_utmi
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq5332-dwc3
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5

[Severity: High]
The commit message states that the aux and lfps clocks are required only for
USB Super-Speed support. Does setting minItems to 5 unconditionally break
schema validation for existing High-Speed-only device trees that only supply
the core, sleep, and mock_utmi clocks?

If these clocks are optional depending on the hardware configuration, should
minItems remain 3 with the additional clocks defined as optional items?

> +        clock-names:
> +          items:
> +            - const: core
> +            - const: sleep
> +            - const: mock_utmi
> +            - const: aux
> +            - const: lfps
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-ipq5018-us=
b3-v2-0-8f355d7ff0ef@outlook.com?part=3D6
