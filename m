Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28323DCDBD
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116577; cv=none; b=gw5bzZC+xCNj2ZLHSHnFQbfTJg/5PuEsgP/t72jCmxbqxvr8UgNccftqNtvE0+OXz6A3/x65TNlpnivICGwNnbc+OncvuD5AJWpD/LJpu6yFHXO/2uJMiVcQ2B+HF8WkokzJ2mEsHSbnR0nHnfXuTrxyk4285gWjeZjvp1Yrnzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116577; c=relaxed/simple;
	bh=+vmfmvXtqTVnFBR6ySnh8/OnnCIoycHuq314wwE0VN8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N+hsRXFevHqNognrQQKuPvQ821OyZxDH00HpRo7BRR4+GNDG9ZabHYe3s3OoJu1lFtRLK4gYF31mGEk5MmouugIh/6eQLOMY/TgDkQfoUWq7eukw8noA49sVxxRjmSoEBBLqbLrwbv8O5QcjSC77Q1+n8Ei4j68CMYT+alR9yBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYbcollS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYbcollS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0EB1F000FF;
	Fri, 11 Sep 2026 08:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789116575;
	bh=Z3zPBXhBZwF8l6YDJsg9thaKvvDUfxTSxomlsnwLkKY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RYbcollSOeKHeqbkKD/GJZsog92ATPdnARRc/8hL0cbOpPpB/+J3XzcrRyPiQQrH7
	 /0P4VAqthXqeDYX69MEAnUkVmgOwB+f0Gf+27vpVPx4RkElKyvTb7U51ErFlWxYK4W
	 uwvuKn5aRym+T6GIUTN0NZe4jKeB5FlMgEFOe9hmKx1DGnEdM0kZjg9Kfdxho74UtB
	 Z2Ow22jniRP4CwLgrYyK8m/pXOhaIOASZdyYai5DGj6w8pLRmywaJioYDzgT1xMc/X
	 S2RhGN0IUlqKvx+hoAr0S+PdYhLMb+O6JGLgv1Y6d0ZC9PKFtz1/pQoEOMRYAgLuI3
	 BD687AtbNpi+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8994-octagon: Remove
 ad7147_captouch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260911-topic-lumia_drop_captouch-v1-1-6f92f1f3c6d3@oss.qualcomm.com>
References: <20260911-topic-lumia_drop_captouch-v1-1-6f92f1f3c6d3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 08:49:34 +0000
Message-Id: <20260911084935.4F0EB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The pinctrl nodes `grip_default` and `grip_sleep` were left behind =
and are now orphaned after their only consumer was removed.
--

commit 8167d39c59a24f7cde908c6c1d4da051dc5c0ffb
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

arm64: dts: qcom: msm8994-octagon: Remove ad7147_captouch
   =20
This node lacks dt-bindings, producing warnings and is reportedly only
present on prototype hardware. The commit removes it to get rid of the warn=
ings.

> diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/a=
rch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
> index 7ace3540ef0a0..4da448f17133e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
> @@ -377,19 +377,6 @@ &blsp1_uart2 {
>  &blsp2_i2c1 {
>  	status =3D "okay";
> =20
> -	sideinteraction: touch@2c {
> -		compatible =3D "adi,ad7147_captouch";
> -		reg =3D <0x2c>;
> -
> -		pinctrl-names =3D "default", "sleep";
> -		pinctrl-0 =3D <&grip_default>;
> -		pinctrl-1 =3D <&grip_sleep>;

[Severity: Low]
Since this touch node was their only consumer, the grip_default and
grip_sleep pinctrl nodes are now orphaned. Should their definitions
also be removed from the device tree?

> -
> -		interrupts =3D <&tlmm 96 IRQ_TYPE_EDGE_FALLING>;
> -
> -		vcc-supply =3D <&vreg_l18a_2p85>;
> -	};
> -
>  	/*
>  	 * The QPDS-T900/QPDS-T930 is a customized part built for Nokia
>  	 * by Avago. It is very similar to the Avago APDS-9930 with some

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-topic-lumi=
a_drop_captouch-v1-1-6f92f1f3c6d3@oss.qualcomm.com?part=3D1
