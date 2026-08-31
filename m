Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B6C40860A
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179829; cv=none; b=iSAEmhzDKCGXnQcuJJzpsZXMex0wXxS76e/SON021sBFwbfir50ichrn9yMmSjb5NphnrLjRefMKZWqkrRv7B/lnvKxV3Qoqbz7iSOcny1ZPU0f70PC3vB0JNXCnEUtTdmbWYwOjxFxR+CPK/4qJcEZEliUedUT40sFjS+Uj90w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179829; c=relaxed/simple;
	bh=rxafdNkhfDfqTybQYvBD6c3YqwB52Q+nzoEnzCYqAtc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=vAXOkcI7LoStAkxblLo9r73+gI9LwG2e7NlZVEAaxDOg/lDYzHlhArpNogbV6lJqNAhLm1uo/Xip8GbI+gXYGj4QeXvAqf4YElvGj7BWWP0G5zAUf9iX73cbJbryx3p8Hgtu+FDYUCVcZ19HX3gt8Z2LtxubKSTaUX8GzN3W0Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=K1XHC5SY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="K1XHC5SY"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48436251906so1454880f8f.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1788179823; x=1788784623; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v+j/HMcDeeoZ1SxGQJxVLKBNJDgbVV4ZRTow/yvavFk=;
        b=K1XHC5SYcxnGaJQ7IIVVk74WmHlY9GT9xoczspG/I4CSA+ZLPcMmkIJlBEGpoFrYov
         GWpoqZrhA3cWR/1FbOGocZkCfwkMaow9lyDuQ17kvrFdbaL7g28WdNhjdKtYZZQFSG3L
         2mUFrQJi702uTcFFL3sYptIHeSNnNu1t3hLvMnvismdviy87q6IVlEmB3Q9eNF5oXx61
         dK83PhJtDTPBFJHLmS325kNec26ujYKPj5Nh4gIstnTrZwjXvILT69wx14mTpyVTzKAJ
         3WltxTga0F9gaEko1eDQmRMOHpSAWKY3Cvp+NBAOuGj/3Dvk9NYpjtKvp2LbFL09O2di
         JZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179823; x=1788784623;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+j/HMcDeeoZ1SxGQJxVLKBNJDgbVV4ZRTow/yvavFk=;
        b=sLQN1G3tDplBqZnUadv2KRRDJoExCRwGfl1MRY1zoZxIxgtEkxouEDkmLq9SgTT2fy
         BMh0u0TlUp4tzF/ydLxzNS8tXT8+tn1ZDQD2TKRwzjposYTT9C+aPslVRsmlPNl27Beg
         5usxhps7ZQPgS94fxzJZAcPF67MMfT0qr2pP7nQJaYBYKTEITvrxDnkWza6a5HpdjNJ+
         IG+1GbyaxQ0P0uFaLtBBt9+S0ogdX6lMfcCs4vGhhr3RZYaymWdnzIey/0/bx1zJzvn7
         dlu78tyUVoZsFO2qBEd3U4JVpfpLtJCytr9Gd9Y2AWUXsJ2xzaPjcarJsCAga9htzN9B
         Rkqg==
X-Forwarded-Encrypted: i=1; AKwUvBzAu2MzZLQ9TirOU5BW30SDveMj1lY7I0MIdY/CYoBTYpE6w0OnYs4c35FmJAA1NqpypVdWhPLOBFnh@vger.kernel.org
X-Gm-Message-State: AFuF++nt+c0N0GyZA2Odznj5NUNQpZO+C4uOOH1bxTkwGw/+UpXci2EB
	/gzpofiNIlVLYQcg0sTMr4AgizPqstmeXXvDYswNTwCoaCvimo6D7SEVXziDySHZutw=
X-Gm-Gg: AYBFou15rFviI693Jc8aDkyQqD426wGww8X/KJLjIC8epo+6HgDSEV/IgKm6zf7bUp3
	7UfPAeAOzXWJNr5TGLexMFW8LcsTt7eqvUaQUgwrVjprl0eiFHQMPRkX6AcYIU94cGBftT7sVPN
	VoMG0VdRlk0VgQF3xblUyy5L4cQXX4m1D5aRqwqJX10jDn+Cu5BL6PaePpwTQYZ4/Y/nOtwBTS0
	3LAAiJ1aS5hNNi7B2rCVD49SqgpYj6DO2KjFtVt9C/r7jZNuyGoyABzohNdFskOEImoJq3Uegik
	VsX1qxzChhYo2nsa+RxP/JfbSaVzXFpupi7tVXSsNIrJ7Ug1kmfEaG+aXVfvq+PM8WObQyi7vWl
	PNTW5OYPQVUDUMeBSzW2/B8VmNIyC6LVmNCBwjJLHIzV2J9xLLYgudc0P7ALZbjRugVLjDziqXy
	L6kvcP50/jWnpoeH3fM9wOhJpqZR4/V/yb6AjU2+z+baQ9jDmtC+QrahAW8b2aGSrUGqSwI8oRi
	8/RgR0Tqs3QPrDaFm8dutE7tJaCT7cBxdtLhGlC18/p6A+pUlbI4OAVJncLm64kyEq8
