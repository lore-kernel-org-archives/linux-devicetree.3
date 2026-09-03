Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829EA4E80D4
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 15:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450975; cv=none; b=NAoZhwk3DLDlBzvdaauQ7iIZ+zBrPdG9CYDc7pKAwZIUGKkV7nxYHkgltlbOUW/I4uixOpfrrKPN2FEXUdWNZg2lkjMXEcJb+13K4rMRXyZ5sPRDCiRns8ez4Wquv3zkf4Il0mzVgvv13x+3cn3H881aHvQWmPMO/WijxeAasKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450975; c=relaxed/simple;
	bh=xOoiQdWuz3NF3lgmmwy9Zj7NptWbmR0V+4Qty88x2vA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GjPDqZqS4ZbeHDEZrNpocWVNYBv3Kk+X6RudBrgXcnCB23cdgQAEAHBsyuZytWjiPGuD11iwyrksiRAR4PhE+q4dbg9J3QApWe9qbvtK+uErRnBumBb21fhG8GOyH8X0qU50K/VqG0SpsIzJWv7eSp/vIeoenx1zGuODXOvH5QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IS+p0HV7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IS+p0HV7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6AB71F000E9;
	Thu,  3 Sep 2026 15:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788450974;
	bh=EKfDX9mzwnbLJzW4DdxVkKcEyxbi79CWWzEHH+mMD9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IS+p0HV7jDh1Q5QkqLTRHk2UqZRHq525C69Icf1M78wziQJViREtrOv07LtLzvm1e
	 kZ2vssv3UC/5CdgooNstmLafI+9mtsEhfH2jaVWVwcJ4nNUAfJAUF/tjJPGdSEosq2
	 4L7LKJR3BZAW18P1FvhNjHiKlKId3O/D7tGq+BU1vfKVSOuyIHe8uTLrghVVSa1CUQ
	 rsLf+TkIHwYqYEDCbeVtUtX1ZzT0sxzXBGREf+db1NxLhyuJRyXFbJd716QGTsgcRL
	 z3i+N0vfQ7DxxKSD2C5/DgQGsYdNULF5W5dpw5CUR3xGLXfMnSUt8hdKlg3gaa5koh
	 c/8K9LOyHzc2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: usb: Add qcom,sa8255p-dwc3 for
 firmware-managed resources
Reply-To: sashiko-reviews@lists.linux.dev
To: "Faisal Hassan" <faisal.hassan@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260903153827.3463313-4-faisal.hassan@oss.qualcomm.com>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
 <20260903153827.3463313-4-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:56:13 +0000
Message-Id: <20260903155613.C6AB71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The 'dma-coherent' property is missing from the binding, prevent=
ing it from being used in device trees.
- [Low] The 'interrupt-names' property lacks item constraints (e.g., 'items=
' or 'enum' lists), allowing arbitrary strings (like typos) to pass validat=
ion.
--

commit 5d3262b4959573620da7ce43d432ab2890209041
Author: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

dt-bindings: usb: Add qcom,sa8255p-dwc3 for firmware-managed resources

This commit adds a new device tree binding for the USB controller on the
Qualcomm SA8255P automotive SoC. It specifies that platform resources
such as clocks and interconnects are abstracted and managed collectively by
firmware through two power domains.

> diff --git a/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml=
 b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
> new file mode 100644
> index 0000000000000..c6db7bcf4981e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml

[ ... ]

> +  interrupts:
> +    minItems: 1
> +    maxItems: 6
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 6

[Severity: Low]
Does interrupt-names need an items list or enum to constrain the exact stri=
ng
names?

Without an explicit list, the schema will accept any arbitrary strings, whi=
ch
prevents dtbs_check from catching typos during validation.

[ ... ]

> +allOf:
> +  - $ref: snps,dwc3-common.yaml#
> +
> +unevaluatedProperties: false

[Severity: Medium]
Since unevaluatedProperties is false, does dma-coherent need to be explicit=
ly
defined in this binding?

Because dma-coherent is omitted here and in the referenced
snps,dwc3-common.yaml, adding it to a device tree will cause dtbs_check
validation to fail.

If device tree authors omit the property to appease the validator, could the
kernel fall back to non-coherent DMA mappings, resulting in unnecessary cac=
he
maintenance overhead and a performance regression on coherent hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903153827.3463=
313-1-faisal.hassan@oss.qualcomm.com?part=3D3
