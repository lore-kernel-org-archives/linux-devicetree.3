Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB211190462
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049246; cv=none; b=o+RndhhPl7Zg+QmaHlYbcycS7oAuBtyrQD6YWZRI2KoCT5HbY7fYJh7s4UxsZ+KCffBgb5ZD0B/HmJp4q1Q3sCFJykagmIhi3MI6HgAiu+Ww6tzmE/IRTCCVVbSV8VPtFYrlXqaEbIzqdvKGXuK7Htca5dVahq0NGNMgMbjHzjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049246; c=relaxed/simple;
	bh=CTKjejRPBr2RBKMqgkXGirjhVaiT+JvnlC7nkWL1Gzg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=t3dPp5lYYStemmnMhlSgme+m4qb50l1wnmqgbiNJeFEPZ/mR7eUWjvufgr1YpQbTRL2eBcKpS/AsyMNIbgguT0KmWg6ceqJTuwRI06Jyny3ZOtO+gBhF87/EQn57NebIXtjFMAh7DzEyEi6bi+BTjFPvXCtZWbWNamAlZ1nXpyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nampIFYR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nampIFYR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD081F000C5;
	Thu, 15 Oct 2026 07:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792049229;
	bh=qCPaOjuUfohi+d790ZuxGmpQfZegE7AFWyikrmjvDPY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nampIFYR9yQzpPesBS7HgLNhpi2eSG0OLBgyqkgZo+uPTgkLRtBtOykbIrXsAZsvS
	 xpmDM/k6GbfSvfsJgCD6nsEU/ZSsCBjGKBMyaeRHlvyizvTGpZS8F7k2L45jV03XTu
	 fy6W4YO0rLZZM8U3FN1/CjMY3Vjo18g5ZRaaG58J+80RrWqwMlbxrcoY7T+9jU99wg
	 kQ0xXCt3vohCoCxgsB5xhRRg6ByyWlwqWORaxq8wikABFqagTlj9P9Ym3wJoO8FCaZ
	 tmuAWphmkrffW9qdontuWdC5bUkYaP08GHbXB6NbqT96/LskN8u6YWHecSdVQalpj9
	 IxZtmehHAK8TQ==
Message-ID: <sashiko-outbox-172419@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: glymur: Make the ADSP remote
 heap no-map
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jianping Li" <jianping.li@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015071511.977-3-jianping.li@oss.qualcomm.com>
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-3-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 07:27:08 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64/dma: Incomplete protection against speculative aborts for sh=
ared-dma-pool with no-map
--

commit 406984dd5e0c9e02f86eace82d9c1edf7af73157
Author: Jianping Li <jianping.li@oss.qualcomm.com>

arm64: dts: qcom: glymur: Make the ADSP remote heap no-map

This patch replaces the reusable property with no-map for the ADSP remote
heap to exclude it from the standard kernel memory mapping. This is intended
to prevent synchronous external aborts caused by kernel accesses after the
memory is handed over to the DSP.

Link: https://lore.kernel.org/all/20260701-glymur-audio-v1-1-2c3862d95a09@o=
ss.qualcomm.com/

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index f04058d2e0891..ddbacc21f780e 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -691,7 +691,7 @@ smem_mem: smem@ffe00000 {
>  		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>  			compatible =3D "shared-dma-pool";
>  			alloc-ranges =3D <0x0 0x80000000 0x0 0x80000000>;
> -			reusable;
> +			no-map;

[Severity: High]
Does this fully protect against speculative aborts when combined with
the compatible =3D "shared-dma-pool" property?

Because the reusable property is removed but shared-dma-pool remains, the
reserved memory framework handles this node via rmem_dma_setup() in
kernel/dma/coherent.c.=20

When the FastRPC driver probes and binds to this region via
of_reserved_mem_device_init(), it maps the entire 8MB physical region into
the kernel's vmalloc space:

kernel/dma/coherent.c:dma_init_coherent_memory() {
    ...
    mem_base =3D memremap(phys_addr, size, MEMREMAP_WC);
    ...
}

On the ARM architecture, MEMREMAP_WC creates a Normal Non-Cacheable mapping.
The architecture permits the CPU to perform speculative data reads on any
Normal memory, including Normal Non-Cacheable.

When the FastRPC driver allocates memory from this pool and assigns it to t=
he
DSP via qcom_scm_assign_mem() (which revokes host access), this persistent
Normal memory mapping in vmalloc space remains intact.

Could speculative CPU reads through this vmalloc mapping still trigger the
exact same synchronous external aborts this patch aims to prevent?

>  			alignment =3D <0x0 0x400000>;
>  			size =3D <0x0 0x800000>;
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015071511.977-=
1-jianping.li@oss.qualcomm.com?part=3D2
