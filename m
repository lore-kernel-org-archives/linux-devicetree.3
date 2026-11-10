Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332702;
	b=0apKnKNbjKw3HnBNUXp/IVGb5xNRWSHl7Wezcl4ex/f2L/ck+Jaf4cpK3QY16u0SahLn
	 8BBk7g1juFZcmaE64kEwcP+mUScaId50b/64xU/daGjM2DBHFLaFLXF8s9jGtFoBA83ky
	 OLvmoAnjKKBPLEWcoBv9HkBLNeXssEQIwI3sL9gFLfNgZrhiAzGiixajE1Bo2fawkM+CM
	 QiTE0I/20WUOCOzMLVQJQmFklivbiuxUP8lA98ARsrduKq1aEwg0EHqHiAT7ee3EPFANx
	 FZWndQOt+h/nAUbinuDv9tj3kzBYhWIP9RRc+IekSL+a8dPh3qYMQJt1UuxjNKaV/qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332702;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=s/rTwLMNye5urPWLJcnXQ4B9jBi9hOp8UVP2acK5CL4=;
	b=BkVlxy2VK/TEHpUImEXa690+h/ZGVv/fTOjH5kVPsAiTQpaPae+sZeNsMWLI+nmxjFlq
	 cdjSFKhSUN7eC2acVqJaWsmh9sJIavv2IkQv6rk6lizdK26F06dYjE1YwhSyNyw1tUqov
	 MBKOz/iU6TgqH+/bDrhWQ9mHQ7xfAQ2GK80gWl0fAnwPjt9UMYhww09Tq8ZEEkt4G0W1v
	 4W3/e06BYOVtcHhahTlhI/km1/3vc8yooC9Hdw3F7S+HbWd4lmlM3TbszKo8J7ZOzKfcL
	 2FHsJeqYm8545nOezO3qKVYug0kK0VrQjf6nJun2GMFhSlUvMHFa1v4ZiNfJRBMYhIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PvL4iGuo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E24606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 17:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PvL4iGuo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CC91F0089F;
	Tue, 10 Nov 2026 17:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794332702;
	bh=s/rTwLMNye5urPWLJcnXQ4B9jBi9hOp8UVP2acK5CL4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PvL4iGuo3R6Ze8zknph4CopKBTIX4Zv6CK5xJOeKo8u5P1nusjmsnjwxN5x7wlJs0
	 LU696p3s/c6X0B5i762exZW3D4/NNoeNUXX3y/BMLIj+jefWNeeBYEvcv6GBB/gX9v
	 4u0QJDvfvkRAZ4EiEr52/E7ypgHgZGGDHTeShslDC8m5cOS6SlileSi+pDUfQKzpXS
	 7JETgZQ84jNepiGgMXOzPpWh5dy0HSWMU5Tm/QlWszlgOzLe9LZGpQHbD/x9UoW1cm
	 o7N05JqFIc437o7bJThnrnvVKvn3YYNft3RQWpv3o28uW+TDp5zpo6yh6hh4e1UuyI
	 fVWJohU70hITA==
Message-ID: <sashiko-outbox-207504@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: airoha: add AN7589 SoC dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110172143.296304-3-john@phrozen.org>
References: <20261110172143.296304-1-john@phrozen.org>
 <20261110172143.296304-3-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 17:45:01 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] arm64: dts: airoha: GICV reg size in an7589.dtsi is 0x1000
  instead of 0x2000
- [Low] arm64: dts: airoha: an7589.dtsi violates DTS node and property
  ordering style
--

commit a54801b37e2982019e19eb5576150babcfa339e8
Author: John Crispin <john@phrozen.org>

arm64: dts: airoha: add AN7589 SoC dtsi

This commit adds the initial device tree include for the Airoha AN7589 SoC,
describing the Cortex-A73 cores, PSCI, GICv3, architected timer, and
console UART.

> diff --git a/arch/arm64/boot/dts/airoha/an7589.dtsi b/arch/arm64/boot/dts=
/airoha/an7589.dtsi
> new file mode 100644
> index 0000000000000..c0153a00c88ae
> --- /dev/null
> +++ b/arch/arm64/boot/dts/airoha/an7589.dtsi
> @@ -0,0 +1,134 @@
[ ... ]
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		atf@80000000 {
> +			no-map;
> +			reg =3D <0x0 0x80000000 0x0 0x200000>;
> +		};
> +	};
> +
> +	psci {
> +		compatible =3D "arm,psci-1.0";
> +		method =3D "smc";
> +	};

[Severity: Low]
This isn't a bug, but scripts/dtc/dt-check-style --mode=3Dstrict reports
several DTS coding style warnings in this file:

- The unaddressed child nodes under / (reserved-memory, psci, cpus,
  clock-1843200, timer, soc) are not ordered alpha-numerically by node
  name.
- reg comes after no-map in atf@80000000.
- ranges comes after #address-cells and #size-cells in soc.
- reg comes after interrupt-controller and #interrupt-cells in
  interrupt-controller@c000000.

[ ... ]

> +		gic: interrupt-controller@c000000 {
> +			compatible =3D "arm,gic-v3";
> +			interrupt-controller;
> +			#interrupt-cells =3D <3>;
> +			reg =3D <0x0 0x0c000000 0x0 0x40000>,
> +			      <0x0 0x0c080000 0x0 0x200000>,
> +			      <0x0 0x0c400000 0x0 0x2000>,
> +			      <0x0 0x0c410000 0x0 0x1000>,
> +			      <0x0 0x0c420000 0x0 0x1000>;

[Severity: Low]
Should the fifth reg entry (GICV at 0x0c420000) have a size of 0x2000
instead of 0x1000?

Like GICC at 0x0c400000, the GICv2-compatible virtual CPU interface spans
8 KiB (matching KVM_VGIC_V2_CPU_SIZE), with GICV_DIR at offset 0x1000 in
the second 4 KiB page.  Using 0x1000 causes gic_of_setup_kvm_info() to
record a truncated gic_v3_kvm_info.vcpu resource that omits the second
page.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110172143.2963=
04-1-john@phrozen.org?part=3D2
