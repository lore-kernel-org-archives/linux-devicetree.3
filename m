Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E6C436BD9
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110183; cv=none; b=tKf7kWsOWlxkK6kzZCCgEtPiJ5H/WHIYYy/ctFN9mqJqa6owq0ITin/QbkCLTsVOitVllNWU+xr/uZxixTRUFv8IhGr1EW33VABudw5lVNlN3xIr0/VGIn1p+uCBwIFJT2hMYn057Oof4JW29luDxhCNpC7obmccEJDojrQd5Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110183; c=relaxed/simple;
	bh=gTzmPSizWGmSEPzxm9tgmGe85smrm/dOl3SrZubj8VU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uVm8UTF97ZhbESP5LG58CtUA6Iwcx3mroxvtB7PbMgH/pPgo2uJ1dOHJEPl37/xNdurlWas89gUDiHrk+QdtBSw1tLPD2l3wWdwv+fudxFjwi6nFAgGy/2knHGgghgHp8sFcvrFAG5pA+Kl0mPX5IYIOYuA+oEfIniK7z+2Atf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5lprhc6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5lprhc6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0321F000FF;
	Fri, 11 Sep 2026 07:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789110170;
	bh=8gJW/trJUI3V3v7P2ds9+2X1MWF39wXtNd1Lmxt3PjQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A5lprhc66Qc611wX53yPZapT8+CHRQBqcklWvH+aQ8OmSKGCSIE0YFJR0Rmbs4NUw
	 DNxjhVbghd+U9uDLb9oXPc4Uqk5oD4/7xIXDWRK1khZ90DAcspUgMPhMT2WfkYbrqd
	 iLiDuL16j5JHhn/xRu6TNI+02T3Sc1iXsR+El2/I3XLPvDE4icimBjDGlrVm/qbzkJ
	 frNCoCKXoYD8izF3zOp20g0KoUmQeheoja3YMU9KAWe+NbfgPTiBTM7cYtDn18c0D1
	 du605rLQNEsrRKsDsFvOJNYJPc5p9aL5qjS75SItntrYaeTOvYn4bVuUD9qRRSX6AB
	 yEpp2MpVk+pxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] arm64: dts: qcom: monaco: Add t-power-on-us
 property for PCIe root ports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260911-t_pwr_on-v1-3-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
 <20260911-t_pwr_on-v1-3-c9eee197d082@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 07:02:50 +0000
Message-Id: <20260911070250.8C0321F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The 't-power-on-us' property is added to the device tree but is not=
 documented in any DT binding schema, which will cause dtbs_check schema va=
lidation errors.
--

commit 9b34f8b26e1f1d145e5d0352099be4384e076f5b
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: monaco: Add t-power-on-us property for PCIe root ports

This commit adds the t-power-on-us property to the PCIe root ports in the
Monaco device tree. The property is intended to correctly program the
T_POWER_ON value during host initialization to prevent improper L1.2 exit
behavior.

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index cfe39f923224f..d9c3669b5e1b7 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -2402,6 +2402,8 @@ pcieport0: pcie@0 {
>  				#size-cells =3D <2>;
>  				ranges;
>  				phys =3D <&pcie0_phy>;
> +
> +				t-power-on-us =3D <80>;

[Severity: Low]
Is there a corresponding device tree binding schema update for this propert=
y?=20

Since t-power-on-us is not currently documented in the schema, it looks lik=
e=20
this addition will trigger make dtbs_check validation errors when=20
qcom,pcie-common.yaml enforces unevaluatedProperties: false on the pcie@=20
child nodes.

>  			};
>  		};
> =20
> @@ -2593,6 +2595,8 @@ pcieport1: pcie@0 {
>  				#size-cells =3D <2>;
>  				ranges;
>  				phys =3D <&pcie1_phy>;
> +
> +				t-power-on-us =3D <80>;
>  			};
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-t_pwr_on-v=
1-0-c9eee197d082@oss.qualcomm.com?part=3D3
