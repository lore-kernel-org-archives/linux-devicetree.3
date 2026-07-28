Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5AC37AA9A
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 16:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785255697; cv=none; b=UCmxKNMqH5ZwoDtN9cLkkabZCRFLm+sB8VCvycCvu89EtjnL+EPu0UtO0xm3iNd4Bv07JdQwnsfo+8NNpuoBbP1+jjeIokN50wGyyrpai9XacNTuWAWEdJ3At61wiakL9xtkcVJF5ku2IhecAJefQf4hJ4uJyyRCIPS3ayM5jPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785255697; c=relaxed/simple;
	bh=YW2yzQB5QhrUglQBQ4IjJw5d29SB0JPu6VmMiPT/QYE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p0C9xqo3kA8L9j6mEKjgYx5RzpiVny74LeDgLiZYAaJkH34R1rINWb4+LOi6nJO+ZKyTbC+vGoYb1UWZ1SRsMSrHMuaD1FzMcm6JxREmU332DtIiYspQrvRiGLlzfyrJH0GEnXqeeMxTULMqQ7M8dsKpcQe1U+xyNe0r88ZM380=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aW8J9dY2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aW8J9dY2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E541F00A3D;
	Tue, 28 Jul 2026 16:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785255695;
	bh=JjsLQleRsZIah8KJB30KbQyxCNbsNPfu9t4XI+vZXKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aW8J9dY23HPTty5OpNSkr2uB4aKGordA6OdKBJ3N89ONc11eRCNlnqSEXBBdFwVBl
	 fVaYGcHq1B51DhFzXd5foRf7zL4H726fGivP4TUq7IZam37N6aoQ/brKrk1u8nIMjv
	 nDGXgXUyh3NQMG4Oqz+JIZ5y6hQWa/KdpXyqZXwCYT+rUBvSIrPBsQ78+Gboy9jTIZ
	 BFVlmBVaoot+JXz/l/uH4Ox3H+nWd1mWGgAQCaFkzzOHEvR8yYZC7ctUUj/dSBzhtD
	 //lxSmM+UJvVCJzMIyDylE7JVDp5S6gz5Homd6hX5d7JickiAnj9F5LuAiAWJuEZM7
	 EtDTJ3H5vRn/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: tegra: Add EL2 virtual timer interrupt for
 Tegra194
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jon Hunter" <jonathanh@nvidia.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260728155059.200363-1-jonathanh@nvidia.com>
References: <20260728155059.200363-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 16:21:35 +0000
Message-Id: <20260728162135.81E541F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added EL2 virtual timer interrupt specifies GIC_PPI 15, =
but the ARM architectural standard for the EL2 virtual timer is GIC_PPI 12.=
 If the Carmel CPU hardware actually triggers PPI 12, the interrupt will be=
 misrouted, leading to timer stalls when running in VHE mode.
--

--- Patch [1]: [PATCH] arm64: tegra: Add EL2 virtual timer interrupt for Te=
gra194 ---
commit c19a2a2ae7a6be54be1db9d69e5e65ad5a1e8682
Author: Jon Hunter <jonathanh@nvidia.com>
arm64: tegra: Add EL2 virtual timer interrupt for Tegra194

This commit adds the EL2 virtual timer interrupt to the Tegra194 device tree
to resolve a warning generated when running on VHE-capable CPUs. It updates
the timer node by appending a new GIC_PPI definition for the virtual timer.

> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra194.dtsi
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -3176,6 +3176,8 @@ timer {
>  			     <GIC_PPI 11
>  				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 10
> +				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 15

[Severity: High]
Is this the correct interrupt number for the EL2 virtual timer on this
platform? The standard ARM architecture definition for the EL2 virtual timer
is GIC_PPI 12, whereas this specifies GIC_PPI 15.

If the Carmel CPU hardware actually triggers PPI 12, could specifying 15 ca=
use
the interrupt to be misrouted and lead to timer stalls when running in VHE
mode?

>  				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>  		interrupt-parent =3D <&gic>;
>  		always-on;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728155059.2003=
63-1-jonathanh@nvidia.com?part=3D1
