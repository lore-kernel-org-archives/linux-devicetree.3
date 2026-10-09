Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4F641D103
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 09:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538337; cv=none; b=kCfm94Tr5mQby9RVr/+brL69glzv+2TPYvtCCk3rGUHWVepYzDYk9/kZYtrCeh+bdyWfma6Qw2B734kDZV96PGR5R38hXNy7ujSOlZtEzW51eFUk6L+eJ2qPsQX2gyWD1i+eFMYDVErHXfApJUd2Lp6W+6UD2xw6MIU0GwLamgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538337; c=relaxed/simple;
	bh=aviA4dawSdE/OHU++ZFKqVgOq0KaIYi+XqT3zGthCM8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Ms6+IzR61qN16Ge0p5jN8APRGupQemSsd2bii9OvACY7JQprtUWp0ticdBEwW37YCQObqUb0SRm+lPlWo2d1uiA6YwjVSvHzAfFkA2L8hhcljIsbQj05c0hcmyuF1sPCw0cfHQMkSrdA1kqLM3j4tiEuhnmWNK9My7JgDKgt874=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=okO5KedW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="okO5KedW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1A61F00893;
	Fri,  9 Oct 2026 09:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791538333;
	bh=3/C5MhD9EP0/E0ETY/v1CZi0zC9BGB9BzfubbRyLXvQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=okO5KedWTY2J0DxLPx9T4c/6SCVcFkDCOyzZmvbXV+C38lS+OtzBBgubxwVjW3FAz
	 +X3W7gBY5hQAQ30zOPc8Y26AI7xE1Pgn1JNS6GhJ1Q4jRsfpYpFfkMM81OEPaWUZt0
	 nfSveYfjdbI/lPn9kAOAX/A7+qUGc3+rUP2+HJ7NE6pJozzPpeB6Ynk1CHs6NAt4+C
	 V2+mBTHKg0lRecYoQ1YpFxkAYfwPu7+By5I/MVmZU7NoHu9ekEdUrSKkpAHJl+zJ02
	 pRbSMUwaemAxO1f1iQLqLH9GSMR22A8kBWMyoU9mhNiM71y6AigQnl1saBe1gZb7OU
	 kXEDTMtPgbC/Q==
Message-ID: <sashiko-outbox-165170@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009092552.2377960-2-joakim.zhang@cixtech.com>
References: <20261009092552.2377960-1-joakim.zhang@cixtech.com>
 <20261009092552.2377960-2-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 09:32:13 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: loose schema constraint on dma-names allows invalid co=
nfigurations
--

commit 41d6caf5f15433436b2c0289025efcf429404414
Author: Joakim Zhang <joakim.zhang@cixtech.com>

ASoC: dt-bindings: Add Cadence I2S-SC controller
   =20
Add the DT binding for the Cadence I2S-SC controller integrated in
the CIX SKY1 audio subsystem. I2S-SC is a full-duplex stereo
controller supporting standard I2S, left/right-justified and DSP
formats, plus TDM operation with up to 16 slots.

> diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml=
 b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
> new file mode 100644
> index 0000000000000..3fdf2334c4926
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml

[ ... ]

> +  dmas:
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      One DMA channel for instances wired for a single direction, either
> +      "tx" or "rx", or two channels for both transmit and receive.
> +
> +  dma-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum: [ tx, rx ]

[Severity: Low]
Does this schema definition permit invalid DMA combinations?=20

Because items is set to just an enum, this allows combinations like ["tx", =
"tx"],
["rx", "rx"], or out-of-order configurations like ["rx", "tx"] to silently =
pass
validation.

Is there a specific ordering and uniqueness constraint expected here when
providing two channels?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009092552.2377=
960-1-joakim.zhang@cixtech.com?part=3D1
