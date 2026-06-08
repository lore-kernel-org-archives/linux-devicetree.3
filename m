Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C1D30F7FF;
	Mon,  8 Jun 2026 09:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909409; cv=none; b=VqRQ0XZT4fYordopUCyu0e1YKdYTqV73IIO/+7oYiaIGPWwxEai9undOFFo36DNQoklWdp3O/Wg40rgXnKKLPEJsplvv5H/X+hlq2O0yVcDj4qL7aC1HXqkWfdWI3yGn99gPCFeLzU6s9yDwjZW4SLZyEL+DNiu2S58eawdMjvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909409; c=relaxed/simple;
	bh=bcxYfGRvgYQZwhgFbKhpb4Fjsqc2euhHKe/XHq6sSAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dp+XTN5XAwIXvXlJfMWjc8ZVMenXvjK2wV4TNM5J+EfLVXs0eG9UStU6k15/R5kdlemuKtpc+KHPKqY+erbnBJAVhainsL+6JvgxZZ1UzEXPESwwxXQCBvIlo/0/MT8Zt3NkGhNH4Q5hpPig6b5+1ukAP0sT8LL+9DLoIojQdUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8rgOZkt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8rgOZkt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925061F00899;
	Mon,  8 Jun 2026 09:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780909407;
	bh=mkj2yeaa/aakrqfCRl6AnfL5aZg3c0gI+G1lPR8wubc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n8rgOZkt79rtrH7/t5Z/OU0sjayQ3KqODfEzkbuVlBy9Z+Q2a/zboNUrTEe+71WPl
	 YOdixZbC/raRX2Bb9nIE7l6LZUgsQ5E5KcwswQfbtalSw2/QbDqCGj9RRqnWLXv6in
	 5MVM5SFc0fY1qDUgBgz4MfnXyceqK731VbXJUq+LVVpC1zN9HNMYN26ykWB97UCIU4
	 dLGLSgy6MTLCanGfqe/ZH4hLXGL/YXU0Pzc9c891MJHxXZViZ6AvcOtCGlnOdvNaR3
	 iNw68F4XFRowNStow+UGYGn8dbJETHFedG7rLJ4zSuD8NX24CNF2xQsb88707TGP0I
	 0J3qicjPFO09g==
Date: Mon, 8 Jun 2026 11:03:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: firmware: qcom,scm: Document SCM on
 Maili SOC
Message-ID: <20260608-enchanted-controversial-pony-2c4edb@quoll>
References: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
 <20260604-maili-soc-binding-v2-1-21b5e9bd1aa5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260604-maili-soc-binding-v2-1-21b5e9bd1aa5@oss.qualcomm.com>

On Thu, Jun 04, 2026 at 10:45:44PM -0700, Jingyi Wang wrote:
> Document SCM compatible for the Qualcomm Maili SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

