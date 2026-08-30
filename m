Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B2A1DF748
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 04:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788064766; cv=none; b=VQXtNhJwI4DMjUTEkpJPz3dJWDxjYvFOtVm+3dNGpoN5DD+VuuzsVSRbtVXBGLGje1r4tfXyAOfPkV0KBu2g0UxZ7+TNei3717G3uPgVODS6O/RX26bia3QTNQ14kT7f4WYvRIinFH+w9qqkwNEkJDE77Y7Y3acjX5nX9+tnFrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788064766; c=relaxed/simple;
	bh=0hhjNNiDU3RFXY606QK/Q2JbfyFj0oHxtQ+vy7ip/xY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gaV8BbY6QuVyZhQ61HbEikBVSmrnSs/0r02xRArkB3Xvsm7SIk1Ipn8NX36e6W6uhPCQafq2CTEBd4Z52dlI0ZtHZl0obdQR2O0EOtIIMLMkiLr+1p3RFxu5vwYo6PGa2s7Ih1JejBzNaiP1l/caGycOO8K2WsRo5vbYhMgmXwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GuK68q9J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GuK68q9J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6141F000E9;
	Sun, 30 Aug 2026 04:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788064765;
	bh=CzcmOZswlV4UUQ6e7XnyknUlKMBhNUW0p0FL5PKKeSs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GuK68q9Jvt6YcO6MvzxFjjiWSeODaCX9Zsr2aSAHnnk2wkqUcgy75lkQswyOGh1zc
	 x3Ic8LTCNDvEvfUfgvtRPT/74D1IKyGdwWSaXEOM8sW5b45tJpyDqK86DONfK7MMN+
	 RIyVK5Q98LQBfoASNWAmkqSx/wgSuhAzTbrskIBV7T8hi6WwKg60jDc9MK5ZBnVaUI
	 wbR4Ng6/5fS5SsqC4X3d37IKwoWwzUQDYoyhRc7o02E3OdEzQxBhYC6NSPEhsAehDJ
	 Gk9T1VckuZIyLEMQxy4eOrza2v22Vtzq3od2zaMiQP1xYdD9729vKzTAdJMI/5fRz+
	 y5w+nPm2YGuow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Document
 PMAU0102 GPIO support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260830042939.144376-2-shengchao.guo@oss.qualcomm.com>
References: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
 <20260830042939.144376-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 04:39:24 +0000
Message-Id: <20260830043925.3B6141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing main PMIC compatible string ('qcom,pmau0102') in the par=
ent SPMI PMIC MFD binding schema.
--

commit 3791c0eb2161c16b2bc2d4e00e3124ab371b06be
Author: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

dt-bindings: pinctrl: qcom,pmic-gpio: Document PMAU0102 GPIO support
   =20
Add compatible string for the PMAU0102 PMIC GPIO block, which has 12
GPIOs, used on Nord platform.

> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yam=
l b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> index c27e24cb206fc..77be0690c751a 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> @@ -57,6 +57,7 @@ properties:
>            - qcom,pm8994-gpio
>            - qcom,pm8998-gpio
>            - qcom,pma8084-gpio
> +          - qcom,pmau0102-gpio

[Severity: Medium]
Does the parent SPMI PMIC MFD binding schema also need to be updated?

The child GPIO node is being documented here, which implies the parent PMIC=
 MFD
binding must also be updated with the main PMIC compatible string
(qcom,pmau0102).

If a device tree adds a node for the PMAU0102 PMIC using compatible =3D
"qcom,pmau0102", "qcom,spmi-pmic" and its child GPIO node, the parent node =
will
fail schema validation against qcom,spmi-pmic.yaml because it is undocument=
ed.

Should the qcom,pmau0102 compatible string be added to
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830042939.1443=
76-1-shengchao.guo@oss.qualcomm.com?part=3D1
