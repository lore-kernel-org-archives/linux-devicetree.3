Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468FF3D7D8E
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748581; cv=none; b=uAexg+2iVQxVyQFL6to9gBHbFmE3kfsWvHoi9oKfZOaAng7pfdWzqQaqywE2UeWE+a7+UmvIkCfhueS+RsZ9+qcLfDjco7sJDo5hyL+gVIkkhomiwQvBCozJxwlV69JxYvvlrPT6hFcmWAhRFZthgOGpqNWCoU3t3xpo49PFQ/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748581; c=relaxed/simple;
	bh=26wWn9BryG92JyrPmwUMmH84wWRQA6wo8SJVDgALpp4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iMGa+0MwEQ4iHJKQTr5cSdEeJzrljKsDFtUS2wPxoyBNtfQvU/S2SLT/kgqiYmYTYfBREdFg8TjMr9zxDWo62rqdnvIrJORurZpUYvuwl2wNpuqzss+a98HzzyoiaIokFZjF398JEtAcwrAYeXczXagcwK2sMLDx80hgb/AWJNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBW4pmLw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBW4pmLw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827961F000E9;
	Mon,  3 Aug 2026 09:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785748579;
	bh=6skNUT48q1YGe6OYCNOhKWTfWieHhvakEHmuiEjfn/k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZBW4pmLwlNEOXyP0KOcbLaFLZObr/aD0CA6RF5tQPpSvrjkqYdG1lrWPMYNgDSC5Z
	 mrU/ZQVGw9VxIpEG6p4sgnFUiAvrRtJeRtycXbwvcvGOYGhs3GJqClOLJQrL2DUbrP
	 AvJiZB8zZgMeouuK+GW6rsIwz8lQ8xtIPG5F6xmuhEI2octRYdqdgCNlLpzW7qBBpj
	 BR8AtgwoG7MnsHJ/9UUX5tBf6GUDfWT6vNbe6fqVr4KXViyMB8KZDTVwLvyz9rsy5a
	 ngYcdfTtmphTW8ikeHsMD/7PdI9cLmc6T+MXLahikcywWZSyP6ziPaS1HXfRjN+9LF
	 UAkEqxvrZfNmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/11] dtc: dt-check-style: Introduce 'stricter' mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-8-6c9776928cea@oss.qualcomm.com>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-8-6c9776928cea@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 09:16:19 +0000
Message-Id: <20260803091619.827961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Top-level nodes with the same name but different unit addresses =
are no longer validated for correct ordering.
--

--- Patch [8]: [PATCH v3 08/11] dtc: dt-check-style: Introduce 'stricter' m=
ode ---
commit 3fa51567db6be5159b622c7ba7a9c229f630ccc8
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Introduce 'stricter' mode
   =20
This commit introduces a 'stricter' mode to the dt-check-style script. It
moves the line-length and unused-labels rules for DTS files from 'strict' to
'stricter' to reduce false positives.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index e3adaad1be633..1430c675bd951 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -5,12 +5,14 @@
>  # .dts/.dtsi/.dtso source files. Enforces rules from
>  # Documentation/devicetree/bindings/dts-coding-style.rst.

[ ... ]

[Severity: Medium]
Are top-level nodes with the same name but different unit addresses still
validated for correct ordering?

Looking at check_child_name_order() in scripts/dtc/dt-check-style, top-level
addressed nodes are mapped solely to their node_name, completely discarding
their unit address as a secondary sorting key:

scripts/dtc/dt-check-style:check_child_name_order() {
    ...
    unaddressed.append((_natural_sort_key(c.node_name), c))
    ...
}

Because the strict less-than comparison against identically evaluated name =
keys
evaluates to False, the script silently ignores out-of-order nodes with the
same name:

scripts/dtc/dt-check-style:check_child_name_order() {
    ...
    for i in range(1, len(unaddressed)):
        if unaddressed[i][0] < unaddressed[i - 1][0]:
    ...
}

Does this allow malformed DTS files with out-of-order top-level nodes of the
same name to bypass validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-n-dts-styl=
e-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com?part=3D8
