Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148364078D2
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938516; cv=none; b=TxspwVEtTjZIZYT0LJq6G6UGXPj6BIOUoY7aH7GZYGhKjr28UH/pOu/O4FrclZRDgCEMVbq1er4Vr13/errpjQ0e9DQrr00UkPqmmqYmrwWDpzjk+7X0407uHJPA6Go9nRTGBsaY07I4bhKmlymz/i7gnWwSF97OvYmOfhDV7K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938516; c=relaxed/simple;
	bh=NBFxXv/w9qb9ZiUDQB7yQ9JAo3v5y7OY/UaXSQc2sGg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B5qt9h9jJ3wafX8j/wcuyJ9HLs+1iDK+6Dspb/EeyL15nfP80LEY9M3kNz9nA574Kbqtpj6V7umBxJYjdkT8yT3IsJztN3Elo4qfyAY4+3a4uos/jxPI9qwY/uSOeWZY6g9TEMEp1/ryAYrB7qqHXwec2H2/+7jUsxuA9v46u5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yx+xE/59; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yx+xE/59"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D178F1F000FF;
	Fri,  2 Oct 2026 10:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790938514;
	bh=5mA0SzhrrYvioVqKWx9zhBuOLagXA+7azSgqb6DIq3E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yx+xE/59kEqc741RQNoNRp9jEgq21opiAcuO9I/hYxlP/QODVt9/Xt913cA8nOIkJ
	 HFdwPvCt2QuE7zAO9MRdEI0N5wIz/VGeJ6I0qvc63hhg0VzX9EbCdGSVXXPEd5XF0Y
	 ARMUYG1OierQp7vAiPxW/orT3x+cKrVeDHbYGNiRHuFb+Z7B6e+5PET/FHe20n6CwJ
	 e7aYtI8HO8Q/8pxXGJU/4zLaTrTHibqHw1pz7B9TOELoNhrFogRm5PIETcYRUW9pY2
	 QxFWLRE3J00JXcJxCVqpZSx8pNaxD6BkxiR3/b6E4B1cVG42H/EX/OKTlNqtIqmiBK
	 +LMAh3caANCfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: thermal: thermal-zones: add
 hardware-binning trip properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261002-thermal_bin-v1-1-5a29be7e8ec5@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-1-5a29be7e8ec5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 10:55:13 +0000
Message-Id: <20261002105513.D178F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dt-bindings: thermal: backward compatibility broken by oneOf tempe=
rature exclusivity
- [Medium] dt-bindings: thermal: ambiguous temperature selection for overla=
pping hw masks
- [Low] dt-bindings: thermal: missing min/max constraints on temperature-bin
--

commit b87ec3c80f04fa5778f69e6acbc48a25d9b23994
Author: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

dt-bindings: thermal: thermal-zones: add hardware-binning trip properties

This commit adds new optional device tree properties, `temperature-bin` and
`thermal-hw-bin`, to allow specifying different thermal trip temperatures
based on hardware revisions encoded in fuses. It aims to support SoC SKUs
with different thermal characteristics.

> diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml=
 b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
> index 999ad40a20d5c..cbe72c2ef87c0 100644
> --- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
> +++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
> @@ -152,6 +152,51 @@ patternProperties:
[ ... ]
> +            temperature-bin:
> +              $ref: /schemas/types.yaml#/definitions/int32-array
> +              description: |
> +                An array of integers expressing trip temperatures in

[Severity: Low]
The original `temperature` property enforces logical bounding constraints
(such as minimum and maximum). This new `temperature-bin` array lacks the
corresponding `items` minimum and maximum constraints, which might allow
invalid or physically impossible temperature values to pass validation.

Should we add `items` constraints here to enforce valid temperature ranges?

[ ... ]
> +            thermal-hw-bin:
> +              $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +              description: |
> +                Optional bitmask(s) describing the hardware revisions for
[ ... ]
> +                When used together with 'temperature-bin', the number of
> +                sub-groups must equal the number of entries in
> +                'temperature-bin'.

[Severity: Medium]
The binding specifies how a sub-group matches, but it doesn't specify a
precedence rule if multiple bitmask sub-groups evaluate to true at the same
time.

If a hardware revision sets multiple fuse bits and matches overlapping
masks, which entry in `temperature-bin` is selected?

Could we add a clear precedence rule here, such as the first matching
sub-group taking precedence, to avoid inconsistent thermal configurations?

[ ... ]
> @@ -179,8 +224,14 @@ patternProperties:
[ ... ]
> +          oneOf:
> +            - required:
> +                - temperature
> +            - required:
> +                - temperature-bin

[Severity: High]
This `oneOf` requirement strictly forbids the presence of both `temperature`
and `temperature-bin`.

If a device tree is updated to use `temperature-bin`, the author is forced
to remove `temperature`. When an older kernel (which only understands
`temperature`) boots with this updated device tree, it will fail to parse
the thermal trip point completely. Missing trip points result in a complete
loss of thermal protection, which can lead to hardware damage from
overheating.

Should we allow `temperature` as a fallback property for older OSes by
using `anyOf` instead of `oneOf`?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-thermal_bi=
n-v1-0-5a29be7e8ec5@oss.qualcomm.com?part=3D1
