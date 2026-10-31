Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453738;
	b=l/NCYpOku1pUAELQPuN0BlQWjZUhLZLnFmDS9NGPdNitahQEC9u9SwhhoapW132Z3gxE
	 3eav6hfVUhDFPnHG5/kaqHdy58brvRswUGahhuGdZQdBvjzBI6yLs+/J/8a6NIzRfrUnO
	 rWGqI7FEQlMiQMgnmksoSOU3koBujsQ3QHXjrJiVUmtO0tN894Voj3qR7nWA7bgN56C5a
	 jERK5EoopltMp/fEO1zKtbUWFKP1dViWbLbUicvkCeVTj5Rte6WVzqR54PY6e/sJ0McVa
	 SKhvHgWvPOF4xjMs9h0HzHs3bA7/r3IBNTqZ8RuD6gzL8Rh92wEdvy2dLfkL2uP78Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453738;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=p4Rdi1nmjvfKTDJiGY08htK0T2pMqQesDYU6Gy2WGfA=;
	b=mQM0wzeIIzbCC8a83LUgM5c9eDjqucGgI3QNlLVOq8VJr+7rML8iLU4wD7G5Bj0VzmsH
	 PGFnyayW8ghPMf22rLzAV7EpbFzUuYkN5asRAcvlj1SgPqpAfh/m5baIS5W6CKTS4tjMz
	 coPjYAdFFYL2sHr6rSAcQ6ic5reqVEOnwEY3Gotl7Xiraf+x3BR0J6g6SIVBXla9AYaDy
	 u5Na3vU3c01bTwbwuiijmaE7I80KfnwJCmDbBMzUDSWbfv1gomE0GyJrcBtrpxfRtHZzp
	 SHVrZ8V3T3oGCu3VN7pmvx/Yv3vtj7OX57ZqFlwbhEI+gZlQdpjGakUFrrWtC2WmLjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VOMb/GAx";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F159D606A31D
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VOMb/GAx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3631F00A17;
	Sat, 31 Oct 2026 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793453737;
	bh=p4Rdi1nmjvfKTDJiGY08htK0T2pMqQesDYU6Gy2WGfA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VOMb/GAxU34vo/jv8KqvsedeuywU3zJK+h+2e6zcCXrlpndx8jfRWSyHAYe9b9W8g
	 dQdBGmfIn6kPt208QF7bxa719YJbhN6Fz4tCU5uJ/YOB6fMja4gYgknM7inhb6ssGh
	 1NE2SzeDIlF0qPPosOfQEXp4y9di9QOlV4acWDuKAnko6grJMzRCUMCecOzI5pYHEz
	 FirD8U/o+lrg/T2VGKUgbi1bME5B+EL7rCH1JKEOIC51PQ5Kif4gHGDJB4k857PvYP
	 HiiPb8j9tnECdbQ7Mog5hO73B0hKh2pRunujScKUO6jRHktRalAzkSb2vzR0XZWD4L
	 soEWUa/iGRRvg==
Message-ID: <sashiko-outbox-191978@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: kodiak: use thermal hw-bin
 trips
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261031-thermal_bin-v2-5-d76fd073ae98@oss.qualcomm.com>
References: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
 <20261031-thermal_bin-v2-5-d76fd073ae98@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 13:35:37 +0000
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
- [Low] arm64: dts: qcom: kodiak: duplicate @180 unit-address in qfprom
--

commit 04541134a8b551c93d77860ba606f4cd37e5c12a
Author: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

arm64: dts: qcom: kodiak: use thermal hw-bin trips

This commit adds jtag-id and feat-id qfprom nvmem cells to the tsens nodes
in kodiak.dtsi and updates passive thermal trip points to use per-bin
temperatures.

> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index 347815e5983e4..b984cf47b70eb 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -1019,6 +1019,18 @@ gpu_speed_bin: gpu-speed-bin@1e9 {
>  				reg =3D <0x1e9 0x2>;
>  				bits =3D <5 8>;
>  			};
> +
> +			jtag_id: jtag-id@180 {
> +				reg =3D <0x180 0x4>;
> +				/* bits =3D <offset width>: 20 bits at offset 0 */
> +				bits =3D <0 20>;
> +			};
> +
> +			feat_id: feat-id@180 {
> +				reg =3D <0x180 0x4>;
> +				/* bits =3D <offset width>: 8 bits at offset 20 */
> +				bits =3D <20 8>;
> +			};
>  		};

[Severity: Low]
Since both jtag-id@180 and feat-id@180 are enabled sibling subnodes under
qfprom (efuse@784000) with the same @180 unit-address, won't building DTBs
with W=3D1 or W=3D2 trigger a duplicate unit-address warning from
check_unique_unit_address_common() in scripts/dtc/checks.c?

In Qualcomm QFPROM nodes (such as gpu-speed-bin@1e9 just above, which
qfprom_fixup_dt_cell_info() in drivers/nvmem/qfprom.c aligns down to a
4-byte word boundary at runtime), sub-word nvmem cells are normally
addressed by their starting byte offset with a bit offset in 0..7.

Should jtag-id@180 use reg =3D <0x180 0x3> with bits =3D <0 20>, and feat-id
be defined as feat-id@182 with reg =3D <0x182 0x2> and bits =3D <4 8>, plac=
ed
before gpu-speed-bin@1e9 in ascending unit-address order?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031-thermal_bi=
n-v2-0-d76fd073ae98@oss.qualcomm.com?part=3D5
