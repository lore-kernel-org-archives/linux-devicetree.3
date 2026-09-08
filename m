Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020A441C6A
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 01:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788832477; cv=none; b=iNXzS/zp48chciwvJZ0aTlI455hmA1xGChkk5v7wL1AUfS66QukQWVC6LOFVdLubSajeQkhRRRsKAbCrBjNsOJSsmsHEGIj9n9kUUcT4QFbxzJyM9xJiR+6ZjB8hg+TLIRa9pmd9bu+k3r3/3pKqi8z/YpxZ6bl0ARuZ3fTK9r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788832477; c=relaxed/simple;
	bh=kwudC0PjLP5kL3M+XkND610NCRzkGnkgcM5nahkJy70=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=omKgog9NahOrhTVyVvjf2M/EESq5BhqAqyIjaCDhA4jvAVubWCy98O/9lR3RqfMY0xtLvC7gANvOFRHKKFsKmANSkKMrwVjOUJKA/kZ6pzPLc3HfTwtbYwPPQhOFf7gT/asRNc2xfAwgOtQ7wT6e1zAZWiukh4+AUXiPylIcHbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFv+692l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFv+692l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE071F00A3A;
	Tue,  8 Sep 2026 01:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788832475;
	bh=qbuk+fqU0iWbT1b74O0rZQ0fmItoQ2xUEvc/wjNo7X8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lFv+692lUuIGjX2crkvb2AigYd0geyg2hs8N7XVaeFwN6fg1PGRhUK704d2vMqR9+
	 R7TeM0ZoNsHhAwl1bWkDmWt0YINYieWb8siW9cjQ1Ade47NiCRq2xIsmP5vvtTzYJt
	 wpjoqsF5tnysy7Ynpvg3E5i3dJTpIcTmqoQVh6w7RIWqhRNOJOoRK023rvSCyJ4tTi
	 9uKzyk84iQHB5nsO8xKi8Ml5ZKfVmC8FGqwE+fLI/hACNhSZkw/RsOR0PktbZry93i
	 PBSL2qcYCxxx0Ry/3pwPPbYvYr8QR1r8k3YFK8IzdSdfdUHeJ8QanrjIsdHL3Io/5T
	 q62rdDvQg+cgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: nuvoton: ma35d1: add CAN nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zi-Yu Chen" <zychennvt@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260908014526.413399-1-zychennvt@gmail.com>
References: <20260908014526.413399-1-zychennvt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 01:54:35 +0000
Message-Id: <20260908015435.7DE071F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The CAN controller nodes omit the hardware `resets` property, de=
spite the SoC providing dedicated CAN reset lines.
--

commit bc194563299d88a0e0b218c2bff6562e1d264119
Author: Zi-Yu Chen <zychennvt@gmail.com>

arm64: dts: nuvoton: ma35d1: add CAN nodes

This commit adds controller nodes for the four Bosch M_CAN blocks found
on the Nuvoton MA35D1 SoC. It also configures pinctrl, enables CAN1 and
CAN3 on the SOM board, and updates the APLL frequency.

> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dt=
s/nuvoton/ma35d1.dtsi
> index 7228ad4735b5c..91c0abc1678f2 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
[ ... ]
> @@ -244,6 +244,58 @@ gpion: gpio@340 {
>  			};
>  		};
> =20
> +		can0: can@403c0000 {
> +			compatible =3D "bosch,m_can";
> +			reg =3D <0x0 0x403c0000 0x0 0x200>, <0x0 0x403c0200 0x0 0x2000>;
> +			reg-names =3D "m_can", "message_ram";
> +			interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "int0", "int1";
> +			clocks =3D <&clk HCLK3>, <&clk CAN0_GATE>;
> +			clock-names =3D "hclk", "cclk";
> +			bosch,mram-cfg =3D <0x0 4 4 32 32 32 8 8>;
> +			status =3D "disabled";
> +		};

[Severity: Medium]
Should this node include the hardware resets property (e.g.,
resets =3D <&sys MA35D1_RESET_CANFD0>;)?

Without the hardware reset line, the bosch,m_can driver cannot perform a
hardware reset of the CAN controllers during probe or interface toggles.
It must rely solely on software initialization, which can fail to fully
recover the controller if the bootloader or a prior crashed state left
the hardware in an unpredictable state.

This omission pattern is identically repeated across the newly added can1,
can2, and can3 nodes below.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908014526.4133=
99-1-zychennvt@gmail.com?part=3D1
