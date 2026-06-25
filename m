Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A2332AAA3
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782395169; cv=none; b=KJl2COqhJ8gKqrpE8+viu5Ti0N7+NH2eyls6cxyzdhsJzXBUIv074uBvQIOg3inx/CGD0RMAxGEC33LN1wSrGX3tZ3HDVWsN+bS+mKVa8DvIUNIGJU5qGAGwzuuEay8ZAHckJciAvZMSBGZ5yrYKqogLsQeUIahpZpBbuL8qDjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782395169; c=relaxed/simple;
	bh=uwFHfu2Kh3Ey3+MYrOA2Fa4jjI+7oL/GlhUTdTqjkbw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JtH7/zNovJPLlDN8Ln8DfZVa0JHgUBQrZaz/SIjy2CeNO5oxajMPkluqnlWf33I843AikBoRQAdqOnvroKLrCyeefygG4TvqZtj7HiccG1GfjPze5DO6c+f+VGnEN9g2kdzQU3Si3tQE/xU7H9iI3JFLRDwdW1eJGyGlTRwfFm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XzxiAbT6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzxiAbT6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284FF1F000E9;
	Thu, 25 Jun 2026 13:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782395168;
	bh=HLkzmPcAApni3sby0mI1IlQLUWqZECTLDEeYKL//KHE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XzxiAbT6s2vlQtCvKpVF04OSEk1b7k2/m7t8/NhhdNVrw05gzhAuur5WcNEssvUcA
	 5xa0ZAg4OJGIbSbZVHHJt4xA0nbBBricyAxCEzPpO0C1xzoMVJjVUBUwN9IoI0qR2b
	 v1cCzP9PE1Jl+MOj1zH0+4zb1sEGAHQ2UmhFL0w7RK27MPEnDzXSUhWEA8VAOg/xhg
	 iUgLPBLPFpjeqG2qg0vl1JzCPuR3al1STULYCgi2WFuq7LeE4qWHEz1fIqBV6mYqlZ
	 HQP2Uoh0gK3rRKrRR8usoaeYd1n+QY9NcZfEm8uj9gwdfGlN+tBCpN2Bw8bH9XCEWe
	 SDozyXB9TylSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: qcom: Add JPEG encoder
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260625133828.3221781-2-atanas.filipov@oss.qualcomm.com>
References: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
 <20260625133828.3221781-2-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 13:46:07 +0000
Message-Id: <20260625134608.284FF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `clock-names` property is missing from the `required` list des=
pite `clocks` being required and the driver relying on the names.
- [Medium] The commit message claims `reg-names` is documented as a propert=
y, but it is missing from the YAML schema.
--

commit d5b47be66fcc52e7570e1b138452c400f72abc6b
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

dt-bindings: media: qcom: Add JPEG encoder binding

This commit adds a device-tree binding for the Qualcomm JPEG encoder
hardware block present in SM8250 (Kona) SoCs.

>     Properties documented:
>     - compatible: qcom,sm8250-jenc
>     - reg / reg-names: single MMIO region named "jpeg"
>     - interrupts: single edge-triggered interrupt

[Severity: Medium]
The commit message claims reg-names is documented as a property, but it
is missing from the YAML schema below.

If a device tree uses reg-names =3D "jpeg" based on this documentation,
the device tree will fail schema validation because additionalProperties: f=
alse
is enforced. Should reg-names be added to the properties definition?

> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.ya=
ml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> new file mode 100644
> index 0000000000000..ab8d8951d21fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts

[Severity: High]
Does clock-names need to be included in the required list here?

If an incomplete device tree node provides clocks but omits clock-names,
the schema validation will silently pass since clock-names is not in the
required list.

At runtime, if the driver calls devm_clk_bulk_get_all(), it leaves the clock
id fields as NULL when clock-names is missing. The driver then iterating
over the clocks and calling strcmp(jenc->clks[c_idx].id, "core") would cause
a panic due to a NULL pointer dereference.

> +  - power-domains
> +  - iommus
> +  - interconnects
> +  - interconnect-names

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625133828.3221=
781-1-atanas.filipov@oss.qualcomm.com?part=3D1
