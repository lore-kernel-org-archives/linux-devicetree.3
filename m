Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FAE35DA6D
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 04:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788667274; cv=none; b=ZIiZMNBiZHvbrRgu3ZZ5zkeQxa7i+Xe7t9vG8rA2RATY5+NNZHA4ckfqYiaFBsYGUdxK02TharVj19oDanQFOFMmnXEh9nfGyEIlJy3oGCsFSR6qQFeHkO/JmZGS/Y3ja4Od14cwwMVjugRrNJBca+1ESOJzi2TBsC2hYLyKQUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788667274; c=relaxed/simple;
	bh=LFRbcFBqAXMrAexEITRCMIafaAxp8c2AQ88ousgPnt0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dYiuPQAQdPW+yuQf5ciFBHkDVR24c90YJHIEyohWemWZg/nWAsvTaO53KBkNX/7FL9BFQnmlxbHTENajPHGXys3+yVUKYmuEQrRCYnazKWxJdtTB6eFbO29BX0qJ+6eMcgkYyAIB6zyraZ8Rbeyyl5osUfNWfFpVs9rEVOL0cPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nauRa2Qk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nauRa2Qk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A2411F00A3A;
	Sun,  6 Sep 2026 04:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788667272;
	bh=8L+hVJp22+Y+cKOX49PrGiarcSP4q0Ub5YSoHTgvanY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nauRa2Qk/DA8R7hSQesHUD2wVZhTpccO46mrAeuI5GRFFiC4c0QKG7mKGRGtcZeI8
	 qgv/dhu8rVHp3mOy+BCfu4lZE9qpLktwllp9kFXNtUkxnmWQk2pY+qelYYdXBWIcBd
	 Nd9XkpNgAZekOLudz38093GWIf0H3fGNL2mzOqyf95uKujuhvJPC0C2BAZZAZQJ33S
	 GaBL1aSCCP+I9BFViy8UdBds+M3pCfRpciPyFSfMqgXU4YD2lENV4PeHMdZ986hSDY
	 /+Z5vb2YPN1p3ruSCoJmWWGlcVmQCQLjKIoRM04bcK8Ves0xkdJB0k+FiKudoXJAEk
	 btLO+VvzmZyAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/10] arm64: dts: qcom: ipq6018: Flatten usb
 controller nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260906-ipq-flatten-usb-v2-7-dab83120b10a@outlook.com>
References: <20260906-ipq-flatten-usb-v2-0-dab83120b10a@outlook.com>
 <20260906-ipq-flatten-usb-v2-7-dab83120b10a@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 04:01:12 +0000
Message-Id: <20260906040112.7A2411F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `dr_mode =3D "host"` property was inadvertently dropped during=
 the flattening of the USB nodes, leaving the controller to default to OTG/=
device mode and breaking USB host functionality on the board.
--

commit bec8a2f8c4189aee2b01ef94a41d21f112bd2fcb
Author: George Moussalem <george.moussalem@outlook.com>

arm64: dts: qcom: ipq6018: Flatten usb controller nodes

This commit flattens the USB controller nodes in the IPQ6018 device tree and
updates them to use the latest bindings and the flattened driver approach.

> diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/bo=
ot/dts/qcom/ipq6018-cp01-c1.dts
> index a366be17c251f..9c69d3027b43f 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts

[ ... ]

> @@ -48,10 +48,6 @@ flash@0 {
>  	};
>  };
> =20
> -&dwc_1 {
> -	dr_mode =3D "host";
> -};

[Severity: High]
Does this inadvertently drop the explicit host mode configuration for the b=
oard?

Without the dr_mode property on the new replacement node, the DWC3 core dri=
ver
defaults to OTG mode. Since the qcom,snps-dwc3 driver probes the new usb2 n=
ode
at boot without this property, this could permanently break USB functionali=
ty=20
for the IPQ6018 CP01 board which is configured strictly for host operation.

Should dr_mode =3D "host" be added back for the new &usb2 node in this boar=
d=20
file?

> -
>  &tlmm {
>  	i2c_1_pins: i2c-1-state {
>  		pins =3D "gpio42", "gpio43";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-ipq-flatte=
n-usb-v2-0-dab83120b10a@outlook.com?part=3D7
