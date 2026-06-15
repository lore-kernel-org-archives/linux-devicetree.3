Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6188413630
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781543702; cv=none; b=BLcJkeB9K8nULy9Xudr6bL+QL7pFJ47HO9Ye5weAJuKhN9cDWvblxraCDGvh1reQTWUERHQ5blD9tWBLWiaXo0kJPFKZuEgJXwvBpCRmODb0f1TakrniZCuHNmynWRu70sROkOkuZcLoeE9uMw25OvlD+PffuYmEqAm4s5Ktsiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781543702; c=relaxed/simple;
	bh=4iHd+HKzGQLzyzlxuQmC6mX3ETVJUcmd0U0dr0fJnfY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ch2Jllo6Bbo2QtZo4a2c/XIVC1RCSH0pnwtNWls2qwebeR6JNm2jqocPw3bVMTLfOBUC76gB6uvFq40d6vAxf0hgzQb3C04Hdfkr/4XUi+3RYVivcKpgS15C9F5u4GjGy/cMAcQVlPu+Gcv2jxiHFaSArS16F9fI8wOTUmy0/Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vy2eESwf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vy2eESwf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EAF1F00A3A;
	Mon, 15 Jun 2026 17:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781543701;
	bh=UlW0+qPLQLzyxg/7gUbSXQF1XRrmlFqk0Q86Qff1C2A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vy2eESwfbSNIxjTT2+fy4GIxXOxlUk5YsslXy4c6EcOglg5iN7rF6WgffuzVTO5eP
	 21E7ChqHkWUDFlmO/gIpgb3eC3sTK/sBgxPEAHO6VM1+9pSaEaXpcX6m3upeP/osi/
	 mz0EUsVJObb5y6GFd33z9IOLgG7FsLt0A9sOekz5Sp7G+PFRXm9EhFoGf04049Q9RB
	 adOVnZWF1sdEDTHwGyOpL3Fyxi8+hWF8xic7r61j8RF4JwiVw5K3rvPIYrAx7K32yn
	 dUezpKVHQhu8a4uX24ddDmWBQy77yvXpe2NZzEtLQTPB0crK8wmUBb/xFrPziNSUfs
	 r0Aeh/LvFX+eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 6/6] arm64: dts: qcom: sm8650-hdk: add SPMI ADC
 channels and thermal nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615-topic-sm8x50-adc5-gen3-v3-6-216a2b5ccb85@linaro.org>
References: <20260615-topic-sm8x50-adc5-gen3-v3-6-216a2b5ccb85@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 17:15:00 +0000
Message-Id: <20260615171501.31EAF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Mismatch between the device tree node unit-address (`channel@503`) =
and the evaluated `reg` property (`0x803`), violating Device Tree specifica=
tions.
--

commit 0ba8e109ec38cf4d6ce92bd1b9d00c8dcbbce432
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8650-hdk: add SPMI ADC channels and thermal nodes

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the other PMICS
on the system. The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8650-hdk.dts
> index eabc828c05b4c..cc2d341760a90 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts

[ ... ]

> @@ -1041,27 +1130,217 @@ led@3 {

[ ... ]

> +	/* PM8550VE Channel nodes */
> +	channel@503 {
> +		reg =3D <PM8550VE_ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;

[Severity: Low]
Does this unit-address match the evaluated reg property?

Since PMK8550VE_SID is 8 for the SM8650 platform, the macro=20
PM8550VE_ADC5_GEN3_DIE_TEMP(PMK8550VE_SID) evaluates to 0x803.=20

Should the node be named channel@803 to comply with the Device Tree
specifications and prevent a dtc unit_address_vs_reg compiler warning?

> +		label =3D "pm8550ve_die_temp";
> +		qcom,pre-scaling =3D <1 1>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-topic-sm8x=
50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org?part=3D6
