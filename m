Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C8A416872
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380616; cv=none; b=Utp8+b4P+zdsCIQDWY3xAcZ1q9TgRll9W3RbWoZSOFV4yUcHnLP96Klk/TUyRcWrZ+HVPT1aC2hHWeKU/zfBLL3K3sksSJovXKNd5aruc/5dZUPQzbRINfYW6DUpctQ8NArb3Ooc/isKFlefF4YgH4jZN5UwdV94kJt7okOHrOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380616; c=relaxed/simple;
	bh=NbgWFIE/yZzld3SGvBmGvL9AgN6fCfh10xfivHA0mr0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MiCom/9GTv1u/0L4sE1vVvgZDFWamZbWJm7dARAhkCdLBGlxPimps1ZuKasaIcPDTDFU/Rz2qV0SpnkP+1K+ari55azuxilfctEbaiBfeZXLM7ujAD6trlDMmT1VdZPM+MmmMLEpBFndToeWjJNkPtMQoKMJMoLbh2n8mgf5AKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIH80bOa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIH80bOa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03CD11F000FF;
	Mon, 14 Sep 2026 10:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789380615;
	bh=ew4y1YSykLlrVPPL9RFVOD/aSyl0pOVPE9uTwmu8nBg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LIH80bOaglp7ai5ZC0qnmjEaQJNgHOKp9MjWAEQI2wcXI+t9ECIfl9Ey+WMpD8uC4
	 Jrx0oYCgx7JjyXNZ/Awt/PiRBbuuWGBuaBooRqdW3EheArgRW1SPQeHYmY7c8BK/Cd
	 DE1SOFNshE5K95WVucXqT3sX77e7uyjLGRICJZmG2Qk9yBZ/gZpkQ0dYJf0tvvncwn
	 1XHY+nDQ0mReWicHrDVKL2hcJYN/AohKRsb8SnGXahzJMbO05woA/AOoyNfwprTedO
	 ws1fD7fEL4luLFxJ8u2plv2grRdFUSNzqsx1LYl+0RwBTfBkNJvdvm0rrhxsdYB71l
	 cI7y2aJH5dn2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: eliza-mtp: Enable iris video
 codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wangao Wang" <wangao.wang@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260914-add_iris_for_eliza-v1-4-e8ccd9b8cf7a@oss.qualcomm.com>
References: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
 <20260914-add_iris_for_eliza-v1-4-e8ccd9b8cf7a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 10:10:14 +0000
Message-Id: <20260914101015.03CD11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `iommus` property is incorrectly placed inside `non-pixel` and=
 `pixel` subnodes instead of the main `iris` node.
--

commit f75c3762943bc77bc910383ace15428dcbdec236
Author: Wangao Wang <wangao.wang@oss.qualcomm.com>

arm64: dts: qcom: eliza-mtp: Enable iris video codec

The Eliza MTP includes the Iris video codec, but the device tree leaves
the node disabled. Mark it as okay so the video codec driver can probe
on this board.

> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts=
/qcom/eliza-mtp.dts
> index ee05192adcfb9..e5a698602dfc7 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
[ ... ]
> @@ -430,6 +430,10 @@ &gpu_zap_shader {
>  	firmware-name =3D "qcom/eliza/gen71700_zap.mbn";
>  };
> =20
> +&iris {
> +	status =3D "okay";
> +};

[Severity: High]
Does enabling the iris node here expose an issue with how its IOMMU
configuration is defined in the base dtsi?

In arch/arm64/boot/dts/qcom/eliza.dtsi, the iommus property is placed inside
legacy non-pixel and pixel subnodes:

			non-pixel {
				iommus =3D <&apps_smmu 0x1940 0x0>;
				iommu-ranges =3D <0x25800000 0xba800000>;
			};

			pixel {
				iommus =3D <&apps_smmu 0x1947 0x0>;
			};

The generic IOMMU framework (of_iommu_configure() in drivers/iommu/of_iommu=
.c)
only looks for the iommus property directly on the device node (dev->of_nod=
e)
and ignores arbitrary subnodes.

Because of this misplacement, the platform device will fail to attach to its
designated SMMU domain, causing DMA operations to use raw physical addresses
and trigger SMMU translation faults.

Furthermore, the qcom,sm8550-iris.yaml binding explicitly requires the iomm=
us
property on the main node and strictly forbids unlisted subnodes via
unevaluatedProperties: false, which triggers dtbs_check validation errors.

Should the iommus property be moved to the main iris node before enabling i=
t?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-add_iris_f=
or_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com?part=3D4
