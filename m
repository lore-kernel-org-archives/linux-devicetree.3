Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E0D3594A
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 05:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782018523; cv=none; b=e1HyXqUljtYfdxGFe8xD+tqvmFpDTDaIa2l8Bp6Bht+/97l1HZVsUS1GLPgFnykzzSZUk/wW+7/sBCnLAaI/hT7JUiekRfnLKUrKcv72BudwrqXgAX2bpB3/oN6k2j3j4SVOBvDAAiWz7NLX6cWGsB0bXuv4OQR93wNsFbYN5pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782018523; c=relaxed/simple;
	bh=nvrF8IHZOi1e9SexKwlIcEBfbqqukx5dKoD7ru/4mRY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bBIl2XqL4OB6xZKqhM5M8J298WLpRF/DkQaBvpYMNRO6K0yjM8AzBVEs/vnAEIt9weZz4OrCAtdSzIoEaCaPu44NaNu0Ki8Z5GsF2s321GUpxTx202SPZNu05mKK5hDQsJ+bXeLLBFy8WouLewvZAwo7sR90y8XsRJPyiLQyn+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i03Dhqj7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i03Dhqj7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8166C1F000E9;
	Sun, 21 Jun 2026 05:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782018522;
	bh=jrclykDDZ2jZkExP6KvufyRQl7XWT+Fvgwl0PQE5kxc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i03Dhqj7byK+t5HSvHDeSCsKleyzLA1a9Yx2SaGekoiMgy92YVziVELRTzO4zB+Mi
	 dETnGuxts3S+jaRPYf97tjL4AAoqoz41A5qMzK0ZsR/xIxq2KViIqZZnJ7GHBMusjz
	 Y2o3xfZ8YcMFckoJJ0Hb6NFAbp3B+qAO4auSmIttQCFf2cPpqvNYMTyJ+lUp7E8i6X
	 eH/ocNpehI5cr1VrDgxWtPRRt7fnp2Yx1Xgsx7pbsLxYnDIf4qLWo5bpi/8R96dkaC
	 34Sp1To0Dyk9KKOqZQKTfEEJ9/avt3QB+WWP0iSL3hKs43wySmQkO6wPlW3v1ibkAz
	 S4md8bKg+acPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Pettit" <jason.pettit@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260620-glymur-send-v1-2-fc4a2cfd107c@oss.qualcomm.com>
References: <20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com>
 <20260620-glymur-send-v1-2-fc4a2cfd107c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 21 Jun 2026 05:08:41 +0000
Message-Id: <20260621050841.8166C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `port@2` (SBU mux) in `pmic-glink` Type-C connectors, br=
eaking DisplayPort alt-mode AUX routing on cable flip.
--

commit e810bc690ae1ce5520333f631dcdd9b455aa35d1
Author: Jason Pettit <jason.pettit@oss.qualcomm.com>

arm64: dts: qcom: Add HP EliteBook X G2q 14 AI

This commit adds the device tree for the HP EliteBook X G2q 14" Next Gen AI=
 PC
based on the Snapdragon X2 Elite (Glymur) platform.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts b/arc=
h/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
> new file mode 100644
> index 0000000000000..795940a999466
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts

[ ... ]

> +	pmic-glink {
> +		compatible =3D "qcom,glymur-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		/* Left side display-adjacent port */
> +		connector@0 {
> +			compatible =3D "usb-c-connector";
> +			reg =3D <0>;
> +			power-role =3D "dual";
> +			data-role =3D "dual";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint =3D <&usb_0_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint =3D <&usb_0_qmpphy_out>;
> +					};
> +				};
> +			};
> +		};

[Severity: Medium]
The commit message mentions "2x USB Type-C with DisplayPort alt-mode", but
are connector@0 and connector@1 missing port@2 and an SBU mux (e.g.,
gpio-sbu-mux) here for the DisplayPort AUX channel?

Without the SBU mux defined in the graph, the pmic_glink_altmode driver
cannot locate it to flip the SBU lines when the Type-C cable is inserted
upside-down. Does this cause DisplayPort alt-mode to fail link training in
one of the cable orientations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620-glymur-sen=
d-v1-0-fc4a2cfd107c@oss.qualcomm.com?part=3D2
