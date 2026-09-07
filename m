Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4224749DD
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 11:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779155; cv=none; b=PD09kHaQYZMPKBerZoczKY+bLvvW5AQ8Ctts4oR6RYOPbX5J8o+vC/dTXHkucoTyFOs8MBszJiFDDT8WCognJTk7He8mjnHyDLeU8xHD3/Gdtv7qfnSPbCuy1cgQpKaLG+MRj+ukT9M/nyVWsNZDwtp/yeOvU4sS0xCd6Zu8nb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779155; c=relaxed/simple;
	bh=WyJutd+CK+lWMpJ6kGsnnzC3XAalPorpQm6AK6XeSJI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QPRr/bOw1yyXD06vo8sPio9gTvbVybhklo3baoUW1FLL3hVsyZ5CewlfzYJgTiOco3zq6ydPopqo/9f3oxpPF480gtEnn2naaBjT/LO1R6lk/DMRDF/KgkMT1NWeI439iEDxPtqIntO0X9QXzkl+j2oEvCcXrB7tI/8J7f8b89c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUbi46m4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUbi46m4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D851F00A3D;
	Mon,  7 Sep 2026 11:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788779153;
	bh=TsoEj3/gMwYuDor+elKWrEYJ9VayedNLeT/FVr4AQ7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SUbi46m4dWb27SQPNOY9On7kjgZtc9mAhbXqkv85dJXdpiTFT9W/347kbBQMgJCFD
	 ut9uF/AsPo95sB1aAErG5kL3V4XI/LfLeUFbH3NF+rk9xAaqsWC8SWjfh+GIKLZ+QN
	 fg7q5AZ5tbJ91RDsQoxRJf3PiW1ciX1eWJsariHj7pBB3VgRJKnedSfJkwZBher4bY
	 QIaUq41SsKyzKKDoOOgEqii93+kbsXXlsVazq/lfCPdJL8q5t6W5cRbF8Y6cpPgPBN
	 yANbdPvXWVyR6vajhQs9aRYyk4tT070vHtmQr0kI4/RBHodHkNcq/uYZqsscQwY3LR
	 J61X8nwbIkfIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/8] arm64: dts: qcom: agatti: Add OPE node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-camss-isp-ope-v6-7-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
 <20260907-camss-isp-ope-v6-7-6b915b9c5131@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 11:05:53 +0000
Message-Id: <20260907110553.79D851F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The newly added isp_ope node duplicates IOMMU Stream IDs already=
 claimed by the camss node.
- [Medium] Commit message inaccuracy: claims 'five register regions' but pa=
tch defines six.
--

commit a6bcd2ed27a39660b6ddfa806dddec5a5aa79a2c
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

arm64: dts: qcom: agatti: Add OPE node

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290).

>     Add the Offline Processing Engine (OPE) device tree node for the
>     Agatti platform (QCM2290). The node describes the five register
>     regions (top, bus_read, bus_write, pipeline, qos), clocks, interrupt,

[Severity: Medium]
Is the description of "five register regions" accurate here? The patch
actually defines six register regions in the code, including the "cdm"
region which is missing from this list.

> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/q=
com/agatti.dtsi
> index 590bd2432d85b..875ef67e54e96 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi

[ ... ]

> +		isp_ope: isp@5c42000 {
> +			compatible =3D "qcom,qcm2290-camss-ope";
> +
> +			reg =3D <0x0 0x5c42000 0x0 0x400>,
> +			      <0x0 0x5c42400 0x0 0x200>,
> +			      <0x0 0x5c42600 0x0 0x200>,
> +			      <0x0 0x5c42800 0x0 0x4400>,
> +			      <0x0 0x5c46c00 0x0 0x190>,
> +			      <0x0 0x5c46d90 0x0 0xa00>;
> +			reg-names =3D "cdm",
> +				    "top",
> +				    "qos",
> +				    "pipeline",
> +				    "bus_read",
> +				    "bus_write";

[ ... ]

> +			interconnect-names =3D "config",
> +					     "data";
> +
> +			iommus =3D <&apps_smmu 0x800 0x0>,
> +				 <&apps_smmu 0x820 0x0>,
> +				 <&apps_smmu 0x840 0x0>;

[Severity: Medium]
Does this cause an IOMMU resource conflict? The newly added isp_ope node
claims IOMMU Stream IDs (0x800, 0x820, 0x840) that appear to be duplicated,
as they are already claimed by the sibling camss node.

When both nodes probe, multiple peer devices claiming the exact same stream
IDs will cause the IOMMU framework to either reject the second device's
registration or artificially fuse the devices into the same IOMMU group,
breaking logical isolation and fault-reporting granularity.

Should these duplicated SIDs be removed from the camss node now that
isp_ope is split into a sibling node?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-camss-isp-=
ope-v6-0-6b915b9c5131@oss.qualcomm.com?part=3D7
