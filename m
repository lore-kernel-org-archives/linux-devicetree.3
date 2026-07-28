Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F8141B373
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229587; cv=none; b=BeK7FdCk/kuemUipUT5PPF7nKF+n+gPNZ3UizGy5g8Vb/FGcLSOmWRxv6hPKT3V5fgyWvB4NN4aGeOfE/Fnmo9SdmMpSlmO24JbebtZJWGekDvxaJkho9xWCOTGVTcodjjipl2lfMF/kq0J41o2fw7vRoNmYKM667W28meFzqv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229587; c=relaxed/simple;
	bh=glJuagDOuh1qt1/7VIDttqJaJgYawOJ5K7gggNob5dM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LEt/OwEzmmjP4ygDmz2JN4JC8Ipjk9RIJ4yW5/bOj8AUbg1AWRMfYEVnzbX9bCzgfktvIM5DE88WlTZAj2faQoZy5L2jYcED8TfKgssps+QfaS0IDM27P2tfok2hbFCqXkNziIwHyT3swLhEoA1AoskYGMyfAKVEgEFEaMNcoXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ctS5eDko; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ctS5eDko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D781F00A3A;
	Tue, 28 Jul 2026 09:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785229585;
	bh=3ZqrKIbX9eXFGzle2Kn6R+D4PG2NrD4E8ueAgdDrtzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ctS5eDkoxdkbzfmUhkjg/KuS/lzoAjuRy9yTblBEOaJmzI+65LcTw1lVWZfCZUkEZ
	 Uv0nfYWVgDGrMrz15pZBbpalEkej4tE7P1e73knZO7gAJCB57x63DN7LuAum6TGZrW
	 C/4Gbt/Z3Z01wq/BbsMpUVR5KdzWysJCQ6Tjb7hIEGFqscBgOXzqLpVG9bCMHbiR9E
	 c5bkqjivbQYtn8YzId5dnmuSBvLUy9CfkzAYJuZp7+QTQIKw28l8Qm6kt+oNyDu3Al
	 g0U3jzZl20t8uXaqOO2P1USJ4zpsR1vOCAj62AGkVgFKWq3sIPICbdUCP3OUqamwmO
	 hf1nayeEV8EpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728-topic-sm8x50-next-hdk-i2s-v1-4-2393a0fe4aa9@linaro.org>
References: <20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org>
 <20260728-topic-sm8x50-next-hdk-i2s-v1-4-2393a0fe4aa9@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:06:25 +0000
Message-Id: <20260728090625.94D781F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Devicetree unit address mismatch in the newly added `dai@16` node.
--

--- Patch [4]: [PATCH 4/4] arm64: dts: qcom: sm8650-hdk: Enable I2S for HDM=
I ---
commit 26369b0d894fd5b99316fa96e29c974138026f04
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI

This commit adds the necessary nodes to configure the I2S interface
for outputting audio via the DSI HDMI bridge.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8650-hdk.dts
> index eabc828c05b4c..69327c4857e1f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts

[ ... ]

> @@ -1072,6 +1092,19 @@ &pon_resin {
>  	status =3D "okay";
>  };
> =20
> +&q6apmbedai {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	dai@16 {
> +		reg =3D <PRIMARY_MI2S_RX>;

[Severity: Low]
Should the unit address match the hex value of the reg property?
PRIMARY_MI2S_RX resolves to 16 in decimal, which is 0x10 in hex. Since
devicetree unit addresses are required to be formatted as lowercase
hexadecimal without a leading 0x, shouldn't this node be named dai@10
to avoid a unit_address_mismatch compilation warning?

> +		clocks =3D <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO=
>,
> +			 <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		clock-names =3D "mclk",
> +			      "bclk";
> +	};
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-topic-sm8x=
50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org?part=3D4
