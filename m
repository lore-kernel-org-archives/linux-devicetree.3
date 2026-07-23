Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B383CC33F;
	Thu, 23 Jul 2026 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784793393; cv=none; b=oPTGMX2Pamk0WdLP1359k8/d9YzTa9ulFCB58s4IuPmc6qNTkBYLUg1Qj2oid0Dh6kKkIdoU9ee5rvAkj6AmeGWlpdb2XYnz3pNiPQapPlgBDqCceC7AZAy+SWvWIMyuGxjpyNjYaH14IT9eMO0I1fhMTYRbHqZyywu14jKLafU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784793393; c=relaxed/simple;
	bh=oqDP8pUg3OGPxsnTaYKzPS/pXbJbOrSbvTvi2v5pbHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NU9SJktFyKY6PDC2Aoss3i/mEdN7sQwba2JjWJQFRopUXbtgC5rCsU/hyDv7P5zApvZMcN/l0pGQ+JDyxDCk+vGBXGdc2YxUWya9iXnb1JI3YyuQ/dkDksLAEyom5knjtVIx/SzZh0tbDt2NsfaHjIo7FHOYtBgw68yCTkmgELw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbXo2/pw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbXo2/pw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F27D1F00A3A;
	Thu, 23 Jul 2026 07:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784793392;
	bh=kU/hB53yzACw3nVTUg0q9qx7GTT/U7sckUHUBUwWUEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BbXo2/pwYqdP1doS04++5hYTyJclRcCO5ns00F1DJqtW4SOhIfAqLPyS18NPk57rA
	 19CPI9W+tYHC5dhsGuny9wIp2R2lWlke6ZAONrV+oLp0FTq/pSfHDkYWU8wuVvU69n
	 egdCvfBoVPPu1QHlW01Ejzh4+QFSy4uNTrUWIXHk8cBa6TSTuQWdhR5ZIUIajulXih
	 eosT4xK13lUpoG3u/dkUTo3PE1+eEcIEVvj/TtQToB4LC4wOqsupfK7DbLrHvdWA7r
	 mdFCAISYUqfqpqPgBBGVgHydJ/WDGGeIi7CkdUCC+Ldb5Jxw7LMpRm5ypbvg9TocIU
	 Pesjb9mnnvpQg==
Date: Thu, 23 Jul 2026 09:56:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaipeng Zeng <kaipeng94@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, konradybcio@kernel.org, 
	andersson@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Acer Swift Go Pro AI
 (SFA14-11)
Message-ID: <20260723-acrid-legendary-tuna-4affdc@quoll>
References: <20260721082410.18275-1-kaipeng94@gmail.com>
 <20260721082410.18275-2-kaipeng94@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721082410.18275-2-kaipeng94@gmail.com>

On Tue, Jul 21, 2026 at 04:24:09PM +0800, Kaipeng Zeng wrote:
> Add Acer Swift Go Pro AI (SFA14-11), a laptop based on the Snapdragon X
> Elite (X1E78100) SoC.
> 
> Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

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

