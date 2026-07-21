Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898A947D945;
	Tue, 21 Jul 2026 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629277; cv=none; b=VIXjp3Ho0X/2JiEeiYfe85fP0UqH61a1EQq8LkyxOW4EkaNyF5nT8jAX3e7gerMoNZ3jSdwiAgnt6T1iG4Sgi9PwhZrjJ4RtriIe0wIPEGVlgDlQpZTdTWSQPjp6XRNXkryf6ZZviyK+pYKTGEw70lpfLCeXz7WNYsFjhu+EEk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629277; c=relaxed/simple;
	bh=wzZYwpIL3SifrCqilZP1HCOddtLNrTnmM9JVAgy6jQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BS3WCTZRD3yDZ9slmGvnDjioKBLn0gXWcavavvTaKSKnfugVqckhBDtajU3L2Mmv9fDLbAK9zjNmsrnqfm1yAdZHMtwulPtgxtLiT9rikmWP7nccbzB7Z5Hp9eRgZZWA9icn2zLb0zJpvwYkodv+VjRe3LGZC2jInEFkLuwNATg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WglTvML/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WglTvML/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E701F000E9;
	Tue, 21 Jul 2026 10:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784629276;
	bh=UJAxYGj1UaZbfMKDgzertleGyGlCpBFTuvsdrzbi9Hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WglTvML/t+6jHLKVRM3tARAfn8ssx3mxBFNLXQkc+DaEc4T5ijdq+qrBtXvQaejfi
	 nFOgFKE5LQPsnUqVMpiF8LTibcuxAJFQsppcOfcwyV/wiFyoZDwEewJNLMSakLMCBu
	 siUC+uoLYNfpfFqbAyv9CJxHZ6J1affjQDtI6166/YK3McPI7RA9Yu/zJyi/u6q2+6
	 UrgkiAuuQySSiDV9pPyiN5D/4qB6aIgsg35J0RVzYmCEZzxm2sHyqKh0TDoUBWQyuv
	 bOgLMYw9Q7blISL1InJcyCWl07IhVn9kn+dYSda4TDDAUlyYsesNEJTq0GToyJKh3v
	 PWHEFlWj4KYnQ==
Date: Tue, 21 Jul 2026 12:21:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Kalambo SoC and
 board
Message-ID: <20260721-berserk-independent-weasel-e264dd@quoll>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-1-a1069b5a2757@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260718-b4-kalambo-crd-v1-1-a1069b5a2757@oss.qualcomm.com>

On Sat, Jul 18, 2026 at 05:06:21AM -0700, Gopikrishna Garmidi wrote:
> Qualcomm Kalambo is a derivative of the Mahua SoC with CPU cluster 0
> removed, leaving it with just cluster 1. Document the compatible strings
> for the Kalambo SoC and the Compute Reference Device (CRD) board based
> on it.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

