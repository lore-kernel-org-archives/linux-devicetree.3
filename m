Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379443B14CF;
	Thu, 16 Jul 2026 20:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784235512; cv=none; b=hCRBjXHBWYzCskgN8sYLd5LgYjF37u3KIYilNGK2GsKOCDxUCvuC3eC9KM6b/RnqvK8ynA8amhv6N4HJLXvmcE+JSbO91MMqACsvp5gkgGOfCAi+pjjMxwEnupPQ0aw3l6KpISP9QOwPqNTXT96N/0iDrxOU7bVEsh03NxmrjHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784235512; c=relaxed/simple;
	bh=su8kGkAY4N6U2FHsH2aXRCdUQq/vBBVqz7xV45ONfBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOEtm+frrxrqjlOR0Q59x0GMBLPtrPO06/zpB2C82oTWtpQ1we2FI1Kis3PstJCHmZwsbPPyKGFU7nL9dbOynLPW8uP3um8dVXlzR+Vh+NNkcO60TgJ/OQQWJ+5EBMS6fvHCFoGc0/TRPvQotbmkB4tmFULfDADZ/yZLjPHo1e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ExXQEWhL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExXQEWhL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED7E1F000E9;
	Thu, 16 Jul 2026 20:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784235507;
	bh=03ldFknzECzTT8JTR1cg9PPWMssZpHDdN0tFLJFZ9y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ExXQEWhLhcsL4aSABaTsIH2uJMCHb/nG3o0OZ6IphOXEF86i4QSjyD+OSAfKg63Ia
	 fVdO1sfV4KOvt493l1VRVIprHrYdBGocp3DW/Jo7hRRQz6N1lrTjVg+DjhyeMXCw6e
	 tiRMsMt8wkDxpOxjhNdSHbPlOw+Ug21uBWo4q+51WrusOe7iWqHf8gKrRpilOEwKuq
	 QKYDOqR2LkqoVkL2EmrtHcEYNuUF+C7GHzQ6bPqIGB0kR+R2ojdhp6axpKE5Hri9dJ
	 Kxi783azdvpyJ+bB11+/kvtTpzbcIFvbzIiFMjvYmhSndZP6bIpRj7u1Ce/0kA7Crs
	 ZBeEW4tZM933g==
Date: Thu, 16 Jul 2026 15:58:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom-soc: Include Eliza,
 Kaanapali and others in SoC names
Message-ID: <178423550644.1279229.3937015691102410207.robh@kernel.org>
References: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
 <20260707-dt-bindings-qcom-soc-naming-v2-1-1b7d695be2e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-dt-bindings-qcom-soc-naming-v2-1-1b7d695be2e1@oss.qualcomm.com>


On Tue, 07 Jul 2026 15:35:59 +0200, Krzysztof Kozlowski wrote:
> Grow the schema checking for proper SoC compatible naming style with
> recently upstreamed new Qualcomm SoCs: Eliza, Kaanapali, Hawi, Mahua,
> Maili, Nord and Shikra.  The list covers only SoC IP blocks, thus no
> Hamoa or Talos in the names, because these are codenames but not used
> for SoC IP block naming.
> 
> Since switching from model numbers to codenames, this list with explicit
> codenames will have to grow and list them all in order for the schema to
> work.  It feels like a churn, but the compatible naming is still mess,
> for example, the schema pci/qcom,pcie-x1e80100.yaml with a legacy naming
> vendor,IP-SoC (qcom,pcie-x1e80100) received a new compatible with new
> style (qcom,glymur-pcie).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

