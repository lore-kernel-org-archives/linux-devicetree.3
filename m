Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4181D3E315E
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 07:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916768; cv=none; b=CPf8Y+e8M29TcmEB3lfrExwC8aAs5VclMd3Y15NOal2bKwWAmPeDmLSxY7c1Uo5H1Puou5nQng0KyVnh9WvHFgvUp65K8nbZL7UxLmFFxS6OirSqPYmxE9PyHWaPAKO/p5H2mPkGjzONqAkJE28b0NUV/slfUukVf61MteDQ820=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916768; c=relaxed/simple;
	bh=bqqWD2VBVAqPMZcR4rJuGxz94tAYtd2QS0fBA1uZVX4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OQyG4DDO0fCr88mhzyYbmGMw1kIobK9MbbF0aWTCa1RnGvUUD0c74cz7BJJbz/TDa9Yu+Jxar4Qk8AKb+CAhDr0S7XBkObM2i4YP7EfL9TFmrORgFosRi69px7A5QYUKS1NIdlHi7HqPaYdn/MkSrprq7UGpkg2jbn6S4K3xMSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KymY4PWO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KymY4PWO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09111F000E9;
	Wed,  5 Aug 2026 07:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785916766;
	bh=fdnQCh5rggqDrr5Y8HifOQjprxrhwbAz/4tt/3Me7YU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KymY4PWOiESAaVWag1Z/egOPiyqhDNYuVtH5JI2fDnK9B5d+FfFiNVkT/eQEDxhLE
	 AqwYD3v/bvwt8Ku11Sqw2R+9sV2eJPQB9oAKXFMP1GLb9NinodYC8E/AYLbkWsXdYZ
	 156PLx9eW0ow/4TQovjQ4uyH92NSVOxtV/TyCdQzY5qqx23tMm8S41Cnv7YjueBz39
	 5IwYWdMqknVx+S+b8lIWlsTEb1I0HoPS3vjnNa7ANryKFLUyTcvY8pFVBXPgNXWfCq
	 p8WAHrC+qRJRdUDLfQSsF3A7Mfb8VQkR/yH8+0HnffOUOqcAkEWLqwpIhJTH8t27Bs
	 XuRpsoHmMwR6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for
 HDMI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-topic-sm8x50-next-hdk-i2s-v3-1-07a6483c430f@linaro.org>
References: <20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org>
 <20260805-topic-sm8x50-next-hdk-i2s-v3-1-07a6483c430f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 07:59:25 +0000
Message-Id: <20260805075925.D09111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device Tree topological violation: SoC I2S and MCLK pinctrl states =
are incorrectly assigned to an external I2C codec node.
--

--- Patch [1]: [PATCH v3 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for =
HDMI ---
commit 1e06799a0230632b985134cd0731cc4a2e53b31d
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI

This commit adds the necessary Device Tree nodes and configurations to enab=
le
I2S audio output via the DSI HDMI bridge on the SM8450 HDK. It defines the
audio clock and pin configurations, links the DAI components, and assigns
the pinctrl states to the HDMI bridge node.

> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8450-hdk.dts
> index b37998cd9a2c3..6bc2e8630dc37 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -665,7 +665,12 @@ lt9611_codec: hdmi-bridge@2b {
>  		vcc-supply =3D <&lt9611_3v3>;
> =20
>  		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&lt9611_irq_pin &lt9611_rst_pin>;
> +		pinctrl-0 =3D <&lt9611_irq_pin>,
> +			    <&lt9611_rst_pin>,
> +			    <&i2s0_default_state>,
> +			    <&audio_mclk0_default_state>;

[Severity: Low]
Are the SoC's I2S and MCLK pinctrl states being assigned to the correct
node here?

These pins belong to the host SoC and are driven by its audio controller,
rather than the external LT9611 HDMI bridge. Assigning the SoC's pin
configuration to the external bridge's node makes the codec driver
responsible for configuring the host SoC's hardware, which seems to cross
topological boundaries in the Device Tree.

Should these pins be assigned to the sound card node or the CPU DAI node
instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-topic-sm8x=
50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org?part=3D1
