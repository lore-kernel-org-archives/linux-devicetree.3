Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731F35218AE
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868534; cv=none; b=fUZEII2hw92C/OZWSeXiKHPeTay4WpmxAhrKPc7DIMbfDH1rgJqi29TpbDRESgKjm5J+QD7uVywacNqDT3jWRMhwvaT/E5N0B+2wn6a1P9OnYm0Mr+hkbGNYLekv+tTHBZiOiuEvSu/Q/pIuh7e/FONC5JLgE62J4RGeGDAtN94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868534; c=relaxed/simple;
	bh=rmKerZi3luEqeuZWMREwrVYzBopzQ0WqojItONNbE1A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k33Fmknxv4MY4wZA9kaV0/tcb9s0WvfDLsF84C3uYh5XY67NmG0hYNg/OIpjTGjsLzelnfycOGYb469g1WimgmFxq6Ogosf6FCJi+Hg3kSQIN9fm1Jm28+sPCsU/gelCoHRpXx2tWTeh2Xh6hIx5XyI4BCJv3WnPUxp8nBy7hH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfxgSwBj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfxgSwBj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FD41F000FF;
	Thu,  1 Oct 2026 15:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790868533;
	bh=fKSWDcLTqW9pg6bRs9OIrgWViEsUaEqJqsOG6bM8GDM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UfxgSwBjky4k1C0QatQtMZBkJPXZ+tCTynM7BjAS7+rDepkcVGzpZkBbSiIVo1lZ4
	 MlbVwenDHmPlQioT7V9TLl7DDWbMnojKdkYIRgBBM9amyjSgRo6VcfC4JQ0Z/+0igx
	 3XBVSiops+HXmr04UuDDluIEeE4hsL0+5D6qMTXNx4LI5Q2arlDDkzL00Gn5FOfcT7
	 ykxi72Rxo6N2jXWGLCliR3hJpRPOrzu6qmBxH9wX7cWN2J6CND5H6afHTq0qoxjklx
	 ZrRKwY2M40JRhakOatNFq2VLZIoqHia7wcuS7rMIfsXdAxShkiG4o6L92pEI3/FsO+
	 7sggxrpEq4YJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/6] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261001-kaanapali-iris-v4-2-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
 <20261001-kaanapali-iris-v4-2-642f9ac5e699@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 15:28:52 +0000
Message-Id: <20261001152853.12FD41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing minItems constraint for Kaanapali non-pixel IO=
MMUs
--

commit 6f9f95b21ddb33d1c70e144093a6e9d9d8fc8379
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: dt-bindings: qcom-kaanapali-iris: Add kaanapali video codec binding

This commit introduces device tree bindings for the video encoding and
decoding hardware on the Qualcomm Kaanapali SoC. It creates a new
platform-specific schema for Kaanapali and increases the maximum item
constraints in the common venus schema to accommodate it. It also adds
explicit constraints to existing iris schemas to maintain their fixed
upper bounds.

> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.=
yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
> new file mode 100644
> index 0000000000000..02b3fa3b5e11b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
> @@ -0,0 +1,227 @@
[ ... ]
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: video-mem
> +
> +  non-pixel:
> +    type: object
> +    properties:
> +      iommus:
> +        maxItems: 3

[Severity: Low]
The commit message notes that the platform-specific schema defines fixed
constraints for these properties. Since the common schema specifies
minItems: 1 for the non-pixel iommus, does this omission of minItems here
allow a configuration with 1 or 2 items to pass validation?

Should there be a minItems: 3 constraint added to enforce the exact
hardware requirement for Kaanapali?

> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-kaanapali-=
iris-v4-0-642f9ac5e699@oss.qualcomm.com?part=3D2
