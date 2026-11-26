Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677611;
	b=d1VnzBbB0jmHdnZlyiFVgnqfsb6WvRVs0IrYhKDwNOP6jqxA8iwPxt1wxE7T7mXSAP0z
	 0AzzaF8ExIH9E3cx36Zxg1QhSWFq63ioBVXTMp24405gqaME5UksSmtZE1PxlPWR6Gh4f
	 fhcYNyHxOAGh/K4Fn7OUOqW+zJHSFDleBDEzTDsEy2K6Inyte5KCB6j1TiW4G+KJJlwEg
	 GTEmTnk86+MRZgikrwf7EOgGO4JaX4MDpENsbeQ0YuW3nu6NRxm1QRI4AfrXwgg7sqOGc
	 dYvxXLeBpGbvsgWOhEb0DNT8PTGK6z1fSrn4CjGNUs/ucgY4EbKynRcSgN8gLjaMQhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677611;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QaQmrKEYpYDIORACfzhgIfNgTxEbt4Et73jAOXOhoXI=;
	b=sIyJ4Le3EaU30lT0Hp3e4zrjEzwvHmRSS9bxyrHbv4jzpqBf0PxcZSReUjhp8N2NNsbQ
	 NqcKdD0WgBeMITbqVMdfIC/aTpiioL1pMHaELhsfuI7forpqZNgETwtdDJFNhMca7lKYl
	 3igohWKthAGc3L9vDJm/QF5TS+sbyED0IvwRdhS7gGIT94dX+QSBMAYdS75t1X/eBtgal
	 ycYHi5f+LLOTKlcsKlA5776J6Dm7kwX58U2zp4tqo9aERR27t+8AJMVN4apt8Wu8VbhVq
	 XF+juG2Ut4Q1j3Q2BajeXQeoZJlF73wbK+O/8B2IAiGoaDn1X9OaXSYEHTPhu2oDfdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jJggaNr3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27D0606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jJggaNr3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420A91F000C0;
	Thu, 26 Nov 2026 07:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795677611;
	bh=QaQmrKEYpYDIORACfzhgIfNgTxEbt4Et73jAOXOhoXI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jJggaNr3FfrD7p+p3M2qEd6FEW4QsuXQ0vh8ukljs00Zd06fW+KYfZwU1GGSXNeLI
	 eDN9QGD0dsoG9DAmkJownDm6fD0rRRnVJ5O+18//ayurW5SR72LcCuz5Z8RMypMZD0
	 Hd4lepCiMEJHsYyGUvjO3iZr6DON6RFZrRp9HE4Fd8WvbKnvG6QGXDVBlsOl4govWY
	 yNKhPidfjgYjrnckF0xbgnvxR+j6nSvze6idpgSOMCpTMxM1Z3O3bZHsMphHmH2Sf1
	 f9eCRDDnrg36EIx9KBsfzlJvol+fPhXfwZAcTGJfLjVQHYy+rzOyNSL082gO1Z+fUU
	 QxbRzFdaUe3Kw==
Message-ID: <sashiko-outbox-234948@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: remoteproc: qcom: Add Glymur OOBMSS
 PAS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-oob-support-glymur-v4-1-ad4ec5dd4b0a@oss.qualcomm.com>
References: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
 <20261126-oob-support-glymur-v4-1-ad4ec5dd4b0a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 07:20:10 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: remoteproc: interrupts listed before clocks in
  property order
--

commit 69fa2cea94a6066109c0cbf96d365518834921d5
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

dt-bindings: remoteproc: qcom: Add Glymur OOBMSS PAS

This commit adds the Devicetree binding schema for the Qualcomm Glymur
Out-of-Band Management Subsystem (OOBMSS) PAS.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oob=
mss-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oob=
mss-pas.yaml
> new file mode 100644
> index 0000000000000..3aa96d2262f12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas=
.yaml
> @@ -0,0 +1,154 @@

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - qcom,glymur-oobmss-pas
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Watchdog interrupt
> +      - description: Fatal interrupt
> +      - description: Ready interrupt
> +      - description: Handover interrupt
> +      - description: Stop acknowledge interrupt
> +      - description: Pong interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: wdog
> +      - const: fatal
> +      - const: ready
> +      - const: handover
> +      - const: stop-ack
> +      - const: pong
> +
> +  clocks:
> +    items:
> +      - description: XO clock
> +
> +  clock-names:
> +    items:
> +      - const: xo

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    remoteproc@1f000000 {
> +        compatible =3D "qcom,glymur-oobmss-pas";
> +        reg =3D <0x1f000000 0x30000>;
> +
> +        interrupts-extended =3D <&intc GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 0 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 1 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 2 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 3 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 9 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names =3D "wdog", "fatal", "ready", "handover", "stop-=
ack", "pong";
> +
> +        clocks =3D <&rpmhcc RPMH_CXO_CLK>;
> +        clock-names =3D "xo";

[Severity: Low]
This isn't a bug, but both the schema properties list and the example node
place interrupts (or interrupts-extended) and interrupt-names before
clocks and clock-names, whereas the canonical DT binding property order
places clocks and clock-names before interrupts and interrupt-names.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-oob-suppor=
t-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com?part=3D1
