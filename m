Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173474;
	b=f/P87kvZQFkDaAgJFdTByC5aqwb6SnZ3Dc3nCcppRUO9dqbxRKftMqIEzC9fo4w6Gz8/
	 TP1D6Tu9B7YfQYh8dspofeH9YYZjC55Abc/CxIY+0fMVbcpjahO0mZzBq7anLSsuOEuB8
	 gqoGYKBwjfpiAfy0A74lSMDGihr+r9jsSvyJT3Qb5gGXjpQpsN4XcRevl4yWS+YKBuiIq
	 6sf+X9g18kCfU5JPqHeUCI/aWtgJCiq7bbgOH+xj9eAoP/PvDEYkxJBX7Ux0v19D5zQws
	 83jdh8x/zK0PdbTKggvmGo28zVy9H07hKyPVzHchd0VahZ4eOy9RHg4dptBC96g1X5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173474;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Y+3CkhrUkCDB1oP3lktxMY39aliixdqOQZc21BfMpII=;
	b=gRQBJM447E+ESr3pP3HdY3edqtKik+WhUN3MFjLRxCte8etFRJLcetx4PCDUhSTiTCOc
	 usxND11nhH5goNXVT2lt4FdtJ4SdOsXcL5jaTTiB/GlfuUQSp8N6uh4xzjrESC2oS6+yy
	 x8zw/Yy544su5CLHDM5pe0b/iFsP6GABgZhupCnM7CAuYHr0+5H7tCb5JgJjzXpGxYQVa
	 HSEctr4cCFsBpDFr+iz+jEDDMFjpHRDfX3RH1y70tFLhtClcUl4FTDQiUBZ9XMd3q0suC
	 i2Py9V1qjwjQQoBAjRvIZOl7QFzfe6na3l4KsRgxpUnycvqBMGQP91UBFrVjdnJ+Ssg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="RN34TS/c";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA32F606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RN34TS/c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114C51F000D0;
	Fri, 20 Nov 2026 11:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795173474;
	bh=Y+3CkhrUkCDB1oP3lktxMY39aliixdqOQZc21BfMpII=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RN34TS/cH8m2z7D7hF4cNpYhVO/wk0SEz/SXG/fDuqSzdx0ZKW3l/RlWaNlJovnd8
	 oEzMtkXB7wYhgj6ZIv54N12LmsbfEdUeR+SOY8MVXES5zHbjEm9gWhR/hWaJoSbIMe
	 B3WDIrRJDlGQ+VFyIdUtyuaixsGOIFQCJL6lCq9Shcu74QWblAOQinknwLuKccMmP5
	 U9HZaPZQ1yeT1irRVDIjXsUme23xOiHA+TLQhltQz4R7CC/yE050f78bGPBFzYUZ/O
	 j2wtW2c3Wiq3Tntp9F/vUsN0o5nNNxbQWQrej7l+DvFYATp0keN9ccchlh5G60oqLw
	 uJWSPAbmDXoCw==
Message-ID: <sashiko-outbox-225015@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/20] arm64: dts: qcom: sc8180x: Add GEM_NOC
 interconnect for adreno SMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bibek Kumar Patro" <bibek.patro@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-smmu_interconnect_addition-v4-10-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-10-cab8ee8be0b3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 11:17:53 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: qcom: sc8180x: stray removal of interconnect-names
  from gpu node
--

commit 9120d8611d0bb38dd767ab3679b946a8276a0536
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

arm64: dts: qcom: sc8180x: Add GEM_NOC interconnect for adreno SMMU

This commit adds the GEM_NOC to DDR interconnect path to the adreno_smmu
node on SC8180x so that the path remains voted during sleep and wakeup
transitions.

> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/=
qcom/sc8180x.dtsi
> index be79608b7161a..88a39e5e8f07b 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> @@ -2280,7 +2280,6 @@ gpu: gpu@2c00000 {
>  			operating-points-v2 =3D <&gpu_opp_table>;
> =20
>  			interconnects =3D <&gem_noc MASTER_GRAPHICS_3D 0 &mc_virt SLAVE_EBI_C=
H0 0>;
> -			interconnect-names =3D "gfx-mem";
> =20
>  			qcom,gmu =3D <&gmu>;
>  			#cooling-cells =3D <2>;

[Severity: Low]
Was interconnect-names =3D "gfx-mem" removed from the gpu@2c00000 node by
mistake?  The gpu node keeps its interconnects property, and the
Documentation/devicetree/bindings/display/msm/gpu.yaml binding expects
interconnect-names =3D "gfx-mem" alongside it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-smmu_inter=
connect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com?part=3D10
