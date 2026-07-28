Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD27D3A3E8B
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 17:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785261277; cv=none; b=fCqXAB7eFG8Diy+u36Td2fQKlSKaRLELXiO40rKarQ1DyHWj08uwyzLkWOWIPbmz0v/s0CSkkKpvbPCDDxu/qX8uKo87zSvBAMF10gzbOCQiGaHIRdcfQiyP39p6lboQ1wrYD9X5gAT8mV2kdHqhj6yWA4wU1aN4p/jViwZcdpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785261277; c=relaxed/simple;
	bh=0nU14XE8aT8JS74Ct0b+yYfxPhmhIPp4uqLjrlGFUx4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RNXewP6rp+dwD7qDXqynlVMuJnUWozdyFpEufpJeQQ6RVp/0FPeGqn9C4rjO9cSqyF+5W94NvBEe6aHtBFSO2dyRtarHUU/Kx270TYECJ9cdzfL27+iqGmLSAgLrD9it/dJk1y1vDauz8GIlXhJH+ehtLDAFqdoqJrRZL1quJZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdeiUvJ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YdeiUvJ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70901F00A3A;
	Tue, 28 Jul 2026 17:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785261275;
	bh=m32axT6/PLoQ6EmAs9bQu4Qdxwcv2GweUk5GQlCErtg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YdeiUvJ04WJWGNcaxUDGSxmnd/FtGOR5cAMaf0iP3cgR/RmLZiqd/6N8/8vHjhrok
	 +MdSWjsVrVUkCwVLVDMr+99LCpktnkgg3H0OsMeMzHvTvbRUaravKfuITxx7yFFHZA
	 8nCFHh0Hu4LVJGJMwZY8EU2+XY/0YPnMPAXp8o7yTY7DKJi/HTrxiUjiBZnc8lBVDb
	 T6Z+ryagcOg1e3+Rr5rtOiO1geBjgGOSX/4osT8BGu0ZM+IusY6boW74FoMmI0q9jB
	 m16hIcwhHHVq7k2BM6DFKfRuC2eO8K8dp2S0dZGadW5cYplA97QjPf2IOVYsSRA1/x
	 k/ue991Q+o6PQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: embedded-controller:
 qcom,hamoa-crd-ec: Add qcom,tsens
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-ec_add_more_commands-v1-1-771abd65ee1a@oss.qualcomm.com>
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-1-771abd65ee1a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 17:54:34 +0000
Message-Id: <20260728175434.D70901F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The custom `qcom,tsens` property encodes a driver-specific softw=
are algorithm into Devicetree and redefines standard phandle specifier sema=
ntics to avoid standard sensor enumeration.
--

--- Patch [1]: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd=
-ec: Add qcom,tsens ---
commit d7c232898faf92bef60389e6c46fc016182bd22a
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add qcom,tsens

This commit adds the qcom,tsens property to the Hamoa-based boards embedded
controller binding. It pairs tsens provider phandles with a count of leading
sensor IDs, whose readings are averaged to compute the SoC junction
temperature.

> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,h=
amoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qc=
om,hamoa-crd-ec.yaml
> --- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-cr=
d-ec.yaml
> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-cr=
d-ec.yaml
[ ... ]
> @@ -32,11 +32,40 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> +  # A generic "thermal-sensors" phandle only identifies individual sensor
> +  # IDs, and thermal zones are a Linux-side grouping of those sensors, n=
ot
> +  # a devicetree concept the EC cares about. What the driver actually ne=
eds
> +  # is raw readings from a contiguous range of leading sensor IDs on each
> +  # tsens provider, averaged together, so qcom,tsens pairs each provider
> +  # phandle with a count instead of enumerating every sensor cell.
> +  qcom,tsens:
> +    description:
> +      List of tsens providers and, for each, the number of leading sensor
> +      IDs on that provider whose readings are averaged to compute the SoC
> +      junction temperature reported to the EC for fan control. Only
> +      applicable for Hamoa based devices.

[Severity: Medium]
Does this property encode a driver-specific software algorithm into the
device tree? Device tree is strictly designed to describe hardware topology,
not software policies like averaging sensor readings.

By bypassing standard properties like thermal-sensors and redefining the
phandle specifier semantics to represent a count rather than enumerating the
specific hardware sensor IDs, does this create an incorrectly designed ABI?
It might be better to rely on standard hardware enumeration and leave the
averaging policy to the software drivers.
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-ec_add_mor=
e_commands-v1-0-771abd65ee1a@oss.qualcomm.com?part=3D1
