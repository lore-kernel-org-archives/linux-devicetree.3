Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8883331AABC;
	Mon, 20 Jul 2026 21:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784581512; cv=none; b=s5nOP+97IkxVfwr8lWq3UvUDZNFR6DG99oTA0/fDqy3QQlxm3a4Curu/pt6c4w9wJnNwJFwZYcFBX2E2S59eH4/cphoA0TRIvlPiPGE7jzPN0ie/esapYaMh8Gf5JVDNHPG9ymJ1mZElPEfD7cszaTb1uPGyzmatnDJxbGbyYwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784581512; c=relaxed/simple;
	bh=dvrOJ59IIbtGhvlOJJH2DKABj1dBHx5957333ot3hns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRjBPMdCCQcjSLqhDKRjpnYVZQYXwVGDjmp0dwPx8Z+c/2rdJp7OpglvEO/o0uGCDgNyadgTsRn6YjCDkWYmv7XtOBuGCSZCjhOB/XV3vrIMrU96yCJs/Bvc9L6/DDz5FozqJ+iEdXsB0pkjBWYW6ZFRb8ns7wd18agayJHYSb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9An7S9D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9An7S9D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD521F000E9;
	Mon, 20 Jul 2026 21:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784581511;
	bh=WqFZ9L9VFf7D1XtVpqUfx4qn6AbD446x2jbTs0XGIGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m9An7S9D9NJVFn84AbyTyY7FJ556uPbrdG+MAMC9lzkSCJx+X77eb/to1EaoIYTkc
	 10du+WIICZ68pXAc5StIBiZt4eBFHYRwcWMq5hsytUHBLHjFcPvOLGCjvUu7APCgiF
	 gz+7dzqV8UrZ7lEXuy8JNEM80l5DXYXqw4+a1jd70XJjhNrhzSYDYtr3wc/yRoxqbq
	 PngXgBBEaWam6/XGgBar4LR3XfjcT0cHBFv0ttO4ME/BCf93YhhbOnXqKasGWUCPEh
	 nDiZtcF21ePx6SiI6hZW7p8t+SwQ/NAX+meLAr7OJ0sCy5kxAZrioVaXjEQdtEqW7H
	 WMUbXUFqR3hhQ==
Date: Mon, 20 Jul 2026 16:05:10 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andy Gross <agross@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: soc: qcom,wcnss: Drop redundant $ref of
 firmware-name property
Message-ID: <178458150982.4082250.12636078001546940783.robh@kernel.org>
References: <20260712162212.184592-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712162212.184592-2-krzysztof.kozlowski@oss.qualcomm.com>


On Sun, 12 Jul 2026 18:22:13 +0200, Krzysztof Kozlowski wrote:
> The DT schema core defines the type ($ref) of 'firmware-name' property
> as string-array, so individual schemas do not need to.  They also should
> not redefine it to a single string, but instead just set number of
> expected firmware names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Switch default to an array
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

