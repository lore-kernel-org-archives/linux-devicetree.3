Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5071A3368AC
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 13:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517032; cv=none; b=ZgmejV6rknrrjilZXw2ekfr27cD/EUXnjrweVgXpYrh5VRMy3Cg7mqD5jeng0Hmw/ZzszSUhWFV8qisrvxY/hVBYShAqDc59oUAGPcESJiS8dGJru5nweyTNwfxS+79aPaabjcfRjJqCcd5yCVwj/o0hcBCdVybdqYDZJ9SQ6zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517032; c=relaxed/simple;
	bh=nQ4CxHm3RCwv4XbKjcY3bnodu+TEj/m/bn5XQyNoAHY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HtAOJpqyNF7VupcRaykF4m+HaN8CrnVjkrSRNwlN1YHAhJ4+lwiNZoj9qxiRgd76E2EKt2WxyFPCjgAkWGehTVLt9d6hZHMkDxJZPTZbR/B1WHmNhxUZ72hUMqX2LNgqTDv0yxLE2js7aX8dv1Oa7EfKVTGR9UJj0K9vUZqrz+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MblSMgb8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MblSMgb8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB441F000E9;
	Wed,  8 Jul 2026 13:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783517030;
	bh=7+g0G78lAtA/HsFZGt388DBAVn8va6ndbI86fgUx6Uc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MblSMgb8iCn4N+S0++u+hgAd6j0z8P8YaJaUE6+BtO0cDWMKzXV2ifn0avdhkpml1
	 9vAZwpRdq5meKJOLddYamFOq0BKM5OO2GP3QaHzyM3qkPIQ3FViLPLBuH6fRTrK8w0
	 q0YqcErDRfxwu7PktRzmMomWbAbOJuH9TiqN0rf2JG26Ibh0Q9ZNeW7zG6Cw6YxEiv
	 cGrwoiw32oBRt+CbU1gx5tcAPD2+OPvdkoCynNWihDiDBxKg9UsocOAz5/D9fizIgY
	 XAECggcHPObiGVerBiifMgNtOmKjWiOwWc/roPn71cINszfdYXIOOHFdt2qChCJsi4
	 GqeeKw7HjfnXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/5] dt-bindings: clock: versal-clk: Fix mio_clk
 index range in clock-names pattern
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Simek" <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <e742b7da70c2bf10650a81e537f1b90d76799416.1783516336.git.michal.simek@amd.com>
References: <cover.1783516336.git.michal.simek@amd.com>
 <e742b7da70c2bf10650a81e537f1b90d76799416.1783516336.git.michal.simek@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 13:23:50 +0000
Message-Id: <20260708132350.9AB441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The revised regex pattern for `mio_clk` retains the `+` multipli=
er on the new numeric group, allowing unintended repeating 2-digit patterns=
, and still lacks the underscore required to match valid clock names.
--

--- Patch [2]: [PATCH v5 2/5] dt-bindings: clock: versal-clk: Fix mio_clk i=
ndex range in clock-names pattern ---
commit c70f74e0485f673c66443cff9bcebc2799e80656
Author: Michal Simek <michal.simek@amd.com>
dt-bindings: clock: versal-clk: Fix mio_clk index range in clock-names patt=
ern

This commit updates the clock-names regex pattern for mio_clk to restrict
the MIO index to the valid 00-77 range. It replaces the invalid character
class with an explicit alternation of two-digit values.

> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml=
 b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> @@ -116,7 +116,7 @@ allOf:
>              - const: pss_alt_ref_clk
>              - const: aux_ref_clk
>              - const: gt_crx_ref_clk
> -            - pattern: "^mio_clk[00-77]+.*$"
> +            - pattern: "^mio_clk([0-6][0-9]|7[0-7])+.*$"

[Severity: Medium]
Does this revised regex correctly enforce the intended clock names?

By keeping the + multiplier after the new capturing group, this pattern
appears to allow unintended repeating two-digit blocks, such as mio_clk0011,
to pass validation.

Additionally, if the hardware clock names require an underscore before the
digits (e.g., mio_clk_50), omitting the underscore means the regex expects
the digits immediately after the k. Device trees using a valid clock name
with an underscore might fail schema validation as a result.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783516336.gi=
t.michal.simek@amd.com?part=3D2
