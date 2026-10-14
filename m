Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA3F4B8260
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 22:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017712; cv=none; b=sKI3I6fst/0s9/xllxdjwBx95XHqb3ures0yaBD3gfihWYwLJWQe9Ujdrketzvkz3mcw9Ax2r4maTRbv1A0mVAstjyO3A/oFxyV/mX7pFw4Ih5bwr2eXOUq0OeEN58n0AX1cqxw0e6Dfl/SyhkXs9NDzIqCo2PxRe5Fruz0zW4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017712; c=relaxed/simple;
	bh=bYYeADo2NLg7LCQtJUvzEwHKi+T5IrpzE1JPoQvEyVI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=esy9vnkS8CpuabIrGnMLBPrSugHFsPGlf9tJ0yzTP8rjp6YvMqWjuvngBqwUTQpRVCKYV3gtaaWx8OFKwgQMUJvrx/0IbbAf0glWJBbKsudvTw7pPPhQpmircckQFw+H7PaL0tbxZ7LuOVZPc/trHPj02srfVAKI7W+70aQN7H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nh/OKNGX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nh/OKNGX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3801F000C6;
	Wed, 14 Oct 2026 22:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792017707;
	bh=SSrms01gS5BmIKzgT8v/zRlj9PUGyFSSuslDFYjKRWc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nh/OKNGX2HqgiIq5s4HI3mf3YQQwIzaQ9Y+Gi0z+CU5s0ZO70f/uAI765K+W6aIbx
	 H/tBze0QlxWcedMcIDi/9eIyE/yNzPycQZ1Iw/sFS5XyOQajWSwNhFDBIAw2DOytBY
	 zmGoRb5bJrPOq7bypqcMpgp3vbAhd0V+6wqbnFXZ3c9dkivg/Stwlg/DhcErA5zfpJ
	 QLxiiQoBR9joA37bIs0tO1Z6oXQ4EmGfw4S5DMIA85kNjnax9sjl5Ui3GQpWVFSsEf
	 F95QNHoiU+G028hqqO0E8+YlOYKONUrhjUJgB5X1+6vYeHvcvA6FHFNbCI3Po96orD
	 papt+eE8KJ+IQ==
Message-ID: <sashiko-outbox-171992@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 02/12] dt-bindings: dpll: add SiTime
 SiT95316 clock generator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013224131.27149-3-arouhi@sitime.com>
References: <20261013224131.27149-1-arouhi@sitime.com>
 <20261013224131.27149-3-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 22:41:47 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing maxItems constraint for supported-frequencies-=
hz
--

commit 6b7fe4cd90d007b210798a0e52bd9d32e38cab03
Author: Ali Rouhi <arouhi@sitime.com>

dt-bindings: dpll: add SiTime SiT95316 clock generator

This commit adds device tree bindings for the SiTime SiT9531x family of
clock generators. These are I2C-controlled programmable clock generators
with integrated DPLL functionality.

> diff --git a/Documentation/devicetree/bindings/dpll/sitime,sit95316.yaml =
b/Documentation/devicetree/bindings/dpll/sitime,sit95316.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dpll/sitime,sit95316.yaml

[ ... ]

> +  input-pins:
> +    type: object
> +    patternProperties:
> +      "^pin@[0-9a-f]+$":
> +        type: object
> +        properties:
> +          reg:
> +            maximum: 7
> +
> +          supported-frequencies-hz:
> +            description:
> +              The rate wired to the input, in Hz, as a single entry.  An
> +              input runs at the rate the board feeds it and has no
> +              frequency to select, so that entry is what the pin reports
> +              as its frequency.

[Severity: Low]
The description states this must be a single entry, but should there be a
maxItems: 1 constraint to structurally enforce this? Without it, a device
tree node providing an array of multiple 64-bit frequencies for an input pin
will silently pass schema validation.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013224131.2714=
9-1-arouhi@sitime.com?part=3D2
