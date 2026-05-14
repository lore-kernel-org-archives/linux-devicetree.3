Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED729391829
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 18:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778784128; cv=none; b=hJ1IBfVwK1F5mn2IqApKolfH9itGQYCKA7GJuiLdxECp+DyLCCOyP+5ZB1cp1LyO20BUDHCZiSOLX+GcbFwb6ufAtVT2GVdeMobPyUFEDCa8KDgfx80DhJAdfgqYPTYLxoE1OU6iDRfO2n0pVXeFXvW0/xoEzp1lMcx3nbL4qBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778784128; c=relaxed/simple;
	bh=rXO2uEsqGYVRA3dYiJ913G2ldtwBl62MLFzXYhWwoSM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kHeTzRJ0WdqXgxrKXc9mVMM9cYJUlKQSXkx/OJigh0/RXC/EvYBjSEocg08fKRKxrFq+pg7yGRltYWuBDSC8oQs8Q1FNxNR07y8bU5NB2l3qpg1NrTUF/GZkCLMsFr3e3TuqsZ9797i4AFSnMOvfQoKz5MvclrbuEUk3O9WLQUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hd+j4vJ6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hd+j4vJ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE353C2BCB3;
	Thu, 14 May 2026 18:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778784127;
	bh=rXO2uEsqGYVRA3dYiJ913G2ldtwBl62MLFzXYhWwoSM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hd+j4vJ6NwEpKXQsKDhUru+uQ8UDdB0tLmhpuG7R4dC/pdwJOcABU0OeSQ7nSXSSJ
	 TTSEz33s535w/FBLEKr1az9hBD3I9/UC/YTfGbbl41mxnU7hBC9GKSv98Cn0kwAzAa
	 7NUcHMyJJOCCxSl9MfldU5wdYNFfAI2TSwb9z/tUxhY7QVF3OsyBkxlBdniEwQGzvy
	 AgpPUEE6u2nmxcqw+y2AkBzXNX6FymVy05+pd8aXecub+7BOW6aVydRkKLu5NHZcZY
	 ilLKr7X0Dkg5rLzD3DKnM1TWXVi0LK1W886lxnFZdqUjQCwaXLxEl0TW9yVjVuPPn7
	 XD/vQBSFSh+QQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: socfpga: Enable the SMMU for SoCFPGA
 device trees
Reply-To: sashiko-reviews@lists.linux.dev
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260514114111.10574-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260514114111.10574-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 18:42:06 +0000
Message-Id: <20260514184206.EE353C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The SMMU is enabled at the board level rather than the SoC level, d=
espite being an SoC-wide mandatory component.
--

commit b23c4db1700b818372c3d30cde1aa1e0dc267d27
Author: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

arm64: dts: socfpga: Enable the SMMU for SoCFPGA device trees

This commit enables the System Memory Management Unit (SMMU) on several
Agilex5 SoCFPGA board device trees to allow the Secure Device Manager to
correctly access peripherals.

>     Enable the SMMU on the SoCFPGA board device trees where it was
>     missing. The SoC uses a different memory-mapped base address for
>     its peripherals, which requires the System Memory Management Unit
>     (SMMU) to be active so that the Secure Device Manager (SDM) can
>     correctly access those regions through address translation.

Since the commit message indicates the SMMU is an inherent architectural
requirement of the Agilex5 SoC itself, should the SMMU be enabled by default
in the base socfpga_agilex5.dtsi file?

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/a=
rm64/boot/dts/intel/socfpga_agilex5_socdk.dts
> index 262bb3e8e5c72..bdb608bb30ea6 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
> @@ -107,6 +107,10 @@ &usb0 {
>  	disable-over-current;
>  };
> =20
> +&smmu {
> +	status =3D "okay";
> +};
> +

Scattering the status =3D "okay" override across multiple board dts files
might not be necessary if the SMMU only relies on SoC-internal resources and
does not require board-specific configuration. Would it be better to remove
status =3D "disabled" from the smmu node in the base dtsi instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514114111.1057=
4-1-muhammad.nazim.amirul.nazle.asmade@altera.com?part=3D1
