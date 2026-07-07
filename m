Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CC22E764D
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 08:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411988; cv=none; b=Wax8KvC9+7Sob/ykCuiduMARdJmTFYaU4oZBLaEwArkvE/XUCgs/U6OD81Z2O/VtpFOrgijhxB8xmUW35G31dRsSFfve9RPyIdbFENiLTDEbQyycyFmBNBYc6ClWIY1BVMyKAeDQBllzWorNd2zI46pKkeVKqzQBJVJSqoAxirE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411988; c=relaxed/simple;
	bh=GgsvgCVdE6iEDPDAuxu3CmgHOcd6pzZ3DL0qZEWKFyM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VocJfz9Jzr8DNPN3VGlzfvNzPo8HT1cTKoOuSdiYmdmz9Wj7j1HyD//GssEDuEeEbbMp+edQLSpmW2Ep8T3gan5KyJLGA0YmKbp9PCpbGcYEqQX27k6vQjcvovX1W3Oc28YI2tq5ltsev6mQYDWvhu9HOP7azvoO3+BuHmXD85s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oAGHURDL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oAGHURDL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA0D31F000E9;
	Tue,  7 Jul 2026 08:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783411987;
	bh=GgsvgCVdE6iEDPDAuxu3CmgHOcd6pzZ3DL0qZEWKFyM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oAGHURDLInn1N2jOH6ApIggaPG/D8bfsrGUnNVsvOf74sFTEhvjc7zueEMTbIV2kU
	 ZbmSRCQ2e2Hi2Cq3HgTkenrMI4nhrYllBd1RmbFJ6z/Ydz3BVziXKCidmN7Z6shqh1
	 llNcI/kazlWBElbUDGqUZGR/ffx4WNsrJ7ja/VZjOKHMTvY1LHWN2xlOAj4M9oatqn
	 w1fKPaMquuOhqLyOreYo3wxc2c8bc7Mp4W19NMMtu9x+eeapXuuRGUkUzmCRqMMPVE
	 JhHAYmNewD6e4QfCaqvJV2PKgByb1GYQDw2GZUtGmM3DQgYZF2f+RI0MX54l/kPDlW
	 YsK1VNa7IQqYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Revert "dt-bindings: i2c: Describe SA8255p"
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260707080229.3795971-1-shengchao.guo@oss.qualcomm.com>
References: <20260707080229.3795971-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 08:13:06 +0000
Message-Id: <20260707081306.DA0D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reverting the `qcom,sa8255p-geni-i2c.yaml` binding completely re=
moves strict validation for the SA8255p GENI I2C nodes, allowing invalid de=
vice trees to silently pass validation.
--

--- Patch [1]: [PATCH] Revert "dt-bindings: i2c: Describe SA8255p" ---
commit 372cd0ac425472b6963cd0afcbe473297a95844e
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Revert "dt-bindings: i2c: Describe SA8255p"

This commit reverts the addition of the SA8255p GENI I2C binding, stating
that the compatible string is already defined in the geni-se-qup schema.

> diff --git a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.=
yaml b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
> deleted file mode 100644
> index a61e40b5cbc16..0000000000000
> --- a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/i2c/qcom,sa8255p-geni-i2c.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: Qualcomm SA8255p QUP GENI I2C Controller

[Severity: Medium]
Does removing this dedicated schema drop strict validation for the SA8255p
GENI I2C nodes?

While the compatible string is listed in soc/qcom/qcom,sa8255p-geni-se-qup.=
yaml,
it appears that the wrapper schema defines additionalProperties: true for
the i2c@[0-9a-f]+$ child nodes.

The wrapper schema also lacks references to standard I2C constraints such as
/schemas/i2c/i2c-controller.yaml# and does not enforce required properties
like reg, interrupts, and power-domains.

Without this file, will device trees utilizing qcom,sa8255p-geni-i2c with
missing or invalid properties silently pass dt_binding_check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707080229.3795=
971-1-shengchao.guo@oss.qualcomm.com?part=3D1
