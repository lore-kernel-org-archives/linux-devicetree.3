Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173799;
	b=dDNBtW08LmV8LyslNcBPFULPBIVVfAg7hNBotnnAeIWttMYHZGmaQbfbwe5uVv7o9VfY
	 h+mH+M6k9Y9fu7q9hkjgI867ObjeDXkues3R2DFOMkwmsM9QYXjA7LTtfjpCFZ3pR+Pjr
	 it1y/yDpZtV6JlGzidtA2dCq5m3+Q7GnG6L0xTPcOiKsyFhCwpy2VI71q23FQDjZYPWZZ
	 WHZ06vz9jDtPIBFpq6PNjCxLK5Uj8YWQIlOHkDw85ntBabRi7V5TxTTtiVX46U0Aqzccy
	 FYfAgRoGgFaW7ffx39uOr6cr7qFD4152P4We7JwNK4MQTu9vvD1pgf6QbkD9Vb3zxCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173799;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rrWnKARSFlSAPA4kETeK/IXBreirUUGPjUsREPOx/RQ=;
	b=ujSdQn68FF1uibWFmepN70F8x+px3K+dNIlJ3d/CuSPpMuaj/zG8p3IJYnsHQefk+cI6
	 MqVvqdIPMEg5w0rXmhGGM2gpoxbP4PwwVhehGisT1kXBJV5azVtqDu+rbaw+1qr/nM9tx
	 0ZObLhfAe0JkfpPI2Nxqm7sEbMpmsa7JOOodpt1rmzYQa1zmNVWd5wzhJ9Q6I8rDx+Qia
	 F0pbSJCyUfEMRe9QoshPYzjmMDF51r1Zhmt0ZREsuCPstGtUo9KC0r/ckJNqlSvQOn08c
	 TMvx/4Vf0yGN57+EghHntd68Chr9SzF1hJhUth/JbGJTjs9lwB+rYjAIGxVeb44q8Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ns55Rppx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D1B606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ns55Rppx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF7D1F000C0;
	Fri, 20 Nov 2026 11:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795173798;
	bh=rrWnKARSFlSAPA4kETeK/IXBreirUUGPjUsREPOx/RQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ns55Rppxo5MfNpNBOiT0EtbucCfCm9zr5XnQjlvbHVH7exJuO7ocJgeI3Nun34xdB
	 epzdkPuC+OEnBtX33S6tVyzlCSikdz1VK+lVibE0hePgdB2ynypJsqA6zX1Ml8d7E2
	 5S5zzVbwhnfgwMgTSmGbUfL0ZSsRVjlhdmPjEsGIaudCZNWmA39twedRqBqNZyXoN1
	 Mwp0RKAEnoCLd7/SSnGDyX2b4qGSIjay2Tegn1xi79WtASnqy3pir/eDvtwHsNFSfv
	 3HjCyEWZgiPk9GWMsRa7Tp1ws6vCNAgLXTqDfHbWZd0XwZaF7sU6/Oj7cy8RNTAX6e
	 upwFEfBiibrZQ==
Message-ID: <sashiko-outbox-225031@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 14/20] arm64: dts: qcom: sm8650: Add GEM_NOC
 interconnect for adreno SMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bibek Kumar Patro" <bibek.patro@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-smmu_interconnect_addition-v4-14-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-14-cab8ee8be0b3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 11:23:18 +0000
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
- [Low] arm64: dts: qcom: sm8650: unintended removal of gpu
  interconnect-names
--

commit 72015d4c6d7453afc78cfb61288e3b47a72eaeff
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

arm64: dts: qcom: sm8650: Add GEM_NOC interconnect for adreno SMMU

This commit adds the MASTER_GPU_TCU to SLAVE_EBI1 interconnect path to the
adreno_smmu node on SM8650.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index 5a030f9646c87..86b3fa4cf05a2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4214,7 +4214,6 @@ gpu: gpu@3d00000 {
> =20
>  			interconnects =3D <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
>  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> -			interconnect-names =3D "gfx-mem";
> =20
>  			status =3D "disabled";
> =20

[Severity: Low]
Was interconnect-names =3D "gfx-mem" removed from gpu@3d00000 by accident?
The commit message only describes adding the MASTER_GPU_TCU interconnect to
adreno_smmu, and Documentation/devicetree/bindings/display/msm/gpu.yaml
defines "gfx-mem" for the GPU node's memory interconnect path.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-smmu_inter=
connect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com?part=3D14
