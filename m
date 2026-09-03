Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848F73DFC8F
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 07:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421005; cv=none; b=O4IJuLjV55ErMSSi0nLku/BqUdEgWWASZZqdwqCw4fGNjCdBuZMQyduZV9gyIhlmQqVu8Js7ePX1uFJ8tBUFuBE9XSYYpoApxknkFOqCQILEIZJGv9bCXxrfC9KCGuUN9vW/5FY35rpX9vdmOHenUyKLo3rgRbw9gp9VKBL0JDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421005; c=relaxed/simple;
	bh=SX8dnvqNSY1Zx5QjGDxCaNrjVddLQgRZ8eMrdy1rcl4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EDw/+m/AHWoO7VfVXuvVTMx7dRmCDiXpq7QfQaN15bcnE9KwuFpNC8sSrIZp7lMznO313sVhTq7DAnxahK+cmv2qvw34zB/WYdPux/a0kFVVQ0l4LttnCMXYojJY6UQihQTmVI1VDL/zjoH0RAz17/5Q871bPCMb9eCe+g7E4ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKn5KEp9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bKn5KEp9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92A71F000E9;
	Thu,  3 Sep 2026 07:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788421004;
	bh=EPTzsvt7zknDgykhy6/SS/ByprLd9bK8MMFBN4TQRm0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bKn5KEp9EzN8B4UrUmbpK8irSeGU+DyIO7Lxv+228AALpH4ZTSkXcUuHmcxi4kJFO
	 fSYxdIr25errdX75xOpBPr8h1VrpUVk6u7cOeOM4cCBUSteF9LCdgrny1afZB0CgaE
	 pHLysGFXQAX/TWWpIUlCuvnWLLrFbRF7V+mc5L6YRJ5BmYOzZ2GYyd9mhucwzsxW5N
	 oGpxEPm3Y6u7UsscidtLHieygYJburKHzaz5rcFjo+FTtxAui8M/C/KRbZF04v6mQ9
	 qAO2Yf4ydRYa4ll2N9c/ZWJiLX0vrDbQPNYS2LmBdjnHNc+ZD7CyGDfFrzBljgqHup
	 85LrNvrqh4NKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
Reply-To: sashiko-reviews@lists.linux.dev
To: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260903-mibox4-dt-v1-2-f29f1e828ca3@stu.hqu.edu.cn>
References: <20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v1-2-f29f1e828ca3@stu.hqu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 07:36:43 +0000
Message-Id: <20260903073643.B92A71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The Mali GPU interrupt configuration incorrectly specifies 10 in=
terrupts (Mali-450 MP3 configuration) instead of 8, conflicting with the S9=
05L SoC's Mali-450 MP2 hardware.
--

commit 8f654a48f8eb2e8df4804fdee2520ed242bedb16
Author: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>

arm64: dts: amlogic: add Xiaomi Mi Box 4 support

Add initial device tree support for the Xiaomi Mi Box 4 (MDZ-21-AA),
based on the Amlogic S905L SoC, enabling on-board peripherals.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxlx-mibox4.dts b/arch/arm=
64/boot/dts/amlogic/meson-gxlx-mibox4.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxlx-mibox4.dts

[ ... ]

> +&apb {
> +	mali: gpu@c0000 {
> +		interrupts =3D <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names =3D "gp", "gpmmu", "pp", "pmu",
> +			"pp0", "ppmmu0", "pp1", "ppmmu1",
> +			"pp2", "ppmmu2";

[Severity: Medium]
Is this interrupt configuration correct for the S905L SoC?

The S905L contains a Mali-450 MP2 GPU, but this specifies 10 interrupts
which targets a Mali-450 MP3 configuration (including pp2 and ppmmu2).

By providing interrupts for the non-existent pp2 and ppmmu2 cores, could
this cause the Lima GPU driver to mistakenly attempt initialization of
missing IP blocks? This might result in hardware initialization timeouts,
spurious hardware reset errors in the kernel log, or potentially trigger
a fatal bus error (SError) depending on how the SoC handles unmapped APB
reads.

> +	};
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-mibox4-dt-=
v1-0-f29f1e828ca3@stu.hqu.edu.cn?part=3D2
