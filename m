Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616022;
	b=Iw3fplBcbXcOiaoSq8xsx/7QAKPvNDQKMyW9P0Ux6XVn8SZsCnDJQ8bS+d/4LNAnXc5N
	 5ZSoBScMHzwAaQyE1/6E4JPfMf9d8doXNKxq2cCdQY44JMQnfK7Gpq2udx5j20MOcFWaL
	 55Q+vZeQ9ai/CY3yvIoB5mw3Fg/k81SSrfMV9oBZIMORbNOys97BIFa19tmwbgVXc4e7n
	 AYJBBOUDX/q959TPCwvJxfNM+tL3+ebA6BZrbnvR+9BdZFgl2jUYHfD8F9bvBFkSy9Xjj
	 +vA0cpzL43iYndoOyxBjgDFBewJF3YnzQhQXrI5+CGJUVE+C02JP+xmPUkkg1zlB/6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616022;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hvu240eBRoY1aXEt3RbWfkOxwOzXBhw+bI6p1t7/mTM=;
	b=zXdhvwqCYIOqEc9DITUmJ3D1tEk6iteVv0vZD+kFRZGiJlUAi5RejntCjUk04Y2lutoU
	 AZ6t9HjJjnT32yVgWN0L1H7vUPteXGgjH0boyCxZwQ0kz6u8/OI938kHpPzSfCWoTuhdE
	 5wlfBGMOnby2dY0bXn72TTf2iD/t+u6K3Mii3ZaSlOZbomRqtgG1OzUudQe/7oG9nfYQw
	 Y07Khe94VomZyUclF9RjjJYbJIFu1Edxaos5cuDSSH2gIvO/QqSJRuVEJnspY5B9XNYLa
	 bzaWxrIWQ4e2NRaGlNj1MqUssLm3PfCT0rdgmBw1+OeAUoCpfYeOP3ecgmcd6CnLvvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hkT7kjDz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E932606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hkT7kjDz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2BDC1F000C1;
	Mon,  2 Nov 2026 10:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616022;
	bh=hvu240eBRoY1aXEt3RbWfkOxwOzXBhw+bI6p1t7/mTM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hkT7kjDzq0bic3D35fd0tEtUeaJk/EnXtKq7lHCfAjiNk3Leto63VrcBuG8V746IK
	 59mcGTps0MCE8UDZYADrWeFGdZh8Xm5js0FLmV7w+nPKKKLHvoQYLXWI1aQ41zPxae
	 1S5+zXgyMSlvlu3IRpE8VbiN8sJ8uiZMnpeJxIyAOpygnS05OSWym3ITmbvyeIky8W
	 LAwf9xVHWv56K8NPGnwjMTPD2d2+JQ5V8nLT6gOcg1bXBlf+/ACo8iq4MGoZK8TfSW
	 ABPK6Aq90DN8/uMp2ITShttNSq/P4meIiZmZao4FhgeZRmPs+SPp4/Ck0j0AGYF/+l
	 E+UWNWg7QWjLA==
Message-ID: <sashiko-outbox-193269@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 1/2] dt-bindings: phy: document the serdes PHY on
 sa8255p
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261102-sa8255p-eth-phy-v17-1-aa138f2912a0@oss.qualcomm.com>
References: <20261102-sa8255p-eth-phy-v17-0-aa138f2912a0@oss.qualcomm.com>
 <20261102-sa8255p-eth-phy-v17-1-aa138f2912a0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 10:40:21 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: phy: qcom,sa8255p-dwmac-sgmii-phy: unremoved power-dom=
ain-names
--

commit 00c832f9534ae5a6afdd6391553244658cdbc81c
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

dt-bindings: phy: document the serdes PHY on sa8255p

This commit adds the Device Tree binding schema for the firmware-managed
SGMII/SerDes PHY on Qualcomm sa8255p platforms.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgm=
ii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmi=
i-phy.yaml
> new file mode 100644
> index 0000000000000..9e846e3815555
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.=
yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SerDes/SGMII ethernet PHY controller (firmware managed)
> +
> +maintainers:
> +  - Bartosz Golaszewski <brgl@kernel.org>
> +
> +description:
> +  The SerDes PHY sits between the MAC and the external PHY and provides
> +  separate Rx Tx lines.
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8255p-dwmac-sgmii-phy
> +
> +  reg:
> +    items:
> +      - description: serdes
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  power-domain-names:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - power-domains
> +  - power-domain-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phy@8901000 {
> +        compatible =3D "qcom,sa8255p-dwmac-sgmii-phy";
> +        reg =3D <0x08901000 0xe10>;
> +        #phy-cells =3D <0>;
> +        power-domains =3D <&scmi7_dvfs 0>;
> +        power-domain-names =3D "serdes";
> +    };

[Severity: Low]
As reported by Krzysztof Kozlowski on v11 [1], should power-domain-names be
dropped from properties, required, and examples in
Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml?

There is only a single power domain that is attached via the platform bus c=
ore
rather than looked up by name, and changing power-domain-names from
const: serdes to maxItems: 1 leaves the property required for DT validation
while allowing any arbitrary string value.

[1] https://lore.kernel.org/r/20260630-exuberant-dramatic-bustard-068bf8@qu=
oll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-sa8255p-et=
h-phy-v17-0-aa138f2912a0@oss.qualcomm.com?part=3D1
