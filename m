Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423820;
	b=xvLJzD29zgpA6ZyEMK6dL+JLy2KYWSS1etvEjRZNNCAUXbMJu+BZ+bJE8sqjGVjWjaKk
	 i2ii1vn8Pg39U/sxDa6x1SpWy5zpZHtr90SQSChH+M1AehgT0kdUmgz9Khtpomyb78Acm
	 w4liVvSSYoHoydrEd1R3DkIgWmfBJtySxyL/ipSoUmnS7vQIpAqEoppJwLh5px69piofj
	 NJ+vbXv792y5z9dQ1GK8+FLKbixZzKaMgXVVc+tHZqVITZWo9gnCbQuVsYGK7dg9OSCdh
	 zFWUxOQDD+fQAajU0OB2RqZRhxKdNoHR4vIRPb92NBrTq0XwwZ6c8lBzdqERLbrGTkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423820;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xvgKTRY/knh2mwPSo7GMDNOeApTuDMfy2yhR4yN+14k=;
	b=wCVvSKtX+T6wDY3DozViSxeeBD/cEQdwwFcT/7mGC6CHMJBhNxXsjunBt9T0nnRQwe5o
	 RXbouhu/NiJO2RRlN0EzmJ22DyJxlMe3bkclcEeqZ/QeMyJ58XlWUbqaYy2ckjBUhH/2m
	 2DdEz0khLZ+MtAll6deye0QdImQCMETSNFUzLDag0h+BssypqFHuuiIM74qd8SyLRCsAI
	 O/WevJWmrkgKfqdouikCR1SJWsvrxZYZhJWmx1IgaPtKGTLenQ15zP0HLND6NusMZA8v6
	 sE6cPVd3PJ+UqmhrfrffP1L2sG+WW/B2inJg7+kypEg0NTiC+aehVsDtXTNaAEuR4KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gCo145jl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048AA606A327
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gCo145jl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AE41F00A05;
	Wed, 11 Nov 2026 19:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794423819;
	bh=xvgKTRY/knh2mwPSo7GMDNOeApTuDMfy2yhR4yN+14k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gCo145jlxsL4VsjwWBC9+choOHGYE6xiIhI1jtY85DCWGz7UqJ/bWUj1GfNqMRJPl
	 yA9x2VTpt69p0Z0hRQ2ntmE44izb23z2NKvVpcjxVTRdv3YUJCMvVHUvjzMiNwL17i
	 nnxecy3hF+ktRiCFEJGKpiC/fdKBBj9EdEALANipqWYMroPOre9Zy8QHITs2agsQ2Q
	 AvyPooU0gc+4IsF3OEBGQtQjHFXuknkYEBwcf+vA92urane08nSpA8vo1CkxN7C1hm
	 /QUHPwEgGRDyXFP2PbIzNHHQgSn9zZJTTBzM21dL0LkN+ja3uf638Mc8fZGIGy3EtF
	 nWQrEYQE4GvWw==
Message-ID: <sashiko-outbox-209524@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qusb2: Add support for
 remote endpoints
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261111-shikra-qusb2-charger-det-v1-1-5a9d919c66b5@oss.qualcomm.com>
References: <20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com>
 <20261111-shikra-qusb2-charger-det-v1-1-5a9d919c66b5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 19:03:38 +0000
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
- [Medium] dt-bindings: phy: qcom,qusb2: usb-role-switch overloaded for
  BC1.2 detection
- [Low] dt-bindings: phy: qcom,qusb2: incomplete usb-role-switch and
  ports schema
--

commit fd796c127a8188028d89719a01ee3f717ede3073
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

dt-bindings: phy: qcom,qusb2: Add support for remote endpoints

This commit adds OF graph ports and the usb-role-switch property to the
Qualcomm QUSB2 PHY Devicetree binding to support BC1.2 charger detection
and role notification routing.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/=
Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> index 001fd0ccc9852..0b6b2933dd98b 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> @@ -159,6 +159,29 @@ properties:
>      maximum: 3
>      default: 0
> =20
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      Those ports can be used with any connector/pmic node that is able =
to
> +      provide role switch notifications for charger detection purposes.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Connector Data bus
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Controller data bus.
> +
> +  usb-role-switch:
> +    description:
> +      In the context of usb-phy, it denotes the capability to perform ch=
arger
> +      detection. Although phy is not the one responsible for switching m=
ode, it
> +      is the one responsible to take a call on whether controller must s=
witch
> +      mode or not. In case of SDP/CDT, the phy would inform the controll=
er to
> +      switch to device and in case of DCP, role switch doesn't need to h=
appen.
> +

[Severity: Medium]
Should usb-role-switch be used on the QUSB2 PHY node to represent BC1.2
charger detection and role notification forwarding?

In Documentation/devicetree/bindings/usb/usb-drd.yaml, usb-role-switch
indicates that a device is capable of assigning the USB data role, which
on these platforms is the USB controller rather than the PHY.  Using it
here to make fwnode_usb_role_switch_get() match the PHY endpoint encodes
Linux driver notification routing into the Devicetree ABI, while BC1.2
detection capability is already implied by the PHY compatible string and
the DP/DM routing is already described by ports.

[Severity: Low]
Does this schema need type and port constraints for dtbs_check validation?

Because usb-role-switch is defined here without referencing usb-drd.yaml,
it is missing type: boolean.  In addition, since the PHY does not permit a
child usb-connector node and requires both port@0 (incoming notification)
and port@1 (outgoing notification to the controller) when intercepting
role switches, ports should list port@0 and port@1 under required and a
dependencies entry should require ports when usb-role-switch is present.
Also, the description has a typo ("SDP/CDT" instead of "SDP/CDP").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-shikra-qus=
b2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com?part=3D1
