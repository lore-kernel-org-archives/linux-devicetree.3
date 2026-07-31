Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0C0348898
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785523092; cv=none; b=i0TFj3z/tSiS+6K7jOveDrasUVk7xdvTDrr0YbC81Pkfx4b/JVxScS6NafhBhiivB7AjwqbUWP5+7W1hRjQKHPBosKdZQuWUCMEsfc/ESTe6pf94/Gl3n81MN+PWQ/BtaYq80pfYWnCA70zvuXrFfnDI68ZJ2z6Zp78qYm7aWKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785523092; c=relaxed/simple;
	bh=KuFPQd5bHhpnCiQprOt/6dOVFalg69678704cHUK0yw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B6l959FmjTF+iVIeL9/MAr69gS0Ig+IyBUtCgSBcmsJqSpX2mHa7d9LHugJE57CJmCXQKbHOMgx1u+O7PyfGexcCqjKmfROkSDimiGTJkf7do4KhAlQMTjPjkSlJduLlAoCp4dqtrelMyylIRc2mWRHemSTg+OIS9zQlpyKAsmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=af4PJGUb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="af4PJGUb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD0F1F00AC4;
	Fri, 31 Jul 2026 18:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785523091;
	bh=tAvSiRGEta8Slm1aGtOws2rC5Ck9FYO9+iwSMO54AkU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=af4PJGUbDVgbAF7Bdh6aI6Wbvt9mCr2T855i2D67+Y8H5QsWNwiW+Z5ZcLElhx0Ry
	 R1gaf/J1qGTgfJpP3hvD0TG/Fg65bYf1SWoibv3TIpj6z4zJmakLAXMFZilvkmQECP
	 A9a4fC6gge6vweFTGJkgYWPYN8Rcup9p7xqzXk4qUmMd/0zNCYABGqXgoL91h+Hf2H
	 xws0jwo82Dsqz81P5R8OJJnQfzUOkaYf2/+Vs9bSKlyUPI69HnXYgsrlAW40pTeGrI
	 BE6rf7FKjZZ6+GqoKGDuMCjy0QVcnmyCSubo0Jwgb8+h1NpzbcFS9CyLTyMPY98uvR
	 OVZSqqKhn1rOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/12] arm64: dts: qcom: sm8550: Add Iris context
 bank subnodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-9-da52b5228dbd@oss.qualcomm.com>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-9-da52b5228dbd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 18:38:09 +0000
Message-Id: <20260731183809.ECD0F1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] In `of_iommu_get_resv_regions()`, the code fails to advance the `m=
aps` pointer past a node's specifier cells if the node does not match `dev-=
>of_node`, causing the parser to fall out of sync.
- [High] If `of_translate_dma_region()` fails to translate the address, it =
returns `NULL`, which is assigned to `maps` without a NULL check, leading t=
o a guaranteed kernel panic on the next loop iteration.
--

--- Patch [9]: [PATCH v2 09/12] arm64: dts: qcom: sm8550: Add Iris context =
bank subnodes ---
commit d594fb5947e7e4fe6f238d480eadd3c2b7770369
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: sm8550: Add Iris context bank subnodes

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
is restricted to use 0-600MB of IOVA space, while the pixel stream can
address the full range. This commit separates the streams into two
subnodes, pointing the non-pixel subnode to a reserved-memory node to
exclude the lower 600 MB from its IOVA allocator.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/q=
com/sm8550.dtsi
> index 7599b7b7e645f..4c8ad7f026fe5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -1087,6 +1087,10 @@ hyp_ext_reserved_mem: hyp-ext-reserved-region@ff70=
0000 {
>  			reg =3D <0 0xff700000 0 0x100000>;
>  			no-map;
>  		};
> +
> +		iris_resv: reservation-iris {
> +			iommu-addresses =3D <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;

[Severity: High]
This isn't a bug introduced by this patch, but adding this property exposes
a pre-existing issue in of_iommu_get_resv_regions().

If a memory-region specifies an iommu-addresses list with multiple devices,
the parsing breaks for all entries after the first one because the code fai=
ls
to advance the maps pointer past a node's specifier cells if the node does
not match dev->of_node:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
			if (np =3D=3D dev->of_node) {
				int prot =3D IOMMU_READ | IOMMU_WRITE;
    ...
			}
    ...
}

There is no else branch to compute the specifier size and advance the maps
pointer over it. The next iteration incorrectly reads the first cell of the
specifier as the next phandle, throwing the parser out of sync.

Will this be an issue if additional devices are added to this list in the
future?

[Severity: High]
This is a pre-existing issue, but adding this property could trigger a kern=
el
panic if the device tree is ever misconfigured.

If of_translate_dma_region() fails to translate the address (for example,
due to a missing dma-ranges property), it returns NULL. This NULL is direct=
ly
assigned to maps without a check:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
				maps =3D of_translate_dma_region(np, maps, &iova, &length);
    ...
}

Because length is uninitialized, the loop eventually proceeds to the next
iteration where the condition while (maps < end) evaluates to true since ma=
ps
is NULL. Dereferencing maps with be32_to_cpup(maps++) then causes a kernel
panic.

Should we add a NULL check in of_iommu_get_resv_regions() to prevent this?

> +		};
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-vpu_iommu_=
iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com?part=3D9
