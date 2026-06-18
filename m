Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFE73B2FE3
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781772067; cv=none; b=hbQKXPOg5q0G2ghBI+y9GMmwJv1mqC1zW8nXjoDedWL3rSfOZ37UnyqoAoMcwFDoQ+Hiwxmd9Cx5k/alozSMlxq4ts0FiS5JfIaa0YDShjbSOrLo2q1mZ0Cp6jXxHS8Dy144iZHX1aH6hracKPVtnKykAn6oSBaSReRg9Z6UntA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781772067; c=relaxed/simple;
	bh=zJoqCrg1Az91XO7omD57wW62btsUBb2otnD4bDhDidY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qyMGxyPUTcy9w15cCGL9E4jwJX7dj6iGxhEzB4l8vsjgDnmdmDG8Rjif1sE9xBRV8BEAJAZoajvQpbYS4yg1mGmo5MpZKEf4PkQ1ibYnUNjVIXU/iOgvi9VI11gOCNs7RKdpsyKS4iOVF7LTgbER+JsoQe0rn2RvG891Z/iNJhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+k0qbVQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+k0qbVQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419321F000E9;
	Thu, 18 Jun 2026 08:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781772066;
	bh=3gj/5HpR9+jAQLnxLoskEKtco0fVgNSFt3gVi3EShQQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e+k0qbVQNdJJLxlWWCJifNWvgnBxqu/Po8u9eA7YcatE1xqeklwCKaAa8ghFpTlSR
	 ggY9OrrcD+mYhQznZpdXVi067LchbhQIhDk+3QZslj8kVl4G4iOGzUEH5d/AIIqBpR
	 Fj2B9MESy0u/YdZNBIKoXo1abO83vsLLQEdobIDa0/+bzgiFalwikeX/nRogXoVa/r
	 OMgabtsnw/o9vm+xP32L7qmlDdetGffHXFDOzM7iXX7f3tfFmWVguROBpuDlcUtp8c
	 GvSgpY69WJx40psrBaqstn4a1vYo3kCjJ1dHiNhufIiewkN70HUlJatb5SUm5CP30G
	 C/3k0BB2q1fpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] ASoC: codecs: ES8389: Add INPUTL MUX and INPUTR
 MUX
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260618082842.2778-8-zhangyi@everest-semi.com>
References: <20260618082842.2778-1-zhangyi@everest-semi.com>
 <20260618082842.2778-8-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 08:41:05 +0000
Message-Id: <20260618084106.419321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Logic error in get_coeff incorrectly treats 0 as a wildcard for dm=
ic_sel and dvdd_vol, shadowing specific coefficient configurations.
--

commit 6402e3af14ba28c3424e8a95b28fe5d44fa00f37
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Add INPUTL MUX and INPUTR MUX

This commit adds INPUTL MUX and INPUTR MUX to the DAPM routing paths for
the ES8389 codec.

> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> index bcec9d9200dbe..294951d49432c 100644
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but looking at get_coeff() in
sound/soc/codecs/es8389.c, is there a logic error with how dmic_sel and
dvdd_vol are checked?

sound/soc/codecs/es8389.c:get_coeff() {
	...
	for (i =3D 0; i < ARRAY_SIZE(coeff_div); i++) {
		if (coeff_div[i].rate =3D=3D rate && coeff_div[i].mclk =3D=3D mclk) {
			vddd_det =3D ~(coeff_div[i].dvdd_vol ^ vddd) & 0x01;
			dmic_det =3D ~(coeff_div[i].dmic_sel ^ dmic) & 0x01;
			vddd_det |=3D ~(coeff_div[i].dvdd_vol % 2) & 0x01;
			dmic_det |=3D ~(coeff_div[i].dmic_sel % 2) & 0x01;

			if (vddd_det && dmic_det)
				return i;
		}
	}
	...
}

Because ~(0 % 2) & 0x01 evaluates to 1, doesn't this calculation cause 0 to
act as a wildcard, evaluating to true regardless of the dmic or vddd
parameters?

If entries with dmic_sel =3D 0 appear before dmic_sel =3D 1 in the coeff_div
table, could get_coeff() prematurely return the wildcard match?  This appea=
rs
to make the correct clock coefficient entries for dmic =3D 1 dead code,
potentially resulting in incorrect clock configurations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618082842.2778=
-1-zhangyi@everest-semi.com?part=3D7
