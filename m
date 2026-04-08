Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C573358CA
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 21:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775684120; cv=none; b=JPYjeCGUOvJVzSf7ojZJjUAHYI1dWdwMQdPfzTtApL1eCp6yKuVhUsUtlaNLMSdxMnFZLOJpWl2maJKME3mo32iJX7ExAjQh0c+KG5rdq8WVbjnJLpS/3lUmNtlcgILsgpQ8j6JZeGvbgfEowzvWmMu387fLBUOjrhMv+LrCCvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775684120; c=relaxed/simple;
	bh=U5m8hCve0SToPzGN57qTzQp7oW2CDN8d/H/F/Gwr1gk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=AxI6Xa/ouL2qMP4nvhKsvUwnzu4JDgxUdST6oLMUJBshRPEEeiaBZHiM8sPSvjP7Lej9GO3ZWBWO8N8JMofNRPAwyN89Jo6PWCHZak7V+d/f8JwL7fTeabwEw6SGcta7lGE+dLYEtIAeeZLfv8snioF/mA72es180VRMS6vT/6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8Lz1avG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8Lz1avG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921BCC19421;
	Wed,  8 Apr 2026 21:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775684119;
	bh=U5m8hCve0SToPzGN57qTzQp7oW2CDN8d/H/F/Gwr1gk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=c8Lz1avGo9y/3VwFqk+vg4C2dwokvPKM2kRCkByp3XrW7RZDSnYhczOJwfkn5J17L
	 fZPiEDIAb2KROGCWUAncAdHDC37/G9H+3r/bDVJyxxMaT0qqLf9fZmz7PzP1madm3h
	 Y/XJsLkf6KaJAK845zD1MKfM7MnRVciZJENhnfgD+0aaBr6QVYJIPfrZ9LDk9WaW2B
	 +LWfNPwjYgAEpol/ft2FMPoaAZFaqgynKvrqrPgXPkS7Upr4LNOd5/CxKqPUIP1kjq
	 xxCp7IN2bqWWAIAFgZJG98ZioTl6cU/Y9ZeSVkPWh7bnLWcoHLjT/nFmSJvbuIQ6z4
	 dYmBPC/7/qxqQ==
Date: Wed, 08 Apr 2026 16:35:17 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org, 
 Maciej Lawniczak <maciej.lawniczak@intel.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org
To: Dawid Glazik <dawid.glazik@linux.intel.com>
In-Reply-To: <7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com>
References: <cover.1775679285.git.dawid.glazik@linux.intel.com>
 <7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com>
Message-Id: <177568411772.3278896.3414957895375606965.robh@kernel.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: i3c: Add AST2600 I3C global
 registers


On Wed, 08 Apr 2026 22:34:35 +0200, Dawid Glazik wrote:
> Introduce the device-tree bindings for I3C global registers found on
> AST2600 SoCs.
> 
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> ---
> I wasn't sure if I should add newline at the end of the
> file or not so I took
> https://github.com/torvalds/linux/tree/master/Documentation/devicetree/bindings/i3c
> as an example.
> ---
>  .../i3c/aspeed,ast2600-i3c-global.yaml        | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml:55:4: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.example.dts:27.35-55 Unexpected 'ASPEED_RESET_I3C_DMA'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1597: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

