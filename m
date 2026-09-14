Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03C442124F
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380566; cv=none; b=DJ7nV3rwu492pdSADh1OtGYV9+Pf4h+0oyiSu0eS5pdd/Gqng60JbTVwLSSowG+LLqDlZMFHXyx/1OaSkVHHkLhND5V2YmOLTNk1jY17x0HezBXn6iVqWZRxI9JvE3olh4Qr6onlXJNTNGuIHrVmQNP3K7/4tDC2cfZNTjsAeNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380566; c=relaxed/simple;
	bh=nw01K9Ht9vTFFg+sE12YaObrVnP77aDIG+IZ7LUbe/Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AJVjRl4BCFmOpZ+g6bCIQLEvts4lrsWQQLeXA6mG6zo0PNixhhHFO1KsYlIK0iMCq8ht3520AZ2l5lKr9Q4FCbq23WFOvMdFgNMKZaP9GP4gZvXyCicg7lZ7kIVPPKxmi7gVxeK0l+XZz58oOrGjW1vOvhOQ06yyI6wS/H3dDik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UR1/VU6v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UR1/VU6v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5201F000FF;
	Mon, 14 Sep 2026 10:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789380564;
	bh=TvMwScqdC7H1KFV7ZbxZKfy0egDQr90wNNO2sshVePM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UR1/VU6vcQAq01yu4fnmDJbqo92jXbYR3E1jYzGWa5LfEdANEGQfxyQbzLop/HZvA
	 tkYeaofV4vAgt6Ti4tHvhe5RRDfuUDb5NsRxnjTi5pcN8kXmHvN2wtEQvwpNEjqNia
	 UFP/HlhHq8WO5eydMAnudLSpZod6mtH85CyM6NT4idcbQPpNHNyV6zeH8Bv+R3eBmp
	 ZyUZ1TA6KJadPqRtdCXdhwBTUK6vFFtWsR/5DibkBRAeqkTvs2Lm7OMSuO9he9IYan
	 plp4QluDzSL3XWusiNpPGLRt6ZhT8qndl0t8LlKlS8GBXlKJXCU5WEkTstwTRz0nSw
	 2w2hyWrBv+RfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: eliza: Add iris video codec node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wangao Wang" <wangao.wang@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260914-add_iris_for_eliza-v1-3-e8ccd9b8cf7a@oss.qualcomm.com>
References: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
 <20260914-add_iris_for_eliza-v1-3-e8ccd9b8cf7a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 10:09:23 +0000
Message-Id: <20260914100924.1A5201F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `video-codec` node is missing the required `iommus` property i=
n its main device node, instead hiding it in unsupported downstream-specifi=
c subnodes (`non-pixel` and `pixel`). This prevents the Linux driver core f=
rom configuring the IOMMU for the device.
--

commit a274945dd4b8c18268a9d385de4b677773a6b70a
Author: Wangao Wang <wangao.wang@oss.qualcomm.com>

arm64: dts: qcom: eliza: Add iris video codec node

This commit describes the Iris video codec hardware found in the Eliza SoC.
It places the iris node at 0xaa00000 with VPU3.3 capabilities and configures
its clocks, interconnects, memory regions, and resets.

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qc=
om/eliza.dtsi
> index a8042291bd075..5ebd2aa0a520a 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
[ ... ]
> +		iris: video-codec@aa00000 {
> +			compatible =3D "qcom,eliza-iris";
> +			reg =3D <0 0xaa00000 0 0xf0000>;
[ ... ]
> +			dma-coherent;
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			dma-ranges =3D <0x0 0x0 0x0 0xe0000000>;

[Severity: High]
Are these address, size, and DMA ranges properties necessary here? Since the
upstream driver bindings for the video codec do not parse child devices for
these properties, they appear to be unused dead code that will fail dtbs_ch=
eck
validation.

> +
> +			status =3D "disabled";
> +
> +			non-pixel {
> +				iommus =3D <&apps_smmu 0x1940 0x0>;
> +				iommu-ranges =3D <0x25800000 0xba800000>;
> +			};
> +
> +			pixel {
> +				iommus =3D <&apps_smmu 0x1947 0x0>;
> +			};

[Severity: High]
Does hiding the iommus property inside these downstream-specific subnodes
prevent the driver core from configuring the IOMMU for the device?

During probe, of_iommu_configure() attempts to set up the IOMMU translation
based on the iommus property in the main device node. Because this property
is omitted from the parent node and hidden in unparsed child nodes, no IOMMU
context is configured, which will lead to fatal SMMU translation faults dur=
ing
video codec DMA operations.

Will this also trigger dtbs_check validation failures due to undocumented
subnodes missing compatible strings and downstream vendor properties like
iommu-ranges?

> +
> +			iris_opp_table: opp-table {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-add_iris_f=
or_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com?part=3D3
