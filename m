Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FF647ECEE
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328277; cv=none; b=cV5XLqUOFXlvRP3vaNoFa1k6PyzJkvdeM5lfESImAwsBWD/Wgx1iOIjXN7NmqTk/ruH2OM8r0e58V+jNMGQTrEBfheNzr7sj3JH2ozQcCh3IRoExd23lxoApuJ7L36dGsC74zWK9WD/8J6SL/P0twhD0P+kdUYjtAvrkokyEhNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328277; c=relaxed/simple;
	bh=/OSv3AQA6LgKvrqrbR5U1knhiQV38JoGWakzNuZwtrQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BeKmuaNvwteZ5Kml8fHBoCgvNH52vz2ZESxQ3FdPB/bC7IVrMnVWUWxsJUA0LfQWaYro5Pp7fP3OSSzhnCriStY54JQUTiO3BwKDLmwzQz6iQ+YzNOByyAcbPERkqy/KkIALVx3eXCCVMWhkRXBFp4mYPZpsAywBpGmo7QtrXjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NTX165zG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NTX165zG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75561F000FF;
	Fri, 25 Sep 2026 09:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790328272;
	bh=Tp6wRFWHPqxlTLYTn/6B8Q1vYfM09QTQvj5ogboWS8E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NTX165zG8EhIgwbh/Ay/vzX21zxcQUZGdBTbrCcfNJ1Hkm865z2AvvnT61Qg/aSt7
	 7pHtBL5P9FyUtmntziE/84sUGrOP8dRInnRHk2U8Tx/Zyd/3zOmYOQG12cl9XI/vCL
	 xVaBfZIYKm15cDksoer3XCh3LIizg2MROZfhelZ5ebElVC8fTF4tGOOC9SLveEhmeV
	 Rk+ZVh4f6eQK4jGg/0t9apPOtJMkQx1peryLgHUBEspC9++OZlXlnjjnh2AdLsjGJZ
	 C1MVQ1wGvVzzTxXIhY3HkZBRvy6yhnzQF+nSh1wjIl1srRg7ctixiWPVBEpyBsCPE3
	 Og7qZd/lvrimQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 7/9] arm64: dts: qcom: agatti: Add OPE node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260925-camss-isp-ope-v10-7-2622411034cb@oss.qualcomm.com>
References: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
 <20260925-camss-isp-ope-v10-7-2622411034cb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 09:24:31 +0000
Message-Id: <20260925092431.E75561F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: qcom: overlapping IOMMU Stream IDs between camss and isp_op=
e nodes
--

commit ce4e88f2447866367f72eb516353f018922e3bed
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

arm64: dts: qcom: agatti: Add OPE node

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the six register
regions, clocks, interrupt, interconnects, IOMMU mappings, and OPP table.
OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Agatti boards.

> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/q=
com/agatti.dtsi
> index 590bd2432d85b..69237959adc15 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -1984,6 +1984,83 @@ port@1 {
[ ... ]
> +		isp_ope: isp@5c42000 {
> +			compatible =3D "qcom,qcm2290-camss-ope";
[ ... ]
> +			iommus =3D <&apps_smmu 0x800 0x0>,
> +				 <&apps_smmu 0x820 0x0>,
> +				 <&apps_smmu 0x840 0x0>;

[Severity: Medium]
Will this cause an IOMMU Stream ID conflict during boot when the devices are
probed?

The sibling camss node in arch/arm64/boot/dts/qcom/agatti.dtsi still claims
these exact same Stream IDs alongside 0x400:

	camss {
		...
		iommus =3D <&apps_smmu 0x400 0x0>,
			 <&apps_smmu 0x800 0x0>,
			 <&apps_smmu 0x820 0x0>,
			 <&apps_smmu 0x840 0x0>;
		...
	};

The QCM2290 CAMSS binding allows the camss node to drop the three OPE Stream
IDs and keep only the VFE Stream ID (0x400) when OPE is split out into its =
own
node.

Since both the isp_ope and camss nodes now claim 0x800, 0x820, and 0x840,
should these IDs be removed from the camss node to prevent the arm-smmu dri=
ver
from failing to map multiple distinct devices to the same Stream IDs?

This duplication does not appear to be resolved later in the patch series.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-camss-isp-=
ope-v10-0-2622411034cb@oss.qualcomm.com?part=3D7
