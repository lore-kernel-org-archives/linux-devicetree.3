Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6784968F0
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946718; cv=none; b=cmjsoGfVM+FJHFGfr+8DXUzQIlOZnnEWRN/94IUCQ7T8fHnSKlYU+vxfk0p6UG8u7SO2nbVwD9DUNTXVzIuiVh7UGg/byEsBDZ6DmOIl5kQPp/SUTzNxVjYt0TSztZ6OlW5yLqk1CNx9AvOFcRIvXXAWCfMy969Bu6RjzT9Cs/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946718; c=relaxed/simple;
	bh=ITBkdrlm1x9MdPIWZ80K3saUREXZTgQLN+i8We/nPXI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mbTYChRhjZZPeFYU2KRm3PlVDqQof/JOyFI0OdGeegjJWJ8wALQDfOWps+CQ4WelTDX08vKipq7j9QSp6Q9Gxq7eQBNF78R0/Xfi6GD94TNEHKmJLFoRKuUX5diPZQMJxr4Af5qVtYK+BD8v10eEaouBUmBLQHDLfC6i6Kljp7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgGLm7ad; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgGLm7ad"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316A11F00893;
	Fri,  2 Oct 2026 13:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790946710;
	bh=PRg1yjC1JPzi2gLhZiOyQddBjuiFRv8ikds9AOSYny8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JgGLm7ad/ZFZd+9wrKRUaadNjIojWPnPbokHHaHGv7QG2amJOnChLMMrZe+z/M1hA
	 fSi+YE34P7AAAoj5Ng41XQGed8OnvKV+98hWDbH4ALu0wvy+bmdKG69cJbz1L2AtVu
	 5NJZIbVY+6BFqaOb2++UwQM3TVADncDZfdakmlwnYFhfEW2C/hp0gaS2GtosWah7Eo
	 1vzqSSGIqjqpOvEjedr3j3pPCPpc+FawcZchloJpLucZUdXAKUy5MUAdMATQdq4cie
	 ij3UflU+/ccxMlQxFfTcmNWAyqTFnZogmLO1rwlyazn1rtEe7Nqs690TD7XhGVy8Mw
	 Ti7kqmyWDc0JQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: ipq9574: add the IMEM node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261002-imem_restart_reason-v2-2-61703c6362e3@oss.qualcomm.com>
References: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
 <20261002-imem_restart_reason-v2-2-61703c6362e3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 13:11:49 +0000
Message-Id: <20261002131150.316A11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: IMEM reg size exposes inaccessible memory to genalloc
--

commit d2b7d5d7c89f0f7e2ce2ebd4070ca10c86d37283
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

arm64: dts: qcom: ipq9574: add the IMEM node

This commit adds the IMEM node to the device tree to extract debugging
information. The commit message notes the region is 32KB overall, but
only the initial 4KB is accessible by all masters in the SoC.

> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/=
qcom/ipq9574.dtsi
> index 771a595856459..f7cc6f274ca91 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi

[ ... ]

> @@ -757,6 +757,13 @@ usb_0_qmpphy: phy@7d000 {
>  			status =3D "disabled";
>  		};
> =20
> +		sram@8600000 {
> +			compatible =3D "qcom,ipq9574-imem", "mmio-sram";
> +			reg =3D <0x08600000 0x8000>;

[Severity: Medium]
Does this reg property expose inaccessible memory to the generic SRAM pool?

The commit message states that only the initial 4KB of this 32KB region
is accessible. However, because the node uses the mmio-sram compatible
string, sram_probe() in drivers/misc/sram.c will automatically add all
unreserved regions within the full 32KB (0x8000) space to the kernel's
generic SRAM pool via gen_pool_add_virt().

If any driver allocates from this pool and attempts to access the upper
28KB, could it trigger a fatal Synchronous External Abort (SError) due to
the hardware protections on the inaccessible region?

Is there a way to describe only the accessible 4KB portion in the reg
property, or mark the inaccessible portion as reserved, so the allocator
state remains safe?

> +
> +			no-memory-wc;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-imem_resta=
rt_reason-v2-0-61703c6362e3@oss.qualcomm.com?part=3D2
