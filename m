Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDFA3EDE78;
	Tue, 12 May 2026 20:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778618857; cv=none; b=PU+KkdSP8rtnBIzYIFtNailQGb9tWweB7QIhlRWFTQRljuJoLp8aRRVnjHAVksNgJNBLds7xLYnzj93sMLA7HVjX0ZXhQPKIirM/QYkU9OrjpMXuRU/rNMm/vnFPQYrcmzCowwS3O7c1eCX6/BCkmjxwbveQjqRapoB0Ig3Y11A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778618857; c=relaxed/simple;
	bh=A35TqwiCcTKmX3VROrzP/do0VqNE81TekK5MD8r66mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCfUYDbcXsPaUPGmmUqEu4eKwa4YhQKF++4jHyXlxoCRcDtrE8L3becjfRjiQ1E/wUdAbJTA9YWvsGXy1+4KDObG1OA1owhmS4qzeHjw0oPpaOuEt0C/MWOHaAcVPkiENLZq9o03cOX4AaHb9XAN666P1EghlblFRxKv/ghMDQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=adiJ21OK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="adiJ21OK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE8DC2BCB0;
	Tue, 12 May 2026 20:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778618857;
	bh=A35TqwiCcTKmX3VROrzP/do0VqNE81TekK5MD8r66mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=adiJ21OKGaHTGnXcYhDhf+lo+yPtEhIB8xsDzfBzW9aiWrP5ItWoE1x4mbjHlFfIl
	 vIy//Q8LlWDI4IPMW7TiebsdsOk825GQkL+LPgSiOzJwaKwWI8SO4pbicyzWJesOkQ
	 vQaOzIleMb2cjDceGNmVLbyFPEyB4pqVGvXaHoYNbi42CRRLcZZUNMOrh39s/u4Q0G
	 m/T972YlnUML6aGnx+r2l3GHgdDPONMVTBBaIpMiQh+5vWbtSvNvKNY0ecIXNicr0Q
	 bOWdwVj170ktDlnd5KHvOXTQtNzeEYDrgkQjUzPIexOXsOBD0gxeX9VADA6eh2nIUr
	 Xi17izakjTRvg==
Date: Tue, 12 May 2026 15:47:33 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: qfprom: Add Milos compatible
Message-ID: <agOR3GXg-tMcNipL@baldur>
References: <20260331-milos-qfprom-v1-0-36017cc642db@pm.me>
 <20260331-milos-qfprom-v1-1-36017cc642db@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-milos-qfprom-v1-1-36017cc642db@pm.me>

On Wed, Apr 01, 2026 at 02:24:57AM +0000, Alexander Koskovich wrote:
> Document compatible string for the QFPROM on Milos platform.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 839513d4b499..936878e74895 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -26,6 +26,7 @@ properties:
>            - qcom,ipq8064-qfprom
>            - qcom,ipq8074-qfprom
>            - qcom,ipq9574-qfprom
> +          - qcom,milos-qfprom
>            - qcom,msm8226-qfprom
>            - qcom,msm8916-qfprom
>            - qcom,msm8917-qfprom
> 
> -- 
> 2.53.0
> 
> 
