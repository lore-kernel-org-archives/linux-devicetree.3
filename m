Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521C248094A;
	Tue, 21 Jul 2026 10:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629625; cv=none; b=eYQp8FTZ+zyXssWFEH3qiY0s8t8PwcLpnPLBUH5m37AATBj98H992/dtv9+R0ugwzxZABP986pfauVPHEMZsxCdNMI0alXBLa4rydIuaJMSJ8ULkTLSH3zQfIOp4GRIH5V6Sw+S+FXHKz+Q+8RnJX2/nyUaXoeif1Bw92bJf+xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629625; c=relaxed/simple;
	bh=UEZ76pJtMuE6ZrXfzWZoib3Wj3xgPgESRZA5b+adBho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdkeSc484nCNDTl/t0WTuHUf6Tmc6s0BPooiP3/uaQ3Smf7mXsU85UXJc8RjYWNlbAr0l/rXiM5VDHdE8RLFWq8wBfmv0IW+zlKKTcDSNOvRTJSRrqtdzPXO2Yw89dDQl0r2T51YE1GlcZawWgx/M69OQ76Qwy4iq3bCUoyb/pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8mI6LZq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8mI6LZq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16981F000E9;
	Tue, 21 Jul 2026 10:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784629623;
	bh=VOQYRUJYf7+WLQdxNj8yLqFKlr7uDsR1egWOL9NBqKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E8mI6LZq1XGuIuR29rf9r2YfON5gVnqBHMgW9pB6Xyg7pLnajpunRyW7MFveLDST1
	 0hwZpXeIw/FIIt/5Ku/nflRDYV74yw7zHcQfaLzeGS9RmuSuVoNt2og7Z+wODJJIV9
	 8UY2FqFFgVLrvXkdYGaw7iDh6Dc0Yd5AfmgaFqryfc+56PPT0hs1QsNJV94BCtTqmC
	 P3iVTyKu7c7ThiS98VPPDI6nNqL/s/keBbkIdWPgUg8lzV20Gu1GHG0JhoeoLd3feJ
	 1t4Lmw1v44McPeoLIOvAesd79TnYvQJ96fphGRZbM9wnhVX1acnv7E3EnhA2bHxgQ2
	 r4dhn7gGN329g==
Date: Tue, 21 Jul 2026 12:27:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, inux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, guf296@126.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document Lenovo Legion Y700
 Gen4
Message-ID: <20260721-grumpy-malachite-bull-d7178e@quoll>
References: <20260719093226.197740-1-mitltlatltl@gmail.com>
 <20260719093226.197740-2-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260719093226.197740-2-mitltlatltl@gmail.com>

On Sun, Jul 19, 2026 at 05:32:25PM +0800, Pengyu Luo wrote:
> Add compatible for the SM8750-based Lenovo Legion Y700 Gen4, using its
> codename, elden.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

