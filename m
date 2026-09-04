Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCB82DC357
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 13:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527142; cv=none; b=dfIw4XkjTKmUXiQz5y4pNdfx2IdtGzzGvHNZsOOaMCmpfK8GA4Rp03oA/sCJ0wY0wzdiMRCMb+/wODWIWF3TiSnRpKbpOT3mbLDQ3lBhoJCvoEWv4XNznWoI06WYnY0/tlH1GRtxnGWfYyuUFvXeA8nAr1RcwqqbcaJgtREiQZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527142; c=relaxed/simple;
	bh=HFee2z1DZ0jKs32zdk+yhKKDsguVzgjV5/fPce3t3so=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DEQSL1Ewt37OB377y4eS02/bwSwW2j3jafSvypEoPi4f2/YD+XyZ6voSD2lwnCz+sr0zsQ6v+4/hdRY5t31PCcmX36xvr/xtgFMduGSIsIbBa2k6lLC+jzvldlqFREQCcPve1EeJRbTwyqUkxczEMgBLOt4KunnQFnR8VVYC3ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbeFoRod; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbeFoRod"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFF31F0155B;
	Fri,  4 Sep 2026 13:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788527141;
	bh=gsZ8tV16oCN1o7KgE8N+QhFwKccs/kFDifEBm2pzVtw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nbeFoRodVN7YNTPb7IS1AY9bPRnaV6lh93M7LnWYagQs2f7vjhnsl0GdJnT7hMOuL
	 VVPz6oxQ33RUxRsO544TY8jW6/GD0oJxMCpzm4+DGdUNYM27ajUoFG4WdrP1DxlddP
	 z8LthW/gx3CEButIKdcdWjLTRi01SWWQfByj/CQH/Mo2udeyvl5SA+A5lShOBWUNYo
	 LArSOP3M83Xg0ojEuvXntgelycvRyygboiec0XAQxHAkeuOnqB4HV/S1bzH0x8N5PA
	 i/Ac6P9jR8YwZrgv9JiDCX2r+0uvTiIYTmLZBjabBkBjD/ElUrtBV7b/ez+MNIzKbb
	 FzvhTfxj6DazA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add MSM8952 pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Muzaffer Kadir" <muzafferkadir@mainlining.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904-msm8952-pinctrl-v4-1-671475ed1397@mainlining.org>
References: <20260904-msm8952-pinctrl-v4-0-671475ed1397@mainlining.org>
 <20260904-msm8952-pinctrl-v4-1-671475ed1397@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 13:05:40 +0000
Message-Id: <20260904130540.CFFF31F0155B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `maxItems` limit for `gpio-reserved-ranges` is mathematically o=
ff-by-one, artificially preventing the maximum possible fragmentation of re=
served ranges.
--

commit c09a958e0a0865ed0afbe7d8e7ad728062dcbdf7
Author: Muzaffer Kadir <muzafferkadir@mainlining.org>

dt-bindings: pinctrl: qcom: Add MSM8952 pinctrl

Add device tree bindings for the TLMM pin controller found on the
Qualcomm MSM8952 platform.

> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8952-pinct=
rl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8952-pinctrl.ya=
ml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8952-pinctrl.yaml
> @@ -0,0 +1,146 @@
[ ... ]
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 66

[Severity: Low]
Does this maxItems limit artificially prevent the maximum possible fragment=
ation
of reserved ranges?=20

The SoC defines 134 GPIO pins (0 through 133). In the worst-case fragmentat=
ion
scenario where every alternating pin is reserved (e.g., 0, 2, 4, ..., 132),
wouldn't this result in exactly 67 disjoint reserved ranges rather than 66?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-msm8952-pi=
nctrl-v4-0-671475ed1397@mainlining.org?part=3D1
