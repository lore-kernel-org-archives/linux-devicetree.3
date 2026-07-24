Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7360C3515D2;
	Fri, 24 Jul 2026 06:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784873055; cv=none; b=YN4XbrUWFqH+TYj5/Yv2Be5PtPRqihI7DPxyglis6s/UjAGYDOjkPs6RsNhgJXO+K0Q/2AgxPUwLLLIFBR63A8OCzGrVDfwwQy6hlf/kjMjnXEec9xaL+QnzCOaM+c+n92G3FsqfzRTLYA3eJufLGS0FN7NFVc4OTi7PcrkPP4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784873055; c=relaxed/simple;
	bh=vM3umfywjJRqPQ1aAU3VVBJ+2WQspzzLVpa6/A607Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9Ct9MzjGPkSqWVM+XGDovFL+1ZaMpfidMyWqhp5l6ks2V7XLAp541q4DXL1FqTVSldQ7Qt6V/yF6gbNdCCZQF3u1y7hOC3Su8gsd2EqcFDXvJrV1Pkz9IMl67bwXUgoACQdEeLx/XsNY9vlNeuHSa8rxXglcGZWC+UykIauAN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpuPW9/c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpuPW9/c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11861F000E9;
	Fri, 24 Jul 2026 06:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784873054;
	bh=TQv1+G5oirBut4YJC2CdAmnQ/6ebRZfo0xfDBjUlsP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LpuPW9/cpcZ4ce1lgG5riSlqnGkFS3P8i3x03DhTYcTJ6Q5T27ZnoWif3e0+cKOjx
	 o7J9liTipUaSbCfWr1M3j5+nwhw5Km0vt9B7rzJ0y/EL84if8M7FBafoysfrR392EO
	 vxwOH7Kz+5cmL54DYreYpdVw5xwtrfhSri7M9rEt+KkpiLdRAK4ZtjdgXNmOt0JIk6
	 7Z/3Gzn0uZwQX9Zbvwcapj/5/0n1WYd0UJG4jtPgmxgNlP41x3SsFzjazb46ysbKPY
	 IKHhmG2iGXh8VnoZtVq6TAKeM/LIUMzNCziKy6knqC9fJqbAeRKV1pKSY/xNL9rNw2
	 nmCc+nzRdmcgA==
Date: Fri, 24 Jul 2026 08:04:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, 
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
Message-ID: <20260724-jolly-pistachio-jackalope-f9c770@quoll>
References: <20260723-add-coresight-nodes-for-shikra-v5-0-fd5494471b36@oss.qualcomm.com>
 <20260723-add-coresight-nodes-for-shikra-v5-1-fd5494471b36@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-add-coresight-nodes-for-shikra-v5-1-fd5494471b36@oss.qualcomm.com>

On Thu, Jul 23, 2026 at 04:26:30PM +0800, Jie Gan wrote:
> The CTCU device for the Shikra shares the same configurations as
> SA8775p. Add a fallback to enable the CTCU for the Shikra to utilize
> the compatible of the SA8775p.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

