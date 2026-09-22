Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426AE52FE4B
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119881; cv=none; b=GtWg5GCY1pgwcleU7jgljadoQJ6sql8d03LQaPkyRYklM5R9qj+f/CAum518GtoxcZ/VnNw9xRY7JPFekLG/nffFa6hxEwKhJbXfzA2tykUOPyJjJ12ZIZllk5uQ8IkT1roW36pK4Vx2W5h9aKdPj9racsmJDmSgqJ7L1cvFCZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119881; c=relaxed/simple;
	bh=eAdIR6o40X9vqxw09V81M6bS+0Y8NgPMVPC6AAL36mE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=puJEiroa+XLPRbj9xH10PhKeSmI/TWrm6ae5IyNOKN7vYzrzEvnBvhIoY8hLCIqLAZohBBsfHUpwmyaHkqtcItGuQUnHt3kgIxujHXvtbOtOh+VuxgCC1peYudH/H+G6Udu6FH44bPznBEbQDh9MD5KbbEWZwHNpcRSK3lCrDPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmJz40/l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmJz40/l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9674D1F00898;
	Tue, 22 Sep 2026 23:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790119879;
	bh=bwqqsWL4cFy0O3emwcDb7fn/vVMo8b0l0QTieAxbCmg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kmJz40/l+UcYoMYQRMAw3+fXa8lQhU+YbJQrjhJ/EcgDny5uCrTPBWbYuRuJ2uQbu
	 0NqhQ+94WVC20et5LyE+pVfENdWo8jyQU0DCzIqC3lPys07CQ+gOUh5mdJLDFI5vP+
	 kA8DuXD2ogfGgJx2UeF5w1PyZpKl/o5pxUFYIPbynWtNMT6+wqm7xrsds8sMnjBeuR
	 Ym9pgzZRKbDtxOW+RpsRLfSCj3A0d2A1GjK/6F/KfzavVBa1VIc5a9FTcFcc/NlKuv
	 yayqi4QBLaD6NCopd++tEKHGyveXDiGy0R9OOpH235C547hH08LsHm1pgwPzqoWuqx
	 sjGvNA6VoZa9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: Introduce Maili SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jingyi Wang" <jingyi.wang@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260922-maili-dts-v1-3-ac2b1b76bfd9@oss.qualcomm.com>
References: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
 <20260922-maili-dts-v1-3-ac2b1b76bfd9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 23:31:19 +0000
Message-Id: <20260922233119.9674D1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dts: reserved-memory overlap between mpss_mem and other regions
- [Medium] dts: invalid topology, all CPUs share a single l2_0 cache node
--

commit 81315838a00d887952d320c67bfae01521f7328e
Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

arm64: dts: qcom: Introduce Maili SoC

This commit introduces the device tree file for the Qualcomm Snapdragon
Maili SoC. It defines CPUs, PSCI idle states, interrupt controllers, timers,
reserved memory regions, interconnects, and other hardware peripherals.

> diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qc=
om/maili.dtsi
> new file mode 100644
> index 0000000000000..886d307e536be
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/maili.dtsi
> @@ -0,0 +1,6956 @@
[ ... ]
> +	cpus {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <0>;
> +
> +		cpu6: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "qcom,oryon-3-0";
> +			reg =3D <0x0 0x0>;
> +			enable-method =3D "psci";
> +			next-level-cache =3D <&l2_0>;

[Severity: Medium]
Does this topology accurately reflect the hardware? The l2_0 cache is
defined later under cpu0 but referenced here and by all other cores, implyi=
ng
all CPUs across all clusters share a single private L2 cache. Each core or
cluster must have its own topologically correct L2 cache node for the
scheduler to make correct migration decisions.

[ ... ]
> +		pdp_ns_shared_mem: pdp-ns-shared@81f00000 {
> +			reg =3D <0x0 0x81f00000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		smem_mem: smem@82700000 {
> +			compatible =3D "qcom,smem";
> +			reg =3D <0x0 0x82700000 0x0 0x400000>;
> +			hwlocks =3D <&tcsr_mutex 3>;
> +			no-map;
> +		};
> +
> +		dsm_partition_1_mem: dsm-partition-1@83500000 {
> +			reg =3D <0x0 0x83500000 0x0 0x5180000>;
> +			no-map;
> +		};
> +
> +		dsm_partition_2_mem: dsm-partition-2@88680000 {
> +			reg =3D <0x0 0x88680000 0x0 0x1700000>;
> +			no-map;
> +		};
> +
> +		mpss_mem: mpss@89e00000 {
> +			reg =3D <0x0 0x89e00000 0x0 0x10400000>;
> +			no-map;
> +		};

[Severity: High]
Does the size of mpss_mem intentionally overlap with the following memory
blocks? The mpss_mem region is defined from 0x89e00000 with a size of
0x10400000, spanning up to 0x9a200000.=20

This engulfs the subsequent q6-mpss-dtb, ipa-fw, ipa-gsi, gpu-microcode,
camera regions, and partially overlaps camera-2. Memblock reservations must
be disjoint to prevent early boot reservation failures.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-maili-dts-=
v1-0-ac2b1b76bfd9@oss.qualcomm.com?part=3D3
