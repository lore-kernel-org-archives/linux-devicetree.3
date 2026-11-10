Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794295428;
	b=pzmdRaOWiCW4V9wuQyneUaTvYx6VhHrBvLk8NKet3JHJ4PbZt/sRq7Cvstf1AYFS5D0y
	 VIQ2GEBSes9429URy5+lUznLZbJuaOEG0nGoA0q4jFY+YMSayHS60ufgny/cmxAn6whkd
	 2eMjIAX/c7vcp5nqoA5SHjaYcp7IMxlQq1T137yVPaYZj9S8B6L3/ZwB0Ji9MtKSXBeGd
	 IDitmO04UOYl0Nrt+8RadJuW50fVJqggAI/yPupqMoheDPVJwqLMnX4Tdw97Me0R62vm7
	 CjSCXeJ5U1ugSd0SgBf7J+0wppaswTgwLQ+rWPLREMARm35dlD7ErgpVV4NjQG7dE9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295428;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PARC/I2iyCF6h48VHRzrLzNVpQgzglAh4qBS9viN1Xs=;
	b=ycHpbSEwVm1uFaItNycxP8ImyHjXwfjLLD1DCU+r4tD4csibyhLfPzY6GRqwoEzPZ/Q9
	 dWOXLoPaDoPejTZt4S9k1PizIQE+qMVUs7OkScJCkmenz0ouVEEj08ccpAhmiP6eT/SLc
	 lmYPvoGHE+oB5pPUIwL6qekEO6fnx4Ac6Hs2j16PnodkYqd0XcvMfDQVdl92OV0f+FD55
	 3PvQ+Z3wjCwSy0FPOwU6zR4Coj9C0fvWOuazIdxnID35P4fxLCZc1hbjtcWxSygRZMCeY
	 0mbVkUI9bJWFoWO6bAGsFaJG4WWOa5osuUd6RMH95pMDSbSeielP1/A+zgvG9lp5jtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADzY9dbm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA50606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADzY9dbm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0259F1F0089F;
	Tue, 10 Nov 2026 07:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295428;
	bh=PARC/I2iyCF6h48VHRzrLzNVpQgzglAh4qBS9viN1Xs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ADzY9dbmRX1uxx3HEu0CAuiehVBzUGfXq0rUv3d9MALYmV+m6yPunuldWTdUKQdGU
	 bapKmAtreMv3xeQCQiH7qur5yuwPMCi2pJ79pkbwhOHzPYpbV4UKXuQWbYiUwdVrbF
	 lrGwTQdxZPJ9KFkQpILS1b9tUPtsED01mr8gsAozmuzBZhK1P+w9WxXRrskqlHEN/u
	 F7Sq9CPxLtnLPdiklr/aKnsW4PoYksW3+rcgaQDcnzzIjecDsfQgIG5Iav8LnY0qh5
	 xAcmnC+TRWNeMJAeVi9tHiVioe1sqefLchvylIB0KsNVxvAU/+CBuAD/B4XSAIGDWV
	 fjhmawvf4uYWA==
Message-ID: <sashiko-outbox-206483@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: iommu: arm,smmu-v3: allow clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-smmu-v3-pcie-pd-v1-2-628819ca44b9@gmail.com>
References: <20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com>
 <20261110-smmu-v3-pcie-pd-v1-2-628819ca44b9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 07:23:47 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: iommu: arm,smmu-v3: unconstrained clocks property
--

commit 42a979d69e35794390e397c67d04e277f3c21933
Author: Arun Iyengar <aiyengar1990@gmail.com>

dt-bindings: iommu: arm,smmu-v3: allow clocks

This commit adds an optional clocks property allowing between one and four
clocks to the arm,smmu-v3 Devicetree binding schema.

> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/D=
ocumentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> index c8f22dfdb1dbc..f8a74730667c8 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> @@ -63,6 +63,13 @@ properties:
> =20
>    msi-parent: true
> =20
> +  clocks:
> +    minItems: 1
> +    maxItems: 4
> +    description:
> +      Clocks needed to access the SMMU registers and to keep its transla=
tion
> +      units running, if they are not managed by firmware.

[Severity: Low]
Should clocks be constrained with an explicit items list, clock-names, or
implementation-specific compatible strings instead of allowing 1 to 4
unidentified clocks on the generic arm,smmu-v3 binding?

The SMMUv3 architecture does not define clock inputs, as clocks depend on
the specific implementation (such as MMU-600) and SoC integration.
Allowing up to four clocks without per-item descriptions or clock-names
(which is rejected by additionalProperties: false) leaves the clock
ordering and identity ambiguous whenever multiple clocks are present.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-smmu-v3-pc=
ie-pd-v1-0-628819ca44b9@gmail.com?part=3D2
