Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EBE49CF22
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601425; cv=none; b=hPu4HzhBiP6gNOiLfJbaOQq/+5mgxw6KkPSypJdN3opw1UQ60MxOPeJEfQWqTEUL6c37UwQIhniLpLRlhO611snN9Gqe/JFgNXfLhF/WYQNureoAbuleMpaAqLnHbkUXUh19yTZZC+egmIE1bI8OYe91SvRjjpc+N7gh2Wd2Q8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601425; c=relaxed/simple;
	bh=P13BWhKuCnTIa1AF2ho1B5igIbq4ZBTUya+Qk7H9VXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3/4RIsaQeq3UW/eakj0nbSp1re8A/oR5hbEOLEQ0LjGjhD1yMaExqE6GOmAdFaHEU4A9r08StZ9TfKFP9i6G+NA6OIE/+2V+lD4gxtMSn3PJnMSQd5/+RNQouOfTqFiCvbBkXjENaKJd2v50G3jh3Fci4dpuA4AQPdLzupk5Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OI5CR+2m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OI5CR+2m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685C31F000FF;
	Mon, 28 Sep 2026 13:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790601424;
	bh=FSxc54jncYfYWdC33L6funQ4SZkqHESMbz6mSZqHJvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OI5CR+2mSG2xRuY4trWxN0y1B4w+qGlCh2z3jb/NF/jlPrlAU8NLtXRYCqyOBigO5
	 B/C0o+ifZazuI6rATYOAIZUFfzVeez7ecOWkCZqmk9GrLXdFGWNPk8NjA+jj0QhFFq
	 Fwr4duscWPENHQ2tfO4JlvxUEwylFaA2tv2wTkSYNwFEC/pZ4avM4WlgqBUiD/6AZN
	 sFxmj50EPbQjWUN8Yc+nMS04kgMP2BCt+l5rXLVDtErQzVqTvnwBvVxrrPOyC2EYHn
	 i3IXaHBj9wyGYCLUkaH1oXUR06sw/GINoXTWQV2M6sTKfigBZd7zcvTqFeA9Ck1KMb
	 TjK6f7MLFUNzQ==
Date: Mon, 28 Sep 2026 08:17:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: faraday,tve200: Use a
 level-high interrupt
Message-ID: <179060141842.3905299.18293784781944970746.robh@kernel.org>
References: <20260921-gemini-tve200-fix-v1-0-8be03ac2a8f7@kernel.org>
 <20260921-gemini-tve200-fix-v1-1-8be03ac2a8f7@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-gemini-tve200-fix-v1-1-8be03ac2a8f7@kernel.org>


On Mon, 21 Sep 2026 11:15:54 +0200, Linus Walleij wrote:
> The TVE200 vertical interrupt can remain pending after acknowledgment.
> Using rising-edge triggering can leave it unserviced when no new edge
> is generated, causing vblank and page-flip timeouts on the D-Link DIR-685.
> 
> Use level-high triggering in the binding example so a pending interrupt
> is delivered again without requiring a new edge.
> 
> Fixes: 8b17e80d9e46 ("drm/tve200: Add DT bindings")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/faraday,tve200.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

