Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916041;
	b=yR+IprC452pPgcjisft1tfNKF4n4y5fqNWPwCEEhYr+JhsifhXpRXvWahC0RY/wY14CV
	 3Z3aT9AUdbjTUM64yB/7jrcY4KMuDPSEgNaHagHfBUeUFGYWGtZdVwEHe4N/MLBQI0Lbt
	 k6+a2SNI8RMXnZbci/cPdLkX9SxZsbf5R0zKyZKD/51e0W92MpH1wByoG9qtodpy0t4/C
	 vdv9lZ0cZLXt/SKN/HyZVTrVad183DC1agrRwsU9dzrfKw/OZlKO9UDziykJxHmBb7RKI
	 qK1OiJpQe9RyWlj73k5JYhhvXdB2YLWS8vkcFQokLiYwlXo3igpwC4ZK19MYbGxnUlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916041;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZugSsTOr5rNYXP3cANW0ydNXLLWkFNDjqc0VvLCGr4I=;
	b=3cEzl5jXX7zi7E5HYgPrtKeTPDPVDSNy+SDTJPZXvrYbuCn0O9GJudDtDP/2cOGwluKF
	 ue0aEAGvVxDHAlRB1OPSEPKohVO9r7IsEFzDAdnIPVqrDtSXH6os3SSgxlhPAtj1FoFg4
	 7zYOhhuvvLYaE6yn51bfXGprec7mEIy3D0MJOfteVv4VDEBP3AFOriAaQAbcn376bRb9P
	 cd8jcgF7J5Jm7/c82601TbsbQwVRdH/XXu6ano+NTpFY1u4Fz9uCdCzdK78ElEo+GUOVQ
	 cDFS5a0/rhdfwfzs4NgJw7AsbNMNFDJp8OuuiZn8q6b+mkiSdREXDcrJYsaPKkt6waQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="V/e9g0Dm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234E3606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V/e9g0Dm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC071F000C4;
	Tue, 17 Nov 2026 11:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794916040;
	bh=ZugSsTOr5rNYXP3cANW0ydNXLLWkFNDjqc0VvLCGr4I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V/e9g0DmBlwqkU3GK7ie+aklYKJWmhM9bfSICA6E5LyH69+pc7HDD4BwCBjh09j34
	 uFbenbXpyolTI74epogmt+lhpvbaerrHlPXt7csZK3ZvGyOcCEMpIe2oLFhQDDv/d5
	 fKVhHA6HHjcgYEacdlib1iBB4VVcCUujiypFhIAdsPU9xUewTHbDKQpMRVG1SBJdZc
	 8qhlW5eSQ+inFwshrLiSOLKG8o6LN2TMiv+zLlg/NZIG+hauJfKGo45uourU1xQsuc
	 W/9tt2USmXRe5wN8/KadYcLN0ZHBl0rUkMXLLiljzF7aLa3wdvO4GdWKAbzohAcvYy
	 JjhNkhynNF7Jw==
Message-ID: <sashiko-outbox-218726@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add mode-switch to the USB
 controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapas Rana" <tapas.rana@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117113834.925310-1-tapas.rana@oss.qualcomm.com>
References: <20261117113834.925310-1-tapas.rana@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 11:47:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] arm64: dts: qcom: glymur: mode-switch on usb_0/1/2 defers
  pmic_glink_altmode
- [Low] arm64: dts: qcom: glymur: undocumented mode-switch violates
  qcom,snps-dwc3.yaml
- [Low] arm64: dts: qcom: glymur: usb_2 retains mode-switch on ThinkPad
  T14s Gen 7
--

commit e8839a36fb73b72bbb31e50290cbe000b0e68876
Author: Tapas Rana <tapas.rana@oss.qualcomm.com>

arm64: dts: qcom: glymur: Add mode-switch to the USB controllers

This commit adds the mode-switch property to the usb_0, usb_1, and usb_2
controller nodes in glymur.dtsi so they receive Type-C mode updates.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index 65a398c0a9920..e9469bb7a8326 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -4998,6 +4998,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			snps,dis_u2_susphy_quirk;
>  			snps,dis_enblslpm_quirk;
> =20
> +			mode-switch;
>  			usb-role-switch;
>  			wakeup-source;
> =20

[Severity: High]
Does adding mode-switch to usb_0, usb_1, and usb_2 without Type-C mux
registration in dwc3-qcom cause pmic_glink_altmode_probe() to defer
indefinitely?

On Glymur and Mahua boards, each usb-c-connector links its high-speed
endpoint to usb_0, usb_1, or usb_2.  When pmic_glink_altmode_probe() calls
fwnode_typec_mux_get(), typec_mux_match() sees mode-switch on the
controller node and looks up a matching device in typec_mux_class.
Because dwc3-qcom does not call typec_mux_register() in this tree,
typec_mux_match() returns ERR_PTR(-EPROBE_DEFER), breaking Type-C
alternate modes, orientation switching, and DisplayPort HPD on all
Glymur and Mahua boards until the dwc3-qcom support is present.

> @@ -5088,6 +5089,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			snps,dis_u2_susphy_quirk;
>  			snps,dis_enblslpm_quirk;
> =20
> +			mode-switch;
>  			usb-role-switch;
>  			wakeup-source;
> =20

[Severity: Low]
Does adding mode-switch to usb_0, usb_1, and usb_2 fail dtbs_check against
Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml?

The qcom,snps-dwc3 binding sets unevaluatedProperties: false and neither
it nor the referenced snps,dwc3-common.yaml defines mode-switch.

> @@ -5178,6 +5180,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			snps,dis_u2_susphy_quirk;
>  			snps,dis_enblslpm_quirk;
> =20
> +			mode-switch;
>  			usb-role-switch;
>  			wakeup-source;

[Severity: Low]
Should mahua-lenovo-thinkpad-t14s-gen7-lcd.dts delete mode-switch on
usb_2 alongside usb-role-switch?

That board overrides &usb_2 as a fixed USB 2.0 host controller for an
internal fingerprint reader without a USB3-DP combo PHY or Type-C
connector, and already uses /delete-property/ usb-role-switch.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117113834.9253=
10-1-tapas.rana@oss.qualcomm.com?part=3D1
