Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832C83E1204;
	Tue, 19 May 2026 08:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178919; cv=none; b=HyO24/5DCFJSotpMIFo/N3ACjF0hmCy/4OlfPK6D1qv3/QhNRHJEgj1YEDNlSNcYMSzhXR5Wd/We3sYKtNu2R3JaTNU+NyVtUdG9F42P3joBAhcpFgrKQhFHM6OPPlF6U6JsmlEj00d3PSncglAUcXGj2BG6Pbcm2dZWGwPlW8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178919; c=relaxed/simple;
	bh=jW76pzp0sOdf2l4htMdq55N8bvvlTvZo4+2UV1iNegI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQzR3kGycuuiOY8DNYuKJrdyc5EdsS+iNeaU4IKkbcmtpgI227ZQ2UxyPl0/lnWDap4nsGae66INSFHd5Hf9Nk6QbmBytPk85QLAuAumh1YUeWR4GGRgtSIqxXrNKRhYUa64X/mUneGsJhxLA21/3Vkm1sXZ4tyn3UhZzjC4rRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUyGG4mo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUyGG4mo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A98C2BCC9;
	Tue, 19 May 2026 08:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779178919;
	bh=jW76pzp0sOdf2l4htMdq55N8bvvlTvZo4+2UV1iNegI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cUyGG4mo2oBHW2uYFmMvvSoEA666+FebGjYnIhqBwlF96s2bQ6qSkXRj6dsy1btfN
	 pSXw4aGjII8xDDfdG5tXjZz7fYVYvPOEpsY7nw9RO1OoXmySku1qQhMB3wKEdwBNfQ
	 q2+guf6wvPFAnAZaxxU51U8BAv8pIi/RuhohQDCTFzTHNJ6geFYsHmB3aBGdh/DYfe
	 BN196eGHWivwzowJPduF4enHq4zsSxDgny9N7KzHTf6/sqwF1idy9Wz9ihXRpgwthy
	 3BhqTycYmKZNb+3mAAnu6kp65T1lXUP/PPdvcIYl+3Muz2SnPcp25iEPHrXvcWDFSX
	 CfR+Zt6s57LZA==
Date: Tue, 19 May 2026 10:21:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ajit Singh <blfizzyy@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: qcom: Add Vicharak Axon Mini
Message-ID: <20260519-uppish-lemon-hoatzin-4de233@quoll>
References: <20260518110435.16262-1-blfizzyy@gmail.com>
 <20260518173039.20592-3-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260518173039.20592-3-blfizzyy@gmail.com>

On Mon, May 18, 2026 at 11:00:38PM +0530, Ajit Singh wrote:
> The Vicharak Axon Mini is a single-board computer based on the
> Qualcomm QCM6490 platform.
> 
> Add the top-level compatible string for this board.
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof

