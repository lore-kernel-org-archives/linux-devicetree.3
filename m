Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F882381B0F
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 23:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789254669; cv=none; b=P7vydhH5R59gu1CqHarLLBn2Ws/fBHLel3qlu1H7ZPdDpUQjwb5p6NE4+n585ykDNY9Akk1OXY4kfH/2i+HDqxEQC7n79sSLJNAJB+SVeVXrRsN9PXJlttAXNUwg82mgum5Gwb1fwYubu3Ofv0fxvcXKSCWwU9dK4T1J9L8E9Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789254669; c=relaxed/simple;
	bh=QASvcJxlRpZVHUKCzhwO0Eyz9TplB30ytL7smacFUiU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=esUCQXiuFbD/Dg/hFjda8lgsyvjJMecgrjdighK7Jbc9HuWHe5yHwNypP2VLW/zkipBiWtfUCYq60qSaP+9s4WuFDdm56Q/Wn/O282xjF6yd2k2wOvG8+Ha7nkeiDFwyrHF7mD36SW9fWlRkQAMZa4eiqebsEpL+ai3Lo2BC4sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2669mvC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2669mvC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF67E1F000FF;
	Sat, 12 Sep 2026 23:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789254667;
	bh=JoYIn5Fkv3+b1LmvR/Lw7CHgcsQotv5Qt6WBCLc9Nzg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N2669mvCilT5ESfVjYBgoe8NsNaxpUogFKMSh5yEYPrDahE10HDJec6JFR10Dz0iE
	 4gAFIwIOmzyfC64kHPmbtzQu0pcmigCPkXEWog4ZjV6tF0rxGtxvh+aMC1uq5tVjXd
	 ZSZfD3iyo6dMpIYUm6zNdLRQY9ZuZwKaMulBfbivAqYjq5vNeDgzLcweMJV+nYNLWs
	 s6P+tbAF4EVYLdBWBYArJoT945A4CJ53Xvo+FkqLBIPjNNoofbeuAufcUQJgg2N+Ig
	 yA2wJ5V4K2IdLzoq2OFXeUzfdblIXaBcoik0ArQd2e2tGoIM+EkJVEKYJra57aifUf
	 FlgPRuMsBlMoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 8/8] arm64: dts: qcom: kodiak: Desribe EUD UTMI
 routing and connector mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260912225301.3396556-9-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
 <20260912225301.3396556-9-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 23:11:06 +0000
Message-Id: <20260912231106.EF67E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Enabling EUD by default causes endless probe deferral on boards =
where usb_1 is disabled
--

commit f996caeceb74900c278431f664f8ba097d1904a7
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

arm64: dts: qcom: kodiak: Desribe EUD UTMI routing and connector mapping

This commit updates the EUD description in Kodiak boards to explicitly model
the topology using an EUD path child node and adds a role-switch declaratio=
n.
It enables the EUD node by default and maps the USB connector endpoint to
the EUD instead of directly to the USB controller.

> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index f2da3706d5c88..6c64dc9902e47 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
[ ... ]
> @@ -4753,16 +4747,30 @@ eud: eud@88e0000 {
>  			      <0 0x88e2000 0 0x1000>;
>  			interrupts-extended =3D <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
> =20
> -			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;

[Severity: Medium]
Does removing status =3D "disabled" here cause endless probe deferral on bo=
ards
where usb_1 is left disabled?

By enabling the eud node by default for all kodiak-based boards, the EUD
driver will attempt to probe and find the role switch for the downstream
usb_1 controller. On boards that do not enable usb_1 (such as
qcs6490-vicharak-axon-mini.dts and qcs6490-radxa-dragon-q6a.dts), the
controller driver never probes and does not register a role switch.

This causes the EUD driver to explicitly return -EPROBE_DEFER. Since the
dependency is disabled, the EUD driver will defer forever and linger in the
deferred probe list.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912225301.3396=
556-1-elson.serrao@oss.qualcomm.com?part=3D8
