Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C0A31196F;
	Mon, 27 Apr 2026 14:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777300673; cv=none; b=CmswpkZHEJsgM7ztmqol5XH1zV39BfK9TsBA0zEyEUDGNouCT9Hy+nl7SmZ3J4R73bfISdQ9tJa83DBjb4HwtIU8qfgNgOraGcV60Q5v7Zsojd5PIgjg9qHNSd82Ea5tltupIAn0zqyxd9EB1EA5gTlKFAOFsgXS9JvsAG53+7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777300673; c=relaxed/simple;
	bh=/zh0Wt5k0KjeFt6l4UoNKFAp5D/7oQ5SHJQxt9uh7x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqX/eLS5OqipjqwwJOXSAxu4EqdLmhhZKHKU7YkBGYfTq7/tPqJQuMjC7zRZo9/4+tQpmLPeSbDLj71AfUqKTXl3BEo84S6dGMFyXrMFAtk79Qx41NumX8sX0vofrvme/9BuSm3mwoUJlJZSHh6dcum68yxBYdzW89JB4oKQ3o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IAfjW95O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IAfjW95O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4AFC19425;
	Mon, 27 Apr 2026 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777300673;
	bh=/zh0Wt5k0KjeFt6l4UoNKFAp5D/7oQ5SHJQxt9uh7x4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IAfjW95OzKS2EKDgoQICB3O7cL0706XXZHuDQhdRbhya4jx42dg9LkROS67MWhQWF
	 7ar3fgtLXa8JohZqQZyAxx0+8NpWfT2qVtTXWjeU12Y/+MilQWfnl2zp0OpDG7wjY1
	 oHof+ZqA1rjvmBE13Jc/se8KDNLY2qd1y7kunjTufqRhhlBEOM5Saj2MKum2qRqHTm
	 jgtS3ExtaVpV83phNbJu9Lf8uGG7VN70vwap+bnXxbIJoksTtPtaggv4wr96qRoncm
	 gUurDrqd4WRe4lahP8HBoB6kl1dSXAOGWr/XmWJ5Oa57+kWNDpIsZWpTAivhbqcYfm
	 /Dfj0OTNsWxjw==
Date: Mon, 27 Apr 2026 09:37:50 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: dt: writing-bindings: Extend compatible fallbacks
 guideline
Message-ID: <20260427143750.GA2491314-robh@kernel.org>
References: <20260415082113.22775-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260415-rinsing-pushup-ba81cc249086@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-rinsing-pushup-ba81cc249086@spud>

On Wed, Apr 15, 2026 at 03:46:41PM +0100, Conor Dooley wrote:
> On Wed, Apr 15, 2026 at 10:21:14AM +0200, Krzysztof Kozlowski wrote:
> > Extend the guidelines when to use fallback compatibles to cover to
> > common review responses.  Devices are most likely compatible and should
> > use fallbacks when having:
> > 
> > 1. Compatible programming interface, meaning one is a subset, and Linux
> >    device drivers can use the subset to correctly match/bind and still
> >    operate with the subset features.
> > 
> > 2. Device variant discovery through some means, like registers.
> > 
> > Devices are incompatible and fallback is not suitable when that
> > fallback cannot be used by the drivers to match/bind.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/writing-bindings.rst | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/writing-bindings.rst b/Documentation/devicetree/bindings/writing-bindings.rst
> > index 667816dd7d50..03e29e2d50af 100644
> > --- a/Documentation/devicetree/bindings/writing-bindings.rst
> > +++ b/Documentation/devicetree/bindings/writing-bindings.rst
> > @@ -53,7 +53,12 @@ Properties
> >     - DON'T use wildcards or device-family names in compatible strings.
> >  
> >     - DO use fallback compatibles when devices are the same as or a superset of
> > -     prior implementations.
> > +     prior implementations.  Fallback compatibles are applicable especially
> > +     when sharing a programming interface or when able to discover the
> > +     variants.
> > +
> > +   - DON'T add fake fallback compatibles when software cannot use such to match
> > +     and bind to a device, and still operate correctly.
> >  
> >     - DO add new compatibles in case there are new features or bugs.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
>      - DO use the commit message explain why devices that may appear
>        compatible in a diff (e.g. no differences in property use) but
>        are not compatible, are not compatible.

Can you respin with Conor's addition.

Rob
