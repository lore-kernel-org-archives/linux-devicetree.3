Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05C13403F3
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 16:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207151; cv=none; b=dzdzGCJfpMIrRTKZCX+41TkRuITG2iJ693VbSs5EuNDj3pNZVP8Gdj7MkB4vXH1lT0MXSGkfw0Kl/vzUeAivixfoIQVRPMTnsymmSQKhY8ZY+P+Rek7Kgq1tO+BPsadFai0H9oHpEB2/cjGEUyTkbsQeiUjOxFuUVdivMqnaq/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207151; c=relaxed/simple;
	bh=O3WZIyqsPG9apRHlevuVtIK1oB/WZADcSAP1zgtPoaE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rLwf5jnQqQJWXWPXBd+pSik5JHacc+6LlOH23ohW93qvEhU8fd5uyKSmuVGWsN++JtQXtLZsdhoCwAdVmbi8RnXsm1E2lrc3HhSnq+VpJ70BRx6NsWygWJoZU92JfpyAvvw45TZPbfpeiHptEGG/ZXg1PMM/fRhsneztNVcYTzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZA6S5cHG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZA6S5cHG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37FAC2BCB3;
	Tue, 19 May 2026 16:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779207150;
	bh=O3WZIyqsPG9apRHlevuVtIK1oB/WZADcSAP1zgtPoaE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ZA6S5cHGCTXTHV3w2pOH+xlM448Yl1qCSyIElls5dD1gYqa7QTvuNLBl5EN9Qiod4
	 ZAw2QkAh7/W2CamkkUl2R0vVi3IOl8i7Ze6YxU+3VqP3eA4Iinxf+qah1MolZRVRDV
	 OwkLlK4qMI0rhrFAGQxSkjawCM7kih58nb8imskBnPQAq0p26JlIdh4W1POBg1Plmp
	 eDLxkYC5jwbDezGjHpfrgMSAn5hJ9Mjailv24l2Kp4B3Hlz1KsPREMPwYb/LkQT7Z2
	 SlIbMmIjWqwhtcnMgPHY59GJo5rRR7rcoYGfXQBZmWVSdpNVx4H+68dk9HxZplEWYJ
	 oWj1WySFMtWew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: nvmem: airoha: add SMC eFuses
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519152807.29407-2-ansuelsmth@gmail.com>
References: <20260519152807.29407-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 16:12:28 +0000
Message-Id: <20260519161228.C37FAC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema is missing the compatible string for the Airoha AN758=
3 SoC, despite it being explicitly mentioned in the commit message.
--

commit 4691b687a514217a385c7b7725536b71c206a6c2
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: nvmem: airoha: add SMC eFuses schema

This commit adds a new device tree binding schema for the Airoha SMC
eFuses. It documents the access method for the eFuse banks via SMC
commands for the new Airoha SoCs.

> Add Airoha SMC eFuses schema to document new Airoha SoC AN7581/AN7583
> way of accessing the 2 eFuse bank via the SMC command.

[Severity: Medium]
Is the AN7583 SoC supposed to be included in the schema? The commit
message mentions both AN7581 and AN7583, but the schema below only documents
the AN7581.

> diff --git a/Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.ya=
ml b/Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.yaml
> new file mode 100644
> index 0000000000000..c52f8d4bec392
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.yaml
[ ... ]
> +title: Airoha SMC eFuses
> +
> +description: |
> +  Airoha new SoC AN7581 expose banks of eFuse accessible
> +  via specific SMC commands.

[Severity: Medium]
Should AN7583 also be mentioned in the description here to match the
details in the commit message?

[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - airoha,an7581-efuses

[Severity: Medium]
Should airoha,an7583-efuses be included in this enum if the binding is
intended to support the AN7583 SoC?=20

If AN7583 uses this block, omitting its specific compatible string might
cause device tree validation to fail for valid AN7583 device trees.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519152807.2940=
7-1-ansuelsmth@gmail.com?part=3D1
