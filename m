Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6308A2C3768;
	Thu,  6 Aug 2026 13:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786023078; cv=none; b=mlLFL+YIhWa/lDIZppXTDh8ZfANob5Lnt+qn+HGLs9SC2nOhFAHsiyVLmq+d/1Z1dKql31uTUUtJIc+UWVAcpSiRAj46vmwNcjkTKgLw/Rd5vc7Mw/xQgEZkbPsX1olPZO7KJQGb+CmRRoxTweIetu2UG6tVDOsCQgWTaF2Bc+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786023078; c=relaxed/simple;
	bh=naMh/yXTIuSC8ranIrocEemBRUyUTDwKVWIJS6AO/b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/8oANpq6i8ZizzPrDin+dgNcX3mF5EE01XEu13DWmxSOVnit3ZH43q7pNEq/djV0ujl0kFlUwBZrT6wsqInTE9zyP0/GAYYeTnszUP93poHg7hFUoyhE98Spk5ABoaVsrOVvk8uMNBKzLjIwCMYnbNX6iXFlvcDoME9b8b+4Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJTV5eho; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJTV5eho"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1DA1F000E9;
	Thu,  6 Aug 2026 13:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786023077;
	bh=Y0AD+yfRRB8kFuS3umG0hhMkgfqhZmRwgX2ATJd2Akg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hJTV5ehoIEF8y7Kgco+X0NK8DYm3FHIb5dwVRUwRJ+mDkIY67nsnTkvehjQzkyyOE
	 +lU0FGL1ltpTL5CrMMW5U/tDWHoyh6M2NA48HP662X36/fOLJ4+d5+Q4aq3USy6AxH
	 jr/gGrVQkNanDlcErJfMkiKmeNFK0mBr4gAbfG2WrInh7LbSdlW8JhZtT4oAZGVHPv
	 SmNcAUbJTJ/7JUHNGXIIhiPOzEkoGNYMl0YB+1AFQREPucGLLpdar0eSPnma2ZuwdJ
	 txnNntcMTSk6DP5HprY8bQtNAHroh8k6MbILqDlN8MN6TBWGUpLBWQkQ4RRVsA/sb1
	 rildWmczV4maA==
Date: Thu, 6 Aug 2026 14:31:11 +0100
From: Lee Jones <lee@kernel.org>
To: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
	Corey Minyard <corey@minyard.net>, Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net
Subject: Re: [PATCH RFC 1/2] dt-bindings: mfd: aspeed-lpc: Document lpcN
 alias for multi-instance SoCs
Message-ID: <20260806133111.GF2869284@google.com>
References: <20260723-upstream_kcs_multiple_lpc-v1-0-d918b5270b86@aspeedtech.com>
 <20260723-upstream_kcs_multiple_lpc-v1-1-d918b5270b86@aspeedtech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-upstream_kcs_multiple_lpc-v1-1-d918b5270b86@aspeedtech.com>

On Thu, 23 Jul 2026, Yu-Che Hsieh wrote:

> Some SoCs (e.g. AST2700) expose more than one physical LPC controller
> instance. Downstream devices such as KCS channels need a stable,
> globally-unique index derived from which LPC controller instance they
> belong to, so document the "lpcN" alias convention on the LPC
> controller node that lets DT authors assign a fixed index per
> instance, mirroring the existing alias-based numbering convention used
> by mmc/i2c/spi/serial.
> 
> Signed-off-by: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>

Why is this RFC?  What's stopping me from applying this now?

> ---
>  Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> index cbc3a2485a2f..81c12e0fb312 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> @@ -35,6 +35,13 @@ description:
>    configuration, therefore the host portion of the controller is exposed as a
>    syscon as a means to arbitrate access.
>  
> +  On SoCs that expose more than one LPC controller instance, it is possible to
> +  assign a fixed index to a given instance (and thus to downstream devices
> +  such as KCS channels that must be uniquely identified system-wide) by
> +  defining an "lpcN" alias for it in the /aliases device tree node. If no such
> +  alias is present, the SoC is treated as having a single LPC controller
> +  instance.
> +
>  properties:
>    compatible:
>      items:
> 
> -- 
> 2.34.1
> 

-- 
Lee Jones
