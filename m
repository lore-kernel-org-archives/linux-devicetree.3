Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3993E024B
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 21:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789249284; cv=none; b=Spvey0K8rLxJiKFil/1LIP+BaAggmR+gNKbnxTgnVb7wYJf22pMeNZfX0mdT3jZGDaVA6Lo7SdOuVKfnIDtbgf1pAd939EHot5iv/pWzNJZWY3ukktE3MaD4uRwIFSjFjywtTTSDA2GXlACQcWVw4yW4OV90+l4TpDHlPPWdx5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789249284; c=relaxed/simple;
	bh=iNo89XTq937QS5CWxIopXJDNYwrUOr/Ad8MWa/muYf0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Kq5I1QWMZpuoRYzs1vCRT5B8siEPfPo3M8LnDf8huqFcacvdyDndjYjycwVnhkvR1oiImUh+ijnJlSmAP3UyTqCQGyHScj83sEkys8LCtv1g6Ke6rkA7rFOlEfsDDn3CEn0pc6abW51PiD2+7gu+frI6SeJUrKztp6Cq9m3ey9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehV7lENi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehV7lENi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572441F000FF;
	Sat, 12 Sep 2026 21:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789249281;
	bh=S2rmB254+gzmz1CoS/NoF44Lo380e/qAuxHuPW0YSrQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ehV7lENilvd8VrxrUGehoHPxqF4dX6NvMjWfZc4GyVKkEYyHJ4x9U+rwPq0TXKO7l
	 jsPV3mLsVa2Kc0AXu7QvahmsjvFk4N0N7IsrGMhJQInS1oreD09uxOKAj5gTZQgPef
	 0XtUkljXf2/wT7DkKhHszR+XFgTvAQcJTPPXXwVK3WAatbC5UJH8bMVElkGxOSv94S
	 jFeIWPehGNQNBSdSqquaZhX4ICKqDZCwpYHhL5XFosMilI+YaHKjid2RY4joBJIHgY
	 2G6W3Fsf5DEnG2Z6zxhzvxuVZZAQEumtAzp8E18ygWhz8WVfmHrRkBfpU+y+JWe+Kh
	 NMVVmrIjoMfqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: ti: k3-am62p: use ti,am62-mcan
 compatible for m_can devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kendall Willis" <k-willis@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260912-smth-v3-3-6fa661ae5a4c@ti.com>
References: <20260912-smth-v3-0-6fa661ae5a4c@ti.com>
 <20260912-smth-v3-3-6fa661ae5a4c@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 21:41:20 +0000
Message-Id: <20260912214121.572441F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new compatible string 'ti,am62-mcan' is not documented or permi=
tted by the corresponding device tree binding schema.
--

commit c9a5bd5e593b159b3d44f9ab0c75ab2dacec0f49
Author: Kendall Willis <k-willis@ti.com>

arm64: dts: ti: k3-am62p: use ti,am62-mcan compatible for m_can devices

This commit prepends the "ti,am62-mcan" compatible string to the m_can devi=
ces
in the device tree for the AM62p. The new compatible string adds out-of-band
wakeup functionality.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arc=
h/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> index f130c7cb998d7..9e8d9246f6169 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> @@ -883,7 +883,7 @@ eqep2: counter@23220000 {
>  	};
> =20
>  	main_mcan0: can@20701000 {
> -		compatible =3D "bosch,m_can";
> +		compatible =3D "ti,am62-mcan", "bosch,m_can";

[Severity: Low]
Does this change cause make dtbs_check to fail for the main_mcan0 and
main_mcan1 nodes?

Looking at Documentation/devicetree/bindings/net/can/bosch,m_can.yaml, the
schema expects the compatible property to be exactly the constant string:

  compatible:
    const: bosch,m_can

Without updating the device tree binding schema to permit the new
"ti,am62-mcan" string alongside "bosch,m_can", it appears the schema
validation will reject these nodes.

[ ... ]

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch=
/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> index 5288c959f3c1a..3db8b63ef01fe 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> @@ -154,7 +154,7 @@ mcu_rti0: watchdog@4880000 {
>  	};
> =20
>  	mcu_mcan0: can@4e08000 {
> -		compatible =3D "bosch,m_can";
> +		compatible =3D "ti,am62-mcan", "bosch,m_can";

[Severity: Low]
Will this also trigger a dtbs_check validation failure for the mcu_mcan0 and
mcu_mcan1 nodes?

The same schema documentation issue applies here. Is there a missing
prerequisite patch to update the yaml binding?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-smth-v3-0-=
6fa661ae5a4c@ti.com?part=3D3
