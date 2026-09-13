Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073783B7B7B
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 19:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326234; cv=none; b=uj7SZwXowxpz3UwDE+htxkCM8QUvUgNcFshrdfCyBvYhldXUoFzGnmg4LCQlkVsVCi71k2o1VvMvQ6U+IHUtZvgAeyhVzDkZO3J3Izp5GXvqBISxaavfkGdkDNaRzNVm07sDAHUn3jKEZKM6rIhcxxAnm/SwcXdEUupczVqMKxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326234; c=relaxed/simple;
	bh=qaWUeovq0KiFfOYovBOkWgHmqe1V0kNVL3szsxaJZVM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rNYme1GSx7toQvt2QvOOG53vimexGcKclyQdvxUiDwppn/A2kJMmUVna7YMdD7z/FTYqnbdGLw8qZ247ZtNyIXZ+Xbw1f8mJvD36ZB1U5i+WnUALDqYutBq0q0tEriMFDi6d+RHcxcdpF2El/yR+iOrW4p50smVbT7bfuXBn3SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnbQ4cAU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnbQ4cAU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA60B1F000FF;
	Sun, 13 Sep 2026 19:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789326232;
	bh=9VtF0m50UDrSwwyXpqVIV4yS6FbZG0vILkqvMa05+u0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EnbQ4cAU/YpilD789UnaIwI7Kzj+/TK5Xx/LTAXbt/IBK99Fsrglnn8kLFivRBbXy
	 RCqQR3nd1aIj8BdqgEXKz2a5opxlbNeyd3jzzT932RwG8AgIlwnZBNhPIm2aCbCDSj
	 aC6Xm169EWJz73wc7jriJk4Gd7MNsIq8OFOCLie1AzuvrhVaj/KvL6bxPCkBskHtdM
	 pYSM0zld4/QPqdpoFRFdrBGovX9Nr+dkxoRyxUPpweiJBAKXlVRGaoMgAbgwf1aBVY
	 wlWFKmtLpYr8wTB4XslQp2narmeKI0yJkHOgmxSqAzlF2snb8J6NTPLvSvBWSEmnfS
	 NpInW9SMHiGeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/13] dt-bindings: media: qcom,sm8550-iris: Add
 context bank subnodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-2-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
 <20260914-vpu_iommu_iova_handling-v4-2-9b9074a73c41@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 19:03:51 +0000
Message-Id: <20260913190351.EA60B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing subnode updates for the Milos Iris VPU enforce a DoS-vulne=
rable SMMU configuration.
--

commit 63b882fd7198eab0ac9d5c0a3932a253f2082c86
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

dt-bindings: media: qcom,sm8550-iris: Add context bank subnodes

This commit updates the sm8550-iris device tree binding to move SMMU stream
definitions into separate context bank subnodes. This addresses an issue wh=
ere
placing all streams in a single top-level iommus property failed to prevent
non-pixel buffers from landing in the restricted low 600MB of IOVA space,
which caused unhandled SMMU page faults and system reboots.

> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yam=
l b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index 0400ca1bff05d..6ee9d23554cff 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -98,10 +98,10 @@ required:
>    - interconnect-names
>    - resets
>    - reset-names
> -  - iommus

[Severity: High]
This is a pre-existing issue, but does the qcom,milos-iris.yaml binding
also need to be updated to support this fix?

Currently, qcom,milos-iris.yaml still mandates a top-level iommus property
under the required block:

Documentation/devicetree/bindings/media/qcom,milos-iris.yaml:
required:
  - compatible
...
  - iommus

Device trees for Milos cannot adopt the subnode fix without failing schema
validation. This forces the DoS-vulnerable monolithic SMMU configuration
where unprivileged userspace or remote video playback can trigger VPU
processing and DMA allocations below 600MB, resulting in SMMU page faults
and spontaneous reboots.

The SM8750 VPU update was successfully resolved in follow-up commit
"dt-bindings: media: qcom,sm8750-iris: Add context bank subnodes", but
Milos appears to remain unaddressed.

Should qcom,milos-iris.yaml be updated to remove the top-level iommus
requirement similarly to this file?

>    - dma-coherent
> =20
>  allOf:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-vpu_iommu_=
iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com?part=3D2
