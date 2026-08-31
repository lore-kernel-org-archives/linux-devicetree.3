Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10403C378D
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168630; cv=none; b=fva85E2BWMCy7ubFK0fhxfe4Aq7utH89TkZe0+1pWLZTl5Bv80hY0yOHJrcY2NHbq7R0RAXS32vpQ3Xn4vliqk++SAIemnu4/WJ2q0rP/TWEcILI+tOpABzeiEPAEGFtL2e8aZH7aBCvGwjEP80siNrQCxIi8ADWl5OXiY5H8VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168630; c=relaxed/simple;
	bh=y6QMxP1YCiDErKVpZEK0q5/BaYmIDFyD7aabeI6G/Cs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hk+//p7vz4MBbHhNt9JBrJ8cr88YRSOIB7abSXjWsaNaNEHKGaGHNANdLgqDybmrhZn9kd/dYrHXyhGIkBC0UsTGPNIH5OfPeiKJu/AcH9qx+Y9tLefjCfgkySo3FHLs1IB4TkX7z83k1iHIkOgiN9mNiZN8e40M2ys3tuT2u64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icuu0iM+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icuu0iM+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A351F000E9;
	Mon, 31 Aug 2026 09:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788168629;
	bh=DG5sG2nlhRu4zo1RalgmLSzKMsXLGrbGwogCbP8DB3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=icuu0iM+Uv1hXEM/j0nsA2N28dJhoC1mLG6KsdVwGvnYyZ2jAHppHQpwAmVnMeG+w
	 bNel82RJOJu6XNi1vyYvJnijuUHGtJqi674MupZVTR8X6Kz3+BMH5oYSEwcZlKDLCU
	 Dvf2sF9Y5qmVrEK+dEbEeALQcXmKpsx4z7jnelFQeppo6xiNciDJ/Bb59CDzW2lwPi
	 mY2+6Lr3D9APtVStEK3xrQk05g8hZVIZNVTGLEiPQcBux2wNSokmLLjuqgI5QsHLz9
	 0eHA8dkCHl0dRXWxgPafxHBdSJEnjx8+ldEvq2TCjaKk8FyM3z2oF3rIZeAwDiM9GQ
	 8DENaZSOtX3IQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for
 HDMI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260831-topic-sm8x50-next-hdk-i2s-v4-1-a224aa073f9d@linaro.org>
References: <20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org>
 <20260831-topic-sm8x50-next-hdk-i2s-v4-1-a224aa073f9d@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 09:30:28 +0000
Message-Id: <20260831093029.08A351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The SoC I2S and MCLK pin configurations are improperly assigned =
to the external I2C HDMI bridge (`lt9611_codec`) node.
--

commit 1b83d3e4ad09bc9890002381b80f159a3782e66d
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI

This commit adds the necessary device tree nodes to configure the I2S
interface to output audio via the DSI HDMI bridge. It updates the
external lt9611uxc bridge node and links the primary MI2S DAI.

> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8450-hdk.dts
> index 4ade28f40cae0..9b55d17869b49 100644
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

[Severity: Medium]
Should the SoC's I2S and MCLK pin configurations be assigned to the external
lt9611uxc HDMI bridge node?

Since the lt9611uxc is an external I2C display bridge rather than the SoC's
LPASS I2S interface, assigning the audio pinmux states here means the pins
are permanently configured when the display bridge probes. This bypasses the
SoC's audio controller (like the q6apmbedai CPU DAI or sound node),
preventing it from managing its own pins' power states when audio is inacti=
ve.

Could these audio pinctrl states be moved to the sound card node or its
relevant sub-node instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-topic-sm8x=
50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org?part=3D1
