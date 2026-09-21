Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0837647D928
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 23:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033474; cv=none; b=BJC7iAOQVV9p1Nc54dKBguhLZV3VlV5TP82U96X2EYQUdtqvFysyHeuMFerfl0+nIc//kHFyQP++9z6N9aXwuGZvFEX3ca3YOvcpr5Dau2ArN5K2vUrxNxsfzFI4zOW7DimEtxETq1kvW1OGDOIfevDXDHDdgU7fcfYqjUWXqjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033474; c=relaxed/simple;
	bh=dEtbBP0D/W234d+3ol48LdmRQr60bus9qcoXjjIyfOc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K06Bzu1QcXtXNvb18MmlZFznYk73hqCaNTB9TDarPgQjIlsisWZW8twESQly9euKIChbsGxSSYOp0lwk1RcSUsG7F0QD2iuo3fv97WG1IyujY2b1oYZB8njMXmIxgiGS/FGtP+Q3bPkgVvz+IS8P6ObSvrhsmTSS+IeCFcEMfDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEuv9S3O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEuv9S3O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3ED1F000FF;
	Mon, 21 Sep 2026 23:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033466;
	bh=elDywjZ3s1n2qOTXyuTfIYnsQEe8Pq4iCTbp1TRt1jE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iEuv9S3OcMRWBAlQqRju/XIqon5tWplAZrENM4RTotVTahRCf//sK0CSbUizN2uVN
	 +ZOF8hx+rmONU/6FnzpNXJizonzTZ0JObRP2UrcmUwZpxZeqBeVsmZtmrZVgh2pKje
	 iPWB7ULTFkuYx+2zz6UEzQRt0RSH80T7uCpSxAwhCpsFkqdUwMEEdRtRG26oUIvELM
	 A4FxojfZKZjFAcf5+APxssVdFPLDgYKqs9VHa2/KV8II5Foif3RQAZxa4ooWCBEgdq
	 HmSL4k78xj2MJOM/RbSEPY5mS5TmMPSdpFtwB7SHS69UGmUvlNuSPcAyf7F9uvD9OO
	 oVN6nO5RKeGcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: soc: mediatek: Allow pwrap regs
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921232527.3127894-1-robh@kernel.org>
References: <20260921232527.3127894-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 23:31:05 +0000
Message-Id: <20260921233106.4B3ED1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing referenced mediatek,mt6380-regulator.yaml sche=
ma
--

commit 73b0295b13e9c91b5f296071d21498bc710f649e
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: soc: mediatek: Allow pwrap regs

This commit updates the MT7622 PMIC wrapper binding to add a child schema
reference for regulators. This change routes regulator subnodes to the
MT6380 regulator binding for evaluation.

> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwra=
p.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> @@ -105,6 +105,9 @@ properties:
>    pmic:
>      type: object
> =20
> +  regulators:
> +    $ref: /schemas/regulator/mediatek,mt6380-regulator.yaml#

[Severity: Low]
Does this introduce an invalid schema reference for the regulators property?

It appears the referenced mediatek,mt6380-regulator.yaml file does not exist
in the repository, as the MT6380 regulator binding is currently a legacy te=
xt
file (mt6380-regulator.txt).

This can cause make dt_binding_check to fail when resolving the
cross-reference or silently skip validating the regulators node. Subsequent
patches in the series also do not appear to add the missing YAML file.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921232527.3127=
894-1-robh@kernel.org?part=3D1
