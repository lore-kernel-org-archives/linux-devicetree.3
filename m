Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658AE3DB30C
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327156; cv=none; b=BjcJ52ZFKweCU8nMVZ0z3leS9x8dLLxosJsciSGKqKbmEZZtpz5h5QbXbyCdJKkV07dF4gkOl0w40xGMyMHlXa9A/3BGykb/A57eY3IexrBbIgta0WVw0pViqdDoGTJmR3wV3pVTinZzHBlHpPPTdg4UkXjV7c4kdyw2zdfIRlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327156; c=relaxed/simple;
	bh=S4VzG7oFX94AcWmughEF+OAZqTyC+22jQMCZXp8H/bs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KuyCkdCLWndQWOKu7RNNh1j3XLcqc9NJbGHh7jGF5KVKKk+3u1yMl/Eb/9e7l4iJMflHFzpwdDmteSitUB9OHsbVSUO4CyS30V4+8SOw/hR7MLy7iPR3C7s1TxYG/u7Sa9Ux9xVJVo4NaaQKbeC+550VH4wxbIyD7jszNO7xWcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2qtuJWD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2qtuJWD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD44F1F00A1B;
	Mon,  1 Jun 2026 15:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780327148;
	bh=bjgW4RMsR3bGkhLNeFhGMKQDzyGH3gHXGZT93lTFak8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T2qtuJWDTRst04DAsSgdiffxVfypxyl3NTUDI09iyczzOn33O+W0UEe4DDyPjFWlV
	 llIZ3OgbIzZj6wqfSrRqiq+79nsiIU5eE+G6j/ss81IIP4In0ny+ifEJDcANyPXjNP
	 pwYrSJYI+c1I2gIsr18s8li8RCskKLUCUMMhRCWMgNamwh9zeHBkbWjd47tcT4JhYd
	 dzYraE4Rg3jfynyYTtqO5lh4a51h0HVO1AtLTRFZiUq5JonifhKiHZJW/gwTCZ94Dl
	 N19Gm+ylgubjsA5apuyu8GlQymhfTCPCXoeRra+zaA0ro4Yf68nAVPZ+o/G4bfbgLh
	 1t0MYOfTvUuvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Zaikin" <zstaseg@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601150752.666393-3-zstaseg@gmail.com>
References: <20260601150752.666393-3-zstaseg@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 15:19:07 +0000
Message-Id: <20260601151907.AD44F1F00A1B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The SBU port in the USB-C connector node has a mismatched unit-a=
ddress and reg property (`port@2` with `reg =3D <1>`).
- [Low] Invalid 'mem-type' property in the ramoops node.
--

commit 444192d5f33eb93dfce53fe410ae77991af6102e
Author: Stanislav Zaikin <zstaseg@gmail.com>

arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao) DTS

This commit adds devicetree support for the Xiaomi 12 Lite 5G handset,
including display, touchscreen, UFS, buttons, regulators, remote
processors, and USB device mode.

> diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm=
64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> new file mode 100644
> index 0000000000000..ec795f8adc467
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts

[ ... ]

> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint =3D <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg =3D <1>;

[Severity: Medium]
Is this port index correct for the SBU endpoint? The devicetree specificati=
on
requires the unit-address (@2) to match the first address in the reg proper=
ty.

Additionally, the usb-connector binding assigns fixed indices to ports:
reg =3D <0> for High Speed, reg =3D <1> for SuperSpeed, and reg =3D <2> for=
 SBU.
Using reg =3D <1> here for the SBU port violates the schema and might logic=
ally
miswire the SBU mux to the SuperSpeed data graph port index, breaking
alternate mode routing. It will also generate a dtc unit_address_vs_reg
mismatch warning.

> +
> +					pmic_glink_sbu: endpoint {
> +						remote-endpoint =3D <&fsa4480_sbu_mux>;
> +					};
> +				};
> +			};
> +		};
> +	};

[ ... ]

> +		cdsp_mem: cdsp@9c700000 {
> +			reg =3D <0x0 0x9c700000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		ramoops@a9000000 {
> +			compatible =3D "ramoops";
> +			reg =3D <0x0 0xa9000000 0x0 0x200000>;
> +			mem-type =3D <2>;

[Severity: Low]
Does this mem-type property pass upstream validation? This appears to be a
downstream addition historically used to force memory caching attributes,
which is not supported by the upstream ramoops bindings.

Leaving this in will trigger a dtbs_check validation failure. Upstream
typically handles memory attributes via standard reserved-memory properties
like no-map.

> +			pmsg-size =3D <0x100000>;
> +			record-size =3D <0x100000>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601150752.6663=
93-1-zstaseg@gmail.com?part=3D2
