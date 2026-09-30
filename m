Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05C2544D64
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 17:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790790127; cv=none; b=Cay70fmirtJu0d6NpFvUE8Atme5iIvjAsV4NnWDYI3A0nu/MjOtxOWghtq6AFzvPKH0LKK20TqF2tvwIaCEXxwXg0yejwgEfRqR4GwDskwzWUJ30W+eZmclr3EbCU9srLj+53skJDSh56DKfRtRxtML97+Sfo4gqW7ukn/OMyxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790790127; c=relaxed/simple;
	bh=1QnZxx2ZZ8fTJW7wapdgsZI/+ZVULKzBk1W2euhUOXQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cs2VnaR/OOaesmRL9OTSOW3F9fSWgTsQWr9kHqNDtf9qA3DpC6s/nrPbWDKTw+XFkqS+0rBznTRxBd24Juo2vKZk2lGZtxpkHUJmST6gzO3QKOoQSgZpVrSleHQ4JIWOcdH26zjbeNtimI22q9wEPv1n6Cd1apOg9Kl9pxy6MBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7cjyyR5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7cjyyR5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428061F00899;
	Wed, 30 Sep 2026 17:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790790126;
	bh=r0vWdYs0V6AXIxO2Bw8XISLrQ0IDmYQckBkGS0H8QKw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c7cjyyR5rBvy/K1ZAtqo34P/kKrMnYlQwYtwjCVluYlhRO8hZT8SLis4o1aA/2KpV
	 sEbC2B0SHU64Biyb3WuZ/gKpdkOOthP5WuZOM8PloMLK6f/6VXN2rr7F4430dHBJqH
	 JH65jLZCWtX3ZtrBwGudMgq7G0jjTnm8N2Ybw4Mf6GddK1OsI5F5AH9QMcSvE7XBq+
	 q97fLsHIWRY7mevgawXUlqVFHhT//xERCtMdkNZipa5Y2wI38XUsvpEbkTGyREyPmy
	 GfGqhwaUu5ZhjYTGg2jm9fOeQToMgHlYUkVeDu8wmhp/zZTnx5xyX0tEaPjMJn97uE
	 ChBuaToz770sQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: ti,secure-proxy: Add TDA54
 variant compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Beleswar Padhi" <b-padhi@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260930172948.2901336-2-b-padhi@ti.com>
References: <20260930172948.2901336-1-b-padhi@ti.com>
 <20260930172948.2901336-2-b-padhi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 17:42:05 +0000
Message-Id: <20260930174206.428061F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: mailbox: ti,secure-proxy: interrupt maxItems limits TD=
A54 threads
--

commit 462da78495412d18a7d7ecfb35e5147704655806
Author: Beleswar Padhi <b-padhi@ti.com>

dt-bindings: mailbox: ti,secure-proxy: Add TDA54 variant compatible

This commit adds the ti,tda54-main-secure-proxy compatible to the Texas
Instruments secure proxy mailbox controller binding. The new TDA54 variant
features up to 444 threads with 60-byte messages per thread.

> diff --git a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.ya=
ml b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
> index c321b69f0ccd3..525266953c974 100644
> --- a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
> @@ -22,7 +22,9 @@ properties:
>      pattern: "^mailbox@[0-9a-f]+$"
> =20
>    compatible:
> -    const: ti,am654-secure-proxy
> +    enum:
> +      - ti,am654-secure-proxy
> +      - ti,tda54-main-secure-proxy

[Severity: Low]
Does the addition of this compatible require updating the maximum number of
allowed interrupts in the schema?

The commit message notes that the TDA54 hardware supports up to 444 threads.
However, the existing properties limit both interrupts and interrupt-names
to a maximum of 100 items:

  interrupt-names:
    minItems: 1
    maxItems: 100

  interrupts:
    minItems: 1
    maxItems: 100

If a device tree for the new variant specifies more than 100 receive
interrupts, won't it fail schema validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930172948.2901=
336-1-b-padhi@ti.com?part=3D1
