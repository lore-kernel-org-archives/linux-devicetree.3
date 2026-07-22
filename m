Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3706139734D;
	Wed, 22 Jul 2026 07:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705822; cv=none; b=MOB72BSeqR/aOWqasOpUqzFmc14wM/pSJnRP+6ODX97AgoNK3q2JmdSx/Vy7XLNekL7YyNN6Obxhc2ZLKkTcbL9yJue754q3NheTHv64sS3Zb/9yc9he03+S4ysXwsBACNDtGQouH7Vh5SHgP7Onx5sKq9nbcmxgsULNPRO59nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705822; c=relaxed/simple;
	bh=1kOmRTb6MaKaLNGUOKNxilpB6LfDnhekabYfFZIT/Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWt1eUUlPNGkDwwiNQZ4ENH5OAOcpnlW3dLeYOqZ6UadTw21q6RocgH67Xz4nrGdDD9pNIoMz8Vvbxno99O1EpTZe1OPznQxjGnPSlIBZ3jeYrOU+LoNF1iB5jOtSIF8MRkxnKojD8tJOPWl2uFccDZmCjTRCQ/OrF6Yv/LFbdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+guRqw3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+guRqw3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2491F000E9;
	Wed, 22 Jul 2026 07:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784705820;
	bh=P3LjNo5+HUymLEwKRXyD2jBdr9RZGhD+hyIoRuOvhao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i+guRqw3iSOA9BIJBjV49H2wdcb6FDWMFMNvIXnIy0facByLywPPWUgtS6i8e2a6Q
	 f1ihr9iTYKL2D5PAIuwhZvLR8PJS7L6X4PLhOMY/FjhKTfQpB7BM62BbuWLMMGeYHi
	 rqRvys2TvHcZOeOJiZzdCAFHNrw9C6B+N8sBKUbe/Oa3feYGnwDO/Rq61SoDsPJpYC
	 NLWGdMFliz8CjCQPyKprqPUxC1wDVUnviE1VaUs8+NmLFccjjsVhxGaVR4cy3IaFjK
	 yIZY+AAVZqLc55qULiliYupD+bWkNv1b0CufshZIq3DwjnFlO6DPkIjGCE4hg875yt
	 as1jfzIZlXocA==
Date: Wed, 22 Jul 2026 09:36:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] of/overlay: return ERR_PTR from
 dup_and_fixup_symbol_prop()
Message-ID: <20260722-warping-earthworm-of-downpour-1bba3d@quoll>
References: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
 <20260721-nh-of-alias-overlay-v4-4-8ad097e31e36@nexthop.ai>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721-nh-of-alias-overlay-v4-4-8ad097e31e36@nexthop.ai>

On Tue, Jul 21, 2026 at 06:01:49PM -0700, Abdurrahman Hussain wrote:
> dup_and_fixup_symbol_prop() returns NULL for three very different
> reasons: the property value is not a valid non-empty C string
> (malformed input), the value does not resolve to a node inside one of
> the overlay's fragments (not an overlay-internal path), and memory
> allocation failure. Its only caller today reports every NULL as
> -ENOMEM, so structural problems in an overlay's /__symbols__ node are
> diagnosed as memory exhaustion.
> 
> The next patch reuses the helper for /aliases values, where the
> distinction is load-bearing: a value that doesn't resolve inside the
> overlay is a legacy alias that must be copied verbatim, a malformed
> value must be admitted inertly with a warning, and only a real
> allocation failure may fail the overlay apply.

Again, AI written.

> 
> Return ERR_PTR instead: -EINVAL for malformed values, -ENODEV when

Why?

Best regards,
Krzysztof

