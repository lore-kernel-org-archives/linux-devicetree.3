Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC81D19CCFA;
	Mon, 22 Jun 2026 11:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782126036; cv=none; b=CC+zJAYDc7kzq3OlsHTrxP32mVfntrOyPOfDZq1tli/QhZxqAQ+nUUwRbsMMs6Jx8fihtNCQ53jGiB8nqWEcrJV/a3hY3690vo6IZa9bwewoevKp1VVQCTReHW9650HmhpPRLBts37kQUnb9hWgh14aqCQeuSz0/hJ4DvhcUfzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782126036; c=relaxed/simple;
	bh=Ky/TnAMLpqlSol2bBvZwuzp7GMA7SBqNT0uh50NvZkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAOz1xIns28XoXDtuPfSo7UqLQunyZSzNN/rpdB9ciZiepO0egFN4A64H/L6SS0r7G2pdjd3+gR8Mp1aoCgXgHTi2peY+Anylkvw8Xyu9FBtD9fjiaCklqpnBBk4Ijjv1MdqxF293W76SWCvV1HcISv4SCS/32vg2Hc5ym+9f9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbyXSF/I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbyXSF/I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22451F000E9;
	Mon, 22 Jun 2026 11:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782126035;
	bh=FUT6ZwoPwzkyNOnrWPcaDduAmAPOWQYlWzWcdRpg+jE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lbyXSF/IHPczLXADHFJzmFVBwfcosBclokbNfFrmWGlEvLzWJGsqCLOz4AtsCO/uq
	 Pty8EglHWZCnLZqqblH68f3cHQ8D1f15gMDEa70Aa9tCHG55IEOWEAm8zRfFUEmFiC
	 w0hfFDtGz+zFx2tTxXB17rCPYe6kolENUv7p/0HCEzs7qxt42OSKzdCROjj0LU9Se6
	 T+fU08NMBsAidUrXS4wBeWZakXb2zn9Moyw9hz5sLJC52o1ITiL3/lzpNNyQq5m4rJ
	 /F+kPI4fkU3KV0LCfjBgcL3MWuy3GNwaod4r4kPoUa7YAwiLi5aHHiF4RtXXbfrNl0
	 auVW0MzAb7MLQ==
Date: Mon, 22 Jun 2026 13:00:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm: qcom: Document Hawi SoC and its
 reference boards
Message-ID: <20260622-brainy-rapid-tody-dd7c3a@quoll>
References: <20260617151602.2018579-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260617151602.2018579-1-mukesh.ojha@oss.qualcomm.com>

On Wed, Jun 17, 2026 at 08:46:02PM +0530, Mukesh Ojha wrote:
> Add Hawi SoC and its reference boards to the Qualcomm binding.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2: https://lore.kernel.org/lkml/20260617080147.1657632-1-mukesh.ojha@oss.qualcomm.com/
>  -  Fixed the position of the Documentation.
>  -  Corrected the commit text.
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 50cc18a6ec5e..e229c0097e6f 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -303,6 +303,11 @@ properties:
>                - xiaomi,sagit
>            - const: qcom,msm8998
>  
> +      - items:
> +          - enum:
> +              - qcom,hawi-mtp

Normally this should be rejected on the basis of lack of user, however
this is an exception, because the soc compatible is already in use.

As an exception:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

But if ever this commit is used in argument "oh, compatible without user
was accepted here by Krzysztof, so I can do the same", I will
simply NAK such future contribution without reading the rest.

Bjorn,
Please grab this for current RC fixes.

Best regards,
Krzysztof



