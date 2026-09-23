Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F034477FD
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146768; cv=none; b=rGS1PZUytH2mAHgiXDjZTK7gn1s3y14p4evdQ2b/lrHqghaixJr1Zn1jkvtqBNMxmsxtvbkzT5CsSK137adWgUAPZjQ9g7QzHOoBIO3PLfOjZQ7T+vx/Lq+Jt5fYoIfBh5BaEthr6eKRJG5ylzKGPO9z7Mwq0SlvUjSMTNVnONU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146768; c=relaxed/simple;
	bh=/VBN+90QhOp3IYioJYfuFKSaqHDzXArPWPIsLQ298TQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e1z5DpWQ1/CIfrk6JHu1lLRw8PeHTVCUfdy/PjZ5Isk2BHVLgDa2DBJKit++49C5ucaSzbftSjzX2zR0SMcY/0K+v6b8NHP2jl4+QBGZTau+q//XUWAvk8XqA1KxSKztDBqwO/6tk7vz/sHVOp/insgh76YuVzRLes3AnfAaGsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/cJp4xn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/cJp4xn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCFF1F000FF;
	Wed, 23 Sep 2026 06:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790146762;
	bh=sIhkUxmKSU6miDtZ6RCjVenk13ePhvswJox0sEf7FN8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G/cJp4xnDQvkSgDliSMjBQjDc2+Uzec1BIMj1jcZaKZrm7CN15NQ+LgMrJU6g45gb
	 jKKEMhoz7/ogGyD9MTqNHNBrSI9Pqr00m5FHkCgYs5qpkQvAp1eT8DKfnRdLE2AwvI
	 87t3XvIWPZx9S31pDBeupOI/VGCdx5aCd6jlxzAcsC8iNnzJZpsIiBzpEDFEZ9dwsS
	 6f15b3zxh36nGQC9LAe/bUlAmHCWmjB9mzY4HjMCtmkNza2hrCFA2kLTE6lYptvS0v
	 p68AVo9PiTPKfnjr0yrl5Exd/9eLE2kauXuAqS43mnJzfCTtXxflG/ln26oKoMiDZa
	 j3ISPLFQny3zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923-b4-qaif-shikra-audio-v7-1-d5b6f056568e@oss.qualcomm.com>
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-1-d5b6f056568e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 06:59:21 +0000
Message-Id: <20260923065922.0DCFF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing dt-bindings header with DAI ID constants
--

commit 9d6bea13996a8ff10d5aa371fa14762934b560fe
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding

This commit adds the Devicetree binding for the Qualcomm Audio Interface
(QAIF) CPU DAI controller on the Shikra platform. It describes the
controller resources, DAI cells, and per-interface configuration nodes.

>     QAIF routes audio between system memory, external PCM/TDM/MI2S serial
>     interfaces and the internal Bolero/WCD codec. Platform Devicetree fil=
es
>     need a binding to describe the controller resources, DAI cells and pe=
r-
>     interface AIF configuration, and named constants to avoid raw numeric=
 IDs
>     in sound-dai references and child-node reg values.

[Severity: Medium]
The commit message states that this patch provides named constants to avoid
raw numeric IDs. Was the dt-bindings header file containing these constants
forgotten in this patch series?

> diff --git a/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu=
.yaml b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
> new file mode 100644
> index 0000000000000..5cabbe54d6fd8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml

[ ... ]

> +patternProperties:
> +  '^aif@[0-9a-f]+$':
> +    type: object
> +    description:
> +      QAIF AIF interface child node for PCM, TDM or MI2S configuration.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          DAI ID of the AIF interface (QAIF_MI2S_AIF* or QAIF_TDM_AIF*).

[Severity: Medium]
The schema documentation explicitly refers to the missing constants
(QAIF_MI2S_AIF* or QAIF_TDM_AIF*). Will subsequent driver patches that rely
on these undeclared constants result in compilation failures?

[ ... ]

> +            #sound-dai-cells =3D <1>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            aif@b5 {
> +                reg =3D <181>;

[Severity: Medium]
Does the binding example fall back to using a raw numeric ID (181) because
the constants were missing? This appears to contradict the stated goal of
avoiding raw numeric IDs.

> +                dai-format =3D "dsp_a";
> +                dai-tdm-slot-width =3D <32>;
> +                dai-tdm-slot-num =3D <2>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-b4-qaif-sh=
ikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com?part=3D1
