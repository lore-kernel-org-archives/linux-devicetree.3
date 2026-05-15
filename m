Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EDA46AF06
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844591; cv=none; b=R4bHpeBs/ZBsq+9YeD8jTpB1m+14oFWQHmWvFjbkhlv/txHUJf6XNwEgrpQn+nsHFe5TqaxR4gE+FchT2t40z7hDhf9bDG8hIt62LsG5cShpPz4P1XFyD/I3l/BlISxDStFiy9TWi6fj/MyYEPLOa7BncVMLn6C9q2PWaopcQiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844591; c=relaxed/simple;
	bh=txlxUr5DJVEFtM3LpEoJTYszKxgADy7JI8PLX2y91Ig=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m9Jq4wYpoPAZohDYPhaNekGa8lNVFm6KBFg+yLWnPwPAo4Fzm2mGMPuQCu+Vy2whh8OxrBw6q7fyV8FWmQ2uA1HEZ+V5717eMZpLBEUKT0oIwqwqM+H2W1qeo/hmyi/Liy8vxCaN4m6tNWXKI3BV3KiIwk1vQELW9ll2atzB6mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fg3u34xy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fg3u34xy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D66C2BCB0;
	Fri, 15 May 2026 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778844591;
	bh=txlxUr5DJVEFtM3LpEoJTYszKxgADy7JI8PLX2y91Ig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=fg3u34xyLyjtlWCLeSFpoKUteN58aWYwywG5/jsKX0t4M1cGGsmtXbhASTYrKNHF7
	 Ov2cOsPBbD1N2YV1f4O7LY3BqCWJwnWSNDPORudsp7oKxprS6CcGPRb7en8MRaqOmx
	 zZ9p0A9nUA8LfGo3TTpNEKc+lCJgSXUZfW3d6m8caqFcxcTy8txba3CG//OVBbJiXr
	 c1peJGHNrx+XBPw5r414C1K5/GkysyCrNDaoTIBnw5q/sPdhhToY3h152kZ3D/2roj
	 Qb/r67b65QLfTNTx70xzMfUbYm5nQTkVLB3hgY3g71D3S2QGcE9Txd97tBF9Uh/Enh
	 4eNyq78ykSo+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: Document Eliza CQM and CQS EVK
 boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com>
References: <20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:29:50 +0000
Message-Id: <20260515112950.C4D66C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The compatible strings strictly enforce a 2-element list that om=
its the intermediate System-on-Module (SoM) and the specific SoC variant co=
mpatibles.
- [Medium] The compatible strings and commit message introduce typographica=
l errors by using "CQM", "CQS", "CQ7790M", and "CQ7790S" instead of Qualcom=
m's standard "QCM" and "QCS" product naming convention.
--

commit 5133e80c24b03ea2551cf3393bae586847e425a8
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

dt-bindings: arm: qcom: Document Eliza CQM and CQS EVK boards

This commit documents the compatible strings for the Qualcomm Eliza CQM and
CQS EVK boards, which are built from a base board paired with a SoM that is
populated with either CQ7790M or CQ7790S, PMICs, LPDDR, eMMC and UFS.

> dt-bindings: arm: qcom: Document Eliza CQM and CQS EVK boards
>
> Document the compatible strings for the Qualcomm Eliza CQM and CQS EVK
> boards. Both boards are built from a base board paired with a SoM which
> is populated with either CQ7790M or CQ7790S (Eliza variants), PMICs,
> LPDDR, eMMC and UFS.

This isn't a bug, but there appear to be typos in the product names here.
Should CQM, CQS, CQ7790M, and CQ7790S be QCM, QCS, QCM7790, and QCS7790 to
match standard Qualcomm naming conventions?

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index 2741c07e9f416..28a18254b4b75 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -63,6 +63,8 @@ properties:
> =20
>        - items:
>            - enum:
> +              - qcom,eliza-cqm-evk
> +              - qcom,eliza-cqs-evk

If the typo mentioned above is confirmed, will these compatible strings
permanently bake the misspelled cqm and cqs names into the device tree ABI?

Additionally, does this 2-element list correctly represent the hardware
hierarchy? The commit message notes these EVK boards are composed of a base
board paired with a SoM populated with specific SoC variants. Placing these
compatibles in this block restricts the list to exactly two elements, which
omits the intermediate SoM and SoC variant compatibles. This might cause
validation to fail on a device tree that attempts to include the SoM
compatible string.

>                - qcom,eliza-mtp
>            - const: qcom,eliza

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-eliza-bind=
ings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com?part=3D1
