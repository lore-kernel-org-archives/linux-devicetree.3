Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429032;
	b=dvjHrUzNSOKbVdK00/wefxxXL8If5NSm0HxUCKaaZPouW7QZTxwAXuUpBW/JA4VGRrN2
	 oWaW5sWhwv338/lWbMeUtl3WY+5J7G7kdLItypEtiaprsP9BAidV4GMm7Dik+ffXkHzsj
	 W1pWjQLm8wfQ3bBdh5NVZBmVx4MkcD1dWU9Ck7sm97Seodlc39W+fJqxXteLWMkRr+jGn
	 s6fj4Dyi5kU277tbEgqskNpzmBQNaGoYHxcWK4fjC56o4saSWLrKI/2Rl9hXz5XdNUa3y
	 4dZGWjLZopTR7EcqiVI3k5L2lWH3PPSTtzKuSDno+6dYV/8ZiULjW/gzGGjO1udcUHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429032;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xVmaKoBgmsysAc52r3v9WYPwVuVkXabrHL3/CW3TMHA=;
	b=clsanDgW0BWvdBev23HI40thPYamuo7oxVrkgqbbqGF4RpSo7cMkEo9O/oKoOHCSMgL0
	 6zw25ZGO5UzXTU/pBIk69qyeHdtUr0b5kXzeXJ8QjVIOgCU232WJUu2pveBDhBMLrcO3W
	 vfBv5Mnb+kVr09Bb4Rto6/GSTVwbOWHEQotLVb5v4KPmPQs+4u3ruZNAmNuCyWmNJg6T8
	 mrvbS8jlBw0mONWbSVqTxua0eJR/BCKkqEN7S2W//ozioMCnIEtorBgc82GVkcXtlgG5F
	 p7VEm3nZB8jjRV9oAgbX6GJ/ksOu1qz3znGkKt9xyTuU9AzLXgoHR42/yi2dBiMJSHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0boGHyM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95871606A319
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0boGHyM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848C81F000C4;
	Mon, 19 Oct 2026 16:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792429031;
	bh=xVmaKoBgmsysAc52r3v9WYPwVuVkXabrHL3/CW3TMHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e0boGHyMXjqsHxYnFbstRVyKDd/Ay8QlOY57uR4ayTSAGpEuUhqtQWnoeIBbZBQm3
	 4UdfFXzq+KDo+Scq6mawmrM9wBQJeLI8MVF9mQ+aPK9sVsJi/X8kXo73dYSbBm1rjb
	 99OAMXqZWFfY2WrUd+KK0y1KhG+eSuErMHLaT1tommTl/SaCQHkz47AxxMwJ9BId1d
	 4xuCTs+xpc1EOCzA2XpFxD16Jn+8qmvz63CJdt0x2spzrGfqpe6Lx/+fEBn7aI2jLI
	 uvJ9X6FZo9Qt3ovNj4ScB/hbomhiZf4uResd28Bn0OSW2VsGk0tzHZgjOK5Y6XAMMd
	 MC4fO2ThIzMbQ==
Message-ID: <sashiko-outbox-177965@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: ipq5332: add support to get
 watchdog bootstatus from IMEM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019-imem_restart_reason-v3-3-e6b1ff5de841@oss.qualcomm.com>
References: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
 <20261019-imem_restart_reason-v3-3-e6b1ff5de841@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 16:57:11 +0000
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
- [Medium] arm64: dts: qcom: ipq5332: sram@8600000 size 0x14000 mismatches =
IMEM bounds
--

commit 353fa282f26f76cd09b02c6b70d1605ceadf060b
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

arm64: dts: qcom: ipq5332: add support to get watchdog bootstatus from IMEM

This commit adds the sram@8600000 IMEM node and links the restart_reason
subnode to the watchdog node via the sram property on IPQ5332 so the
watchdog driver can read the system restart reason populated by XBL.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5332.dtsi
> index 74d9de8d7641d..c1b0836246964 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -493,6 +493,21 @@ qpic_nand: spi@79b0000 {
>  			status =3D "disabled";
>  		};
> =20
> +		sram@8600000 {
> +			compatible =3D "qcom,ipq5332-imem", "mmio-sram";
> +			reg =3D <0x08600000 0x14000>;
> +			ranges =3D <0 0x08600000 0x14000>;

[Severity: Medium]
Should the reg and ranges size in sram@8600000 be 0x1000 (or 0x8000 with
the inaccessible portion reserved) rather than 0x14000?

The commit message notes:

    The overall IMEM region is 32KB but only initial 4KB is accessible by
    all masters in the SoC.

However, sram@8600000 in arch/arm64/boot/dts/qcom/ipq5332.dtsi specifies
0x14000 (80KB), which matches neither the 32KB (0x8000) total IMEM size
nor the 4KB (0x1000) accessible window.

When the mmio-sram driver probes sram@8600000 via
sram_probe()->sram_reserve_regions() in drivers/misc/sram.c, it maps the
entire reg range and adds all unreserved chunks ([0x0, 0x7a4) and
[0x7a8, 0x14000)) into the general-purpose SRAM allocation pool:

drivers/misc/sram.c:sram_reserve_regions() {
    ...
		if (sram->pool) {
			dev_dbg(sram->dev, "adding chunk 0x%lx-0x%lx\n",
				cur_start, cur_start + cur_size);

			ret =3D gen_pool_add_virt(sram->pool,
					(unsigned long)sram->virt_base + cur_start,
					res->start + cur_start, cur_size, -1);
    ...
}

If the hardware IMEM is only 32KB or access-protected beyond the initial
4KB window, won't exposing offsets [0x1000, 0x14000) as allocatable SRAM
risk bus aborts or access violations if any consumer allocates from the
pool?

> +
> +			no-memory-wc;
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			restart_reason: restartreason-sram@7a4 {
> +				reg =3D <0x7a4 0x4>;
> +			};
> +		};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-imem_resta=
rt_reason-v3-0-e6b1ff5de841@oss.qualcomm.com?part=3D3
