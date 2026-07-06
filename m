Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D8D30BF6D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322684; cv=none; b=eCpVeRYWitoHDO29dmbH/twGEeEouvhCIFutVnvqihQs42iLDj9XedM7nK3csPCyWvR+iKhuM2fqEcb7Xm8YGn7vzjb+60+a+o6rtU3B3DBlSXXIwX0W+oYnR/5+X/Eiv7rcieLX5a8J3ia2ea2quWN+31vaFeIdRcmWkmXfS+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322684; c=relaxed/simple;
	bh=s3t/MXCx2ioiWJWJDWpE45uCS9FdeO6Nb5Op0ENqtuw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VMaXMwv2E8CG7ha3NdcV7qSG1wmmzHu3gs+wvtd2gtLugsNQ4ibOJ8PGmBeSaYVzTkXHAROnEabpQXRP8uvcTbIpcl+RvQFRNgtMYakvA59j9Il7y4KyCkWQDLjXJ80v4TpojwcjjVAfXKgBKRczAxIdWMkEp1hK9pjH4DQWHuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hsm+zYzr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hsm+zYzr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4981F00A3A;
	Mon,  6 Jul 2026 07:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783322675;
	bh=z6xkpALhpBcWDej1dKMsLP7CfhqvQ9E4+rZjijLmS4I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hsm+zYzra5FSp6gvF4I4EfIh7+fq7jlYeOLWaksgm720AWBhtoemmAZXcdYo3pNRF
	 6r7COxjIztmx0p3oHBEzJCUtO3ttWBM/s81qUkVIHc/cRGcPfyNFkxuhsKon5xweoI
	 py/PAW3j2/BA4KbEOj5UqNyu8qIO2gAt534/8+S0FGC/c/ngeyk2ezt1bD+CTCbJwY
	 Pv0HuoaSoVCfxjcjQsLXBDDeiAosk9Ps7HfpmENaRoE3Orju0erbefv3qEZC1W+yKu
	 aQd7YUaJzv6vi6tt2VWjrANgd/h9QEI9fjlxV+Sr2zt4SCUZhE0FnLHS+Mln81VPRA
	 n7ZUH1s8urxvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: media: qcom,sm8250-camss: allow
 JPEG encoder child node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706071113.383215-3-atanas.filipov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-3-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 07:24:34 +0000
Message-Id: <20260706072435.1A4981F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Changing `additionalProperties: false` to `unevaluatedProperties=
: false` without defining `patternProperties` or a bus `$ref` will still re=
ject child nodes.
--

commit 4a343ca8c275f84ef82003dd286f9fc438eb243e
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

dt-bindings: media: qcom,sm8250-camss: allow JPEG encoder child node

This commit adds bus properties to the CAMSS node binding to support child
IP blocks like the JPEG encoder. It also changes additionalProperties to
unevaluatedProperties to allow child nodes to be validated against their
own schemas.

> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index a509d4bbcb4aa..6008938ee369d 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
[ ... ]
> @@ -317,7 +325,7 @@ required:
>    - vdda-phy-supply
>    - vdda-pll-supply
> =20
> -additionalProperties: false
> +unevaluatedProperties: false

[Severity: Medium]
Does changing additionalProperties to unevaluatedProperties actually allow
child nodes without defining patternProperties or a bus $ref?

When unevaluatedProperties is set to false without a mechanism to evaluate
the child nodes in this schema, won't dtbs_check still reject device trees
containing the newly added jpeg-encoder child node?

> =20
>  examples:
>    - |

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706071113.3832=
15-1-atanas.filipov@oss.qualcomm.com?part=3D2
