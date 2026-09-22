Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFB153CA9A
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077356; cv=none; b=VGY7nW8ZGfGd2irtieouqddj3jG4PbCAzJexSXxgKSmHZ0v4fk+4BfrxnYYyzhaR0PPI4IbljEmy4kizeKfMvFuMgq26iRDgyE6NK53RfogbyFDcbz771avw/CZPvLmdoLOso4u5AOC3XeiGtEoToYQK5+SS+n2hC6YwTgV59C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077356; c=relaxed/simple;
	bh=I/Xq/Mws/YHAn8p96IMU2pD2ucG0GXJcED7hpq65eCw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UATu2aXYxvijde0xTu28iODx8KFKwSwgxwFJ/dkU62NuN79RX/HQ3FXt0ZwLBlWE63fx4SfgGcgjkdHLOoz3TGngevskdcr2fg0vaqO9f3EXDB36iaubrBvdIVlp09lkkd4Nd/binfpJJXmFEJGx+8vXn/hGIbDR9uPrcIMrcCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOc92hCM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOc92hCM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CC21F000FF;
	Tue, 22 Sep 2026 11:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790077354;
	bh=xkIDu3HEbbADN83g8/L4jM+viaVTVl57eHkFjJdR2nM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AOc92hCMgJy+DzGl3Gk0T4lT5VfXIcNHMWyCAyNAZO1kOGuRjXIpOWNtcdBq51AVH
	 6XRruyNxoEf3M24Z6rcDf1iDX0+nt0w7z2V4AlvmMebSMQYDVjM4poHGtn+PAySkxC
	 G/ytP7TbyPZKIKRc5cOvslCfsnu2rDym/Bp+55Wm422ldhOPaXZ3EBZKlZyICuH8Sa
	 IpC5/gZOYKsli45BqCZlJX0ZNiBnxptCe7oVFcy0QOISs4GpXl15YfL/beEr6MRle0
	 Th+VivIqqvZdEinHXQKQAPF8cZCMRMcuKWF+0GnfN4p9crACzlCFFhwJlxv970IgoM
	 QSWoLXe7S6PcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: Add initial Valve Deckard
 devicetree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260922-topic-sm8650-deckard-initial-dt-v1-2-c25e7759d04a@linaro.org>
References: <20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org>
 <20260922-topic-sm8650-deckard-initial-dt-v1-2-c25e7759d04a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 11:42:34 +0000
Message-Id: <20260922114234.92CC21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: incorrect regulator supply names for vishay,vcnl4040
--

commit 04ec091c4806a5aef627fbe5d3809fe2eef39d6e
Author: Neil Armstrong <neil.armstrong@linaro.org>
arm64: dts: qcom: sm8650: Add initial Valve Deckard devicetree

This commit adds the initial devicetree for the Valve "Steam Frame" (codena=
me
Deckard), a VR headset based on the Snapdragon 8 Gen 3 SoC. It includes
definitions for reserved memory, regulators, GPIOs, UFS storage, USB,
Wi-Fi/Bluetooth, and I2C peripherals.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm=
64/boot/dts/qcom/sm8650-valve-deckard.dts
> new file mode 100644
> index 0000000000000..cd801359d2b57
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts

[ ... ]

> +	light-sensor@60 {
> +		compatible =3D "vishay,vcnl4040";
> +		reg =3D <0x60>;
> +
> +		vin0-supply =3D <&vreg_l2b_3p0>;
> +		vin1-supply =3D <&vreg_l15b_1p8>;

[Severity: Medium]
Will the vcnl4000 driver be able to properly find and enable these regulato=
rs?

The driver expects the regulators to be named vdd, vio, and vled, but here
they are provided as vin0-supply and vin1-supply. Because they are not bound
to the names the driver expects, they might remain off or get disabled by a
late initcall, potentially causing the sensor to fail probing or I2C
communication.

> +
> +		proximity-near-level =3D <220>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-topic-sm86=
50-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org?part=3D2
