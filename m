Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDB3441630
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771390; cv=none; b=s+yrWCy9Z6FAmmBs6T7D+svE2fXBVOoXPAzoZ7sJpLs2zAGQhYazaiUrpDJRGfkVuE1Evj4pKpopvcs+7oNxrBneYLTDDTMa585zPcpwJKYgrTxPLLVGM4UNrR2D5q1J0LOl4KxWHpsRYElLXX9T3TH1M5s/Wee6g1g2rvR5ynk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771390; c=relaxed/simple;
	bh=NcdhYVJ1sqD6GxHNNwAR3QRx5R4g4B6CwdOSnnBEoVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t2vajdpzSSSb6RIhxY2oThNqe107BFlGZN7lFPW/Gli0e3/JNLM8deHwjq1wSt+aBXX/U28XvunV4IbAtzDvA9dHa234r9S19rMgLVucBB4ditvXPjigSnqg8+J/QCPIkLpN3cpwOBvm9vH161v8wuMslFTiM2N2WuzUtaDqGkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGZWsrjw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGZWsrjw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB49B1F00A3A;
	Mon,  7 Sep 2026 08:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788771388;
	bh=+kCET2imxK2yZdAtfBULqHqcD+wl7rtzT8UIyH6zyQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DGZWsrjwLF/nDN3doeIs1WZTEPr9v/l9rAY7KqBnUsLBRKg9X34D2l2kFrJTPibDR
	 hqsXi4UHyU/Zoc+PIj2ZNwxPhpJRki9YCQ4wJdaQybYjzId+9ThGqkn93nPEZg6Mfd
	 Murz6L/V19JHdO1x61ovPfhTTSkQvLE9a9EV7hsZDp+GZ8b4plbE9AKUQR0Bgx5PWQ
	 NgjP2skTW6P1FOsvOBwS4WKsAjORdsbyrlq5Q5bETDxSSdRzP9y73zlXQGUVooMk+p
	 mQobL+1/HGW9pLpk7FUHgwpTHiWDgeAv/k5f0Qx59gS2imm33ZXx4xCyy6RQREOsI+
	 XMHUGTDyclCFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/11] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907083727.733705-11-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-11-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 08:56:27 +0000
Message-Id: <20260907085627.BB49B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The vendor-specific compatible string violates the strict SoundWire=
 bus schema pattern constraint.
--

commit 21a3dc5b2580f691e90cc1ec8c4f97f3b064cd1b
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

dt-bindings: sound: qcom: add Tambora WCD9378 SDCA codec

This commit introduces the device tree binding schema for the Qualcomm WCD9=
378
(Tambora) SoundWire codec in SDCA compute mode.

> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yam=
l b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
> new file mode 100644
> index 0000000000000..9a6c309018edd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
[ ... ]
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,wcd9378c
> +      - const: sdw20217011000

[Severity: Low]
Does this vendor-specific compatible string pass validation against the
SoundWire bus schema?

When dt-schema processes a device tree using this binding, the parent node
matches soundwire-controller.yaml. That schema dictates that child nodes
matching ^.*@[0-9a-f],[0-9a-f]$ must have a compatible property matching the
regex ^sdw[0-9a-f]{1}[0-9a-f]{4}[0-9a-f]{4}[0-9a-f]{2}$.

Because dt-schema enforces string constraints on all items within a
compatible string array, the presence of the qcom,wcd9378c string appears
to trigger a validation failure during make dt_binding_check.

Should soundwire-controller.yaml be updated to explicitly allow standard
vendor,device strings alongside MIPI SoundWire IDs, or does this vendor
string need to be removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907083727.7337=
05-1-srinivas.kandagatla@oss.qualcomm.com?part=3D10
