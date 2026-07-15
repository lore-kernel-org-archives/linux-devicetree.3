Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72752BE026
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 15:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128703; cv=none; b=fTJGRyKkwX3IUzDyP73Z0TV/KxSmCeTlcT3Ocu/uARntjKDetEzUTMwh3hACanVpHp7CeKbB1tWx5/6BRP/baBKjYGkFqzC9VYofGjS5wcuyAFV0rfgxqjg11vxBYECdY6wtKiDQpkOfJJmZJ3V/hpbZHpL7lbZJRDtdnm07Sas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128703; c=relaxed/simple;
	bh=Bm6+dns42jec9BXAxLXUXJelpud5pzUbNid9RVUc080=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LHf6LlvhrhcZO6uX9tmsVHVliXiCJft0SX4w0OHDok81B4gWspQuG9eduCEH7gugaSB2ThJl2d1XPG7cJ5/skJFIY4Sm8V1nPkArhcpkoFksO7kYLzUmcI5AFYQzVmTUdtXgwaAy8JGcBuARRV4snKMAzOlhijw+XLefnO3yVQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkrZ+ZIs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkrZ+ZIs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FEDC1F00A3A;
	Wed, 15 Jul 2026 15:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784128702;
	bh=t2a0KW1zv5txLabKLhnz/hbvwyG+8DM8egbE+Mmfs04=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HkrZ+ZIslf800AuJYL8yHsvZuZj+TQuTWRsinT8YX8F7Wk9yvaBILOfHGEbXfnW3X
	 XQXvAAhcq4JYnQ61QScqlLURh5PaemO0jB/69gfJhZsUD74qbencUGrcGb38RU2e9V
	 a+iEZcKvMIvPm2S3cT9DpPivlLWqMabL54YGkB3IIjbwaXUd7Zncf+NFV6bSzFeM4b
	 Y/QNh344LcYtHF3HP5+dIpFvEN0eIw1txN32T5PbI0hsd6bWl3faXuy16wH3afhDw4
	 bY47AQJY57sAGQsLI4HGRkvXCBD640WnLq6DMyeF/oXVbxEoCjm//LDvBATE6as/D8
	 KS2Znsgr60v1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 13/14] arm64: dts: qcom: glymur: Add iris video node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260715-glymur-v9-13-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-13-8cf2cbe12a07@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 15:18:21 +0000
Message-Id: <20260715151822.3FEDC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The use of the `iommu-addresses` property triggers a severe preexi=
sting parsing bug and memory leak in `of_iommu_get_resv_regions`.
--

--- Patch [13]: [PATCH v9 13/14] arm64: dts: qcom: glymur: Add iris video n=
ode ---
commit 973017069435379c05db5988e8245460d2e68365
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

arm64: dts: qcom: glymur: Add iris video node

This commit adds the iris video codec to the glymur SoC. It introduces a
new reservation node and configures clocks, interconnects, interrupts, and
power domains for the video-codec.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index 55d91c696a3a3..0c09e700f6b59 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -695,6 +695,10 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>  			alignment =3D <0x0 0x400000>;
>  			size =3D <0x0 0x800000>;
>  		};
> +
> +		iris_resv: reservation-iris {
> +			iommu-addresses =3D <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;

[Severity: High]
This isn't a bug introduced by this patch, but using the iommu-addresses
property triggers severe parsing flaws and a memory leak in
of_iommu_get_resv_regions().

First, does the parser leak a device node reference on every loop iteration?
It acquires the node reference but fails to release it:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
    np =3D of_find_node_by_phandle(phandle);
    ...
}

Without a corresponding of_node_put(np) inside or after the loop, this leaks
memory.

Second, if the iommu-addresses array contains entries for multiple devices,
the loop fails to advance the maps pointer past the address and size cells
when np !=3D dev->of_node. This causes subsequent iterations to erroneously
interpret IOVA address and size values as phandles.

Finally, could this code cause a kernel panic if translation fails?

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
    maps =3D of_translate_dma_region(np, maps, &iova, &length);
    ...
}

If of_translate_dma_region() returns NULL, it is assigned to maps without
checking. This will lead to an immediate NULL pointer dereference in
be32_to_cpup(maps++) on the next loop iteration.

While this specific dtsi patch only provides a single entry and avoids the
incorrect cell shift, should these underlying driver bugs be addressed
upstream before adopting this property here?

> +		};
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-glymur-v9-=
0-8cf2cbe12a07@oss.qualcomm.com?part=3D13
