Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F34D39F191
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779173321; cv=none; b=Dh5JmSCkJ+fhOYMu++J1pfJyyX5cFkMSd8VUL5xY/Js6MWFs2INPRHaKKfV7ORZwyYGMvS2rszXMqykgDlFZUAnHA+nZX8O/oIfpdCYQHrbLBQ9TPrG/cP3Bz9qD0sDfZL+qDtkzA6YamivF26vBbW94QMVcFdCJn2d0UOqO7VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779173321; c=relaxed/simple;
	bh=qw8VzCI+nwS0w1Oh7opKmXpR+xqWb8X1NrL/DBfVIk0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u4D8YIl1XuK1myG+mhY+r5aUxKjZUVZUCNj8jfMf6RfLZ5wJgcX+Lw8BVhxA1GDnA146rYNklF1WcevcMcNVSCeSLwX3ICjjZ2UcvW/cxt6kaFQegMzrXj144CwLkMR0pi77lmZfwpyZyspGo63RvuX7WLaMl6lgpL2e1J2c/pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1COH1o+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1COH1o+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD32C4AF09;
	Tue, 19 May 2026 06:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779173320;
	bh=qw8VzCI+nwS0w1Oh7opKmXpR+xqWb8X1NrL/DBfVIk0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=l1COH1o+XhrpbAAzsDbHnZx6YzrYbQJHKc/as5x66wVimaQGdOOAiqNaOkdhLrD8+
	 sGsMKqWaRRTVhLO/K4iU5qYppH9dCEiDV8kv5ziAFCW/L+D/VKMRYeNiSj0OS13rMV
	 YUKX7ZopXf25M2gBjaqTkhEJqKkq2hUMsNE+EWDfDXZ9rTbZrrSZoh+6br6BCj23ex
	 1rEfJiH5mtGsZmOtBHaKKevmA11qzMAiApHbo59TDOoMMXoyXzUhIwXhHwkqRoiN3e
	 TxmFyQIn6CplfmMwcjfGUdzEnmVCRM5T1DCKVpkGQ09URG4hn/TJAt89WnjbpLem6U
	 VviROfMK0J2XA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: i3c: dw: Add apb reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519055105.13079-4-jszhang@kernel.org>
References: <20260519055105.13079-4-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 06:48:40 +0000
Message-Id: <20260519064840.ADD32C4AF09@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Adding a second item to `resets` and `reset-names` without speci=
fying `minItems: 1` inadvertently makes the APB reset mandatory, which brea=
ks schema validation for valid hardware configurations and older device tre=
es.
--

commit f868716b21aa0a0740d04da18bdfc0d7495473fb
Author: Jisheng Zhang <jszhang@kernel.org>

dt-bindings: i3c: dw: Add apb reset

This commit adds a dt-binding for the APB reset signal, which is used to
reset the APB interface.

> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yam=
l b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> index 519797c6b4fe4..12845206772f7 100644
> --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> @@ -38,10 +38,12 @@ properties:
>    resets:
>      items:
>        - description: Reset signal
> +      - description: APB interface reset signal
> =20
>    reset-names:
>      items:
>        - const: core
> +      - const: apb

Does adding a second item without specifying minItems: 1 inadvertently make
the APB reset mandatory?

In dt-schema, when an items list is provided, the implicit minItems and
maxItems constraints default to the length of the list, which is now 2. Any
existing device tree or hardware configuration that specifies only the core
reset will fail dtbs_check validation.

The driver patch in the series retrieves the APB reset using
devm_reset_control_get_optional_exclusive_deasserted(), which suggests
that this reset is intended to be optional.

Should minItems: 1 be added to both resets and reset-names to accurately
reflect the hardware and maintain backward compatibility?

> =20
>    interrupts:
>      maxItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519055105.1307=
9-1-jszhang@kernel.org?part=3D3
