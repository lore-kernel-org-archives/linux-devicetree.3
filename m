Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E799438004;
	Wed, 22 Jul 2026 23:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762102; cv=none; b=K9UIJ7p6YOUJ4/yFBbuMxDziDR7YyPdhdlH3rUl3tN+A0q27QJcSspw4j9oi4SAHPbAbvEbb9a+kQhIGCsn19MBxX8WDp5wiAOAV5BwQJQWW+Mhh72hL+DWEoEG293BhqJgzUfT2gTGxLU7t5ebcZbYvX+3V46/v7cadIz8/5Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762102; c=relaxed/simple;
	bh=oI0Ky7ts5+oGZguv875MXfypJRhvzG6pBklSsIEDe3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhTG8yRZUqafztGr14QOEXUUFpxo3zb8tdJLr+VU1GXtVZc/dob3A5HKyUWcT4XIeC6D+RGi+WO7Hv3DtkYq+D24mReiLvaskDaaN/r5EiLcf0KViBCNreMXZ/E1CQxu3cQvOySRSMFZBaiyN8C22GhKLZZgxuH6E9m69NkB4/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZraZlJF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZraZlJF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46A71F000E9;
	Wed, 22 Jul 2026 23:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784762101;
	bh=8gh5AJg+DD4Vy8UQCq26/pR4UBiNA9oKnxIK3X0/VtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YZraZlJFn7qhTSKmj7WFLXRbh2ZrK3Zusm1Qdn8D6HbFsc7ud1ZszSB83610bhRcW
	 LLzjYpVMKnkamuBMKCVJ2j+i4FYrvXyNEUvRjODAK8WnLR5NoORFT1I4vHN7VllnxJ
	 QkHvl5wLUv+TvlYynIT5ZX2VcqudSnKZXUvxflvoq3ytU8CX8q244bPNa/ELLhEC5J
	 Vj8rdy06A825AA4AdS2+vQ4lMBMwYCERHtbbTKaEA3FLSX7U89R6nO6XzEntpULZED
	 j+ljMl7m3tHPIGJVAfiEvJ99fBO5JrPED1jGrYUBAgRzKHUb9SVjGm3fYRLh4qFvaE
	 ashvNe5ezG33A==
Date: Wed, 22 Jul 2026 18:15:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: dt: writing-schema: Extend expectations about
 example part of binding
Message-ID: <178476209881.2759556.15629147293821239675.robh@kernel.org>
References: <20260722062240.19382-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722062240.19382-2-krzysztof.kozlowski@oss.qualcomm.com>


On Wed, 22 Jul 2026 08:22:41 +0200, Krzysztof Kozlowski wrote:
> Document already used rules about example DTS in the binding:
> 
>  - All final device bindings (except sub-block of more complex devices)
>    should have an example.
> 
>  - Phandles do not need to be resolvable - Sashiko already provided
>    incorrect review, so this might help it to understand the concept.
> 
>  - Example should be complete, readable (use known defines), without
>    'status' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Rewrite "optional" exception, as Conor suggested.
> 2. "normal" -> "typical" in last sentence about status.
> ---
>  .../devicetree/bindings/writing-schema.rst          | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 

Applied, thanks!

