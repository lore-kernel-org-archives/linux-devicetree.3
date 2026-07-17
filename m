Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CFE301719;
	Fri, 17 Jul 2026 08:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277887; cv=none; b=WHGkvF6wNUfp8+qklae40qXcfayH/R72YbZeFF14zRjMQ/Rf1OgW60vRI561Tev57rpKBdZx6PlM0959XVPiCuyrwhMXljMk0AqK89Sa9tUuNOBZeM31SyS0lsfaNEK6j+t4MOkdaTlekFhenh7mRhMRHw+h4JBMp4Fdkj6jrUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277887; c=relaxed/simple;
	bh=/DrriWHekRSg9w5zM7Abg7dMFbladQcCIpyC/1Wk7XE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8p1ys42ODfxka5Kk0UYefrM2phz0og3nM1owbCJ8PTMa/UtNR2gpQ5PgFC+hTtZ2vSEk9U4YG+8i0Hhz707LUd0Tgqq9N4dYx1RI4Fb4Wrl8JvIgxj/9Gu8a2d9DvTlKRJEOcbXjgqgy9M2eNAOBCT6jjq8BjvofFYn6n9DQ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUpYIktk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUpYIktk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F2F1F000E9;
	Fri, 17 Jul 2026 08:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784277885;
	bh=ReRnUkDSGgFc+bbTA8xO5tQshIvEpDPvDqLGeZZjTms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VUpYIktk8YVpv1cWXY2ZYASB+YgixA6ODZu8T32i+cIl2Xb3NdueSqMY9dWvv+Jhq
	 G85DujPDqAOgpw7gZrYT+R5GlYXne21cF8rKptHmkfnm50sDd5NMosi3KMfHGaQP9Y
	 p1p4zjwrW1EI0BReSpqvEDxqcGx1yiiBMK37LPDRWqqOv5uFMVgstb+vsXpMi908Rm
	 u2fwSsq/J6ImV+TQAcLvmN2tX/enJFz2saZO63lQxyitFH1jfIR+H0eKqV6IbfFXA+
	 EjBsAmw/B/yulOpku3iRzQF9OiVVx4lnBvx9cMD3hki8YmTPE9/Te0cnmkka/zHgSO
	 ZRyLRtxx3laXQ==
Date: Fri, 17 Jul 2026 10:44:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: sram: Document qcom,shikra-imem
 compatible
Message-ID: <20260717-cherry-octopus-of-domination-887d4f@quoll>
References: <20260716-shikra-imem-binding-v2-1-2c3e2465d25a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716-shikra-imem-binding-v2-1-2c3e2465d25a@oss.qualcomm.com>

On Thu, Jul 16, 2026 at 01:10:14PM +0530, Komal Bajaj wrote:
> Add compatible for Shikra SoC IMEM.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased on top of linux-next
> - Collected Reviewed-By tag from Konrad
> - Link to v1: https://lore.kernel.org/r/20260430-shikra-imem-binding-v1-1-c6976239f90f@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

