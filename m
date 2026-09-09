Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4B1379C42
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 17:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975034; cv=none; b=bHYUDpGcMPHhHiwkqhZ1vZ/J3NjVAR7a7ANWzinPcqbGkQOqK4PEUqoiBJXXaAoetOf1fFfi4btm/2E4aXbR1Nf+EzTCp8Iow6GwJaFpoFV5IFAJuXtqTx5czK46vwXVU96H6lPdp7os3yyBGKhugccfLAOCj5NdGOMjpaHUaYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975034; c=relaxed/simple;
	bh=iPB8qc9U5oMmzltnfECrAvDNufzUtQ6SqGx+G6Gggg4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F7mrk7vNKvJoUmFG0vJbgIxgDYPHBXvqLnHqqCoO8JA6HtMqyZNMl00cm15oW35qyFHt/2J6XM3bDIJD/YmhQVEAfGHzToSuwNLnIO9FFVNmunvMYZrcOwPDXMI51hHJxQTJNZhly5nZ7aXPiYn4AuzPczcjqEDc3Oo0OzJFa7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+1VnzsG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+1VnzsG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240941F000FF;
	Wed,  9 Sep 2026 17:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788975032;
	bh=2Rlo7YDG9lSS6IQI+xqN3wsd55keF0QlblTSeDnIu2w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E+1VnzsGgGZjkZcPSYXIKGIr6qPGIqmD9pJjIW/qLlgTBcxMcKsItnDpbloUfKa2n
	 dHbBFURDH+gW6tav9uKH+zSefaFUPEPz+KuJw8kA5qMl3tr3fcKcq/WzX7S6bQpwz/
	 tHOdDD47auAsl+O9BM0MHT6y5pkROO7Fkg90nxpDqXcNbmIHi2ivMAnIO/eZBD+DYk
	 Q1etGVREXJ8dGjsWSTT7uh0UU/YSQvMgP2iOr0fE52ZVEzimc+yolBneoc8L+3NGGU
	 87pSLI+8qZHZaCHMuwY4aaI6UyDiJoComELDMqjZs4A91P3m/UQP092oA6WCQK7T8I
	 Zu6ldNOS0xnow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sm8350-sony-xperia-sagami: enable
 UFS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Paszkowski" <jan.m.paszkowski@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260909172421.33593-2-jan.m.paszkowski@gmail.com>
References: <20260909172421.33593-1-jan.m.paszkowski@gmail.com>
 <20260909172421.33593-2-jan.m.paszkowski@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 17:30:31 +0000
Message-Id: <20260909173032.240941F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Duplicate Device Tree property `vcc-max-microamp` overwrites the i=
ntended value and leaves `vccq-max-microamp` unconfigured.
--

commit c3bcdc386d74df860f7d4d12d1aed983ad46ea5d
Author: Jan Paszkowski <jan.m.paszkowski@gmail.com>

arm64: dts: qcom: sm8350-sony-xperia-sagami: enable UFS

This commit enables UFS on the sm8350-sony-xperia-sagami device, noting
that previous device-killing bugs seem to be resolved.

> diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/ar=
ch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
> index 4b62ee50da7be..969c8cb31df9f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
> @@ -893,9 +893,20 @@ sdc2_card_det_sleep: sd-card-det-sleep-state {

[ ... ]

> -/* BIG WARNING! DO NOT TOUCH UFS, YOUR DEVICE WILL DIE! */
> -&ufs_mem_hc { status =3D "disabled"; };
> -&ufs_mem_phy { status =3D "disabled"; };
> +&ufs_mem_hc {
> +	status =3D "okay";
> +	reset-gpios =3D <&tlmm 203 GPIO_ACTIVE_LOW>;
> +	vcc-supply =3D <&pm8350_l7>;
> +	vcc-max-microamp =3D <800000>;
> +	vccq-supply =3D <&pm8350_l9>;
> +	vcc-max-microamp =3D <900000>;

[Severity: High]
Does this mistakenly define vcc-max-microamp twice instead of configuring
vccq-max-microamp for the pm8350_l9 supply?

Because the property name is duplicated, the device tree compiler will
overwrite the initial 800,000 uA value with 900,000 uA, leaving the vccq
regulator without its intended maximum microamp constraint.=20

Given the history of UFS hardware issues mentioned in the commit message,
could this unconfigured vccq regulator lead to system instability, boot
failures, or hardware damage?

> +};
> +
> +&ufs_mem_phy {
> +	status =3D "okay";
> +	vdda-phy-supply =3D <&pm8350_l5>;
> +	vdda-pll-supply =3D <&pm8350_l6>;
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909172421.3359=
3-2-jan.m.paszkowski@gmail.com?part=3D1
