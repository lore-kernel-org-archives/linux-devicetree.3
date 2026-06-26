Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89A03CFF5C
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 06:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782453609; cv=none; b=CTI76fVJ0kC3ButD34TO9hDKIy5V8U/PUckMCSGVI3RnDxVqUxtA1cI/Kwn1FQAU9df8Z22w5Bhgw1ki+udjTXkNGc24v9XzQiaCzCz5hEcMeFmwJKuIkm34mm0JEaJFOsA6ZlMsglA5GRVuRDzznbc572TYmh1vrPezcU0rfq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782453609; c=relaxed/simple;
	bh=Cwzdbli+qiRt0kD026cacMTvqfxce4cfhmfgBnoFzgA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eYvrhW/fQY8PGVa1WWRNm8HBYkQBWkm8+J4xYw1TnMROwpmLOxq/0RQPOU/0VQhYttTPJurZtQWxeU/OgwT3fPjqrxnMd5mTbS2Byf9ksoVjwxe+n5muq6vAlfyvgotCPWgrLBx5bQMk6ROvKTZU+BG4vacLBa4ki4di6zwa0RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUDU7zHt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUDU7zHt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0D81F000E9;
	Fri, 26 Jun 2026 06:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782453608;
	bh=VCDuzJBgavYVuNOjiRk2gPO4hr2FfttxM4eUHmST3Wc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jUDU7zHtxCy29yGprIPKy1/0CUlwEc67U+iKGCTpkqy7VYNJP9lbpIN900Ns4tU0U
	 /DFzzjqcypl/sQ+2oOWL5J/f6fGUMXnTgey/qWctyA2ZetmgikQX+PtOCF+6wJ91fA
	 H8qVPjreQjVjt/670DhdW+yhGsBTtLPEVvFzW9vpyiunijE/4NbMQZ3APXeg9durQH
	 v7G7uyBUi9bv3ZV5AJX/NNmHNhN2XJ+AGMx8auWCgRzar4nQFv4f81VPOVjpGZYYp9
	 KbKBImwWmOSE0O6fuqRRZ0SLZfQw69t3FWHZAMP9+klrd2NiI5u5jtOvWzKJ9BNRNa
	 qX/m3029EGOMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Pettit" <jason.pettit@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
 <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 06:00:07 +0000
Message-Id: <20260626060008.2C0D81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `usb_2` DWC3 controller and its high-speed PHY are explicitl=
y enabled despite having no physical connection and being completely unused.
--

commit cd918ca13e11bd1a5f9fec450e22054021db1490
Author: Jason Pettit <jason.pettit@oss.qualcomm.com>

arm64: dts: qcom: Add HP EliteBook X G2q 14 AI

Add board support for the HP EliteBook X G2q 14" Next Gen AI PC.
This enables various device tree nodes including the HDMI output,
eUSB2, NVMe, and other peripherals on the Snapdragon X2 Elite platform.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts b/arc=
h/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
> new file mode 100644
> index 0000000000000..b3e351ed7ea7e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts

[ ... ]

> +/*
> + * usb_2 is a fixed DP-to-HDMI bridge; its SID-11 eUSB2 repeater is
> + * firmware-gated and never probes, so leave smb2370_l disabled.
> + */
> +&smb2370_l_e2 {
> +	status =3D "disabled";
> +};

[ ... ]

> +/*
> + * usb_2 is not exposed as a connector; its combo-PHY's DP lanes drive t=
he
> + * chassis HDMI bridge (see hdmi-bridge).
> + */
> +&usb_2 {
> +	maximum-speed =3D "high-speed";
> +
> +	phys =3D <&usb_2_hsphy>;
> +	phy-names =3D "usb2-phy";
> +
> +	status =3D "okay";
> +};
> +
> +&usb_2_hsphy {
> +	vdd-supply =3D <&vreg_l3f_e0_0p91>;
> +	vdda12-supply =3D <&vreg_l4h_e0_1p2>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Since this port is used purely for DisplayPort-to-HDMI output via the
combo-PHY DP lanes, and the eUSB2 repeater is explicitly noted as never
probing, should the usb_2 DWC3 controller and usb_2_hsphy be enabled here?

Leaving status =3D "okay" for the unused DWC3 controller and its high-speed=
 PHY
binds drivers that will consume resources like memory and IRQs unnecessarily
for hardware that isn't connected.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-glymur-sen=
d-v2-0-00905324ffbf@oss.qualcomm.com?part=3D2
