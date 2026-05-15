Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68002363C4A;
	Fri, 15 May 2026 07:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778829207; cv=none; b=rPnmLLRjyi3GD+sdslxjNLlgWcMexGdtPWAitheUcqQH883qbfjtn6eFrfvs2EIjf9Bc15NYJfqeU3BruaPJObKAq23UzM7P9X6Pf4I4YrElIFo6tR7dNcZpUA7UWd5mQ3CqCMX7NjYamRub9T5znhM7bJ6p/gABWxHq0RnJIs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778829207; c=relaxed/simple;
	bh=ylk6TA5WvepWdgul2vd6F5cmAObEZ2AqgOsnZUxrZbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDmg/alOp3c+25DYn2p2BDCZpvX0HMy6pCM83LsulPgLKgKk5qzP/60Q0PQ8BVtSEUZj+9U75ra5Y9mcmiuFdn1dI9BLTBanR8k+jbb4+WCWp5k10ceBzlGp2vmR2kluztpDvejApp3V/Jyh36s9bVeGCvB4OKrpmS5647Odjxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jurP/U4r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jurP/U4r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D21C2BCB0;
	Fri, 15 May 2026 07:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778829207;
	bh=ylk6TA5WvepWdgul2vd6F5cmAObEZ2AqgOsnZUxrZbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jurP/U4rt8M3fR9EIf2MBCAwzhbgtjo/aV+CJKcra/18KYfN6mkg2Jnp4n+JLJ4CC
	 4MKLLGYiAGWGdEORbj1VjULUAzahERhfyXdsy+d0ZmIHFoceoE9hm3iNYPpm129j2m
	 aiIkSAQ7vbiFLNbB4KAsb1r8hjmZSMIP2vRNEONn2Gu2t9+1I84VU0f+NKUIWj4Nhg
	 ZBubTEJ/j1H40x3ExCP6+Ec1Vp4QbBBiUWhKkHZvcttT3OW8pEbNryHQn0GoEAkXNJ
	 Vv14q+R1IYod/5EwFqoe2+nFZVItW0VomWbIn7Ru6+hmpiJAkuDdGM+31tpJszVzrH
	 +ay4bxvxFhTHw==
Date: Fri, 15 May 2026 09:13:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Hawi compatibles
Message-ID: <20260515-expert-azure-dove-5a73a8@quoll>
References: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
 <20260508-hawi-phy-pcie-v1-1-237b894353fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260508-hawi-phy-pcie-v1-1-237b894353fc@oss.qualcomm.com>

On Fri, May 08, 2026 at 11:31:16PM +0000, Matthew Leung wrote:
> Document the compatibles for the Gen3 x2 and Gen4 x1 QMP PCIe PHYs found
> on the Hawi platform.
> 
> Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

