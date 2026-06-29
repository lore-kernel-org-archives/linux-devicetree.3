Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65F53B2FE5;
	Mon, 29 Jun 2026 07:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716449; cv=none; b=Mx1JbhRuEubgQ2wgBwW9tTx8DwD92Fm6QC/naW6FYQzV8ebGQxB+4CDpuShKSwh+2csDWYd8E+6ghVQjONpCL90d53QdeSGZm/ylFskkMCWQJrrju/A27uvEjYga4oykL3f6hADeEGoBg21M4DF+HkCAO3svJzhuoFHba1nz3To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716449; c=relaxed/simple;
	bh=VVm3HaFE7P5SK463srkHs6peRvpRAWu1aUxzlc5oHFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZeP7i12HsavjK5xX7H7g6pTxjKfmkKFKxpmofo8AYW4l7xSISdKxykL8usnCdEeO6iggW/bce/00njJvmRqmdgV2ioJjMisyuln/p5SwZ2TRLeCqfDszbcCO9eN5SxaviMIQ+za/rTorkWGYJ07O2FJC2FlXPq2i9GDZK1uVyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AE21F00A3A;
	Mon, 29 Jun 2026 07:00:47 +0000 (UTC)
Date: Mon, 29 Jun 2026 09:00:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for
 Snapdragon SDM 850
Message-ID: <20260629-devious-elfish-caracal-ec1a30@quoll>
References: <20260627-sda850-v2-0-44bf46ade42e@ixit.cz>
 <20260627-sda850-v2-1-44bf46ade42e@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260627-sda850-v2-1-44bf46ade42e@ixit.cz>

On Sat, Jun 27, 2026 at 07:50:15PM +0200, David Heidelberg wrote:
> Add SoC ID for Qualcomm Snapdragon SDM850.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

