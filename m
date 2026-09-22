Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A063C442B32
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072282; cv=none; b=B5AKeprlc6dAapgxcxqkv2YDtCvX+mD4qjE9jBQbH/M2s9f5/Bfomq/E3fK7mfDwwbGVcIYnubCwSEtHNcFAjwrAdwzHFe5Ks315bpqUjJKvjcD3DJGvMnUouf5wWzeSgOBPhWVFn2VgpkPLFuy/QyJoY2/DLDlm3RECP3+jP2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072282; c=relaxed/simple;
	bh=Ty4Wz57DI5HGijrGX5RENSNjzUIcTvCWbcIT/URvaIc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i6fvzKF1q+BbnxcOJIEBfP9eXDF8BiIa8dkwBUXld+BbISSV0QPTwRHn6wIxNo7kubOVQjeM/k10M22CLLYeE4Lu9PXw0OYW5+rYTv4llO4Roq+QPlsAo1kp7BabWU+XMt7GULTC+UqNiDSap0iNJqpq1zrDpjxUnereY8DaZgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jo6g1xIm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jo6g1xIm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E181F000FF;
	Tue, 22 Sep 2026 10:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790072279;
	bh=DA+GSsOI/ksd97SOE54S4jcJYOGKoCcmnNcyQUaX+do=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jo6g1xImY05EC5SZy9ER9gg2o3Uxp14M8kGisQJfb+yPdojHwaHSHzdFkwKruIHiy
	 o4SL/MMGfRs+Yy6eMEgwXyAyW+OJmoeVJ/5ObPALSCspUj/rIJ69kKXqPCOfII7Eaw
	 UjrruQIsyUZX19/sSmyUU+DPTK/amfiTYczuygeVStHG+z400FSW+joxsvh16/d/X8
	 3D/D657fOuBweIO5nW/sA3h05CKiXXNLWtxzPKVu3kLddr4VOfVN9fHFBzF1aQsSoG
	 frcDbSkFOHcuTfIqdiY51tvQFLZmJchpLKCd8rGnqeqMMuiTaLjrv+la5AfCIf9TLC
	 5Bpef/8hdPhxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: nord: add CoreSight debug nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260922100850.527109-3-shengchao.guo@oss.qualcomm.com>
References: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
 <20260922100850.527109-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:17:59 +0000
Message-Id: <20260922101759.85E181F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dts: sysfs naming collision due to duplicated DDR3 labels on DDR=
2 TPDMs
- [Low] dts: typo 'hpass' instead of 'lpass' in dummy source node name and =
label
- [Low] dts: inconsistent naming pattern for nsp0 static TPDM
--

commit ecdfc6b26cc7775c5a0086623c2b989b0669a009
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: nord: add CoreSight debug nodes

Add the CoreSight trace topology for the Qualcomm Nord SoC, including CTCU,
STM, TPDM/TPDA sources and aggregators, funnels, replicators, TMC ETR/ETF
sinks, and per-subsystem CTIs.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
[ ... ]
> +	hpass-stm {
> +		compatible =3D "arm,coresight-dummy-source";
> +		label =3D "hpass_stm";
> +		arm,static-trace-id =3D <25>;
> +
> +		out-ports {
> +			port {
> +				lpass_stm_out: endpoint {
> +					remote-endpoint =3D <&lpass_tn_in18>;

[Severity: Low]
Does this dummy source node name and label have a typo? It uses 'hpass', but
the endpoint connection and the commit message use 'lpass'.

[ ... ]
> +		tpdm@12410000 {
> +			compatible =3D "qcom,coresight-tpdm", "arm,primecell";
> +			reg =3D <0x0 0x12410000 0x0 0x1000>;
> +
> +			clocks =3D <&aoss_qmp>;
> +			clock-names =3D "apb_pclk";
> +			label =3D "tpdm_ddr3_llcc_2";

[Severity: Medium]
Can this sysfs label cause a naming collision? It incorrectly labels a DDR2
TPDM as DDR3. CoreSight drivers use this property to name devices in sysfs,
so it will collide with the actual DDR3 TPDM node at tpdm@12610000 during
boot.

[ ... ]
> +		tpdm@12411000 {
> +			compatible =3D "qcom,coresight-tpdm", "arm,primecell";
> +			reg =3D <0x0 0x12411000 0x0 0x1000>;
> +
> +			clocks =3D <&aoss_qmp>;
> +			clock-names =3D "apb_pclk";
> +			label =3D "tpdm_ddr3_llcc_3";

[Severity: Medium]
Similarly, will this label collide with the DDR3 node at tpdm@12611000? It
seems this should be labeled tpdm_ddr2_llcc_3.

[ ... ]
> +	tpdm-nsp0-cdsp-llm-2 {
> +		compatible =3D "qcom,coresight-static-tpdm";
> +		label =3D "tpdm_nsp0_cdsp_llm_2";

[Severity: Low]
This isn't a bug, but does this node's name and label deviate from the
established pattern? The static TPDM nodes for NSP1 through NSP3
consistently use the suffix 'llm2' (e.g., tpdm_nsp1_cdsp_llm2), whereas
this one uses 'llm_2'.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922100850.5271=
09-1-shengchao.guo@oss.qualcomm.com?part=3D2
