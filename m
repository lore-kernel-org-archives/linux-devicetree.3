Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8E84A8436
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 12:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440136; cv=none; b=YLZRLsfW+4G8pWwWFACginf/247dUdlkDfI7O6/kaB5PIN3rlcZa3gIB86VxFjinbzVKxmDMEA7z96Es2IgWty2mZTeV7boQCrdW5T6qqW7jy6gdIg9BzGZxoQXh9AEke/W2zabKxHxDttlBneeV8SqKpWpYwCWO3htWvlq0vfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440136; c=relaxed/simple;
	bh=rvh1DJQL1viUIoC63mHXlvWuXPhDVOYm69TXv+fYh8c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b7Fj2+GKfKCJs7vOLuh1T8Uolk7Usau22mWiSg7M2Ci9RRtF9I1Bl/iO4MoZdhd+4RdSURfmqCDSZdTaeH5Q1EhibRkCbOsimR90M+6XsJXfUioZGMKGSj3+Me5S4mR6HjOl+g6BdVQr8dx58h0KN31m2Y9Sppi8Jo2uEfFejD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MC6EVm3G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MC6EVm3G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D651F000E9;
	Thu,  3 Sep 2026 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788440134;
	bh=jcXLlRwjXIqWsM6S9uOXtXLRYxnjR8Tk215PAT22660=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MC6EVm3Gy3i06LlkBwIxCkF69hOZKQ/0CbM/uzMvJhTNssAbRllr8vWl82d0l4Hy/
	 u8Tstw4QUa3j+RBsoM+CpIZUL3C4Ry6H061iuczf1ZHI4vG6Ct+GshBQ46j5pGUHg0
	 4aLjVzJBGacPPGNrzhHAGUNT0EcCwNbDtaXXP0M76XlV7X/BfgtPLv+zD7eCcITgK+
	 It6FAfNwK7sxIAAEVwUbYZ6rn1l19NWj3RAx+xvECZahZ74ZkXGZxF5qSxg2Gt+zTF
	 qfBFcPwmb0y7XRqOk2Fr6aFjWOsW7sREh+0et+7268lE08t4xfG7G1EkO/Z/hOl3kg
	 GxII+NnINgwLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 7/9] arm64: dts: ti: k3-am62a: Split r5f memory
 region
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWFya3VzIFNjaG5laWRlci1QYXJnbWFubiAoVEkp?= <msp@baylibre.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-7-74c650dfdea6@baylibre.com>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
 <20260903-topic-am62a-ioddr-dt-v6-19-v8-7-74c650dfdea6@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 12:55:33 +0000
Message-Id: <20260903125534.48D651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] ABI breakage causing monolithic firmware loads to fail.
- [High] SPL memory allocator overwrites DM firmware due to missing bootph-=
pre-ram tags.
--

commit f1d8c1de00b90f262848fa5af621458f523e6277
Author: Markus Schneider-Pargmann (TI) <msp@baylibre.com>

arm64: dts: ti: k3-am62a: Split r5f memory region

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/=
arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> index 06d4e815b1670..94c1d60d8d7a1 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> @@ -65,8 +65,14 @@ &wkup_r5fss0 {
>  &wkup_r5fss0_core0 {
>  	mboxes =3D <&mailbox0_cluster0>, <&mbox_r5_0>;
>  	memory-region =3D <&wkup_r5fss0_core0_dma_memory_region>,
> -			<&wkup_r5fss0_core0_memory_region>;
> -	memory-region-names =3D "dma", "firmware";
> +			<&wkup_r5fss0_core0_ipc_region>,
> +			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
> +			<&wkup_r5fss0_core0_lpm_metadata_region>,
> +			<&wkup_r5fss0_core0_lpm_rest_region>,
> +			<&wkup_r5fss0_core0_dm_region>;
> +	memory-region-names =3D "dma", "ipc", "lpm-stub",
> +			      "lpm-metadata", "lpm-context",
> +			      "dm-firmware";
>  	status =3D "okay";
>  };

[Severity: Critical]
By splitting the single firmware region into smaller parts, does this break
loading existing legacy ELF firmwares?

The remoteproc driver uses k3_rproc_da_to_va() to translate addresses, which
requires the entire ELF segment to fit within a single DT memory region:

drivers/remoteproc/ti_k3_common.c:k3_rproc_da_to_va() {
    ...
		if (da >=3D dev_addr && ((da + len) <=3D (dev_addr + size))) {
			offset =3D da - dev_addr;
			va =3D kproc->rmem[i].cpu_addr + offset;
			return (__force void *)va;
		}
    ...
}

Will large segments from a monolithic firmware fail to fit in any of these
new smaller boundaries and cause address translation to fail unconditionall=
y?

> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/d=
ts/ti/k3-am62d2-evm.dts
> index a8c794d073431..7cba3ff99e6a3 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> @@ -65,13 +65,37 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
>  			no-map;
>  		};
> =20
> -		wkup_r5fss0_core0_memory_region: memory@9c900000 {
> +		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
>  			compatible =3D "shared-dma-pool";
> -			reg =3D <0x00 0x9c900000 0x00 0x1e00000>;
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
>  			no-map;
>  			bootph-pre-ram;
>  		};
> =20
> +		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x00 0x9ca09000 0x00 0x97000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x00 0x9caa0000 0x00 0x1c60000>;
> +			no-map;
> +		};

[Severity: High]
The previous wkup_r5fss0_core0_memory_region had a bootph-pre-ram property
so it would be included in the SPL device tree and marked no-map. By droppi=
ng
bootph-pre-ram from wkup_r5fss0_core0_dm_region (and other new regions), wi=
ll
U-Boot's fdtgrep fail to include these nodes in the SPL?

Could this cause the SPL memory allocator to treat the 28MB unreserved
wkup_r5fss0_core0_dm_region as free RAM and overwrite the live DM firmware
during boot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-topic-am62=
a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com?part=3D7
