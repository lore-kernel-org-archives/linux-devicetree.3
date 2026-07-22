Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE95353A6F;
	Wed, 22 Jul 2026 13:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728103; cv=none; b=ErXoCk+8CRneoJBVuwPOW2oNyPiV1ODYvxZCc5e0R7I9HJOVogAQpHc1xz5Gk7MTCkRmSp/sbfKkR115m6Q4a1MyfNLxyvO9xGPuJngUTvfGviec0MB6jleY5ZboF3XLfQuX1Wnent7MurJEApDKd1dtXrIA5xHz+JydbJBrazY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728103; c=relaxed/simple;
	bh=vYADJRhnWgKJieT0HqEF8XfUJDlNTH+Kg9P1SxUh6xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7SpH4mSGnqQJjEEvoUqIverNtnn59Rx+zmvqWoPH7+ZDOIfSOfjZv3CgSFB+6dICKRquPcloQNoc9JU0paeYXvNwFWT5Cn5Ab47K+EgOzB3vwobBd3nnO3dhSf/FIYit+xt/Mj3FClsU3NdozNu4Ibeds81+3/W1OBJW7hBtS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IqKN2/ag; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IqKN2/ag"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AA61F000E9;
	Wed, 22 Jul 2026 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784728101;
	bh=JsDJn/f4hBwLi+U+onts6GcuCiACpZJK4u/KB36UBow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IqKN2/agzzl5+zzMBA+qlFal+F476U+Z0WxPjoJwTcRb/pXO/Vs2rn8LIrt2EhQDf
	 zQDxymhVsBmoxwAz5uXxdAHVb+6o69ecb9qwuay4cfm8U8Hxp/aU7kmsyaSLes8orX
	 aRChnEr1UVO2q+OmySrT7PyvmXxYQWhVGU3e3r6t5eafzmGBd7SvH0IxHSBeGLECzL
	 gwuQIyJJZm/1Xk11vP/a60TQXBH6aj7XLPWSYBHoYEA/b4WerlW80YnDGsvV9MBNzx
	 CbblpYjpkyLjxrCVwn0yy28NAwcRDA/rmiEqzkP3JF6OrNsZ3GZiu6cmxDybYrr5ha
	 CBrSCltWU8z9A==
Date: Wed, 22 Jul 2026 08:48:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Pascal EBERHARD <pascal.eberhard@se.com>,
	Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] of: base: Handle optional argument in
 of_parse_phandle_with_args_map()
Message-ID: <178472809900.492485.3835250826852589304.robh@kernel.org>
References: <20260716-schneider-v7-2-rc1-eip-of-fix-v1-1-9b9383f936c6@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-schneider-v7-2-rc1-eip-of-fix-v1-1-9b9383f936c6@bootlin.com>


On Thu, 16 Jul 2026 12:51:12 +0200, Miquel Raynal (Schneider Electric) wrote:
> The kernel doc claims out_args is optional. In practice, the function
> unconditionally dereferences it. It feels like calling this function
> with a NULL out_args argument may be a valid use case (in order to know
> if the lookup would work, even though we might not care about the
> result), even though in practice there seem to be no actual user of that
> possibility. All callers give an on-stack object to fill.
> 
> There are two ways out: either we drop the "optional" wording from the
> kernel doc, or we handle the NULL case properly. Since handling this
> case goes in favor of more harmonization of the semantics and since
> of_parse_phandle_with_args() actually do handle that situation
> correctly, let's handle it in the _map() case as well.
> 
> Use a local on-stack object in case no argument is passed. This way, we
> actually go through the same logic as if there was an argument. We may
> however return rather early, since the second part of the function is
> dedicated at filling that argument.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260710183359.61D3A1F000E9@smtp.kernel.org/
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
> The number of passing unit tests is identical before/after the commit:
> [   10.774120] ### dt-test ### end of unittest - 426 passed, 1 failed
> ---
>  drivers/of/base.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

Applied, thanks!

