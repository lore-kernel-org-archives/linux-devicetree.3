Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDC8397922
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141914; cv=none; b=o1S5ttKFrUKU7I3tMTQ/g+LmaakdcxQVbwh6o1mSTVArLcDCfEFfhFejIhz7Jr2v8rZRPkRtnT2sA51PSlhIXmljguNOIUffUD0IKtWjctTvTkUQOcl4r+IHfLfOHE02zSXm4XKZKXfPU/A3rZtUNCliUQMOvBXvj4BkkXvX4Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141914; c=relaxed/simple;
	bh=WVaR/wbyW4zpWjTj5rQKwlXAKjsqPlZHHblYLIlhhps=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JYvcgTJrFeCDKjgZ6l3Qhg/RXR4wvAWoAJHwRR+CzNy6Va1I0wNsLB/kXEHsYP260PsKRq/jJ9oN3Ifgk42ZPCTfW8fnwC8G3miY+QIqXK5WGkTRQcWj+O7LnMyTaDn0etxTalYhlVSzLXK6qn4ajLmvRxo8A5ZkhJ6s64ClKWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B05OV+iF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B05OV+iF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C601B1F000FF;
	Fri, 11 Sep 2026 15:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789141911;
	bh=VeGUnHpGqSAj1AdqhrIriCmyS5Qd41d9tKbZ0b+uwHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B05OV+iFf5Mr2e/dIc3C4fv6s+Azn3lL0PvwWqQBvcXe0zN8Y+WWoX3w9X9nNlJm1
	 2THfJ16e1eN+tHqqIFZc9WIW73huPRm4OJcj6LkmUeYYvfkgWddEi8U5CWQxhIaOvs
	 bWwk4bTRNNrJrXWwdw+Mb9wo2vlVhnM2Y+/S2Di4rQw7cziFCGnS6OBefZylq3uJ3I
	 tMHG6LwZx8lAgrXVyDsN9vbVZk1itpE1TL66vsmu4BF4ecYM7mdkv/Jdi6dF481mS+
	 iazEI3bGxwOruw2GrF8m5xapbvSbkVIO2+fYr9djq+emSkhSWi0VUHyX7cFnYzWw1t
	 ELAmeIEg53nUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/17] dt-bindings: display/msm: Document Nord MDSS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, vkoul@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, olteanv@gmail.com, robh@kernel.org
In-Reply-To: <20260911-nord-drv-dt-v1-3-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-3-e25c073cf1b6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 15:51:50 +0000
Message-Id: <20260911155150.C601B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The 'qcom,nord-dp' compatible string is omitted from generationa=
l 'if-then' constraint blocks.
- [Medium] The compatible string 'qcom,nord-dpu' is referenced for the chil=
d display controller, but the corresponding DPU binding update is entirely =
missing from the patch series.
--

commit 64dd6c393c789d34e5fe84cef41d36aca32b8df0
Author: Mahadevan P <mahadevan.p@oss.qualcomm.com>

dt-bindings: display/msm: Document Nord MDSS

Add the binding for the display subsystem (MDSS) found on the Qualcomm
Nord SoC. Nord is MDSS 12.1, DP-only (no DSI), with two independent DP
controllers.

> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss=
.yaml b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
> new file mode 100644
> index 0000000000000..0b0cacdca9dbd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
> @@ -0,0 +1,98 @@
[ ... ]
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,nord-dpu

[Severity: Medium]
Is the schema binding for qcom,nord-dpu entirely missing from this patch
series?

This compatible string is referenced here for the child display controller,
but the corresponding DPU binding update is omitted.

Without it, full schema validation for the DPU child node cannot occur when
validating a device tree containing qcom,nord-dpu.

> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,nord-dp

[Severity: Medium]
This isn't a bug introduced by this patch, but by an earlier patch in this
series that added qcom,nord-dp to the top-level compatible enum without
updating the constraint blocks.

Should qcom,nord-dp be included in the generational if-then constraint bloc=
ks
in dp-controller.yaml to enforce precise hardware constraints?

Looking at Documentation/devicetree/bindings/display/msm/dp-controller.yaml,
at the start of the generational conditional blocks:

    allOf:
      # AUX BUS does not exist on DP controllers

By omitting the string from these constraint blocks, device trees for
qcom,nord-dp with invalid configurations (e.g., an incorrect number of cloc=
ks
or register regions) will silently pass schema validation when running
dt_binding_check or dtbs_check against a Nord DP node.

They will fall back to the overly permissive top-level defaults (up to 9 reg
items and 8 clocks).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-nord-drv-d=
t-v1-0-e25c073cf1b6@oss.qualcomm.com?part=3D3
