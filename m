Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9432A137923
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092554; cv=none; b=O1YtAyw7UAQy1Jz/0cnppIsiH8+n5xdv56uuL2SNAyzzG+1HZrzALTN05pdltHcAPsJnyFEf6YaM2tDvEV4VCkhgIwa5WmzdPjCIkZ6+wN9sdW1TjzCcM+rOt6qBNb1tvEb9t6FmjTT83T9kdN45pHlkJoqNS98vAR9EVB3Yn4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092554; c=relaxed/simple;
	bh=WhrTQY69L0GG9EupxbzCUHGICPLtkWKlF6Y14sZwp3M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k/LDOiaDWARbFwdczkt0yh0GVWTWAdz310+id9Z2jSjPoDDTW5F5q5bnFiv43B1EJVSgnzhfOvav8ajwo2p5ADYxUXbz1nNUD7QA9gMv2Xp6QFrGGAvGO5rtV19dyDrztwT+mXpyJ6W5D5G510tDuBXeRYzIEsbUqRIoXYt80RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLxVs0y4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLxVs0y4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384D81F00A3A;
	Fri,  7 Aug 2026 08:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786092553;
	bh=SeqpxfBh35JRwuFvHb/bHYCKbZQRA1yECayZJdy7cu0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OLxVs0y4XntDkflMD2KUdkH8HTXXwj0xY5I2F76Wk/WhWw3a5A+nHjAoPYodYG8g9
	 2AoP8lrFhWeJxgWWx0+s7UQ99pON23Py9/BJMMBQ3mrOyN0WNf3mt7UzhBYh3JfwBg
	 mc4B2T4mMpOwc7lh/3rc03fmq3NGcrPR4rzwPYLotXzeoulqWUC5+hppmtl2HFBVaO
	 8oT44X9sClO7cpTPTYer/bGc12E00BAD99Sv32W5Tw0LSAzzViA3UwmvIm7LXDAB5C
	 oosMHoM4tNQttHXohOrhmfix58Gj3sbPe+lKl12wXQDAm0stKwFXBQyMz+f/MNJU8f
	 9NkUPk2CiEJtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/22] dt-bindings: media: qcom,venus-common: Allow IOVA
 reservation memory-region
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-1-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-1-3996f67e33f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 08:49:12 +0000
Message-Id: <20260807084913.384D81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch updates `qcom,venus-common.yaml` to permit a second `m=
emory-region` phandle for an IOMMU IOVA reservation, but fails to remove a =
stale `maxItems: 1` constraint from `qcom,sc7180-venus.yaml`. This prevents=
 SC7180 devices from successfully validating if they supply the newly permi=
tted second region.
--

--- Patch [1]: [PATCH 01/22] dt-bindings: media: qcom,venus-common: Allow I=
OVA reservation memory-region ---
commit 44e20424e211e02ef9914abe4592c185ad0d75ac
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

dt-bindings: media: qcom,venus-common: Allow IOVA reservation memory-region

Non-pixel stream IDs should not allocate IOVA space from the 0 to 600MB
restricted region, as this region is reserved exclusively for secure
non-pixel.

In addition to the firmware-loaded codec carveout, platforms need to
declare an IOMMU IOVA reservation (a reserved-memory node with
iommu-addresses) to keep DMA away from restricted IOVA range.

Permit a second memory-region phandle for this purpose, and describe the
meaning of each entry so the ordering is unambiguous.

> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.ya=
ml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> index 59a3fde846d21..0be2f9119e782 100644
> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> @@ -37,7 +37,10 @@ properties:
>      maxItems: 20
> =20
>    memory-region:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Firmware-loaded codec carveout
> +      - description: IOMMU IOVA reservation region

[Severity: Medium]
Since this patch expands the common schema to allow two memory-region items,
should the local constraints in related variant schemas also be updated?

For example, the local constraint in qcom,sc7180-venus.yaml restricts the
items to 1:

Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml:properties.m=
emory-region {
    ...
  memory-region:
    maxItems: 1
    ...
}

Because dt-schema evaluates a logical AND between local constraints and
the included $ref schemas, won't SC7180 device trees fail dt_binding_check
validation if they declare the newly permitted IOVA reservation region?

> =20
>    power-domains:
>      minItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-iris_iova_=
600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com?part=3D1
