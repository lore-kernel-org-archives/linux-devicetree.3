Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE8B413240
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781543155; cv=none; b=Rn08Sm43vnS71y/B4yPh8nDaip21EIaRQEd6BYlUnLfb/1Q3Mbkrnq950v8XiNYgrMWMDdeQ0WpsP46UfvC+eP++iPAskB8naH4K85L86uj7FsA1E1fOwXqYzSMxWDMow31BdlIxMo4S/MsmADM/Lw2lc6cp95Kbe7Q54IvUf94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781543155; c=relaxed/simple;
	bh=t+UWavgi9au8PKXcqBDDbJvQXzcilnQYYCGknFr6PCo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=troEnQf1ovSGR2o3jQDukgjB/7Ujlg57xi8U25PjdajGT+9i20OHIM5DAWVqf/lDG/oViVRU6jqS9u4x/Cm1ls2hE8hvpnf0N8otX7pt1/pqP+ylXwNUKKKJwJ1bNvOWobwWVicxE+ksYFt68W4U0nIWG0c1cRCEL3JRCOzptKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HelPEy9T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HelPEy9T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4953E1F000E9;
	Mon, 15 Jun 2026 17:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781543154;
	bh=T3P178cM70M36QTb5Ks/5TdMVMarXNjDqtvUsSwgD0k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HelPEy9T9pkvSzXjDTsqmiGGABxCQBnvd61gGoBwto/otr44nYfs2hO8t9BW9knYk
	 GmV9uKo5cuWR+pJwu30sPuaXVPiezEa0QEt2dPs8xSva/5ZTZzo74i+qjwneIBLa+A
	 APNULCXxLtes+jEwtoC/MIPIMLK2BLcwSh1SoH/iO8014JSPlS00iCP7G3M2mOeqQb
	 wugYNyJB3ZajYzUCguEwjPAOpnj9Bj2/cWINeCOUYPRBiZtJrf/jUHv/SCMdqct1J/
	 J8UMsL2BjbNsD9gMY48yqSbmQLFMnUJFpdDVcKJidV0sM10jJ9s9RvOBpe0695DrPK
	 9uorjQzbhUvgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8650: fix soundwire ports
 properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260615-topic-sm8650-upstream-cpu-props-v3-3-eeb6e9fa7581@linaro.org>
References: <20260615-topic-sm8650-upstream-cpu-props-v3-3-eeb6e9fa7581@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 17:05:52 +0000
Message-Id: <20260615170553.4953E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Prepending an element to the `qcom,ports-*` arrays for `swr2` shif=
ts the configuration indices, corrupting the SoundWire Master Port configur=
ations for the TX codec.
--

commit a1c9b1d54073d838cfb9e5474d5c6e26f81803b9
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8650: fix soundwire ports properties

This commit updates the soundwire port counts and properties to match the
actual hardware configuration, addressing deprecation warnings for din/out
ports.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index 090a4739ebc1d..b1293fdb1481c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi

[ ... ]

> @@ -4831,17 +4831,17 @@ swr2: soundwire@6d30000 {
>  			pinctrl-names =3D "default";
> =20
>  			qcom,din-ports =3D <4>;
> -			qcom,dout-ports =3D <0>;
> -
> -			qcom,ports-sinterval-low =3D	/bits/ 8 <0x01 0x01 0x03 0x03>;
> -			qcom,ports-offset1 =3D		/bits/ 8 <0x00 0x00 0x01 0x01>;
> -			qcom,ports-offset2 =3D		/bits/ 8 <0x00 0x00 0x00 0x00>;
> -			qcom,ports-hstart =3D		/bits/ 8 <0xff 0xff 0xff 0xff>;
> -			qcom,ports-hstop =3D		/bits/ 8 <0xff 0xff 0xff 0xff>;
> -			qcom,ports-word-length =3D	/bits/ 8 <0xff 0xff 0xff 0xff>;
> -			qcom,ports-block-pack-mode =3D	/bits/ 8 <0xff 0xff 0xff 0xff>;
> -			qcom,ports-block-group-count =3D	/bits/ 8 <0xff 0xff 0xff 0xff>;
> -			qcom,ports-lane-control =3D	/bits/ 8 <0x01 0x02 0x00 0x00>;
> +			qcom,dout-ports =3D <1>;
> +
> +			qcom,ports-sinterval-low =3D	/bits/ 8 <0x00 0x01 0x01 0x03 0x03>;

[Severity: High]
Does prepending an element to the qcom,ports-* arrays in swr2 shift the
absolute index mapping expected by the TX codec's qcom,tx-port-mapping?

The soundwire driver maps these array elements sequentially to pconfig[1]
through pconfig[nports]. Slave devices, such as the WCD9395 TX codec, rely
on absolute Master Port indices defined in their board-level tx-port-mapping
properties to directly index pconfig and program fixed hardware registers.

By prepending a new element to account for dout-ports =3D 1, it appears all
subsequent configurations are shifted. As a result, pconfig[2] might now
receive data from array index 0 instead of index 1 (for example, lane_contr=
ol
would change from 0x02 to 0x01).

Will this misconfigure the active TX SoundWire ports and break capture audio
functionality on SM8650 boards?

> +			qcom,ports-offset1 =3D		/bits/ 8 <0x00 0x00 0x00 0x01 0x01>;
> +			qcom,ports-offset2 =3D		/bits/ 8 <0x00 0x00 0x00 0x00 0x00>;
> +			qcom,ports-hstart =3D		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-hstop =3D		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-word-length =3D	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-block-pack-mode =3D	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-block-group-count =3D	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-lane-control =3D	/bits/ 8 <0xff 0x01 0x02 0x00 0x00>;
> =20
>  			#address-cells =3D <2>;
>  			#size-cells =3D <0>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-topic-sm86=
50-upstream-cpu-props-v3-0-eeb6e9fa7581@linaro.org?part=3D3
