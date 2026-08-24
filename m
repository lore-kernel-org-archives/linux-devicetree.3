Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FE7757EA
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553986; cv=none; b=uNDAapJmjhM03gV2QfkBVXdSIqJnQaZWb9SJea2VY964U11oJIU2jWe9LkAr7yMDnypA6TYgsv39mgrobKx4l5IaKGLUXfdLiHjwGZQMlPCCPq+5dfavP2241okP4TGW0XU+YhqDwTwtNOqcPRRl1Z1YxpN/+QOqy6DIOiDDIvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553986; c=relaxed/simple;
	bh=w+wQ9efhAPeFGrvyRFNiR1taJteDs7FpbzRRaw4Q1PM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jBSa+OTCrxFdI6WIT08yuxDJP7iJyAqH0t98e1QcLSLWl3c+A98J4DyVuK1TgXxqOWJkyK3zX/OCNzKjP7Xl92++t/h6RdOU3kbg7nZ/BVogZCIIsd3AkCc9f2HaeTAW4ykMK3GMFHUKS5y+k7jlfTpsBtEMKKIYUy9PWBj4zi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/ucQH/S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/ucQH/S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62C51F000E9;
	Mon, 24 Aug 2026 06:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787553985;
	bh=m5idmMQRyvrJppCFlyGgxcZzkj/n2x60W6USKXBwBwc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O/ucQH/S+YEZimLXCjklyjK/voPMArUA2THQkmQcUIlAQYl8Ww6qBffguVJDBINaf
	 1qGQHmIoKmHNRRgPUHdjclNh58urZIOITKgCdjaZ8eMGpMcIgTHxOoluOXVtO5Ogc8
	 8PJdLUTqZyHTIAGUMhkzwRosIW7OyRfLn5H2zjnRdslKQjmghiSAvMDH911DPsJlBR
	 R5Z9mxUJEr1xhPtzYybGHDXnbWgEHkMh1gl4ON1+JU4ZgglAl6seo+z5iZ+Me4m8Q1
	 iT28vpSBm188TIqCIJgDdqAkSnEk7qXinklH6vCE5xBxG9ENx6YUFPiPDgDwh1PKK1
	 lSw+OGT3vx5pg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 06:46:24 +0000
Message-Id: <20260824064624.C62C51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `clocks` and `clock-names` properties are artificially restr=
icted to a maximum of 4 per-AIF bit clocks, preventing the configuration of=
 AIF interfaces 4 through 12.
--

--- Patch [1]: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding=
 ---
commit 4490a4ebecf0bd52b36566a5c2160dea592dd645
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: dt-bindings: qcom,qaif-cpu: Add binding
   =20
This commit adds the device tree binding for the Qualcomm Audio Interface
(QAIF) CPU DAI controller. It describes the controller resources, AIF
interfaces, and named DAI constants for the sound card nodes.

> diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml b=
/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
[ ... ]
> +  clocks:
> +    minItems: 5
> +    maxItems: 9
> +
> +  clock-names:
> +    description:
> +      The first five clocks are always required. Any further entries are=
 the
> +      per-AIF bit clocks (aif_if<N>_ibit), supplied in order starting fr=
om
> +      AIF interface 0 for as many serial AIF interfaces as the board use=
s.
> +    minItems: 5
> +    items:
> +      - const: lpass_config
> +      - const: lpass_core_axim
> +      - const: aud_dma
> +      - const: aud_dma_mem
> +      - const: bus
> +      - const: aif_if0_ibit
> +      - const: aif_if1_ibit
> +      - const: aif_if2_ibit
> +      - const: aif_if3_ibit

[Severity: Medium]
The description states the hardware supports up to 13 multi-lane Unified Au=
dio
Interfaces, but the clocks property is restricted to a maximum of 9 items.
Does this artificially prevent the configuration of aif_if4_ibit through
aif_if12_ibit?

Any board attempting to configure AIF4 or higher would fail dt_binding_check
because the clock-names list is capped at aif_if3_ibit. Should maxItems and
the items list be expanded to accommodate all 13 possible interfaces?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824063627.3595=
610-1-harendra.gautam@oss.qualcomm.com?part=3D1
