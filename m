Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960663A383A
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 07:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791357672; cv=none; b=lYm4MqjYfqUwTnKcCQ8ZyeSCcpCYKiLfnc7bg/4jp4KJ01SHvPHeZ3DT32i2oRTEZ98agjztiWupdTgaJGD//btYkWfxEFFBjJccTao8yp6XeRcZ5+rtj/npAH9XHxT73mgvUdrJYiNOEUcD6d9bS0cxLrGGTRgtXGKZ6i1P5iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791357672; c=relaxed/simple;
	bh=4pO33OUZkg7966aP1zziHYID+++NVWa97Ak4cgg/y/0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=K93dpxr4UQEfNxN3vkGjdqQkQ1SlSQwXnQ34QnjIje1agoN3kLAU0vxWU0/jCbI2P3rt35ljDSEaxfMlOHmQoDluVFkoRSlKwCRrz4yJtYlprM9YvOIvUmoNjRWYFunzQtPf36NgzWYCqreY5r0KsMqU0u+Ep12w45GV3B6AoP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfqikMkz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfqikMkz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118E01F0089C;
	Wed,  7 Oct 2026 07:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791357671;
	bh=IEPLhX3x5SSkPDRU2nMVmA232jC2s+n11696fXzZDW4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CfqikMkzypNBvEWTjIkjUcwutDoOaXdmy051SHSgspis5IdVcn8nbJx3RurgpufMN
	 s+HsCCh3AJCNyRK3f0JMcljfFk4W+fHmqInV26R8ol6uccVXszuMH8uNK74quMQfmS
	 DQAwaKPAsavUpc0V1ItscRBmPY0PSSZgsknteAQrOGYwwLdTqDhgKgIE0XyAH7XQyW
	 vlTG0bMe56zOovR//l/MVeiMMmu9A0XZ1wcDCo0SuSTkgAGiN0JN3ij96vpublm88f
	 tIO07cUUmi/pbqXtlxn0gHMh7gT0A8QchsgpHZDv5xUvyz6ZUW4ZQ1oX9N7Vb30ups
	 z/4ScAuSUxTIw==
Message-ID: <sashiko-outbox-162705@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 1/6] dt-bindings: net: ftgmac100: Add
 AST2700 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261006-support_ast2700-v2-1-36de51fb8066@aspeedtech.com>
References: <20261006-support_ast2700-v2-0-36de51fb8066@aspeedtech.com>
 <20261006-support_ast2700-v2-1-36de51fb8066@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 07:21:10 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] dt-bindings: net: lethal fallback string faraday,ftgmac100 for=
 ast2700 causes DMA corruption
--

commit 41515d527e75268fa4307e89354538c296e5a3a0
Author: Jacky Chou <jacky_chou@aspeedtech.com>

dt-bindings: net: ftgmac100: Add AST2700 compatible

Add AST2700 to the FTGMAC100 compatible list and document that its
RMII RCLK gate matches the earlier Aspeed SoCs. Allow the reset line for
AST2700 as it follows the same reset requirements as AST2600.

> diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml=
 b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> index d14410018bcf6..bee9570a6f63f 100644
> --- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> +++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> @@ -18,6 +18,7 @@ properties:
>                - aspeed,ast2400-mac
>                - aspeed,ast2500-mac
>                - aspeed,ast2600-mac
> +              - aspeed,ast2700-mac
>            - const: faraday,ftgmac100

[Severity: Critical]
Does this fallback string introduce a regression for older kernels when
binding to the AST2700 hardware?

If an older kernel without explicit aspeed,ast2700-mac support boots with a
device tree adhering to this binding, it will bind using the enforced
faraday,ftgmac100 fallback string.

The ftgmac100 driver assigns it the FTGMAC100_FARADAY model, which uses
BIT(15) as the DMA ring wrap marker (edorr/edotr).

However, Aspeed MAC hardware (including AST2700) requires BIT(30) to wrap
the ring.

Because the hardware fails to recognize the software-programmed BIT(15) wrap
marker at the end of the ring, will the DMA engine overrun the ring buffer
and continuously write incoming network packets linearly past the allocated
buffer into arbitrary adjacent physical memory?

Should the fallback instead be aspeed,ast2600-mac to ensure older kernels
correctly program the BIT(30) DMA flag?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-support_as=
t2700-v2-0-36de51fb8066@aspeedtech.com?part=3D1
