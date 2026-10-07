Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB643C0A02
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 11:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373681; cv=none; b=B184u6xBjEYdD4vvp14u3Q6LRou9MGBGvDbDwy3Kv5hPPG486AazRJx/bJRzumZByo+lrZjE+KxOu5Eq4NxU8cTw8dVQqwvOtyuHIP4gshtE7k0oEEbJ3MwiajnqZPQclyeGmcZc+i1LoV2PGgRKEQsn35AXjLytUf/nBuzHgX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373681; c=relaxed/simple;
	bh=xV/jHUxhpvVETOXE92gHNE2uz7g5MONgp+vg2NKvqkE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DXPwjHMr3Za/V6oH1rr2N107N2sgdu1VZ4d+q+dCY7Oa/uClemi0Mxvf/cV8BCM4lnFqVldcYh4hdvLEEJh19BD7x07YOYJwPmmCAgeueTGRXj54A2gDUlcfbWdLyMMnwCHN3VqDUhLhF9EM5yS3lyutAYngRSPZ+y1wH8jcCNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPua/gsH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPua/gsH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E818D1F0089B;
	Wed,  7 Oct 2026 11:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373668;
	bh=9dUeXiwnfDVHCUrD+OUZ0Z7LgFeNzoItN6qTx/Lipx8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BPua/gsHAZWdnMskQhhuThi2ZCJKF9OAElQ1DrWwlRDyJ+Bj1vrBbx9WG1ZPJu0z4
	 g+5VXSir0xyOGsRBwASaSNU394kioWk83KZDcN9f4IbcgGhOmrxWbzyQMrlkCtUtB+
	 8IEYl66QTiMRqNoML18iPyHCqIm4XaNXe75K4/M+yr0E4Dss+wJcUDC+Z5v1HbxnV1
	 X2ltOQaY7AO+C5Q7JWvn2C6FIyuKtviuAAhBqx8cuLO43fNgUGscqop3OYZnmHTW/N
	 jOLA5TfX/1wwZ9th+lY6x1NyPRTEPv1sIrd+JNmPsfxtSiJdnu39A880cw7DMrHms3
	 IBQ9+cLEBPRvw==
Message-ID: <sashiko-outbox-162936@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: misc: qcom,fastrpc: add
 iommu-ranges support for context bank
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinayak Katoch" <vinayak.katoch@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261007-extended-mapping-v2-1-5dca3aa2c2d3@oss.qualcomm.com>
References: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
 <20261007-extended-mapping-v2-1-5dca3aa2c2d3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 11:47:47 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: namespace violation and missing type for iommu-ranges
--

commit dcdf3e61cd19c2e633ae438160d6dad2d5a26363
Author: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

dt-bindings: misc: qcom,fastrpc: add iommu-ranges support for context bank

This commit adds support for the iommu-ranges property to the compute-cb
subnode in the qcom,fastrpc device tree binding. It allows the context bank
nodes to specify IOVA ranges for the IOMMU allocator, and relaxes the
address and size cells properties to accommodate 64-bit values.

> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/D=
ocumentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index e945c8ba75e30..f4ca9a7672556 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
[ ... ]
> @@ -98,6 +98,8 @@ patternProperties:
>          minItems: 1
>          maxItems: 10
> =20
> +      iommu-ranges: true
> +

[Severity: Low]
Does this property need a vendor prefix since it appears to be specific to
this driver rather than a standard device tree property? Device tree namesp=
ace
conventions generally expect a vendor prefix for non-standard properties, s=
uch
as qcom,iommu-ranges.

Additionally, should this property include a structural or type constraint?
Defining it simply as true without a type reference, such as
$ref: /schemas/types.yaml#/definitions/uint32-matrix, seems to bypass schema
validation. This could potentially allow malformed data to silently pass
the dt_binding_check validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-extended-m=
apping-v2-0-5dca3aa2c2d3@oss.qualcomm.com?part=3D1
