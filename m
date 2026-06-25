Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0889532E696
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384349; cv=none; b=OnKDCP+wpnFlsBVwxexclgDwP4xROvPY8v5O5C3qCTkGa/sRYnhuJWPPUgcGjX/O8rqjyPyG4fe9neKWmA1xuXGtCjbcOGL4r6CZiI7Bu3KCcU7o0U6s4jYbLWPIhRLNdlcyDwZKWVB3USoYLPoy2kp/U5xQf3Jyv1HEM3xhQt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384349; c=relaxed/simple;
	bh=WVik+hraoPFmTbhUHaYuDj8NB2eqCfv0/cfdz7dlh94=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PzfI5FL6/UfyHoItfu3qNO5EuQPaaXMO8iqhis4AZfM7Q/FJ0CUFKw1Ax1rfqq+0ax/0rIQenQaTvGJ0FP9fJwcIikORb8YGCDiKItJOr1+pZqD9ZSUeY6n3E4GvOkya+KqzqFcSGVKDXtPHF433QLl32E0kfIxyE3TTpoM2H7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGsy64w7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGsy64w7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE141F00A3A;
	Thu, 25 Jun 2026 10:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782384347;
	bh=4EKNJO6Az85qJ7s8ZTUv50f+rg1LP1DH4JbSdO7igHQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BGsy64w7RoOsGPFeVVdg8GwbS+WZ9A8atjrxzzUIaqWR4Z+BHno3/pIVXXjeP446r
	 cU+7q6jyKPmhInR+GNR2Z+0n2nEmOygTelIdOigHyuRiCh0wlBohGjzzchf/X8O9IH
	 QJp3IQo13/O0qOAJDoA4YCPEWdRkcf3hiH5DGEku+TmnrT82IlNPJtjwGBVih5SaTT
	 EwGjfy2vMYD8ACYrvaYc3DD++6Lbfujgv86Px0uw9KSHPO8vz5PKRoDALrBJR1ENr2
	 wfzTQ71bzE53vTGYGwAvD9Vmuq+wqW3O4B7dYrsFBy1m7QyAP3d5k2ryFND2rTXxVw
	 CsgdI9WPEkd5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: pwm: add support for AE350 PWM
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Zong-You Xie via B4 Relay" <devnull+ben717.andestech.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260625-andes-pwm-v6-1-3aef11711017@andestech.com>
References: <20260625-andes-pwm-v6-0-3aef11711017@andestech.com>
 <20260625-andes-pwm-v6-1-3aef11711017@andestech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 10:45:46 +0000
Message-Id: <20260625104547.5AE141F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The DT binding defines a specific software use-case (PWM) rather=
 than holistically describing the underlying multi-function hardware block =
(ATCPIT100), omitting inherent hardware properties like `interrupts`.
--

commit efdd46b6c3b84eb1768cdcc54800ffa3c62afeef
Author: Ben Zong-You Xie <ben717@andestech.com>

dt-bindings: pwm: add support for AE350 PWM controller

This commit adds the device tree binding for the ATCPIT100 PWM controller
used in the Andes AE350 platform and QiLai SoC.

> diff --git a/Documentation/devicetree/bindings/pwm/andestech,ae350-pwm.ya=
ml b/Documentation/devicetree/bindings/pwm/andestech,ae350-pwm.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/andestech,ae350-pwm.yaml
[ ... ]
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - andestech,qilai-pwm
> +          - const: andestech,ae350-pwm
> +      - const: andestech,ae350-pwm
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - "#pwm-cells"
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
[Severity: Medium]
The commit message mentions that the ATCPIT100 block is a set of
multi-function timers that can be used as PWMs or simple timers. Does
this binding restrict the hardware description to only the PWM software
use-case?

Since unevaluatedProperties is set to false and the properties block omits
inherent hardware properties like interrupts, will dtbs_check fail if a
device tree author attempts to accurately describe the full ATCPIT100
multi-function hardware block by wiring its interrupt lines?

Would it be better to describe the complete hardware capabilities upfront,
such as timer functionality and interrupts, to prevent redesigns breaking
backward compatibility (like transitioning to an MFD or adding #timer-cells)
when timer support is needed later?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-andes-pwm-=
v6-0-3aef11711017@andestech.com?part=3D1
