Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471325;
	b=47AilhIdYypw8H2AhuLtLmbuyw+CEPds1q5xJLXhP4bWqIWg+nNj+jnpl+g1zhT33VxN
	 0tB0SvD4k8Gl2Fp4gKyWXwwds5XGTy3DJSIYFUbWMn9OzsEMDMNmxNIBbdCP1hPbaK/Td
	 jkZrFHCNWnhxiO6tuUltSUSJdDiVk0FIzYrQn20norDGFoYKzPaFiqtn7M3/fRtI5Hq7O
	 2atImkziLaCWW8zzA3zSvJQl+NTan8jede4OFSeZ3zFLKeD1jTddXJA141AuJle5aWnKS
	 sKuI/y4DJ5oBR8/GSm6ERZJOqqJpLc76FDj5SrGPrxjbp4oZEilxPPGOHcIliGW0EsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471325;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mLlWMBnveWrLlf5N1AzK3AbNsb8lcg2qNvIpLCobUXs=;
	b=WfnfnhkOEqn24DKZYUKJF6PM54Hopu+9Vdy9KPXKW3KqDkLL+3zdyt7gG0+SHyRvHQ+E
	 xboxwHyzGdQ0vwg777d3tuTBDpQArNoiVxlbd8YaSQ+C448BvplcvOtd/dUWde1tvFXJk
	 ExKYM5Ujvv0lIAdG7XpIbeId6NBjAJ38LIj01Y1Q4RjoNHeaGFSEC+VaLisRrUxu97ZT1
	 UcTau8/ECKs1gYIUtZqbZ8WyotkHWxYxUZJ4wGf4S6pEof7ChWER4kqAihpLdP3RmPeqb
	 +x70+ut8T/wefRlXxdusZxZgpCsVRavPWVMQJSaM91YE6ZyBXq2Zg8hv42fkJ9DOV6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c+WrLpat;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA61606A886
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c+WrLpat
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859A01F00A0E;
	Thu, 12 Nov 2026 08:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794471324;
	bh=mLlWMBnveWrLlf5N1AzK3AbNsb8lcg2qNvIpLCobUXs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c+WrLpatah6crGkaAcyfGcryl1GNQdQ99TLimsInw2FUQ5d8NK3CFoZQN8t0Mbq6q
	 8m84KB5GKsH2sUnc0ayUm3Q0RSGHvmBdCDjEgtHCqQujia4yofJU4P+SeXOVNsAmAV
	 +6/fBOy6rte1/uG+2aUhBEaq4S8D4tU+k6glmISzU5z1SOiD+vw63wdaqmQVyaX3Lu
	 kCcZXss/khp5rF61auiBaRk45cMAJRNBOHuCOqml2qlm6n1k1zymznG6VvC+BtCMVs
	 6Ld7UrTV6SPOuXWeI322Qy4UkCL7pHdiG4HpFxG/+h650G+PxpXJs/Udy8Ve9eCcMR
	 WAg+6klm6xgmw==
Message-ID: <sashiko-outbox-210682@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc DT
 support for Nord
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anurag Pateriya" <anurag.pateriya@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-nord-soccp-dt-v4-1-af6e44e9f397@oss.qualcomm.com>
References: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
 <20261112-nord-soccp-dt-v4-1-af6e44e9f397@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:15:24 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] arm64: dts: qcom: nord: undocumented qcom,nord-soccp-pas
  compatible
- [Low] arm64: dts: qcom: nord: commit message describes moving new
  compatible
--

commit 368cfee1a2a184e173c7b4c22c268cf4858fda12
Author: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

arm64: dts: qcom: nord: Add SoCCP remoteproc DT support for Nord

This commit adds the SoCCP remoteproc and SMP2P nodes in nord.dtsi and
enables the compatible, clock, and power domains in nord-embedded.dtsi.

> Move the SoCCP compatible to nord-embedded.dtsi to fix binding
> errors reported for the Ride board.

[Severity: Low]
This isn't a bug, but this sentence reads like a changelog note between
patch revisions.  Prior to this commit, neither remoteproc_soccp nor a
SoCCP compatible existed in nord.dtsi, so the compatible is being added in
nord-embedded.dtsi rather than moved from nord.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boo=
t/dts/qcom/nord-embedded.dtsi
> index 5a1520e436c64..2211171b8c4c0 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -464,6 +464,16 @@ &remoteproc_cdsp3 {
>  			     "nsp";
>  };
> =20
> +&remoteproc_soccp {
> +	compatible =3D "qcom,nord-soccp-pas";

[Severity: Medium]
Is "qcom,nord-soccp-pas" documented in a Devicetree binding schema or
supported by the PAS driver yet?

Neither Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-p=
as.yaml
nor Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml lists
"qcom,nord-soccp-pas", and qcom_pas_of_match[] in
drivers/remoteproc/qcom_q6v5_pas.c only matches the Nord ADSP and CDSP0..3
compatibles.  This causes dtbs_check to fail on the Nord embedded device
trees and prevents remoteproc_soccp from binding at runtime.

In addition, remoteproc_soccp in nord.dtsi specifies a single
memory-region =3D <&soccp_mem>, whereas the existing SoCCP and Nord PAS
binding schemas require two memory-region items.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-nord-soccp=
-dt-v4-0-af6e44e9f397@oss.qualcomm.com?part=3D1
