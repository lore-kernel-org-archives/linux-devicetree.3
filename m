Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAD619E839;
	Thu,  9 Apr 2026 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724346; cv=none; b=ZR0BhGH0EqmZLoNmD49wDkkcUU68MEVrsi+PiXgqa6aUHFxWowwf6jR8lQfMPZFdF8ya/iFtVojYPM5FMlykHP/6LvzqsJ3ObwGjwiZgWTmgQfDxiQbECv3auv+T8HjKv9HteGoFodioxBjEiCTl1IO0jRF3lCmQ1jGKmfYb2fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724346; c=relaxed/simple;
	bh=VOwR2CooQrXPp2NVeIM7hMmrnPkbrL1M7meZUAiW5V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbrrVvrmLHe8FolGQ6MtKH0uiUBj9ZKu+TWHiXZVgxpe2Ca6rpq0aG01l7rshcN/bYUoRlEVgOT7TgzzwZackIv1UxXpsCr+t/CtAFnbQDp8JA3PleOHW0TVV5wOXOtNgTaDrvRwrhXIelsxwPYmTubx27q6yIVwogC+O4mDiUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QA3PA7fQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QA3PA7fQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FCAC19424;
	Thu,  9 Apr 2026 08:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775724345;
	bh=VOwR2CooQrXPp2NVeIM7hMmrnPkbrL1M7meZUAiW5V8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QA3PA7fQxyJGfJFHMlb8Uxs1Ywwzdvm/WzKO+ULs8hCBDmDDB0tHnzN9/6VpSb+5X
	 zTthhYH6CdoTWshqSJe5desN0hTvgcR+UoPIxB35CXOC2AUDD39l2z8OlLXBXOlOMA
	 xu8Jhy8ZeB8mBg3Ezv2W4TLiIA9oZqP4LuOUZLKFFCgUydg3/QOtC5p+/QaInXMK38
	 2tD0PT/9z3hOQs1GnMrpXlc3RJQYCsF1pwAmzBW58GaSsfzUrK+/5CEDIDZ2y3uGQ0
	 xAzorVLabkfSuTFYL2Bgw3iAW4Dt0Jj9JL8BiT6Msadc/o14/Bcy+WAMvU5ovvGde6
	 N9GZHshZJLcfw==
Date: Thu, 9 Apr 2026 10:45:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: sram: Allow multiple-word prefixes to sram
 subnode
Message-ID: <20260409-augmented-stalwart-crow-3fcd3a@quoll>
References: <20260408-topic-sram_dtbindings_misc-v1-1-00556167e136@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408-topic-sram_dtbindings_misc-v1-1-00556167e136@oss.qualcomm.com>

On Wed, Apr 08, 2026 at 03:28:13PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Currently, foo-sram is allowed, but foo-bar-sram is not.
> 
> Allow it so that more complex names aren't unnecessarily simplified.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
> index c451140962c8..b65c2ff846f1 100644
> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> @@ -65,7 +65,7 @@ properties:
>      type: boolean
>  
>  patternProperties:
> -  "^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$":
> +  "^([a-z0-9]*-|)+sram(-section)?@[a-f0-9]+$":

'|)' is an odd syntax, not really intuitive. Why this cannot be:
([a-z0-9]+-)*
?
(replacing also * -> + inside)

>      type: object
>      description:
>        Each child of the sram node specifies a region of reserved memory.
> 
> ---
> base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
> change-id: 20260408-topic-sram_dtbindings_misc-5e8834f63d51
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
