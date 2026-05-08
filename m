Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721E92AD00;
	Fri,  8 May 2026 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778248477; cv=none; b=E17FJHTySqutmcVqTvtdLsTJTH1KsGMwFbycT1ciekjNLrnsBB65duJYTIi15u85yP769c8U+VOXry2XA/yaAZV2L+zRnMg7SzEurKNVNxptmLdYziM+k22WJgk0CUm9TcU0Xt/p9QuFJ5kutlsUftI2g/2llD08P1Rxo3u+TRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778248477; c=relaxed/simple;
	bh=srlY+7eHoA3ylnelbtfX75Z9BHySU4pqTIbELyZkBpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTnRAmdoa4Ncg+JZ1GGY5Fro0a899Ki7CDAP2PM+j2C/SuUxo0vpOiaWT0vdyJVgeXEFtvLoXn9ygxyd5aNQVA4+wSwJJziUrJByYH4bBEeWkfGPB59fcHTgMcw1pCg+6gWnPqhyIBRVTlvD18rVT8qBwdn/yreHT6BgrFhycws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2uo1Unt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2uo1Unt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DA2C2BCB8;
	Fri,  8 May 2026 13:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778248477;
	bh=srlY+7eHoA3ylnelbtfX75Z9BHySU4pqTIbELyZkBpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2uo1Untwl/EJOiBMHCTpgyPVJ255gJ+kCAZS3uGdIC2JBbTZNFlF2YLWsYE0gn35
	 OqAmp9flarz/4ruWvr/ggPoZ931zTuirKiePNjc0NAEtKVU8tjRg8WPLGgM9vhAt5I
	 P8+4E4AsDDn/HXcBuS/zicFr3BNuOCbT0xVb1Ml6RWaL+NN/b2k8YHU4KX8C2J30+B
	 epAh2e2AuPqA6Dz9sV67IXW1jN7ivmJQrEEN5EHtW3p4V1P6KG+pXaRjEwF1crQHZQ
	 cLGv+/R0Iuu58Cdow5xkgxTEDIT1/CZaiDJRl+w0KPhYYlFu4scZ98J8J3DCvvMHbe
	 hKHxmQCyM2a6Q==
Date: Fri, 8 May 2026 08:54:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Rembrandt <kernel@rembrandt.dev>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: arm: st,nomadik: Convert to DT schema
Message-ID: <177824847377.1216791.15448641946875128549.robh@kernel.org>
References: <20260507-dt-bindings-arm-st-nomadik-yaml-v2-1-8ab05d1cda96@rembrandt.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-dt-bindings-arm-st-nomadik-yaml-v2-1-8ab05d1cda96@rembrandt.dev>


On Thu, 07 May 2026 19:03:14 +0200, Andrew Rembrandt wrote:
> Convert the ST Nomadik boards binding from free-form text to DT schema.
> 
> The binding documents the Nomadik NHK15/USB-S8815 platform compatibles.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Andrew Rembrandt <kernel@rembrandt.dev>
> ---
> Changes since v1:
> - Replace 'oneOf'+'const' with 'enum'
> - Remove example node (per Conor Dooley's review - it had no corresponding node
>   in the relevant dts files)
> 
> Thanks to Conor Dooley, Rob Herring, & Linus Walleij for the reviews.
> ---
>  .../devicetree/bindings/arm/st,nomadik.yaml        | 23 +++++++++++++
>  .../devicetree/bindings/arm/ste-nomadik.txt        | 38 ----------------------
>  MAINTAINERS                                        |  2 +-
>  3 files changed, 24 insertions(+), 39 deletions(-)
> 

Applied, thanks!

