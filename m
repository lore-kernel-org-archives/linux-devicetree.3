Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5C9509EE5
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057256; cv=none; b=EsN/5a1NgpRmTMAOdPyTU2qznUi4J4x4YINwZtVD7SDXibNZvo7wHPQJwLj8dYgLpwLTISfCHs4heorgglQt5o4Aby9kd5j4E0DIqT2Nzltv5pjk6PTVnmW7wCbx1nx1/aDQf+KQaZlVvfmMdKL+lU5J7yLC8JmdD1UPtLvbSHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057256; c=relaxed/simple;
	bh=nZNuFW6BrzL3aVFNzbghila2OGsvPXzRoXvSQIxba9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6j0An7UJlaT5S0AmqX0NFRY8C3AMfAgsi2DO6qIZptqeSZ4qXN8g5DheqAL8cvc1UIEn32qsR68P0tD4PE0e0Deks/YsyNAkU7iMKcpABXEta7cwdcdSHX0OPA8DOG/RTHJWInJxcZGy2PIXm3P2sfXUie4XYXB988gLOvjbls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=abqlvtCD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="abqlvtCD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0A01F000CE;
	Thu, 15 Oct 2026 09:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057250;
	bh=vzw9FejnpyFh7MFE/dC5YMBRCsqKbDLXhffDYVV5g3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=abqlvtCDzshAKBuJsy7zJBd21J9FJFuuX5aBV2aSG+9Lumfv8GgYc96sh+8odRVGE
	 lParLUcTy1xHhq/SVvrYhM9o27pfiW0QgKoZCqmYYMi4aLp/gQDaa7V7f0iofLJId2
	 0YbRBhvcK97wg4fPBbLWEM5poERajGvf87jOwha9TKn3dyZ2iL/7h2FkC9bJ4MXsIP
	 TMOkuiWZ8RVn/VzYw/d7hn6Tbf1X+/SQ9niHO23Kvy5ghvVnCeeeUNHkJe36W6BvX3
	 h/KFLiFvzVmPbKik5bvdeJ5zTEl0XHXRxRnTZ8veTpwgGgO0d/QTLlPROKoCUXYD7W
	 Z54zvOcUZNdrA==
Date: Thu, 15 Oct 2026 11:40:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: altera: deprecate
 intel,socfpga-agilex72
Message-ID: <20261015-premium-earthworm-of-sufficiency-9bd00e@quoll>
References: <20261014125709.2106261-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014125709.2106261-1-dinguyen@kernel.org>

On Wed, Oct 14, 2026 at 07:57:08AM -0500, Dinh Nguyen wrote:
> The Altera SoCFGPA Agilex72 platform will be rebranded as the Agilex27. Thus
> the following bindings "intel,socfpga-agilex72" and "intel,socfpga-agilex72-socdk"
> should no longer be used going forward, so we will deprecate them.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> 
> Replace those deprecated bindings with "altr,socfpga-agilex27" and
> "altr,socfpga-agilex27-socdk" bindings for the SoCFPGA Agilex27 platform.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/altera.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
> index 5fce1161210e7..c87d7725f920e 100644
> --- a/Documentation/devicetree/bindings/arm/altera.yaml
> +++ b/Documentation/devicetree/bindings/arm/altera.yaml
> @@ -99,6 +99,12 @@ properties:
>                - intel,socfpga-agilex-socdk-emmc
>            - const: intel,socfpga-agilex
>  
> +      - description: Agilex27 boards
> +        items:
> +          - enum:
> +              - altr,socfpga-agilex27-socdk
> +          - const: altr,socfpga-agilex27
> +
>        - description: Agilex3 boards
>          items:
>            - enum:
> @@ -123,6 +129,7 @@ properties:
>            - enum:
>                - intel,socfpga-agilex72-socdk
>            - const: intel,socfpga-agilex72
> +        deprecated: true
>

No. We DO NOT rename or deprecate compatibles because company decided to
rebrand something.


Best regards,
Krzysztof

