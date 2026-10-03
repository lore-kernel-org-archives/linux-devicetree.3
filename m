Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3795B3BFACE
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 09:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791019366; cv=none; b=FClDGwieQvzffgbHcAYG1S46hz8rLo4vVIN7kuM1vWfUIDZOJNaa+Fp4Ak1dZa5KXKv2kU8IsSfsdMm2+teMLqm4VX38Twol/Qro01brpxV3kW8p07Eu7eGdbd/UDf5LUAVVUzbBrBxowfvCnOEMynxvRgJysLGt0sjRFaEDAGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791019366; c=relaxed/simple;
	bh=/Wk85v3jo9xt1p1B/wN9CBO5jo1zrePG/aqmUxhh5JY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jBPmboYdICrF/Z4uxMiRg14FEX9qoOiF0YcjBWmv1eYoDli8B7FFtnSrJNck7PJKtOv59RDbjNQwGcBMBVcDMD8BxJGkwxhpoxjX/hnXV447AL/AzvqIilPFXqAuORikX97XkSPTopCcZCStMa2v1rGlk+BXaCqMJCI/EyLWa9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ugsj6e+c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ugsj6e+c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D274B1F0089B;
	Sat,  3 Oct 2026 09:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791019363;
	bh=4YriDajU2vsAUKwOX/umGIRTGAtDYYHxjr3s6m9SK3Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ugsj6e+cip1P4yOcNHkdSYBKtEGfOMVCxqxj4IsYk4d/hlz82PE0RLcziQS59tPjr
	 tyCdv9JC0YFs3gCUPk3EBL7Q5yVtXwBD078X9NsJSQSQP2Dvf6+j53rcy1+cxYdwLm
	 P+ECa5Mzr09tys30KxbfjUNJ6qDY77yQbyB87Dm1sDegKEICgFAEPpUXQz6gc+bhQL
	 coA6ZWJ15aFkDgRrDaiDr6f6b41XaB6ZCwpGwpUZzU+FG769yT9HWceZ3/BCp+S9fL
	 BBziH8FgncL3TJWWe8MqIXayNEsugMzhgv3F4NZyVEwTLTX9o9M96XvTbfATA/Wiwx
	 YpFI8DP8ztbUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/3] dt-bindings: net: wireless: qcom,ath12k: add
 disable-rfkill
Reply-To: sashiko-reviews@lists.linux.dev
To: Franz <franzelfranzel@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261003091509.4822-2-franzelfranzel@gmail.com>
References: <20261003091509.4822-1-franzelfranzel@gmail.com>
 <20261003091509.4822-2-franzelfranzel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 09:22:42 +0000
Message-Id: <20261003092242.D274B1F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing vendor prefix for disable-rfkill property
--

commit d593ac46878299b5684cd1382162cee9211044a1
Author: Franz <franzelfranzel@gmail.com>

dt-bindings: net: wireless: qcom,ath12k: add disable-rfkill

This commit adds a disable-rfkill boolean property to the Qualcomm ath12k
device tree bindings. It allows DT-based platforms to indicate that the
hardware rfkill input is unusable and should not be enabled by the driver.

> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.y=
aml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> index dc68dd59988fc..d56050e77a5b9 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> @@ -27,6 +27,13 @@ properties:
>        If present, a board or platform specific string used to lookup
>        usecase-specific firmware files for the device.
> =20
> +  disable-rfkill:

[Severity: Low]
Does this custom property need a vendor prefix?

According to standard device tree design principles, device-specific
properties must use a vendor prefix. Because this property is not defined in
any generic wireless or core schema and is introduced specifically for
ath12k, should it be named with a vendor prefix, such as
qcom,disable-rfkill?

> +    type: boolean
> +    description:
> +      The device's hardware rfkill input is not usable on this board (for
> +      example, it is not wired and reads as "radio off"). The driver must
> +      not enable hardware rfkill handling.
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003091509.4822=
-1-franzelfranzel@gmail.com?part=3D1
