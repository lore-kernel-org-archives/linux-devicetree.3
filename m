Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9417239D6EC;
	Wed, 29 Apr 2026 07:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777447395; cv=none; b=UovkT8YQIeWO9h1WrAWqtWXmF/mEVlGOfBmqaVWtVFqY7IKqmKE1/rxZy63GNUtWL4HZTwYDjpNHzxUFs/cNVcm1Je+QjfNY/qwhC22aYFI4PgiVlC8s1TG7GvlOEz/4gF2fTwdWAUN+KebM3joPXjvjf7/5KXl81Kjr4CxJSPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777447395; c=relaxed/simple;
	bh=bJF9QUNmmeOmaXEn4I5oSZ4l4DpvzHomPNF3FqnBOvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VC6j3OBnPfpt7gOQitcxtJ/VNzSCInVmaoFIQIQ61bLViJ1PGT3bjUD+SM631r3GKDU3fmNTNW3IWnVq40u2CVtmHcKKinPxij/TgdF1XU0gCSp2UyBit9mWOF1rNGYUQNQtc0752eSChAN7X0Cljyftf1rMCADp+j1e82S426k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qncFiO9C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qncFiO9C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BA2C19425;
	Wed, 29 Apr 2026 07:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777447395;
	bh=bJF9QUNmmeOmaXEn4I5oSZ4l4DpvzHomPNF3FqnBOvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qncFiO9CfVyJT5qoXfJJURRxz/PKdzCyLLeABy/zGcsR48v8yyopJ0ZD7Kmkgx0P/
	 aOTpz6KgfNKXYFysSPoJFhVqCEC0jN6fazpdQYVg2NYYXe3fhnx5duVodkrqaCitHr
	 qpSc2fd8lIP7EC3bdB3xzKROtjKj/3HSoVcRYdQH68r0cM849grXhq+7MKQmO1ohuB
	 svIsADru3E2XNz0XYFUM8fqFql5GUiy0FwSvxo/NHWt/uFPTxF7+Z2qL1aMSoPcTgL
	 g+naM6wZvY62wjdAhg1OPam2O98JaSXEnvO5IF+Yb7vpqLmbXSlPchhDs5azewuFTh
	 mSsxuBIN956pA==
Date: Wed, 29 Apr 2026 09:23:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] dt-bindings: firmware: qcom,scm: Document SCM
 for Nord SoC
Message-ID: <20260429-fragrant-soft-dalmatian-bdca6c@quoll>
References: <20260427130800.271146-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427130800.271146-1-shengchao.guo@oss.qualcomm.com>

On Mon, Apr 27, 2026 at 09:08:00PM +0800, Shawn Guo wrote:
> Document SCM on Qualcomm Nord SoC which is compatible with 'qcom,scm'.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Resend to add missing lists (Thanks Rob!)
> 
> Changes in v2:
>  - Improve commit log to make the compatibility explicit
>  - Link to v1: https://lore.kernel.org/all/20260420023243.1239927-1-shengchao.guo@oss.qualcomm.com/
> 
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

