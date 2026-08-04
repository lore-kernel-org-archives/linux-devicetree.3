Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459332AD37
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 21:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785877293; cv=none; b=vBDrFXNHSC/NOW6kqVmHx+Iu1HJ8Y6AfQNtHMeKuZ+l1OLUWBxj4324mkljRjlO8GSx0SKKFCfbMCKfqDm8ch71IDJTUrmdpQXBCjss0cWie6OjDT7mV5BAKYz6QfgYJnBRP+YQFPnjZ1/2/iShvc1uhsWI2sf14ecFYnpw/27c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785877293; c=relaxed/simple;
	bh=7/5v4ZTBfmpS6G2byJ5eoC+6/9xh0H1hjqZ1oPePxao=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GWSpNjxLkJCJGyID4AXHbrStZiObej6VcTSn6w1T5rN0KiQiSEBbqukycRsQO4GQHdzJYCEadNUv0hhEdY0GFJqmgv5KtBNTWaqu3YxC46yjlnYRqjMc3R7472i2V3gM5UMl4J90zc5YUyUTxikk6CsM6tuJyMGpT1opbo2GtUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mACRRa8p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mACRRa8p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37541F000E9;
	Tue,  4 Aug 2026 21:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785877291;
	bh=2mefUfUOSQEb3Po3WvN9Rb739lGP7HL7Hfbyuo5l7sc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mACRRa8pgG9vNfwCDg/hkmoIsxqTKnsnXDZUvUe0Tu+NyMyvOdusDphEArPh/N/tr
	 lGWJJyt+5zEhbKfB5TcAc/IUqn/5Q7ntGdMxyP8fX2x9dADfUgGj6jfwpQUxGs4gy4
	 guPJk4AbtVp4qeSwInbPtIUMB180PGOu5AanVFsO/YZxbS8Dd+MslFIcMrJXpdsRlk
	 WucSAo5k2ZcbZKPELnFplWO14CBPkIELsj+16FoPdCCnk4zUg6RwCPF0xA6HGHBU7i
	 fk8pNAsSD9nExW55dLJE69JMWRusQpNvt03oSjyMimqzXqyRgHddfF4fRJVKNbmhgv
	 F7px7JQUOhW7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: display: add a device tree supplied
 boot logo
Reply-To: sashiko-reviews@lists.linux.dev
To: "Max Pedraza" <maximpedraza@gmail.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260804225617.264861-2-maximpedraza@gmail.com>
References: <20260804225617.264861-1-maximpedraza@gmail.com>
 <20260804225617.264861-2-maximpedraza@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 21:01:30 +0000
Message-Id: <20260804210130.A37541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `memory-region` alternative is completely broken due to conf=
licting top-level `required` constraints and a missing property definition.
--

--- Patch [1]: [PATCH v2 1/6] dt-bindings: display: add a device tree suppl=
ied boot logo ---
commit f24f24c36e68703fb2282044b3ecdd6fe92fa5c4
Author: Max Pedraza <maximpedraza@gmail.com>

dt-bindings: display: add a device tree supplied boot logo

Embedded products frequently need a product specific boot logo. This commit
adds a binding for a "linux,boot-logo-clut224" node to allow the boot logo
to be described by the device tree instead of baked into the kernel. The
image can live in the device tree directly or in a reserved memory region.

> diff --git a/Documentation/devicetree/bindings/display/linux,boot-logo-cl=
ut224.yaml b/Documentation/devicetree/bindings/display/linux,boot-logo-clut=
224.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/linux,boot-logo-clut224.y=
aml

[ ... ]

> +required:
> +  - compatible
> +  - width
> +  - height
> +  - clut
> +  - data

[Severity: Medium]
Does this global required block conflict with the oneOf block below?

Since width, height, clut, and data are unconditionally required here, any
node attempting to use the memory-region alternative will fail schema
validation because it lacks these globally required properties.

> +
> +# The image either lives in the device tree or in a reserved memory regi=
on,
> +# never both.
> +oneOf:
> +  - required:
> +      - width
> +      - height
> +      - clut
> +      - data
> +  - required:
> +      - memory-region
> +
> +additionalProperties: false

[Severity: Medium]
Can this schema successfully validate a node using a memory-region?

Since memory-region is missing from the main properties block, setting
additionalProperties to false here will cause validation to reject any node
that includes it, completely preventing this configuration alternative from
being used.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804225617.2648=
61-1-maximpedraza@gmail.com?part=3D1
