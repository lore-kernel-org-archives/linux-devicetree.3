Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFBE4156FB
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 21:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679281; cv=none; b=joeNoJyFNKscIdsojcHug0qGCMDUDfgEmZ91VmViSdENSa0ZnyerPhnKoa20fmj+HahWFr+mdLWG1yKS1djw0i8d0G5kpeu6u1xSbaHljojzmAS50cbAFq8xfLe6Y3w7oU45vr2ifBN+JftlHhLIZSexBCFuxAMBp2Iugin2+lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679281; c=relaxed/simple;
	bh=93gE8kbYkPhD312DDkjXwXXms8KyYITmoX3vA3WWl/g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=erKDQtT+r1s0Ybbsk4qn0TxPrIGMW52UCnIYQkVXhigmwLPBpJ/X23Shi+GjAQ+LU8bwJTWQw69EGu1hvDgeKd0U25uf/hVaVrzWfhz26KceRnxFq7p2VFfsvALjs5t+saZYISbh2KZkDj0tCVwNBTDGX/q/ecJmE4jQvUFxCoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NeV0RjzS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NeV0RjzS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AAFB1F000FF;
	Thu, 17 Sep 2026 21:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789679279;
	bh=NycZ8xxpD+szQ7fNi7KljyQrNuf5boM7D+dveD4mur4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NeV0RjzS52eehgjyzMGadUy/ACSYbYistaZ0vSbJ8o5cQfc5p1f2m2evBGODU8Gud
	 Pxxm56jzOpMlAazAPbT9fWVwK2cD5zYiYwyx6Vg7L0KS4wvnUtIU5ykNVBLPt3mqO1
	 5Ec4yNPCSPF7KBL4RN/JCJWG3xaOKvMBaedHppu0IEPRpyRaIYcXdmff1t1p+aI3x6
	 WNUgJv53fSjw6GtzwijWsWoibOG88tB0KaDLjASWvuSuYaGxbMYHKD5QSwTzNg+Ys9
	 n0/3YbuFE/v6hg1HhrbQQda3YF/P1B4sdsUHpXVXgeDqF96l4YgGvwAw/I5UfL/jBz
	 Zt9FEBfw4mFXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] ASoC: dt-bindings: amlogic,gx-audin: add schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260917-audin-v2-1-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
 <20260917-audin-v2-1-38de4bc1de34@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 21:07:58 +0000
Message-Id: <20260917210759.0AAFB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: amlogic,gx-audin: missing const constraint for #sound-=
dai-cells
--

commit 1813eec5eb42b623e2aae169825ca6cb3dcd09e8
Author: Valerio Setti <vsetti@baylibre.com>

ASoC: dt-bindings: amlogic,gx-audin: add schema

AUDIN provides I2S audio input support to the Meson GX platforms
(GXBB/GXL).

> diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yam=
l b/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml
[ ... ]
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:

[Severity: Low]
Should #sound-dai-cells be explicitly defined here with a const constraint?

The binding requires #sound-dai-cells below, but fails to define it in the
properties block with a const constraint. Relying on dai-common.yaml, which
only defines it as true (unconstrained), allows invalid configurations with
incorrect cell counts (e.g., <0> or <2>) to silently pass validation.

> +    items:
> +      - enum:
> +          - amlogic,gxbb-audin
> +          - amlogic,gxl-audin
> +      - const: amlogic,gx-audin
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - resets
> +  - interrupts
> +  - clocks
> +  - "#sound-dai-cells"
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-audin-v2-0=
-38de4bc1de34@baylibre.com?part=3D1
