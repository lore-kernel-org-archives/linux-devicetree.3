Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A634633ADA0
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169108; cv=none; b=f/A/OytADk2B92OXQIIpDeo+s1DEm8WBeF5Mn5QkaMAGarQM3jLdrDm0aBcPl/6XyygVbvIXF/pVRSPuvJMTwJxSVaz2dkvwxLdl8IkzVRvgScAVmErdTcg4wM1Zwjii8BISNYFIWIHdHlKsXwmRKC9XxLn3Xr54xgHQKqmzLzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169108; c=relaxed/simple;
	bh=7ael0KMKUtVRgiYf+49FMUFCq3bypW4kxUkpP6q/Zho=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dWdxrb7M+/SrPADurUyy7LsmAHXEZCoplHIM952SQesuaM2ydP3jrvgYchbzZ9fxyXTY9yyV+hX7IxFtQXM3FWhqRMWBVIkYd6+pwyh+/HqnuMgdIj5gt0W3u6s/yRkAXxwCLxobujS1GtMNeLygks0tH8bcSoUF70prvVuFpLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDM5lqSj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDM5lqSj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E931F0089A;
	Thu, 11 Jun 2026 09:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781169107;
	bh=PjZEU7r1dW1PiLf6EgWGoIKzjElBk8DAUsXk0LPKu28=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PDM5lqSj/Xn87m9GcViRBZM50/SJqxsWh7wWyetRDFF264EmpyUWSD+nB9TZaxcc0
	 rQ5WzXdulOSa2RoxXZo4jdUVFq2lCdOsGiqjP5/grTt2yreFkhDJD3qvdnwIJRc4Hi
	 +JUqWkImsmQiIWLhutfeaINTjYfJihJ1gcWZ/i6X7uJJmEc6ILla6OzEkozNPBfMta
	 cJfSX5nO2AyvxbF7t7Zleunq4i1jAoVjgn02lnJE1ajAYnwzAd186RRba/49boPZjK
	 f5+K0kJpoNXw/9w6QF2wvPiHyQ5yOsDz02oOdlueLAeqevJPXSVrHOzJUXaqRsIJzG
	 l+muesGymP9RA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] regulator: dt-bindings:
 qcom,sdm845-refgen-regulator: Document IPQ9650
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611-ipq9650_refgen-v2-2-d96a91d5b99e@oss.qualcomm.com>
References: <20260611-ipq9650_refgen-v2-2-d96a91d5b99e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 09:11:46 +0000
Message-Id: <20260611091147.14E931F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `qcom,ipq9650-refgen-regulator` compatible string incorrectly =
mandates a fallback to `qcom,sm8250-refgen-regulator`, which violates devic=
e tree backward compatibility contracts and causes a kernel panic on older =
kernels.
--

commit 0fcc5b0e92deea2c90fae28f9e7822774bfdb4e3
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

regulator: dt-bindings: qcom,sdm845-refgen-regulator: Document IPQ9650

This commit documents the IPQ9650 compatible string in the refgen-regulator
binding. It also specifies that IPQ9650 requires explicitly enabled REFGEN
clocks, unlike other supported platforms.

> diff --git a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refg=
en-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,sdm845=
-refgen-regulator.yaml
> index 40f9223d4c272..2016dd7a0bdd3 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regu=
lator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regu=
lator.yaml

[ ... ]

> @@ -29,6 +43,7 @@ properties:
> =20
>        - items:
>            - enum:
> +              - qcom,ipq9650-refgen-regulator
>                - qcom,qcs8300-refgen-regulator
>                - qcom,sa8775p-refgen-regulator
>                - qcom,sc7280-refgen-regulator

[Severity: High]
Does grouping qcom,ipq9650-refgen-regulator here mandate a fallback to
qcom,sm8250-refgen-regulator?

Since IPQ9650 requires explicit clock enablement, an older kernel using the
fallback string won't enable these clocks. Furthermore, IPQ9650 uses a
different control register compared to the fallback (0xC vs 0x80).

If an older kernel probes using the qcom,sm8250-refgen-regulator fallback,
the unmodified driver will attempt to read the 0x80 register during
registration:

drivers/regulator/qcom-refgen-regulator.c:qcom_refgen_probe() {
    ...
    rdev =3D devm_regulator_register(dev, rdesc, &config);
    ...
}

Could this unclocked MMIO access trigger a synchronous external abort
(SError) and crash the system during boot? If the hardware requires a
different programming sequence and clocks, should it avoid using the
SM8250 fallback entirely to avoid regressions on older kernels?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-ipq9650_re=
fgen-v2-0-d96a91d5b99e@oss.qualcomm.com?part=3D2
