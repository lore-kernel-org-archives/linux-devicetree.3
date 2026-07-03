Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B824F380FE7
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 09:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783069573; cv=none; b=rdN/8FvTNWwBsj5JaEhyOqIMX0QZd3qE2i3kkfMG/D7VnH7FNDVE8X9zMWIFOtL+XFbD77k9xxOcNDNFqhAFlhrVKXUUMJEeB24RSBMCfEZnECSyqpOvxMPmO/VW7qqK9NXrx9pPK+DDzyERaslwYgw+D7C2Ov8qW//RV7STiys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783069573; c=relaxed/simple;
	bh=+9nAkIdFvxUf3oepej4qWJWUxWGmKnLBX2wFAeO/IIA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=igdZMQoVvitdfSMtrwAoamJF/pMG0Z/UfTiuoPCDSI3tBsgE2hR0x+rZtMtm/+DvP5wlshjfnj5Tm/x3jVl54CT86DH94heCB+NGVVOtb8A+BMf++KeVp+BqMV78fP6jAKI/nSe3OkoFhfxqxOIJYk1TgkAMZMg9EWqlDnMIkRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTcw0FTh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTcw0FTh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2341F000E9;
	Fri,  3 Jul 2026 09:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783069572;
	bh=94OBMymysXRCtuTm0FEbIfr74GVZUZxKQ/6yLeZfJtc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hTcw0FThsAYC+40WmAliGdUO6ZAxTelDJlbp/moHKQGFluBU0Prt9Ne9Lm/UHVZeQ
	 G6NR2zTn59DrvoGGFGPhVy8bKpTt37Xg2x6v4BAivVKzDFO5F1sYSHRxRLb6LyDyD5
	 dfbvdBy10pq6ki/ExttzP20fed+lhkdntfH2Ir9FQFKmq+yy9R8E/FXzPFAB++xcNh
	 4qfgWyIdQTBf9XThckLn6/B/Pj1hStzv8RYdv3oZVWYLFQQ0uPlbnk0gDi84szjYyQ
	 +b1bJMSneoTwawCBbtT3hSmeRFcC5d466S5ppcjXeTRp6uvOWPBP6QX5jD+eEVkBgv
	 siTKEsl5hzxnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sarat Addepalli" <sarat.addepalli@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260703085809.2573214-1-sarat.addepalli@oss.qualcomm.com>
References: <20260703085809.2573214-1-sarat.addepalli@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 09:06:11 +0000
Message-Id: <20260703090612.1D2341F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing required properties 'memory-region' and 'qcom,gsi-loader=
' for the 'ipa' node.
--

commit 3779947d88d9867dec609553d6bb24efded1c1a3
Author: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>

arm64: dts: qcom: qcom6490-idp: Add IPA nodes

This commit adds IPA nodes for the Qualcomm qcm6490 board. It configures
the firmware-name and sets the status to okay, stating that other required
properties are provided by kodiak.dtsi.

Link: https://lore.kernel.org/all/20260517-ipa-loader-v1-0-3c3764c1b4a3@oss=
.qualcomm.com/

> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/d=
ts/qcom/qcm6490-idp.dts
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
[ ... ]
> @@ -619,6 +619,12 @@ &gpu_zap_shader {
>  	firmware-name =3D "qcom/qcm6490/a660_zap.mbn";
>  };
> =20
> +&ipa {
> +	firmware-name =3D "qcom/qcm6490/ipa_fws.mbn";
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Will the IPA driver fail to probe here due to missing properties?

The commit message states that the qcom,gsi-loader and memory-region
properties are provided by kodiak.dtsi. However, it appears neither
kodiak.dtsi nor this file actually provides them for the ipa node.

Without qcom,gsi-loader, the driver defaults to self-loading and calls
ipa_firmware_load() during initialization.

Because ipa_firmware_load() requires a memory-region property to map the
firmware memory, lacking it will cause the probe to unconditionally abort.

Should these properties be explicitly added to this node to ensure the
device can successfully initialize?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703085809.2573=
214-1-sarat.addepalli@oss.qualcomm.com?part=3D1
