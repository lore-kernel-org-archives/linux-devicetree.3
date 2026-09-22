Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBF92EBB84
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790043109; cv=none; b=gRAOGjfFEL1KrMdutLFDXM+0+aKQELJqSoWaJEVZC7INAEyLBS302VofeKYyWJax5SdFIFAB321KN1+95ambarSzDD1fqZJBWrguaPVN6y77NKotMEMKTsXs91agwpln/XEnRt26SN05p8ru7HcfbIDr1oAWYvPILRzlabmb970=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790043109; c=relaxed/simple;
	bh=w4j2R+qX6xvjNsJiQQsMoC1eKM8jshrXG8Seansho1w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iJq5NA30wCQKQLM5XxmvDZLFiZqKW8V3TuFPX3vaEXU6v7rtKwU8wt/WqVGh0xNaYRN/+oqWt4j9njczBEtI+M42tknuaYyvJjayAyFxlkY9XiWmM8qS6MSVyd+jGxZmld2xikgPcjuOAs/W+6LBvcgsYPkugmzgBLZW9BxbNxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qt057/Gm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qt057/Gm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018331F000FF;
	Tue, 22 Sep 2026 02:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790043104;
	bh=a2UXxaKVXF3PxhvW/zzv4A1igv2s9/lx8GcZdRxvh14=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qt057/GmpXJ+riEr7wYy+zKizSElvkDOREE2Oo7tynX8ijvEsKEspqc0Bm3jyYCBt
	 5LfFkRqRLPcy2P97E4L0/C6tbc4QCthQmcAVKbpc0iO+R+eH8mZTniEorT0KPDGnWi
	 3RruUBwJPIw8hfQFNkJrjcOIAny/oxS8lHJC9cThUHosU16tnat9HnA73gS4c6L7Lb
	 xEbcnuYdb2p9hBLz2jN6VV42p/nWevitEh4jEFF7Un339Lh9DQFq6sULbbjNU5XAC8
	 4vjgBRwsmQ7Xh4jNl6s0VKzIHDLlyFygXiubHTiK8DClOrJYk1YFyAuaOH/qyOnIq/
	 JMqYFUuHh83Ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/11] arm64: dts: qcom: sdm670-google: configure analog
 and digital codecs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260922015801.32373-12-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-12-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 02:11:43 +0000
Message-Id: <20260922021144.018331F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: qcom: audio bit clock disguised as AHB interconnect clock
--

commit 31dd52373e653175568a580df559d7dd64860174
Author: Richard Acayan <mailingradian@gmail.com>

arm64: dts: qcom: sdm670-google: configure analog and digital codecs

The SDM660 digital and PM660L analog audio codecs control the headphone
jack on the Pixel 3a. Configure them for sound playback.

> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/ar=
m64/boot/dts/qcom/sdm670-google-common.dtsi
> index 3abde2cbf7462..48aea5d72092c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> @@ -53,6 +53,14 @@ framebuffer: framebuffer@9c000000 {
>  		};
>  	};
> =20
> +	clocks {
> +		int_cdc_bclk: int-cdc-bclk {
> +			compatible =3D "fixed-clock";
> +			#clock-cells =3D <0>;
> +			clock-frequency =3D <1536000>;
> +		};
> +	};
> +

[ ... ]

> @@ -568,6 +617,17 @@ rmi4_f12: rmi4-f12@12 {
>  	};
>  };
> =20
> +&lpass_codec {
> +	clocks =3D <&int_cdc_bclk>,
> +		 <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +	clock-names =3D "ahbix-clk", "mclk";

[Severity: Medium]
Is it semantically correct to model an AHB bus clock as an audio bit clock?

The msm8916-wcd-digital codec driver requests an AHB interconnect clock
("ahbix-clk") for its register space. This patch maps that requirement to
int_cdc_bclk, which is configured above as a 1.536MHz fixed clock (which
corresponds exactly to a 48kHz audio BCLK).

While this allows the driver to probe successfully because a dummy fixed-cl=
ock
returns 0 on clk_prepare_enable(), it misrepresents the hardware layout.

If the true AHB clock is abstracted, always-on, or managed elsewhere, shoul=
dn't
it be mapped to the board's XO or a generic system clock rather than a fake=
 bit
clock?

> +
> +	assigned-clocks =3D <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBU=
TE_COUPLE_NO>;
> +	assigned-clock-rates =3D <9600000>;
> +
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922015801.3237=
3-1-mailingradian@gmail.com?part=3D11
