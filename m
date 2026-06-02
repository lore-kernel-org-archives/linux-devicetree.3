Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58AB3C8738
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 09:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780390872; cv=none; b=OAkGeAF2LXt96a62ros1I0xikUQ5CqkCCXNV9sRpTScIStBtgtxwbDurkpsSX3kIg45rgmVTvTmtoTeJfS1Oc6G6LomDnE3jCeN/Jhd+xrF0EgQyzjvphz6mOmUMG5HVfRIYJQqH1LGwW5OP0oGEl+bfrLolVPR4VO4/zg6Kbpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780390872; c=relaxed/simple;
	bh=4RtPJV9gaE9S/iRt30CN12Cth/0BShALIZXUyQstfzs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OcttsHZnTrNu7DduiU/znRGvF33Dmshd/HxPyky1bbQO/D354K4IY+uZwnbnAlLNMQgW8ZQwigRGLQ2LNwYRaFhzwFsChoe45E8zPNrlvByxTYvUcot/N0LKsaCju3ifNxOr1xeVpJlmWNqs+ddBq+r+vEDiq3//QA2YoeFGSvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j994N2vV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j994N2vV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790E11F00893;
	Tue,  2 Jun 2026 09:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780390871;
	bh=J91By/rOr/v78v+YXqPYjvQCbAIYN5/y429iUuH+Rd4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j994N2vV44BsosrRFGsE/dCpktl8flEVNH+wAkxJkgbDBDPhl70AkPccFvT+bIOZP
	 U9TurGsetIi1/G3piremAJB2Xoo3+jWwURli/vB2BFy7DqwhIGZ6KkfKtI0b8XS9FH
	 oi/kzS/yS/Iy5QmjB1T/6dy45f7LcquGrxdEmFQhwr/IWVCk8OymsWuz7GcNkzQf+j
	 LetKaC3EM+AhCWK8sNL1oiQuf4SSy2NxH1e3W768iCD9vFKpwnV665m3QDFTzolt9W
	 m855uyIiykIVt5RxBi2YRrs4RTT6AsVQ4FYZyT2lAmZKsudLJHVZSOT9YO1PX5cBH3
	 f4a7kcXOvoBsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sc8280xp: remove GPI DMA channel
 masks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260602081451.3808833-7-zhengxingda@iscas.ac.cn>
References: <20260602081451.3808833-7-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 09:01:10 +0000
Message-Id: <20260602090111.790E11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removing the strictly required `dma-channel-mask` property from =
the common `sc8280xp.dtsi` breaks DT schema validation for dependent boards=
 (such as `sa8540p-ride.dts` and `sa8295p-adp.dts`) that do not override th=
e mask.
--

commit 40a49ca07ecffcc445816ce06d38c8c77d95bf35
Author: Icenowy Zheng <zhengxingda@iscas.ac.cn>

arm64: dts: qcom: sc8280xp: remove GPI DMA channel masks

This commit removes the dma-channel-mask property from the GPI DMA
controller nodes in the sc8280xp device tree include file. This is
intended to allow different devices using the SoC to specify their
own channel masks.

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts=
/qcom/sc8280xp.dtsi
> index 761f229e8f472..d4ccca5e29319 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -937,7 +937,6 @@ gpi_dma2: dma-controller@800000 {
>  				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
> =20
>  			dma-channels =3D <12>;
> -			dma-channel-mask =3D <0xfff>;

[Severity: Medium]
Will removing this property cause dtbs_check validation errors for dependent
boards?

The qcom,gpi.yaml device tree binding strictly requires the dma-channel-mask
property. Other boards that include this file, such as the sa8540p-ride and
sa8295p-adp targets, do not currently provide their own override for this
mask.

Since dtbs_check validates nodes even when their status is disabled, does
this change introduce schema warnings for those targets that fail to add
the property back?

>  			#dma-cells =3D <3>;
> =20
>  			iommus =3D <&apps_smmu 0xb6 0x0>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602081451.3808=
833-1-zhengxingda@iscas.ac.cn?part=3D6
