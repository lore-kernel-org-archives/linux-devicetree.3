Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4805B38836A;
	Tue, 21 Apr 2026 10:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776767204; cv=none; b=BrKTqCFWzlNPlwmZ1JGqzLM3VGOURwhrgsgChac3GHkiePWE1KBqg3yvKLSsnDhgryIlkDuZ3JKBupvOPdVbom2g+u82W54fS7wXa+kfZYCmTxeweaMmFzeJ6MZX1RBY1WQJYUsfd7hckrIlxV2MrCLlhOXy4Xuk3lJXp2uiGCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776767204; c=relaxed/simple;
	bh=yd1Y/WINI54aboyMSg7g+yteFK5+wdGUNcu8TPZZHxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPaIdPFNQ07/x3ysE1ce/Hs0xKnLlP9NRUYRcA+iIxqeaGU9eF/GdPtOaACmqq0ozIw9qvXmrl+hMjYRmL9TqCamqgXRmD/9ndZvD1k7Qgd+ShZRxpf3JhgHnvqyqLVHVBz09ziOln+bZ64Q3tAv/BV01VTimhTzK02ngJMyRCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYEW0azN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYEW0azN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8BBC2BCB7;
	Tue, 21 Apr 2026 10:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776767204;
	bh=yd1Y/WINI54aboyMSg7g+yteFK5+wdGUNcu8TPZZHxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PYEW0azNDg8vzl8nXxZcIIc3lqNzYGblhfy8uUdc+b3jZxkPBu+G3h+mr+qI+IK9O
	 EF5ayhoO91JSy3JCCxqVCr1x1OYaqLAIR77LKfbKde339cWdJ9C1UnwDOtPMu3WMHb
	 koGwnKnGaKQRcMCnbQJYcYY1E6LCj1BYY8qLBrb77zHqlhLaGBpANAlQ40/O33ORTA
	 sr1PQwCr1TZjUYx9HcmkwTU2I8aQeOGyomwmdradDhcAVWdBeRkC4rTIYeewLMS3LV
	 JLnocTz1C9laQuiTuBeX/NHfppbJgmebSvZT61wXAHoG8B8X/dDXuqh+6dFxJcV6AB
	 qov/m9bEnabdQ==
Date: Tue, 21 Apr 2026 12:26:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom: qcom,pmic-glink: Add Hawi
 compatible string
Message-ID: <20260421-honored-brave-pegasus-b285f1@quoll>
References: <20260419-hawi-pmic-glink-v1-1-a26908c468fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260419-hawi-pmic-glink-v1-1-a26908c468fc@oss.qualcomm.com>

On Sun, Apr 19, 2026 at 07:37:37PM -0700, Fenglin Wu wrote:
> Hawi is a mobile platform that is compatible with Kaanapali platform
> with respect to pmic-glink support. Add the Hawi compatible string
> with Kaanapali as a fallback.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

