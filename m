Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459393;
	b=2psGOCkNXvAjz0AwolGp+1KSurFkrp196j3yNM1kL7yq8fLucHyDRyu5uTocGzbYmgue
	 zgBFRv+dmfQuulIP8HRmKlzZ5XfQUNnL6t/urLw0AnCUt6tcnmu+nO03tM2Vbv/1ZCelp
	 NCPzMNoUeu5kUUb9+to/+yKnr9Rct+8InIhMRwbFUYEvvJi8R/KKhR5SY+Nl660bHMuYL
	 GKxC6+gA8vXim7b0DbtAb/LRLwVguNnToyuWPvOU3WgqKj/Di3pFUJG5jD9guCS7CSa0k
	 EBNP3pQEvAvob5nQEuswk9anWXXOelkFtJYbzRmlr2Yo2ucSMzVj9Y8YjAXSza8B80w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459393;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GfyRO1viFKJxdzoyzx3pBhQC1NRgw8BOMvdC7bOOTIQ=;
	b=ZHDhgWvWnRpyrI9d0uTxq9qPkc57iBy9HfZahBOWYYGzAW9hLyfLAqELYMHHP9DBNUGQ
	 G3k4J53b8aqpxNCUlZiFFqelH8UVVygNBaxHg1qcYPLrLIoW/oNVD/0GsI5m6a3HiGPEC
	 M6audBI+SnLKznoZJWW8qb/HY52t/bs8h66qqX1AeMtVPKcrNdBFJC3+syya+W4DcGouI
	 V6uqz7fiiInHtXWu3TiLLkEBQqPjjFZoN+7ep6D9DHK8rULlmxkthDhurPFrx9KoPdFJT
	 XsMb0habu/jB+LsBfvIngUYK+0QZ3DX1QS33KPwaxZH9Xp+PVYFBB/wHSCiT6ubBZNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJxOqbuT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F382606A323
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJxOqbuT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6599C1F00A06;
	Thu, 12 Nov 2026 04:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794459392;
	bh=GfyRO1viFKJxdzoyzx3pBhQC1NRgw8BOMvdC7bOOTIQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nJxOqbuTmfRCe6Os6cWZpGye5FryM8QKl2ECAOGSNOEVgETeL8jtIT4rIJHuQP1Gt
	 vfm6jN6ybfpBW8JmBaCklxYWjJnogBQzqS2R3nxqyW22Cwcf/a9OZ6RX6cMpnkEZ1D
	 fcAq+WAa2XOiokUjC/fmqVVUKL7yUOqS4zKiIO3L33dxquJRNoJaqARgC7zQQJL347
	 +O3TchN+pRKhbe3ITpQ9z+mEa8XwZV5A2BrKWy4+PwXV1t3XUD6xACk7xJFSSq/klG
	 mYUiSxvM3CA0jUzex4kZpc0/kNFCnng6h89jo8MhV8XTMi210M1Us3B4Nw4rPrCjX6
	 MWEN7SwWmsbGA==
Message-ID: <sashiko-outbox-210401@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 09/11] arm64: dts: qcom: ipq5210: Add I2C nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-08-dts-v9-9-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
 <20261112-08-dts-v9-9-c34de4f78fbb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 04:56:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: ipq5210: unconfigured 32 MHz SE clock in
  geni_i2c_probe()
--

commit 0886413b485197e28c9ca095b2bedf736adf3f28
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add I2C nodes

This commit adds the QUPv3 I2C controller nodes and 32 MHz OPP table for
IPQ5210 and enables i2c0 on RDP504.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 4cb9f399d4808..36f874e57b425 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -173,6 +173,14 @@ opp-300000000 {
>  		};
>  	};
> =20
> +	i2c_opp_table_32mhz: opp-table-qup32mhz {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-32000000 {
> +			opp-hz =3D /bits/ 64 <32000000>;
> +		};
> +	};
> +
>  	pmu {
>  		compatible =3D "arm,cortex-a53-pmu";
>  		interrupts =3D <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIG=
H)>;
> @@ -460,6 +468,45 @@ uart1: serial@1a84000 {
> =20
>  				status =3D "disabled";
>  			};
> +
> +			i2c0: i2c@1a88000 {
> +				compatible =3D "qcom,geni-i2c";
> +				reg =3D <0x0 0x01a88000 0x0 0x4000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				clocks =3D <&gcc GCC_QUPV3_WRAP_SE2_CLK>;
> +				clock-names =3D "se";
> +				clock-frequency =3D <400000>;
> +				interrupts =3D <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +				operating-points-v2 =3D <&i2c_opp_table_32mhz>;
> +				status =3D "disabled";
> +			};
> +
> +			i2c1: i2c@1a8c000 {
> +				compatible =3D "qcom,geni-i2c";
> +				reg =3D <0x0 0x01a8c000 0x0 0x4000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				clocks =3D <&gcc GCC_QUPV3_WRAP_SE3_CLK>;
> +				clock-names =3D "se";
> +				clock-frequency =3D <400000>;
> +				interrupts =3D <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
> +				operating-points-v2 =3D <&i2c_opp_table_32mhz>;
> +				status =3D "disabled";
> +			};
> +
> +			i2c2: i2c@1a94000 {
> +				compatible =3D "qcom,geni-i2c";
> +				reg =3D <0x0 0x01a94000 0x0 0x4000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				clocks =3D <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
> +				clock-names =3D "se";
> +				clock-frequency =3D <400000>;
> +				interrupts =3D <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> +				operating-points-v2 =3D <&i2c_opp_table_32mhz>;
> +				status =3D "disabled";
> +			};

[Severity: High]
Will geni_i2c_probe() fail with -EINVAL on i2c0, i2c1, and i2c2 when the
bootloader has not already set the SE clock to 32 MHz?

geni_se_resources_init() registers operating-points-v2 via
devm_pm_opp_of_add_table(), but the qcom,geni-i2c driver never calls
dev_pm_opp_set_rate() or clk_set_rate() before geni_i2c_clk_map_idx()
checks the current clock rate:

drivers/i2c/busses/i2c-qcom-geni.c:geni_i2c_clk_map_idx() {
	...
	if (clk_get_rate(gi2c->se.clk) =3D=3D GENI_SE_CLK_32MHZ) {
		req_freq =3D GENI_SE_CLK_32MHZ;
		itr =3D geni_i2c_clk_map_32mhz;
	} else {
		req_freq =3D GENI_SE_CLK_19P2MHZ;
		itr =3D geni_i2c_clk_map_19p2mhz;
	}

	ret =3D geni_se_clk_freq_match(&gi2c->se, req_freq, &gi2c->clk_idx,
				     &res_freq, true);
	...
}

In drivers/clk/qcom/gcc-ipq5210.c, ftbl_gcc_qupv3_wrap_se0_clk_src has a
24 MHz XO rate and a 32 MHz rate, but no 19.2 MHz entry.  If the SE clock
is left at its default rate at boot, clk_get_rate() is not 32 MHz, and
geni_se_clk_freq_match() fails looking for 19.2 MHz.  Setting
assigned-clocks and assigned-clock-rates =3D <32000000> on these nodes (or
applying the OPP rate in the driver before geni_i2c_clk_map_idx()) would
ensure the SE clock runs at 32 MHz before probe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-08-dts-v9-=
0-c34de4f78fbb@oss.qualcomm.com?part=3D9
