Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDAC3E51C1
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500288; cv=none; b=WtybeOMWOxfG1OmCxPo43TrcI2lbN8vxdjMP3e3aW0mBS3U9IR6HnUh7xVauLoAeswdcWsjQChwUH6YXwfFXEDZRt9QbUX7KAyEqwJMw70ap3SmAq8OLEi53ru2rDpmXZqrLrExPMP3sExAIwTTkW+44soaMn0wZtV77bQ0Qoeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500288; c=relaxed/simple;
	bh=ZnpcTYkrl6UVMmxdRN9nmnSy8X49AM9816i+X9vNISo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DVOLsUJC+ed4aV0ezqnFYvbviLttkQ6ybYMTEMggX/NOqpOIxEWvMolpt2wLcD0yx/RncmgCwekrFF4A+jEF+DCAH50t4SMBsQ/Orkn9F+sAZeRynlEkxc5DePol6DvJlVPmZvXrVzNWC/Zj4oITWmYbkEfIlalPRJ0FsBzlRt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xjcr8DmN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xjcr8DmN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5DF71F00893;
	Wed,  3 Jun 2026 15:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500287;
	bh=VBXYpUPJj45hHgdQiSDTelr0i3Po08FW2pnai/5JD54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xjcr8DmNXikXu2V7+UTfRawsOU3ArYXPhtlVp4Sz+g4/2AOuKsGzdNyxS77rV0782
	 d6LnOIKqj69iwHpoUGFsWr6eB38aoIk2YDfte4f2YQmPBZvi8lRYlKyoPRnNFHtRvq
	 CH7oW685zBGIBsLmmTpqi57aimbpXBun/9k3cW9FE/Vnvmf7faKBQyvtNy/JzmR4Ri
	 IgotlRZ8sevve7vQqty42cfvaD56WwyC+n3091mTBm72gpq2uAltDzRRwQBVUKDwzl
	 49KIZlW2aAGseyLDcSftB5tPSZdMA7/qmM+TC2pRW2IQWeS0rvnEMeJaex97w59EyD
	 K9SSWpiC+Vpgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: versal-clk: Fix mio_clk
 index range in clock-names pattern
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Simek" <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <5662c24a9e65310fc6520afc95f1a639fe6d221e.1780499520.git.michal.simek@amd.com>
References: <5662c24a9e65310fc6520afc95f1a639fe6d221e.1780499520.git.michal.simek@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 15:24:46 +0000
Message-Id: <20260603152446.C5DF71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The updated regex pattern fails to strictly constrain the MIO in=
dex to 00..77 due to the `+` quantifier and `.*$` wildcard.
--

commit 1ce5272f4b64f82cb19e5c321c26383c8c4fc25b
Author: Michal Simek <michal.simek@amd.com>

dt-bindings: clock: versal-clk: Fix mio_clk index range in clock-names patt=
ern

This commit attempts to fix the clock-names pattern to enforce a two-digit
decimal range constraint for MIO indices from 00 to 77. It replaces a broken
character class with an explicit alternation.

> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml=
 b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> index bef109d163a82..d843d95801b5f 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> @@ -116,7 +116,7 @@ allOf:
>              - const: pss_alt_ref_clk
>              - const: aux_ref_clk
>              - const: gt_crx_ref_clk
> -            - pattern: "^mio_clk[00-77]+.*$"
> +            - pattern: "^mio_clk(0[0-9]|[1-6][0-9]|7[0-7])+.*$"

[Severity: Medium]
The commit message states the intent is to constrain the MIO index
to the valid range 00..77.

However, the + quantifier applies to the entire alternation group, allowing
repetitions of two-digit numbers like mio_clk0011.

Additionally, the .*$ wildcard matches any trailing characters, meaning a
string like mio_clk0799 passes validation because 07 matches the group
and 99 is consumed by .*$.

Does this introduce a regression where the schema silently accepts invalid
clock names?

>              - pattern: "gem[0-3]+_emio_clk.*$"
>              - pattern: "swdt[0-1]+_ext_clk.*$"

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780499520.gi=
t.michal.simek@amd.com?part=3D2
