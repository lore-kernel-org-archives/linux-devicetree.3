Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904CB42C504
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522709; cv=none; b=mFf7IrCXzvXReL9GTDXq+NrxKmfNMBJxGXAoAGr4QGdesdtjFDjXqszqcC5vGn0DRp66zufkcqVGq1teFjbEZTX96BSsLjL6uGaj+MTWbiWdp6dyYVK58aqGQOAI0bd+3zRSnQvHP8z8GfeRqaE4APWzw6ZDzwCJDUsCAR4nYqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522709; c=relaxed/simple;
	bh=5ACYsM4TU19/cd5Ollxgbc2pEM8fqM34v5MmkaDn7ps=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nkGPtR/dqFxtTwAxIxTWns2elEl7MzXrMrqddiRiEe3E4fCwhYQcn4NuCmDnpwf6OjJtyzYyj6f4fSXl9cobcT6FApk/z5tnb0i691qXYGUeQ905WeHEP/RzhDP/5/ytboSDJEHj8vkKGa5yNAW4AdDTPGB+Z5pLh7Gaklx1YK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UZyn6dTp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UZyn6dTp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE391F00AC4;
	Fri, 31 Jul 2026 18:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785522708;
	bh=GejRzRaYmiUeaIr+2QqNWVULaUTpH7v76EimkJp15ug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UZyn6dTpoXwA4EkIQGVmVBxE3fFXVQV0b1puVSVSxm+2w9hOhBu4SAospWxlDPfJS
	 dTyjfVh3R4C60iIiF2ohHjtFtfSelh1NR/BCcYOYl9kl1q+Id9Eds9bYeTULE5QzhB
	 CVBbYmbpPQqgl0p5KrkzjfazD8kmADYGehQzkwhM6vDt/2yQbTfIEuxQTUwvipiKRi
	 aFk34QSpoZ0Nnrk11WnK93hbCsV299BLj/k8hlBwd2hyQtTTHuTk8IJrK3TQxqJt8Z
	 48IfeCFo2clXb++MR+PvpnbQcGlBuRUJvaXVqD2bsMFJIwWIPRyqAA4S5E7WQ61RgS
	 8Cx+dd6lA8cHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/12] dt-bindings: media: qcom,sm8550-iris: Add
 context bank subnodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-2-da52b5228dbd@oss.qualcomm.com>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-2-da52b5228dbd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 18:31:47 +0000
Message-Id: <20260731183147.CAE391F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema fails to require `#address-cells`, `#size-cells`, and=
 `dma-ranges` on the parent node when the `non-pixel` and `pixel` subnodes =
are used.
--

--- Patch [2]: [PATCH v2 02/12] dt-bindings: media: qcom,sm8550-iris: Add c=
ontext bank subnodes ---
commit ba9132c7e393d239aeadc5fc3b8d92905c2ec775
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

dt-bindings: media: qcom,sm8550-iris: Add context bank subnodes

This commit updates the sm8550-iris device tree binding to support per-stre=
am
context bank subnodes by referencing qcom,venus-common.yaml. It drops the f=
lat
"iommus" property from the required list and updates the example to use the=
 new
"non-pixel" and "pixel" subnodes along with their supporting bus properties.

> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yam=
l b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index 0400ca1bff05d..3d8ff5677bd4f 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -98,10 +98,10 @@ required:
>    - interconnect-names
>    - resets
>    - reset-names
> -  - iommus
>    - dma-coherent
> =20
>  allOf:
> +  - $ref: qcom,venus-common.yaml#

[Severity: Medium]
When referencing qcom,venus-common.yaml to support the new non-pixel and
pixel subnodes, is it possible for incomplete device trees to silently pass
validation?

In Documentation/devicetree/bindings/media/qcom,venus-common.yaml, the oneOf
check requires the non-pixel and pixel subnodes:

  - required:
      - non-pixel
      - pixel

However, it doesn't appear to enforce the presence of #address-cells,
#size-cells, and dma-ranges on the parent node when those subnodes are used.

If a device tree writer implements the new subnode configuration but forgets
to include these supporting bus properties in the parent node, could this
defective configuration pass dt_binding_check and dtbs_check, ultimately
leading to the DMA translation failures and SMMU page faults described in
the commit message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-vpu_iommu_=
iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com?part=3D2
