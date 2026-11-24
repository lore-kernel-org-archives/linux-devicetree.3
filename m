Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540024;
	b=fGEw32BvOTsuajC8durFWiHKeMdV84iluAh0QIbCVooSY74pIpA+spgCSoqQJRFl8n1S
	 tN4wZyOmJhff28U5xThsQtb1vtAe/WjOWvk0k3RJyAbxDsfEvrkz+Co63HjU9660F+PO5
	 +4NybbeYigOl0zAFTYltTajY2EPjo0iqDrvNKjHLdgpc0CX5QQUqkCAqGR5BVsobkZMz1
	 boC7ZYS9Ew0cjcXxWbO86Z+NDvHSEbtO9cIlHlNbNaAbCJmefMg9nYPYe97ZjTKi9UGt4
	 WrlVwjnAMMPiN626gKbVD210TT9DZ+lLcLN21byGvTee2druFtTiauEeFvRvbPppucw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540024;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nwJhaD7hsHvajmc5rbX+89FnjO13FGDBeDfX0HlW70A=;
	b=IHWqAKrunn4YBli/FxAxu7bmI1BA1U1vWC3M3UdCZiEsyRz12m4baqAAcTX4Ke+wUejo
	 UKRVyPLF2Z3ylNyiPdV4cw5vDQ60Zp4+woIAsA30DGAD/gPUwPIsYSogBkFsHlzJnWxu8
	 i7ivCbH4BZT1mR31fsDVcDlhAWQl63xPRTtSyrQqe1FLpNmvwe7alZiJcOj7ki8XyeW5o
	 PZVAjuo7h4Xi2NKv7gB7CB715kUYSzbFYNNHWDCq69ES/XIhcGJCqK523Xkg4RDA77yKO
	 cHVEm9udRhD3VqBqid2i4rWdr91wYo1tmsa7UdX48uZdz4317cO7YhkHgBXAYqrnmPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Megi8c9q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00536606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Megi8c9q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF511F000CA;
	Tue, 24 Nov 2026 17:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540023;
	bh=nwJhaD7hsHvajmc5rbX+89FnjO13FGDBeDfX0HlW70A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Megi8c9q3FX0YhDQFoohmQKdMePyfxCVivfvxuPFAjktx0OV0PqtTpj5aCxUByIm2
	 n0LeBnCG37EC2zK6yywfVM7KM0OLi9MOhtYkppiSs0UJuCVUcfhwnwcV0KMk12bIZ/
	 x1g9U4N7Nc6sVErZ0NFNnNnpNgBo7uHvrtAoPBHHUjbKHX4t3bIVDAmlOIO6qw8gP0
	 1PYw5FYyklhIDfmRykv+ub05cBnRFKcuLIAlVHYUVCgdPFzS7KkZCvCXwKeEdlZ5aV
	 Fgl+Sdfup/8WNC8r8KzvkDXecpgsLotadAsmCZ5DbvaRWa3wJn2IzyBaeoio098g3h
	 UA25NFSRCpS8g==
Message-ID: <sashiko-outbox-231655@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm630: fix ADSP FastRPC heap
 assignment
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nickolay Goppen" <setotau@mainlining.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-qcom-adsp-shared-vmid-fixes-v1-2-f1a808dc41a5@mainlining.org>
References: <20261124-qcom-adsp-shared-vmid-fixes-v1-0-f1a808dc41a5@mainlining.org>
 <20261124-qcom-adsp-shared-vmid-fixes-v1-2-f1a808dc41a5@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:07:02 +0000
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
- [High] arm64: dts: qcom: sdm630: adsp_mem left reusable after revoking
  HLOS VMID
--

commit 4c51ed0e779228db4d03e3924b592519e72060d8
Author: Gianluca Boiano <morf3089@gmail.com>

arm64: dts: qcom: sdm630: fix ADSP FastRPC heap assignment

This commit removes QCOM_SCM_VMID_HLOS from the ADSP FastRPC node's
qcom,vmids property in sdm630.dtsi so that qcom_scm_assign_mem() succeeds
when assigning the adsp_mem heap to QCOM_SCM_VMID_CP_ADSP_SHARED.

> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/q=
com/sdm630.dtsi
> index 20225732e4a80..327a8049f7072 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -2477,8 +2477,7 @@ fastrpc {
>  					qcom,glink-channels =3D "fastrpcglink-apps-dsp";
>  					label =3D "adsp";
>  					memory-region =3D <&adsp_mem>;
> -					qcom,vmids =3D <QCOM_SCM_VMID_HLOS
> -						      QCOM_SCM_VMID_CP_ADSP_SHARED>;
> +					qcom,vmids =3D <QCOM_SCM_VMID_CP_ADSP_SHARED>;

[Severity: High]
Should adsp_mem in sdm630.dtsi be changed from reusable to no-map now
that QCOM_SCM_VMID_HLOS is removed here?

arch/arm64/boot/dts/qcom/sdm630.dtsi:
    ...
		adsp_mem: adsp-region {
			compatible =3D "shared-dma-pool";
			alloc-ranges =3D <0x0 0x80000000 0x0 0x80000000>;
			alignment =3D <0x0 0x400000>;
			size =3D <0x0 0x800000>;
			reusable;
		};
    ...

During fastrpc_rpmsg_probe(), fastrpc_init_reserved_mem() calls
qcom_scm_assign_mem() on the raw adsp_mem resource range without
allocating its pages from CMA, revoking HLOS stage-2 permissions across
the 8 MiB region.  Because adsp_mem is marked reusable, it remains in the
kernel linear map and CMA continues lending its pages to the buddy
allocator for movable allocations, causing a stage-2 access fault or
memory corruption between Linux and the ADSP remote heap when those pages
are accessed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-qcom-adsp-=
shared-vmid-fixes-v1-0-f1a808dc41a5@mainlining.org?part=3D2
