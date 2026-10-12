Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B1D37AA96
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812718; cv=none; b=dJd7cZ1JPJwdTEdLoKrhGZuedU1QUpoHmo2qWrfaZCCWjb2k5Dh+zBkRWyXDfEIzKznJr/y6RrakVdDJVEj277/PiWC0kqk9BIAxI9buJnPdIBV/pvWhBZCdYu+EIRAZ4a3rt3GPxgoSnIGhHn1zNbTe07hwZ5RXa3+p3i1jFMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812718; c=relaxed/simple;
	bh=3jPhPaYc3xYAL4E53MVdFb0ww4yf3INTh0Vyg1GpTCY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=F/ZwiQcGH4fK03hEOcq+mhivWBBkf8wRRfTAqhlKJ9EjaYKoxqZe1bnJ07e8bwSnThtMzQiB4Zka0ym5kOxFYkiWQRQubcTyhgDih2OeZWLnLTbVmFpY9adBdeRIlUrEjmWqbQtiF0yZgWAGzXHvnPnkfTiM08pFfeGZGFi9MTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4STVeJI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4STVeJI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820A21F0089B;
	Mon, 12 Oct 2026 13:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791812716;
	bh=zFahgcdTQO6vKQ8Rz11lc8v3voIpYK0X5AAFMfjO7d8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V4STVeJImHOmnwSI7XYm8VV2IyJnc+WjbRZ+RDN/xR5rrEG52837wiqjN/jmKtbAj
	 Q7lTOOkhm6PdF9z/UVAw44LbAc6MoM/0Esp0RxiKDCl9nh7BnWtLEmdmIz3g1DUJ2F
	 1Wf8K0TjhCMMsyH0b+ZqxGV1F/ttz7Q+eUVkdgR1TZPjpBrWsiLzqFPtJBpOR2cQPD
	 tj/yP0TlfWyOAdiicW6nDXG1+MaY+cVI0mtjxpnbEV5PsjQ0VDhUYLGie22s7ihuPD
	 n5mXZMPUkB79OYjsJ4Q3fqyugetEbf7sUHZq96Gd4ZcISt7/1trmRjcyQ/uMpKusuY
	 aYGuB1yRvgmtw==
Message-ID: <sashiko-outbox-168208@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/13] dt-bindings: display/msm: Document Nord MDSS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, vkoul@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20261012-nord-drv-dt-v2-3-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-3-a2ab9af954d2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 13:45:16 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing #interrupt-cells in qcom,nord-mdss required=
 list
- [Medium] dt-bindings: display/msm: missing schema for qcom,nord-dpu bypas=
ses validation
--

commit a8ede601ef532b71d1dd3db5e26ddef317404570
Author: Mahadevan P <mahadevan.p@oss.qualcomm.com>

dt-bindings: display/msm: Document Nord MDSS

Nord has a new MDSS 12.1 revision with DPU 1499A and two independent,
DP-only display interface controllers (no DSI), which no existing
schema describes. Add a dedicated qcom,nord-mdss binding to document.

> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss=
.yaml b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
> new file mode 100644
> index 0000000000000..abd80dae4e7f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml

[ ... ]

> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,nord-dpu

[Severity: Medium]
Since additionalProperties is set to true and there is no $ref to a common
DPU schema, won't this allow any arbitrary properties, typos, or invalid
data types in the qcom,nord-dpu child node to silently pass validation?

Is there an external schema for qcom,nord-dpu, or should this node
reference an existing DPU schema to ensure proper dt_binding_check
enforcement?

[ ... ]

> +required:
> +  - compatible

[Severity: Medium]
Since the hardware acts as an interrupt controller (as demonstrated in the
example block with interrupt-controller and #interrupt-cells =3D <1>), does
#interrupt-cells need to be added to this required list?

According to the subsystem guidelines, when a variant adds provider
capabilities like an interrupt controller, the corresponding properties
must appear in the required list with appropriate constraints to prevent
incomplete device tree nodes from bypassing schema validation.

> +
> +unevaluatedProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-nord-drv-d=
t-v2-0-a2ab9af954d2@oss.qualcomm.com?part=3D3
