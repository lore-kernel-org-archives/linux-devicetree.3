Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6132A3815D8
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 20:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452978; cv=none; b=mQkgUzkv/z1z+rCMeSnrl5ngRn0ZQLC2uopTwlBbuS1iCpyaY+RVO+yciS6uaa/Z0kGF3xaknoaqPeQRIzZGIbIIEmBRWdhmx++904JDwoVKltQ0i2J4meolwZdhjjcJg5X74R2Po1DamPfQQZHt8VgTfMWZiMDwZrfp0dsa2kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452978; c=relaxed/simple;
	bh=qv9x8zaEWYTGC4WywS24GKR82kXju2g7QhVNbdb/hTU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dp757jmBrtMIy+wrtznTTFbE0YVGmcOTB8d7dUaJkTmWonfX0cvQLO7x8mYyCUI0WmaHR1QvZV8L0u589gIb7PI7p5UXYVK4i0YBagorZahqmUs1rZP1u3g0SqtSFHdU6J8sZzQbrzk6sxta54UTD5hCWpKmWcnMeucGKPo3a/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmFeibXO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmFeibXO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D8B1F000FF;
	Sat, 26 Sep 2026 20:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790452976;
	bh=bcbNiofHdgufxL2xUhRI6FQ0uHvFSqZr9A9q1MbOl5o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QmFeibXOfZ6v+bJWRuMc9RIAFXB7B8s/yxBLJlafQiwKhifqOW/1s+/2WI3Xnvydo
	 gsF0mos8nzkycl9ckdKeMKNnQl0LjCb0GodKFWkLGnoxEyX9cJnxO3j7bmcK0PKPpg
	 YFfoKraX+kxQiL/WlOcG6ky20UDa6zBDF2MB7mQPDfAQII29zLOEGkL2b3PuDtMksg
	 20CWbxXU7K0oKi4Mgl+lbU3I5rGzBxZKHBFICNx4hvoPgvq5krMxarLO7gD01Q1GzU
	 4+4b5+ZkUDQ3Hp8PoZRWMYiPJQ5qcTnuv7xdSGCN7QJn14oTiLjKwPofbIeM+QdQuT
	 5ZcAjWHTgwBWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc8280xp-x13s: Add embedded
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: Clover <alex@ironrobin.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260926195415.5995-4-alex@ironrobin.net>
References: <20260926195415.5995-1-alex@ironrobin.net>
 <20260926195415.5995-4-alex@ironrobin.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 20:02:56 +0000
Message-Id: <20260926200256.A2D8B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: forbidden input-enable in TLMM pinctrl
--

commit 3b04b58deccd1a5510d626dacae4e53b304e7984
Author: Clover <alex@ironrobin.net>

arm64: dts: qcom: sc8280xp-x13s: Add embedded controller

This commit enables the embedded controller at address 0x28 on i2c8 with
GPIO103 as its falling-edge event interrupt. It also configures the QUP8 bu=
s,
the GPIO103 input, and the GPIO176 active-high power-state output.

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b=
/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 218573a97785b..1b875809773da 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts

[ ... ]

> @@ -1571,6 +1590,21 @@ sc-rgb-xshut-n-pins {
>  		};
>  	};
> =20
> +	ec_int_n: ec-int-n-state {
> +		pins =3D "gpio103";
> +		function =3D "gpio";
> +		input-enable;

[Severity: Low]
Does this property cause a dt-binding schema validation error?

The qcom,tlmm-common.yaml schema explicitly forbids the input-enable proper=
ty
in the TLMM pinctrl bindings. While PMIC pinctrls allow this property, the
TLMM (Top Level Mode Multiplexer) pinctrl bindings prohibit it, and running
make dtbs_check will fail with a DT binding validation error.

The driver consuming the GPIO establishes the input direction (e.g., via
gpiod_direction_input()) rather than relying on the pinctrl configuration.

> +		/* Preserve firmware pull configuration; no bias override. */
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926195415.5995=
-1-alex@ironrobin.net?part=3D3
