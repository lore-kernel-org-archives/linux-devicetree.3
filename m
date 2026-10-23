Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792774735;
	b=xeo7s8yF1TP/wnMznH0FlcdKnkIV38s+882ioG7drOcBTN3yJqqudplYkdyl9NYlzhAW
	 vsZBaFpZHhiiV8vOwx6GCadDsO09T7F2zKlI3eYW9q82B/R5/OR5MJJIRL/kfTpYhS0Ih
	 /TtBXBhJCjNh65nHIFvP0CSBvsk2kl0S4JbJRlEtFHgBZsEs0ZBpExuqY6ms2bDCTr4uE
	 Z6wrq9ncyNLR68rURQUwsbq2pAQoO/Myyg6bjiynnliKHpymM0HGT+zqofGesl8kmBB7U
	 ZYVfRH3GDKDVwlHx+/F9qildZFQIuxbc/jK7qhwjCdHWuaJrVUEwZn8XHuaCdPAYzUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792774735;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rvQ7liOCzZfaqVAFRGx+zdASoE5pUP8XqMEJMBewctM=;
	b=KnPiDluvLlaRceDAXCqEez6MVBBuBOWH2U4SZRvKpthiB1BZVHXw1bZM9t9qhnP7W5YI
	 y/w0Hf8nxJSROVfMRWupvHBTw4vieyYadeRXPiWA4J4jmxCQd9fS7urd8PeSBf04L6wnf
	 xiCGgjBl4KbPM5LKK39gBH5l2Vp0LUtD87dscK5R84Rb2VHQoqSlRgGUrVYjEMZo1DHq3
	 zk5IxY/+KurF2KbuLdoYwU+ec7Elzb5C3j2mwYqgwPgUABQ2/mDGhPOItLOw+9IR39gmn
	 dm7oOFPnsgvTz96otq/FPDoKnEIqAJfIRmwFruZTlKTBIKJJLjuhojFZC/RGb1mRE3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kNILdbm8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDDA606A31A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 16:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kNILdbm8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D231F01825;
	Fri, 23 Oct 2026 16:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792774735;
	bh=rvQ7liOCzZfaqVAFRGx+zdASoE5pUP8XqMEJMBewctM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kNILdbm8a9cssrI8rtyjwpClU/q2i+/c9oVf5LbQLge62kr0wBsGxR65TTZbmPd1R
	 dnd+1V/+QRAESNcCpm6f0hUPWgwaFByKtiHnNGvWamYDLOe3OBpOW/k4b0f/sCCZdX
	 Ylb7J9gVuavP958UZnmPZQU6YqvWvqiML69yKkEYgUkyWe0XX2+Yh9Jjf6fDNL0+UP
	 A6NAA7i/YkmgvylvEoBxiAZQjMu4kTCrtEWkdpUSFmE5mhGLU6MeIY3+A9MnUIQ9gZ
	 PvnXOvlmAIkG8Y6xBUFVbBAcFQ8gBnBxRv4OiVgS3pHFUA6ccx4gBQArrlwJtRgqSb
	 XODr8s5tS/jnA==
Message-ID: <sashiko-outbox-182976@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: media: Add description of Qualcomm
 Waipio CAMSS IP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Zapolskiy" <vz@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261023163057.775917-4-vz@kernel.org>
References: <20261023163057.775917-1-vz@kernel.org>
 <20261023163057.775917-4-vz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 16:58:54 +0000
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
- [Low] dt-bindings: media: use of codename waipio instead of sm8450 in com=
patible
--

commit 301ac07bd476ba12e0b4279c2772097ff587606b
Author: Vladimir Zapolskiy <vz@kernel.org>

dt-bindings: media: Add description of Qualcomm Waipio CAMSS IP

This commit adds the Device Tree binding schema for the Qualcomm Waipio
(SM8450) Camera Subsystem (CAMSS) IP block.

> diff --git a/Documentation/devicetree/bindings/media/qcom,waipio-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,waipio-camss.yaml
> new file mode 100644
> index 0000000000000..3da1f3c0d6187
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,waipio-camss.yaml
> @@ -0,0 +1,274 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,waipio-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Waipio Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Vladimir Zapolskiy <vz@kernel.org>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,waipio-camss

[Severity: Low]
Should this compatible string and schema filename use sm8450 instead of the
internal codename waipio (i.e. qcom,sm8450-camss), and similarly for
qcom,waipio-csi2-phy in
Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml?

In Documentation/devicetree/bindings/arm/qcom-soc.yaml, component compatibl=
es
for Qualcomm SoCs follow the SoC model naming pattern:

    # Preferred naming style for compatibles of SoC components:
    - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[e=
p])[0-9]+(pro)?-.*$"
    - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
    - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
    - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|s=
hikra)-.+$"

Waipio is the internal codename for SM8450, which is upstreamed throughout =
the
tree under sm8450 (such as qcom,sm8450-camcc, qcom,sm8450-cci, and
qcom,sm8450-mdss, as well as the sm8450 headers included in the example of
this binding) and matches the other SM8xxx CAMSS bindings like
qcom,sm8250-camss.yaml and qcom,sm8550-camss.yaml.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023163057.7759=
17-1-vz@kernel.org?part=3D3
