Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030314B8286
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 18:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001417; cv=none; b=as7TAbAWD9hdzI8cr7oruJpy730TV4ew3XGTYJvP4EFhbRpzihL71z3XuEzqHuEBmYIFyVsL6FiQ77ZJA6RZSBLO2e3wnLKpl+uPgETL6kYZPXO8lYeeU2sNtf5oE7Uejt8Ln1eqr6EPhnyLyN4VLlPNFLo6E2w/ZqxV+OEvwIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001417; c=relaxed/simple;
	bh=L0MysqEw/025L1HKR9aD1OC3k7QZ52RiAF5RNFLwKyg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=B1A4tviadsahKPw8WX1oOpK/0XwemqfZuQAB0+LeViRMUNeRnduH8K+83ub4pCOaZFWChstSMt5H3WiGPrTTYXUtLZkLbMMmFL0cVnWzW2/M4HSR62exx2PRlQJxipqcA0/iRTnfb8VhOGKXf0u1T/VGmKZONENDUzOhk41yGUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IuR4pwrJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IuR4pwrJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4282D1F000C4;
	Wed, 14 Oct 2026 18:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792001415;
	bh=0NkNrf7tiAsjlg2/nhgY+1e8kER5taZWFp0aZvzttyA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IuR4pwrJ/5M4zZdqusQEbeTtuTH4+8KUB0oell6t57SCiN1kyh1reS/cJaBoxUUT2
	 yzWuVTcsC4EE2Q498oBW/ly+F6Ecz4HcicelzS4Ghm3onsL5uwDBZHsNYEgDkRmFss
	 KKUsJyL0K6qW90UiE8qpRf21H8pTpkwCy0Py43tJuqz/InSMZ7hhc3hxb+dprMEq6u
	 gQJiHRvzgKePOkY3FlGMAve9KO8Qr2l6N9XJh7Pj5hvFQPHMZkjvoMrmyaCPl2+Pme
	 LQKa0ZhKSeK1A8Fu6OrrTx8sJQwOu+RFxj047TZLEYSzZziYyl6Hky/o95Hk5z9n9x
	 sleuxLpVqBx3A==
Message-ID: <sashiko-outbox-171668@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: zynqmp: Add ALINX EdgeBoard FZ3A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pufan Jin" <cyan2254650260@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014175020.62907-4-cyan2254650260@gmail.com>
References: <20261014175020.62907-1-cyan2254650260@gmail.com>
 <20261014175020.62907-4-cyan2254650260@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 18:10:14 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: memory corruption due to memory@0 truncation without reserved=
-memory
--

commit 47a176ea68469cbcbe7f485f00a695a0a5b3915f
Author: Pufan Jin <cyan2254650260@gmail.com>

arm64: zynqmp: Add ALINX EdgeBoard FZ3A

Add device tree for the ALINX EdgeBoard FZ3A, a single board computer
based on the Xilinx Zynq UltraScale+ XCZU3EG SoC.

Link: https://ai.baidu.com/tech/hardware/deepkit
Link: https://ai.baidu.com/ai-doc/HWCE/8kq9b2121
Link: https://www.alinx.com/

> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts b=
/arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts
> new file mode 100644
> index 0000000000000..6cad90091a4c9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts

[ ... ]

> +	reserved_memory: reserved-memory {
> +		ranges;
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +
> +		linux_cma: cma {
> +			compatible =3D "shared-dma-pool";
> +			alloc-ranges =3D <0x0 0x0 0x0 0x7ff00000>;
> +			reusable;
> +			size =3D <0x0 0x20000000>;
> +		};
> +	};
> +
> +	memory@0 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x0 0x0 0x7ff00000>;
> +	};

[Severity: High]
Does this truncated memory range safely protect firmware memory from Linux?

ZynqMP U-Boot typically features automatic memory fixups
(fdt_fixup_memory_banks) which overwrite the reg property of memory@0 to
the full hardware-detected DDR size before booting Linux.

Since the device tree lacks a corresponding reserved-memory node with
no-map for this 1MB region, Linux might see the U-Boot expanded memory
range, map the entire memory, and allocate from the firmware's region,
potentially leading to memory corruption or boot crashes.

Should this firmware region be explicitly reserved using a reserved-memory
child node with no-map instead?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014175020.6290=
7-1-cyan2254650260@gmail.com?part=3D3