X-Received: by 2002:adf:e014:0:20b0:47f:7129:6e2d with SMTP id ffacd0b85a97d-48441010765mr717293f8f.17.1788179822646;
        Mon, 31 Aug 2026 05:37:02 -0700 (PDT)
Received: from white-mocha.local (p200300e66714e500cb5f91bd76cb96be.dip0.t-ipconnect.de. [2003:e6:6714:e500:cb5f:91bd:76cb:96be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843dcc00a6sm4540003f8f.33.2026.08.31.05.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:37:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
From: Tan Siewert <tan.siewert@9elements.com>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260830182036.284736-3-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <20260830182036.284736-3-prasanth.padarthi10@gmail.com>
Date: Mon, 31 Aug 2026 14:36:34 +0200
Message-Id: <178817979463.20922.10263529532171804189.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788179813; l=4261;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=rxafdNkhfDfqTybQYvBD6c3YqwB52Q+nzoEnzCYqAtc=;
 b=t8LGYUPo6IQisrHMFR86MLJkpE4vyOvF+mup7Ma3JedRI7oe9cjXkFGqlpW4+NEa7i1H4cjuu
 KqDrGxOVrRaAPCrbQic/6SFFZLmVlk7lX/4SH0QIWnf7fDdf0cciMtA
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

Hi Prasanth,

On 8/30/26 8:20 PM, Prasanth Kumar Padarthi wrote:
> Add the device tree for the ASRock Rack B650D4U BMC, which is
> based on the ASPEED AST2600 SoC.
> 
> Describe the BMC memory, SPI NOR flash layout, UART console, and
> MAC0 connected to an RTL8211F Ethernet PHY.

Why no GPIOs? Why no I2C buses? You'd need at least i2c7 with an at24c128 to
populate the MAC address on MAC0.

> 
> The MAC0 RGMII RX delay configuration was validated on hardware.
> The RTL8211F requires its internal RX delay for reliable operation,
> while an additional TX delay is not required.

No, it does not. The traces have the same length and don't require special
delays. If you use u-boot/next, then it might be true because it still misses
the correct SoC-specific delays. This is, however, fixed in openbmc/u-boot.

I know that this is not optimal. I'm already working on getting this fixed in
upstream U-Boot too.

> 
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index 6b68671f9379..b109491d5c8f 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-ampere-mtmitchell.dtb \
>  	aspeed-bmc-arm-stardragon4800-rep2.dtb \
>  	aspeed-bmc-asrock-altrad8.dtb \
> +	aspeed-bmc-asrock-b650d4u.dtb \
>  	aspeed-bmc-asrock-e3c246d4i.dtb \
>  	aspeed-bmc-asrock-e3c256d4i.dtb \
>  	aspeed-bmc-asrock-paul-ipmi-card.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> new file mode 100644
> index 000000000000..aa623f0ca36c
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +
> +/ {
> +	model = "ASRock Rack B650D4U BMC";
> +	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial0 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x20000000>;
> +	};

Where's the reservation for video?

> +};
> +
> +&fmc {
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;

That's already defined in aspeed-g6.dtsi

> +		label = "bmc";
> +		m25p,fast-read;
> +		spi-max-frequency = <50000000>;
> +		spi-rx-bus-width = <4>;
> +		status = "okay";
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			u-boot@0 {
> +				reg = <0x00000000 0x000e0000>;
> +				label = "u-boot";
> +				read-only;
> +			};
> +
> +			u-boot-env@e0000 {
> +				reg = <0x000e0000 0x00020000>;
> +				label = "u-boot-env";
> +			};
> +
> +			kernel@200000 {
> +				reg = <0x00200000 0x00800000>;
> +				label = "kernel";
> +			};
> +
> +			rofs@a00000 {
> +				reg = <0x00a00000 0x02000000>;
> +				label = "rofs";
> +				read-only;
> +			};
> +
> +			rwfs@2a00000 {
> +				reg = <0x02a00000 0x01600000>;
> +				label = "rwfs";
> +			};

No. Include the partitions via `#include openbmc-flash-layout-64.dtsi`.

> +		};
> +	};
> +};
> +
> +&mac0 {
> +	status = "okay";
> +
> +	/*
> +	 * The RTL8211F provides the required RGMII RX delay. No additional
> +	 * TX delay is required for this board.
> +	 */

No? I do have this board myself with a custom BMC ROM and I can tell you that
you don't have to set delays other than the described SoC-specific delays, but
this is, as mentioned, already done in the BSP. (And no, I haven't upstreamed
my DTS yet bc I haven't had the time to do it.)

> +	phy-mode = "rgmii-rxid";

`rgmii-id`

> +	phy-handle = <&ethphy0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;

No nvmem cell to set the MAC address? i2c7@57 offset 0x3f80? Please see the
other device-trees for ASRock Rack mainboards.

For me, it is a:

NACKed-by: Tan Siewert <tan.siewert@9elements.com>

Tan

-- 
Tan Siewert <tan.siewert@9elements.com>
