Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC72034D4C9;
	Mon,  4 May 2026 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777895901; cv=none; b=j5fwvpCwoZbXGusAQoBMX/cr8b77PBRACrMOOXWCN9dZA0rW/KguXxXxtC5YcdKtcARzJdy6iKnYkZz7njiDPEd0xsJADl5Lts9Xq0j+FxxRHrd4q+GsyJ4afs4RSRScVT2J4utz+29Hua3AVO6D0XCJfyMuNID/u3vJr1zQHTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777895901; c=relaxed/simple;
	bh=gSsvyPBazZgd9rhyKQa4QCJ3STIhX978e7ISsDkghL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSZZxifjvXcLPvcoy8Diew8Ds1bmowreiHdPyqjw7z3Fd/9KwYkw8jVOhjtLm9eKiVsAoAttpN9PRqg6sVbo78kv9iUsytPr71qHBQt/6Q9vEJlaAnPgpGDnbQjXsf57A2iD5kdGOuVzNsS0kJVV1qLb1MPknQtiI7Axxn3eU8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAYcTF2n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAYcTF2n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0077EC2BCB8;
	Mon,  4 May 2026 11:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777895900;
	bh=gSsvyPBazZgd9rhyKQa4QCJ3STIhX978e7ISsDkghL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SAYcTF2nXIxWP39OyXv6dGuoXlWAurobpvxyDzhHT8jisSzCkRh1o2b4JvWRDf54E
	 hqN3lOsaJuzdefwYNv0OAmR69DCZ2+guTYhfATDNeMP2whGXS21B3GXPu72ihD2UQE
	 vGtPPvC16cv+Llp0oZTR8ubGW+O/RXFmOoZcAN/Fl42LNiGUOuc9giseqEYu3UGPyj
	 xqTkFComAe2zBJMFe6UIiQUNRKKhwWBG5lq3JHKyasCcxvdTFDdy8zojTJxtcBYdxd
	 5YlwKz6Kk1ifXia71KVY+jf0QOcojCyXr10SaY95x0V/Ru8YGVcgmap7gwzkcWk4JN
	 4gl1k28BZa0Lg==
Date: Mon, 4 May 2026 13:58:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cache: qcom,llcc: Document Shikra LLCC
Message-ID: <20260504-meticulous-neon-chicken-a31b5f@quoll>
References: <20260502-shikra-llcc-binding-v1-1-1da4b1eff0a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260502-shikra-llcc-binding-v1-1-1da4b1eff0a8@oss.qualcomm.com>

On Sat, May 02, 2026 at 09:35:06PM +0530, Komal Bajaj wrote:
> Document the Last Level Cache Controller on Shikra SoC.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

