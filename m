Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1204831B830;
	Thu, 30 Apr 2026 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541483; cv=none; b=IQMOt8RbM/IbVmpTGY9G3fyGkkFkZXHKfXTZrRLTGHokubpjkc7pXHbpOEvI0Jsw0Hz3ffctIKQn9naG5REcWWyNbouIXJI1vD2lpTRnCryA/ASlILg2u0idUdovsP8N1B4oUIAmvd9BpoapMdIjaxFNdvIicErST3cYyVusI9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541483; c=relaxed/simple;
	bh=lNyfrnysNzXRa/d5wAQ61BZKV63ROnMlAqiKmaO5TiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oroAdkojnMzZ2RZ3fQzpLXwCMIQ1/E3BzfDG1YG+ImI9VH/5REbtHhW7anmv0jOInF2Yaeon5QSehmlKsX5dEfl6ldIfFoEzO8RrSHGf+IY5Hzr3ZGHyUFwazgKQGTXf+LRK+i4nrxz5QAblbMGWWHY+Uj4Uhcb2/de8mNex35o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8VtOWAw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8VtOWAw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEDCC2BCB3;
	Thu, 30 Apr 2026 09:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777541482;
	bh=lNyfrnysNzXRa/d5wAQ61BZKV63ROnMlAqiKmaO5TiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8VtOWAw6O0Mnar8m/p8NfAM2S6bQGzfi6zgBdPGBYEsh1hmYFWs0w25zTsPX+wyU
	 gmEK/pOtPwd0ItoCRD2yo9FgUbdyMfLRoVXV3FIlJkR+kYAFWshCG2q1ERLy3SSWRc
	 XoDvq+Vc14EeI5ZYNRmWoNiWGg2HRs/3Q/uvN3N3TsR2ABJv2XwCa+Y3xLfXtK8GEm
	 LpbBcOMvzaQQiJfarjpZgG/Ixl5XBKLCsTMbDuh/FlXou2yfSM21VJwW3iqHTuAdbo
	 hIVJdwh4jTv3v3S+uyD5t2nUVwNOdIUywKXh+Ynx6f1q8u75nD8nlJ2lF9p4KFTJen
	 1uqfaY0gaPazQ==
Date: Thu, 30 Apr 2026 11:31:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: qcom: Add Hawi compatible
Message-ID: <20260430-finicky-jaybird-of-prosperity-0a26c0@quoll>
References: <20260427182618.3667963-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427182618.3667963-1-mukesh.ojha@oss.qualcomm.com>

On Mon, Apr 27, 2026 at 11:56:18PM +0530, Mukesh Ojha wrote:
> Document compatible string for the QFPROM on Hawi platform.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

