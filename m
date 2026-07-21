Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC93B248F57
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649512; cv=none; b=hlhXyApZDroUz6D+ueXn82jiFEcSY9A0HzzpbLdSEFRfN8EQvysd02JTXApmTdwupOaKv3rGYmt2sb0i+v3yGuG+uVQfcstrZHjsteilz9m2KN/rB0C9k7Y7jwfhawRQlyEh5Xw76vOfvZxMCY+bXngfPiLvo++k2jzJHPlydA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649512; c=relaxed/simple;
	bh=IlQmJXM/kA8wPeMSZd3K7W41FiUJ9KzxafeRFzG8Aco=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q5esbgElrAmbGclBoRm1XdVr/dWBLqMyzFCEfmgHrkjOkh6jZS32FV8IlMDLYWlDnTlrfKbzgvlHo0uXAOL1NDkr6IszDgO016i9aBKkOo4xw4RipdlZlzowMQEsZPjESomzG8Lbl6vtnxjwX06L6dt/WRiQFt9njZq4BuOr4m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=he0gcl2H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="he0gcl2H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741EC1F000E9;
	Tue, 21 Jul 2026 15:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784649510;
	bh=u1vnwDZRnP9Bve2ng31V5FchF9YvYw64jNmYYMOrWC4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=he0gcl2H6vE5dJyqjN4XLQGdBfYzZpbqDV0ibWyC1CdS+iuCNBNZ0yqk0A2wZRfNQ
	 aLyYZcaGFzdhZ3RTJilWQBUyPX/QDO6HVm9+dfmIgxgh8FsZub43zyAVzY49JADbHj
	 owhNyt5sKtOHi5QTs2/SBg1O3Z5WFMqT2Pq1D1N7+LyNb0IK4I5WSMG/8AKwyuJJ/O
	 CjvNuNFx6inaLR5g2mHfW/HnpvRvEvE/eHASB5uRP4VFBd3BmU/wv8LUToO7Hs0ZTk
	 KWKg+h5ajqN56AMIkgZM0Czni56OUI80hoHegQTzIIoCdBVi4rU9ZyfBUEcINNoRI3
	 ISudZGJdpQnOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: arm: qcom-soc: Validate nodes with
 fallbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260721-dt-bindings-qcom-soc-naming-v3-3-8f275c9d3412@oss.qualcomm.com>
References: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
 <20260721-dt-bindings-qcom-soc-naming-v3-3-8f275c9d3412@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 15:58:29 +0000
Message-Id: <20260721155830.741EC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit modifies a regex pattern despite the commit message e=
xplicitly claiming no patterns were changed.
--

--- Patch [3]: [PATCH v3 3/4] dt-bindings: arm: qcom-soc: Validate nodes wi=
th fallbacks ---
commit 5d9830a03b3532641c37f4db55bf3e194063f0c9
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: arm: qcom-soc: Validate nodes with fallbacks

The schema checking for expected naming patterns for SoC IP block nodes
was incomplete and was checking only nodes with single compatible. This
commit changes select to contains so that nodes having at least one matching
compatible will be evaluated.

>     These two above are the only functional changes in this commit and the
>     rest of the diff is indentation change.  None of the patterns are
>     changed (neither in "Preferred naming style" group nor in "Legacy
>     namings"), none of the compatibles are affected.

[Severity: Medium]
The commit message states that none of the patterns are changed, but the
diff below shows the regex pattern for the codenames variant was modified to
end with "-.+$" instead of "-.*$".

Is this pattern change intended despite the commit message?

> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Docume=
ntation/devicetree/bindings/arm/qcom-soc.yaml
> index dbc7877ee30e2..e72502f8df2c7 100644
> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
[ ... ]
>  properties:
>    compatible:
> -    oneOf:
> -      # Preferred naming style for compatibles of SoC components:
> -      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm=
|x1[ep])[0-9]+(pro)?-.*$"
> -      - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
> -      - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
> -      - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|n=
ord|shikra)-.*$"
> +    contains:
> +      anyOf:
> +        # Preferred naming style for compatibles of SoC components:
> +        - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|=
sm|x1[ep])[0-9]+(pro)?-.*$"
> +        - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
> +        - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
> +        - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos=
|nord|shikra)-.+$"

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-dt-binding=
s-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com?part=3D3
