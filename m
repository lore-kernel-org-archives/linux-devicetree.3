Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C164A233947
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229543; cv=none; b=TJz1P2Vw5zQxOm1+E1Z2SoqQVU7lP2Q3auy/oNGdV6Dqge+fQ6nlu5n2luAJXxq/E+y2x64PuLRORtP1heK3TNyHYxKUkATsjYQZ+J5i48OVwIJ6s2MOMbM1eMCsCXpDR0e8NjXkAcJBpWtWjkF2LFyfMd3L4cm+v+EUIAJSwO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229543; c=relaxed/simple;
	bh=oNoqLa2dz+en7TfX/v1rewTXNWhYLmZEHjcj1XMMZsw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DVaGG9fXe0yOa4I9dvRTwKPSqCzuq33ma+ePIx9NNx4XVOrSgXRTArM8RMmMO3j5ZnI4N56gNroEpPnDPK1eM3G85bwq83F04p2Cl7yxGm4HINfEJWslNMcxrB0ywwlPG7RHVKCfjHjNceBE8iZtcCKZr5xDLpgsqHoHphR5tD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOxBPvhl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOxBPvhl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249E91F000E9;
	Tue, 28 Jul 2026 09:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785229542;
	bh=z9iCQT/PqYqgRr7SIbomMjdqBpHJxBwIMxW/wRoOF98=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aOxBPvhly4rNYuTSDIj/igcjEtiR32o9ly9JH7PRV3bm/a2pg9tHYCliXatxSyfKC
	 MZVeMtbybqpPWDU4Go4anZEB0zTtuXE3Tj0Sr8oOAL9JQf5lbZllSbJfPfTkX5y+hn
	 BTncufMkIFbQkJMCn42OxKysCWeOL8QcIbxL+o1KXXMSTjJP3+jpxMmo1HeC2E6RQw
	 MV1Ip5mJy1aaVsLNPFXodQsDOPWTP1LlHD654UCovPcDkUL/nM0Ba6KAuNKcmZEQZH
	 yoLphw8aQJXeAv+QZz5HtC1NH5BIn5UCJx0kIew0jW9aDs6F1VHKderfRYWRp8DrYl
	 7bd2tvr9CXVJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728-topic-sm8x50-next-hdk-i2s-v1-3-2393a0fe4aa9@linaro.org>
References: <20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org>
 <20260728-topic-sm8x50-next-hdk-i2s-v1-3-2393a0fe4aa9@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:05:41 +0000
Message-Id: <20260728090542.249E91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added `dai@16` node violates both the Device Tree Specifi=
cation for unit-address formatting and the `qcom,q6apm-lpass-dais.yaml` sch=
ema for the `clock-names` array order.
--

--- Patch [3]: [PATCH 3/4] arm64: dts: qcom: sm8550-hdk: Enable I2S for HDM=
I ---
commit 2cee2013f7677aa1232b3d7385d6857db3191e25
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8550-hdk.dts
> index ee13e6136a825..87792fbf3323f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts

[ ... ]

> @@ -1144,6 +1165,19 @@ pmk8550_sleep_clk: sleep-clk-state {
>  	};
>  };
> =20
> +&q6apmbedai {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	dai@16 {
> +		reg =3D <PRIMARY_MI2S_RX>;
> +		clocks =3D <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO=
>,
> +			 <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		clock-names =3D "mclk",
> +			      "bclk";

[Severity: Low]
Should this unit address be formatted as hex (dai@10) instead of decimal to
avoid dtc unit_address_vs_reg warnings, since PRIMARY_MI2S_RX is 16 (0x10)?

Also, does the clock-names array order match the qcom,q6apm-lpass-dais.yaml
schema expectations? It appears the schema expects mclk as the second item,
rather than the first, which might trigger a validation failure during
make dtbs_check.

> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-topic-sm8x=
50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org?part=3D3
