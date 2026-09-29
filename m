Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D9F3DDAED
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662274; cv=none; b=SU51bHmDD5bt2Csr03xoMHXbE6eLBxtru1DwBn8SRFrxEEtyErMBaBCkyIEvKYacVN0MQydnX6DDNebnz4LAVELt7HsBOmjWxOFXNRPnZJQWrED0NvlZoSZduofSndkHn1g5Xsu8vSYCO06/ZA71fqws1Zb91NTUuZFm15hhL7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662274; c=relaxed/simple;
	bh=YxaoLLOFgAaT0RYI1azT3JhALWMUPvLx8tXeRiDUgnU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FYYS0gS3ykQbTkVt2Ar8PtdNG3W3+W1UMAgUrKPYwDDXi8E9puJYmWQiLU7w+atsHNZLAkSNHpWmS0NqJ1C2V/ZmMrKlhxoTIH0OfmDEdlb/mQpi4Zx2qtmh3FuUs3xTGcjko0v0bQWuP2kynVxkpxDsf6AL2Devjl4TI9Je7fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8k/ylpl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8k/ylpl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F2C1F000FF;
	Tue, 29 Sep 2026 06:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790662272;
	bh=mMe2lcCn1iOVvlO6YTwPLyl+ltNQj99ploKnE7D6LYs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f8k/ylplZcR7AkfYZyOlIDl6Jle2hA3OXfii0VpOXSLLdtDGBhRimZZM9OoGXTsy+
	 HxDNC8U/AEkyW8vEFpEAtpuS6fX+K2H5/6L0abr6pfxXoqML7uAid9ToKyfyEgEknG
	 HprRc9bSVif38676MooI4slByBsKR6UedzZcblDYYS8pqF3E7EDLT2jU2E+alKTKJQ
	 RE1lXlUigIGZ0gNidp3UyKjCpRC1C5Xrs2ewXBwPjUQUUxR4twZZblRk6U7SXuiTEP
	 bfLsfuqLAupErJx6EUpj41nSb9QRYhjGpbJ7yeOAUya1emDpSNaFuZzgFYJ+kF1hm/
	 DLd8H6RNWNWnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 09/11] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, olteanv@gmail.com
In-Reply-To: <20260928-kaanapali-camss-v17-9-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-9-dcf3fd37f76c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 06:11:11 +0000
Message-Id: <20260929061112.51F2C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: missing #phy-cells in CSIPHY nodes breaks phy lookup
--

commit 0d5dc943d2ac26c65efdf11a56970db1bd7ff6f9
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions

This commit adds device tree nodes for the CAMSS and CSIPHY blocks on the
Kaanapali platform. These definitions enable camera pipelines to be configu=
red
and used by board-specific device trees.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 3e63e62251089..7a80438bde570 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi

[ ... ]

> @@ -3595,6 +3596,307 @@ usb_dp_qmpphy_dp_in: endpoint {
>  			};
>  		};
> =20
> +		camss: isp@9253000 {

[ ... ]

> +		csiphy0: phy@9523000 {
> +			compatible =3D "qcom,kaanapali-csi2-phy";
> +			reg =3D <0x0 0x09523000 0x0 0x2000>;

[Severity: Medium]
Does this node need a #phy-cells property? The generic PHY framework requir=
es
this for consumers to successfully probe.

The qcom,kaanapali-csi2-phy compatible binds to a generic PHY provider via
devm_of_phy_provider_register(dev, of_phy_simple_xlate). When a consumer
calls phy_get(), the PHY core invokes of_parse_phandle_with_args() to parse
the reference.

Without #phy-cells =3D <0>; in this and the other csiphy nodes (csiphy0 thr=
ough
csiphy5) in arch/arm64/boot/dts/qcom/kaanapali.dtsi, the translation will f=
ail,
leaving the consumer devices non-functional.

> +
> +			clocks =3D <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-kaanapali-=
camss-v17-0-dcf3fd37f76c@oss.qualcomm.com?part=3D9
