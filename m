Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C483D9DAC
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273715; cv=none; b=cqycCbrvW1ZJ9oMr7GqPedkg1saGGUJjxHhCpgTKhdZvugS0HeNTsndaijiNXWBErQeV6mnUi5N+CWRfEQ44Q7llDTXseAJR58n51UFTnVkE9cWwKK1mpzDY/WxYRGIii77ECFYeXViYsviJsB5MLLTWD8lIvopVmYdOvnEt4s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273715; c=relaxed/simple;
	bh=o1AjKdh7jPLRn55ltPnR+xgfvEdrPZWdBdPVqQJ9wLM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l5+buDx6wOdtSDOZ1xU9zerBHqri1N17DHpM6W9ITXhxzRcvESZtkrd+96dsiOHF//eTqtOp+oRUev5V33CvV1+PkzcCE9obSTg5XGE2Tz1Q6YCQldeXp+9Wzjt/s2w8xHg4wIDGgYFpUTI1ipSHgiPck458kxQ9E8Uv8IlM7Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkIbXHce; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkIbXHce"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2C21F000E9;
	Fri, 17 Jul 2026 07:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784273708;
	bh=l5O3s7Z9m3YUAq5U3pa6PydRBxjmIxVszST2/7bXxB8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FkIbXHce1ESZUYIqPGZrrkjK+mfWIuFhK33PHV0O0+htMmtjSFcAS4rrvQiVWyTF8
	 Iww3BKHxeG6HJCp8jBim/OAFN7CJrAEnFAe8gjnWHHnehVbtXsoEOyT1TPgk8Hvx3K
	 +ncoJx4/c1ZteUWYEjmGr8+GzIUrW9y/NXUDn9TF4wuXm5+icY9ddrRXzR9+p7t0NF
	 baJwPbWza8TYhbzhyubqlEtaJ6pEDjudG4Lxmdji4Hm6XqW6dYB/ONRMLvD5LdZUrY
	 VpOnkMMi0O5s2LNQHWgB0xpvevzcqBOYHFFvSFYEWPMt2hNAzqUcTqy0eKxA8g41Cn
	 +DmRaFGK5bN+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/12] arm64: dts: rockchip: add support for NanoPi
 M6 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joachim Eastwood" <joachim.eastwood@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717-nanopi-m6-v4-12-b31391a72e41@gmail.com>
References: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
 <20260717-nanopi-m6-v4-12-b31391a72e41@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 07:35:07 +0000
Message-Id: <20260717073507.BA2C21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unused OF-graph `port` and `endpoint` nodes are defined inside `rt5=
616` and `i2s0_8ch`, but they are ignored by the selected sound card driver.
--

--- Patch [12]: [PATCH v4 12/12] arm64: dts: rockchip: add support for Nano=
Pi M6 board ---
commit f3f11c960b7a0aba3e85b29f5c9f9229eadc9524
Author: Joachim Eastwood <joachim.eastwood@gmail.com>

arm64: dts: rockchip: add support for NanoPi M6 board

This commit adds device tree support for the FriendlyElec NanoPi M6 board,
which shares most features with the R6 boards but includes M.2 PCIe slots,
an additional USB 2.0 port, and an RT5616 audio CODEC.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v1.dts b/arch/=
arm64/boot/dts/rockchip/rk3588s-nanopi-m6v1.dts
> new file mode 100644
> index 0000000000000..f981973c96ac0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v1.dts
> @@ -0,0 +1,67 @@
[ ... ]
> +	sound {
> +		compatible =3D "simple-audio-card";
[ ... ]
> +		simple-audio-card,cpu {
> +			sound-dai =3D <&i2s0_8ch>;
> +		};
> +
> +		simple-audio-card,codec {
> +			sound-dai =3D <&rt5616>;
> +		};
> +	};
> +};
> +
> +&i2c7 {
> +	rt5616: codec@1b {
> +		compatible =3D "realtek,rt5616";
> +		reg =3D <0x1b>;
> +		clocks =3D <&cru I2S0_8CH_MCLKOUT_TO_IO>;
> +		clock-names =3D "mclk";
> +		#sound-dai-cells =3D <0>;
> +		assigned-clocks =3D <&cru I2S0_8CH_MCLKOUT_TO_IO>;
> +		assigned-clock-rates =3D <12288000>;
> +
> +		port {
> +			rt5616_p0: endpoint {
> +				remote-endpoint =3D <&i2s0_8ch_p0>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2s0_8ch {
> +	port {
> +		i2s0_8ch_p0: endpoint {
> +			dai-format =3D "i2s";
> +			mclk-fs =3D <256>;
> +			remote-endpoint =3D <&rt5616_p0>;
> +		};
> +	};
> +};

[Severity: Low]
Are these OF-graph port and endpoint nodes needed in rt5616 and i2s0_8ch?

Since the sound card uses simple-audio-card with sound-dai phandles to
establish the DAI links, neither simple-audio-card nor the rockchip i2s
driver will parse the ALSA OF-graph routing or properties like mclk-fs
embedded inside these endpoints.

These nodes are typically meant for audio-graph-card, so they appear to be
unused device tree bloat in this configuration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-nanopi-m6-=
v4-0-b31391a72e41@gmail.com?part=3D12
