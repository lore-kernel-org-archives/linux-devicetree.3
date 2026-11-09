Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264994;
	b=2OJajEL18wXgHg1aRcCiM22ER9QGJBHtk89zvrGnftD8rrITpU0dUd4OmDC95Y5qojmc
	 3xs92sA3Canc0msGjMBacjnKgcbkl+kHUGLIdxVXuO9P3FZYps9K9WQFOmt1SoALqD/nN
	 2h1Ys6DZDsr2SXWNZP8WI0RXBfo9qFrYEqs4FGMm1Q32aOCXOEQI7vACQXv6+23ZFKxZw
	 aOKA4bCCBTAJd0Ewh0dXVlhQQvYGovE+qcNFHZ+7nL1Gvpb/z6ae7B01HnD/df1hJBMJz
	 2GkNtA0TfvinAhHaIbzhUfcPd+OLriabHXoZ0cShRO48wK/Kd5+Ic9rpyS2CR2oiFrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264994;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7t4JHBbqZmrUWRbdGwUzHfPVjBa5Usq8fKptOAX6FMI=;
	b=EDq7YPJNKqGwDQoTWNLAzQL5Fm2PNLyHLiTwb2ITcqjmbTck8jbhhWMj3+cDSBr4VzF4
	 vAna2cIjA8IsCxjsW84MELmIXX0I0QCkUY4iCXLiQnlHPZR3k1+AQms21LdNz/Wo2xTN0
	 YDvUqunW4pof3Jn7Oq3RiL/AlDPWd+QLZhDfIrXPhG/DJUl9d68JmHX2Y3kLONCQwKGwP
	 xZJ8JPHUeMZMc5ZtFljWm9OnaGb4Fgx0Iu5r7CVxvj68W2JJ0XpRSYZVDJqjhhUPfHD7Z
	 +yFS4G4871Hw68DE4quhVLLfn86gjuss03dDKdNtiWUoj4pASqViu404OfAYG0rxltQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YFupthSy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87566606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 22:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YFupthSy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6D01F008A2;
	Mon,  9 Nov 2026 22:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794264994;
	bh=7t4JHBbqZmrUWRbdGwUzHfPVjBa5Usq8fKptOAX6FMI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YFupthSydwhNZNlvyI7UHj/w3ZeZZSAdoUe7DoHt0/m6i/3U9eKQgStFDnB9hbhlr
	 ddu0HV1n4lTObGwWqTvSgcZWgQ4+M0jovgm3+wJ2aFebn3Tw8kg3VrJ6p9gOOw1h8O
	 z6GGAWD8cE+wRvWyxi7yQHmmDm4WlMYaRVg4DF/x6hdhtG6rS0q/wiwHiVDM/Xz0sq
	 MlkFeQgY+GSA3h01X8mWdnqHsX/6bS00adk5cWt1RcxR9gxBlm0nNGd0QRAXIo64Vi
	 GA+82yvKJ6d1FexqO1Ktqlu7rep6HD7T/e0Kl/J9Sqid5Lde9ur5m64c1k/AbeK7VX
	 xOZBmmJRAta3w==
Message-ID: <sashiko-outbox-205776@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: media: Add qcom,sm8150-camss
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Suman" <gauravsuman007@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261109-sm8150-camera-v1-1-3d2e7b407516@gmail.com>
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
 <20261109-sm8150-camera-v1-1-3d2e7b407516@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 22:56:33 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] dt-bindings: media: qcom,sm8150-camss: wrong CSIPHY regulator
  supply voltages
- [Low] dt-bindings: media: qcom,sm8150-camss: drop non-programmable
  clock-lanes
--

commit 0fb4333890ec99f90c8e1d28d189ea7add0c4129
Author: Gaurav Suman <gauravsuman007@gmail.com>

dt-bindings: media: Add qcom,sm8150-camss

This commit adds the Device Tree binding schema for the Qualcomm SM8150
Camera Subsystem (CAMSS).

> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8150-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> new file mode 100644
> index 0000000000000..e13bcd8d48adf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> @@ -0,0 +1,389 @@

[ ... ]

> +  vdd-csiphy-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSI PHYs.
> +
> +  vdd-csiphy-1p8-supply:
> +    description:
> +      Phandle to a 1.8V regulator supply to CSI PHYs pll block.

[Severity: Medium]
Are these the right CSIPHY supply voltages for SM8150?

On SM8150 boards (such as sm8150-hdk.dts and sm8150-mtp.dts), the four CSI
PHY core rails (vdda_csi_0_0p9 through vdda_csi_3_0p9) are supplied by the
0.88V PM8150 LDO5 regulator (vreg_l5a_0p875), and the PLL supply on 3PH
CSIPHY hardware is 1.2V rather than 1.8V.  Requiring 1.2V and 1.8V supplies
here (and wiring them to vreg_l3c_1p2 and vreg_l1c_1p8 in the example) leav=
es
the 0.88V CSIPHY core rail undescribed and unpowered.

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY0.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4

[Severity: Low]
Should clock-lanes be dropped from port@0 through port@3 and from the
example below?

On Qualcomm 3PH CSIPHY hardware the clock lane position is fixed in
hardware and not programmable by the CAMSS driver, which is why commit
336136e197e2 ("media: dt-bindings: media: camss: Remove clock-lane
property") and commit b8ef764aff5be ("dt-bindings: media:
qcom,x1e80100-camss: Remove clock-lanes port property") removed it from the
other CAMSS bindings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-sm8150-cam=
era-v1-0-3d2e7b407516@gmail.com?part=3D1
