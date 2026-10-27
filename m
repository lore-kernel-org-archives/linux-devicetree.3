Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793130520;
	b=ayB4EoKxE1Bal3J1TgwpgosSZ9SDseBt1KSdepJ9Z9u4MZTDuRkXjdfrFeriTaODFRdP
	 p4zVv4Pw+JrG8pAIeGEssXl/xxsQ5bEL/Vexz3Lz+GiCvPOIo3pvN3h22aTYzSWkDkhpx
	 M0iRwRLm3dql9+6wxbMiwFgqZ5cfGQ84/bbZBcDbVImEZzYW8z3nImbgxyXB/Vnb8I4nI
	 EuASnbscpCuyny3cLcfrZYgt8yh2EV03cR/zzpEDvcuWyyspmUNyLDgWgZJ6Wkyk0LZ0z
	 VoyjDOIQYAjLovCujMGitTFFdf5Bz25Feta4Mp64W3j9le31E7EK5uZzuQUIHZoF4Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793130520;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vG/ec5rxWnfIMu7ufU2kJdMfva665S9kCUzIRZhGpC4=;
	b=xpiejg2uWSjv1FFSSQjawS3yiigA7VhLEEAQ5zGyD9E9Gr2asBM/HNi7+Xk/GG+r14dz
	 hqBDdxjEX8Wu0Swv0TGjVtKvrzldBezzoX6qL7bw/fDEw17JSNnvTMlKoCfD6rfF9RnyK
	 NTuaX+8kTdlFU6faCFpW6xjkru2FAxSsxXhT4HJIZUXqW3heP+yEyw/hCBcUEtRFfe9tL
	 uzhjH8m5mOnyV3vnfZLqfDFPz0fpXzalY5Mz+lL2uhsw1Y+0P/gBfUW/FIDt9+AY1oK0P
	 MFljD9QxSSgw+rui7lQkdKXTB5QSdmxfxsiTaUIiL7IeQ/9ZnBgbPmLi+kKTBYMuPYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kEmY8Cj5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FF8606A31F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 19:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kEmY8Cj5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B301F01825;
	Tue, 27 Oct 2026 19:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793130520;
	bh=vG/ec5rxWnfIMu7ufU2kJdMfva665S9kCUzIRZhGpC4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kEmY8Cj52DmXOVZLtupR+k2rQ0NqwgMJk1OZUjL7anUautC711g2uX7FNJ4WxR9aI
	 5OqLwV+90wRGOYxCeEGfIBxr9PnS5dP5pU7VeMDJk+62ykQNeJchIJYYic9/eFZZdw
	 oUy1W+e8wp65LUDnht+K7P7ee/bBPSnvBaKnOLqufCIFgRO7bMsU6b7t9jodK1yI3v
	 f4CBJBjUjJEGIaV1bd+d1hPI7grplG2LMYIEz8WGyTxDWYgrwu0RyI5Jxxs6vxcS4x
	 Q2/ATWEWOXBKhPLsqHOp4X4K1Br1N4k5OkQCh443mQNW6+hf0MMEXwqivfT9B53p6V
	 2ri/7UOow5U/g==
Message-ID: <sashiko-outbox-187077@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: Add support for the
 phyCORE-AM62Px
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Ma" <jma@phytec.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027193901.3538135-2-jma@phytec.com>
References: <20261027193901.3538135-1-jma@phytec.com>
 <20261027193901.3538135-2-jma@phytec.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 19:48:39 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: dts: ti: missing wkup_r5fss0_core0_memory_region label break=
s DTB build
--

commit 0b85146939f017914b2af5c4afd5af0993cf3aad
Author: John Ma <jma@phytec.com>

arm64: dts: ti: Add support for the phyCORE-AM62Px

This commit adds device tree support for the PHYTEC phyCORE-AM62Px SoM and
the phyBOARD-Lynx carrier board.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi b/arch/arm6=
4/boot/dts/ti/k3-am62p-phycore-som.dtsi
> new file mode 100644
> index 0000000000000..1955ef49bc3af
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi
> @@ -0,0 +1,378 @@
[ ... ]
> +	reserved_memory: reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		/* global cma region */
> +		linux,cma {
> +			compatible =3D "shared-dma-pool";
> +			reusable;
> +			size =3D <0x00 0x24000000>;
> +			linux,cma-default;
> +		};
> +
> +		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x00 0x9c800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x00 0x9c900000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x00 0x9ca00000 0x00 0x8000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x00 0x9ca08000 0x00 0x1000>;
> +			bootph-pre-ram;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x00 0x9ca09000 0x00 0x97000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x00 0x9caa0000 0x00 0x1b68000>;
> +			no-map;
> +		};
[ ... ]
> +	i2c_som_rtc: rtc@52 {
> +		compatible =3D "microcrystal,rv3028";
> +		reg =3D <0x52>;
> +	};
> +};
> +
> +#include "k3-am62p-ti-ipc-firmware.dtsi"

[Severity: Low]
Does building k3-am62p5-phyboard-lynx.dtb when CONFIG_ARCH_K3 is enabled
fail in dtc due to an unresolved reference to
wkup_r5fss0_core0_memory_region?

k3-am62p-phycore-som.dtsi includes k3-am62p-ti-ipc-firmware.dtsi, which
configures wkup_r5fss0_core0 as follows:

&wkup_r5fss0_core0 {
	mboxes =3D <&mailbox0_cluster0 &mbox_r5_0>;
	memory-region =3D <&wkup_r5fss0_core0_dma_memory_region>,
			<&wkup_r5fss0_core0_memory_region>;
	memory-region-names =3D "dma", "firmware";
	status =3D "okay";
};

However, the reserved_memory node in k3-am62p-phycore-som.dtsi defines
wkup_r5fss0_core0_ipc_region, wkup_r5fss0_core0_lpm_fs_stub_region,
wkup_r5fss0_core0_lpm_metadata_region, wkup_r5fss0_core0_lpm_rest_region,
and wkup_r5fss0_core0_dm_region instead of wkup_r5fss0_core0_memory_region,
and &wkup_r5fss0_core0's memory-region property is not overridden.

Should reserved_memory define wkup_r5fss0_core0_memory_region to match
k3-am62p-ti-ipc-firmware.dtsi?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027193901.3538=
135-1-jma@phytec.com?part=3D2
