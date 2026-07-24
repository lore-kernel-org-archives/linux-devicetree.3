Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E50175A7D;
	Fri, 24 Jul 2026 09:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886410; cv=none; b=gvG3dcEp8iFBfXcFD0UCISWwFjb4v7QgpIE+iARMt29CeW96/SjRExbtvU9EcbYvSzQiJIrdbZR7BimK+g4y5aTOZSjIupNEcOfDhl+0sTax+dK5C/+BV5bwUhzEkJMxhdTGSQEN2s5X9wsgKN6sYZ/bFCYvtbi9geDU6KuOMS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886410; c=relaxed/simple;
	bh=xqoSf/rLpqZcYXHNTcx2E2Ye2ZX7Ngqq4Aokhv8stwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UF6pTOCVSAg9ylsedEtXvCPLsf8448z/GDwUA/znaMd3/Gg0lAV8DufA3t2+ZAGCPnAvXItGvTi6/gA8aVDgTkVWsQsnns2n2oISiXaOyMeYXvVi01ImMYjZEWNWcqn00gZTlp8jkBwG9U/Vyb40OP8sxnxJCfWyh+C+SaFeE0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcVLkLnv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcVLkLnv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D441F000E9;
	Fri, 24 Jul 2026 09:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784886409;
	bh=n62E9IT/cKjOufWuXfuAMAyh0rhkAvAWEF5k0pSnHzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PcVLkLnvZQMPKZh1bWEhhJRn40ZSXzeTaC3oJs8J5DE0Q3XucXPWl6LcGhznTEC5o
	 /DI1Fy14ENiYtIZtyhs6KSGG2APGnk41Laf2We3dIIBmTmKrfnPFDtihsSb/9F04K5
	 YVbYay3iCoGkO/jVqENRfNi1duRSNvKW8x68zClzUkmdXcK+hmvVDOexlh2GICVMvP
	 GgtJZgHJ7VLuOSSptpGvRXliwyIe0FqT7MlUhLZmeHiMmAUnvcyXOqMbpF58HaErXx
	 TEKW42mGwbt1ukzelbjfuOB0fJGDQ7bAXSWMtHs1ValYey4e549VpgRgEo70RmUqXZ
	 89oKl6IsX6sBA==
Date: Fri, 24 Jul 2026 11:46:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Asus Zenbook A16
 (UX3607OA)
Message-ID: <20260724-zealous-porcelain-bulldog-39f0dc@quoll>
References: <20260721-topic-a16_submission-v1-0-8ea213130d05@oss.qualcomm.com>
 <20260721-topic-a16_submission-v1-1-8ea213130d05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721-topic-a16_submission-v1-1-8ea213130d05@oss.qualcomm.com>

On Tue, Jul 21, 2026 at 07:11:26PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> UX3607OA is a variant of the Asus Zenbook A16 built on the Qualcomm
> Glymur platform. It comes with an 18-core X2 Elite Extreme SoC, 48GiB
> of RAM, NVMe storage, a 2880 x 1800 OLED screen, and the other typical
> Glymur platform capabilities.
> 
> The hardware wiring is very different versus the 14" SKU.
> 
> Add a compatible for this machine.
> 
> [1] https://www.asus.com/us/laptops/for-home/zenbook/asus-zenbook-a16-ux3607/techspec/
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

