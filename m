Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D6A1C3F31;
	Wed,  6 May 2026 01:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778031274; cv=none; b=DgzummAd+qtoB4RLSCryejjceXAGde1C8jFRBGa72lPIDYZxYlYLS2/+VDE97EK4o+8c5bMOwErZWdcPLhMxFyIyAjKuVQxREHHY5ry39uKxot+4SoPhvSZFQGYj3zFyfBnfMOHvCF5ZYmYUAv51pQ5WDa71kNC/8lW+41CsuwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778031274; c=relaxed/simple;
	bh=CWNLM1J6uhkpFXGz72SpWfGs9Iw2MjmkRXey5qg2CFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvJ2CZK6N63xhgbQYAp8Ji7z8uYF41EQX3gSHj3HzYIKPiPSIgR2LJPVG0JrsdPgXtVLexIYWDR50WRM0tuwuffWs6xbPAfKXglaO55FNYIyxPmutqzfVQoor3dniyROCqmI5I77dq2eAQxQUNi7zrU8A1vO8rSpfAXf4e6fCi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ocOo5lnh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ocOo5lnh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF0CC2BCB4;
	Wed,  6 May 2026 01:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778031273;
	bh=CWNLM1J6uhkpFXGz72SpWfGs9Iw2MjmkRXey5qg2CFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ocOo5lnh/r0ZBM6T8VswicxlE2q+UAS1DSQRTaDB2VkHHXhqKZTOk9TQL0yBHxYcQ
	 3l6KyGf7T/Ckmk8AxYO9u5InLcxZzAwu7BzlRj+kHQRtvD0OJwI8DBRw0YLJyGJ8ux
	 e7/LTIT26OfWNr1INVPeDodkzOdBNYVedl/zjElG0USDf1mQvkF55w4HWZ9KZCSmy1
	 m+3h5CDvw8XWd5HpSrGNC/HL9/mvCFnmX2HX96e7aGA22G4/X9MaK5jCqhf5JFR98S
	 JRwj6v2mYrjpJtdb83OK7nfApecgxxBvrEKdmd0p5wIEwgyn0saQTpJwtTH038joWZ
	 Ik0sUkswWWm5w==
Date: Tue, 5 May 2026 20:34:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] docs: dt: submitting-patches: Remove possible
 confusion of combining DTS
Message-ID: <177803126846.267521.5941552104449093076.robh@kernel.org>
References: <20260428150420.121472-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428150420.121472-2-krzysztof.kozlowski@oss.qualcomm.com>


On Tue, 28 Apr 2026 17:04:21 +0200, Krzysztof Kozlowski wrote:
> DTS patches were always expected to be either sent separately or put at
> the end of patchset, but the first part rule explaining it used a
> "should be placed at the end of patchset" phrase which might create
> wrong impression.  This part "should be" was about order of the patches
> and applied only to the case when DTS is combined into this patchset.
> 
> Suggested-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> changes in v2:
> 1. Rephrase a bit commit msg, minor style
> ---
>  Documentation/devicetree/bindings/submitting-patches.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Applied, thanks!

