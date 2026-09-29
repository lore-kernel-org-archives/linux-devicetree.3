Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078D052759C
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687433; cv=none; b=AlnmuvpG4vb9MP95KS9VM8WTieOfN8h3Ppy0sxL4KW693Hjl4VKuELOh9B1MFWvmz0NVTZBskHka4vxI0DNKlQ59KoFqrRJqHoQD0b++OwrWQylCeRrofLFJZ9j6wfDc1u9fKPCVkUoeo7Ar/WeSvUQA8YB+WHf6ZjZNrt186Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687433; c=relaxed/simple;
	bh=ZXsvvPYEuyNP1fF411WIoE5no7HaXxDijut/QzFWiTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CL0EPthKEUdezEj34J4zYRX9vDZPq0IZ04L+VNIDHvnz+EZNRpXd86eeizJBlGFtZn8MilbRzh9QL7YAF3gnS7WgxA/DbEHa5t7ks5aKrsZ3buLv9Zdqvqj5iB9PwD5scingR3a9+ZX3+Tgufv6ElTBbCYO5+igeFcwq2hiLnmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=H6HAQRg8; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="H6HAQRg8"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c537df4daaso1471473b6e.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790687430; x=1791292230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oZTmxjICgURDLEHLhO6/OoiWcJxhZ7ADO3JC0gvfruw=;
        b=H6HAQRg8p3KAlLpNMaqTtCdd6aqk+8ZY6VG3fIVhNQoImDgYLs3jzNqPFMv5lSeyFk
         es7rlPij9lRuUcyCOMAuxsZNHfpxsYac7jXqOBbe2hxVjtxfU2CkkfiofmVD73dIPpoo
         GcYCUFthxgemMnrt6rindXnYGATAMGCrCxE+QprhRijAc42ZMeGRhTCWwwKp2JWYbVx9
         0u14F/08XBjGCYnufyLoL1fw/ZqVK3Rhv9tlOZvAMm3b1Bk6kN7wPiLg84SwXmudb/DV
         DOWpIm6b+Hux+of5E+HoSzmhrnlhcguA71f1czjngiRZhYeidyEd8jWBsUmiTVkSVmSN
         0vmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687430; x=1791292230;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oZTmxjICgURDLEHLhO6/OoiWcJxhZ7ADO3JC0gvfruw=;
        b=gVonNmTsr4go6xfD+Kz4iIGHchqgGXIpqEDIpUBAOHAMTQexJWg91cThGPLBZhM4vO
         9lEfwRhiSQkywWD9wGKz/EZvDqqbF64aJTiNwNGVF1FKHLt345Cyc/L54lOwi/+BmAoP
         B2jMi9JB8+UvIEaaVb9PNHDVqeio24Xp6q82TGaKAOaSPFEKl/jDFSSCZqO1PHTOIX5x
         m3O2rpzVd/ETw7sAnZ0duWxZwbAs/ImUk0q1dP/q/jQ5pGYS6KMKuZ4dx9a6UKEfl3w6
         ykLMbnUa9F98rAm6eC8GzT5Vn2fjdQ5XkshyXG4q2arjkURho1zcegp6VhYDUwQjvE27
         41lA==
X-Forwarded-Encrypted: i=1; AKwUvBzNvZjjo/uGkD+DWaNaCPFwiMfv9eRVh2hUNVCG/0TB7kSqq1Mnwcm61GnbUBIH9tQwqKvFiA1xFvn0@vger.kernel.org
X-Gm-Message-State: AFuF++nmFjOKLMIZg6l7jVX14M9f8AFYxDGQ3wKHLeo64VZM5QcucVrG
	+WIVXw7K9Nhy0T6xTEsIYNCi/FWdiDlizprGjTyBXaZbqYP6bmvEMYKdBUkpmQ7sgMY=
X-Gm-Gg: AYBFou1DFq2mi8+UxbO6dDt30MasdCGrIelvorP4oJhYZIQSYNfcBL2HBbh0pglCFQq
	bhsRjBVXjsVm1zHVOYIiHlQF9vuus4LHSx/DGWYJeLsSGBdW3zeD6e/sm/zWaDgYxO/r1SpkyXl
	/khgHIiOv+dhf8zTNnhMfvsHF5YN2eOlYRSPgdH38xwZ0DmR2euSlVJ3e5BxU+a39PfjwKDKX+Z
	CwzJr4C4dhd6quPdCCjXULWgKRdugsNewnFNRsbOcgJhYCVU4Ly3VCXNkVfJWxgdyobpuoFCd04
	nQO/CvFr72XNGiU7CgUTLO79adCJkK7Zj3pnfaQGP7UxjfLsA49DNP7yu9gZKieP+kbiEgCjJ7A
	3pd3lL5x/ENUKevMtQqNnp+6NDP7IBwFf087UHwFgPEv0s/tCVOukZr/2GQoU26xO5ELb1ve3Ak
	tLllyfkDN+xmTp68HGSX8YHEq7PQk/uutqWDaeJhe/ur0WswFlAb0NDJhnZDUGSokDIWQXmMY=
X-Received: by 2002:a05:6808:4fe2:b0:4d6:9283:1be0 with SMTP id 5614622812f47-4dc6812eb3dmr14361082b6e.61.1790687429708;
        Tue, 29 Sep 2026 06:10:29 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.13.74])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ebbbb2324csm4568858b6e.8.2026.09.29.06.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 06:10:28 -0700 (PDT)
Message-ID: <a55c26e3-1bf0-4ba1-b8b9-14ad76a44a14@sifive.com>
Date: Tue, 29 Sep 2026 08:10:26 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] riscv: dts: eswin: add I2C controller support
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andi Shyti <andi.shyti@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Min Lin <linmin@eswincomputing.com>
References: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
 <20260814070007.1662455-7-pinkesh.vaghela@einfochips.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260814070007.1662455-7-pinkesh.vaghela@einfochips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Pinkesh,

On 2026-08-14 2:00 AM, Pinkesh Vaghela wrote:
> From: Pritesh Patel <pritesh.patel@einfochips.com>
> 
> Add I2C nodes for EIC7700 SoC.
> Also add nodes for corresponding slave devices in dts file and
> enable them for HiFive Premier P550 board
> 
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  .../dts/eswin/eic7700-hifive-premier-p550.dts |  56 +++++++
>  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 156 ++++++++++++++++++
>  2 files changed, 212 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> index 3101fd90d171..5dddcf13fd25 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> @@ -130,6 +130,62 @@ &gpio111_pins {
>  	input-disable;
>  };
>  
> +&aon_i2c0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c10_pins>;
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c02";
> +		reg = <0x50>;
> +	};
> +};
> +
> +&aon_i2c1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c11_pins>;
> +
> +	adc@10 {
> +		compatible = "microchip,pac1934";
> +		reg = <0x10>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		channel@1 {
> +			reg = <0x1>;
> +			shunt-resistor-micro-ohms = <1000>;
> +			label = "VDD_SOM";
> +		};
> +
> +		channel@2 {
> +			reg = <0x2>;
> +			shunt-resistor-micro-ohms = <1000>;
> +			label = "VDD_SOC";
> +		};
> +
> +		channel@3 {
> +			reg = <0x3>;
> +			shunt-resistor-micro-ohms = <1000>;
> +			label = "VDD_CPU";
> +		};
> +
> +		channel@4 {
> +			reg = <0x4>;
> +			shunt-resistor-micro-ohms = <1000>;
> +			label = "VDD_LPDDR";
> +		};
> +	};
> +
> +	power-sensor@44 {
> +		compatible = "ti,ina226";
> +		reg = <0x44>;
> +		#io-channel-cells = <1>;
> +		label = "sys_power";
> +		shunt-resistor = <1000>;
> +	};
> +};
> +
>  &pinctrl {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&gpio0_pins>, <&gpio5_pins>, <&gpio11_pins>,
> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> index 771a88645d83..c13432d14504 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> @@ -315,6 +315,162 @@ uart4: serial@50940000 {
>  			status = "disabled";
>  		};
>  
> +		i2c0: i2c@50950000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x50950000 0x0 0x8000>;
> +			interrupts = <105>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C0_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";

Each controller that has only one possible pinmux should reference the
corresponding pinctrl nodes, so it doesn't have to be duplicated in every board DTS.

> +		};
> +
> +		i2c1: i2c@50960000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x50960000 0x0 0x8000>;
> +			interrupts = <106>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C1_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@50970000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x50970000 0x0 0x8000>;
> +			interrupts = <107>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C2_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c3: i2c@50980000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x50980000 0x0 0x8000>;
> +			interrupts = <108>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C3_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@50990000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x50990000 0x0 0x8000>;
> +			interrupts = <109>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C4_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C4>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c5: i2c@509a0000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x509a0000 0x0 0x8000>;
> +			interrupts = <110>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C5_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C5>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c6: i2c@509b0000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x509b0000 0x0 0x8000>;
> +			interrupts = <111>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C6_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C6>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c7: i2c@509c0000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x509c0000 0x0 0x8000>;
> +			interrupts = <112>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C7_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C7>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c8: i2c@509d0000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x509d0000 0x0 0x8000>;
> +			interrupts = <113>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C8_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C8>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c9: i2c@509e0000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x509e0000 0x0 0x8000>;
> +			interrupts = <114>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C9_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C9>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		aon_i2c0: i2c@51830000 {

Please keep nodes sorted (the aon block controllers go below GPIO, etc.).

Regards,
Samuel

> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x51830000 0x0 0x8000>;
> +			interrupts = <290>;
> +			clocks = <&clk EIC7700_CLK_GATE_AON_I2C0_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_ANO0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		aon_i2c1: i2c@51838000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x51838000 0x0 0x8000>;
> +			interrupts = <291>;
> +			clocks = <&clk EIC7700_CLK_GATE_AON_I2C1_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_ANO1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		gpio@51600000 {
>  			compatible = "snps,dw-apb-gpio";
>  			reg = <0x0 0x51600000 0x0 0x80>;

