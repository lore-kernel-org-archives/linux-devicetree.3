Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F213E4718E2
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932428; cv=none; b=iS18eTDxOS7A9eZHZaGED8y46TY4dQ1gTxBmku+JLOsJ/nb9P2PBgKpBB9GtXkgfXg6oVZpGF4dZFuwi1ioJfxSY25WKNr2h4wcFEM0vaVk5r3DiT0OUzASrFcUp1CPuUza1VfAhmHLZcXoQWbfz7Y21uSsqk3vuGHY42aqPF2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932428; c=relaxed/simple;
	bh=cfMEApI2tgym4PTTwPcViE+u9rz6uU6zmGjn7JeGZQE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BDWjI2d0s8/i0/ix6hbFkhYnGxV4rWP8sduEENgp2l7T6IaQr+k2ArrWSW8ks04N242uzRfinYwebpZcjWcEy0P7RSYQWxeTGUxt0xKKYsJPrxgISyk6DbyG+pIa0tBfLLnYXMcUZrUNpVhKOsz8MbeO6oPl58c626ev0OpJAHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLMAB0Ua; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLMAB0Ua"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16C91F000FF;
	Fri,  2 Oct 2026 09:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932426;
	bh=L4lBbXR7nbL5X5RROhkNNaqiiEze0nl0pml/i3y3vGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RLMAB0UathJ//eQv1UFd7mjrcBNs8viiIjZpd5iFSNh86v4dGahK9hOcDiG6cJJwQ
	 3YwzO5/MHUGDcN8h2ffD6PPeRgBZVOyw4QHsQ7JjQcAdkSGxdTLi1tCk8h+lU2YJaY
	 Qn+JdaxFdvoW/IXkiQsw82xda2v+MxXWsPel7//UYmmZpjPmZBPr/pk3uQ74cLmZ5s
	 7aRbdLNvbYozWeUknnChwd3Xz3DzsGl7a3A/KYZuTVUV8xnb0FlWQ8+hnFjs5pyOoX
	 k1qaRHMgyg+aNjJHr9ccXrh4gXRSsmmL6rLrx+Q8DaiyOKFc0wnLBPOhLsbPTudM8z
	 b0iFQTi+NZlYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/6] dt-bindings: spmi: apple,spmi: Add t603x and
 t8122
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261001-t603x-spmi-v10-1-ff815c66c73f@chaosmail.tech>
References: <20261001-t603x-spmi-v10-0-ff815c66c73f@chaosmail.tech>
 <20261001-t603x-spmi-v10-1-ff815c66c73f@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:13:46 +0000
Message-Id: <20261002091346.A16C91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: spmi: apple: missing power-domains in required list=
 for non-always-on SoCs
--

commit 888cdba0f17c299db4b50bbf52f14fcb099ef7c9
Author: Sasha Finkelstein <k@chaosmail.tech>

dt-bindings: spmi: apple,spmi: Add t603x and t8122

This commit adds new t603x and t8122 compatibles to the apple,spmi bindings.
It also introduces optional interrupt properties and adds support for SPMI
controllers that are not always-on.

> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Doc=
umentation/devicetree/bindings/spmi/apple,spmi.yaml
> index 3e5b14bc8c317..4e73083ecec33 100644
> --- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
[ ... ]
> @@ -34,10 +37,36 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  interrupts:
> +    maxItems: 1
> +    description: Optional, operates in polled mode if not present
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> =20
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - apple,t8122-spmi
> +          - apple,t6030-spmi
> +          - apple,t6031-spmi
> +then:
> +  required:
> +    - interrupt-controller
> +    - "#interrupt-cells"
> +    - interrupts

[Severity: Medium]
Should power-domains be included in this required list?

If a device tree for a non-always-on Apple SoC, such as t8122-spmi or
t6030-spmi, is authored without the power-domains property, the schema
validation will incorrectly accept it as valid due to the missing constraint
in this block.

At runtime, the kernel will fail to attach the power domain, resulting in a
fatal synchronous external abort and system panic when the driver accesses
unpowered registers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-t603x-spmi=
-v10-0-ff815c66c73f@chaosmail.tech?part=3D1
