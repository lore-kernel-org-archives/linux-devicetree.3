Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518875;
	b=dlUI9M7wwmAJXpCmtaHjkeZW+8t29VWxpwpUZIFDdxrXepgZtFS4W313OvURnZ+pKqNO
	 dpPRXl5Pso2amHykgO7yk4itVhaxQGECXejQqck2JAwLmV1kznEiEZW4JLPvTlEIu9++x
	 ZnEr9tiGMgrtBbLlcpleq6TSoHrXt1iFTTO9mBDTY+UzgQ3wvkYOxuIIO2Sf4L+uh9ecc
	 KLqzwe1FnUCKrI2Q51k76ng0zBTy+Okv+CLu5apOB3od+6jpwEundAUOpwwpbayQzbNyR
	 UmpNug+PdU+7AmOBrkqpVW6145z1iNn9mHE5aQ2J3xJK4FYeyax/yDiI4bqBT8ifd2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518875;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=v7kPn/itYKICdqp781iFBP+gpWCq07UgVzs/X2pIL24=;
	b=KE+tTvDa9Ql57g9N+0c1nIWVyBRIzNLhPFvXZ0qlHQCqDOiWknzyLZXJeeqjNZRFxquw
	 5PXZoeDVdTUm5l0ufHAwMky1Mg3RtADO6qcB6QpoipwMSfJnDKerLeYhFD/w1Lzx91o3L
	 MUF8w2PE06SRdYAr7qYX8HV64Q97KvQsKhOOiCVTo4gIgHoY03IdKbAKWW78oWycCbWxD
	 iH/k5h7LXOEJacFOfpkkoV1k/F7KTxdaLIWAbDxUZReonaxIfRxjkKH2tymcRbyIkW6ei
	 AxuWs5rhCaH0p7KuJ4W93Gdv2fJv3ULRL2NGHHHvFg9eTarvy53RT6KlR+DNqOfHbgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mBGgbYYq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5242606A335
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mBGgbYYq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304721F000C4;
	Tue, 24 Nov 2026 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518875;
	bh=v7kPn/itYKICdqp781iFBP+gpWCq07UgVzs/X2pIL24=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mBGgbYYqibiVXU+xmpuVlLIgLkVBpAThEIrHcenRO2DvaxZ/J4UCqmt5YfXhowLQk
	 t4XE2rtZeUjxvKYS+qyrutFUTJom/OF6IuBFNoyJqT9CpJp+r6A4fBjcOaua0x/fT/
	 RUsEbJYPbRmJgCoVhtyFsIwSC+T1V4E6KNDG7nqfivxlUoY/nd3N6XBJ9fOCfYtrhF
	 grdjwxOa0+cDS+HOOEnMEPPbh+xDNHTw4RXCjzDyho18zW6GV1zfDFCXaLGUpSqjDD
	 Ff3QEmAkLX2f8rGlUVY4+bzpbQEyclmt/pJhlB2pCJjeFDZlzH4Prhvel/BXyhXb4F
	 8Yv0JP7u6SIrg==
Message-ID: <sashiko-outbox-231025@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: seca: Enable Seca Ride board
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yadu M G" <yadu.mg@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <73f8ad18d65b6a6c5ad22d8a9730d7213f03627d.1795517711.git.yadu.mg@oss.qualcomm.com>
References: <cover.1795517711.git.yadu.mg@oss.qualcomm.com>
 <73f8ad18d65b6a6c5ad22d8a9730d7213f03627d.1795517711.git.yadu.mg@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 11:14:34 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] arm64: dts: qcom: undocumented qcom,secaau-* compatibles in
  seca-gearvm.dtsi
- [Medium] arm64: dts: qcom: wrong GIC_SPI 584 interrupt on uart19 in
  seca.dtsi
- [Low] arm64: dts: qcom: unreferenced scmi0 and redundant status in
  seca-ride.dts
--

commit df4f6204f1eb1a3dc6910ecaf1e06ffe1e61f76e
Author: Yadu M G <yadu.mg@oss.qualcomm.com>

arm64: dts: qcom: seca: Enable Seca Ride board support

This commit adds the Seca GearVM SoC devicetree include (seca-gearvm.dtsi)
with SCMI channel and peripheral domain descriptions, along with the
initial devicetree for the Seca Ride board (seca-ride.dts).

> diff --git a/arch/arm64/boot/dts/qcom/seca-gearvm.dtsi b/arch/arm64/boot/=
dts/qcom/seca-gearvm.dtsi
> new file mode 100644
> index 0000000000000..68cffd920afad
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/seca-gearvm.dtsi

[ ... ]

> +&i2c0 {
> +	compatible =3D "qcom,secaau-geni-i2c",
> +		     "qcom,sa8255p-geni-i2c";
> +	power-domains =3D <&scmi9_pd 0>,
> +			<&scmi9_dvfs 0>;
> +	power-domain-names =3D "power",
> +			     "perf";
> +};

[ ... ]

