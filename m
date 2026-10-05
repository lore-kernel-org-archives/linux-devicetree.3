Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2FA4CEE55
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 16:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219380; cv=none; b=ZO7PblsfGP7KPM1j94lMcVDdrB7GF0uqSpVffTozK6i1rL4s1kU/3XdOrksjPi5asda5Xdd3/7dWSQczCBmZ/CXiPGNAygB8IxMtPM+Z9C/nukh3QkMlnrp/Z95Mw2jdJr4ZrKH89n16JcsBW874bJd8UM734ezKP04zQRevw3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219380; c=relaxed/simple;
	bh=JTrBiyqD0lUb+QwfzzhQXkHOqyC/s6RuyBglhjvJ3xI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BI6xeD92gv+VXcd3WFacegUTlny/Cp4as1/w7/wlSKFDB5cucWJjqLGnIq8Vd/8iB1HB83Tz27StVeEq6rV4uCwwKggMSnXsEkBVMWZmLsVcaMnNrfdaD2zaGIqDp2TZD5soEZWkBf9fe9cHSOYFz8omEe+f/KOwqu0Elce3amM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UChcmhiv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UChcmhiv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9B01F000FF;
	Mon,  5 Oct 2026 16:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791219379;
	bh=3+1uMuLL/jofbJP2jwSmQerzameqLpR4TIAxFoa04Wg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UChcmhiv/7+g2Gj4PLlc5PiHSvSaXbLZD66KYjn/01kWdMYQF+boOGVk7fffR9627
	 /ojTazdlZtKgPtbP+m8nl9gr+THMnMeEcRdTh6JHkamgvIAujZGmZJJmQxHCS6MSGr
	 qkamHXxKR4uYnnZuNaIujm0aUcxL7Y/z0udfDIbCZZW8ltaj0LKQI3OHyFDv8cRZEl
	 CSkUpPJi1CQW8J7W3kPIsQF0+JuUu63E/htXj8XGbdDSBEELCdaNhTVlXOmFjAJviq
	 +4GsTXokFzRKYt8RkRiWQwjChn+8icYdJu/PZnHSHmbklgp63GAA/Z52DRrLMuh1wt
	 uutmMgMTS1AdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: Add Qualcomm I2C target
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Viken Dadhaniya" <viken.dadhaniya@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261005-i2c-qcom-slave-v5-1-6254cc7c08d3@oss.qualcomm.com>
References: <20261005-i2c-qcom-slave-v5-0-6254cc7c08d3@oss.qualcomm.com>
 <20261005-i2c-qcom-slave-v5-1-6254cc7c08d3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 16:56:18 +0000
Message-Id: <20261005165619.1D9B01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: i2c: missing i2c-controller.yaml ref blocks child nodes
--

commit 2517ccf310dd7ed641c5e449dcf2f13f3b127674
Author: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

dt-bindings: i2c: Add Qualcomm I2C target controller

This commit documents the device tree bindings for the dedicated I2C
target controller hardware found on Qualcomm QDU1000 and related SoCs.

> diff --git a/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-targe=
t.yaml b/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml
> new file mode 100644
> index 0000000000000..9a6b08f0ab0e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - interconnects
> +
> +additionalProperties: false

[Severity: Low]
Does using additionalProperties: false in=20
Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml without
inheriting from /schemas/i2c/i2c-controller.yaml# strictly reject standard
I2C bus properties and forbid child nodes?

If a developer defines a static I2C target backend (such as slave-eeprom) a=
s a
child node of this controller in a device tree, it appears this regression
would cause a dt_binding_check validation failure.

> +
> +examples:
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-i2c-qcom-s=
lave-v5-0-6254cc7c08d3@oss.qualcomm.com?part=3D1
