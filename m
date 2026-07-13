Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ECE3909B9;
	Mon, 13 Jul 2026 07:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928637; cv=none; b=eYdd9pL/FjzTsAEx9MHLbjztLeNXibgrbRwAjM0oS8F9FQP4mBbUEqJ86/MfLe8mm7sKT624GS7zCp1tJVP2O5cY6lk/L39CsVThgEpyF/i4vyex4kLPBR8g6+PMDoSjemljtPKxstmUTDYzU8QBGvLTwB0dngOuS2cy+8KsKd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928637; c=relaxed/simple;
	bh=VjZ3p7ENkVycmLIoPFRETnMEeUKLn0OEA8a6Bift1Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCLpnQ+Q419Id2KN5SjtSHN776QrzmSMlQCDMINMyezwU6SSdGmZllO1km+4AYyUmKD2QfEC90yf1H+LAJJbCmZWUJr0zJwTP5VW747+EXJ4EGH1tFAa35R5DK7UqPz3472lXaY0mv5gdnnRp+81O5H+NFAP3HxT8jrU6wMoXXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrIcfcFA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrIcfcFA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AD31F000E9;
	Mon, 13 Jul 2026 07:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928635;
	bh=ke5hnGqmWeguDah+eqnT4SVlJP/h6mBtANYBF+fNAig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JrIcfcFASbKWyC8nfLwC5M0iez4ArGKiLIYTRjHev37p2UqFMBjYB/Gyoed6jMNtP
	 Z5N3yfqN9c6HMosUdHMaR5To5nCNvvOaIkqxdl1FALuh75S5rRfeNspqUg3haZEcGf
	 kBw1EgKqlvWdFzGxSPZReN/f4xqrCA+K0TrknbkaFLz99ogwIUF5/rzXiaU/F4QpIV
	 WUIH4inKuZs0vmcWzwMIZc/Dd6bX+3xZ7NBMNl2Hv5/2Sw+RcB8ESf+xwkkPJL5uHw
	 xFHxJfMgfQq2sIkt/chlcA+4U3JhrpJclT3l94MONSUt05rUIytNObyWnqJNvX0vCd
	 by0LlhXN23gNA==
Date: Mon, 13 Jul 2026 09:43:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oleksii Onchul <oleksiionchul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Xiaomi 11 Lite 5G NE
Message-ID: <20260713-bizarre-stereotyped-wasp-fcc73f@quoll>
References: <20260711184934.55701-1-oleksiionchul@gmail.com>
 <20260711184934.55701-2-oleksiionchul@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260711184934.55701-2-oleksiionchul@gmail.com>

On Sat, Jul 11, 2026 at 08:49:33PM +0200, Oleksii Onchul wrote:
> Add the compatible for the Xiaomi 11 Lite 5G NE, codenamed lisa,
> which is based on the Qualcomm SM7325 SoC.
> 
> Signed-off-by: Oleksii Onchul <oleksiionchul@gmail.com>
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