> +&qupv3_0 {
> +	compatible =3D "qcom,secaau-geni-se-qup",
> +		     "qcom,sa8255p-geni-se-qup";
> +};

[ ... ]

> +&spi0 {
> +	compatible =3D "qcom,secaau-geni-spi",
> +		     "qcom,sa8255p-geni-spi";
> +	power-domains =3D <&scmi10_pd 0>,
> +			<&scmi10_dvfs 0>;
> +	power-domain-names =3D "power",
> +			     "perf";
> +};

[ ... ]

> +&uart0 {
> +	compatible =3D "qcom,secaau-geni-uart",
> +		     "qcom,sa8255p-geni-uart";
> +	power-domains =3D <&scmi11_pd 0>,
> +			<&scmi11_dvfs 0>;
> +	power-domain-names =3D "power",
> +			     "perf";
> +};

[ ... ]

> +&uart14 {
> +	compatible =3D "qcom,secaau-geni-debug-uart",
> +		     "qcom,sa8255p-geni-debug-uart";
> +	power-domains =3D <&scmi11_pd 14>,
> +			<&scmi11_dvfs 14>;
> +	power-domain-names =3D "power",
> +			     "perf";
> +};

[ ... ]

> +&uart19 {
> +	compatible =3D "qcom,secaau-geni-uart",
> +		     "qcom,sa8255p-geni-uart";
> +	power-domains =3D <&scmi11_pd 19>,
> +			<&scmi11_dvfs 19>;
> +	power-domain-names =3D "power",
> +			     "perf";
> +};

[Severity: Medium]
Should uart19 in arch/arm64/boot/dts/qcom/seca.dtsi use GIC_SPI 587 instead
of GIC_SPI 584?

In seca.dtsi, uart19 at 0x894000 is assigned GIC_SPI 584, which belongs to
serial engine 16 at 0x888000 (where spi16 is enabled on seca-ride) rather
than GIC_SPI 587 used by its sibling nodes at 0x894000:

arch/arm64/boot/dts/qcom/seca.dtsi:
			i2c19: i2c@894000 {
				compatible =3D "qcom,geni-i2c";
				reg =3D <0x0 0x00894000 0x0 0x4000>;
				interrupts =3D <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
				status =3D "disabled";
			};

			spi19: spi@894000 {
				compatible =3D "qcom,geni-spi";
				reg =3D <0x0 0x00894000 0x0 0x4000>;
				interrupts =3D <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
				status =3D "disabled";
			};

			uart19: serial@894000 {
				compatible =3D "qcom,geni-uart";
				reg =3D <0x0 0x00894000 0x0 0x4000>;
				interrupts =3D <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
				status =3D "disabled";
			};

If a board or overlay enables uart19, it will request serial engine 16's
interrupt line, conflicting with spi16 and never receiving its own UART
interrupts.

[ ... ]

> +&ufs_mem_hc {
> +	compatible =3D "qcom,secaau-ufshc",
> +		     "qcom,sa8255p-ufshc";
> +	power-domains =3D <&scmi3_pd 0>;
> +};

[Severity: Medium]
Are the qcom,secaau-geni-i2c, qcom,secaau-geni-se-qup,
qcom,secaau-geni-spi, qcom,secaau-geni-uart, qcom,secaau-geni-debug-uart,
and qcom,secaau-ufshc compatible strings documented in the devicetree
bindings?

None of these compatibles appear in the corresponding binding schemas
(qcom,sa8255p-geni-i2c.yaml, qcom,sa8255p-geni-se-qup.yaml,
qcom,sa8255p-geni-spi.yaml, qcom,sa8255p-geni-uart.yaml, and
qcom,sa8255p-ufshc.yaml), which only list qcom,sa8255p-* and
qcom,sa8797p-*, so running dtbs_check on seca-ride.dtb fails validation
across all 63 overridden nodes.

> diff --git a/arch/arm64/boot/dts/qcom/seca-ride.dts b/arch/arm64/boot/dts=
/qcom/seca-ride.dts
> new file mode 100644
> index 0000000000000..ddcdc3bb6197a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/seca-ride.dts

[ ... ]

> +&pdp_scmi {
> +	status =3D "okay";
> +};
> +
> +&qupv3_2 {
> +	status =3D "okay";
> +};
> +
> +&scmi0 {
> +	status =3D "okay";
> +};

[Severity: Low]
Should scmi0 remain disabled in seca-ride.dts?

Its protocol@11, protocol@13, and protocol@16 child nodes in
seca-gearvm.dtsi have no phandle labels and no consumers, so enabling scmi0
causes the SCMI SMC transport to map shmem0, request GIC_SPI 963, and
instantiate unused protocol devices at boot.  Also, pdp_scmi and qupv3_2
are not disabled in seca.dtsi or seca-gearvm.dtsi, so setting status =3D
"okay" on them here is redundant.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795517711.gi=
t.yadu.mg@oss.qualcomm.com?part=3D3
