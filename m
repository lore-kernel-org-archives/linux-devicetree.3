Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB42343D50C
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784677541; cv=none; b=lbATLQWwyr4TNXKimksAqtIwqULE6dcVeMYmXa8lfhmvd924B8x2x1Rscg0gjsaw0QhAgnupHEJY+eDNEvH9rVjyJlGGwuRWGo6eS1g0t/bOCXRn5Jt1oZb+1AK2XP5j7z21r0Z1h1Jh1v58WV1phkH78/isvaVhd94TSgKIl60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784677541; c=relaxed/simple;
	bh=eATECF74mX24sKCotXJIPWWFyhRaL73LVg3uXq4FEls=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Clt2SbBG0iVSXX+HDKo+Mr2QK/Nb3nFl40d2Hn/bg5kp1HfjwLMzLG5uhx9cH9Lm9ShdbjLqLjkyE0bXQs/Riv8nPL24Z1AG67i4XPi55qljc5aW04RewgOmK/8tYudvS0wpAhz/xcwSL1k7qVJ/EkZTfzBLwaM0RSuMKlWsR40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=brHiimDc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="brHiimDc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4300B1F000E9;
	Tue, 21 Jul 2026 23:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784677526;
	bh=Mqcpg4ZmCxyVDxsUg8K0PBgNuNwJHuO3UHVn5omhFfU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=brHiimDc1zzBlteUdLly9QX7273OX47aWK0LXEczzMzUL8NP1X+l/FpRmAxgMkHtF
	 hiEpc7GHr0tSlRjMM7RhDAw9zFRB5hi7M7HpI+VClbOPBdd+CsWqcAWmIdzkCuIt90
	 Y7RtV3H2vbimjedUMd9TpXe05mlxaXvKqVwfV/JqfZrNWcf5QXKYHJTEOi5ZoI44m3
	 zmfhAuNwMIyHdI6uEyV454N6feNoZ24NMs4pYG3PHc9e6pwNN68GnyBugd4C5sl+OF
	 JHfXlSpwNBLWk4Sxfjk6Iw02DVnzwzKUzso5EESPJgsiROwjUekgtTbhjL8zhJE26r
	 k732moBCxk8iA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] riscv: dts: sophgo: Add Milk-V Duo 256M board
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Yeh" <chenyou910331@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260721233452.112204-4-chenyou910331@gmail.com>
References: <20260721233452.112204-1-chenyou910331@gmail.com>
 <20260721233452.112204-4-chenyou910331@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 23:45:25 +0000
Message-Id: <20260721234526.4300B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Potentially incorrect coprocessor RTOS memory region address cau=
sing memory fragmentation and risking memory corruption.
--

--- Patch [3]: [PATCH v4 3/3] riscv: dts: sophgo: Add Milk-V Duo 256M board=
 support ---
commit 0fb7e443f556963d48319d1228e77903653e11bc
Author: Chen-Yu Yeh <chenyou910331@gmail.com>

riscv: dts: sophgo: Add Milk-V Duo 256M board support

This commit adds basic device tree support for the Milk-V Duo 256M board=20
based on the Sophgo SG2002 SoC. It includes configurations for UART, SD/MMC=
,=20
USB host, and the onboard status LED.

> diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/r=
iscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> new file mode 100644
> index 0000000000000..21ef6ed9f0d21
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts

[ ... ]

> +	reserved-memory {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		coprocessor_rtos: region@83f40000 {
> +			reg =3D <0x83f40000 0xc0000>;
> +			no-map;
> +		};

[Severity: Medium]
Is this reserved memory address correct for the 256M board?

This address (0x83f40000) is at the top of the 64MB boundary, which matches
the 64MB Milk-V Duo. Since the Milk-V Duo 256M has 256MB of RAM, would the
RTOS usually be placed near the top of the 256MB space instead?

If the bootloader places the RTOS at the top of memory but the device tree
reserves this lower address, could Linux inadvertently overwrite the actual
RTOS memory during allocation? This might also artificially fragment the
contiguous Linux memory pool around the 64MB mark.

> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721233452.1122=
04-1-chenyou910331@gmail.com?part=3D3
