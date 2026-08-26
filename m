Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4783112B2
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787718221; cv=none; b=g7UTlm1V3g0quRzsied+99DyqBpUy6ZiluFbDySf+nt5cSWJ9Y/6LXSqQySkrYYCMwYmpd1OrYRXnk3Lz7pOuRANhCaZrT5gonjQVVOw6IJyiSRylucAE80cPY17tILZkPVkaMaU1AP5ieCRKYioy6I+JMew26rdp82FNL2eBMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787718221; c=relaxed/simple;
	bh=CppuWIMlPDF+1OrV7PYBj0ExU+q3hm0UtDmN2Qg9Vcw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JvRgPVcYbGGapF+MKlM4aQKm5pEsfXLtteh/019F86uqy8lT6AVPRJP/kklAA2N/+cumGSYe8iAQVVOEGUsHt2SH6WUJ06PGITt53J/ZVBImjnoIgpCtg+d2vcaK/dcVLbWD/8iYMVdUG0ZWTU1uws0sKgKm5X0qmgoT5OaNUyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRbuNBBL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRbuNBBL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993FA1F000E9;
	Wed, 26 Aug 2026 04:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787718219;
	bh=qaGmRW1OPshDIWmKsNlMW12ueBXZwjJip7NLbbkBkiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DRbuNBBLNvqEGZ5VkTUgdJpNobcJQ5RylcMl2QnK0fisW0GvH6ILE9rC/ahhckmX8
	 H9JTd3XgxldCU56S7ZHdMH0YbFFqO2m7+enWsG745YK6O+0xcq7sRGo6V/DNL2J45p
	 IWhPibSVXm0lGbyg7S14friqtWkebXI0R8367gQekC5B49uOZ1JBmHDJxXRKhMpXOW
	 J6smwyEaH/XIpny5FC55nREUxB8Y03Ojo7Ty68+6E8/fn/k8lE0H6Rb0COwtSOOb/x
	 9u9gkHyySVNFCB4uYtAlFADDLdHP8GkstnzLjCo+jKKizlUyQPMGmCHKkHv5IYKuKx
	 4evqxT22NIBwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/6] arm64: dts: qcom: Add device tree for Nord
 GearVM variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826041200.528588-3-shengchao.guo@oss.qualcomm.com>
References: <20260826041200.528588-1-shengchao.guo@oss.qualcomm.com>
 <20260826041200.528588-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 04:23:39 +0000
Message-Id: <20260826042339.993FA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] I2C and SPI controllers are incorrectly routed to scmi9 and scmi10=
 instead of scmi11.
--

commit bfc93d984bcdbddc6a89d2c5d9b9eac66944bddd
Author: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord GearVM variant

This commit adds a device tree include for the Nord GearVM variant where a =
VM
controls platform resources as an SCMI server. It defines QUPV3 GENI SE QUP
blocks with I2C, SPI, and UART controllers, intending for them to use SCMI
power and performance domains via scmi11.

> diff --git a/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi b/arch/arm64/boot/=
dts/qcom/nord-gearvm.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi

[ ... ]

> +&i2c0 {
> +	compatible =3D "qcom,sa8797p-geni-i2c",
> +		     "qcom,sa8255p-geni-i2c";
> +	power-domains =3D <&scmi9_pd 0>,
> +			<&scmi9_dvfs 0>;

[Severity: High]
Does this code assign the incorrect SCMI channel for I2C controllers?
The commit message indicates that I2C, SPI, and UART controllers should use
SCMI power and performance domains via scmi11. However, this assigns them
to scmi9 instead.=20

Since the QUPv3 hardware multiplexes I2C, SPI, and UART on the same physical
Serial Engine (SE) blocks, assigning different SCMI channels to different
protocols for the same SE will split the single physical power domain across
multiple logical SCMI channels. This can cause the SE to either fail to pow=
er
on or request the wrong domain.

> +	power-domain-names =3D "power",
> +			     "perf";
> +};

[ ... ]

> +&spi0 {
> +	compatible =3D "qcom,sa8797p-geni-spi",
> +		     "qcom,sa8255p-geni-spi";
> +	power-domains =3D <&scmi10_pd 0>,
> +			<&scmi10_dvfs 0>;

[Severity: High]
Are SPI controllers also routed to the incorrect SCMI channel here?
Similar to the I2C configuration above, assigning SPI to scmi10 instead of
scmi11 contradicts the commit message and splits the SE power domain
management, which could lead to probing failures.

> +	power-domain-names =3D "power",
> +			     "perf";
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826041200.5285=
88-1-shengchao.guo@oss.qualcomm.com?part=3D2
