Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC0E389E05
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 06:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787205839; cv=none; b=bGHSP6BM3qVRuwAecPYUfr8O/LujoAZGAUYga4nIuLxOP3ymqPIZtVdIUyLB3XDHEID8VfE2BNGToLM/sFeZ3ldTGDcAbpRicf94hXNMpg1akENnv39701ocm8ljTA8nyVFnu93Uqw6pLChJqBxklgeTZ0NU86sdewj+6sQN8FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787205839; c=relaxed/simple;
	bh=3WP/efx2AfDc61Pf8vNJnnA5ANAxLNJu6KAmOV5U4K8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CPxctBlrB7fmmpsyIP+wpBJGCLUGAn2grqx5727GV4KjRv27sqTbMRLFzX5GUnYtla6yGUlZvP2x/M01mTYhfpFILm5CImdfq5aDoKWEQQJIu344LK6YruNAH/5fiz+qopW9v46AmILiK9LtuXhHKTX/db4I64IbGAJhr9Z7d+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WRc6LZsa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WRc6LZsa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE5E1F000E9;
	Thu, 20 Aug 2026 06:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787205837;
	bh=NhTezWlJqKUDGn+dJbdgrDybaUynidWJ7HMa5ZIkXKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WRc6LZsa3ps/GfGOqZ52v/hHynP/siIIpY2NFYQjvNyCnmzFL1KwuifsZ+u5Hpaqv
	 pixAFYaPPgO5Fd0IS7QNj2CKCdxlYzAB3UP7MEDe3o08Lowjdf/4a+m1/+rsfUD/9R
	 FpAwkDv3f5cd7ylSZ6bNZwFjRSU9KvInwNKhy/cJ7bftcbvbMq7Jz5hYOmOooT549f
	 hemMR/zp5K4USbSWfmQtdSl9MH1o8lZ8i5TgATaWq+tcqF65rkzRWPyFa3T5z0It+T
	 RET0WI9mGgJ4EuFpzpc25pbo3VjbIqtq7Oz+BSonevP/T0Lk5SP9hvQUFooXpPbR6a
	 MMGnBYc2NyUTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: agatti: Add memory-region for
 audio PD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinayak Katoch" <vinayak.katoch@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260820-agatti-audio-v3-1-47337097ee53@oss.qualcomm.com>
References: <20260820-agatti-audio-v3-1-47337097ee53@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 06:03:56 +0000
Message-Id: <20260820060357.6FE5E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `adsp-rpc-remote-heap` region is configured as a `reusable` CM=
A pool without retaining HLOS (Host OS) access, leaving it mapped in the ke=
rnel's linear mapping and causing fatal stage-2 permission faults (XPU viol=
ations) upon speculative CPU access after ownership is transferred to the D=
SP.
--

--- Patch [1]: [PATCH v3] arm64: dts: qcom: agatti: Add memory-region for a=
udio PD ---
commit 775c3c4fb571c7287ee665932e31677e111e34c6
Author: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

arm64: dts: qcom: agatti: Add memory-region for audio PD

This commit reserves a memory region for audio PD dynamic loading and remote
heap requirements. It also adds the required VMID list for memory ownership
transfers.

Link: https://lore.kernel.org/r/20260807-agatti-audio-v2-1-3959b1ab8059@oss=
.qualcomm.com

> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/q=
com/agatti.dtsi
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -381,6 +381,14 @@ rmtfs_mem: memory@89b01000 {
>  			qcom,client-id =3D <1>;
>  			qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMID_NAV>;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible =3D "shared-dma-pool";
> +			alloc-ranges =3D <0x0 0x0 0x1 0x0>;
> +			reusable;

[Severity: High]
Since this reserved-memory node is defined with reusable rather than no-map,
it forces the region to be managed by CMA and mapped in the kernel's linear
mapping.

Could this expose the region to speculative CPU accesses, which might lead =
to
fatal stage-2 permission faults (XPU violations) after ownership is transfe=
rred
to the DSP?

> +			alignment =3D <0x0 0x400000>;
> +			size =3D <0x0 0x800000>;
> +		};
>  	};

[ ... ]

> @@ -2347,6 +2355,9 @@ fastrpc {
>  					compatible =3D "qcom,fastrpc";
>  					qcom,glink-channels =3D "fastrpcglink-apps-dsp";
>  					label =3D "adsp";
> +					memory-region =3D <&adsp_rpc_remote_heap_mem>;
> +					qcom,vmids =3D <QCOM_SCM_VMID_LPASS
> +						      QCOM_SCM_VMID_ADSP_HEAP>;

[Severity: High]
The qcom,vmids array explicitly omits QCOM_SCM_VMID_HLOS here.

This directs the fastrpc driver to completely revoke CPU access during the =
SCM
assignment. If the memory remains in the linear mapping (due to the reusable
property above), doesn't this create a fatal mismatch with the active stage=
-1
linear mapping, resulting in kernel panics upon speculative CPU data or
instruction fetches?

> =20
>  					qcom,non-secure-domain;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-agatti-aud=
io-v3-1-47337097ee53@oss.qualcomm.com?part=3D1
