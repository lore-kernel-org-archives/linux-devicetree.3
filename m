Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF36F328610
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 21:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779139149; cv=none; b=WGwnUxxzHSGDsc3M5kbG+QnH+3S2bMxpn1i7+QCS8hiQOc1G/sP8tvdqMiPHFVO2uvk4AX1+t6KOVG1NFVJJjgV4vSF9Sk/SxbfyPb2DlRskpXEgapUjNl3225MR3E6W6Iw9RBlvWTzc0TyC+oIT/EMQI0ScwQ2eTkg1P1krcs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779139149; c=relaxed/simple;
	bh=gymc5FTvJVRTw+zQj6kaFoehs0Qk0dP/S0P9R8FbGTo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ENL99FcIHvbxJp/Cok0vuxuL6pZHDwFLHhZJNpR9GAVXhndZYp1Sygdk22e6q+iqWmXZdGXf+pWz5xPeFJMOCDPGZr9yGVlQpoJM9uHhE+nfMuWr7PbESnuIgQx/MmtIH5yE+tDDsHRGmrzWBR4WbBU0i9IEhPuKkioPoI69+7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sq8k8KwT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sq8k8KwT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E31DC2BCB7;
	Mon, 18 May 2026 21:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779139149;
	bh=gymc5FTvJVRTw+zQj6kaFoehs0Qk0dP/S0P9R8FbGTo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=sq8k8KwTSez5rCjw78CBgnkuxTAfkssv2uZsOyGO4adj3llja1j6G/41hKSUUpnSk
	 Bef0htiJeIS44b2/B7HxptrbebpuieicG4XTfan8/SGsjJW3OhWzli7VkpdhYX1Ht/
	 yykfK/G6Grus6n23VyySfh0JAb0VOgAhUUSQSrU+FVdmZv/baIizwf2asKduaIKI2h
	 H5k6EdJ/JdA4WPKxXx7UKj8VAjh2mRL+df4+53Z87V1z0jwYsmbLP8O6nfNjx3l8ar
	 Z0KqypXvLEt+ERpRR8a6Ewy1Z1K/njoRW6Ph2P9DDQiXLq+Ge4dqcnoZt4XxIPXMzD
	 yXjg05h8wOQHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: pmi8998: add USB Type-C and VBUS
 regulator nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: taygoth <taygoth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <10efd57e82ebceedb75dbe3e038af81de4f1557c.1779127507.git.taygoth@gmail.com>
References: <10efd57e82ebceedb75dbe3e038af81de4f1557c.1779127507.git.taygoth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 21:19:08 +0000
Message-Id: <20260518211909.1E31DC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Devicetree schema validation failure for VBUS regulator node due=
 to incorrect name and missing properties.
- [Medium] Devicetree schema validation failure for Type-C node due to sche=
ma routing conflict and missing required subnode.
--

commit d114c820eb701d590cfd5b3e5e83a32def5c8605
Author: taygoth <taygoth@gmail.com>

arm64: dts: qcom: pmi8998: add USB Type-C and VBUS regulator nodes

This commit adds disabled nodes for the PMI8998 PMIC USB Type-C detection
block and the USB OTG VBUS boost converter. The VBUS regulator falls back
to the pm8150b-vbus-reg compatible due to identical register layouts.

> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> @@ -29,6 +29,25 @@ pmi8998_charger: charger@1000 {
>  			status =3D "disabled";
>  		};
> =20
> +		pmi8998_vbus: vbus-reg@1100 {

Will this node name cause a devicetree schema validation failure during
dtbs_check?

It looks like Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
enforces the node name pattern ^usb-vbus-regulator@[0-9a-f]+$ and has
additionalProperties: false.

> +			compatible =3D "qcom,pmi8998-vbus-reg",
> +				     "qcom,pm8150b-vbus-reg";
> +			reg =3D <0x1100>;

Are we missing the regulator-min-microamp and regulator-max-microamp
properties here?=20

The qcom,usb-vbus-regulator.yaml schema strictly requires them, which might
trigger warnings for all boards including pmi8998.dtsi even if the status is
disabled.

> +			status =3D "disabled";
> +		};
> +
> +		pmi8998_typec: typec@1300 {

Does naming this node typec@1300 create a schema routing conflict?

The pattern ^typec@[0-9a-f]+$ in qcom,spmi-pmic.yaml hardcodes a reference
to /schemas/usb/qcom,pmic-typec.yaml#. Since qcom,pmi8998-typec has its own
binding and isn't permitted in qcom,pmic-typec.yaml, dtbs_check might
evaluate it against the wrong schema and reject the compatible string.

> +			compatible =3D "qcom,pmi8998-typec";
> +			reg =3D <0x1300>;
> +
> +			interrupts =3D <0x2 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
> +			interrupt-names =3D "type-c-change";
> +
> +			vdd-vbus-supply =3D <&pmi8998_vbus>;

Does this node also need the connector subnode? It appears to be explicitly
listed as required in qcom,pmi8998-typec.yaml.

> +
> +			status =3D "disabled";
> +		};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779127507.gi=
t.taygoth@gmail.com?part=3D4
