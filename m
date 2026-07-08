Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9B03438B7
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 10:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505344; cv=none; b=YkYzgoZVISZ1DwZ+xvQ9tyEkVmTuAvEutHKUT0GUxu7+/dEF6/pdvEOnIZ+uHjOFUR+ZO2dH/IQiaHlDSVTbyYILrCnHMtOYd1zR/OIS/3TCCRWNN99939xoU3iGlTTiFUf6frAquqqsHXoi/7dCYFiGYl1NYu5LdcbDgze9hYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505344; c=relaxed/simple;
	bh=H9dhjL4GO8WSwSlmODniRDu0qqWZK7y8aT2WeTVpKbA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aQqmjg1u8mk41fbQGlCT2GI1G/4SeZxrpMDfQBCW97vFrP6iC+25pkZLyTFfdGopDdWXAw1qrCSdJLWs2XujDw4SHyvYRYrf54UFmH5nPQxK56aaITeQSqk+m5bYimT7SID/VyNWIbRZ0SKCUO5/otTzkl9Lt8G+IUvBz4f1qB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lq5HSEML; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lq5HSEML"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC811F000E9;
	Wed,  8 Jul 2026 10:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783505343;
	bh=/ayX9bRmFEerJ6s1nzKgKn50ib1ta+U/Kk5OmEwZRYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lq5HSEMLFL9CofRte5cyOaprFRmxVFwVEPgj5fWAqzTQdwWvKolrEByqjyZIk9n82
	 9XO+wDz/h8NDJ3rQtMdJHjAW1ySRlnHx3lsVwXdN+WC98RQ2ZjSKG12qAtTnecN0vj
	 WymGPAQ9iSTpCed3LN/it692VA8xwO1j1RsH/eqwVMIzuvIg/WSVqB/clHA2J5O176
	 9A0VWUCsRp+qYJrWPLHBAp6z42yNNWM8zenWh9aaAHFpNlVofcXffafZCGAhUYZG4U
	 as1awmS0cwBaJor6yLwEq/4xkzIXqaoM6X69EnfXrKTyJUKI2OJ8qkY3DXM6aTt8gH
	 aRi8rnf7qDL1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/7] dt-bindings: clock: qcom: Move glymur TCSR to
 own binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-tcsr_qref_0708-v8-1-62c42b5fa269@oss.qualcomm.com>
References: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
 <20260708-tcsr_qref_0708-v8-1-62c42b5fa269@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 10:09:02 +0000
Message-Id: <20260708100903.4AC811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `#clock-cells` and `#reset-cells` properties are omitted fro=
m the global `required` list despite the device functioning as a clock and =
reset provider.
--

--- Patch [1]: [PATCH v8 1/7] dt-bindings: clock: qcom: Move glymur TCSR to=
 own binding ---
commit de86834007c0daa97a5bd5af83bbdcff6a5a2489
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

dt-bindings: clock: qcom: Move glymur TCSR to own binding

This commit splits the Glymur TCSR clock controller out into its own dedica=
ted
device tree binding file. It documents the various VDD supply properties
required by the QREF block and marks them required via an allOf conditional.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yam=
l b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> new file mode 100644
> index 0000000000000..ec89feff89e4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
[ ... ]
> +        - vdda-refgen3-1p2-supply
> +        - vdda-refgen4-0p9-supply
> +        - vdda-refgen4-1p2-supply
> +
> +required:
> +  - compatible
> +  - clocks

[Severity: Medium]
Since this device functions as both a clock and reset provider, shouldn't
#clock-cells and #reset-cells be included in this global required list?

Without these properties in the required block, device tree nodes that are
missing them will silently pass schema validation, which could push failures
to runtime when dependent drivers try to parse the unconfigured resources.

> +
> +additionalProperties: false
> +
> +examples:
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-tcsr_qref_=
0708-v8-0-62c42b5fa269@oss.qualcomm.com?part=3D1
