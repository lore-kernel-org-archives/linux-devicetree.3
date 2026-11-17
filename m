Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921568;
	b=GIbGaLvc4ffDr71y8j0IDpsfLfNbdFp/0X6reWlZhrB5j2PBLvCV7HI3v3JNACPck+AF
	 uV82UqEoxMKSPYP4McNQji+il9fLWjoQZvu8RTgos5P9OFwQqQmuvNc15Z1gEY7lqBAHM
	 1co1L3xr1xA/7k/KGQlsM9E2YHbQS2s8Si8q+lHpz7dU95aZ6psSMxUpCe3go+cQvwlLJ
	 Uu5mUp/tsIoQ3OofVn4Sffcd0mcVA0mhxydla3me+QihmoeUIUHeWh85awDkm2g61sWWC
	 t75eG5kn1GHBNE7HQCxHsm9351+X26k7yvudYlMo1YrW8Nz3B5IhdAOoNV3YG3xM1NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921568;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dRGo5xumnUP8vIU3Tw1GjODyGdlorvN8l5AvimJt9qQ=;
	b=w9pFQ/izByRL0yzFBVCS/fbdKUjQaMOFWF0I0SJkedOPQ5wvbp6cYc+JvudiaaeHDyye
	 CY5tlIa/z0LubklgLGp7bD5D5YhX2Gsnax6et9K0keonDnCsjtWCQMYCbX9OjyBOuNjYj
	 513sMljBX8v/rA0at9ikOad5p9t1UJnhUOAAoOSMVmkJDG9NzZ7pbWuOcb4mFGvGa9Vd3
	 qsKU1uumu0y89BlSv+SrEc1oQx6HeCnCPKbWn2Vkh7z+yScMudNE6Z0dL4JxlHUdK5oUm
	 4tTt89hisYRVHah3cQCu7JNyEpesr2KwiU8FnIOhZGw1QfElYQmo8LZgw2RBWHEoY5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AUgsktPn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70ED606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AUgsktPn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C31E1F000C4;
	Tue, 17 Nov 2026 13:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921568;
	bh=dRGo5xumnUP8vIU3Tw1GjODyGdlorvN8l5AvimJt9qQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AUgsktPnxUcW+Pq5i+cXNfKhktCveq5KNyn8KilqCRTdUACUSakFLL1elcjGa+s6G
	 n3z3lGYiHTBCw8GV9ih6yASUMUiuLtVmLI2oWjty+yCUkFUbPToHP//IxvTRhvbuBX
	 v3CVftG5LEcVjKyiB+LFy17KVSNO1xjb11ynpJXqRcFE17wvsoZPwNoklAoBcYTplH
	 gWtVrqka/lfza5ENDTYuKPgG42je/YErm0vvZgBhgsCc2dZc7All6/rJ7CarUQqySK
	 wy3ikTiY7TpX6TI5gRjwGGrIpltAjhqc0SlsGDPjgWAMjmcRPV/pV/m2tJUnS9fNkd
	 RVzvOP+zi9mRQ==
Message-ID: <sashiko-outbox-218859@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved
 aliases
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:19:27 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] arm64: dts: mediatek: removing gce aliases causes unclocked
  MMIO in cmdq_init()
- [High] arm64: dts: mediatek: removing ovl_adaptor aliases breaks
  ovl_adaptor_comp_init()
- [High] arm64: dts: mediatek: removing ddp and mutex aliases breaks
  mtk_drm_probe()
- [Low] arm64: dts: mediatek: mt8173: incomplete removal of undocumented
  mdp-* aliases
--

commit 0c6075438efac906bb8687313653fb8c36767eef
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

arm64: dts: mediatek: Remove undocumented, unapproved aliases

This commit removes undocumented display and mailbox device tree aliases fr=
om
several MediaTek SoC and board dtsi files.

[ ... ]

> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8173.dtsi
> index 6ec50125cea02..868b0fb844499 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -22,22 +22,6 @@ / {
>  	#size-cells =3D <2>;
> =20
>  	aliases {
> -		ovl0 =3D &ovl0;
> -		ovl1 =3D &ovl1;
> -		rdma0 =3D &rdma0;
> -		rdma1 =3D &rdma1;
> -		rdma2 =3D &rdma2;
> -		wdma0 =3D &wdma0;
> -		wdma1 =3D &wdma1;
> -		color0 =3D &color0;
> -		color1 =3D &color1;
> -		split0 =3D &split0;
> -		split1 =3D &split1;
> -		dpi0 =3D &dpi0;
> -		dsi0 =3D &dsi0;
> -		dsi1 =3D &dsi1;
> -		mdp-rdma0 =3D &mdp_rdma0;
> -		mdp-rdma1 =3D &mdp_rdma1;
>  		mdp-rsz0 =3D &mdp_rsz0;
>  		mdp-rsz1 =3D &mdp_rsz1;
>  		mdp-rsz2 =3D &mdp_rsz2;

[Severity: Low]
This isn't a bug, but should mdp-rsz0..2, mdp-wdma0, and mdp-wrot0..1 also =
be
dropped here?  Like mdp-rdma0 and mdp-rdma1, they are undocumented custom
aliases that are unused by drivers/media/platform/mediatek/mdp/.

[ ... ]

> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8188.dtsi
> index 14a320f0c70cb..f14b23dd57aa7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -23,39 +23,6 @@ / {
>  	#address-cells =3D <2>;
>  	#size-cells =3D <2>;
> =20
> -	aliases {
> -		dp-intf0 =3D &dp_intf0;
> -		dp-intf1 =3D &dp_intf1;
> -		dpi1 =3D &dpi1;
> -		dsc0 =3D &dsc0;
> -		ethdr0 =3D &ethdr0;
> -		gce0 =3D &gce0;
> -		gce1 =3D &gce1;

[Severity: High]
Does removing gce0 and gce1 on MT8188 and MT8195 cause cmdq_init() to perfo=
rm
MMIO writes with the GCE clocks disabled?

On both SoCs, cmdq->pdata->gce_num is 2, so cmdq_get_clocks() looks up the
clocks via the "gce" alias and silently skips nodes with a negative alias_i=
d:

drivers/mailbox/mtk-cmdq-mailbox.c:cmdq_get_clocks() {
	...
	for_each_child_of_node_scoped(parent, node) {
		int alias_id =3D of_alias_get_id(node, gce_name);

		if (alias_id < 0 || alias_id >=3D cmdq->pdata->gce_num)
			continue;

		clks =3D &cmdq->clocks[alias_id];
	...
	return 0;
}

Without gce0 and gce1, cmdq_get_clocks() returns 0 with cmdq->clocks[].clk
left NULL.  clk_bulk_prepare() and clk_bulk_enable() then succeed as no-ops
before cmdq_init() and cmdq_runtime_resume() write to GCE registers, hanging
the bus or triggering an SError on boot.

> -		merge0 =3D &merge0;
> -		merge1 =3D &merge1;
> -		merge2 =3D &merge2;
> -		merge3 =3D &merge3;
> -		merge4 =3D &merge4;
> -		merge5 =3D &merge5;
> -		mutex0 =3D &mutex0;
> -		mutex1 =3D &mutex1;

[Severity: High]
Does removing the mutex and DDP component aliases break multi-instance
component matching and leak device_node references in mtk_drm_probe()?

In mtk_drm_probe(), MTK_DISP_MUTEX nodes are matched with:

drivers/gpu/drm/mediatek/mtk_drm_drv.c:mtk_drm_probe() {
	...
		if (comp_type =3D=3D MTK_DISP_MUTEX) {
			int id;

			id =3D of_alias_get_id(node, "mutex");
			if (id < 0 || id =3D=3D private->data->mmsys_id) {
				private->mutex_node =3D of_node_get(node);
	...
}

When mutex0 and mutex1 are removed on MT8188 and MT8195, id is -ENODEV for
both sibling mutex nodes, so VDOSYS0 (mmsys_id 0) matches mutex0 and then
overwrites private->mutex_node with mutex1, binding VDOSYS0 to VDOSYS1's
hardware disp-mutex and leaking mutex0's OF node reference.

Similarly, mtk_ddp_comp_get_id() accepts id < 0 as matching the first entry
of that component type in mtk_ddp_matches[]:

drivers/gpu/drm/mediatek/mtk_ddp_comp.c:mtk_ddp_comp_get_id() {
	int id =3D of_alias_get_id(node, mtk_ddp_comp_stem[comp_type]);
	int i;

	for (i =3D 0; i < ARRAY_SIZE(mtk_ddp_matches); i++) {
		if (comp_type =3D=3D mtk_ddp_matches[i].type &&
		    (id < 0 || id =3D=3D mtk_ddp_matches[i].alias_id))
			return i;
	}
	...
}

Without the DDP aliases (ovl*, ovl-2l*, rdma*, color*, dpi*, dsi*, dp-intf*,
merge*, etc.), secondary component instances collapse onto instance 0's
comp_id, overwriting private->comp_node[comp_id] (leaking the prior
device_node reference) and private->ddp_comp[comp_id] while leaving their o=
wn
component slots unpopulated.

> -		padding0 =3D &padding0;
> -		padding1 =3D &padding1;
> -		padding2 =3D &padding2;
> -		padding3 =3D &padding3;
> -		padding4 =3D &padding4;
> -		padding5 =3D &padding5;
> -		padding6 =3D &padding6;
> -		padding7 =3D &padding7;
> -		vdo1-rdma0 =3D &vdo1_rdma0;
> -		vdo1-rdma1 =3D &vdo1_rdma1;
> -		vdo1-rdma2 =3D &vdo1_rdma2;
> -		vdo1-rdma3 =3D &vdo1_rdma3;
> -		vdo1-rdma4 =3D &vdo1_rdma4;
> -		vdo1-rdma5 =3D &vdo1_rdma5;
> -		vdo1-rdma6 =3D &vdo1_rdma6;
> -		vdo1-rdma7 =3D &vdo1_rdma7;
> -	};

[Severity: High]
Does removing the ethdr, merge, padding, and vdo1-rdma aliases break probing
of mediatek-disp-ovl-adaptor on MT8188 and MT8195?

ovl_adaptor_comp_get_id() requires a non-negative alias ID matching
comp_matches[]:

drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:ovl_adaptor_comp_get_id() {
	int alias_id =3D of_alias_get_id(node, private_comp_stem[type]);
	int i;

	for (i =3D 0; i < ARRAY_SIZE(comp_matches); i++)
		if (comp_matches[i].type =3D=3D type &&
		    comp_matches[i].alias_id =3D=3D alias_id)
			return i;

	dev_warn(dev, "Failed to get id. type: %d, alias: %d\n", type, alias_id);
	return -EINVAL;
}

When those aliases are removed, of_alias_get_id() returns -ENODEV for every
sub-component, causing ovl_adaptor_comp_init() to skip all children and fail
probe with -ENODEV.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117130556.2347=
85-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
