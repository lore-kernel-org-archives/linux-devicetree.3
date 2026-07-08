Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFAF3E5EC2;
	Wed,  8 Jul 2026 06:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783493347; cv=none; b=HbgHwWu5rxNbDCCAJWRnTWvs7i/Qd+u29POHzoGszqgoNh/tLliKLTas2EXwmJ+/xv7OTGnW25AkvXxyW6jrp092KjyBIdQN+lF7o2UM56iBhI1njn4D3lErfQc37vNL1SGneOfHK1cZO6f1R0xg+z11NilB0n1mdyRNnNV+vSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783493347; c=relaxed/simple;
	bh=JNVT1Z43H9HZFNnEPqqjim02bHO3uhaF1DQEVW85C/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJWa3Ku8sESPXv3U+W5jFPknIGEbPsk+/qz6gZhrZQ1glfrFJjsOnLMU46qQvSYiAiliQ4Geo5InCxmsMHdeudq8hyCetyMHGV3XTkeBzygDZEvQ4iG/6HehIR1n28dF6ZJ6+lth5sR07UcMCxYriJevklpaOjFQKi9qq1rh/xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LHSA9G9Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LHSA9G9Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F78F1F000E9;
	Wed,  8 Jul 2026 06:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783493338;
	bh=HvkQwg7gM1W+VIf4PKlNdJk5a/pVXivFwZmTmO2ey6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LHSA9G9ZsWX3wEs/gKEB2+IyV4TdoEvRbpnGi7dFgWWr9XPn/6xzXnqC2OMa1GS6S
	 3bYZXz8KA2/r470L5M40AIUGvgtsuhVXC5Kkhh78Ep+EmzLKJdqbRyoxAIapdtH8tN
	 yamOVeSnEatQjr33Du0yxUfR4H5U83sR3ab7CaVBO0JBnwyOghyRAY0hGRpFKonLcb
	 GIAklm39Zl1RS/0HfrmZUPOiaQQD80HZeXucpCwjfaY5lG4ExkcG5oa629wnv/pqal
	 C6JfYhf1T1yM+ZS5gpSEFJ3pTiTCyxdxzP8bQqn/ffCL9c+TE2k01i7hK80rWxFh2s
	 tPt+N55RbJCmQ==
Date: Wed, 8 Jul 2026 08:48:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nitin Rawat <nitin.rawat@oss.qualcomm.com>, Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>, 
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Sachin Rathore <sachin.rathore@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur
 compatible
Message-ID: <20260708-purring-infallible-bullmastiff-8f6dea@quoll>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
 <20260706141346.4180348-3-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706141346.4180348-3-mchunara@oss.qualcomm.com>

On Mon, Jul 06, 2026 at 07:43:44PM +0530, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Glymur integrates the MSM SDHCI v5 controller. Document the SoC-specific
> 'qcom,glymur-sdhci' compatible as required by binding convention to
> identify the hardware and reserve the namespace for future SoC-specific
> quirks, with 'qcom,sdhci-msm-v5' as the fallback.

Drop half of above sentence.

"Document the SDHCI controller on Qualcomm Glymur soC, fully compatible
with existing MSM SDHCI v5."

You do not need to say anything about some conventions or reserving
namespaces. We do not reserve namespaces...

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

