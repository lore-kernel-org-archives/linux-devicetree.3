Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8A43148D9
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 09:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785661585; cv=none; b=Mg0K3iD6Zi5tROssWOD1fVpnpU/8gVqCDclAy9OomZT3JxkbzcpbMLNH9RVAK1++UwPzuGRVUj0zI3A+bWrpCWjOnHS2EMXB8sn9ecswu4Gv6fAxtFk5QwfEoC3u021bA83z9nGtFwC1XQMoPnFbCT1hbUrnDJhxOx4h9X8Olfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785661585; c=relaxed/simple;
	bh=nPtpQqMwyNDz6+d1/WBIohJqq5uj7lw9pwKtomovWB0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q+/68aP1fyB07iw0qBzTrKxv6kzWBYt3c5nD4kHMiZCwLlgcGaIUValkK93em6DWC2uKdagGXd1Zd8UM0ibymBqxzF+IHLiszjOvXMEfBU9YIKWzuqhG5CpfRWZFLBw4EVUP3SzQgY2xHVKUaBU0oRl00qy9jYhzN6tYhGKmDLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJsfXOOX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJsfXOOX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399B31F000E9;
	Sun,  2 Aug 2026 09:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785661582;
	bh=EhJGku1Hy5fzsrAHOxFKj51I/HLdnlvBQ2igy4Y2XLg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cJsfXOOXlyv3PKi69ebEtSSMaQA5eKpRCGy/5U4XJyuUcR33PVDAltL7UwbBQkTZ4
	 TzuU8fSJG7is74L/uoImfis/cr1dASgcf6OAoBjvRHIRHP9vBntVYOiPfnA0krQGuw
	 MPi01Olwcf3eKGwRhPg0My+V1aHsVD3gT4oW2cVH5uriWrIAsza6GbIsJcYKGt0Rns
	 1ROtDBrGa4RuKnPef6YuuEP/GocMAhPSb76eNq1zbknSJI6s96pKIe7mGu7tPi+lJY
	 zGbmIZu12TgNnfG8UtivFTtaM5zCKudOCWW1CgJmfgdo+piUJE1rX9aYVbqSS1yxh+
	 4xYscBBxYem+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/11] dtc: dt-check-style: Introduce 'stricter' mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260802-n-dts-style-checker-continued-v2-8-6c5dbd1ccfe4@oss.qualcomm.com>
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802-n-dts-style-checker-continued-v2-8-6c5dbd1ccfe4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 09:06:21 +0000
Message-Id: <20260802090622.399B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The selftest runner `scripts/dtc/dt-style-selftest/run.sh` was n=
ot updated to test `good/` fixtures against the newly added `stricter` mode.
--

--- Patch [8]: [PATCH v2 08/11] dtc: dt-check-style: Introduce 'stricter' m=
ode ---
commit 9aebf208f76b608e7a3091f58903f2279782a0e4
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Introduce 'stricter' mode

Two rules, which are enabled in 'strict' mode make little sense for DTS:

1. line-length, limiting length of line to 80 characters: DTS often has
   a bit longer lines, especially for interconnects or heavily nested
   opp-level.  Checkpatch already does not warn for exceeding 80
   characters.

2. unused-labels, discouraging unused labels in DTS or YAML (not DTSI or
   DTSO): while not harming this leads to many false positives, e.g.
   unused PMIC regulators in DTS.

Introduce another 'mode' of running beside existing relaxed and strict:
a 'stricter' one where these two rules are moved for DTS.  Intention is
to have in-tree DTS passing 'strict' mode.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 54e96ce04b209..56d8d0c217f20 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -5,12 +5,14 @@
>  # .dts/.dtsi/.dtso source files. Enforces rules from
>  # Documentation/devicetree/bindings/dts-coding-style.rst.
>  #
> -# Two modes:
> +# Three modes:
>  #   --mode=3Drelaxed (default)
>  #     Only rules that produce zero warnings on the current tree.
>  #     Suitable for dt_binding_check.
>  #   --mode=3Dstrict
> -#     All rules. Required for new submissions.
> +#     Most of the rules. Required for new submissions.
> +#   --mode=3Dstricter
> +#     All rules, including ones having false positives.

[Severity: Medium]
Should the selftest runner be updated to cover this newly added mode?

Looking at scripts/dtc/dt-style-selftest/run.sh, the loop for testing good
fixtures still only iterates over relaxed and strict modes:

scripts/dtc/dt-style-selftest/run.sh:
    # good/ -- must exit 0 and produce no output in both modes
    for f in "$here"/good/*; do
        [ -e "$f" ] || continue
        for mode in relaxed strict; do
            out=3D$(run "$f" "$mode")

This leaves the newly added stricter mode untested against valid fixtures,
and leaves the script comment referring to "both modes" out of date.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-n-dts-styl=
e-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com?part=3D8
