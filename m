Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DACA24CEEA
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778726902; cv=none; b=hqBNdbBppt+IZwmM4LoFR8oE4MOHdgUfBIXBqYZ8Mg3dwXNi/iNPXefuFSIdTK1ejCujQlC+y8pTPMhmek7z6S7fnwr6lORLiho4WX6eZ6yJq9DNHJgFgBiDR/fGoduV8OTPcjX5Ac02qVD3Rn9b5YcPi1msv1uO76vYx4gpXvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778726902; c=relaxed/simple;
	bh=MNjjwkLdImsRVYdfsoGsAcFv/SQRqNXQym16nOArv38=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DkyCnMmbi2LJGoIEU1YXkoscdIOTrB+WE/62FCHKRTcEx27vfq37Te/eA0PgsBdlnMgB2+QHcHkrXpM0on1Z0k5Wt+t+pDxYP9EWfB2zeOaj9O2mT+apUIvt0U+1noXcbAz4jMBoVD9hZT7qBxwX3mLCO2urrmo/mP5WKg5YV8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flgTfiZK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flgTfiZK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B185BC2BCB3;
	Thu, 14 May 2026 02:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778726902;
	bh=MNjjwkLdImsRVYdfsoGsAcFv/SQRqNXQym16nOArv38=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=flgTfiZKnnDgeazDxy57TcnwHwghRmqa86/6fXvAwtdk8UT3Ld7p9amSLnBnssMzc
	 861O6Hl1KiH1s+cb9CSUSIt0/HJyu2O2mkqVOnD/ahVQVM/6mb95PxpZrmZuweCKsu
	 omzvPuTAUzbDmwUXkymIXhpY4NexKyx8d6bBiq/Ip1yoSzhYiDXNQch0PZUasYCGpH
	 A7aXgkXyp89OM389zAgak+51geE6c/ZxjthN4ETiPbw4ssuN7V1zwqIM9ILV0t5Gw+
	 7B+rOq3QifIiigzj7Q+dJoHsAwdyklh0W8NJUZ3yiHUkOekB9W9CCsAQYbSTfPseuC
	 kH+7dngCKkb0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/3] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260513-wdt_reset_reason-v10-3-cebda08ab1ef@oss.qualcomm.com>
References: <20260513-wdt_reset_reason-v10-3-cebda08ab1ef@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 02:48:21 +0000
Message-Id: <20260514024821.B185BC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Device Tree binding schema violation for the watchdog node.
- [Medium] Missing watchdog driver implementation and commit message mismat=
ch.
--

commit 552b829d163556b75c4f936455d4ccee76a98307
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

arm64: dts: qcom: ipq5424: add support to get watchdog bootstatus from IMEM

This commit adds an "sram" property to the watchdog node in the IPQ5424
device tree and defines a new restart_reason node. The commit message
states this allows the watchdog driver to retrieve the system restart
reason from IMEM.

> Parse this information in the watchdog driver and update the bootstatus
> sysFS if the restart was triggered by a watchdog timeout.

The commit message mentions parsing this information in the watchdog
driver, but the patch only contains device tree changes. Should this
commit also include the modifications to the watchdog driver code, or
are those changes being introduced in a separate patch?

> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5424.dtsi
> index 9b8410e326290..33ff00990513c 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -624,6 +624,7 @@ watchdog@f410000 {
>  			reg =3D <0 0x0f410000 0 0x1000>;
>  			interrupts =3D <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
>  			clocks =3D <&sleep_clk>;
> +			sram =3D <&restart_reason>;
>  		};

Will this new property cause device tree validation (make dtbs_check) to
fail?=20

It looks like the "sram" property might not be documented in the
corresponding device tree binding schema (qcom-wdt.yaml) yet. If the
schema enforces unevaluatedProperties as false, introducing an undocumented
property could trigger a validation error.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-wdt_reset_=
reason-v10-0-cebda08ab1ef@oss.qualcomm.com?part=3D3
