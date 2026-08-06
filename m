Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58113389E07
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 05:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785994795; cv=none; b=BKIVVNEM5ck9pJL0UsjQkN7ZdGo1GkocyHct3HJUoYncy27YbBTcG6L9TIJw+wxqcRZkGLcRngQrrMWCyNxJx8RBm12751QdppqhVEURZmro1Q7m++CaQUOyoLqsg8oJ1Ncv6Xm0OA3ZiQWBuc7pBDGamJOEVIesWfjchQ6/n3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785994795; c=relaxed/simple;
	bh=bkeISG8QDOBUIRtTEoFnVO0Rz77n6wQWNnDMBf2RFLo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dr7GNklEV+2l0c8l7E3Nl2OfrWc7LKRZaMtaicdcspCSz8Wx4mfygBDqt89StcAzdpft7TRWMrR9O2d+2XQiOPlIm+0hqHck+v5ld8B/njidpntYB9FoERdXvKQ7fcbi4WpIMAhzFxybahXOVUJnY3oMdl30vaQ1yorGXMldMQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBrWLQMW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBrWLQMW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751071F000E9;
	Thu,  6 Aug 2026 05:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785994791;
	bh=2pvx8T1yvZHr++I4vmVNZJb39cj214DibD3CIoV3Rzs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JBrWLQMWMg39tLcHYDItxuOGBzbBAFeLTbBdRY5RH9wNVAY4ZrBISFzMLmFxgJPEK
	 GyLqQ4tVzWyu8qP2CFidMcOds8+wS3Xoz9UMRqKsBqdpgxYLilzrOe+Rm7GKtqtPr+
	 1VpRsKZjDAE5BGIa30j5YypRTN6zW1+VP1LYoL9QRDfbKQsPt3rqnvGwILh5KzQsJs
	 jy2j55eAll89HLsR/AOXJpbtCN2lHbfVPFi48BzsuQqtXZE2dQtPSlALoXO0b/b8tk
	 273CHQR0jwGXyP6AZH8DvhxeiMQImiMzzDdr2xlrjDUJwtCuGLhFKm1sWaWjT9yISZ
	 YDDK+WPQdO1Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to
 own binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805-hamoa_tcsr_qref_0805-v2-1-4f1cfb1fcab2@oss.qualcomm.com>
References: <20260805-hamoa_tcsr_qref_0805-v2-0-4f1cfb1fcab2@oss.qualcomm.com>
 <20260805-hamoa_tcsr_qref_0805-v2-1-4f1cfb1fcab2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 05:39:50 +0000
Message-Id: <20260806053951.751071F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added binding for the x1e80100 TCSR defines provider c=
apabilities (`#clock-cells` and `#reset-cells`) in the `properties` block b=
ut omits them from the `required` list.
--

--- Patch [1]: [PATCH v2 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR =
to own binding ---
commit 16b928cadee464be45b850ff14bcbce5380b441f
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

dt-bindings: clock: qcom: Move x1e80100 TCSR to own binding

The QREF block supplies reference clocks to PCIe/USB/UFS PHYs and requires
dedicated LDO supplies to operate. The digital control interface for QREF
resides in TCSR on x1e80100, so these supply properties are placed in the
TCSR node. Add a dedicated binding file for qcom,x1e80100-tcsr to document
these supply properties.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.y=
aml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
> new file mode 100644
> index 0000000000000..55182cf550e7d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
[ ... ]
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
[ ... ]
> +required:
> +  - compatible
> +  - clocks
> +  - vdda-qrefrpt0-0p9-supply

[Severity: Medium]
Should #clock-cells and #reset-cells be included in this required list?

Since the TCSR acts as a clock and reset provider, omitting the cell-count
properties from the required list allows incomplete device tree nodes to
silently pass schema validation. This can lead to runtime failures in drive=
rs
that depend on the hardware as a provider.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-hamoa_tcsr=
_qref_0805-v2-0-4f1cfb1fcab2@oss.qualcomm.com?part=3D1
