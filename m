Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470531459FA
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 01:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778723553; cv=none; b=tZgjodcwlz5FGy4S8gQdR283384J29RmHLuHDeFKWv0KS1ktsysO24a2IZpOhRX15BFIVFNOUb6a+v/qtW5IB11kwNkdHYGPiyppMc32gYkgDssFSV9q33DcGOLUo8LNdN89uWh8FnDy7XqXNQXZ+HUdXg2idmShOeoEhvkdlzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778723553; c=relaxed/simple;
	bh=UyHYLXLZMY9gRFX467l/354GOeiiHl+VehLvu4zJ5j4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h72h0Ve5HzvPPE8B8lrnLqfaPGYios0G9nR78PB8yZOYJ7bPTCULOeNxP6rMWo1JMPTESW0LaWOjn/vfyZTQsf10W2Esz9xD2KxsMHHYujn0Xmq+jck9U6UlrT+7nuZuAAoTx+duR99m+K7C0DcG47LX+IPuCMeQjvJe3SCDZR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDVmwC48; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDVmwC48"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC29C19425;
	Thu, 14 May 2026 01:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778723552;
	bh=UyHYLXLZMY9gRFX467l/354GOeiiHl+VehLvu4zJ5j4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=nDVmwC48RlCuT1OCtT48y9bo9bAunxPY2O/G2eGkXN9kxWtaZ91FZzDnuhRUhjJVi
	 PlSYJsdwYvez5Jdz/16LxvCshJUhRJqwxPFWpAds51vQoDMitUtp12ujfEOhVpZsW2
	 20VEhni8Wswcov2OYZynYWp7x61qSwISGvskQnJWnNPCdICyfVuzMOZtzPFGA0Hc5R
	 G9sB7/SRLkWXQS1CE5BhoDPfsiPd1ok9rBbnV/Fbo5+ZdLRuMAsMImIYZx9XdiU+sx
	 2FCZ44oSaz8Yx0rquAmSss/qrLQaQFXJJhm190dj9nbmwN5HmjCUrcvx719koBgtRd
	 I7fdsrdDUn0NQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v29 1/4] dt-bindings: i2c: Split AST2600 binding
 into a new YAML
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513-upstream_i2c-v29-1-fe9926964d55@aspeedtech.com>
References: <20260513-upstream_i2c-v29-1-fe9926964d55@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 01:52:32 +0000
Message-Id: <20260514015232.8FC29C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The new DT binding breaks validation for existing AST2600 device t=
rees by enforcing a new `reg` layout and removing `bus-frequency`.
- [High] Renaming `bus-frequency` to `clock-frequency` causes a silent perf=
ormance regression with the legacy i2c-aspeed driver.
--

commit 625f06e7b4752a6769de1b97b793eb2043bda8de
Author: Ryan Chen <ryan_chen@aspeedtech.com>

dt-bindings: i2c: Split AST2600 binding into a new YAML

The AST2600 I2C controller introduces a new register layout with separate
controller and target blocks. The binding for AST2600 is moved to a dedicat=
ed
aspeed,ast2600-i2c.yaml schema, updating requirements like enforcing two reg
regions and using clock-frequency instead of bus-frequency.

> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yam=
l b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> new file mode 100644
> index 0000000000000..de2c359037da5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-i2c-bus
> +
> +  reg:
> +    items:
> +      - description: controller registers
> +      - description: controller buffer space

Will enforcing this new reg layout break validation for existing AST2600
device trees?

Existing in-tree device trees define a single reg region. Because these dev=
ice
trees are not updated in this patch series, make dtbs_check will fail for a=
ll
AST2600 boards.

Should the binding retain backward compatibility by allowing a single reg
region for legacy nodes?

[ ... ]
> +  clock-frequency:
> +    description: Desired operating frequency of the I2C bus in Hz.
> +    minimum: 500
> +    maximum: 4000000
> +    default: 100000
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - reg
> +  - compatible
> +  - clocks
> +  - resets
> +  - interrupts
> +
> +unevaluatedProperties: false

Could renaming bus-frequency to clock-frequency cause a silent performance
regression with the legacy i2c-aspeed driver?

If a device tree is updated to conform to this new binding (by replacing
bus-frequency with clock-frequency) but does not add the aspeed,global-regs
property, the legacy i2c-aspeed.c driver will still probe.

The legacy driver relies entirely on bus-frequency and does not use standard
helpers like i2c_parse_fw_timings() to read clock-frequency.

This will cause the driver to fail to find the bus frequency property, log
an error, and silently fall back to the default 100kHz, which will degrade
performance for fast-mode devices.

Additionally, because the binding sets unevaluatedProperties to false and
removes bus-frequency, existing device trees that still use bus-frequency
will fail validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-upstream_i=
2c-v29-0-fe9926964d55@aspeedtech.com?part=3D1
